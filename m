Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60468C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 14:58:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D97B76100C
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 14:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D97B76100C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=65DXscvRvvYJRAK/tiyC/XoOJ3wymn+rZU+jf2xgRS0=; b=GJs7JAFVNepCHGAuDcZpn45zg
	TzlWcrZMBWhpvSzvkSpYIPzvruNIq2Q7uUUM703NEZrytqjOQ0/3UgSngiYIqjjXspfN8EcWk/PKi
	6mtP2X2Ngtb9P0E4aSDl2ewMMsIW69AxZyjtIlzcO4zzzCc0qldZo6+jqmRW86U625zq8Et6K5ynS
	6p0ki0VV5rNvDRMP5u+DNglJVX2drzPLpN/lVeoQc3beBx8R50rZKLK2u9aOPg7mosgndEVlomJl6
	BVXyZghcBYO+NH4pSEQm3+R3Q0hViLu6dGmQ8rcU2wiw29aYgN0Kf99Vdkx6jAv8iyswlQUDNwk0T
	k2VSmvQeg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj1Aa-0017aM-Oi; Tue, 18 May 2021 14:58:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj1A1-0017RQ-Al
 for linux-mediatek@desiato.infradead.org; Tue, 18 May 2021 14:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vurGL64Q3SxR/3rC1VvdPqxLLlL5m2GaEVxxxuUXcnk=; b=vLuEkzwgL+exNalIuEzs/t6mKx
 NlZQMGHgH0e2I0gyeI3U+CKgzcnbkpy1XJoE+y5HAev4TOFrL+JS9teRhq7QfvKDYUM0nyXwLTXCh
 2EbMYH6HFMREnvqReIxdAfJtvAUMuuUhMTIrmZhGXkK6Y64ho6fN1aEW/rC2EMlLUjVp+ELLAcMB7
 hRx+t2Ic1QN+ZcCuATAcmtBVlN0Uc97U5dYnJ1LNaApSBgAnVmya+Ecp05y5MAmfo66PM5MkXxhkz
 /Qw58D/PN3cR1zScnpJwpc433DEOcL8gCUfvb6V/uqcnz31tcN57NKi6p0j6n2tolHpsmEl/z2TLP
 5bQM6Kvg==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj19y-00EkSz-EJ
 for linux-mediatek@lists.infradead.org; Tue, 18 May 2021 14:57:27 +0000
Received: by mail-wr1-x435.google.com with SMTP id c14so8788495wrx.3
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 07:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vurGL64Q3SxR/3rC1VvdPqxLLlL5m2GaEVxxxuUXcnk=;
 b=ADC6wtP2Uy28k6oVzgFz3m7h+EKlhA/HZv6l3f85y9KwFUpxLWRtNp4Z2S1XCyYiNn
 /MtYGElEOf3XT15Zb16RvoCYb26HsPmfLLWh0ioZPt1KUHckECCiqmzk3uCRt6XRpNOL
 x+ijhif8boPjZQkpGhW85RTvrPjyd/NgsEB2C7CrCLiLdBmiQS2iGl6oaUFyjgUcZ5hF
 0dK4ktiJL6shb6c//mDf6Q6i3UyXvqP8cuBzioqFIcRxw80SzzbWKFpnS8QAmkNhhSGl
 P/qYAbILrnu6yKoQWTDtAS1WXwp7/uoalDTBj6Y3wDaSnygUAZIcHQfr5/+eEbFnZejv
 BVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vurGL64Q3SxR/3rC1VvdPqxLLlL5m2GaEVxxxuUXcnk=;
 b=Rt8Xy7KBYoyf3i513CeU2BapkOo+b9FeioG1Q7SV4Je5aWZrU6MBfsgESFwOaLit0d
 09ExHYWNTNcIvrkTslGLdmnnKQU0MM4k0cdyL3phyJfYgUa+WrIXlwdF2xeeO0Pf4glv
 /mQppEpS3HwHvQFJQJVNAhOjdftxO55QgdSaRoDAWVeA1q4qFANZ94AGtUY0Hv6E2SeI
 88ZXlEPOAeLsoOQ8FuLsXqtj/PaUJBK3ggkWGOQV2IXmv27c/TArEFJRCyBOx0yJ1ckV
 bPHeVRAUUWsK+RvHoAQkp6xJ2H8Rrypk7oGB3GFb2otELYHtqPndNCs4tZMoXW6N73hC
 DlNQ==
X-Gm-Message-State: AOAM532cA5y9ihONO7tLMuN3vKlNv5XLFhnS1nl5+3fXKjpgWXKzKPnm
 7KuPeQiF/b0ztHEWQPa0R6K/+g==
X-Google-Smtp-Source: ABdhPJzudJFc0nj4LYsR4FvoPi7DZDUoXDJbEP/PWcHdFQceggrOdrlOub2/IYm5mnnfPtyt8yv/Ig==
X-Received: by 2002:a5d:5249:: with SMTP id k9mr3866068wrc.301.1621349843897; 
 Tue, 18 May 2021 07:57:23 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id a18sm2928386wmb.13.2021.05.18.07.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 07:57:23 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] i2c: i2c-mt65xx: add MT8365 SoC support
Date: Tue, 18 May 2021 16:55:22 +0200
Message-Id: <20210518145522.2420135-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518145522.2420135-1-fparent@baylibre.com>
References: <20210518145522.2420135-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_075726_486231_0578F649 
X-CRM114-Status: GOOD (  10.01  )
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

Add support for I2C on MT8365 SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 5ddfa4e56ee2..0e6ad84e0e47 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -404,6 +404,19 @@ static const struct mtk_i2c_compatible mt8192_compat = {
 	.max_dma_support = 36,
 };
 
+static const struct mtk_i2c_compatible mt8365_compat = {
+	.regs = mt_i2c_regs_v1,
+	.pmic_i2c = 0,
+	.dcm = 1,
+	.auto_restart = 1,
+	.aux_len_reg = 1,
+	.timing_adjust = 1,
+	.dma_sync = 1,
+	.ltiming_adjust = 0,
+	.apdma_sync = 0,
+	.max_dma_support = 33,
+};
+
 static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt2712-i2c", .data = &mt2712_compat },
 	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
@@ -412,6 +425,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
 	{ .compatible = "mediatek,mt8173-i2c", .data = &mt8173_compat },
 	{ .compatible = "mediatek,mt8183-i2c", .data = &mt8183_compat },
 	{ .compatible = "mediatek,mt8192-i2c", .data = &mt8192_compat },
+	{ .compatible = "mediatek,mt8365-i2c", .data = &mt8365_compat },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mtk_i2c_of_match);
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
