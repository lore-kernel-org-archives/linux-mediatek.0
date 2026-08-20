Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142E7C5DF81
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 12:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=EY+HJCyNwKS4Dk7A4Pm3eHdrtZ
	M6/F0u12uhaaLWNcIiy9Os58OCHzdzhlEtvpBiu3wPpLE7qwSZ6jC9AIv1rWw0v08Sp6Zz1Lsad7Y
	gYD780Nx2tx/xf4F08hbZ1nGNOpoKvRDyrTA8YL94tk4xdnTUhIOjd1d9TqalhJGaSuPQjYR5cSt9
	evQJ1cyTnIfjYdHo6s5Ifn6Zd+n587nrdaB4x7vsSicVliL/xUhSIr8iIkOLqoKKc9puck0p9NGEv
	Xvz2PrBuefGeR4XfB6N5r/kGTEGI2lCRCBEcf5UWfsZYlADnID8SFjDp1BleSt9JQz7WeqNP016KF
	HXfWj1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1qS-0000000BX11-3tLG;
	Thu, 20 Aug 2026 12:26:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1qO-0000000BWz6-0xwJ
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 12:26:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so20346995e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228762; x=1787833562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=ie1OgdQYr834t/M0dEsXsd1/dJzPr41Lc//ORmIvm3KBTXVVPNr99RvZLSmjDJMeGk
         w0aavlXF7xOy6EiYat0QRA3j83YF4Wxl1lf8M353uwA9y3Qe2qO1ExGPkkUp1LKQmvhM
         0XmxanylOWgb9nVBflMcmq9v9hK/Jr/OK57/DwF2F8GBqi4O8JLEpyl8HSYLnR5DaJ9P
         883zmGZiM8KHfxT/YHLMEx+aynp/vWq2wy3WcRvrd7nnsM1iHb8ZuNdYTASUUygi9gea
         cLi5qzyhSF4Ho6aE3hdBhnUVR1n8z2g0GdSsXAmBDjZDZKkFbHQ4v3sa7GEX2kyYyucG
         JWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228762; x=1787833562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=E74nxTyX8ITeG+cQddT45S7e5aqf5FKrSGVF2id8S+6uLIzXBdzg3y+0Qc/mu3/l/E
         kanYjK4NPP8JqsvvUUQYiLigue2qh4gXncErqdVJQpWfH7ax/0UIYuVo7mlf+pZaTn0C
         HEgQrmMtvcowqBgba0bUy62g8feh9jOxCDhQ4ajaQj6nH6OUtO3AxlMQb2JnoScN1vPF
         rUBrBJ+GbLyPTgQ8oE4gutD/wK+vTXG8GHDTekvV+ugDIS0RUeRntgSd1ew+ftHjkLQ2
         Apw9ETIxUbqP8559sOfqPFA43cFpB/mFnTvdJrRDA0IrEIVL0xtFVC5odzYn/TIP+3Qq
         p6mw==
X-Gm-Message-State: AOJu0YzgCo9uqgB4fbfp9Ij8EYm5ViFWMdcC8fWG0ngxtsFOUoZnjKrn
	meVGN1oEB9mh2BuOpgfjhW/1eP9EDVVk8dnHSRupfYNFx5LAJMcrNYYcWbnRbmWe
X-Gm-Gg: AR+sD12/1hRR64YtQrUGTfx9ldPYN6iF+LLMN1nuiqscc40VNROwLGpQ+O5lpEaSCCK
	FS4D5PvEr2EfHpZHr71EyV1easEtxHFOqEv8w+vwm2vAN9xCVwbN3Ycnp9rHjD370PtzN4DPH0E
	eJ3+EEVU7rY/wugz+flbaFDpHCl1/41+BBx5yvKvxRVo0OjCx4cTdjlHywpa+qPN9Tndnn6HyPb
	osGEDNlRxWDf6m31yHbslbULbiGsMeZl9Jwl9uoU3N67debuc8JpPYWNrQg1kNI+pzouij440qg
	8Q/FU59wIxbyQ77H/I7/zVn03Zy4tMuxJ6DXUila5qEqn+DUq7Hkn5JcKGrcKJ/5Xq3r6y7G+R0
	oFyOq9tUSV8popvOX649NX/gIAQUjNcEwqCFuhDDfHnOrVIAdUUqzlhdm4khBMPOFyGOA4iw0oU
	ejXNSAE4RGkAd4K5eBuRMmigW2OVXmx4yV//zz6C+T95YPBrBT3eXYpw==
X-Received: by 2002:a05:600c:8b65:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-499aa1722f5mr231760135e9.6.1787228762272;
        Thu, 20 Aug 2026 05:26:02 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:26:01 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Thu, 20 Aug 2026 14:20:00 +0200
Message-ID: <20260820122242.120039-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_052605_834105_23EC4107 
X-CRM114-Status: UNSURE (   9.35  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0


