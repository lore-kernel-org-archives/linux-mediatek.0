Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC89C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 14:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5W2yVD4YDWpQ3CdxVHUW7qDBpRLK/GNpv3OQ8xCAesQ=; b=y2Y5q7aPTD1mr3SFeVO21sOerm
	l334Bl0Ags0DP6FWBhXWfWhw1PsQgFMK980NSZ3JK+iZTAHM4tYPIxYw4/g4ZnuUXnuGwdbU9QnnL
	9l60Z8BoJ7U4yaa1ZgW83WtKNsIZDYf4SMETrXIxGL17UhYpCG1KJl7DP+w0W9fctjteZrf0Y3X0b
	8SyCTAUSCAmv6nMrMlDXvWBarQI0FBuCA/kE0jvGIUH40W5IR8rp7+rbVPqkRh3rDn9ADt6ApSlSj
	hV1oGEagbnbkGH6RxGvw0IliHwCfc5hSLqj8NB8r8ogoMM877smqq2gcm7pjFj7Sv5bBRLTO/5VWN
	Aexiab0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqxnU-0041kn-Ak; Fri, 04 Nov 2022 14:35:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqxn2-0041Uo-8h
	for linux-mediatek@bombadil.infradead.org; Fri, 04 Nov 2022 14:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=5W2yVD4YDWpQ3CdxVHUW7qDBpRLK/GNpv3OQ8xCAesQ=; b=XCYPyIrsBvaHI7FRkUeYngkoFh
	r59wlQAskJz3zW8/kkpMTFgwNPiLdGhc4x3HQzUJ02PT+NT/mpLFXkTHRTQUtrvpG8eXCyE2sOY+Z
	egrz0xtN46c4EgIZ+4G9u+s7/+HL6xYNqqHyTCdQ8+DGk3mzlAWoNtGC3QRAW1Jg99jH2S5M9g+sV
	EbR/HKZ2aDq8+oAYAJsHcpX3shhSQRCFr5ApomfIzZjRfnGm19sMjqi9zJWfO+jp2mJlJ+dsMNAmU
	oH7XHNxc8urLTOm4TJlH3O0Vo075+/tAgCNOReomzI5dc7256iAsKc0C9sW5oMeCMnObGLd7RPW97
	BfWMj9Ew==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqxT1-007Ppo-U0
	for linux-mediatek@lists.infradead.org; Fri, 04 Nov 2022 14:14:47 +0000
Received: by mail-wr1-x432.google.com with SMTP id v1so7212342wrt.11
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Nov 2022 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5W2yVD4YDWpQ3CdxVHUW7qDBpRLK/GNpv3OQ8xCAesQ=;
        b=ZH2Ico95zCvYIhFHVP6NHK4O/87cVBVR6I9hbo3P/sVcFSUVcKKppKz+maSYGYhi/D
         NpWIm0t4PyoLdvM/bAya2RMTCsQjh6R6c4Cjh5iAX7AqelzO7RmfgrbbO4RPVAVa2tLJ
         jZXhQukTuY9Rt8GMWWEbmF706RL02veZ71ZVo6MaEMeUTUXpBedIdFTivAIRSJ2s4zFp
         4RdZPY/12nY/Ezf+WkzWCrcSR/n/J/gf34saIWlVTQkuIwNvronXLtYil6Uj0fCmtaK7
         7Fq4nsJoJFqqaloQGy2CBzCrYwLCoJWdRlm94Clm+S2A/n7/ZOj7+mtuj2MKfs5XUDQ9
         MQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5W2yVD4YDWpQ3CdxVHUW7qDBpRLK/GNpv3OQ8xCAesQ=;
        b=xymRjVhptu0bSD3BCooEnW0OL+96coLQz8ShEsmfsqaZ4AoCovrcm7PDT/S4eXPxCv
         BvC3Q3OH8ZyJJ72Jnbp6GWR420+WaU2l6iv63Vrw37qqv0BufFEr0lcEWVg29QIi8bU+
         2EKHIqiwhdrX7H+TMLyO586Nc3CAVKoFUoe82HuGgPc0fIMiniGo7exoBJVJu/D7SUC1
         0amiwdCZE/NAokfuRbFFeAgr7sjN33eiWNmJiWrHZwq4A1v+CqPaVvn27/3rgrHXCgqk
         zedP4qDY3pE0QrXV6h+Ew61dXgck2HG7HDyYz1uB1vCql+HPfzqXZ9vWFP7kDuClcGZB
         P8qw==
X-Gm-Message-State: ACrzQf0b2jAvq4iJAW4KXDBge2r1nLY/iKzT7qXr2KDU7xNsWZgFr8Hi
	QY6XGJbFlMXi/XJ+RYkJ9sw4Og==
X-Google-Smtp-Source: AMsMyM5UgSNrJdjJbaWkNmPYq6dn0dMCmkzxuRJCJIVsuSJ/GH354TzUrpT1mXY6Xoiz6vRA08LnyQ==
X-Received: by 2002:a5d:59c5:0:b0:236:cc8a:59fd with SMTP id v5-20020a5d59c5000000b00236cc8a59fdmr17239311wry.426.1667571267873;
        Fri, 04 Nov 2022 07:14:27 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6440-7fff-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6440:7fff:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id bj9-20020a0560001e0900b002365cd93d05sm3594512wrb.102.2022.11.04.07.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 07:14:27 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 04 Nov 2022 15:09:57 +0100
Subject: [PATCH v3 11/12] dt-bindings: display: mediatek: dpi: Add compatible for
 MediaTek MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v3-11-a803f2660127@baylibre.com>
References: <20220919-v3-0-a803f2660127@baylibre.com>
In-Reply-To: <20220919-v3-0-a803f2660127@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, stuart.lee@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>, mac.shen@mediatek.com,
 linux-phy@lists.infradead.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_141444_057665_780C310D 
X-CRM114-Status: UNSURE (   8.27  )
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

Add dt-binding documentation of dpi for MediaTek MT8195 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5bb23e97cf33..2c7ecef54986 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -24,6 +24,7 @@ properties:
       - mediatek,mt8183-dpi
       - mediatek,mt8186-dpi
       - mediatek,mt8192-dpi
+      - mediatek,mt8195-dpi
       - mediatek,mt8195-dp-intf
 
   reg:

-- 
b4 0.11.0-dev

