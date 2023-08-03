Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960FCC0015E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 07:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iu4rM2I/GmlnQQPwmur/VaOJeKpYAYS3uqnVLSVAkjM=; b=reBIRTFQ8lz4nwl27W4V3yvUN4
	KcgpnOVTfvoBI/S7vaiuqvsmwBXlPlvr0t2hDGYV26SCS6dx2ydtaCmufuDkX1Sa/XGWA5LqVMtsy
	VVYNZuj2qzaJNYhK4g+FWD6RU4zlUqsNfTncQcCImAtHwsWqa/y33EPa71ni8avlQF4MLRNpFNrhK
	kS2Q+CxgQ7y/yjgybJlMB/MDFwcWZNcoqRvU5Fn237SUEMBk+k1hw5obnvIYO0C+gy76aPjy7+8hB
	/eL4kNOBUHmev1ydHo7VZ90MugTRDhMBX9bRvZV0lCVF1TeDlHmMiXzhvOcDC2ehN+247vvTCN7t8
	d8PPKhxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSzS-006uNO-1Z;
	Thu, 03 Aug 2023 07:43:22 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSzM-006uGy-31
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 07:43:18 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-268541d2947so309858a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 00:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691048595; x=1691653395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iu4rM2I/GmlnQQPwmur/VaOJeKpYAYS3uqnVLSVAkjM=;
        b=Jg6ZstZLtDnzNK+FTsWfrGdfnLrYCheLA4U+moG9RozkQyJzLhuYuAaqyBd+mhpkui
         p43qPAmjKYMndlpDSz7kiP2lCv1iglRLQfteItLRCqh3WBWboK5dj0Jy/9yee9HfAJf8
         FSjs8I1Nq0fpHqudcZ1A3DTmciO2EIpFB2ci4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691048595; x=1691653395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iu4rM2I/GmlnQQPwmur/VaOJeKpYAYS3uqnVLSVAkjM=;
        b=CYOVYEQiL6t6ZHNJf+2l43s72qX8pjRwvKtEcwZq4tOL8eGb+R2p/ujnjLsBthVmxz
         Zh2bdCZ1DUjpntu/O4sFMQuD9nUjVzSJVRHCKJz6tDwZHFsepBloo2csX+QLfMcxGK7e
         64rAtcVX86NUQ7OTnn7t+L863cUE9xMiHCVLW8wBUVfGqoPvuhhB7xf75a3EjCTvZTWr
         eRY0RbHJgCxVm55ZL1Wo6vV7GvcRb4rNEqdrMW4g42G/4936CCqNbRlmKZkSLgoahc9z
         EgRIZ8pSSs2R8bPiZ9IGf4jfyV4Jy5O/8s6+/fkWYzY/8PfLCxEOA2mzUWhHhzrcKAL+
         FvoA==
X-Gm-Message-State: ABy/qLaDT9nzQ49cmjEEdRhSEs1LeuAxiGktJoNu93KPyD2IUMihxSVp
	1QtQM6r/TwmW4Wd6G+wOmIG3VA==
X-Google-Smtp-Source: APBJJlH/CQiq937gaJVAM3Gqj1z9ytNIyA+ymTRQQbX6MefVR7FjKBDsEr+nCBoixWkckvkgumyUXg==
X-Received: by 2002:a17:90a:6fa6:b0:268:2658:3b01 with SMTP id e35-20020a17090a6fa600b0026826583b01mr14987096pjk.39.1691048595511;
        Thu, 03 Aug 2023 00:43:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f3e:66ee:db46:473b])
        by smtp.gmail.com with ESMTPSA id l11-20020a17090a72cb00b00262d079720bsm2095753pjk.29.2023.08.03.00.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 00:43:15 -0700 (PDT)
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
Subject: [PATCH 7/9] regulator: mt6358: Add missing regulators for MT6366
Date: Thu,  3 Aug 2023 15:42:45 +0800
Message-ID: <20230803074249.3065586-8-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
In-Reply-To: <20230803074249.3065586-1-wenst@chromium.org>
References: <20230803074249.3065586-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_004316_975084_BBBA7DBD 
X-CRM114-Status: GOOD (  14.32  )
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
---
 drivers/regulator/mt6358-regulator.c       | 20 ++++++++++++++++++++
 include/linux/regulator/mt6358-regulator.h |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index f8cdfa992c23..c9fd5904d13f 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -324,6 +324,20 @@ static const struct linear_range vldo28_ranges[] = {
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
@@ -613,6 +627,10 @@ static const struct mt6358_regulator_info mt6366_regulators[] = {
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
@@ -621,6 +639,8 @@ static const struct mt6358_regulator_info mt6366_regulators[] = {
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
2.41.0.585.gd2178a4bd4-goog


