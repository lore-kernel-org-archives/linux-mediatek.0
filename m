Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E18606A33E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 03:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2J2ahCey;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=DIo4LprT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tfYyvg/YEjVnt/i5+VxsYpj+ND/9pcDCTdnckyR2aBA=; b=2J2ahCeyKepr4x
	zbLrnL9/fDpqh4MUcVM0hNIBiBUaWvPoZ9YJByTsEScIEdhfvc/lCLNRbcJgHirukQ51RQgkzkmBD
	0+K1tRl6F7tNddk9sEk5TFG25fD7bMQ5VCAvNalr29tl0E64HORYykjk3edzOdre8i0HLcZsyY8LH
	TMmmqCDeO7j7pNY2QXCaGHJ4VGjWTEdBm0fZjdOd5BA/fl2aYlh10YIo01ijHtTlna3FW0mVhNwBq
	RJOTzYmJ0yWKUnl2lOSZHbxARz8aomUlzUksBBIc8JewSLqwKK8lwSuFMX/iyH8McKeEQrwOQcNX1
	Gi45n7e3ZLreOSs5Q+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWE0-00000007cNt-3wL5;
	Wed, 18 Nov 2026 03:20:44 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWDx-00000007cMb-2pRZ
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 03:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=DIo4LprTiGWtO/Cc3WGI6bjrXD0YZrUqSIlDbNbKdC9o3g5Zj00dBkuXdRnhzxjHdmJ+VLF0d2auR
	 rTLrCwj1g0fu+NSSpD5yP9AKqHhveAQmze7fW6Fs7XmXhfwsnZVn6FFxj1sj6lIvQMygwhWIIHwfn0
	 1qRnVGMf6ZFTsgg8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afd1987d64-af146;
	Wed, 18 Nov 2026 11:20:40 +0800 (CST)
X-RM-TRANSID: 2ee46afd1987d64-af146
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96afd19869ab-c74a8;
	Wed, 18 Nov 2026 11:20:39 +0800 (CST)
X-RM-TRANSID: 2ee96afd19869ab-c74a8
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: sashiko-bot@kernel.org
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	peter.wang@mediatek.com,
	chaotian.jing@mediatek.com,
	chu.stanley@gmail.com,
	alim.akhtar@samsung.com,
	bvanassche@acm.org,
	stanley.chu@mediatek.com,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs-mediatek: use devm_regulator_get() for the va09 regulator
Date: Wed, 18 Nov 2026 11:20:38 +0800
Message-ID: <20261118032038.492-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <sashiko-outbox-219916@kernel.org>
References: <sashiko-outbox-219916@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_192042_275135_5560929D 
X-CRM114-Status: UNSURE (   6.80  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for the review of:

  [PATCH] scsi: ufs-mediatek: use devm_regulator_get() for the va09
  regulator
  https://lore.kernel.org/r/20261118014234.424-1-laixiangwu@cmss.chinamobile.com

Both findings are confirmed after checking against the source:

- [Medium] unbalanced va09 enable count on devm regulator release:
  correct, and it is a regression of v1 -- my mistake.  ufs_mtk_init()
  powers the M-PHY on (which enables va09), the variant operations
  have no .exit callback, and ufshcd_pltfrm_remove() only resumes the
  device, so the regulator is still enabled when devm releases it and
  _regulator_put() hits WARN_ON(regulator->enable_count).

- [High] state mismatch on regulator failure in
  ufs_mtk_mphy_power_on(): also correct, and as you noted this one is
  pre-existing (cf137b3ea49a).  When regulator_disable() fails in the
  power-off path, phy_power_off() has already run, but
  host->mphy_powered_on stays set, so the next power-on bails out
  through the !(on ^ host->mphy_powered_on) check without powering
  the M-PHY back on.

Fixes for both have been sent as a new thread:

  [PATCH v2 0/2] scsi: ufs-mediatek: fix va09 regulator lifecycle

  1/2 keeps devm_regulator_get() and adds an .exit callback which
  powers the M-PHY off (same pattern as ufs-exynos and ufs-qcom), so
  the enable count is balanced before the devm release;

  2/2 updates host->mphy_powered_on in the power-off path regardless
  of the va09 disable result, so the next power-on retries the whole
  sequence instead of returning early.

Best regards,
Xiangwu Lai



