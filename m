Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1291C001DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a19dhCtt+dQExqd+4c+na0u4opb8buG8YuI2xo5q58Y=; b=0UW1UfG5MiFU6f1AgpXv5rBfRy
	qCmGRqRrxCyVhYx9wj3XkQRIuFVtPMVWbV8iNHfn7fEdb63pZG4/SnVqQNXDAAiug3b0ZldGjlmSs
	Wt7PBeGl2/noAgtSW9bhMmmqo/QiHQ7OUIHW6x0cVf83SW30zKTiTpUpHPDnr5d/h2SKM3U6tzC1O
	QYTrSLQPB11LL+2hSweyG/mOa/jnZeAWEDo+uP4wPyTmpVTU6jiCPqxb7GO2uQwXYfwItp6Vx751r
	SEzjZqYK9ytSC8wGoydUHIAR6NiBvDZK7/QHQ5gMKYk60Hdm3dMLYdmBmi8WYKHrxjM8Q9OqmzHKL
	Zw22OojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMshy-00EXJW-2S;
	Fri, 21 Jul 2023 16:10:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMshw-00EXIX-02;
	Fri, 21 Jul 2023 16:10:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 25F2361D34;
	Fri, 21 Jul 2023 16:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4F6C433C7;
	Fri, 21 Jul 2023 16:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689955818;
	bh=vD2UdR3jMEEOkodAiRKY3xxWGdTLV7U/m5MX9FM43T8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RUdqQo9XCO5IbpkCXY6k9LT9n0Tqx1QvTi17Vzyu7+1rL0Yft5Y2peUWRlRLy4pez
	 xo2Py2Mla/t/sfevCUTaCyjwF0QGIc5CdGzrk7QGD5bMA9JerRi9J5PWzbggTzXiPt
	 ntf64P08PcVJu0x+svlVLQX+qfpEMsf8PKIWwibM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Randy Dunlap <rdunlap@infradead.org>,
	Stanley Chu <stanley.chu@mediatek.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	kernel test robot <lkp@intel.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.4 040/292] scsi: ufs: ufs-mediatek: Add dependency for RESET_CONTROLLER
Date: Fri, 21 Jul 2023 18:02:29 +0200
Message-ID: <20230721160530.526290612@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721160528.800311148@linuxfoundation.org>
References: <20230721160528.800311148@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_091020_104563_8F47483E 
X-CRM114-Status: GOOD (  11.22  )
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

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 89f7ef7f2b23b2a7b8ce346c23161916eae5b15c ]

When RESET_CONTROLLER is not set, kconfig complains about missing
dependencies for RESET_TI_SYSCON, so add the missing dependency just as is
done above for SCSI_UFS_QCOM.

Silences this kconfig warning:

WARNING: unmet direct dependencies detected for RESET_TI_SYSCON
  Depends on [n]: RESET_CONTROLLER [=n] && HAS_IOMEM [=y]
  Selected by [m]:
  - SCSI_UFS_MEDIATEK [=m] && SCSI_UFSHCD [=y] && SCSI_UFSHCD_PLATFORM [=y] && ARCH_MEDIATEK [=y]

Fixes: de48898d0cb6 ("scsi: ufs-mediatek: Create reset control device_link")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Link: lore.kernel.org/r/202306020859.1wHg9AaT-lkp@intel.com
Link: https://lore.kernel.org/r/20230701052348.28046-1-rdunlap@infradead.org
Cc: Stanley Chu <stanley.chu@mediatek.com>
Cc: Peter Wang <peter.wang@mediatek.com>
Cc: Paul Gazzillo <paul@pgazz.com>
Cc: Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc: linux-scsi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/host/Kconfig b/drivers/ufs/host/Kconfig
index 8793e34335806..f11e98c9e6652 100644
--- a/drivers/ufs/host/Kconfig
+++ b/drivers/ufs/host/Kconfig
@@ -72,6 +72,7 @@ config SCSI_UFS_QCOM
 config SCSI_UFS_MEDIATEK
 	tristate "Mediatek specific hooks to UFS controller platform driver"
 	depends on SCSI_UFSHCD_PLATFORM && ARCH_MEDIATEK
+	depends on RESET_CONTROLLER
 	select PHY_MTK_UFS
 	select RESET_TI_SYSCON
 	help
-- 
2.39.2




