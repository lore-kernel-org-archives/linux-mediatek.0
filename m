Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C076CF2576
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Oct 2024 11:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a78jCwD07IIr0zzbJdTp9e6+G/hl6TYZEf6UvVEfM8c=; b=jo0i90Q1ZKpDKVyYsGLZa01W5X
	BckHoiKuX78wmuofsMkFHU8a8s0iVkUf7O8KRW+f9em0S/YSMoSm2HVbX6XN+21sS5haMr2opMts7
	gsBH9jAR7yPm9Wt9UAXSUsV0H0xiPMgXAR01IhoztIuMBYxAi4w5ThyFEpnz9K0NlYSJ7wa/mPFNb
	eIWPMZSAdKfJS2m56GcPYe15RxIQz7uV8RycqCSK2Vf7doJ6VjfpIUie/pqErAWd75MBjQmReLvOC
	YjCCftvwtJPdwJSd78Pa1cQQgFqsZsokv28UEUXmlSm7ypcncxcN4fzu7EGWEgtuciRkSkrIP5Sz3
	/d+L7Mtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szwdT-00000002aNv-17qT;
	Sun, 13 Oct 2024 11:19:43 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szwdQ-00000002aNF-2rI4
	for linux-mediatek@lists.infradead.org;
	Sun, 13 Oct 2024 11:19:42 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5c948c41edeso2589359a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Oct 2024 04:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1728818377; x=1729423177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a78jCwD07IIr0zzbJdTp9e6+G/hl6TYZEf6UvVEfM8c=;
        b=Rr9NKETI6CvxtKmT2sXd0eRBwKjf5keqNdxVnmprnYm32sSs9kWdwXktHX8fbTGxJa
         X9KcbBB+3tAMaOfDg+9i6bceuf3jzCp27lWzoAbjC647N4j1QLtFX8IU3SQ1/qZs76Wk
         CBfiNX7n2ICHqbUw2d3oc27YqCS4jyPm63DaKUl37QJdbqYL8kDK8VrhfdQCagaXujj6
         xV41BdauEHsUxWVIMkOxDVa7cTf6MhyX27SWomcdVS14g7raW5nqOU1SxY5PcXOhpxCL
         lnVbnBu5wd17k92xCP3mRjkvrwtyngWKG7DA/UVyuZOFcJ86fcyxUHrUuYIQ2jTQ0k20
         Eb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728818377; x=1729423177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a78jCwD07IIr0zzbJdTp9e6+G/hl6TYZEf6UvVEfM8c=;
        b=qjik172EFirGyvrDECilO/C0lsJyKc1yVpL8FeoTmHT9upRUvoWA2vB8AUxbz4FTco
         pmtmHfwoXzjVvPWV5ppv739Ed1Y6u5OTXLYPJxm9MJrqPWjC/aTZfvir/d4ahIDu7Iqs
         xzevSoCygqf5br9UoqaCLYSrXdWmQm4cWaD8z4tZbGcR/GDJtpgePeCwtcOKFYGjTJgq
         l5I9m/rx0fTGNsyfOm4vymcLXrXEtn5QAUamJWE11mkOh28UNAG9KLc4IIB+4AcM5jwW
         fmRxPMxfCGnOQ0q2/IkWQ0LNq+rYdN/U7ajLIv+v4Ph+2p1uws6ptW63noKJqI2uHeS8
         cd2g==
X-Forwarded-Encrypted: i=1; AJvYcCXvjS3dhJTM6ciJVjErqLro+b0KoKtuMZG5mW/7vQwAfAWJPHbQQGdc2+5T9Oc/m0/zSPyH1LTjdfP4oaomlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzH7GqqVTA5fqlVsxSp8DTx/hw9nDMIh2oHiHmK/xaStCKimFeM
	kSwmgvtjQj/BHv4NtxxVRdEweyaOXXT8bod+IPcGZOSy8usOJSuV
X-Google-Smtp-Source: AGHT+IHJ6a9mQsJnncdL0rnghqhEUMCPwK/kDBKoEWEsI2SsB6487fRFXbL4XVwWNHCkWXHsgVrblA==
X-Received: by 2002:a17:907:961e:b0:a9a:835:b4eb with SMTP id a640c23a62f3a-a9a0835b5c3mr117395766b.38.1728818376857;
        Sun, 13 Oct 2024 04:19:36 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad8f-1500-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad8f:1500::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a99ea321959sm189788666b.194.2024.10.13.04.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 04:19:36 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: wifi: mt76: mt7921 Survey is missing noise floor
Date: Sun, 13 Oct 2024 13:19:20 +0200
Message-ID: <20241013111920.679188-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_041940_760394_4E78356C 
X-CRM114-Status: UNSURE (   9.83  )
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

Hello,

I'm using an MT7921 PCIe card in AP mode on the 5GHz band.
It works well when I manually set a channel in hostapd.conf.

Setting channel=0 or channel=acs_survey (both have the same meaning)
should make hostapd check for a suitable channel and pick that
automatically.
Unfortunately this does not work as hostapd reports the following (for
all frequencies/channels):
    ACS: Survey for freq 5180 is missing noise floor
    ACS: Survey for freq 5180 is missing noise floor
    ACS: Survey for freq 5180 is missing noise floor
    ACS: Survey for freq 5180 is missing noise floor
    ACS: Survey for freq 5180 is missing noise floor
    ACS: Channel 36 has insufficient survey data

I suspect that this is due to mt792x_phy_update_channel() (from
drivers/net/wireless/mediatek/mt76/mt792x_mac.c) which calls
mt792x_phy_get_nf(). The latter just returns zero - so it seems
reading the noise floor from the hardware/firmware is not
supported yet.

What is needed to implement this? I can test patches or - if
someone describes which registers to program - I can also write
a patch and submit it upstream.


Thank you and best regards,
Martin

