Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3470C7EE25
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 22:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGmB8F2e98GdWrgyT4B5IleiARSuWWe2Ulwy2r0MhKE=; b=mNQ5xcW+IirwzXUpWY40tG8rsl
	4GQltrPngyKJauA9CMo34rO5Trjp6KozZwRXhSQRRHaVYPTwuCl0T9eKRQWhFBp9OW/WO7T3xi5mD
	KFBQQ7QT3tRUFOA+PHOJw9diB/BaRECdPDAZ0jZnwq9ailNSWUZLr4qct2jr7gvZpLZaB3Atl4JbS
	HtL/wcCm9zNR2+fRkJS2gvhb1zMoNL4992zy2Jq3N5DeNEhg0AgLByyVDXOGYr06+OGTmvV0Zr7on
	j4tGToGUPSeY5aBOD4+QuwRQDCi5vKOwPwhOQGgLuMdX10kg0WWTONKmNQVp4dTv1iHUVfTBZ1vB/
	hIKIr9vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxERx-00A8HS-09;
	Thu, 11 May 2023 22:07:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxERv-00A8Gh-2M
	for linux-mediatek@bombadil.infradead.org;
	Thu, 11 May 2023 22:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jGmB8F2e98GdWrgyT4B5IleiARSuWWe2Ulwy2r0MhKE=; b=pUgLxCbAxCpxLous4XDK5wZYaI
	tyyK5MGW2LP/ff8GES4xuUfkktD7263d6BfRNi6ZwsN/c+Frg2jCOYaeqzES9PIcf6PYYM5sXDf4z
	WbIIQsShA3i571bEmGyah+0jDNUb3b6La4Fe9yLXGvTugS0ELjwfU3KDqAy0VmDhfVyHgIe3eCcih
	qNsHbak8wxXxDO3qR+PyYIQwPx1EoWnfph017gmBAh8xj73r/rPloTFUx8A5fS35MvizLrAgcXwrY
	kdyL/xQm7uXo6kCJOilQjrYxvNAVcZruOoh2OF9hVO5z9WODtz1QC2Q0Tb8ksdDkBci+UH1zwcvTG
	C5gjKiWQ==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxERi-008PTu-1v
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 22:07:43 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-24dfc3c662eso6322691a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 15:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683842844; x=1686434844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGmB8F2e98GdWrgyT4B5IleiARSuWWe2Ulwy2r0MhKE=;
        b=a8ROuWQy9au/LGDatW3Yczkvz1oDRSIPWobGizLtzk0TsyfsXDteYsoxk4LFs2lq9I
         zmg18AmauzAwY5tL3x5orosIDGNmfVPcTnQE8EGCRj40rRYHapv4Zj4uHo4PiAkpJjE9
         p+5iV3Raay93vAOnpWhbkitqUW6+lsDByEF10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683842844; x=1686434844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGmB8F2e98GdWrgyT4B5IleiARSuWWe2Ulwy2r0MhKE=;
        b=fKzQM+sclhL/Ogsz3ZZoheXbSlQ41U8QS5nHAG3RoCHfMPV25yTuKzYmAxmSws4s55
         Y16eF9YAHMY6WUfk9W/Exe0Yo7TAq1HmK4MjFZ4G2RJxaoogJOTpL9Mx/Ez44O4Owdlj
         ZAESS2l9F4FmhoVUT34WtnB6IhtVuB0m7df/XIcNftwRRnx7Q47xpz+/eEt7t2+PMnOa
         f1eEutIMuoXjVhEhtokyZNW8YLmgEDO2F9ZSLoE+CvC7mvVzWE+n830GyJEkQZk+3oQ6
         8E65SReCKz+ClvrfySdF/tm0nkH1abZluAmCAEhTQaRgApeMu6PdjvVZ5uhLvZCHDRMh
         Hk8A==
X-Gm-Message-State: AC+VfDwB4bIOs464ILsvd0XiC8/Mqyx7rB+f3ffBlFYEa96jJHe6RDUq
	/SbcEDDML1ZbkWkOvaGvOl3ELA==
X-Google-Smtp-Source: ACHHUZ4L4GfuFi0ir2OtEqoC+3EwK8m+Ei92ubWuNmIPIwYD0THA24Kk7jcXZ4JIs8vWNH+/tZYPUA==
X-Received: by 2002:a17:90a:2d6:b0:252:a2e5:4c3f with SMTP id d22-20020a17090a02d600b00252a2e54c3fmr1747848pjd.25.1683842844119;
        Thu, 11 May 2023 15:07:24 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:b96a:d776:ee3:e572])
        by smtp.gmail.com with ESMTPSA id h24-20020a17090a9c1800b00247735d1463sm17589457pjp.39.2023.05.11.15.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:07:23 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	Eddie Huang <eddie.huang@mediatek.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Ben Ho <Ben.Ho@mediatek.com>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	jwerner@chromium.org,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	yidilin@chromium.org,
	Seiya Wang <seiya.wang@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] arm64: dts: mediatek: mt8183: Add mediatek,gicr-save-quirk
Date: Thu, 11 May 2023 15:05:37 -0700
Message-ID: <20230511150539.3.I525a2ed4260046d43c885ee1275e91707743df1c@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
In-Reply-To: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_230738_589586_115B2E69 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
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

Firmware shipped on mt8183 Chromebooks is affected by the GICR
save/restore issue as described by the patch ("dt-bindings:
interrupt-controller: arm,gic-v3: Add quirk for Mediatek SoCs w/
broken FW"). Add the quirk property.

Fixes: e526c9bc11f8 ("arm64: dts: Add Mediatek SoC MT8183 and evaluation board dts and Makefile")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5169779d01df..39545172fce5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -709,6 +709,7 @@ gic: interrupt-controller@c000000 {
 			      <0 0x0c400000 0 0x2000>,   /* GICC */
 			      <0 0x0c410000 0 0x1000>,   /* GICH */
 			      <0 0x0c420000 0 0x2000>;   /* GICV */
+			mediatek,gicr-save-quirk;
 
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
 			ppi-partitions {
-- 
2.40.1.606.ga4b1b128d6-goog


