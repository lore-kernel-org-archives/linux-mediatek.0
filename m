Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3A7E77180
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2024 06:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfBkU5xN0WacDydGlClNsMc9BslSTszE5PxuLZUJYg8=; b=KD3rxabZGBL7P3aiCYu/OKgwZp
	UwHrrbN5F2jYVszXrH3NaInwfJhooWWSdQSQc2pWr4q9uOXYSa5X+16Af7fC/OuhilguMLrwZPTpV
	05tgbXzKRPlvd8t4hdoZsnYh1f2m/YTyG1ht/rbp5skrYqu/Zn3t6AMSojTBSGMTemUd5EFQoiRjH
	ulYh1VbM060x/l3zD5qEc+sW+swHvaPN405lYU7I9KAlj49VjJhCtMwsYNG3f58iv+rohsayFXsVO
	W2oHi0e4z8wl0cuBj8Ro/7CJoOpwYNNoHQdhyjPp63pfYpN9AN8r2iE1fg2dk534Wxia1gmDMJCg/
	jZPqIlfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLceP-0000000H2XW-2I0f;
	Thu, 12 Dec 2024 06:26:17 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcZR-0000000H1au-2SfA
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Dec 2024 06:21:11 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2162b5d2e1fso481345ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Dec 2024 22:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1733984469; x=1734589269; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LfBkU5xN0WacDydGlClNsMc9BslSTszE5PxuLZUJYg8=;
        b=t4TC5lNV1vCTGDdCjyfSNYgN9ZPu/oNzLm/doI7Dyt/1T/MlGD+TyeVTPKca9prxa+
         qy0FHK6KRlelCOK8uVbStQgjU95I4s+F0TkPyKwEuPtj5k579RUf9swSwETsXikwArP7
         IFyEY1xf/RuXXWEZs6nDZ/jr4DVcLexeYBc3n9bIbpLFzzwkF4SNOxQCR8s2sqQtPFJV
         nJQ7cYjxzNijiVQDsYxtqO85rt4ZzJ2uPRXaUP8ktUy3qH0k5KRI8Z9DZ1UXm0WO1ED7
         fuNzY7ZYs+aHgW01zb4zPFgSTWGUq+NEfUbkv7eZ4jzijJTn0Mcrexr/ZHAdpyttolii
         tsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733984469; x=1734589269;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LfBkU5xN0WacDydGlClNsMc9BslSTszE5PxuLZUJYg8=;
        b=gbBDfyU06zhIlYOvGmwGWhh3be3Af3f+ooYUpkV24d3L4hpI9/WNFdurelXXrb0tp+
         ibZbL1e0V805ipJd8P7Kxnp2QRlyNBQ6+wRqlIRHHQqFFxI+klHdZdFqMKAntDeuqmQQ
         KJQvdeNijFb7m5SdljO1FW1v0FOxxWzAVmK/wsn+iMGyQETI7XBa38UzUVwrMgYYllzJ
         Oo2RH9mj1gFL429088fYeIBQlTWdlmch+Fv2EmazCiJetWGh9SZw9kdzR0ANN9Yhgzwd
         nb7JSods4rE2pb22JE68h5SAwpEIdD5sJiIoCkePy55eV5GQXijNhJcLxuZFBJax4rC0
         fuxw==
X-Forwarded-Encrypted: i=1; AJvYcCUX1BBarGQfSPVYEW2XHhjn352Yu7TnRAdOZvPa9f340mv494vqorrAhB9/GqFlW6RorTE2zJ5PbUDI/Cgq5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvrTBm7xUXPPuoO4fXRawmLPgxeURLNI8WQJzZGxoJ4FXjhuQ3
	gIeR3SAWkMqRMQploiCRZ9nrJeXHfJrtjuXN566XKwTJ9ygYc1tRabMoxLV9oY0=
X-Gm-Gg: ASbGncvkpVkAIk43Zw1YvrOcgYxOkD6HO9yeyPeQCc/liaNsqY7pEvD5QNPHa4bQA3R
	ITcbx7MLnzoo6knRI0hhNUHl8kDd/bMEvaPESfeDXPyxRqf+a2bv1NjSAyuBZa13HUao2TNBUTp
	j3QTuWZ8kR5sQ7qR6Dxv/ZKWlGn+2UFP5aLNPVmqYkC1+9B7TVl+d+jbNmj1KVql0mXoNM/8dmQ
	PdXkWnuq/UhHzPJWlNIzIZhrsXvzg7zqWn5x0m//euCllhTQC+VJAKMuo9Alvx3Q1OFfOud2VCg
	/DdeX53o5W/0nd1IA+9e
X-Google-Smtp-Source: AGHT+IG1aykVIJ7KK1nMnneAqk9zPBfBBGEs0+epeO3ZGiz6cJuzU7kmR5k6vnbujqI2WNuSBpIchQ==
X-Received: by 2002:a17:902:d482:b0:216:42fd:79d8 with SMTP id d9443c01a7336-217785929d6mr36812415ad.12.1733984468684;
        Wed, 11 Dec 2024 22:21:08 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162c278668sm83579165ad.81.2024.12.11.22.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:21:08 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	dianders@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v5 4/4] arm64: dts: mediatek: Modify audio codec name for pmic
Date: Thu, 12 Dec 2024 14:20:46 +0800
Message-Id: <20241212062046.22509-5-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_222109_615565_94F2941E 
X-CRM114-Status: UNSURE (   9.25  )
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

change `codec` in pmic (in mt8186-corsola.dtsi) to `audio-codec`

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index e324e3fd347e..cebb134331fb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -1276,7 +1276,7 @@
 		interrupts-extended = <&pio 201 IRQ_TYPE_LEVEL_HIGH>;
 		#interrupt-cells = <2>;
 
-		mt6366codec: codec {
+		mt6366codec: audio-codec {
 			compatible = "mediatek,mt6366-sound", "mediatek,mt6358-sound";
 			Avdd-supply = <&mt6366_vaud28_reg>;
 			mediatek,dmic-mode = <1>; /* one-wire */
-- 
2.17.1


