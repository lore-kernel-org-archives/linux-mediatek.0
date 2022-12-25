Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A8CC4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Dec 2022 10:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SwvUk8nCc2kiHmnECJ1iMld3VFTwbnQ/Nb7HP3LTcH0=; b=WbpTxlUH3TjhLf3Dgy6RBCFGrp
	/OOPQ8AqJC9B4nnOnHllnkZ7cPnfVbqhm/DYicftZTTQeG+ajPPLSTqFw5clYM1P75m3su2zBWY3b
	FhaCZpxQhPIRs4DxSA8DWiAZ/wz10yoNEgLE6MyeQGYEnGq77ZyrsfCwhl6KaWR+CGlmNu351fk79
	Vo8ulXSbDdZf3PWBBv04v3Jt4gy/B/OHndCC7NXBmbS0+UoSSVF7EE092aJy+zS4rlJIf2crdMiYP
	kTHo6IaLqznNrpYWKRDFLmqJZu0BQuNh5chvE85o51FakB+GafKZJ9kPwFn5uF8A0jAHpihpXw/7E
	XF79F7gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9O2R-009u9R-2N; Sun, 25 Dec 2022 10:15:27 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9MVV-00934Z-Pu
	for linux-mediatek@lists.infradead.org; Sun, 25 Dec 2022 08:37:29 +0000
Received: by mail-ej1-x636.google.com with SMTP id fc4so20827854ejc.12
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Dec 2022 00:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SwvUk8nCc2kiHmnECJ1iMld3VFTwbnQ/Nb7HP3LTcH0=;
        b=NkivvfbR9LwyzM3qir50hBLkzuM5o1CupKhC9o9epUuPyHJlZxQpbm//x0yfHXZO1W
         ZHrk2ojmM3lFFarsZgtwZDAtktz2mPZFWGnaYswffE61Cir7JXL7zrX+S0++hA/WXvnZ
         NKuBjZ0oHDs1rJKQ6HwKWj2E/VZ1KdIJwyiq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwvUk8nCc2kiHmnECJ1iMld3VFTwbnQ/Nb7HP3LTcH0=;
        b=qqurk9TO0vzOhFN71zMzxiUsfzptYDWQ5e+RzGek1MN7X7dTRd0i4IGwpS18aihTbG
         YePd8uSeUREo4k/yurjOj20BLd8OykQbxvEBG63x9wRXMmtkBX+837NbSQm9SegZhPn5
         /kREaEKmjTHn1RSoy5tiuZEyBcqTPYlw9JLXs7jhIpCwIuYVDZDvtP7ZNCc4JSkxuN/z
         og0INoH+5D4/fpGVd8tdDpDvdHkCV2HKo/qzWnkMHsdCvFRgeuoZB+Nv7pssWTA6gEdB
         oyhTlyClvePYOOu+/g9zH5Rsj2PBB+TjPF45iJqoDKcdjWY8tovYBZ8D23OpMGYMkgpO
         GJ1Q==
X-Gm-Message-State: AFqh2kroIWg+mNcM9xFfyPGdeHcl139dlSCopvNn3vIS8Dard055vkxC
	tX0LhMkG6Fr4LcqxDmWhiiPg5XWpwJqgxbD0
X-Google-Smtp-Source: AMrXdXtctEnrY7BRtuyWPRfRNReCXauW0JyxwX55iNIt3gYShGUR3OrYY1oNkh8NZTlL3hiGNxWilQ==
X-Received: by 2002:a17:907:3888:b0:83f:757e:f182 with SMTP id sq8-20020a170907388800b0083f757ef182mr12114821ejc.65.1671957438627;
        Sun, 25 Dec 2022 00:37:18 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906200100b007ae1e528390sm3378820ejo.163.2022.12.25.00.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 00:37:18 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 25 Dec 2022 09:37:12 +0100
