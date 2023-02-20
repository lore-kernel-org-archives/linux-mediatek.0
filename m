Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65857C636D6
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 08:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GFBa48sXBDbj4YHZ7A6RoYE/J3Q/GJfTSzCGCVG6MtQ=; b=VFVavQjivOlyQqdtSpC+Isl8Lg
	53CggNXI2jWkMcf6HjhV0/xt5W3eI1MWbY/MUK962pcWaseL9yWq6h/S2mmLc84jct6IPnP3HRR7t
	Wv4KxSjQwX0H2YDve8TU/wTHvM13IDTfcNekvET8zcNmz2JfpqQmph+wy/nkJ5FQSpMbUNUsKsPqb
	WFQri63kBvmgYNQoBOMAS4ak0VsWposcUI6TVJwORjgi1HPMZ8+zLWpB1tI4QY2/iyfwAYSk5sRlt
	/WfqpstXnRR51uWYCDR80ZsLOqYWVZ7AvtcHW9sRox3DAe6tVtSCiPTtzuji4y24Pn+CLatZ4X8Oa
	DvqBuY3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1bv-003KqK-48; Mon, 20 Feb 2023 08:33:23 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1bh-003Klx-5K; Mon, 20 Feb 2023 08:33:12 +0000
Received: by mail-pg1-x529.google.com with SMTP id c32so327289pgc.7;
        Mon, 20 Feb 2023 00:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GFBa48sXBDbj4YHZ7A6RoYE/J3Q/GJfTSzCGCVG6MtQ=;
        b=QiUcrPfxgKD+5q3ALl/lOuFVzOJcTZC7K5IiCerpvNeEzTHhkLJAtsAGxZCridaoiP
         Dn/f6Op75kYzxMoalBkyelvmuv/sTWPaU51Xba0mSsvQUrAqrKUrxa6bnLJNww7NpGem
         CN15v5dj73LqG4corFZfNaceGSS6OaCbYeW6evESbNYeTvl2gBoKCZa/BNOHztrU+Crd
         hQY8DPpRTbR45YbM9C1fe/CYfeY+2FAcfH3QKIAXFgIu+Hg4MVtzE5u0n6+zxI9rGY4e
         RcGa6WiYqv40CFwC1hKFe1/9Zt77flZ4WEB/dFouUbtkqhEjz6CM66JqrZkmO9jypV9F
         Zqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFBa48sXBDbj4YHZ7A6RoYE/J3Q/GJfTSzCGCVG6MtQ=;
        b=74vShYNCr9hMxLzWDvCBOF4GjxYu742Kw09Me3cWllLk4T/56gUwRZz07dFg9YYIl/
         M9ZMSDYEWaeMfsXdeE+Jwpd/Cyg71c5CPlREI5cpYfOlWGv4oQGf6Oe/ecAk+6zDn6Uc
         gxPA38LQhq0qqcfgo19p7n+Afmv+Cf34qHKIO4n6Kjp1RXhb/U3NgNxIoIScBmJbDqAs
         /gov4IilpfZz0xk0xRu/gYclCfHSmxo1XY76M5kva74Bfq+scxy/lWRGYd0X/rDRHmrn
         tNVXWgCPhMwmQhZXnbleaPN4jOvTidMKzrJXTDh4P2MBDDq1XPLUPDCZ5ZPwS2Im/7QX
         kWUg==
X-Gm-Message-State: AO0yUKVD7FkXMRkwm3wrQxEy4phrzxXl1hxKPgxCNmBvFCqBfWIvvaoW
	KFr1/93FKTOAVRGsXWyTpMA=
X-Google-Smtp-Source: AK7set+YToDYV4Izb/jZxviAHuXroIAJkOz1iTk+abnTni9uRvIEInNq+T7ft/+SmK/2O+fZijj6YQ==
X-Received: by 2002:a05:6a00:1ca7:b0:5a8:bff4:c058 with SMTP id y39-20020a056a001ca700b005a8bff4c058mr620815pfw.3.1676881985615;
        Mon, 20 Feb 2023 00:33:05 -0800 (PST)
Received: from localhost.localdomain ([2407:cdc0:a660:5592:a29:e1e:7240:e225])
        by smtp.gmail.com with ESMTPSA id c2-20020aa78802000000b005a817973a81sm7118369pfo.43.2023.02.20.00.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 00:33:05 -0800 (PST)
From: Stephen Zhang <starzhangzsd@gmail.com>
X-Google-Original-From: Stephen Zhang <zhangshida@kylinos.cn>
To: jejb@linux.ibm.com,
	artin.petersen@oracle.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	beanhuo@micron.com,
	bvanassche@acm.org,
	avri.altman@wdc.com,
	yoshihiro.shimoda.uh@renesas.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	zhangshida@kylinos.cn,
	starzhangzsd@gmail.com,
	k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH] scsi: ufs: Add select to CONFIG_PM in Kconfig
Date: Mon, 20 Feb 2023 16:32:56 +0800
Message-Id: <20230220083256.997470-1-zhangshida@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_003309_330067_DFB2D944 
X-CRM114-Status: UNSURE (   9.65  )
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

From: Shida Zhang <zhangshida@kylinos.cn>

From: Shida Zhang <zhangshida@kylinos.cn>

In a configuration with CONFIG_SCSI_UFS_MEDIATEK set to 'm' and
CONFIG_PM set to 'n', errors occur at compile time:

====
../drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_runtime_suspend’:
../drivers/ufs/host/ufs-mediatek.c:1621:8: error: implicit declaration of function ‘ufshcd_runtime_suspend’; did you mean ‘ufs_mtk_runtime_suspend’? [-Werror=implicit-function-declaration]
../drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_runtime_resume’:
../drivers/ufs/host/ufs-mediatek.c:1636:9: error: implicit declaration of function ‘ufshcd_runtime_resume’; did you mean ‘ufs_mtk_runtime_resume’? [-Werror=implicit-function-declaration]
====

This patch fixes these by selecting CONFIG_PM from CONFIG_SCSI_UFS_MEDIATEK.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
---
 drivers/ufs/host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/host/Kconfig b/drivers/ufs/host/Kconfig
index 4cc2dbd79ed0..f9786f085b54 100644
--- a/drivers/ufs/host/Kconfig
+++ b/drivers/ufs/host/Kconfig
@@ -71,6 +71,7 @@ config SCSI_UFS_QCOM
 config SCSI_UFS_MEDIATEK
 	tristate "Mediatek specific hooks to UFS controller platform driver"
 	depends on SCSI_UFSHCD_PLATFORM && ARCH_MEDIATEK
+	select PM
 	select PHY_MTK_UFS
 	select RESET_TI_SYSCON
 	help
-- 
2.27.0


