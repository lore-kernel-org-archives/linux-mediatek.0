Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F794C7EE2C
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 09:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFkeXmTsUMY8GSw8DO1YxsHt1wzgz+ONEfDUI+8GUAE=; b=Pb2aqhhIkDFV/ZVYyEYuxVuABg
	XLBAEW5yov8kSBTze0IvRGBa11TEGmEQaXEDasPHnJAC8HQ5MJ3LT2m5TOoq3GQ9vE+iSbSa3/xZU
	+MC3M3gfJevavjUm+aOMDbTu9CLKZRsr88QT9RB+/T9LSVDVyKIM1vNeDjkvieI2/M2PX8KXb1I95
	x4Akec4+tkmMqeiW2Yyf4lYokpNcPnuETe1FOTzHvcN9Kzwx6Aowa5iOGHPYvwbIuh1YBsygNDDZd
	eiwY+DI33w2colkQg7i2sygt4Blps3o+AGjVl83TfQi50CMUE78UPZ5m4/sfDZCI2SAV8VBKMIKvb
	AeCrGGaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kti-00Cz6a-1C;
	Wed, 24 May 2023 09:35:10 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jtT-00CmZA-2s
	for linux-mediatek@lists.infradead.org;
	Wed, 24 May 2023 08:30:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f6147227a7so2461075e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 24 May 2023 01:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684917047; x=1687509047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFkeXmTsUMY8GSw8DO1YxsHt1wzgz+ONEfDUI+8GUAE=;
        b=Ky164TgIAjXoNCRewjAvpvhOJ4Fq2aqesYTLjaP4MsCdZWaK7nNI1q4ACUHyf0yARP
         khE4z1B4Wq3htHoGGiNu+1mMFFRKUkdv/98piGwOHRcsYTzoseEHnt4dQ+gSAMSTXTSb
         1j75EhptJA+nEMLiybke6sENFCRCPbdkvcEZISCZtt8Ps/JPEsyGSZrxNu9oMC0r5Ecz
         9O72t84s/Ms51QhGIloJa0e3TS2IsckqzZwn1CpJz4yOfg0/yCZbJbjr8Q0u71l0fRdV
         HudbAm0rHClx0bTFzAbc85WUmKaoTxiHzJUYrkQYS5aT4NIx1ofDL7RZIuX5kDA6y4nB
         IbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684917047; x=1687509047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFkeXmTsUMY8GSw8DO1YxsHt1wzgz+ONEfDUI+8GUAE=;
        b=SIuA/dnXqBvxGdlpADo7FM6G3SwYzJCTHLDIKeOq9832G3UC9+lvlqDmBJ3HDoZ1xI
         iCiV6Mboxxkt2fWoqCxkLt/oQi1f4802nd16p6tNJqQZCyubE7zsA3J4vEhdwMt2pX4V
         0dTgJo/mHEudzcRu6m6UC+ykT/gnbVcgv2A8V2cNfqYaDqsEdT5+ByVNaxV1W73r/0S8
         VetLVuWrIXzMUDJREQ7CC+wqwjZ11FdHV3ugpl/IeXPZP3KPzpeevJXoNdORw/HOC3JQ
         4rXMKD3LKGiGAPZYb07IIJInuB00WZqXVX1rZuDlJa2nSU7mjmKJJfQWsH1nYbpMtLie
         vsWw==
X-Gm-Message-State: AC+VfDz0apnLh6F4ZsgrP4+JcYHKoUmHeURjIr5imGnbeUM+7ZFDR3m/
	3t2IY0aqe4VFmA4FjkYNN7nwSA==
X-Google-Smtp-Source: ACHHUZ6JqNOn6TctkUQ6E/Zh8dcU2trBSmopBqGdD7CTtYD4boZi1njHtt373XgOG0bq+Mr+DhVFKQ==
X-Received: by 2002:adf:f80d:0:b0:306:4613:e0f0 with SMTP id s13-20020adff80d000000b003064613e0f0mr11012487wrp.68.1684917047325;
        Wed, 24 May 2023 01:30:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d484b000000b00307c0afc030sm13871832wrs.4.2023.05.24.01.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 01:30:46 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Cc: mkorpershoek@baylibre.com,
	khilman@baylibre.com,
	Julien Stephan <jstephan@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 1/3] dt-bindings: phy: add PHY_TYPE_CDPHY definition
Date: Wed, 24 May 2023 10:30:30 +0200
Message-Id: <20230524083033.486490-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524083033.486490-1-jstephan@baylibre.com>
References: <20230524083033.486490-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_013051_946543_A77CA437 
X-CRM114-Status: UNSURE (   9.55  )
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

Add definition for CDPHY phy type that can be configured in either D-PHY
mode or C-PHY mode

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 include/dt-bindings/phy/phy.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
index 6b901b342348..a19d85dbbf16 100644
--- a/include/dt-bindings/phy/phy.h
+++ b/include/dt-bindings/phy/phy.h
@@ -23,5 +23,6 @@
 #define PHY_TYPE_DPHY		10
 #define PHY_TYPE_CPHY		11
 #define PHY_TYPE_USXGMII	12
+#define PHY_TYPE_CDPHY		13
 
 #endif /* _DT_BINDINGS_PHY */
-- 
2.40.1


