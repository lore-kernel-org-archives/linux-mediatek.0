Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC8FC67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 12:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T2/iFdfhLLN50i/OwjhWSAcQD1lZsQmlhcH97S9zkyE=; b=0/+z/WCDEB3xlD2PjTesY7XF/o
	u2VT5ne7cB8HyhtF1Ft0nSfdT02DwlQDZMbf1dM2pu1gujsq397hChJMiRM9+8cUGsL2kdq3ELjaX
	OJVq4TVLNaHpjG2t/+hTo41Nz0h58I0lWZHW8J06RpWuhLpv1yp5bRPtxm3iLEORznSUZDi1k8Dw0
	29VlU2QNAoJRpPNzSus+amaRz5AuraQgX4ceVMApeZv+lgdYOS9QZ3LsV1lMfuf6Do4rZEMAz6znV
	un8kRvelPLmJWkrmMPFCqt0Iqot17au4Y5eMQvNG3g+naXjG4qGOAVEr/GTZW0hCKxGcDIx+p2bBQ
	dpZv2teQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtoWr-0000000FbAN-2421;
	Mon, 08 Apr 2024 12:55:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtoWn-0000000Fb7k-3JBY;
	Mon, 08 Apr 2024 12:55:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E40B5611D7;
	Mon,  8 Apr 2024 12:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A32C433C7;
	Mon,  8 Apr 2024 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712580911;
	bh=zNm3sqMhI/Yp0BpqNAy2dxpqoDl6p4U4ZJ8XBKnytdc=;
	h=From:To:Cc:Subject:Date:From;
	b=dIdioGhgVrUrrgN1KmD0C0EgFvzbQsE0bMepTP4Y2bLIZep3qyiiT/7ZuSOolbXij
	 ACQHnU4g9IMYARg3dWS9a3uaqMl9NtFm8tbimcHCidIr3Qln9oycglJLwS0M8qD1O0
	 yBI+ZIKXlujlh/BmW1ze4+eE8q/T7Mz4Agvx4cSMSWQNmcBYpEhJARZM2o5s3qZiK6
	 4yq7KqOdNJlq5FZuVXeTuMYzJB1nHEH6KfS72znGrJVjroLrqyqTqSOB6f7EbtX4XS
	 m2fBaUWYFUTkvBfbpxWGzi4LzXjf4BRVNa0JSLUDJdLVSyLFqchovB4MTy6wqfjhyV
	 Q2T09lJL8WjUQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	William-tw Lin <william-tw.lin@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: mtk-socinfo: select CONFIG_SOC_BUS
Date: Mon,  8 Apr 2024 14:55:00 +0200
Message-Id: <20240408125506.1594257-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_055513_912077_3DC8A401 
X-CRM114-Status: UNSURE (   9.33  )
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

From: Arnd Bergmann <arnd@arndb.de>

This is needed to avoid a link failure:

ERROR: modpost: "soc_device_register" [drivers/soc/mediatek/mtk-socinfo.ko] undefined!
ERROR: modpost: "soc_device_unregister" [drivers/soc/mediatek/mtk-socinfo.ko] undefined!

Fixes: 423a54da3c7e ("soc: mediatek: mtk-socinfo: Add driver for getting chip information")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index 50c664b65f4d..1b7afb19ccd6 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -72,6 +72,7 @@ config MTK_SOCINFO
 	tristate "MediaTek SoC Information"
 	default y
 	depends on NVMEM_MTK_EFUSE
+	select SOC_BUS
 	help
 	  The MediaTek SoC Information (mtk-socinfo) driver provides
 	  information about the SoC to the userspace including the
-- 
2.39.2


