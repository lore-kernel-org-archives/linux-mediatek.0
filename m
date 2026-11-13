Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFED760A2621
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YxpzrBMv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=F2kFrfR1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oMCawrgF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=; b=YxpzrBMved3dUp
	BEoJRCWUYjxn9CkznMBBpa5U2zAUz0iCHLp3A79Vk0PD0tgdzrwO8uqZQAkj3WCvQrvrYVj6fNl4d
	iDKP0GzukhiV75gw351sHNZI4TgmfYSqtgpy5Seugfo3KMdojQSp+z2qf/8fOQcLKKo2MnZvUA+HC
	rgTp4yv8mGQeZdrl6094IAGFubfXsarT4svv5uogjq4q+NUSIftwOFV5WEZ4QUD72b1/9k3Y1gMFN
	hMthQvTT5dj0M4p9rmYxEnLQObG4shHN+hha7q7QhNmOeK0AksftFm73nDvcqIVpg+QPRg4oFjWmi
	JYPafPLsEAFyXTak7gZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoV-0000000DrIo-1K5n;
	Fri, 13 Nov 2026 18:15:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoK-0000000DqwA-3wi0
	for linux-mediatek@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=; b=F2kFrfR14i57X3+BCDIcO9wihn
	XpViTjXPhO2bYgxU22fF/iD8vteli8/62M74MrcTZIWcQZLmd1lECqQo44OQ5v3qcdJAx/2WMr4Ui
	vPO1MEFC3Fb4WxKJX6/sKm04OAdcgf9k764SeNlMKdAEQIujOJ85gD/S0z1uahKlPglzd+HLXphnS
	l1B5ydERKbTY6GQwjfhj8VJ2KIk+lrKXV0cOK2h3hdimPeF+FJBC3O5cEh2jQTBmueveTCMrvZouR
	SUiBe+pAfnnJ+ErhzE0FQa2tIJ0nIA5BxZt2Q0RR8vh8G6JNhx/p+6RMpXQ5Z744pa3vvLY4oY+aO
	Pfh9AOyg==;
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoH-0000000Bdet-2Pc9
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:39 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-82380b0f55dso424233a34.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 10:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593735; x=1795198535; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=oMCawrgFDRyEna7pQS5AI7kFTcO2TbPRm+ANE2eTlD6M4odEntZpVtAmo/GSD+qs+C
         eknjZ6PhUn80LGnRev945DY4QHZN7099iUEex9mSJoeITad1IhoQTEc+peFkWcpXsHbo
         e7SVySpZKe/aHX4/qXniDOV3D4pXqE8OUTKO+WBbFkDLkNDKQbAmrQwXOqYfybu8tR74
         DSDmcmG/zg0ej4g99CtzLeywWTCbb766WkK0K5JPbkEM4ZPgc9515EolWp5V5S3T0yH0
         vPelG8JoqXFdK4BxIZ19jkV5+pdP0wyDwpEPUG2DrsUYyzQvbmoE4d/aFbcaCXvaYN4K
         gdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593735; x=1795198535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=2OB6hdaB5mzd5zfom2rNyeey7VrOf+HuKPigcJ1zorXvNu8zcXiDsbXbuPfVJr9UVp
         Mf5snBauu3OSfuCrqBys1zHejDXhNJuv1+GjxM0W6zVeoUDRsOFA8EbzdVgzY0n+dSfc
         U2FGtqlTQIcN3dnUdvMi8QBxoHJFrgo5HQNKIWxGgxtl53xiqa3heka0GjKSOGz/dqme
         36hc2ddNlQSeT/+kjxO7PPRhBE2RZum2lUxMUhYhj792RKMjR02bLlkM9yQXHoAsOGlF
         AKKEteu6HbFU3PTeEBSv/EW8ZjsWwuBfFwkD8iuJfCkclBykG3D32zdRb+2nTL5w/lGa
         yurg==
X-Forwarded-Encrypted: i=1; AL+hErHz4u4EUlP+KZuHBjy0sdEiPrgZVjqaFhd53rAzxIlc7BaxHlwAZ7d/EqtFhjeQWX9SbR3oy/nDYy6VqhkFaQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9fi11htax3Tj5DaGR3l8JlbUVmUEGCLblwySHy699R8nQEyTmO
	FCXfnODc6zlt3WwuuYRvV5nXDOuTgS+b06rgG+33XzSwR1MZGWVd3SHXItzz74fs
