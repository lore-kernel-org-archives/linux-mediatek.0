Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1C9C00528
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqcAnVxpvMo7IksBTYj7fHRMjHClyEVoFOPZWnp2zrc=; b=knZcX7idD2ZWNTLp7B+w3AmXZK
	xhAuT88JJe59g3s08zB8fdVP01t5t2OhL93EHDai212XRwa9im2S+IMFFkgTToORH8tlkTep2a6or
	F9gmOXMRw23MxAxjREY9+3g7aLi0mFyc9eZn51boUJUdmjKzycc+aURbpkz+55oTfMrQEM+XTwv+1
	P+XHwtg4PWiphn0fRh9GARuXCy/C+veItlX4yUQOUBhIozLktqEc48u3sKCYVbQ5SpcrWtUYmS7F2
	+WboNbdM2G9Qm8Jwd3rqBiD1naw63fys9mvU9eQUhsLSnGGlZwFb4B4xCa5LCFTo9LxWG8OgcY7+r
	YqZyLWCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlBa-00DJLc-31;
	Fri, 21 Jul 2023 08:08:26 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlBT-00DJDw-0N
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jul 2023 08:08:20 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5836d23abebso17453957b3.3
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Jul 2023 01:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689926888; x=1690531688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqcAnVxpvMo7IksBTYj7fHRMjHClyEVoFOPZWnp2zrc=;
        b=FiaLlQpG+FX04kcW5hPzlM69UWqegsCa8SHht89DbgfZwxyZ2NPixF4HZ+bjd7wy80
         w0A2C7YWmkD11MfX3bs7qVweeGnF99K6lmjgksE4chTNdK2n/UggSDKHtaI5ZUbxNNPO
         0aCkJQsa5a3qlFG5A6KhT+53F03Rt19zOX/BM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689926888; x=1690531688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqcAnVxpvMo7IksBTYj7fHRMjHClyEVoFOPZWnp2zrc=;
        b=hWMt1JCx66Y7hcQJWXvtEd2tlifW3IJFCMoTl9SvWGSM+LVX9m9tm2pR8yHB5NQPTR
         UE2QHppzRcXowr8KcqEGos6xDFoPHOZhdnQ/sS2IkKufjeWTD8IsDvICfaqCRt6Dyhfu
         BQHlhQfsdvMKs/U3zaW8JARvg+3s3Y2rrnDdggk/uX8dYvPZIsMD6j/4nHhZWTz8E3N6
         xk1XxvKUDhq57GuiHa6M45tEieXSeN59QemCmDjLD3ML2kw2j0MCm6lmrfb/Tt4xRNeT
         rhWmyWa9r6/fefb+3Fib75fDEty0lrmZfr/5wqMZUmYbkGtNOyaA3YQnixbI1zq3rcd/
         Y1Rg==
X-Gm-Message-State: ABy/qLaV/sBHitAsLMKka+L0b+lUtemM/M/AG8L74O9z1OPv7DicMVQw
	lRP5SG8lm98wXwbPPPQC7vr4hQ==
X-Google-Smtp-Source: APBJJlF8D2kE/WLC7WdE8mYRIasoZYyBucxGnkw1pAE30KqjiBSmN0qvmA+xlqWibibNJkQ/CaUsYQ==
X-Received: by 2002:a0d:d6cb:0:b0:561:e8d7:ac6b with SMTP id y194-20020a0dd6cb000000b00561e8d7ac6bmr1388896ywd.49.1689926887693;
        Fri, 21 Jul 2023 01:08:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6d86:d21:714:abab])
        by smtp.gmail.com with ESMTPSA id o10-20020a170902bcca00b001b850c9af71sm2740294pls.285.2023.07.21.01.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 01:08:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] mfd: mt6358: Add missing registers for LDO voltage calibration
Date: Fri, 21 Jul 2023 16:07:42 +0800
Message-ID: <20230721080751.2012318-2-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230721080751.2012318-1-wenst@chromium.org>
References: <20230721080751.2012318-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_010819_176563_966E158E 
X-CRM114-Status: GOOD (  10.83  )
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

Most of the LDOs, except the "VSRAM_*" ones, on the MT6358 and MT6366
PMICs support a finer output voltage calibration within the range of
+0 mV to +100 mV with 10 mV step. Some of the registers for this
function are missing from the register table.

Add the missing ones for MT6358.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 include/linux/mfd/mt6358/registers.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/mfd/mt6358/registers.h b/include/linux/mfd/mt6358/registers.h
index 3d33517f178c..5ea2590be710 100644
--- a/include/linux/mfd/mt6358/registers.h
+++ b/include/linux/mfd/mt6358/registers.h
@@ -262,6 +262,12 @@
 #define MT6358_LDO_VBIF28_CON3                0x1db0
 #define MT6358_VCAMA1_ANA_CON0                0x1e08
 #define MT6358_VCAMA2_ANA_CON0                0x1e0c
+#define MT6358_VFE28_ANA_CON0                 0x1e10
+#define MT6358_VCN28_ANA_CON0                 0x1e14
+#define MT6358_VBIF28_ANA_CON0                0x1e18
+#define MT6358_VAUD28_ANA_CON0                0x1e1c
+#define MT6358_VAUX18_ANA_CON0                0x1e20
+#define MT6358_VXO22_ANA_CON0                 0x1e24
 #define MT6358_VCN33_ANA_CON0                 0x1e28
 #define MT6358_VSIM1_ANA_CON0                 0x1e2c
 #define MT6358_VSIM2_ANA_CON0                 0x1e30
-- 
2.41.0.487.g6d72f3e995-goog


