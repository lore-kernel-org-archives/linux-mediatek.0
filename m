Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F39EE4993
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 08:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LwYgNBbWG4PSO0ihWHLk9nZHuEXoxAxRNjJgweYAgo=; b=vxvPO/wO4Fszv4VkaQOctlx9CF
	IGhQpZsPkiFEOIYeOYfzOTdwWeeCGsli+Rv9ckH9jTaE39sYPQIUjHuEfTbfirta5Fcs2NgO+K8qL
	5El/D8XiaA69aoQ1fBP8hAvUJtfpaPRQ8vYRJ0wRdUHk0DKFPVsf+VR+WCq1NhN3Fz3fu0iWr+px8
	8t3vx1DvcOC8tbbkXqu0iSxM5m6ByQ5lJQ/4SemZA7gW9arvLpNIVV9T6R+Mu49y12oSffH7ab7l9
	Pe8JFFfyrZfwBZVm6zKDpkqL4iJokMWV4VARL4f0sDD5wh44Kk9kI8Vsg622EzBGBkHqwhoHGX+rB
	UXmTPjcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN23-00FUkh-0L;
	Tue, 22 Aug 2023 08:46:35 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYN1N-00FUDk-1N
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Aug 2023 08:45:54 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-68a40d85593so1359937b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Aug 2023 01:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692693950; x=1693298750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LwYgNBbWG4PSO0ihWHLk9nZHuEXoxAxRNjJgweYAgo=;
        b=J+QwwhCGW2PlgVOsRScY8jHu/1OXjqYru7xvZ9s/ADQ+nrzIBUfmTMymsmARfmL+4H
         AnOM17YVkaTixQaITrtFF8mB4PIQH7vD2wxC9P0Wt/KHqbmc+wkQBbsNkZwTP8AZQI86
         Gjr9GSPn7c742h8Sl49vW2v7oDE6df7wU7f0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692693950; x=1693298750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0LwYgNBbWG4PSO0ihWHLk9nZHuEXoxAxRNjJgweYAgo=;
        b=Y6KVoygUi7RIQ6hb+cV7IQZT2e0N+K8m0sOHBh0V94uhG+wsSIG8hEjkqRtOnhnBSY
         bPtQluEq5Gx//P63y7WWjkzkkn6iHKdWKopSMG/ae0L9EaC0w4qdM0b0bFTCgRIEoPCu
         mrewEFAJNz/gUs8TZkf9Ir40YAIKQF13Bp4m7znmOwKfcSOuaxs0nDbdy/mNK7P2l14E
         9apVDxgeSALd1cFvPI259XEl4Fun1velf0iIvaZDVxL8yUvoJ330jgU+GfPulAI/ENEY
         o1TtU3zEprR9WOYmGOclVO/6uRKhm6tT/uK4gQFkfUpunLqhxlsRhhSPL5meyUz5SalD
         EjTQ==
X-Gm-Message-State: AOJu0Yxc0bbUxB4C/r/65liQgx5jn/Z3GlGMm60UXPF3y17SvAJL3RZU
	uoKSdDYKx4eAUI4xKF1WvvTI0A==
X-Google-Smtp-Source: AGHT+IFIC8qxSyPLsrbBGKQMJZIOzJn7IR8m1rXKz78wmhnuJtgxM/t0Jtr5jd2AOa6QjktQ1pwRYg==
X-Received: by 2002:a05:6a20:6a05:b0:134:d4d3:f0a8 with SMTP id p5-20020a056a206a0500b00134d4d3f0a8mr7998627pzk.3.1692693950531;
        Tue, 22 Aug 2023 01:45:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:e619:3fa0:1a90:6bb0])
        by smtp.gmail.com with ESMTPSA id s26-20020aa78d5a000000b00666b012baedsm7304790pfe.158.2023.08.22.01.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 01:45:50 -0700 (PDT)
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
Subject: [PATCH v2 08/11] regulator: mt6358: Make MT6366 vcn18 LDO configurable
Date: Tue, 22 Aug 2023 16:45:16 +0800
Message-ID: <20230822084520.564937-9-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230822084520.564937-1-wenst@chromium.org>
References: <20230822084520.564937-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_014553_470032_53A694EF 
X-CRM114-Status: GOOD (  13.35  )
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

