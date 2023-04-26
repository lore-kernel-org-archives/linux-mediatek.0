Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C35CC77B60
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 12:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDMAZYC6PlfAvsYSrf+M4iyNDJFAF/AM883C7PrISNc=; b=Si1Uip/N7P4x7CIrjkROyI+5H3
	P3prj/hUHcvxmk3zjotSAXS85h08GVvaGi3/3/4AnH7lwXgzcTeB5dng3CqauuMOX9CjcReRcMhKq
	xBxtIKAudV8hNinD2pmGNA5I8rL3IDFh7JjuBXW1UBWMwBuyp23KY/prhdK2izbdXF6y4zs0MC3vz
	iCS+Q2IJw5JskpqFCilzPiiG1tHQtr4qj0jab6xQHuwmKItw85ImAG0fDa35A2gfBGEX9oWsobdEw
	INf2ndsOV27aVSxadGXjYQL+eDW04s7mbw3xibWTajVvAaW5i/+hxHobMNFFSdmENHieUFZlkATYn
	lKpdtVyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prdp7-003qL6-19;
	Wed, 26 Apr 2023 12:00:37 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prciW-003eTx-2t
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 10:49:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-2f55ffdbaedso4392339f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 03:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682506181; x=1685098181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDMAZYC6PlfAvsYSrf+M4iyNDJFAF/AM883C7PrISNc=;
        b=NiEogC6rbyFJM1FSnl/FadpIxfug9RR3ut5ke27eotswvuUD9tQ+ZPJnmwSClqSspI
         fiOKARPv2qxgl7E917M9JrviRwIK8bkkuyAOsDgKWAtn3z8nr9nkZiabEmc81LKtGKMd
         Cj5wv3w8A1Id7aYOKxzU4fki/G5rs/rQwthN/4AjQ4PWBCbGOKqz5fpRB47U9FrNIvZS
         txF5En/9GWm7rNxSNlltDsQDgPhudCTXxd58kIrPiEcLFyHVXS8JL6AFIiPr1y7C8iIm
         GfO67v8qK8Tf/XJVi3a6Mi9s0MtXeV7Kh6juhhi9GQDm3DxhfCcdL6t+aadbsnAUkZ5Z
         plUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682506181; x=1685098181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDMAZYC6PlfAvsYSrf+M4iyNDJFAF/AM883C7PrISNc=;
        b=Xh+ttf87jTPWbwK3e4Yy55Q30uv8OcNw6c5s1UCvBG3ASWUO0RGb/8Ro2q7yOcrNFN
         iJGLLQqCpZg2YnTl7B4f0kVSuqSNwayLMmcM25UpO299KHM3BDt377U97OUqxNc2F5YD
         Oug4O5bZ1w6+OeQYEkzW1BFzA/N2bueqifBIrUQPXUkxrt61VhZuNwnKXjiBN4nkMS6L
         EA8EMDTBxKhP6mqxGstnk3oE2CuHJbTFg4DtT9xD1lucet7YEa9LSXeWgA6TW2xswBjq
         dJTOvIzW/cBKLYtY86sWeFMiyUzRGDQz7QCoicGLHVb7zRvXvJAXisEk7D4Uz1vR8a0M
         7n2w==
X-Gm-Message-State: AAQBX9fU0yf0sXkdXBXl00Vvyv11A07MmGwreT7s5bY/4nGmtEKq1C6u
	F102seZnKYUzy6OpMiailmOodg==
X-Google-Smtp-Source: AKy350bKZiYHUtnWnoZ/S+mQWOjCDaBV8/pXElR7HzrGZxI91UvC4qjfknWCal1E/D79mT5NQhIeGA==
X-Received: by 2002:adf:ce0c:0:b0:2f2:1fb6:7b0c with SMTP id p12-20020adfce0c000000b002f21fb67b0cmr14157207wrn.49.1682506181105;
        Wed, 26 Apr 2023 03:49:41 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 25-20020a05600c025900b003ed2c0a0f37sm17601988wmj.35.2023.04.26.03.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 03:49:40 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 26 Apr 2023 12:49:04 +0200
Subject: [PATCH v6 04/12] arm64: dts: mediatek: add watchdog support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v6-4-8d6b1cfe7f29@baylibre.com>
References: <20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=9yZG6Lt2sYetnfjl+HHfU8vcDGstMCEZ7QfVbikE4Lw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkSQG/9dRLMit9NDtAeVEHD4K8h7SA0jlkRUAkyK7c
 vhslhDaJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZEkBvwAKCRArRkmdfjHUReltD/
 96zwsIpIprtKIFhuSZKMpzQzb0vDdpAYbF8n1sVod99junEYGKg2rISq32DZ9oXBSB0KYfC2pvxMkH
 skByJa1ebTo/ELlMp7pGhekvGFazgU/LEawPKmIfPHmG0O6LtigrQnYnM87d9ARcoKmnhnW7mmuUvX
 RvQKLH1tFj8oQNzik21hfmG2G5UjdASP6KeB/7ZG7aMF4uAWjUqjC9ezg8dD/DpKNobHTiNzi4sOZY
 3HgQywmf64FxsHQXlrAlvMPqz1/yz0D82Ov1xwiJC8w4XIb0GXHwYrgs4gOx1ahixnxJsSW0q6b2qz
 ibvBJTWftnxAUFeZLybrj+xj/b2ePi93SU2ztGgzTVDwurKnFXChuIBIAPEp/Y7hy92MeI4JGDW7mZ
 X38XEYjIAxEvtu4v2qrzUcEEaLdAGDP4c1tAlN4qfehl/8rVUCHPy2c2Kg9UU/IdUmcV+sPQ4j31dC
 CBZJ2IP+61XAmN/NfE4osSuCCExR5Hv4WN18KOvYcRtFdBXLQemtd8wyoGRTRq9S+9ixUlmGDzL54Y
 XR0yxyRJnf2roHJK8Z1Cvv8Evfm7A20DKpSvJ1uvbkjOGdX08EYh2Fzxz1sttowPpOODCyxVAEhRPf
 wXczUxs2nd2M7tZO4I/lWlY4yz1o5/J+mS/p77zvo9GSUC0agPwfQATwF09w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_034944_972591_CCFE8C66 
X-CRM114-Status: UNSURE (   9.33  )
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

Add watchdog support.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 1f6b48359115..bb45aab2e6a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -162,6 +162,12 @@ syscfg_pctl: syscfg-pctl@10005000 {
 			reg = <0 0x10005000 0 0x1000>;
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8365-wdt", "mediatek,mt6589-wdt";
+			reg = <0 0x10007000 0 0x100>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8365-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;

-- 
2.25.1