X-Gm-Gg: AYBFou21v7kYojhwTiwHATw1n8pde8omCcVomWqxy59n+UMeRrH04sSENGKs7vKi2en
	SWf2vTZq7PIasylE2+xGDWkYyY5StbxcjCD13vw/fIcG+jxeCuUxdtAh5SNG9TxT6LDwtvEB8bi
	oCIQAepGIvlkveTkGLGnmu7NcPldyaG7VRfR5LBExUAn0sFz4op2qjAWSQbNJc+6lruvsJ97xF2
	qKcRc1RM8bV/7K0BRiUj+E9p2Z4Fofqf7Mj/fd9GDx3RDG9rnkt13xCaDusGXPlDTHmuVt2txU2
	vAiBG6grHUhnc1H81+4kpdCg3I6Ya8Ay1bu25/Z3Yim1s3tJw5ePPphmmrqN2U31jBAMy87pP5h
	2Sqep+vjctSpvD3VVcEexcthtgS/sQTgNkX5m8wiucq5lZbW7noxXNrrsWWqp6TliP0Mv4+ymvV
	BY4pPGMdIpH5QhipNMNM6BuicMyEl+wjw2LqLSlNZTHdUvHym4kGlNY/58serF1ese6WXg+vi1R
	OZb7G45/2BEwv1eMCQoj9JEITvtj6yKmm2R2/zsIPek5yOmrrIF5YCj+Um3IsQNghIL94Qr69ua
	2nSMiM6kXhVLZ0OD0jfvAYYodgUWt21BeFHm3qyonY/+v3lh62OUZpJ6jEGPtf1NCT9qSddx3Bx
	T7d+8oVfq/86BX/9l1ewj5F1gLA9N3t9qkWOqFrxmOryMssuWT5BdWZbUC+9p8z7cs2IkJSS5WF
	hNKELhJZX1MqPz6zAgHm+oFv77ImyYifJKyQ8F4mVyMWkWkTpaOws=
X-Received: by 2002:a05:6830:7192:b0:814:8259:781e with SMTP id 46e09a7af769-8628979ea24mr2976379a34.1.1794593735257;
        Fri, 13 Nov 2026 10:15:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:32 -0700
Subject: [PATCH v4 16/58] mtd: rawnand: mtk: retain chips across controller
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-16-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_181537_473456_22CD8586 
X-CRM114-Status: GOOD (  14.93  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Give scanned chips their own storage lifetime and retain the shared
controller until all chip references have been dropped. Unregister and
disconnect each chip before releasing the ECC provider and clocks.
Unlink chips before the final put and unwind unpublished allocations
directly.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index a36a82d10aa7..010f614a2da3 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1356,8 +1356,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels),
-			    GFP_KERNEL);
+	chip = kzalloc(struct_size(chip, sels, nsels), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -1366,17 +1365,19 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		ret = of_property_read_u32_index(np, "reg", i, &tmp);
 		if (ret) {
 			dev_err(dev, "reg property failure : %d\n", ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (tmp >= MTK_NAND_MAX_NSELS) {
 			dev_err(dev, "invalid CS: %u\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(tmp, &nfc->assigned_cs)) {
 			dev_err(dev, "CS %u already assigned\n", tmp);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		chip->sels[i] = tmp;
@@ -1406,7 +1407,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 	nand->ecc.read_oob = mtk_nfc_read_oob_std;
 
 	mtd = nand_to_mtd(nand);
-	mtd->owner = THIS_MODULE;
+
 	mtd->parent_dev = dev;
 	mtd->name = MTK_NAME;
 	mtd_set_ooblayout(mtd, &mtk_nfc_ooblayout_ops);
@@ -1415,18 +1416,28 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_lifetime(nand, chip);
+	if (ret) {
+		nand_cleanup(nand);
+		goto free_chip;
+	}
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "mtd parse partition error\n");
-		nand_cleanup(nand);
+		nand_disconnect(nand);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
 	list_add_tail(&chip->node, &nfc->chips);
 
 	return 0;
+
+free_chip:
+	kfree(chip);
+	return ret;
 }
 
 static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
@@ -1441,8 +1452,9 @@ static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
 		chip = &mtk_chip->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&mtk_chip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1511,11 +1523,13 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	struct mtk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, nfc);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &mtk_nfc_controller_ops;
 

-- 
2.53.0


