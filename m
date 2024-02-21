Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CBDC48BF6
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 08:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/eWTzORbbiIpz3VaWvIplgyLsTQizBCwhJdtvKmGP+A=; b=oaCIWHCRBeB1IUYLw9EJueeo13
	TaKI8Xq0F0Rt5MUty4re74XMXrgSx2aRU9fMq74QNOvlu77VKBjQbl2xRPp26iWMcvk8fe3ucty+S
	uLbi+c2qmi1SWAipd25qWelkq5+SxudqR8buIQSqcam6ONCn+iPHurL6Lx5xtWV8EhdM4+WuI6rDg
	1uOiNbXI9f3LJMAll5ATtCSjSLtQsOUSlewU+dduDNKrN0pqhRITIv+SGwlnjlKT+AGfVUjIWo+Vt
	hO0ktURHw0GkHraxOcF465FxwRkbokC+gS7RpjaYXA4fJ3e0H7GnfqD3iW5fxso1PUmKzrP/715wc
	OSaElc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rchj5-000000001SY-1GvK;
	Wed, 21 Feb 2024 08:13:11 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rchj1-000000001R5-1prb;
	Wed, 21 Feb 2024 08:13:08 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-512a65cd2c7so4670717e87.0;
        Wed, 21 Feb 2024 00:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708503177; x=1709107977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/eWTzORbbiIpz3VaWvIplgyLsTQizBCwhJdtvKmGP+A=;
        b=SfRQ5bwHIHA82kxDOqN+vmJ0vIRM7TvfMkfOPVhD5IgDh1v2xsuHuoNbTVsawy4yI3
         Qn5nZZ6czm0A4figv/lO/GzXdEhYKCRnjJSytLAkf86orgWutc14U0QA2Z9VIBAatmpP
         +vb8AdSaLRjOg+ZNS4CoSOaGWHri2avDFfFas3IQuCS55dJpS4r6GxS4v3qG+5RWIkf6
         D3+NHA4fyj5rV9ESd/HTLmi6S/fsqZJUgFCgZDNEfNyxyszf+OSVCRd9GRaAqT5JCfj3
         lF6pe4GwISbQ6VLGnJ5WYAXB7oMq5oGSPqd8lLTEQSMUN0fYrrcLnpGGboStRzImHQrg
         Azrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708503177; x=1709107977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/eWTzORbbiIpz3VaWvIplgyLsTQizBCwhJdtvKmGP+A=;
        b=vf00UzSwRhlWlPxSKBGwalwb1hw341bcBmi4BGQKmCRy/jph0/NTHsaHF48G3kQ9VR
         /zTXpS15QwIG8LyNi/Y6DratCPTSn3mY+4UKKlPD4gXgBuFKk0VDxz6+d2cv4kwAsUhb
         H0/mrl+R1n0Q3wj3/QN7Xvr+Gjjm8UMWffh5bX61SWJJjhllE8sxelGKr8stqiRG9Pk+
         7XHGtSq2+zEr66KnkL0CTZllhAqwxSBCXb+0Y1DY4GIEFjHja9oWHUWRczKEX7+u59Hf
         G56E7mDE2Rrh5i9bN4jDE218xpyyth6+iOg5oXdYKFijugctMOZNP8Yz+7orKnwkBbRz
         B/GA==
X-Forwarded-Encrypted: i=1; AJvYcCXxvGcd1yaZ/vCoGxPPDZqbmjzOUgf6i4eJLRl7bMbEh+8Ugfl3BHcsI/3ebJX8lTp4JAAGin1XBzUn0+lqApRm+NfbJ7TkVFNXHUXNg7HhdxmbrVlCOSDTBX6XjM8t/Qirlh1SWLbKEKzzEKA4Q62psIfFVWXVu1w=
X-Gm-Message-State: AOJu0YxGkR1LXldjm9gZWAVPMPJOtGFAHFr0nTfOIbjp77Hye6UgPZQ0
	VdZfBHuXMZHcttWh+rQUj+EdUIHWizHIENRQXpV2H9waHPXzvlyv
X-Google-Smtp-Source: AGHT+IGyQ9GZtCJkvm9sABHTesHxad3BmSuXezswVyaQVUsfQ8lWVuh6nqCARxX2kR0Q88GbH2OUqw==
X-Received: by 2002:a05:6512:3409:b0:512:b3bf:b803 with SMTP id i9-20020a056512340900b00512b3bfb803mr5927236lfr.39.1708503177210;
        Wed, 21 Feb 2024 00:12:57 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id r8-20020ac25f88000000b0051144c7cf9esm1562692lfe.265.2024.02.21.00.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 00:12:56 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH] dt-bindings: net: wireless: mt76: allow all 4 interrupts for MT7981
Date: Wed, 21 Feb 2024 09:12:38 +0100
Message-Id: <20240221081238.24775-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_001307_501721_DA01B1F7 
X-CRM114-Status: UNSURE (   8.94  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7981 (Filogic 820) is a low cost version of MT7986 (Filogic 830) with
a similar wireless controller that also supports four interrupts.

Cc: Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../devicetree/bindings/net/wireless/mediatek,mt76.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 0c6835db397f..eabceb849537 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -226,6 +226,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - mediatek,mt7981-wmac
               - mediatek,mt7986-wmac
     then:
       properties:
-- 
2.35.3


