package com.dwightd.repository;

import com.dwightd.model.StuinfoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Dwight on 2017/1/10.
 */
public interface StuinfoRepository extends JpaRepository<StuinfoEntity, Integer> {
}
