Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6666C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 16:03:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6439B610FC
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 16:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6439B610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p4Y7DyBqBIhMOSQEtbhJTaHwnBPUzG/NZWAJ9lfJeQQ=; b=A0xO3bzjLA3F1AwrzF5qgCPQa
	V9UfrUo/hmxWLkq2Gnk87GZk8p/xjo7157MpH9l+6V2jtvtOQpxUlHz1GwdKBEBSZI+VIRyOMey5O
	oZqtFLgfxBYumsn5K8cXmQBNlrNmsCorFmI2qZ+XxxDc6aYiWIaCSEK0pjeu8cQl8v4tDR5XCf4PR
	N4RViiUWTAUnA601JbmHhjDmeKMNtV98z3JQl4UcI9Z8YKOqWisitxt+YtmqjcoWkjNXy7thrqTuz
	rTl1mwjGj/jRzZ3BOOsdHt/VIvw5ZXIcXkrOr7n8kCz9KYjfVMpkoiEwdhlOCv1fP6ft/G2w2Sa1y
	cKmb7Tyqg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1legOT-004iV9-Hw; Thu, 06 May 2021 15:58:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leg4D-004beu-CJ
 for linux-mediatek@desiato.infradead.org; Thu, 06 May 2021 15:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=oW516jzYudrgPpoHV87MKKEstdKadYWrqHFNhZ2YbXA=; b=Z+6mSPdzFDwsWhJYtyFbcV/qzj
 THeZxPidfkG3xL3c78Fram+XwOhsWEh8tvGQoOkkr7U0JAa0jmqBsL7C/ajhZa73+Qw++YoqUpAYw
 jB+S6IxhRaOuAHlesdidXNc4Rf9q7rTdRWB2sHVbnLAD/kH3oC6vR/LpHH2TqSSJ6nBrlF3Iu9niJ
 qdJD+edx6XRbpvpzpe4yFKXwRrtETwwjveYa4+Sl5OTHKkHl7d6E0rN24Cr/K5fGAR/on4u1C6wK3
 ei1fWsZ1iQYHZF7Q062wLD8Zfuqrz/gSlmkbf/IheG9xwbr08E64dA9ZzOtvVsytGoOJALJVTThvn
 Ghtt4tQQ==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leg48-006AKf-OW
 for linux-mediatek@lists.infradead.org; Thu, 06 May 2021 15:37:32 +0000
Received: by mail-wr1-x42e.google.com with SMTP id h4so6089591wrt.12
 for <linux-mediatek@lists.infradead.org>; Thu, 06 May 2021 08:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oW516jzYudrgPpoHV87MKKEstdKadYWrqHFNhZ2YbXA=;
 b=IXg8o5wjRe5tnEMU6NOudBSTzNqehm2jpqFD2uSexwVdQ672TmU2uAGQncSu7UqNPg
 CrmtEvYFXjnGmexJXSdcPrvaMYM4qX+uDtCdp+LN273fLznYzyJauDUJs6JdXXOh/A1B
 D28RQVcG6mYoPM4bd1jPQY/9glaZLpZcZBBzjg3pmhTTpBtX9AnHox6ZmjmMf54Bj0Ii
 1UMpTJAw6qlB6BBe1QYcxAT0u6McMDdrxqadMq8o2OgnN47ITYFV31M0a1F8x7Ccr2y5
 52CjetHDs27ekPEpbpBuhXlxPLSzp3ER/awpJiJtAlhfBwWO1Hw5Z37t2HvpUc+jhN+i
 GaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oW516jzYudrgPpoHV87MKKEstdKadYWrqHFNhZ2YbXA=;
 b=bOPt55Y4K1LUr8tgAm7m8CWqu8DEPDdJ1VS25Ftsfrj+MSbzXMPw8y6U9ardLvkZ4y
 31E3aTXQyRnvq7TA80pttcm6WqRd9GjQqrRxrF6owCntfBMm1aYODwEXB8Nh7WeqfPyA
 i7f1vXETJlMJpfAMIvBr7kzZOEMkDFxT04vhDUroFGKSXQuIceYIoRogIbpyHijUIx0d
 /jfKbXABn2fy3cmh/Q259qGiE+Wrpsu6hGvHUsAodgkjFCzvKVRDRPP6R/3GK83SkS44
 w1PlwTSvpy9IG0fPgugLLscJKVKKuQVad9fTmhRqTVKW2CHkHFGMV8ZSvrZnvsDjOr5P
 4kPw==
X-Gm-Message-State: AOAM533c7VeXLYcxlKuxxLveP4pP2aNvUCh7YrvOBakR/GAI0Gy05qBJ
 HnOL7/DIWVrMUMKpr+N908gLBw==
X-Google-Smtp-Source: ABdhPJyd0JoHB9yNIkDQl4FPDKaa1IAPD7vl4654KnfHoAWsbt2C1ycq3EFe43odqrh+MHp1zRA6hw==
X-Received: by 2002:a5d:408f:: with SMTP id o15mr5845999wrp.89.1620315447483; 
 Thu, 06 May 2021 08:37:27 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5fe0:3a70:ad4a:a29b])
 by smtp.gmail.com with ESMTPSA id o13sm3788673wmh.34.2021.05.06.08.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 08:37:27 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] Input: mtk-pmic-keys - use get_irq_byname() instead of
 index
Date: Thu,  6 May 2021 17:37:16 +0200
Message-Id: <20210506153718.256903-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210506153718.256903-1-mkorpershoek@baylibre.com>
References: <20210506153718.256903-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_083728_814786_DD25DD71 
X-CRM114-Status: GOOD (  13.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some pmics of the mt6397 family (such as MT6358), have two IRQs per
physical key: one for press event, another for release event.

The mtk-pmic-keys driver assumes that each key only has one
IRQ. The key index and the RES_IRQ resource index have a 1/1 mapping.

This won't work for MT6358, as we have multiple resources (2) for one key.

To prepare mtk-pmic-keys to support MT6358, retrieve IRQs by name
instead of by index.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 62391d6c7da6..d1abf95d5701 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -241,6 +241,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	unsigned int keycount;
 	struct mt6397_chip *pmic_chip = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *node = pdev->dev.of_node, *child;
+	static const char *const irqnames[] = { "powerkey", "homekey" };
 	struct mtk_pmic_keys *keys;
 	const struct mtk_pmic_regs *mtk_pmic_regs;
 	struct input_dev *input_dev;
@@ -268,7 +269,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	input_dev->id.version = 0x0001;
 
 	keycount = of_get_available_child_count(node);
-	if (keycount > MTK_PMIC_MAX_KEY_COUNT) {
+	if (keycount > MTK_PMIC_MAX_KEY_COUNT ||
+	    keycount > ARRAY_SIZE(irqnames)) {
 		dev_err(keys->dev, "too many keys defined (%d)\n", keycount);
 		return -EINVAL;
 	}
@@ -276,7 +278,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	for_each_child_of_node(node, child) {
 		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
 
-		keys->keys[index].irq = platform_get_irq(pdev, index);
+		keys->keys[index].irq =
+			platform_get_irq_byname(pdev, irqnames[index]);
 		if (keys->keys[index].irq < 0) {
 			of_node_put(child);
 			return keys->keys[index].irq;
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
