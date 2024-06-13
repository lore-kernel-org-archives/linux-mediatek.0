Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742F9C27C75
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 10:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j6xMy0PSx7RAK5KyLRoFGIY2S4TSiOFCk9JAjN+55oY=; b=M9juwAMTVBQe2J+4PA+4ZOmvQD
	GxEZOrXphKvazrcc9qac6UuAWo7U5uvEdLZfKSr+SrgF0Sv0A37y4H3emF7/aAijkUinLAC+Cbuqi
	Beh0UkQdOUOHiKEUDV2ks1Fk2pQ8CCyr30ziArB9o4zhnQtDCfTOx/vkxbuae0SZlKbUNkV1zQS+0
	LNIZ7l+KKw66zMjf78pshoGis4shqk96LjRYRHTBD/dT1Vnb7fWwzzf5GoRkJvZhGjTtasC4Lt1Ln
	K6w8oS2AWk1z4uzffLTEP8eoBBEETclPktVYaEOdEVScyoD0Xa70IyH1QSDHnBXdF18+3JiPEMQpx
	0egXMTPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHhYz-0000000G7O3-1jN2;
	Thu, 13 Jun 2024 10:20:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHhYv-0000000G7Ls-0PtI
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 10:20:11 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-705c739b878so1009733b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jun 2024 03:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718274004; x=1718878804; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j6xMy0PSx7RAK5KyLRoFGIY2S4TSiOFCk9JAjN+55oY=;
        b=GtAFkNWKd6ORPIi0RQs34NM6KiXSK+dYehB+riId6UzWjZGli6wIC/dX3BdCUZMBe1
         2yql+urOXA3ymL+yikxdw2T8oNIfokBAgVM5BORS3pWI+biRbQYTSf+KaCSrrF84Ov1d
         YpuUZDC6oYvPIKuEgA8es1LnqB6ALTFGlnK9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718274004; x=1718878804;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6xMy0PSx7RAK5KyLRoFGIY2S4TSiOFCk9JAjN+55oY=;
        b=XI+Cfsys9KiU8oBKOtSOyWHt+sgppn8VywQEwUGZKIFBXoNXZueUA3RwBMQhCSP5pb
         2bFks0imSkyitsB2mDPFDKVU9tF5loXd1UIc29uml6pGKQBh4bwWiMR7hXr/2mAIvijs
         0c5jAvRuxUcLDb8UnE+Ef6ANJ/vtvR+2AydhT1fnwkB+MgUrjKGfdn6EdXmmDQ2UIfPD
         qduJSM94aJY5Etos1rIhmdZkHvQKt3gE8WB+CBoYHkFMQsCyfWozkpctpl0w1VYRDW/2
         GqbpCYeYa4IN6mflx0U8UU2OsAz3MLTRaJbm/ftxzzSmwJCqLsX1DiwZNXTCUOWe4XHi
         C0dA==
X-Forwarded-Encrypted: i=1; AJvYcCXTBB4hAZNiQF0MHQqFm+/U2g3ZCbRXI1m8DK6d9XWna+pO55Ocn121w1bKvrt5kg0nAWAk3SQzzjy6wJfXwKAeKYRM1QPzj1slpmU4qC/dyFqv
X-Gm-Message-State: AOJu0YyfmZmADeWUI+hcuC2SpY7AGWnJreieTrd0cD9iw3V7wySA7I40
	nSYqqFaFZynzK6IEgNWzivhiQDLgzWveO20yEEmAtNtninA8GoHIBX25yRkY+Q==
X-Google-Smtp-Source: AGHT+IGvGm28fk+okkNWjfFgYvPyFLTuWgmuTCIzXUdUG0qAQ/FS0ndUR84hPXLwOSrKkTwZkSzbEg==
X-Received: by 2002:a05:6a20:daa8:b0:1a9:d27c:3151 with SMTP id adf61e73a8af0-1b8bf0c4483mr3508458637.23.1718274003916;
        Thu, 13 Jun 2024 03:20:03 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (60.252.199.104.bc.googleusercontent.com. [104.199.252.60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fedcf36b9esm817047a12.19.2024.06.13.03.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 03:20:03 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Thu, 13 Jun 2024 10:19:58 +0000
Subject: [PATCH] arm64: dts: Fix the value of `dlg,jack-det-rate` mismatch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-jack-rate-v1-1-62ee0259e204@chromium.org>
X-B4-Tracking: v=1; b=H4sIAM3HamYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0Nj3azE5GzdosSSVN1kE3OLtERzs+RUQ0sloPqCotS0zAqwWdGxtbU
 An6aP6lsAAAA=
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
X-CRM114-CacheID: sfid-20240613_032009_148587_B702BF00 
X-CRM114-Status: GOOD (  11.53  )
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
the value of `dlg,jack-det-rate` property should be '32_64' instead of
'32ms_64ms'.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-audio-da7219.dtsi | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 789fd0dcc88b..3cd63d1e8f15 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -450,7 +450,7 @@ da7219_aad {
 			dlg,btn-cfg = <50>;
 			dlg,mic-det-thr = <500>;
 			dlg,jack-ins-deb = <20>;
-			dlg,jack-det-rate = "32ms_64ms";
+			dlg,jack-det-rate = "32_64";
 			dlg,jack-rem-deb = <1>;
 
 			dlg,a-d-btn-thr = <0xa>;

---
base-commit: cea2a26553ace13ee36b56dc09ad548b5e6907df
change-id: 20240613-jack-rate-c478fa76ce19

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


