Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C948AC27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 11:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFWI3DDItyQVutRiXO8RX6hmLD8qSv3rrOP6UnExo6o=; b=5DqQGn2FTs3eyz9aafHBm3OR+r
	FClYsRqeRizSkFiWqDsnpWGpbM+QEpBtWlb6WO70iB5JYpz6Q0XOTS9SPkoU5J3AziG7x4Ynz01dB
	gmDFjtxi/eMAYntlGsUhe1/Pi1bA3yfmIn3LhP0khb7m5KXiIbbFQLjzFvV30qi3fBiAOg16DmZBT
	85MKG8GWlNkGeoAsIeesQnYBstr/Tak2id0X3u5K4QtRj4RUQyVzZMl3sOhsj9qZiaVhTP6dNZIi9
	A1bgPbJdT4vAcpyrfOquekE1HWiM4NX+8bvG1V+uPJ//TxcRBO3zmIDJU47697lKBtvxCaW7FQzB+
	se5zPhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHj6l-0000000GPPX-1YZz;
	Thu, 13 Jun 2024 11:59:11 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHj6g-0000000GPLc-0eVW
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 11:59:08 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2c2c9199568so783750a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jun 2024 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718279945; x=1718884745; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFWI3DDItyQVutRiXO8RX6hmLD8qSv3rrOP6UnExo6o=;
        b=DDYGqh1G3S3FOrkBx04JWyhfCNuUXKLjHYhKXCe/cYS7MhihOCGZBRvyTILhp+/Yvv
         j/4N8uiETuLx615pBZSGLBH6MdLvCNUytK9FD1jW9kjSoxDLJt/K1WYTW/0pZ8kM+eW2
         NjWiY9RL0VpCupQl3cytcFlm+eHmvBlWC70xk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718279945; x=1718884745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFWI3DDItyQVutRiXO8RX6hmLD8qSv3rrOP6UnExo6o=;
        b=Qdq5wPzXsyIodu0VQOK0fN403c3mvLtEMfO2zJRi5WV1b5LcSyw2zYrg/cVyieWboh
         OsDteHUjBB0nsKO1gq6T38rBtuOZdxSobAMyrA7DP5xdyMETsmnzcEnkdYmff/7i2Hx6
         8YD9eqyJIWuPxTrqyiU4XeYwVICAuSdgn7znCLh4JnZEsB1vkqJXmr+NntnHxTmVOHl/
         bgiY6ApIa70xOBPQBLEIxEg0S00qNhyI4v466yTRiFAckD7zd5/ky7uPb0AcZV2t2tEr
         6uFtWE45W9e097LrzbV+pWFYkoBtVENcIzC2ExIPAA3lJxWAu5qfYicnbMktDzLedZA1
         tv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnPmMS6SPISH/DV4ezo89B4ExOTjl1UYehZ3i6vBvI2LzYF323JCcKY8+1Vy2FBSvl4l3P98r6HIDO17A17x7/dgxyXx4KPw+ccIlW/e6UouZh
X-Gm-Message-State: AOJu0YyvykMRxCdgf9/j5If5PnpqdnJKJBFqZEiSKimayRy/ZQOjU3DI
	CVWvd4UzClQRhlMt9r+yAa8PI/s1PqqhYYoZRHyNpU+5OGZdslz7JS+RjlHkAQ==
X-Google-Smtp-Source: AGHT+IHD/wwLAZVG66P7MmZbAQ5abkZDMU6aSnV1YmSQrBqnGyhFTlyZLbFUkzCum+77t6hfBH2SyA==
X-Received: by 2002:a17:90b:391:b0:2c1:9892:8fb with SMTP id 98e67ed59e1d1-2c4a760a325mr4845537a91.5.1718279944696;
        Thu, 13 Jun 2024 04:59:04 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (60.252.199.104.bc.googleusercontent.com. [104.199.252.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4c466c3desm1453505a91.46.2024.06.13.04.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 04:59:04 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Thu, 13 Jun 2024 11:58:54 +0000
Subject: [PATCH v2 1/2] arm64: dts: mediatek: mt8183-kukui: Fix the value
 of `dlg,jack-det-rate` mismatch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-jack-rate-v2-1-ebc5f9f37931@chromium.org>
References: <20240613-jack-rate-v2-0-ebc5f9f37931@chromium.org>
In-Reply-To: <20240613-jack-rate-v2-0-ebc5f9f37931@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_045906_235536_D1546754 
X-CRM114-Status: GOOD (  11.29  )
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

According to Documentation/devicetree/bindings/sound/dialog,da7219.yaml,
the value of `dlg,jack-det-rate` property should be "32_64" instead of
"32ms_64ms".

Fixes: dc0ff0fa3a9b ("ASoC: da7219: Add Jack insertion detection polarity")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
index 8b57706ac814..586eee79c73c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi
@@ -27,7 +27,7 @@ da7219_aad {
 			dlg,btn-cfg = <50>;
 			dlg,mic-det-thr = <500>;
 			dlg,jack-ins-deb = <20>;
-			dlg,jack-det-rate = "32ms_64ms";
+			dlg,jack-det-rate = "32_64";
 			dlg,jack-rem-deb = <1>;
 
 			dlg,a-d-btn-thr = <0xa>;

-- 
2.45.2.505.gda0bf45e8d-goog


