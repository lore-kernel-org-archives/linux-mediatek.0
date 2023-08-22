Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECE3EE49A8
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 08:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJlvy9cp8YdYtNw+zjvbSQuMdmHyQIESMtjbg1P8AFk=; b=iNi/JSwlf1LLRbNFnfYfe1YmZ0
	SjiI/HiY0gCKh8BtJXx74O0du2BRuYARGRTpI8M/mipaqCd5X2VsVIaiyCFl+B0qW0WTW4ceO5ya/
	V7Z3RcOsKmYA+Ge+X8tD30ivgyHohKJxizk4vaPNo5vm2KeDFE7aMHT7vYCi6SFOGYGMa4NwO7+dX
	P7l+z/ml/ZzjGFrSnR2vb9jmH+g6z2etuYeC1GYlfy/xNfsKHZ9WQVesgb81gHwN0w4k+n+jWQHX5
	032fDbZuL0Tc3CxKgvmbZWE1KsxQYThddtdvVs/f20uIQYiaK4QhX8xkqPcvdiSgHi6QK2tG0hhjT
	NQ8FGx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN24-00FUlS-0P;
	Tue, 22 Aug 2023 08:46:36 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN1P-00FUFj-2b
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Aug 2023 08:45:57 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-68a6cd7c6a6so420183b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Aug 2023 01:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692693953; x=1693298753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJlvy9cp8YdYtNw+zjvbSQuMdmHyQIESMtjbg1P8AFk=;
        b=jslm9USmn7dRFDz6w4G2MzfvBdGji0khaqZCw0xGX9816ntX5c1o/8RAnphAMa38Nt
         V6NkjQBDRKn4oEnwJ06G//CAQqUnkvvIdtbmIGnCcTerUS2xodD4hrg8WkG0Ls16v4GA
         DRx58JL7aAFmkyFRJJWni+65VRSDHWw6x2mF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692693953; x=1693298753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJlvy9cp8YdYtNw+zjvbSQuMdmHyQIESMtjbg1P8AFk=;
        b=apV345l+0CQofhUWHV+4BJfAkbV+cu63PCvIny5x59aFRbVISQe+rjUksXVkUFc/8f
         G2P8YAu2/Zk/PQ/AT3hTxP07sj9Vutx6oLNWv4jxvXY/6Cn0YOCsGhaPn8XVNUnBWmSQ
         R0sX3SRrZkI2eYmVvXtmEQfVyov9gVFVuI8uTgrWOx6Da+8A+Ird/IZZjzBfvYNJQ5IY
         HkxdvNWBDWTIJUvlw7BpN89LIRV6GSVKhfoHnXzYIB3g7SK2KS2nvh7hXyI+t0w2Rz15
         EUKHu1cKOcSFsVezmVo/ibAwWZUUZFKfJRvO7vzlPg3xIX+NeGI9XALMx+UgK2FNsLkh
         qECw==
X-Gm-Message-State: AOJu0Yw+nfcX99zuaIEjyb0JDOMDx/Q27HLbd85TwGRLOQvFM3VBBodu
	R/FsNmJZtuSLUQDAd8pToemLZA==
X-Google-Smtp-Source: AGHT+IGhAEeSd5MyI4wpWI/9j0yldPpTY8zN3LuQHYHKCR7QGaBsbvecfXQ+vwtFphVPcWXhbIrv+g==
X-Received: by 2002:a05:6a20:7d8e:b0:140:730b:4b3f with SMTP id v14-20020a056a207d8e00b00140730b4b3fmr8839855pzj.1.1692693952941;
        Tue, 22 Aug 2023 01:45:52 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e619:3fa0:1a90:6bb0])
        by smtp.gmail.com with ESMTPSA id s26-20020aa78d5a000000b00666b012baedsm7304790pfe.158.2023.08.22.01.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 01:45:52 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 09/11] regulator: mt6358: Add missing regulators for MT6366
Date: Tue, 22 Aug 2023 16:45:17 +0800
Message-ID: <20230822084520.564937-10-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230822084520.564937-1-wenst@chromium.org>
References: <20230822084520.564937-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_014555_871590_BA254528 
X-CRM114-Status: GOOD (  14.02  )
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

When support for the MT6366 PMIC regulators was added, it was assumed
that it had the same functionality as MT6358. In reality there are
differences. A few regulators have different ranges, or were renamed
and repurposed, or removed altogether.

