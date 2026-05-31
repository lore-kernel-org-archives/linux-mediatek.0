Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DBECD6E52
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 May 2026 16:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=niH6cKOZcimfmRJtCohy1fMyU3d14qfiR/21ImkwjcA=; b=o3LObXeN8AEWrXRk7egq6+0toI
	UJ4x8Qu59ryFheQUXdIL5eS6V+AAwbPQ/xtusOFZ9tAZ1nzutqQjtYXKoPWr59bvT1y7LSRUrjKLO
	eZkKVJ8tqPRMr+tAqHGtjQQRsv8KbvdoASxt60fnHhcsmGcbz1GHgRjq05NzdTD+DB5ZsVGHf/hX2
	Fiap741YDUe0r72NOhV3IG42e9lnyzPP1M8/eRXid7ZwieXiuQ8YzslbVLZhnXyP8Xm3Qw54DlC9v
	NiJ2LvIqkf6jgWUaBjc0ZUaohe8nkccFTTwdDbSG7oB8sv+t0zjKZpfT4SPQPBNll5L0ksnb2+roN
	+/AUCG+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiwR-00000009kF0-3mbr;
	Sun, 31 May 2026 16:23:11 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiwP-00000009kED-1M2K
	for linux-mediatek@lists.infradead.org;
	Sun, 31 May 2026 16:23:11 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-68b90fc6a1dso5365426a12.1
        for <linux-mediatek@lists.infradead.org>; Sun, 31 May 2026 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780244587; x=1780849387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=niH6cKOZcimfmRJtCohy1fMyU3d14qfiR/21ImkwjcA=;
        b=cmaI1CPBEzUNSt/4oio6zSpXUiZLLv/yGHi738ndj6EB3lAeYQYx8JliMfrVpCcFgo
         jlBXx+GHGpFZVvMxV8Df7gRfViFqSWwF+1VC7BGO12943RJzfkShexDnhT6nM46YUTcE
         /KDn3NHbL/GrJFNN9a78fnyOMX1y5w2cGlJZV0HJIO2xSmr8Ye3Louu8AUEzRKGtN0xA
         tJY3YFM6EpTvpFDPJgM20HBdAcr8PZS34Cy+v79JDklGwhDbiOUZejbyZSot5S3h/vAS
         fcTB/6lZtOgoONpfdrmcwJXqtKJHrow4bVr3WTwmNPJLzVqkSBjPjnhDP1/WVYhsyYzt
         0lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780244587; x=1780849387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niH6cKOZcimfmRJtCohy1fMyU3d14qfiR/21ImkwjcA=;
        b=jahNTu6SPiYnc8IsGkYWJVAVtlP6mGCiOOeVXFlehK7aJ/g5alQvm4cv5Hj2/jyjXa
         OespcE1hqQVTmMDqhTl3glOWSW4f66uXCsBNKftWNX10Qi4OdBw4H7QVnxPx3qIPFdu2
         s16WE3lCKcBYr+Id0EIpv82GGu2/oUfbJJNvdIvpU+273yRGovIPqR0uCCLH2yjk1Bzo
         0ImVk7zrXYwIAYkGJ+9Rfwinye3M0PfCsBplfEKSNE67PwmLT4C4gJYb6v88bkhG13rV
         gmEWbWgSQDV18TGRPkdqQgCfKRdmAovc4MtLYvcq+FOs9uTTekpgw1DGBfyU+x25E50L
         LGig==
X-Gm-Message-State: AOJu0Ywv3T/g3gt2dnjHGQuL4/yeNvQMHJVcM3k29+PU9xbTslv9eBP+
	J4A9qV48BXXcrgNklNbX/QS49V/WhnWo3D1XUS1t6N41tN6SzRwSnE/y/K29pG+caTTcOA==
X-Gm-Gg: Acq92OGqPMYhu8o8yqdbbJ2M8bnuNdiWWpPNAtt31jjP0HHkuLuPv4KTSk5sIu8ArIn
	j0Ax3vIyjSeEJAOkb/R/8zmtrCp1rUm8ZaAx+iDGVRrlltNKbdlXqRD+W8CdZXvjLe24pe+rCYN
	ZXUHvK+jqvYBPOd1sWQtnnrG0Uo17OHwDZUDl2tntBJmNaQNBQP1Wuq78y87vDxYPU8a7bscdAQ
	FRzebtzzY6n4X2oB1+aKDKgdbsUtTp1M6Lj56JdPbWZPOdGJoZukqw3gsoB1FR3thPHsv9hSG3v
	CEimZzv1yLxjwZL+QcAY7yalJEgnrpkf9nuZmQGNHqdb2I5DIvwfidsW4qDSGnWFkG5bgpgBIZ9
	ONmOD2xAGkupZmqGOwQCqHrcIGYoxrpze5NmIYQpcxSeGoWnh3sKbNmy47WC+hSWjth3aVJC3il
	REUCnSR7/3p4ZOuy0T8ym2X/RUMTwU4gFatehg7Ef2V2vFoY3qT240omw7nw==
X-Received: by 2002:a17:906:31d3:b0:beb:cb43:f928 with SMTP id a640c23a62f3a-bebcb43fd4cmr125626366b.7.1780244586655;
        Sun, 31 May 2026 09:23:06 -0700 (PDT)
Received: from localhost.localdomain ([77.241.232.0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bed25666221sm29131566b.29.2026.05.31.09.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 09:23:06 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: mt8516: Fix Schmitt trigger register offset of pins 34-39
Date: Sun, 31 May 2026 17:22:30 +0100
Message-ID: <20260531162237.5290-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_092309_376359_A28C120B 
X-CRM114-Status: GOOD (  10.03  )
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

The correct Schmitt trigger register offset for pins 34-39 is 0xA00.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Fixes: 264667112ef0 ("pinctrl: mediatek: Add MT8516 Pinctrl driver")
---
 drivers/pinctrl/mediatek/pinctrl-mt8516.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8516.c b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
index abda75d4354e..68d6638e7f4b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8516.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
@@ -244,7 +244,7 @@ static const struct mtk_pin_ies_smt_set mt8516_smt_set[] = {
 	MTK_PIN_IES_SMT_SPEC(24, 25, 0xA00, 12),
 	MTK_PIN_IES_SMT_SPEC(26, 30, 0xA00, 0),
 	MTK_PIN_IES_SMT_SPEC(31, 33, 0xA00, 1),
-	MTK_PIN_IES_SMT_SPEC(34, 39, 0xA900, 2),
+	MTK_PIN_IES_SMT_SPEC(34, 39, 0xA00, 2),
 	MTK_PIN_IES_SMT_SPEC(40, 40, 0xA10, 11),
 	MTK_PIN_IES_SMT_SPEC(41, 43, 0xA00, 10),
 	MTK_PIN_IES_SMT_SPEC(44, 47, 0xA00, 11),
-- 
2.43.0


