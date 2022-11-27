Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0E2C4321E
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Nov 2022 20:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wfKh2Mf4Ino4G2YyHVeE+Z2MaLhC61+o3vx+CNzKjDQ=; b=qYF39TpZ4e+sjUhdr9m+QmqAKa
	zReADtVSKb3y1nLNHIdx1w4lES2tjprdHWJyr9q6v8Gbx06afMdNaNOZX0D2K8bnKQLBZwtBdduHY
	oCfZC5gwy9lkKRIx+L/yyCFgHL6Uz8H1ruHtdLwb6Ml79ppgWrUWBeFEtPhZU9aG7KWRhZmZSKi0f
	NwAYEefRBIp5enGDWaDz1b/FMtacJB7rmDTU10GhZpwx0Br/FsbQ3XAbWjnboofaITme9FqXmdPlM
	xjnlEkFaB4Xz02cMQ4uvjz5URc87d/l4x64pdzGRQcw/MChpWFh5yd+SRYamXmUQ7pgq2Xg/tOzmH
	Fqo0roVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozOBD-00DUEF-I1; Sun, 27 Nov 2022 20:23:11 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozOBA-00DUCl-QI
	for linux-mediatek@lists.infradead.org; Sun, 27 Nov 2022 20:23:10 +0000
Received: by mail-ej1-x635.google.com with SMTP id n20so21434316ejh.0
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Nov 2022 12:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wfKh2Mf4Ino4G2YyHVeE+Z2MaLhC61+o3vx+CNzKjDQ=;
        b=nNMnxcyEBZ591wHcQIif8hhyoGN8Ob34xVLn1BE7WR/+2cbc1LZpS/SHbTz2X1vkxp
         5TXTWVZYYMy6Mn/yhpIJBIbnBvjJyg7H8OinLO/t8kq5LAJ18JpsZ4VhDE0EzuG3fI+G
         A46ml9lDujs9yT5n8V2K5anZa0hdC+SUNeSGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfKh2Mf4Ino4G2YyHVeE+Z2MaLhC61+o3vx+CNzKjDQ=;
        b=JpWQ/h1J1jxHS4pY1ckCMitVLz1PZe6rOuStdhmzRU/cHEcx6UroUjpUWwxkZde3L+
         a06qzh+kQ9OEXBmaogFGm+xQtQGz+tkxGvnLVz5beKppZeNAji9z4JxCEzCnFWayCPo0
         UJ92zK6MUsfHYWqH6GM82svu8w/HtUmC/qvG4QuGfjHsbBEwNQ08JkhcunjG2/ZriLVC
         jR+9o/x/twkQ9F5tsr8a/SzzeIpP4g1Xgc8q4jfoDEzE8Hiqh4/MYhRg+TpN1008sV4Z
         1rr+TmURn6tep6O1BjhRyeyuj7DCd/3XcrSM5n0YSknweSs/Uu+6mHQOq2DSBAgFaaex
         E7hw==
X-Gm-Message-State: ANoB5pnlIg+FHgnNBTNtzAUVDHQcUqMy13VelLgbo9IF8r9Y2DbvuOaZ
	d5TVMlJSLnKdqS2kQzf6hSnYtg==
X-Google-Smtp-Source: AA0mqf5EgKvaGkUib8pzpuxBc1l9tI/0ro+ReGhiwOZ4uP5I8N+3wk7FIxnWqr3Zya96j80tQ00foQ==
X-Received: by 2002:a17:906:c24d:b0:7ac:2e16:a8d2 with SMTP id bl13-20020a170906c24d00b007ac2e16a8d2mr30381713ejb.584.1669580585321;
        Sun, 27 Nov 2022 12:23:05 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id j9-20020a1709066dc900b007ba46867e6asm4165278ejt.16.2022.11.27.12.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 12:23:05 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 27 Nov 2022 21:22:58 +0100
Subject: [PATCH] soc: mediatek: mtk-svs: Enable the IRQ later
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-mtk-svs-v1-0-7a5819595838@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=7DOft4Iv0/mgcfhfj8YN+wfHXirhGcx/iCjJqeykALw=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjg8cmyxwr2EJslRfWjI+SaTXHPsCiomTbm17eqkny
 rPpbu+GJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4PHJgAKCRDRN9E+zzrEiBIQD/
 0V8fIaN+zDO0ZjtYZlWHksrz5RjFtlpLQYHbOAEUGOaPDDE1kEUWYYYsvzJJsHSVRMiIA4I7bdgHGo
 YtXSmR9fn5XuqC73IuPa3gm1uWGmF02sQYO0ZrPRPb7YHDG+leTTTLzYUUXnKQQIGglcZanv2uGs0y
 1px7ILJpPxc7RRcNv+7XIYN3Nmp3lGJBXitLAOKhMcBfvR+ptmwet9xpmttA5gVN5xsY408PbcBuBZ
 6V44phnpyzrtRf6S0iL5X53CMXKmduK26sRW5qclTy4y0K1WoiwrzJU5oO93YHbQ654CtYGQg19Kis
 EEbv1hyY6b6ACJxBiwop0cMnz8dgXLWk6TPS5qCpURuEyybiTCmCd+n4L4V1UoLxQvdR366P/19l4V
 KjcrthaDGNSypfS3lJcNF9toyBXt0ActqvSoP8GX6GAXHRTx26lQRByM1HYVRZKwOthfCOB5y7DiGX
 7B9idyq68BaTdbr9ofGnD9SbBl/5uGsWEK/iTlVr7gp8jbzXwpcNSZ3RU4O5aK7JX0YR3H4sZd79DU
 D7qukNlw7gecCGG/1ht3GkLp63FMKvpkRv99cFI3xV2JmWMukNAsAQVarbq+VY6Efz56lN9LAq9xo3
 2gvyegi305LoO+zHWrHrKNbBIyk9V6IHsDnWldhIA74056o7FwM+uY403n/Q==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_122308_902338_BBA982CA 
X-CRM114-Status: GOOD (  11.98  )
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

If the system does not come from reset (like when is booted via
kexec()), the peripheral might triger an IRQ before the data structures
are initialised.

Fixes:

[    0.227710] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000f08
[    0.227913] Call trace:
[    0.227918]  svs_isr+0x8c/0x538

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/soc/mediatek/mtk-svs.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 0469c9dfeb04..0451603a8cb0 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2385,14 +2385,6 @@ static int svs_probe(struct platform_device *pdev)
 		goto svs_probe_free_resource;
 	}
 
-	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
-					IRQF_ONESHOT, svsp->name, svsp);
-	if (ret) {
-		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
-			svsp_irq, ret);
-		goto svs_probe_free_resource;
-	}
-
 	svsp->main_clk = devm_clk_get(svsp->dev, "main");
 	if (IS_ERR(svsp->main_clk)) {
 		dev_err(svsp->dev, "failed to get clock: %ld\n",
@@ -2426,6 +2418,14 @@ static int svs_probe(struct platform_device *pdev)
 		goto svs_probe_iounmap;
 	}
 
+	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
+					IRQF_ONESHOT, svsp->name, svsp);
+	if (ret) {
+		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
+			svsp_irq, ret);
+		goto svs_probe_iounmap;
+	}
+
 	return 0;
 
 svs_probe_iounmap:

---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221127-mtk-svs-add137fbf187

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

