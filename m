Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A491D2127B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 08:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/zn5scuA4cBnjeDcZDLfq+bKDyVI2Q6beFukEjg47s=; b=Y+BfZ8TbR6Bt4ATMFKJT52iL+s
	8vkr3X+NEkVNF2ySeN96McnUIXrM3DBL9ol2KH4SORsp30kxXGBHamU3qxO/Efn50e8GULqVRWRmS
	3DkcRmrf3igldPEwQAjO7D5HdsKJmTOxFtfiwH5x7GUaidi6idQPhz+0oET6jSgp78rClYvD6rMaz
	QTbsxiHR4iR15OFjNhV3WMg7imStFDbvyfbnOBUKbcrdHN3DKrDecHi6XirxASVOHbqZSSoVPqqUH
	toQ0l2TUiC6K+JbTmWOMbcx0CR0GRRY+eaf2TggJ6JbjLCuAEZgtmKXxkMyHjrCluGhJ4biFYWKgZ
	2/P106mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1iHG-0000000HVUI-32fC;
	Fri, 18 Oct 2024 08:24:06 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1i5I-0000000HSQ4-3X9p;
	Fri, 18 Oct 2024 08:11:46 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a9a4031f69fso244612466b.0;
        Fri, 18 Oct 2024 01:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729239103; x=1729843903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/zn5scuA4cBnjeDcZDLfq+bKDyVI2Q6beFukEjg47s=;
        b=Jr9RkkR1UMzpav8A93SckzmpsKk+bNiha+KdQcJX1PJhXqFpqLBOtzg79VnJloOIJm
         xQfXfwcF49O8uFxSseY3fe8lE82Ua1E2fCgaa9yXpBRZqikCq05gZnYVqBli0txDdqEb
         v/rlRJUQ7SBjCPLs00Qjnbzu3vPAZ0CeP4E/Nlgkzt+B5qojW6RjNP39kTaM6xzjsfUF
         27ovpde7QW/ApFdGwbWHVp28KFPvnsi9w+8PGAb+4BUuo6BgIxpeacHzLwvxDivP2pnT
         9k+rrGAI7vun/LLR+GBVPNYTs2ayjsF/CdusG8e/ahWGSVEYiwVv9QPmDN8NmjsNH34t
         iP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729239103; x=1729843903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/zn5scuA4cBnjeDcZDLfq+bKDyVI2Q6beFukEjg47s=;
        b=sBFyr+GheBXvJacNeAg/XPcI68gG7u0cQD4z5F5kiZ3Dx3dYOTyw45doWJEV56byuc
         HiWPeGa8bMlPmK/wZx42JBKY2gfbfAjw1qURjyYDMu/WdVaaKSz5S6nzxVI4M+39I0Yo
         ys4R64IEUsDGC5IpXNRfk5l0IdHLcTwKwmhGEwe/OqPrGakijgJqaHX6tQeqr2AY9jQL
         aFgeX/pk6uv8k0U38ijgw74d10nzmIrL9k+P6r/C9bhwztVkr7bNQU4/2trReXTZuqLd
         UcBWsPkH16d6rGQnn7s3eiNI90y+ArwsRkRNZUOrsKkYXMCIaXVkiKSeX2+ga3oPjzyP
         H8fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSHNE0O2b/HSQXX8U30UwgGnB6d7GWyVkCFrfJmKCuP6xBv751iC8BuV0YKHiujSWfurLGDNV4HzRvuT9mMQA=@lists.infradead.org, AJvYcCVhgG/+ctK5rF6x5LFewEHfkBjI14S8WCbJDVvelz7DeAJl1CcGKiKvG3LY91JtdK8ATNZAVF+nEF0Uf2/IecVd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx9eAOw6uw514YpQMTo5H6YJ6CwWmXGR3DaguVyxDKY+ayTPCv
	ZFKVqhQ4azgkAFfluSbLxR15bUjX2V5lt6FjnSmBw9vDd7u0h22Ji9cIBetA
X-Google-Smtp-Source: AGHT+IEJndJ7T4QgNQNyzgKQM38xfv83GpmaPCAjcHMYMqbxlqndRz6v+yB2Ezb0u8Tsr5rWSpM9Wg==
X-Received: by 2002:a17:906:d551:b0:a9a:13dd:2734 with SMTP id a640c23a62f3a-a9a69bb59acmr139359666b.36.1729239102699;
        Fri, 18 Oct 2024 01:11:42 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68a8e734sm61129666b.24.2024.10.18.01.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:11:42 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/6] dt-bindings: mediatek: pwrap: Add MT6735 compatible
Date: Fri, 18 Oct 2024 11:10:43 +0300
Message-ID: <20241018081050.23592-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018081050.23592-1-y.oudjana@protonmail.com>
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_011144_952110_11CDF80F 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add a compatible string for MT6735 PMIC wrapper.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index 4737e5f45d541..d5965dd38df0e 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2701-pwrap
+              - mediatek,mt6735-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
               - mediatek,mt6795-pwrap
-- 
2.47.0


