Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B61060719BF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 07:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LZvJedXj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gb1EAiKn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mgx/iC6r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7EjuFvuceFQZNlD93lvfh5f/bqVD1JwGHOenVl+sfx0=; b=LZvJedXjgk97uV
	8pak0KZfaP416PsU3LYGGB6DeMDItHYzEho8YXnK+w38xu70kdrnZSpRpJR8wM8Fp/lxNWbJ5m3DD
	UdJExe9Nu1tpstoQraxq6SLh/z+r5W1EWYGgx6x0xB3ulN7HohIlYaor7r+pcThWMMVI2TjNs1JuT
	cC5ZkQb5Up5eamVsrE+AirAAvInhOFvbTpGO3NCnUjXkF6usdrhUAokXPqjIDm5KcvLyxBiB9WFM0
	MT/QosNbE65HSTY6iQy9Pu8sLmuskiitnigwwDv6HEyerGetmXMeqsvwK0W0UjroNI/QK1rET3gY7
	EHZGW/ltir3NEF3RY24w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXT-00000002x8n-3mQB;
	Tue, 10 Nov 2026 07:45:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgXJ-00000002wjN-3CH7
	for linux-mediatek@bombadil.infradead.org;
	Tue, 10 Nov 2026 07:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7EjuFvuceFQZNlD93lvfh5f/bqVD1JwGHOenVl+sfx0=; b=gb1EAiKnf1qVfjanlaNwaoYg7x
	HCK0LTcOWBPpWkW/J2XxyQ3Tt4GZxCfkjhlld6aOzkL7JkJryh477SNUQykeEas5lcyaCaMBgTHSg
	iUoX+8VylaHQ+OMFiqErl8SzqvfLKUuB3BwPmkkakOvCtjHOtbCVz2NLYqT8kLb4IdYi8AGoGr02t
	R/BjhF+Xv+PoStXwTbIPzNLHBf4uxidj4vp9/EI5vivycWUdCF2w0UqkGJKsTKszZn66873ekckig
	3zYIYCc2V3QJU7Ac1MIyMG91vIMdrBX39MJ0MEVqDmMP5WpwLb17p0xO00WR2Mz8KUcrWFIr5JGus
	j5sOKVZA==;
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgX2-00000007dyx-40y2
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:54 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-84621d8c7aaso733274a34.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 23:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296679; x=1794901479; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EjuFvuceFQZNlD93lvfh5f/bqVD1JwGHOenVl+sfx0=;
        b=Mgx/iC6r6SHxT/0mxjOSGDS57RZ8N6Nl2F8ALS+Jo4k43Ph4nISKKkXsJGUtomcmAl
         xUL8SX+vhRZ6ZejjmdR/LQ01tI6VpINczd++7kD9GsuWzI+VQDTwppWmoVBbrBiLCuDH
         Z/3eZx0lzcYsOEXZiRZ2mnV3hA/ZBsPY6RGnFybNFy9l7/L8Bjy0INge9ktfUtakWFeo
         Hi2+a8dW0lCCM9IX7Oi94AG1gGiYdp50YHaHK2FRXlf3qBfp/CpnFmyeodYfaST6W/V/
         cVSe0lOhBVS7+O13OmDpddy//L5Pz3d3Inm9K03tX+jnAh/XV1Xx7qHBg/0Fgn2bQRC7
         TShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296679; x=1794901479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EjuFvuceFQZNlD93lvfh5f/bqVD1JwGHOenVl+sfx0=;
        b=o5wqNbfta/bi4mzpd9erGiw/i66YtC6kn6GsCyCM0Z3e37604BDifzl/aAAQSen6FF
         6c5Gs1kp7raNAGLlofYMWkC+FQrAMc+zeWnxyLhmaOX7FHBvW2EK2EUT3WMJnmHfkmqQ
         0AZHRgHhmhPY2POIqft88Dg/BB2s90F7voYQLveK2Kkoj2BPQ9V3it7qbwoJ97vjnjo+
         4s29frDlBu2oqDM8pbRUG83b29RR8OVn6NQdmB7Ffft1GsrUXce/KsnkGJ+76gZ1sv9G
         12QGIHkvNCE9WY2YTjt2gAPjW66I2RS7o2yrDaz3+oZ3Nad/WQTSB7sF/yDb/cITdyWz
         3/Kw==
X-Forwarded-Encrypted: i=1; AL+hErFf4cxsU91aJwpBwz6ZqRo72FsEbjql4fTrDr0fw0597Xm3JBrueMZPqQsPGB25YPah5TnLMrm3EcywMzrLpA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/n4JjbcjAEwiadIbu1NVtHQMHWmIRoM/Vm4flMf/a1ciNHCiBV
	Td5pCwhNRmYN6v3dEIOtueCDC0DBU9YhwcmMCy1uD9BkD5N9JS3ApA9J
