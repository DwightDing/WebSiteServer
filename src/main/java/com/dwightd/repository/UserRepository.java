package com.dwightd.repository;

import com.dwightd.model.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface UserRepository extends JpaRepository<UserEntity, Integer> {
    @Modifying
    @Transactional
    @Query("update UserEntity us set us.nickname=:qNickname, us.firstName=:qFirstName, us.lastName=:qLastName, us.password=:qPassword where us.id=:qId")
    void updateUser(@Param("qNickname") String var1, @Param("qFirstName") String var2, @Param("qLastName") String var3, @Param("qPassword") String var4, @Param("qId") Integer var5);
  }
