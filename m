Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D17C7EE22
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 23:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+dvOm04w8PPu/rImCk8a3YHkXAbeV87AIPZhDPscPw=; b=y4tn8VPb9nh/3J9gLBSKOeAZXp
	uolDUNiQ+BJtlv5uFr4gSQ8Os0CCs6rre8jpVOf1lvtuch2+/x9/A7Uc+yWLvwQGGXDzyb+p1wUHr
	eOF4Iya1Bu/ZJeLTiqT4mZ5RRzlFMXRQ9woUO5QR6R934Stwt0gzbXwvtEu3g6+EKBYVyl5lSiDFL
	rxTar2m/zOK3gRVnlcKU2wNKnOjBNZCAPuqmdLEwgQ2X1aD1JfOyV6Hk+oK0W1B8Dd8RQA6RJhuXT
	opEF4BlhjHaYC061OqvMDJXbNhvQiJGFhHNiR1uMun6V1Wgg4aJ7SPM2uOiEtm1ITQmk31GYUSz1U
	kczk4sjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxFW9-00AJaS-1h;
	Thu, 11 May 2023 23:16:13 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxERb-00A8AB-37
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 22:07:29 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-24de2954bc5so6380224a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 15:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683842847; x=1686434847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+dvOm04w8PPu/rImCk8a3YHkXAbeV87AIPZhDPscPw=;
        b=hssIu15bC0KSO0j4n4UiTUSK1g1EmW3565jzwwoTqGY6zacsfwczA5MEV+3WEIgL51
         FaOLFcYy4qZNQX5hyMTUAZC8ss2jKpC9yFQP3B0jicwEflxxCKpWdWKbuC6pxB1ydPks
         q1YL08QBU2trw5ls56AwM/YC2p94uMB+870ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683842847; x=1686434847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+dvOm04w8PPu/rImCk8a3YHkXAbeV87AIPZhDPscPw=;
        b=B0LGXg9NZZ12dz0tOZwXnzNDEJOnxCgIyBgUFszxNNaalGb7YA4j/pb0FXobKlSuhR
         tny6DP89DHLqG3l5i1Zi74emqe1nzfsizBCxyY97BE4n/atnFKqFIoy3A/xKluvR/3lo
         XYLNVxly/47eQHsGxlpB/eaB3uwFwgZGvATRVGQBD/wfO5SOYffOyrApAStqjnjyJQ+S
         AuryLtiEaDp8dnZGHrQNeuFPEYKGXuD6UsdFxsZIdqFCCfIQf8esZL/VCBFc41P0MX4b
         /xGjxhsIbWEpIVmaK4AUunhUnfoHEPonEPZH7mIanKCzeRPStVDigIhdxs6W0jyAhmuL
         Mo2g==
X-Gm-Message-State: AC+VfDyeYhOdoXyiBa1g3EqKM87SSp0QNulYTvlZPQUgaPDGV/bEIo/5
	0cqSAuJZ+FeCx5WcV2c2P7xmu9cQOt/vk4vY0j4=
X-Google-Smtp-Source: ACHHUZ41RE00te4Ijen+NU2VZLSRZZeq3ieV/CReVKY7S7BpZdh+5eIYWsjWa5jYSCS63ssl+OjuTQ==
X-Received: by 2002:a17:90b:1804:b0:24e:39d2:ab80 with SMTP id lw4-20020a17090b180400b0024e39d2ab80mr22819969pjb.4.1683842846799;
        Thu, 11 May 2023 15:07:26 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:b96a:d776:ee3:e572])
        by smtp.gmail.com with ESMTPSA id h24-20020a17090a9c1800b00247735d1463sm17589457pjp.39.2023.05.11.15.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:07:25 -0700 (PDT)
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
Subject: [PATCH 4/6] arm64: dts: mediatek: mt8186: Add mediatek,gicr-save-quirk
Date: Thu, 11 May 2023 15:05:38 -0700
Message-ID: <20230511150539.4.Iaa0ee05cf0362540fda50dd6a0d87ee35dccd88b@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
In-Reply-To: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_150728_001401_2F5408E2 
X-CRM114-Status: UNSURE (   9.54  )
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

Firmware shipped on mt8186 Chromebooks is affected by the GICR
save/restore issue as described by the patch ("dt-bindings:
interrupt-controller: arm,gic-v3: Add quirk for Mediatek SoCs w/
broken FW"). Add the quirk property.

Fixes: 2e78620b1350 ("arm64: dts: Add MediaTek MT8186 dts and evaluation board and Makefile")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 5e83d4e9efa4..09fbd8f9ea52 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -336,6 +336,7 @@ gic: interrupt-controller@c000000 {
 			reg = <0 0x0c000000 0 0x40000>,
 			      <0 0x0c040000 0 0x200000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,gicr-save-quirk;
 
 			ppi-partitions {
 				ppi_cluster0: interrupt-partition-0 {
-- 
2.40.1.606.ga4b1b128d6-goog


