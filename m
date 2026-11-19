Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A087F606A32A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 07:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3BjsJgk3;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jHMJz77h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ley7Oxra1LH46R1LcXoHmPiYUD4v2OIpHqOBZ/O6LaU=; b=3BjsJgk3VNf5434r4odAWusVw1
	I0789jYMGBrZD5pVBBamUKFi6d4l7WTBI6ElR5WA3HIZdUN4zhrTg0n3LNNFbi7Y2YMeM3OlK0fdQ
	D5645Tl2mMhza28FMKWR7xnL3YJ5O+h+sbIe5MWoNoO0zWbTdbkBedYOUe0B8XOi5qzVJAm58t4j0
	W0fZh6+3FzBjL2kQh2axfSjwg5ep+0npry/ydEWkV2pgIISCMo4KT1c9nlm6tz3be62ZwYpeb2T/W
	6pL8VvZzHPgCmuAVoooBd9g3Ps9WFAVAz13hfUOCpnsx2HrLdtSKr3wmy2qq47Y+6QRVChDKn6OrW
	SnvJFlnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwNh-0000000B39s-1Wl5;
	Thu, 19 Nov 2026 07:16:29 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwNc-0000000B388-2X6G
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 07:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jHMJz77hoiRfpPvwH2bEL7sE92qSSvbHxGCNuaplT6xRYCMeXTgU+Q5f+gfRdSn11WnQcwcp1ofpF
	 inDX6aMtE1O+jVPRN1ZSjCE+OMtlWibKi7h7r6f1SAdmcZRIkBx3HivNWut4IJz9FnxSlH8YqeSf89
	 qLps3RoaXCKvcUJk=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afea23cb5a-bb075;
	Thu, 19 Nov 2026 15:16:13 +0800 (CST)
X-RM-TRANSID: 2ee46afea23cb5a-bb075
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56afea23a32d-f43a3;
	Thu, 19 Nov 2026 15:16:12 +0800 (CST)
X-RM-TRANSID: 2ee56afea23a32d-f43a3
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: peter.wang@mediatek.com,
	chaotian.jing@mediatek.com
Cc: chu.stanley@gmail.com,
	alim.akhtar@samsung.com,
	bvanassche@acm.org,
	stanley.chu@mediatek.com,
	sashiko-bot@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v3 0/2] scsi: ufs-mediatek: fix va09 regulator lifecycle
Date: Thu, 19 Nov 2026 15:16:08 +0800
Message-ID: <20261119071611.117-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_231625_677871_DF452266 
X-CRM114-Status: UNSURE (   7.69  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two fixes for the va09 regulator handling of the Mediatek UFS variant
driver.

Patch 1 converts the va09 acquisition to devm_regulator_get() and adds
an .exit callback that powers the M-PHY off, so the enable count is
balanced when devm releases the regulator.

Patch 2 fixes the state desynchronization of the power-off error path:
when regulator_disable() fails, the M-PHY is left physically off while
mphy_powered_on stays set, and the next power-on never retries.

Both issues were found by manual code inspection of the va09 error
paths; neither has been observed on real hardware, and no MTK UFS
hardware was available for testing.  The affected paths only trigger
when a va09 regulator operation fails, which does not happen on a
working system.

Changes in v3:
- patch 2: restore the M-PHY power state when regulator_disable()
  fails (phy_power_on() plus the va09 SMC call) instead of forcing
  mphy_powered_on to false, as suggested by Peter Wang.  This also
  keeps the va09 enable count balanced and leaves the suspend error
  recovery running with the M-PHY powered, resolving both findings of
  the Sashiko AI review of v2.
- patch 1: no functional change, the Reviewed-by tag received for v2
  is kept.

Link: https://lore.kernel.org/r/20261118032015.974-1-laixiangwu@cmss.chinamobile.com/

Xiangwu Lai (2):
  scsi: ufs-mediatek: use devm_regulator_get() for the va09 regulator
  scsi: ufs-mediatek: restore the M-PHY power state when va09 disable
    fails

 drivers/ufs/host/ufs-mediatek.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

-- 
2.50.1.windows.1




