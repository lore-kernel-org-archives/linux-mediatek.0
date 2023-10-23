Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4A3C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHlKinnyvGcWLyX/UpwiSi0uqGe6vbSuDhHVYP6fxiQ=; b=ZczxgFM9L/QhkedZzAVAWE6ZDP
	oRP1I0eMf79/iu7wyd/2RUSBpLFMECuoJ06VDn7U0/2XLsDYkeDU/vdOK/9oBfeq81idLo0qyikYW
	oZkjWgI7RZv0M3H1PWEI3gQmdfj8/ojgaoSEPOnoPocU70gS6BFStnk949hBMJNZ6Xrcgl1NaiZD5
	LBfLcyzaPH6wMmi7EfO5I9O2F8u2KBfdiSLW6nZf3CAASqoV1I2InCtlOoRsaWOZh9PelHIkNo+m+
	u0lOfRDEjlK/XVAqzPrpCqWCKXJCc+U1g3x5rREQqfoPHS1jGV9fWGcGA95zbuGpfAHvpvaSQz+It
	stIy3sug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw71-007ZlS-2N;
	Mon, 23 Oct 2023 14:40:59 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw6f-007ZUd-13
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:40:38 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-778940531dbso209178885a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072036; x=1698676836; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHlKinnyvGcWLyX/UpwiSi0uqGe6vbSuDhHVYP6fxiQ=;
        b=HJ/mt00rhcv3twLzwrlfiQ2nY74+cZUiR0g9EtKeyUC1r8DydBtpCwjZV8/ZqkBUEL
         5CdsK9ZlBwtzv+V1aXHkQMRZMYelH8vcyVTqdnvxZGOnUabkOOy3ozufbCbEZiUVmkXy
         Db+xSt++IOsdL78RAcQCWUwZz+McG7aTuciG1Q+1OpWMmzRKnlI5LFfrsMnTzn7l2TzS
         TEB3I/JQ7VElurOZ/f7jeuJRtgBXSe4nMBZo8g/5g/nHECtMcZObTGSoyNregrHFAWub
         O4aWe/UsUOVyXE/TDL+BHiGObDamSKECKDmN6ZR/wRWJMb7tzY6vXmgFAhkhmPiz+7NG
         7iAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072036; x=1698676836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHlKinnyvGcWLyX/UpwiSi0uqGe6vbSuDhHVYP6fxiQ=;
        b=VI5EnS9lPmawtvNgR4PUBiKb7y8A3mNLSRsWBlF4o9H+juaq3s39vO0f3741WT311/
         zwAIel/JBQ2lBbOAMs24CPN60Erml8lB56UC0OIMx6smyQgk+6MPG9Eqco+/pRdB2mHL
         M9tO3waia4JNS/6sJrdvfpWXztCniuhvzmdT3Zi+MX+wN091dUr5+/fBuK/uq6QO8IRw
         9gFk4haKkGOwBTYNAgJc2vLymeeCXKHOcrPUcvOjKcYY4c3G59ZmjQQ62TMf1cOie9f2
         506Q658/YxnCHVvDTgo6ydfFwI0EClZ8Pk1hc3TpL2W5XQ7KW8+AKCjlBZKSRTl4ZLxg
         xZ/Q==
X-Gm-Message-State: AOJu0Yzhe5au27NehnqdbNJlivPwuAQpQFRKK6oMniFurwcOsrCXKtzU
	HXsUB9rkTUqXfMmFpAZ6ZILdew==
X-Google-Smtp-Source: AGHT+IEiBk1UARjKqcmuU2E5mciS/+khU+Ezo/QX4nadgM/Ncz49UAdPF0+0FFE8lX/iNwYnZl5nXQ==
X-Received: by 2002:ae9:e912:0:b0:774:3235:4e6d with SMTP id x18-20020ae9e912000000b0077432354e6dmr8721774qkf.21.1698072035914;
        Mon, 23 Oct 2023 07:40:35 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:40:35 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Oct 2023 16:40:05 +0200
Subject: [PATCH 05/18] dt-bindings: display: mediatek: dsi: add binding for
 MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-5-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=+OlEWEvMUxFbKjJVjIiLf0e0kaqCLKK8Af5H5ievjhM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPZJ/cY4ERZiiSBfVRRGRyTqsN8HRcTtNer+op
 /GLORxmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURV0oD/
 0VXz2ryPfkA3GQgZfBGaQjZnLlqT71UDJqxrP4rzcrY58feUXLCqvam9ncDhmdgUSBM+aphUEBydzM
 WJH8b2LKpzmJaj5S8Wqz5jyP/D0snP4yShSpzIKA0W84vr969DljY9A0mz82JprPusmwLUWBpr873x
 iUD+sj9hNpR9mIu1BN+rAFj3se1zGrhWPAk+djg4GQC9Tlg3UAUwS87Qk3jA2xTlaeCRgv18Jngq0S
 ar9r0GTuD5IwHO4szV96F6eF77D6EWrNEcTHm6jbcdSEfQP2ecIjNOuTt85fAwTjhXqzXIby6ng1U1
 wdeBarMnV+qZIaOTiwl/3E3/+LnkQ2zZR1t1mJ6EyaQtWiyETT5bkYubyh5XsUAO1069iV+6uA3M8q
 ucsPRUSAqTSZ2fKX0yK/gwnSj432MKNFNMBnL4hPOGQcznyrlQpqZadpPUqvk6pCpGNDcvILphvWQ0
 AKifv6jwJLQfWb3FTbAtPoa9uRffmwzNlaub6T8EwrebyoGUFyIj4769lqi4XlYSHr2rk9hYlyQBYo
 vAxhRBm3jOkj8U2LWqL3zaFMr+epUIWc5htDqbxnXwi3apKidDY68sPFZ98mk5xBmITeY+ueR/Rry5
 n4zO4J4zgWT5Ss7YzL7jjwLr3MVXV8PDgniVA2BSyJ9UDXJM/TiRtPE3v0DQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074037_363383_D4B414E1 
X-CRM114-Status: UNSURE (   9.38  )
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

Display Serial Interface for MT8365 is compatible with another SoC.
Then, add MT8365 binding along with MT8183 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 12441b937684..2479b9e4abd2 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -34,6 +34,8 @@ properties:
           - enum:
               - mediatek,mt6795-dsi
           - const: mediatek,mt8173-dsi
+              - mediatek,mt8365-dsi
+          - const: mediatek,mt8183-dsi
 
   reg:
     maxItems: 1

-- 
2.25.1