The VCN18 regulator on the MT6366 (only) actually has a wide
configurable range of voltages, even though its name suggests a fixed
output voltage.

Convert it from a fixed LDO to a configurable LDO. Its range of settings
is the same as the VM18 regulator, which is missing and will be added in
a subsequent patch.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/mt6358-regulator.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index bc7fe2ff189d..587ee852c053 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -326,6 +326,27 @@ static const struct linear_range vldo28_ranges[] = {
 	REGULATOR_LINEAR_RANGE(3000000, 11, 21, 10000),
 };
 
+static const unsigned int mt6366_vcn18_vm18_selectors[] = {
+	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
+static const struct linear_range mt6366_vcn18_vm18_ranges[] = {
+	REGULATOR_LINEAR_RANGE(600000, 0, 10, 10000),
+	REGULATOR_LINEAR_RANGE(700000, 11, 21, 10000),
+	REGULATOR_LINEAR_RANGE(800000, 22, 32, 10000),
+	REGULATOR_LINEAR_RANGE(900000, 33, 43, 10000),
+	REGULATOR_LINEAR_RANGE(1000000, 44, 54, 10000),
+	REGULATOR_LINEAR_RANGE(1100000, 55, 65, 10000),
+	REGULATOR_LINEAR_RANGE(1200000, 66, 76, 10000),
+	REGULATOR_LINEAR_RANGE(1300000, 77, 87, 10000),
+	REGULATOR_LINEAR_RANGE(1400000, 88, 98, 10000),
+	REGULATOR_LINEAR_RANGE(1500000, 99, 109, 10000),
+	REGULATOR_LINEAR_RANGE(1600000, 110, 120, 10000),
+	REGULATOR_LINEAR_RANGE(1700000, 121, 131, 10000),
+	REGULATOR_LINEAR_RANGE(1800000, 132, 142, 10000),
+	REGULATOR_LINEAR_RANGE(1900000, 143, 153, 10000),
+	REGULATOR_LINEAR_RANGE(2000000, 154, 164, 10000),
+	REGULATOR_LINEAR_RANGE(2100000, 165, 175, 10000),
+};
+
 static unsigned int mt6358_map_mode(unsigned int mode)
 {
 	return mode == MT6358_BUCK_MODE_AUTO ?
@@ -554,7 +575,6 @@ static const struct mt6358_regulator_info mt6366_regulators[] = {
 			 MT6358_LDO_VRF12_CON0, 0, 1200000),
 	MT6366_REG_FIXED("vio18", VIO18,
 			 MT6358_LDO_VIO18_CON0, 0, 1800000),
-	MT6366_REG_FIXED("vcn18", VCN18, MT6358_LDO_VCN18_CON0, 0, 1800000),
 	MT6366_REG_FIXED("vfe28", VFE28, MT6358_LDO_VFE28_CON0, 0, 2800000),
 	MT6366_REG_FIXED("vcn28", VCN28, MT6358_LDO_VCN28_CON0, 0, 2800000),
 	MT6366_REG_FIXED("vxo22", VXO22, MT6358_LDO_VXO22_CON0, 0, 2200000),
@@ -587,6 +607,8 @@ static const struct mt6358_regulator_info mt6366_regulators[] = {
 		   MT6358_LDO_VMC_CON0, 0, MT6358_VMC_ANA_CON0, 0xf00),
 	MT6366_LDO("vsim2", VSIM2, vsim,
 		   MT6358_LDO_VSIM2_CON0, 0, MT6358_VSIM2_ANA_CON0, 0xf00),
+	MT6366_LDO("vcn18", VCN18, mt6366_vcn18_vm18,
+		   MT6358_LDO_VCN18_CON0, 0, MT6358_VCN18_ANA_CON0, 0xf00),
 	MT6366_LDO1("vsram-proc11", VSRAM_PROC11, 500000, 1293750, 6250,
 		    MT6358_LDO_VSRAM_PROC11_DBG0, 0x7f00, MT6358_LDO_VSRAM_CON0, 0x7f),
 	MT6366_LDO1("vsram-others", VSRAM_OTHERS, 500000, 1293750, 6250,
-- 
2.42.0.rc1.204.g551eb34607-goog


