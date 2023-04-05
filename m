Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CECC761AF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 08:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ty5wIc3Z81+kG82VSRnC8Apz5DxLYwgxvYQ6Q3KABLA=; b=DeCyqZlKSfpSW70UqzPVsPbty3
	dHsawOYC4uh1sKpOPXVZDuuEhDNYiZ1jQNSm0LblgiqLtJneHklWJ8t5HhKtxQtkgv98dVBDRUsy6
	Osu3wyDouR4LhYaG8oCPeualdVv7x3ISC3aA9BtrEdQrHLalOdNHo7ZJWm55cSd4sORpc2etrGA8B
	gvsuWLVACqx7XYY5LY+JEMAmsZCaWD9boB8tFu8ZJQO61QRMEqEzkwtXOUbRKS7KXd9lGbVi/HLVi
	j6vMiicap//pQKbnDm33+CBd9sQkzOoYBHSCmxJPH+M5SMt5n8sOiMIqZllhOoi4beT5+MaXp6eXC
	akS1kt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjylq-003piO-01;
	Wed, 05 Apr 2023 08:45:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyln-003pgN-09
	for linux-mediatek@bombadil.infradead.org;
	Wed, 05 Apr 2023 08:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Ty5wIc3Z81+kG82VSRnC8Apz5DxLYwgxvYQ6Q3KABLA=; b=Omxm0qIem5E0YyDs8aBhIL3knw
	CDpCW7gsliSSLfy69+WFkmiGvyPGqPPhg/S4dxKqAn75QLZCjLSlkJiH9qdBX9rv/Cpna7iKaTBTl
	FHBQ/qkbBt9xQjMyH2wdUUav1KfhCf4f6J4afDpoNXYJL9CEVBZLqACNPxqK3oxH3RuEDSerc7xT+
	Ygc6uIwDeVeTsqw4xAwYjHuBiUa9hWywRGtfwAmNHt68KzOMd6G6qX+DZN4+iFILpgRvOn5RzpjlK
	o44BZ20VfzxTqdlFrw2KSrFiuu6DDO7vNj1T3K8d43y7eMjCNme7tzCUTK/Cnol86FP/Xw4delGXc
	BMXgwBYA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyBT-009pUW-2j
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 08:08:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id n19-20020a05600c501300b003f064936c3eso640699wmr.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 01:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680682077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ty5wIc3Z81+kG82VSRnC8Apz5DxLYwgxvYQ6Q3KABLA=;
        b=2ZcQ8cMXUT+tCWIFKid8JjEtPLeTZHzhuLk1lgXVnCOJL5Pq9A0rkIz2UOfpxW+cq+
         haLAYAXlqgvCXrHAjIYZBAO4XEYQVNLkAx7BbF3N7yX2zduhEga7kzLuQhskSuiiJF4G
         pDFnhNGA8d/sCNsx90s0A/yO7kIPWoF1cPFmn19O9xIgWHh+amnglJ6Yjdev0F9Os2gp
         OvAzvli60SdLPcVbyLyuuBNxKGfpApuQTpdJjdOrkjBhGDSrABdlWLM9A/ci3BQYwfjk
         4H381LhK2Jz2QgJcM6V+HdfoLhRW5V8IoFPl+52XFjUYnJZT/7EqegVJufLgP1CCZrSr
         GNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680682077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ty5wIc3Z81+kG82VSRnC8Apz5DxLYwgxvYQ6Q3KABLA=;
        b=RR3ksXgbBq4KdB0498kkszt8uGHQEb/7VVTTjRQyhKkR9cAYp9izD/Ujr3W7ohhAEC
         j/kAOaSDadMIMbHeN2niHQDb+2Mfja03n4izSTgAVMSKrvPEXpH4Gli4/ue+1zqGhh/B
         TiJFADyItJAHWUWod0gJeVh2Zt+jQgrDWYawNTyYyNtdqegs4Cs7cccC6R89hv5hNiDl
         /LiMqiDrTjaSWeMGLOZ7N7REhWDdLAl92+MkfoPpZkTxfkR6YmUcRjMddEzO5rJ09saG
         LKLuCkTlxWOve/FXQyPyFdx7OjcOJ7TyFoTGaVgS4ljk+ZwSIEt5TQ1ewi/KEsRO7OJh
         LCIg==