Subject: [PATCH] spi: mediatek: Enable irq before the spi registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221225-mtk-spi-fixes-v1-0-bb6c14c232f8@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>,
 linux-arm-kernel@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=2362; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=S9r6wjmERP8avI49s18Jhy8ipRj4r0kR4VhZqUULP4Y=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjqAu5PnnA9Qc3bEgfnFKq/SZnVuwBousGA4xtFKDt
 WjkgicOJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY6gLuQAKCRDRN9E+zzrEiLy/D/
 9U86jlFiSKdjPyYa5uHCJN9qD94eSk9psQFmvWnfmiPLfrQssy1tzhSlNyfqQSLZYIt3MqYaQIlb23
 doEsdMl3TUww8eiAR2xkEWlKmU7v99oSDeagkN4Lu8xGe65Sqq/48QFEgJX32CXUbpGXQjYfgK7Ki0
 lcPjp/qjB+TU7FfwQ15+Xi1+W4Uh43/LGA/y6ZuLF7cn5hnZQdEp8QdgHIuDMOTgadPAZhJfW67rx6
 nMDq3gfCrobTYpc0eb9cu04B04MOOqFAyLDyzIhMxiocd002uWttTeV7+tMVl4PnKHeKO3R8CqjzFO
 6HURnumDGJ6HE7FZBacH6hav347sLuvO6KZhqyJJfOM4z+wZScSEu3/E0xcpoScqBkrKDlVM6p345M
 h2b4YZ34T++fpmeCqg6mAXh+q0PItKBT13pLL3l+9fM/U6ZhYdtHhSqgKLF+Al1M1PKGDe+ymQ6MoA
 MqICUc68JAkf6FZtUnmj/WXVMqAKLC0Pv0HYHxBURjz2vqHTYBj8MQXQ5BoRBPXtveGCB9y9TYAy2U
 YnTnIaWc5nr/HNC+EDJnx7+q2uave3m7QpVXtodJdxPUJIXcWQAYijS6pR7Nzt1NUQceSR65Iwdf9C
 C+s8AvOuqoDkdNLn4QFmSIRs8kd8isb5jY1YvrgBdKKw8tvUiGFkOwR+Vbsg==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_003721_982962_90D47A2C 
X-CRM114-Status: GOOD (  12.67  )
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

If the irq is enabled after the spi si registered, there can be a race
with the initialization of the devices on the spi bus.

Eg:
mtk-spi 1100a000.spi: spi-mem transfer timeout
spi-nor: probe of spi0.0 failed with error -110
Unable to handle kernel NULL pointer dereference at virtual address
0000000000000010
...
Call trace:
 mtk_spi_can_dma+0x0/0x2c

Fixes: c6f7874687f7 ("spi: mediatek: Enable irq when pdata is ready")
Reported-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
spi: mediatek: Fix init order (again)

Hi Mark

Here is a fixup of the previous patch. Daniel, can you confirm that it
works on your hardware? 

Thanks and sorry for annoyance. 

To: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-spi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Daniel Golle <daniel@makrotopia.org>
---
 drivers/spi/spi-mt65xx.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 6de8360e5c2a..9eab6c20dbc5 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1253,6 +1253,11 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		dev_notice(dev, "SPI dma_set_mask(%d) failed, ret:%d\n",
 			   addr_bits, ret);
 
+	ret = devm_request_irq(dev, irq, mtk_spi_interrupt,
+			       IRQF_TRIGGER_NONE, dev_name(dev), master);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register irq\n");
+
 	pm_runtime_enable(dev);
 
 	ret = devm_spi_register_master(dev, master);
@@ -1261,13 +1266,6 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "failed to register master\n");
 	}
 
-	ret = devm_request_irq(dev, irq, mtk_spi_interrupt,
-			       IRQF_TRIGGER_NONE, dev_name(dev), master);
-	if (ret) {
-		pm_runtime_disable(dev);
-		return dev_err_probe(dev, ret, "failed to register irq\n");
-	}
-
 	return 0;
 }
 

---
base-commit: 45b3cd900bf8d1a3cd7cf48361df8c09ae5b4009
change-id: 20221225-mtk-spi-fixes-99c863a6fdf1

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

