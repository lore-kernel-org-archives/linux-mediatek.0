Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63A0606A8BA
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 06:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LNO90e0d;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=n/A17ZJS;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jkjD1B8V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=; b=LNO90e0d4Ddtwz
	0GM0rYIn9mdHEvgHnbtPDoWwmuvKu93tXHLY8odybOGivV2RuIiTPA8FYpWUzXIC7o2kkduRz8oaI
	Y3sP13YO12HXU8ORDYf9Rz8ywB4gIiMNxh+hbFfQ6wPYageB6Cw/Hhn6ENKFerMj6wlyCIX3wjhoo
	H7RGStg/mC8kHPc/e8YO/V57Eu2fu2FtJis14u84dzJJULmDE7+G/ZjhDgo0lOF9YO0QWqQeqGdo1
	gFhXarAM1Mi0pZZy07/7z/azVFyE78wTsl0Nmu4wGzUh2f/WbWNXu5Ycef1Ei37BiYI2tibAL7jTB
	QimtxlabkK/zWYXX0oaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEL-00000001FSo-1S4l;
	Mon, 16 Nov 2026 06:30:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEI-00000001FKr-3ovy
	for linux-mediatek@bombadil.infradead.org;
	Mon, 16 Nov 2026 06:30:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=; b=n/A17ZJS7/iACs42hA5Q+3VjMK
	IS/HCQMxX83drigBIURKzoAzDF/cgvxfam8Wtq220K0J4gSp3gl41BwcXmhaNf7FDyfZjk27TKC8h
	+tgP02JfAb9NCFvmz+8E0RJ3+GR9GO1mpmVe14snm67C8u8Ov07CVgZ3ULYPdCZyEJywFzo5D5QUm
	cHDKbYShNrza/qT5Es0rkbMqDcXxNb8fFr0RfqyXVEm3USA2V2HWAWPgXYhA3u+AfGzicBXRHZKGt
	Jlnf5iS1z9VhGDbTDTM/7oRaZsH0FI+jah8QFRlcyHL/oSI91dxRGBHBxKfTvbRvIKinINhWPnOlk
	EAy2rgrw==;
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqEB-0000000DPA6-36fR
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 06:30:12 +0000
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-71aea92f666so415711eaf.2
        for <linux-mediatek@lists.infradead.org>; Sun, 15 Nov 2026 22:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810605; x=1795415405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=jkjD1B8VUMr0c+FieDKvT01tRW4NHi337KMWy+y5F1pKHhzRCaSSHkujJrVUaaS0l9
         AfTVSVnOfPc+f6VEgAURxLgYhBg5ktHS53UhQdcgmGZoPtlRFYlYRn6RVI71FSujHdXN
         tf2/KbE4cvP1RBGsCAoNyiMOHpKOpApQisTXUz31vv7S+cURf8uABnABMIJImiypetsx
         AqbI/RbIgXVw/o5Ac3xLXE9ZTdLo4AkWFE68NMCtVVI3/N+pFVpbWRRjjn57I+qQdFm6
         2SgFVGZUsfqWXFDQslyo4jTaVNwABeGDohVHCyzlinxUsneSHP+n/P3JGh1nqfjgVusp
         gscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810605; x=1795415405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrtOIEPB5plIuB+N6495+WStqcrxnWFNx4kPBP0QSG4=;
        b=RTDzSBTBrLPNK7Pw0FX/w/Xmrp0pVXzdahaZvMtKl0TFPUCiQYkJeHnfBg/msEOJ2D
         9kseRA8Ap4uMji2wYvBjUbUqrcQ7KUuC1tgfiEdUH2D5zmlCaU9dlcFa0eb6ySy9fxFQ
         Ip573t+63mF0TUHIEokhglrv9MhG7WYRmwGw4nhpRESlGw4b9kzWS0QKhVCMCGUyBp99
         qHfOFynFghdLQcwDh5v6X1tI8dPNS+yqpf6nG/ukz2sDhImw4rbprYsi5LHLcISSKUfe
         PXnhiTX8OewAtNPHBDA0F/kuHWwxuQwFw1pdxRR99gI9d0XawOHJjgK0fjIMoF68JlnG
         NQHw==
X-Forwarded-Encrypted: i=1; AL+hErEDcCsdH5nCfwQTcxzYOGVwnp7l4XZaAbsiUP2BPpcLYRNhJE/rrSwXobDEjx6gMZ4NynikfL4LMIW6ttWKtg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/bhejpH+7gv5maz/KhmfEtAZ/Rd5WZydht7lTgkfrmEB8RHaW1
	8qodUr6wEs/XIuKxOcotVkgERw2ZSh+OnlcAGz6mKKYfh9jCsryQ+eGr
X-Gm-Gg: AYBFou0hJCJQqgj5uLzD0qCxlZJ2qPldASkSw4/yebkiLzYbuFtEKPREvTizUXcDSTR
	5Fe1a5qRUnbhYEQHoTqQu6x3bmeSSnxWrj9Ry4AcZZmP2wimFbVysBN2RCihIfK6R7UILItyC9b
	LMD3FHiy/quL+yQszSbhWawSkWDHecPoFfYYgIfCQoj9yGM7D6opFZy6TWy5nYKrIK9N5QeyNkt
	LjNtmPa+32g89DcEqomP7mthWZhd1Syrfl8ZJ2mrqMYpEm62bLTQOMDAds2dAfFIfxFRA6lBcll
	nzIpFaYITfkTLOVowsmxcw0Tw23lFcq4KNP5U40Qvz9jRwQJFB0ob4pGi8xc1dSjQSvs6YeH17H
	t7Tn+tPWJXuQdVyC03UuQkVfhvees92J7kHMDoPor2K7DNcByfriQy3rc/0wrcc/VtzNaGEXRQQ
	vrRTDbKfgbVxxx22abvCl9oIFEyp/kCKMKrBVNBjY4xIbB4R84OL+XSUWx1sLP5MGlO7sZt4YKW
	q19T/JvgYui9lKrMfwMljIcYPujy8YDQLpZ3Uod42Z5+5l/dRjUqftZ70GCp+/YCWYEhcMS1OJJ
	8Q+8GvrA1IP3ZQF8tC1/j4WGVfKhj9gtJkcV64nWK1ZJDQibxi3hf9eC8Fnjo6XjWRazIgtxT0N
	y9H0peBzi+Qq9qeaIoOHYM/TfuQ9n8L4jvPfUNx24zQCXvSHIMPgT3Pn0iAZ/Waimcc+RWPNZ9A
	eLTbBZPOj+gtqn5GwDI86q0o6JZM/bdtQHm7y2VL8wFq128bLfTXM=
X-Received: by 2002:a05:6820:55d7:20b0:70d:7aa9:8618 with SMTP id 006d021491bc7-71ab5055d01mr4500855eaf.63.1794810605100;
        Sun, 15 Nov 2026 22:30:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:31 -0700
Subject: [PATCH v5 16/58] mtd: rawnand: mtk: retain chips across controller
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-16-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
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
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_063007_839796_1E7C2060 
X-CRM114-Status: GOOD (  15.03  )
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