X-Gm-Message-State: AAQBX9cb2zIBysbqHwhr6l3C0cE+3uk/ouM72YjxZP4O38MEzws5Dh1s
	I0AnPqh7f1KyIsBZFQyOZh9Gsg==
X-Google-Smtp-Source: AKy350a+/HP4eT7mepbSgPrh3ZZezmR5cZh/uTdCLsA4vjYdPPommSHW67PUEHi6efoBDBMoS7tOMw==
X-Received: by 2002:a05:600c:2243:b0:3ee:4dc0:d4f6 with SMTP id a3-20020a05600c224300b003ee4dc0d4f6mr4055873wmm.17.1680682077364;
        Wed, 05 Apr 2023 01:07:57 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d4-20020a05600c3ac400b003ee8a1bc220sm1378395wms.1.2023.04.05.01.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:07:57 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 05 Apr 2023 10:06:51 +0200
Subject: [PATCH v2 09/10] arm64: dts: mediatek: add iommu support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v2-9-60d5fa00e4e5@baylibre.com>
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
In-Reply-To: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=DnJEBHRsbqHL6qyjSRQDzaDxfH+izMrFh6xvaojG8T4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkLSxTzSSOyVlKk+pu5ucK5KBC6oSvjigLIQZ1wJEe
 BFoarqKJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC0sUwAKCRArRkmdfjHUReefEA
 CfZ6XqBVopXdvlrSr7JRl9epjtctr2LktwRUlcWmP666YL+2klZ5biMdhZNpTSKTCwranyUGVnHHnj
 78LH1as+UKfp0rtoNTws+8LyzHzB2uLZx/DhnCKCVOW5JTwxNA3HId41CcgsrH7C/fT9oRb4wrm9QM
 h/Wy4RrilonigDtaYbWWVOyROij0gCpwB/PusTwS+0L0hjaax+NdsIfla9MebFpK5/jduofNoFQoaZ
 w4RHjH+2nihAqFNO575K9U3t0srSnCfOxtXNU+iCXtusNe3f7x15auC3gc3NWw4qcfXiDjvVbqLHVO
 tgBxpi+OQro/i3m8cK+5GmxdMhG6MtdWHddIZ5zRUIBisLJ9eWhEZm2KbJZxf3YOqm3jzTDHAk66r9
 Vy3QvFXsAphJLFYxYhFNpZm3K4sASMGTsZpHaiis2BAgjszh7QSAL1iNhWgs7/59wKv4SyuWek8QBp
 TAF8h9Z9odOHxYT/cQNWe90YK2K2eo/3WTZ+QpmoSSHBPoAT/nK09l+r0OC+qNT3ZZNRBFlgtRHHrI
 F6NYlqyeWo7YGZBhAg9SkAkP4EEgfd1ZbMYboaLN+F2YuzoBOZH0OzZ3JCGA73LFohbHNhfzqribm+
 o/Ti5VqGbE5NtUXy/aWXjbgpkQipcK8M11/UtFvd3b0uzijxE0TcD/w3g8SQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_090800_085764_D5491E0B 
X-CRM114-Status: UNSURE (   9.84  )
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

Add iommu support in the SoC DTS using the 4 local arbiters (LARBs)

Reviewed-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 07a7267f338e..6260744f4be5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -456,6 +456,14 @@ sysirq: interrupt-controller@10200a80 {
 			reg = <0 0x10200a80 0 0x20>;
 		};
 
+		iommu: iommu@10205000 {
+			compatible = "mediatek,mt8365-m4u";
+			reg = <0 0x10205000 0 0x1000>;
+			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larbs = <&larb0>, <&larb1>, <&larb2>, <&larb3>;
+			#iommu-cells = <1>;
+		};
+
 		infracfg_nao: infracfg@1020e000 {
 			compatible = "mediatek,mt8365-infracfg", "syscon";
 			reg = <0 0x1020e000 0 0x1000>;

-- 
2.25.1


