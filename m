Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D15C7EE24
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 22:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9QSMFz65Ju7EmZBc7wzRidxFiF3tMihmY8MVBVsH1A=; b=lPH5rGKtNzujJlqPfRfdwm/FjX
	DdKxFRdqaKzukLgVwHUMsuglzao+xxTvnR2pBld4az91aM/Swt05BVmSBnya+FQ+JjbGfQB2mSC85
	LgvCmhRUb0AnspOfDXbzlPfb/7gqzxkQsQdkL4bkgHPCBhArcLrsoj6KstAn1J3VfTtryZaA7XNIT
	R4bvQzZykxqKrT0KZQFNJSQNoo//lPnEKL8VIkqTvKCbfJwwQagfzfC3RkD1gT+ug7at42BsEEjpY
	gqYy0w4GHKmvhu6KrN/nklDYQ2skNJp5aMVRzjGToZhx9luow1AT29OI/tNaHZMTcZTqeL28S2+WW
	aropFkDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxERz-00A8Ic-0L;
	Thu, 11 May 2023 22:07:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxERx-00A8HG-11
	for linux-mediatek@bombadil.infradead.org;
	Thu, 11 May 2023 22:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=M9QSMFz65Ju7EmZBc7wzRidxFiF3tMihmY8MVBVsH1A=; b=BXujQ7VZci1EyXKeHFPTul/jRY
	GSV+kW3h6w1j3sQp6vAAjebFTKAZe1BEFOq8R1LdS7u/Zyg4uaxNiJQxBvvKXpefi6KskYIU0meN0
	eC6ka9x7Jeek67fNKC3FYhdM/DMjZ/tCDTSjxQrtu8twZ4zleHkOsFYCvH2Iv1OKCHHWeM9EEjLee
	swgD9ZXH5TLRok/64O+gNKwtYzli91E6czIpMPvb8N/J9yMkYGeyVJuNHURazBEammV0FxOCdVZMK
	JQdvqz0/bEsy9KZGwgNAabMM8Ip/i38VXgLtC3rrDy/Gf76MWHyj+MMBktJW6/1g7OADPgJ2wbZgG
	T9GZ6PUg==;
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxERj-008PU6-26
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 22:07:47 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-517bdc9e81dso4762139a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 15:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683842851; x=1686434851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9QSMFz65Ju7EmZBc7wzRidxFiF3tMihmY8MVBVsH1A=;
        b=abRhbKBISwnKIWQVVQLKMmznwGGgrunWJMU/0VhjZdk/cc8Usl3g7DWYipdY5FH4Aa
         PYljErc5sO2VT6nHpZ9+hN48TDAeiFKIpy5ftWwgGLS6b+dIANlIcesFzchIJOByDFVC
         BBFJO49zGeiHXqEiNa88t39sNijH1lwGc6/zA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683842851; x=1686434851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9QSMFz65Ju7EmZBc7wzRidxFiF3tMihmY8MVBVsH1A=;
        b=H9s1ft6p3NHcBbX0ccLSpL36rp/NvuX2ip1IXO9FyaG8IcDbwlAtIISdyV2a/0GxH/
         dcFRNNvo1sIwXgdb/Pr7nSglRM4zBaU+mWAqbYjPLwgVeLPVJwvzJLOc1ndCcooZ5f4W
         lTWP/pBqeuibJAXoeAh5IqiQFt/zCrXLGKbhrMHz9+VMiJecKGAfZQZjMZjBai1viHpY
         eIJn1DDTw3zJwtabJS/9dSzpy41BiizZJCoFqroeT7ZVTAJUdp8El0I0UeS/fe4weW1a
         X0QcYR0o1Yfdm5EsOspbOPAhaPnAGmQ4zIdnWQ0FnqfDW13Mpw0JPWu9PQvCTaqipij9
         Q3iQ==
X-Gm-Message-State: AC+VfDysi0Go0Zgu9jP0Tduoy79qjm93FM26r0nPNSu8Q6s92y17SbHh
	tVPvSHvLkFQhrhejMIAK0lJCJQ==
X-Google-Smtp-Source: ACHHUZ4eNYjOuXKyMXbgriN8Eh+bAac8ejo2Lcxf9RisUVJt3cHRTOTr5cquWMPd+VUtichC0SkDDg==
X-Received: by 2002:a17:903:2342:b0:1a5:1438:9bcd with SMTP id c2-20020a170903234200b001a514389bcdmr29543096plh.35.1683842851177;
        Thu, 11 May 2023 15:07:31 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:b96a:d776:ee3:e572])
        by smtp.gmail.com with ESMTPSA id h24-20020a17090a9c1800b00247735d1463sm17589457pjp.39.2023.05.11.15.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:07:30 -0700 (PDT)
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
Subject: [PATCH 6/6] arm64: dts: mediatek: mt8195: Add mediatek,gicr-save-quirk
Date: Thu, 11 May 2023 15:05:40 -0700
Message-ID: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
In-Reply-To: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_230740_802909_EBE0E34C 
X-CRM114-Status: UNSURE (   9.26  )
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
Message-ID: <20230511220540.x_s9tJigCa_HbxRXav6J7z8dWHCX7Ig-JDgmIrL26iQ@z>

Firmware shipped on mt8195 Chromebooks is affected by the GICR
save/restore issue as described by the patch ("dt-bindings:
interrupt-controller: arm,gic-v3: Add quirk for Mediatek SoCs w/
broken FW"). Add the quirk property.

Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index a44aae4ab953..6df9ad8f658f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -463,6 +463,7 @@ gic: interrupt-controller@c000000 {
 			reg = <0 0x0c000000 0 0x40000>,
 			      <0 0x0c040000 0 0x200000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gicr-save-quirk;
 
 			ppi-partitions {
 				ppi_cluster0: interrupt-partition-0 {
-- 
2.40.1.606.ga4b1b128d6-goog


