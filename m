Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004DBC77B7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDMAZYC6PlfAvsYSrf+M4iyNDJFAF/AM883C7PrISNc=; b=gAjvRDWb5OGHyjCvI1ame43Dov
	GaEUL3yiZqCZD+VF/UqwmgAdXOFGlpaUeuLiwcD8A8gqPmATqykDuP3BJifApNN8YMNMTaox7GQga
	7VG98G4PHS0QJPEyf2TG0EkCZUD1mzet4I9VKex0qh8Jhn8AHcBhA0i3zNxEIC5NxfGT6TfE2QKWH
	gWBx3KgP8sccw1RN0ii+WBi2kNfJaXABK5WoMlfI6+ix0Znt5C7KKBdv/EfhDdrRAXiqsZVLkvN7i
	lATpfr/d3A/gIGo9F7otAL/lEfChdG52Bqy3rjjDoE1Tn0ffj/+rvVlWND8VzYC63MPYCJkskqSYU
	FxEjHM9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAHC-009aQH-0S;
	Thu, 11 May 2023 17:40:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAH7-009aMw-2d
	for linux-mediatek@bombadil.infradead.org;
	Thu, 11 May 2023 17:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tDMAZYC6PlfAvsYSrf+M4iyNDJFAF/AM883C7PrISNc=; b=ixOYYQQECKsmurhQ6txLU9gqbN
	EsZ76c85bDzdsQzeDzupEx6xnLGIoVVADq8tFeNtgd+3Gn8Dds+1LW6EcLbPrIxkgv6VcWZD8oO6X
	IUGtqy2Eyw4G5OPbs79f2Z7hxpZJ2jrOlj8/p79x1+BOw3g6FYl31AjY2XU2oD83yTIn1c6ukuILV
	FP1BdP6ekqgLMMY8UXzhY9zzBGElAux4SQXFsi7X9mNQoafFgLDi8l/yCa1ysKUdT9bpFcMcxPgEH
	SBs1NHcL7/sAn94ejG0b2wHhnBGPfI0N7BqXJwxyuzDkvtgVzBucwK9IquD+DsICFyThCQu37kjgV
	xuLFV9Dw==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9B6-008ImM-33
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 16:30:09 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50bc570b4a3so16020305a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 09:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683822602; x=1686414602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDMAZYC6PlfAvsYSrf+M4iyNDJFAF/AM883C7PrISNc=;
        b=GKut44jv/m2gz2NLfdfriKWeIeoGw61GlsuhGlK5kr0xoxOlCWKuZHLjW2eAGOU7Ym
         3y/EhK6PlkXPPo/ZwiWU3f/MFQOF2oQ0pf8xLwhhF0n0DXMSYWklP66L8PDmvetZNP82
         sWrRlsjDWFf7KTmMwv+EnORflUX5jcL3Y4Q8+PaBd4IY42m8yiC7QeDqQFRf/lpHHHxn
         9rph6JUzwAZKZ9UE8dY1vpHXASpQPchFrNmPa9/QGMy9oi2jAkr8reo7rLG9EvyjFPzE
         QZwWuM962U4F/Uv8CrH1auj8xmzcrnvT82EpCBjVkLsFb+Zln7klHqlYCUdxbWY9HPnU
         SzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683822602; x=1686414602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDMAZYC6PlfAvsYSrf+M4iyNDJFAF/AM883C7PrISNc=;
        b=FsB5W22US+iNn6d1v/K1jIHmJKj6PPQ0kbH85dz+UNUbEmNsnUKd8neiagYfA9//8J
         PnPVm3DZhzm/RqEwVjQlnMO7q4cBsBm7xRaCC4lVa8VnujdsmF6L4j2zXs13efQGlBlc
         yLvGVwBN9Juz/gwkSkiLIxgvCl9lM9/X804BYPXlt54AC3jGzTkOD018WmUfVn5B45KN
         +/uYJrf5tVoSU+QEyPdEolsO5S4IHyl7tAJYTEb4JW1/WwCsQ0IYGogcJzkUgI6DfkxQ
         66bpJwbUrZA2NM9ImtQ1xzWrUNy0uiA/xBeAhPt6USoXaZTcgVE16Mh0YaSQBC3XIkA9
         //Vg==
X-Gm-Message-State: AC+VfDx76tfuRoOKjsWHgHR50+bMVfQi/Pjjy/N9JoD5/p1jMxZo4ZMZ
	KwdSkI/YfmRiCptmkgOpqqsYNA==
X-Google-Smtp-Source: ACHHUZ5dS5b97ca1fLNMTMneaSjiV+OrWXMVhFnzL+ZkRjzgf/aaSno8BMVOseLzddzE6Hjo8oxMwA==
X-Received: by 2002:a17:907:3f28:b0:889:5686:486a with SMTP id hq40-20020a1709073f2800b008895686486amr21552826ejc.30.1683822601894;
        Thu, 11 May 2023 09:30:01 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id v9-20020a170906338900b0094ee99eeb01sm4209935eja.150.2023.05.11.09.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:30:01 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 11 May 2023 18:29:23 +0200
Subject: [PATCH v7 03/11] arm64: dts: mediatek: add watchdog support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v7-3-98cbdfac656e@baylibre.com>
References: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=940; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=9yZG6Lt2sYetnfjl+HHfU8vcDGstMCEZ7QfVbikE4Lw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkXRgEtFRKjs1rbvTwHl1SQzZKB0oJiYLU0/UNRIr/
 1PbYnX6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZF0YBAAKCRArRkmdfjHURYpLD/
 9fNLpb1Gb3TFT5St5ZutWnqiYhlYMmFqgTcyEEYrKwbZdbcZAAgeF+PHn3SJSgisGWxd3W/EdzNHS/
 Vp5uUQ7CY4mni6u7Rk8Fexb6k0c//sTuk/yBsZK8N28jB2RZiLZQ3ia3monpsSoIVBsxGZC/lUDDij
 CtkPdSwrcBgBUZFLrDEyNVvRmdGKg+sAtKSzHYFOUCxIIqYc6cYXZxehc8vRbbz7uQO7nIH4tPoDLC
 4ShZ09O9mRqqXV23ZgoVQc/UQy/Z9wDKkZ3wItaU8A3h0jqgro2KsXTiz8LZMCLsrIAr9wV+sa1yFv
 c/e2b5EZ8/3NgoLO+j8N4UktB4t2Mgjef84tOtXRvjN5sGQnSxV3l26yK5HwFJ8MMGdeAV+Auzl3qX
 BXjcBPuUb0MQY2vHiLSjhm2meNF5dbT06ZGSkf5rQDgYXIJ3NDGl7X00iN5ie4Zx9VeR6u6bc8Om2+
 0j8lGUzpVZGtzuI13KfCMbe21ObjbNppaAu2KhtcvlkLNEIaLIRvOG59lDUA7qUwtRMyCt5zggW7jn
 n3mDtEE0Yi1HT1JnDUF43i5VTSgtNqK0SUsuUr3WwHgr7BUG0qgzzEW21quckQm3MDPiRiVhcvYuOR
 WEWxcieDJ18u1xFk0Q5z4w98SaLCB56XVX6zAP6y4hzwcyfEU7W8X4g3AxIw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_173006_962454_112AE4F4 
X-CRM114-Status: UNSURE (   8.59  )
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


