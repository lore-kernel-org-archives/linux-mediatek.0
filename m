Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92272C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 09:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jxn+TRsbL2lgiHIWio+0AzhmetW3gojePjlFvN063GE=; b=vW4iWXnPYNti6cC9b+neSYbmXy
	niQuo3JKDMABkl36Hk3IPJiKrHgF8E+++iU0sJTZ2jkl8KTO/5GiHBV+EHQhqGWyC3ohHnCiMKYK0
	dYxyvWKMMvCMKdbjoEJWr3gS5DUmSJqp1WAxXTWp8A4G06TSfmJbY7PYzbZrSTjBeF7/vprSzhDr1
	vhzfmF4aaQYPSk/C0F5TthrgEDHyXhI1vZE3dbsphKmqVixlfDJ5DjRPiZE8yLd5+gwhElzxJnZi+
	LVidSiSLjuLso7enmntVA6ABcNlbYrbEcj/qnL4ygaT2YZHABhVxvUZgJgciutBN7Q5N6lkQ5CoQJ
	hDWeBnuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiUS-009g5g-1K;
	Fri, 07 Apr 2023 09:34:40 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiUL-009g03-0D
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 09:34:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id r29so41827307wra.13
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 02:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680860068; x=1683452068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jxn+TRsbL2lgiHIWio+0AzhmetW3gojePjlFvN063GE=;
        b=By+OkSQYatYSmT0Asjzri42rnDJ/FSFLdzIdKg27fdQtM6xcwmX/Y1cKgbaOI1nmKg
         +zgdg4qKlrE+Uixyd5mZ4owRbgTx1MpRUrk5faSksRknDJXvJfoCVxVj4DyfESvmTtQP
         v8kjifyj1toYv1OMUcmP0+ckJ/Ortic2SK8w1KiGaPTtwrem1fzyg6daBX61DkIgaums
         j6CKJz2kQ/wESuOW387iuXS/YH16sXDPBX5rdtvPekdMwlFq0rkyk0CH8f7asLgLfbWR
         z7k1b8Nq0asISiWH2NN2yLr6ODwp85FsDpSNmx61HlnVs7OcBYOM6D6u/FuAlmieK+Vc
         kVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680860068; x=1683452068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jxn+TRsbL2lgiHIWio+0AzhmetW3gojePjlFvN063GE=;
        b=TRzrG5zfGs87Q48gYhptgmnrChhMtxNDZ9KjgCvVVJA6KQdNY2tHbUNcZSjdiQ01n2
         50mHPlR2ImJAIqZIV6H3wVWcjfDiGMr7Vv8mbHFcOA51JGCG65uBm5fUs01I0C1E0C8T
         9tVC1ukPw5y8GB0HXZHnsocpEdZ8yUk9MDZLAEbYNNob5votwnjbsuw2Ub80Xjr5Eg2v
         gPUtm0ifB5FjMaR74GQwNm6+yfAeptSVuScpBU6X6/xH+qEC8CtsA2rBvmbyGgFKMA/g
         CWfl3WZOdYPzYQeC/ygukRIrF9WXWNXPWTjzbFVIMRDtfG+7uPC5KvZHseP0awTYpns9
         7L1w==
X-Gm-Message-State: AAQBX9dM1kMUyyy7JskYeZEKjGXshcVdHRcxk9vafYBPzlyqPj975Q76
	Gd2wWrMnUHDCcg88DCm0Qk6SrQ==
X-Google-Smtp-Source: AKy350YPtB2qqm/tfTf6wiR6eAJjclFxqHTy0s9UDld4/0zfFwB9yighmvTC2robN+fnfpNzduPjDQ==
X-Received: by 2002:a05:6000:12cb:b0:2d7:89ce:8319 with SMTP id l11-20020a05600012cb00b002d789ce8319mr764774wrx.27.1680860067647;
        Fri, 07 Apr 2023 02:34:27 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id s13-20020a5d510d000000b002d64fcb362dsm4020432wrt.111.2023.04.07.02.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 02:34:27 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 11:34:12 +0200
Subject: [PATCH v3 1/7] arm64: dts: mediatek: add mmsys support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v3-1-97e19ad4e85d@baylibre.com>
References: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
In-Reply-To: <20230207-iommu-support-v3-0-97e19ad4e85d@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=IIlOfZtAZXJ+CTRWdZTf7MxepUo9ZjXmi2nPi0PBDfE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkL+OhO5K9POZkm9D2W6JnijLrtwGC3rjMNLpfW/d/
 KZhoB1mJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC/joQAKCRArRkmdfjHURdJ+D/
 9r9/Te9R69K349jViT+g4eRJgaXBXVs80vgLPMlbqBtrKR6AJ/XtQSM9ikDUQiUAarWTTTzVOwDPGy
 l+qc87ZFJkzn7YqK7Dn7/MMW6aXqTQv7pvB/jAtYrU2QPh+ALxyP2ryt0iQuI+snYSIoL368FTQbP8
 WXdBnr57VMR90WF8bDnpNFcx0q9s4FyaT6kgAXA2jI0VTAuUukRXFLMjYjK7oK5/ELDMKiUjMlIV8Q
 7lmjfRsotV5FnzNVe7C1NFtzn64X6htj/j2UqrA5NzPFhMAnzTm6sROLwhJjy8+nJyPkAjn1MyP/Jh
 gd97AZD9YVV855UR8X0dGgc3d9siodpUy6Wa8uZRY8i81gxqKjZv+ayHLUjMT1snW/ooEmy+8d/hJi
 OWTlAnNqgUC+ZLI5wV1Nf/NqZqdvJjKgVLB7z+0zyz1CQCSuP4tnQUTw0dzVkDtapdqO0BC6zB7+jN
 rs0DFJ49b2kFQF+jNqd9/X4LAA4t8SZ98T3Sb05RSaiVAbPWNuZ99VxICE8qY4d6+Jg8BhTy3wMFhw
 B7/xbdkRDtOP51uwSNyXjhVbFj0NvhODIZYtEEF2VYfadF5cM2wNEJsr76wUHEMMQY/CaoOhmxqIvW
 QnMbChzx7QkYAlSwdPVeNVoSbQAvk20iTHi0cCMDJQbZM4pUJVhdrBzwfMsg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_023433_156904_8D54B733 
X-CRM114-Status: UNSURE (   8.57  )
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

Multimedia subsystem (MMsys) contains multimedia controller, Multimedia
Data Path v2.0 (MDP 2.0) and Display (DISP). The multimedia controller
includes bus fabric control, Smart Memory Interface (SMI) control,
memory access second-level arbiter, and multimedia configuration. It
plays the key role in handling different handshakings between infra
subsystem, video subsystem, image subsystem and G3D subsystem.

For more detail, ask Mediatek for the MT8365 AIoT application processor
functional specification.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index b5f5c77f7f84..db9ab538c34d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -592,6 +592,12 @@ u2port1: usb-phy@1000 {
 				#phy-cells = <1>;
 			};
 		};
+
+		mmsys: syscon@14000000 {
+			compatible = "mediatek,mt8365-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.25.1


