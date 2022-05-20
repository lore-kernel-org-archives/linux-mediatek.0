Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99344C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 11:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7f5KuUQLbY74lGswsgfdb62MmZ/G3yTIup2xojBY1Kw=; b=U9gmAQx8O604NA
	4yLrBDisf81Ax+A27Q6RnBhkSqfy4jsp1eLvI+ipFrH3zquklsXWqbslSSUWciIzcGU19LXg+oMoW
	GYPzXueZ3IK3NYBm71FfGAQJmUeBV2Pj/B+PNCW26poElsSgFUBuddEGr+uyEfAKnBo5nBiA9zUs2
	D3AoJ5NOZRc9s5J/GrvIY6kUj4fHhHnjCXV2RwGdGYPMlRmQCFRo3DY+W9z+vGASiW+pC/qorb2Rm
	hKWAJFVsGP8ZmRWeJhKdlXdFu6sf5Hr9vfWiM4aAS55NPZTpnrP+KUlFU5/Sn2yfo9/Euut5YCVk7
	OA68Wgqbh1xWVw+Ns1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns0Nn-00BwvZ-HB; Fri, 20 May 2022 11:01:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzIz-00Bi6D-HZ
 for linux-mediatek@bombadil.infradead.org; Fri, 20 May 2022 09:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=N537kmXnIFF/B5MPYA58NfVjnsyjLkZ7UggoyVApuvw=; b=joely41bfsAyoKbVSI4gQV9yiF
 o14nACP5brxWHpOoAqauC5GqBqaQ0Plnh3AIu2i+m9zwjotqP6Aofqx1Ri4gREVpg6Tv7MKslzzqf
 zWWeEhVvpaSYdbRo5KRV/q3RbicSxJOzi7NI3CE8h5oVtLGmKPDbdrWRl5VEQjvbP0f0X3HMCgMqm
 zl2yK0q9m2S+OAa1NGU3USv9jQ7/aBGukI/HH3GOITug+bUw+28HTch63L/CvAlg4vahx7SaRi75M
 o45JhBNfgfULVS15odFYUTwVZiX5u9MyXmzK1/MfQpqjKvA6MlCfg4lKbwshYrGaYuoiRsxOHeifL
 SFcDwSlw==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzAx-002IL8-PU
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 09:44:08 +0000
Received: by mail-pl1-x62b.google.com with SMTP id n8so6945273plh.1
 for <linux-mediatek@lists.infradead.org>; Fri, 20 May 2022 02:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N537kmXnIFF/B5MPYA58NfVjnsyjLkZ7UggoyVApuvw=;
 b=KC3c/8wyL3TWVMhL+5tSUJIk8jM4TdkimQNEt+YUcV/P3D4O9WrDmYeovQCEcsR1r5
 XWSNKSVZ0WFawguQMabuNh3CoUu73KSTIFVsEoNKpo4D3eBbpFm0c9d9ubGLXmEXW5GW
 lQhnaIvUaUXAm8W1h0p1CQJLswQ7ZYLzUoC5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N537kmXnIFF/B5MPYA58NfVjnsyjLkZ7UggoyVApuvw=;
 b=Kf9Xg3tzmBTv8Rc4PJyImXcW/QIqm1+Xo49KK/+U2vEmLU4B3RKI4RS87I0ov97HED
 ZZZ0xFcWxvqBpjGnyHtEookdhLTGWz0LJ186M4rX85hC/jKh36GrRJUr93CCOnjjUgPI
 bA1v3iOWowY17J/5Lu8pS69OGA6bX4Vom3wXg4fk0wsmBGvN/3bZVlaw6U1DT+YvWMU6
 Oa3FuZxWDwahDunHrcCwYSoYFn0kV+bzHzaD96yQGtmjt/Pm8XW8t2ItsSP4rNFfbaRu
 uQSVkcZK8l7K5Ar+hUemn9V22l4/Rwl+9QWKpY1b39QajTaF2Zj6T29ID7ByJ3E1Dlp3
 pRNw==
X-Gm-Message-State: AOAM532gL//s4q70PtAmDoLCjjlam6hVMSPAAR7K4UbEBSCNzUX7kr2f
 4Kx9F8pVNtuAJbQ2iBFeT14OAQ==
X-Google-Smtp-Source: ABdhPJx3Qh3cpJC+oik5Y71LHH8R8PjCzSbTcq79RW9UtXYQoOStcvHrjZaDjBr8UJjUlGm3KiM5lg==
X-Received: by 2002:a17:90b:1e04:b0:1dc:9252:efbc with SMTP id
 pg4-20020a17090b1e0400b001dc9252efbcmr10148535pjb.39.1653039835451; 
 Fri, 20 May 2022 02:43:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:ec49:9912:894:222d])
 by smtp.gmail.com with ESMTPSA id
 23-20020aa79217000000b0050dc76281bfsm1290597pfo.153.2022.05.20.02.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 02:43:55 -0700 (PDT)
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
Subject: [PATCH 1/4] arm64: dts: mt8183: Fix Mali GPU clock
Date: Fri, 20 May 2022 17:43:20 +0800
Message-Id: <20220520094323.754971-2-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220520094323.754971-1-wenst@chromium.org>
References: <20220520094323.754971-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_104404_762145_99456369 
X-CRM114-Status: GOOD (  13.06  )
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
