Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9297AC43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 16:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5W2yVD4YDWpQ3CdxVHUW7qDBpRLK/GNpv3OQ8xCAesQ=; b=3XW/mMqcsRnioN0SYCXzc7xPXk
	77UnXkPd/lTtBLUi/ykoCS7Nx1vhaOUu3pKS+4gcDjW6aPaEXdGOm7mh/oPL/nnTVi8E2GT7inoYp
	rzjxXwmmDLG0mRGz40+ufziZ1F+5IKVWnJ7F6mN33freLQn7mualnaa+esDER8U9UgSUKreGZzNKh
	2XWwk7k1m0eTl9k46uqWLRDRAj3ftLPdMUlY1wdWEI9KHjLfLGwGB014MYbszUj5ziZyP1jRSjZpX
	HNaQFl9taIGg09xQKguiQtWM9c4EI79Qmz/W5jNnm8m8mA4nPKzqVH6+EyhbnIlrA82MyU0x9GRb0
	KyI1iKwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojN9n-00FGSi-Tx; Fri, 14 Oct 2022 16:03:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojN9k-00FGKd-6X
	for linux-mediatek@bombadil.infradead.org; Fri, 14 Oct 2022 16:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5W2yVD4YDWpQ3CdxVHUW7qDBpRLK/GNpv3OQ8xCAesQ=; b=d9fAtXrgKmarfHQpKLds+sLmGs
	3Nbd4x9cnA4Y4ubqDz8IqsD0lz5qq5ArMeXZh5H6BbdU47DUJFj91CJIfraIBPTw2dXTXgE5aZbLD
	sWviyKsjg9FMYGA9XuBeicNqRtWGmot8wnHu5Sf7EXl9uXCROw+kFupvzUUGhADKdvwWhTn+1Uf5R
	lCXUpgmhXnvL8lgAkQOtkgoUCV/Z2BZQzqZlo5+4mUakKvqN65MPtM1lLWOx30q3DAMBH7VvkuVVd
	gaMCvikPyks+OF4/s/SkRM0NlqCo1Hp7DLWG2WhQqfjWjxfVAUfl9v+gzYg03Z8B1u/PIMihRUJCK
	bShyx/FQ==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojMU3-003RJp-3f
	for linux-mediatek@lists.infradead.org; Fri, 14 Oct 2022 15:20:26 +0000
Received: by mail-wr1-x434.google.com with SMTP id j7so8095354wrr.3
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Oct 2022 08:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5W2yVD4YDWpQ3CdxVHUW7qDBpRLK/GNpv3OQ8xCAesQ=;
        b=wdd/7aN7YhyT8sy0Wn7Mag45qih26IWdRYbT5Iw2wQ0ZJWbWLh1lhND7KddPc9m84b
         AZt82xojAp98dl7fArcn0k3wQxhoqknF8aTX1ZhUH/hv50S00H/MVzafj5z2u34JC3wZ
         +r4Ug1XI1ju772lSNkLc1Xmn0MGDpbwon7IyCu/JEzG/eRCyLnzvz1f0HZZSyMjWuPlr
         S9stoFaXkDAPz30zm12InbQLbXyN8wqGx7fTOCcr3UE15bpkMMJeu6wyvfeonSxz737y
         NL0EbvQeO3NufGmA0jubTXPFpkEhE3XrhSPgj8JqywzHvk45b1HhGqYdjG/D+7/WcJfq
         ZILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5W2yVD4YDWpQ3CdxVHUW7qDBpRLK/GNpv3OQ8xCAesQ=;
        b=frl/RgN8qpTI569i8YY5UYRJPc0CU6JHsZvrE7rJntINxBuQH9zHRKvumgek1SXBQ8
         IGDelhN+7kOKKXDTc2iUxME/7Im3tZZ2Mz3IBtV7BfbNcYYRYoI9mM25dUrlomAvjitO
         m3DnB3/A9qnjfCDtJ0A4HS/DlykUK3czYtIQH43V0ldRbDdXPqsNe24v0I30sc79Pe1z
         yS8M/SdzbRgGXwYYvj1ypC1TnF/ozbElLRs/kyiuhmcQ0+UBGPe9d8RARaDiFW82+lz+
         gJlOIj4maafUxUHzmGWQN9mKooH6mfI2nb6kXlF4Yxp4zBdkDWvnSrupfblgq+O2Yl/x
         rOGA==
X-Gm-Message-State: ACrzQf0iwOGzeWXm5YRaaNQcvUNtF4kOjy1IEkLLbM3eNQPn1G6m6UZK
	Qqv5AzC7NjbZ8PLif8tzcbdj6w==
X-Google-Smtp-Source: AMsMyM57zNuBSZSZskVONFl0D1EsJq67LXu5kElRP3jBck5MkzoVEBxigmx+zHaO7rTqRHHqajVoCQ==
X-Received: by 2002:a5d:47c5:0:b0:22e:6941:81eb with SMTP id o5-20020a5d47c5000000b0022e694181ebmr3733750wrc.408.1665760822143;
        Fri, 14 Oct 2022 08:20:22 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6241-7429-3074-96af-9642-0004.rev.sfr.net. [2a02:8440:6241:7429:3074:96af:9642:4])
        by smtp.gmail.com with ESMTPSA id z11-20020a05600c0a0b00b003c6bd91caa5sm2818223wmp.17.2022.10.14.08.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:20:21 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 14 Oct 2022 17:16:04 +0200
Subject: [PATCH v2 11/12] dt-bindings: display: mediatek: dpi: Add compatible for
 MediaTek MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v2-11-8419dcf4f09d@baylibre.com>
References: <20220919-v2-0-8419dcf4f09d@baylibre.com>
In-Reply-To: <20220919-v2-0-8419dcf4f09d@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jitao shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Guillaume Ranquet <granquet@baylibre.com>, stuart.lee@mediatek.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, mac.shen@mediatek.com, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_162023_461928_B8EDC9FB 
X-CRM114-Status: UNSURE (   7.39  )
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

