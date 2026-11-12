Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1872A606C181
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 01:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tZmlG43F;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRqGzDsu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=; b=tZmlG43FCPRg6L
	27yec3BlKDMixTSKtdweKU8XNxY+tqvf00mdalEcuFqNaLDmmhYCPRxHmmXKAJnch3WSTXCABXbEJ
	pXZsiuywt6tZVp8rvmBVcbuKhXUONTSdM2PqdGoKoNG6cOCinWDRTD6ASh3iOvfqRZuwo4fbH5Pvu
	/bxtL9eFaQ1xqpN5Y1RJ/gatC61Waji/bQ99hcirP3/bq1QFoB+ya4MmhmljD0YFZ1I8ABrbIwqyT
	HAJXwnhR5T9jjBUkJbGbD9Ran4jcR7LdHbRI01GKyzEe66kfzKRpb1DIW57eMYCmnZn5k4vJTQda7
	B7E3LJoMEOSG9Oy4dNFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcY-00000008LrF-3S91;
	Thu, 12 Nov 2026 01:28:58 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcN-00000008LSG-30Gp
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:53 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-47b47de8b4cso2386117fac.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2026 17:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446926; x=1795051726; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=XRqGzDsuDDmeCbaLgtrVQrgMEF72GupNDz/4zek4jepH/dJiWeW09cygeX7Jbuv3dy
         gnwHt/TwdUjMmMF3CyYr8+OqGd3odIlphRDyO6wZCRExk048ist1yj0r/NzMdQOl4s3V
         YqZ9jmJtF3izMh7X2rDcKSG8xRBJ5dKaDecrFyA5YWF3LBUNSdgyiMCn2peXOfpmfw8n
         mJwwzgtcJZ42+X7qHJnGl/iiLQ3eEjeX3BZajO/uV+PD+3XTPIzSpnJdVBMFYwrFsAtC
         YHqRc8aR4yksPTy2XkpY5uBl4c4oge0IPRK71DA7wakvxGZZfPY8rXiPLFQsGbB2+Whu
         SoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446926; x=1795051726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=Yx9PG5QZuC+3jVIBJsQJ73IBDN1XM7E94ld/1b3i0c/TDVkWPOK8ixjVr0jKCT6Cay
         ta27/vHU/s7JW5G6CbT7Xeno9YC+C2jDE6NybBFi0OkRumyIOMCbvqAf25Ptw93U0VAO
         y3zINJr+CPyWtgdCKxfF0Bu0V3VxuKOqkLR9QjeDcEbagE9Wng3UF9wxlVqSufunnqRn
         uKyfURaKPOF7bgw4PwWjHZ10yOUsTItADnFo+a0Hfgz6+ixbnUCOPkH+2yKKQ96bJ9/R
         IIKUOmsKoaxG6a9CnRrVv2o29b3EZ08fHzLqTof0VuVLituRYjsVoF96A34BHG2tn7yJ
         o4pA==
X-Forwarded-Encrypted: i=1; AL+hErFhRKAf7Nd7vWcZwCdbsW8lKMibmnpMUm7uruK+j4lXlCpDEUIxQM/TGk3plqSL0YLUa0GLGnwyu97Q+VObkg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8tkq4p6uzfkm/AoK9fvVWEDld7Z32Bw0439NeLC+CFLAe7c3LH
	w+VOruZrqXaY1vbcRTBk3bTXTmFLtXhmV/g9Td5U1VZ/ehFufhcj9UM1va0hvrxn
X-Gm-Gg: AYBFou3fL2ZxmeD1hbBECQYcCZXsJN/5drRgzIvM3ghw6zQNryAigb68SzpNIcxLIVv
	1yeW/9CTQcYsYwlFyanneSO3shFXl0vBsVvaT51W7XGa0QyBZ5t4G7GLU75BkdyPlZ6pwjROMAf
	/K8kLMkHtPk+vnw8z+qHT/Mys3eezTL+5GsOvp0WbwZLhAgklhtkAkyxsUrmRW5V6YfUzkiwwQw
	N6hgsWqXFI08ur/f+QNpyHYhjRRX9IjioX8+kvn/5GLulBRQdkGqRjzgOl2zWrQN1FSiS3etiYg
	NR6jKwuKjJ8dCyXSipnvvD4cPNqrlyzL6pBXw4JtvfAfFbMKHhlZ+K9ikvKadREBcns56R0U9+m
	UXJGOjoXN+mGo6Ct2PoynLzTbiBfMdTY5PcVlV4M2c8wno6ln0whFlHxUfMJtidRD6A6UijorBk
	8VNteQnuWborhTlaIpl4qLa+8lTlFj4KhM4zjtfPe1psdXP4+dAupCJKBeHk+O6Y/Xv3yWitX7Q
	qT/SJsr+qXA3DOa2fWqpJNlC/EMFkVLmh4paFBXxH6dB6AZj2SOEl2kGYu2O+id/pckcIq4Lesq
	W4nXrkdYg+XKGofWSD5aZhFEH0SoktnSOx4cD1/nxCWpKUW0n8k7WRWF0YZw2vfW3bF/ALsa8+Z
	PLe3smutn8+qMYfwBtKcGbdMlialoJjxSCUuUimkGTO4zWnMjuRq+lBzDQdfDvuiyjMhis91nO+
	C1DqF0Ep2T5ndze5s8NgNIiV0jiHhlXdI6AOmaorwQBljGlQWzTHuz
X-Received: by 2002:a05:6808:13c1:b0:52b:7641:33a6 with SMTP id 5614622812f47-56b95164a88mr4069642b6e.14.1794446926299;
        Wed, 11 Nov 2026 17:28:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:55 -0700
Subject: [PATCH v3 16/58] mtd: rawnand: mtk: retain chips across controller
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-16-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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
X-CRM114-CacheID: sfid-20261111_172849_162178_638F8A87 
X-CRM114-Status: GOOD (  14.24  )
X-Spam-Score: -1.9 (-)
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