Add the 3 regulators that were missing from the original submission.
These are added for completeness. VSRAM_CORE is not used in existing
projects. VM18 and VMDDR feed DRAM related consumers, and are not used
in-kernel.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/mt6358-regulator.c       | 20 ++++++++++++++++++++
 include/linux/regulator/mt6358-regulator.h |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index 587ee852c053..658c4dbf478f 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -326,6 +326,20 @@ static const struct linear_range vldo28_ranges[] = {
 	REGULATOR_LINEAR_RANGE(3000000, 11, 21, 10000),
 };
 
+static const unsigned int mt6366_vmddr_selectors[] = { 0, 1, 2, 3, 4, 5, 6, 7, 9, 12 };
+static const struct linear_range mt6366_vmddr_ranges[] = {
+	REGULATOR_LINEAR_RANGE(600000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(700000, 11, 21, 10000),
+	REGULATOR_LINEAR_RANGE(800000, 22, 32, 10000),
+	REGULATOR_LINEAR_RANGE(900000, 33, 43, 10000),
+	REGULATOR_LINEAR_RANGE(1000000, 44, 54, 10000),
+	REGULATOR_LINEAR_RANGE(1100000, 55, 65, 10000),
+	REGULATOR_LINEAR_RANGE(1200000, 66, 76, 10000),
+	REGULATOR_LINEAR_RANGE(1300000, 77, 87, 10000),
+	REGULATOR_LINEAR_RANGE(1500000, 88, 98, 10000),
+	REGULATOR_LINEAR_RANGE(1800000, 99, 109, 10000),
+};
+
 static const unsigned int mt6366_vcn18_vm18_selectors[] = {
 	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
 static const struct linear_range mt6366_vcn18_vm18_ranges[] = {
@@ -609,6 +623,10 @@ static const struct mt6358_regulator_info mt6366_regulators[] = {
 		   MT6358_LDO_VSIM2_CON0, 0, MT6358_VSIM2_ANA_CON0, 0xf00),
 	MT6366_LDO("vcn18", VCN18, mt6366_vcn18_vm18,
 		   MT6358_LDO_VCN18_CON0, 0, MT6358_VCN18_ANA_CON0, 0xf00),
+	MT6366_LDO("vm18", VM18, mt6366_vcn18_vm18,
+		   MT6358_LDO_VM18_CON0, 0, MT6358_VM18_ANA_CON0, 0xf00),
+	MT6366_LDO("vmddr", VMDDR, mt6366_vmddr,
+		   MT6358_LDO_VMDDR_CON0, 0, MT6358_VMDDR_ANA_CON0, 0xf00),
 	MT6366_LDO1("vsram-proc11", VSRAM_PROC11, 500000, 1293750, 6250,
 		    MT6358_LDO_VSRAM_PROC11_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON0, 0x7f),
 	MT6366_LDO1("vsram-others", VSRAM_OTHERS, 500000, 1293750, 6250,
@@ -617,6 +635,8 @@ static const struct mt6358_regulator_info mt6366_regulators[] = {
 		    MT6358_LDO_VSRAM_GPU_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON3, 0x7f),
 	MT6366_LDO1("vsram-proc12", VSRAM_PROC12, 500000, 1293750, 6250,
 		    MT6358_LDO_VSRAM_PROC12_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON1, 0x7f),
+	MT6366_LDO1("vsram-core", VSRAM_CORE, 500000, 1293750, 6250,
+		    MT6358_LDO_VSRAM_CORE_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON5, 0x7f),
 };
 
 static int mt6358_sync_vcn33_setting(struct device *dev)
diff --git a/include/linux/regulator/mt6358-regulator.h b/include/linux/regulator/mt6358-regulator.h
index c71a6a9fce7a..562386f9b80e 100644
--- a/include/linux/regulator/mt6358-regulator.h
+++ b/include/linux/regulator/mt6358-regulator.h
@@ -86,6 +86,9 @@ enum {
 	MT6366_ID_VMC,
 	MT6366_ID_VAUD28,
 	MT6366_ID_VSIM2,
+	MT6366_ID_VM18,
+	MT6366_ID_VMDDR,
+	MT6366_ID_VSRAM_CORE,
 	MT6366_ID_RG_MAX,
 };
 
-- 
2.42.0.rc1.204.g551eb34607-goog


