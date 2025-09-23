Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54137CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 11:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=//V48kCEzWU1NDc3Q2XIEc4dOUGnpYwaE1G/j9Uskyw=; b=iqYn8tF+Ehq7NQPTqSW68+bHKX
	LaHWQl1Y1tiAnuc0kqtOMxVO2H5v0ffc5+QPu0GhzixEdwmEaDacQI8wFBJPagaBwFezIHbnwP/eg
	zhMCATWEX4GSOrNATc//ykcB6Lq6iQZIL+ot+OAnaPaSx2pg9YMveQG3plaO9VwKGhdc89N7d2bre
	ClSvM9UBhN2Yq3f0SF/rVC1vQ1U49DpKLz+0mDekVgmr8/4uAppIwgjyVjFjoBw5YE+4FXrwwlQGz
	MLbN/BVIdlCVPVzvYF4CXG7AJpGacM88gM+JXoBfEtEpEgWknkJcVuhmoTibjjWP/pqPjwy1hToH+
	+ZcN/8nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11Am-0000000DAkt-47R2;
	Tue, 23 Sep 2025 11:27:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11Aj-0000000DAhI-05vf
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 11:27:03 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-46e23a6617dso3017645e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Sep 2025 04:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758626819; x=1759231619; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=//V48kCEzWU1NDc3Q2XIEc4dOUGnpYwaE1G/j9Uskyw=;
        b=bF1Q7+WHuX7QnkSmuLi95Hezi+/vCrXZhUlak7Wp7Di3vt7q2LAJgoqX3xllcD24Fe
         qSegGlAwrS1+CKHXrn4KZillyuzp4R9R68OxN0/F1mZFdKbvF9qd4LyRwGAB862YpyOs
         JL2ktG8lDMEsTLXNCONjN7H0mjmaJ7QpZT45qANxvGcjrzmIycC6Say4UoRLTG+lvFL2
         MeiDczxwBmhOlP95g0RGgsnBROiPgxZ491gq9EvbEvCKccbd5RkuLwRjeUfiQx1pRtvM
         b8DZ5kF7HOC93KA/bIqSOJwvF3yhRtKsxCCxxosjRCX8bGk6F4AYwsLP/q0P/ARhwc2r
         u1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758626819; x=1759231619;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//V48kCEzWU1NDc3Q2XIEc4dOUGnpYwaE1G/j9Uskyw=;
        b=Cfc95xJPS3SIb88Q1ktWZDO8rxdCH9x5BMjX65ZMY5l2xzpCE1AsxCJi8fzATIFY5j
         T7rSCXqgt7xjA29RXNh/7HT/uJZKnqOYC7h2wcOsxRHFM3YQu5zfsPfj+gcoUOD5LAAr
         nr0lQdCHLkxcD543fXT/KUP7K9s3DWP8AYB60YEx4pUbXT9Y+4owZ41hcQIuxvMRXbFV
         4q8IrMU+lfpmaATD3E/OpAAwB0IDlK97g6ddjZB2a9OVc/IPmIprxJcVB4SWhzkeJyKk
         /Ext4arBTU8URCzQhrODjleewIudpiDSiKTlKeJvse+F4XpnK2CWUD/ZPMubwCNdUcOq
         UTxg==
X-Gm-Message-State: AOJu0Yyi6dERzRIJ9CSRi1OO2Tzcd3GyUf9FgTRXDg/QNypVTTylRIZ3
	2nzlyiBZ1ZQVAI01S3QEKN5CSd2hrC/VqmXeL1Cm4fBjSqMsFjGhF8PBt04IKW/ma2o=
X-Gm-Gg: ASbGncv6gO2obylxFdKTB+vfowMfcXTCbvdtZavxhsWsEl2oVVIsH7MQx6z0eSMcDp7
	2RKRHAIX3PmT14iZIJYLvhDRudL/mZWMqAl5qB7W6iCS+W253jL8nW6znNOI/a6ln6Zg8b8zQxe
	Hzz31BO++R28VSFWJwojubXRjyQ28t2O9LFiXrfn0dWsqtn5G8LztqbVS7bJvgcNvViCqjHPZBW
	eMIDZ+J818XCxJPUk47T13BTU0nBsQ8LJlcDTsBW1GgwmV6VI3XthujX+u+EhLdH8tk/U2LVvZT
	WN2vCy0e1s+U0b+Nys9OcMpZQSyT2euSmRr9tVBpdek/lRhmPCA3dgHckwvepngaA+llZSmuR9s
	o772gc5nVr2ORuDhWle2qkRq+vUOg
X-Google-Smtp-Source: AGHT+IEXlsCYCeqdPHjMH1ZKUyv7trtGeIZXGgKXeYJ72TPjB/mTgHp6Q6KJgV9hYPpQSyIPpk/b8A==
X-Received: by 2002:a05:600c:45d4:b0:46e:1b89:77f1 with SMTP id 5b1f17b1804b1-46e1d98004emr26308745e9.9.1758626819209;
        Tue, 23 Sep 2025 04:26:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee07408433sm23352625f8f.20.2025.09.23.04.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:26:58 -0700 (PDT)
Date: Tue, 23 Sep 2025 14:26:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] wifi: mt76: mt7996: improve hardware restart reliability
Message-ID: <aNKD_5EjKS9f45Kt@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_042701_258947_4324B61A 
X-CRM114-Status: UNSURE (   4.62  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Felix Fietkau,

Commit ace5d3b6b49e ("wifi: mt76: mt7996: improve hardware restart
reliability") from Sep 15, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/net/wireless/mediatek/mt76/mt7996/mac.c:2458 mt7996_mac_full_reset()
	warn: assigning signed to unsigned

drivers/net/wireless/mediatek/mt76/mt7996/mac.c
    2448         while (!list_empty(&list)) {
    2449                 struct mt7996_wed_rro_session_id *e;
    2450 
    2451                 e = list_first_entry(&list, struct mt7996_wed_rro_session_id,
    2452                                      list);
    2453                 list_del_init(&e->list);
    2454                 kfree(e);
    2455         }
    2456 
    2457         i = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7996_WTBL_STA);

i could be -1

--> 2458         dev->mt76.global_wcid.idx = i;
                                       ^^^^^^^^
saving -1 to a u16

    2459         dev->recovery.hw_full_reset = false;
    2460 
    2461         mutex_unlock(&dev->mt76.mutex);
    2462 
    2463         ieee80211_restart_hw(mt76_hw(dev));
    2464 }

regards,
dan carpenter

