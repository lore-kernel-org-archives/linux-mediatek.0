Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D458EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7f5KuUQLbY74lGswsgfdb62MmZ/G3yTIup2xojBY1Kw=; b=aHOMAK41sA+CQM
	czPyMjJeNZ8QjgeItE0H3snjEZ6ahdSqrhbcg40xrz3hj3uttTYRObwWqD0g1meKQczi06nfiPqIk
	s/Z5EynDVhHsDxH0CbECvOg4z6fsJpH0W58tu/wm0JTVKxXdd4Q+zcqJrjAQPRuRl3MjkbeKlrmlZ
	rDbqJG5Juk3JcrS5+QZo91juxjst5f6L4hppRPxtixoMgDp6/RlVAp45o7kudOEeS45mq6BsJ1lBX
	4diURbWpf5wJ6hayuXpcHe3NSReMw2L8NPAmMqT1fRPRgjCz1+jcPgvfagCcs6Iv4eWy3w7i4cgmC
	SK+dWXRjilFTSdPpkFDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4tu-0034Ss-Kd; Mon, 23 May 2022 10:02:58 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3uf-002dkL-Jx
 for linux-mediatek@lists.infradead.org; Mon, 23 May 2022 08:59:43 +0000
Received: by mail-pg1-x531.google.com with SMTP id v10so13099768pgl.11
 for <linux-mediatek@lists.infradead.org>; Mon, 23 May 2022 01:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N537kmXnIFF/B5MPYA58NfVjnsyjLkZ7UggoyVApuvw=;
 b=X2xZIXhmJUlFUqC3yKU35eJzJRk0/e3r+c8tWahEJf3KPE2r2Shc1G5fNKe8xOKqFj
 LPCOssfEm9wvBZ9+ufc07zRl5ZR/EeBa2ro1UOzK5bsJKGQn41AyMAyssS4QFwyZgkTw
 oWLAJARJfKXShDez4cvMjpfj+7pC3SKDDKLCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N537kmXnIFF/B5MPYA58NfVjnsyjLkZ7UggoyVApuvw=;
 b=oSmY92n5QoVhcnuqUDEzeYxSXzA3YzIgoa/frbAuz3lkkxsAOtf4fJoOscudhHXiAv
 B0u9iciw/wgdBAf0Ky8APJUIRDY/nrKKGV2Hm6b1xjMXhVP7pCCKSdnqyPCIbmCeTENv
 pFOse8s1kfQL2h98lqLnly2yCAfAxjzyl55sf4LgMqHZPAQQGU5YDaCxWPYZ3H0mcGSJ
 3uzurn5eV7I09m7jw0TSFs6MOh/LtXEOTdBvNaTpuLCEQpu+nL8DAoe3PjrY8G/0mQK7
 VW1G9jCPWphClH8KVCez2YS2Ui8TpwyBDXs4EzjYXJ4lJxipAIg+WYsFl4Mp4DAhY88R
 mtGA==
X-Gm-Message-State: AOAM5318sJJiJc4UnyEYfTdzRJjjISbKq62C2b0WtTe0CNPQzcPcYCP0
 jyQot6N5SgVj6JfcWoWq4eFZiA==
X-Google-Smtp-Source: ABdhPJyKyy+R8cax5BnnVeWF2iS5z85uLAPJvTYypKsPeT5JuXm1sykaEWUSesO19CI0VaYkJIQvfw==
X-Received: by 2002:a63:5563:0:b0:3f6:89b:89f3 with SMTP id
 f35-20020a635563000000b003f6089b89f3mr19106153pgm.419.1653296380565; 
 Mon, 23 May 2022 01:59:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:1b8:7eae:9793:ff95])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170902cf4b00b0015e8d4eb22csm4524719plg.118.2022.05.23.01.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 01:59:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] arm64: dts: mt8183: Fix Mali GPU clock
Date: Mon, 23 May 2022 16:59:20 +0800
Message-Id: <20220523085923.1430470-2-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220523085923.1430470-1-wenst@chromium.org>
References: <20220523085923.1430470-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_015941_699994_EA119BD9 
X-CRM114-Status: GOOD (  13.18  )
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

The actual clock feeding into the Mali GPU on the MT8183 is from the
clock gate in the MFGCFG block, not CLK_TOP_MFGPLL_CK from the TOPCKGEN
block, which itself is simply a pass-through placeholder for the MFGPLL
in the APMIXEDSYS block.

Fix the hardware description with the correct clock reference.

Fixes: a8168cebf1bc ("arm64: dts: mt8183: Add node for the Mali GPU")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 01e650251928..6ced76a60aab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1368,7 +1368,7 @@ gpu: gpu@13040000 {
 				<GIC_SPI 278 IRQ_TYPE_LEVEL_LOW>;
 			interrupt-names = "job", "mmu", "gpu";
 
-			clocks = <&topckgen CLK_TOP_MFGPLL_CK>;
+			clocks = <&mfgcfg CLK_MFG_BG3D>;
 
 			power-domains =
 				<&spm MT8183_POWER_DOMAIN_MFG_CORE0>,
-- 
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