X-Gm-Gg: AYBFou2nx+Ft+rzl+KLyoFoGNM17vH1siesdi692UG767550uKOinNNqiKTx7jr/NA3
	4VrLdVmMfZjHsHezrcM9BUrwdoK2fQ0h/WO+OwbmQRrOiVIPVmd+mhoGOOdpZfN8EFUultYTtkX
	Vst0PFo5R/A8ecUQd3F94QIjTXJkMwj91FssljTzOy4mg1rgUvd+UsU8YMqnpyldfx0S7eO+TIw
	vIfE0nv08z2UTvWHMMTtcEmnvbvCBybJQI4sMRhViUTmXKUkuEr2GCDNzNe6qHxl99snLo5FhMW
	8Pn33IdB9akdxiTxorF/8SFU2YhVnbIFI96sdo+TiSEGMTXb5pubdeqmqrrnHmiqbLCfdUVtRWD
	/ZrPuB7ApDQSM/UKImTVK2oHWo7uCKTz2OJiDsCOa/ytH028gha2jc2SUa1bCBThyNOMVnZTac3
	S47Yif+HsQfHuYkJCAE6hkMR3uPGbb2Ibsr8CCs/6hC9EMu/JpGb86pkKArASVGHntw8r8sLKf3
	pjuXFdtB1INnNAvjnP3chfjZ7HLeYy2TSSVdFtkQgazKlYROw1zkhrUTnyWvNiUG+6NcfcXQ9s5
	5eho7jwFwvRwMlqL5A/94/Camy0L7fDjiERcs+DHM9X6l+F+FLE18vgbZqXFkXeMHk3mEXFeTKf
	cFDQWEItPsVWpx9eEeK2wTaXu/aJxgmcNMm+AZCseqKlPIOlfHXjBQyKHtw5kcABLk6llVpBMlB
	6J2eX4fh8I8ic5PlXletUrV/jh7e5GBqGlnxD8bWSDwMR1mGADarFYDfwdwkeEEBdFDAtVe1lS
X-Received: by 2002:a05:6808:c1f4:b0:54e:31cd:dcd2 with SMTP id 5614622812f47-5683cd3d902mr1873142b6e.44.1794296678725;
        Mon, 09 Nov 2026 23:44:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:19 -0700
Subject: [PATCH v2 16/58] mtd: rawnand: mtk: retain chips across controller
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-16-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_074442_048929_0674F167 
X-CRM114-Status: GOOD (  16.32  )
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

Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mtk_nand.c | 44 +++++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 21c7e1102746..bdc3d1519631 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -1336,6 +1336,11 @@ static const struct nand_controller_ops mtk_nfc_controller_ops = {
 	.exec_op = mtk_nfc_exec_op,
 };
 
+static void mtk_nfc_nand_release(struct nand_chip *nand)
+{
+	kfree(container_of(nand, struct mtk_nfc_nand_chip, nand));
+}
+
 static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 				  struct device_node *np)
 {
@@ -1356,8 +1361,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 		return -EINVAL;
 	}
 
-	chip = devm_kzalloc(dev, struct_size(chip, sels, nsels),
-			    GFP_KERNEL);
+	chip = kzalloc(struct_size(chip, sels, nsels), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
@@ -1366,17 +1370,19 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
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
@@ -1415,18 +1421,28 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 
 	ret = nand_scan(nand, nsels);
 	if (ret)
-		return ret;
+		goto free_chip;
+	ret = nand_set_release(nand, mtk_nfc_nand_release);
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
@@ -1441,8 +1457,9 @@ static void mtk_nfc_nand_chips_cleanup(struct mtk_nfc *nfc)
 		chip = &mtk_chip->nand;
 		ret = mtd_device_unregister(nand_to_mtd(chip));
 		WARN_ON(ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
 		list_del(&mtk_chip->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -1504,6 +1521,11 @@ static const struct of_device_id mtk_nfc_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_nfc_id_table);
 
+static void mtk_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mtk_nfc, controller));
+}
+
 static int mtk_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1511,11 +1533,13 @@ static int mtk_nfc_probe(struct platform_device *pdev)
 	struct mtk_nfc *nfc;
 	int ret, irq;
 
-	nfc = devm_kzalloc(dev, sizeof(*nfc), GFP_KERNEL);
+	nfc = kzalloc_obj(*nfc);
 	if (!nfc)
 		return -ENOMEM;
 
-	nand_controller_init(&nfc->controller);
+	ret = devm_nand_controller_init(dev, &nfc->controller, mtk_nfc_release);
+	if (ret)
+		return ret;
 	INIT_LIST_HEAD(&nfc->chips);
 	nfc->controller.ops = &mtk_nfc_controller_ops;
 

-- 
2.53.0


