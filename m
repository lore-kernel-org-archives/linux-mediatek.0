Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC54C44516
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 17:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+VQUfT4E2jpzaVYfn1xTQo+PWwjs/hsb3t7kl1meuo=; b=aO3nKlxkDav8P/I2nrjhSGomqz
	36r79AICl7SB+6s/z2umg/4a9+cNfJIpY1LhWdMUfDzB3TxednLQ+kCYj9QTh4T1pUhnvs1Y+BzZT
	2RiorBTJDEcyz7KnQ9072tvqYdgJrwPkfQIqjP5YbhdYBD7HypzbU3QVl58T1UH0RziKxR/2wRolg
	ATktz9z9oj3nvBMyoJBPnGahdlPcUm32dJotARoLLao58rD95F290QQU9M0prrxK/eHC9bsIDVfqf
	Z3KeTvR/u7NxC+z942pS+bD3rw8AYkIysY5mC7SFMDoqIvWGJaTiQZdIADkC9WAqUjp4ZVdH9wMEb
	kM2FWJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPih-00000000Fuc-3K4B;
	Thu, 16 Jul 2026 17:17:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPif-00000000Fs4-47FJ
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 17:17:59 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cc97653887so78761075ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784222277; x=1784827077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+VQUfT4E2jpzaVYfn1xTQo+PWwjs/hsb3t7kl1meuo=;
        b=BdSvtZ5qYwHZOeaD8m4fU8XSvPi5ihCZNC0gY5e9O8eubHQWEstXYgbB+zJ29laydS
         Fwgu3CIJZRFHrNnJSf7KsbQm5AAQG+EQdvLwTZSLnFpOOQgqKvLtYz6Y5CGQlNoovNjs
         pxkOG5HnpnlfnUVtRcXPcYiJAXtx+iXQDaaa0xtvtSe6ctni24CpHhExfWErR0DEVY/Q
         sCgD3xcLSmPdc3DGxUlKiRgc+vsdT3MbYnaBw3AUueD5GmCWP2xvZPvwbewIJgn11IlJ
         JzSXS+NGP4nAKGFa0HqbcaOS45nj7Y1rwsAq64NO3sAPZX7uIykl6O1ny7Ix0UE6KADh
         rtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222277; x=1784827077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x+VQUfT4E2jpzaVYfn1xTQo+PWwjs/hsb3t7kl1meuo=;
        b=em1o2Yt/ckbqMwZwvp/sXIOEj+/GO6/huRxPouR/CLzhEVRCr+ON9zfqRD/VcY0Hhe
         cN6qiaWr+ZPmGTpZ2CQYsQeCKLZbnLE1Mi/XhbcXk1XFbRpysH2hiDuzKzwpCpkmZthf
         mV1K37zBwa8QE7GQKPjbbriwmzxZKSDVSDDOwyzOT7rse9j+C6AoVH1PEoBQY4nnx9Q6
         CInBGY1Y9yLb0F5/cyW810lqBG+Ln2EqnYMe4rOmTvLcZ5iHVytUDmpzZvLkA1KZIN1L
         ZMyLLZCPbZ+AquXRlTWxVTzfbBnydSLIimbSJUmjPW1IGSEpCN7Xi13ywTIXTlu66Nlk
         T8jg==
X-Forwarded-Encrypted: i=1; AHgh+RrFsRYQNB0yVOzqQU1oH556jeH1huyLPaP9CBrZBVIXJAAbXia4wwesu/ebAfbxcBPnIWlhDVpS7AB0uwhwow==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFv2gCE+iz9vhoLzykyhjumLxmTly8EDenXYKUsAAunRMV3lkS
	LhwRdFJXPOuK7MyqqwSHetN0c7wPefNnXeUDDM/gDjcSiOgEzy2M9Ybb
X-Gm-Gg: AfdE7ckG8cfFMbZfk17Bs2tJpCCfVQcvLMhswDKXcR8renC2LfKcPFxvwOB/XI4gCtW
	jpozKefbd9+9zyKV5NkhO7iI2II0vjPl9aZfyBH8gzlsoQBLoCUFomqgm1CY9x+2pP7M8gxOZDi
	kIqYGCYwOzPM/cMS7+goerThWprOtn4zjC6nNNJkVpvz8PBb9Yj5WXizLyudtAaqGZyPWmQRK2L
	bgYmvOxkvWA9gGQF6TsZ+XCHTp0KxP69IFQ2oQbVesyH4NuIICvDDn35hg6kgBUmkTWHLHMa81n
	torpqQdFFP0UQ/Zx4lBXcTtY540Q4Skuu9wdjIU007U3bcBsaWS59XAd1BBIXUuKXf3Yk+mRkCm
	WzKNkPb8wxd0b+KURwVXpoccPKQ89W9S/AdAukgaaj0/FtyIyTovgFTGPRP9DAzYz98sOnHMPas
	iiCOb5d7jzNcyHyCmET4gpLMx/4jL3jFZcZg==
X-Received: by 2002:a17:902:da81:b0:2ca:e19c:986 with SMTP id d9443c01a7336-2cf03c7c756mr75109205ad.1.1784222276928;
        Thu, 16 Jul 2026 10:17:56 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1055de44sm22917255ad.51.2026.07.16.10.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:17:56 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-pm@vger.kernel.org (open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS),
	mfd@lists.linux.dev (open list:MULTIFUNCTION DEVICES (MFD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 2/3] dt-bindings: mfd: mediatek: mt6397: add MT6320 compatible string
Date: Fri, 17 Jul 2026 02:17:32 +0900
Message-ID: <20260716171733.300885-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716171733.300885-1-akkun11.open@gmail.com>
References: <20260716171733.300885-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_101758_025647_DFC7D087 
X-CRM114-Status: UNSURE (   7.98  )
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

Add compatible string for the MT6320 PMIC.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..f2823338cccd 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -34,6 +34,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - mediatek,mt6320
           - mediatek,mt6323
           - mediatek,mt6331 # "mediatek,mt6331" for PMIC MT6331 and MT6332.
           - mediatek,mt6328
-- 
2.54.0


