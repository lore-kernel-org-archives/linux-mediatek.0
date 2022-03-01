Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D73C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 21:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SwUvSEaGCMMMw6NRdSqCo+ldK57wYvdUtobi48Trs0k=; b=gkXq0cj7PAteHv
	EXIGy0CDv0/6BZopzX2cG1664TwsxhKA8mjR0qMB8aKaEJ7oGI55XdMLfn1IdXFb041jXSNcTQyQh
	WeSJ7luYuHQvoa2dRUCLBPW5oVEi7xZmVyRigVhQGTYt6fsqWMu7DKWJASFXPXGDHpW8k7bCivAVS
	FXUSQkDEzTc6WvyS2hvrW6a6qYTZZE7M8WVdaosZyDLl++9FEAb9iHqVmubXFLeYDmmXsfZGHgJeb
	n5ddHM8EBtLSggcJm5rHu+zi//CaVqH2IttCT9WqD9m9aGDYQOcj2kxPezu/9Xt1O2BYFO0kLl34H
	1f6/URq4tedukUbiukyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP9yp-000cMF-TT; Tue, 01 Mar 2022 21:24:23 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP9yd-000cJK-OQ; Tue, 01 Mar 2022 21:24:13 +0000
Received: by mail-oi1-f172.google.com with SMTP id j2so17384979oie.7;
 Tue, 01 Mar 2022 13:24:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H5jfpYzdGFwqse4FWUnR7wwo36jxF9lnZflDBC+WReE=;
 b=iZjRXqJJHgd/1vd/aRmYy4LePdZ4/yXhn94kTH/FY8llOllVKJE0oj0AMTJwgYoK9D
 0son+eBzXjkxGyBr67MoPdXlhjLcbG3F7J7DXRbIEcasfKqWDTMSGf+nSMyT67CoLopG
 b5H2+tvwMz0P1AzE78l2tHDiSpCYmFgDDaZgRRhj1qbY05/7cw4O9d9/AtshSob9Aw8w
 6fNJ3DbpoJ4R7WC/ReW34jf6FtqgeBDrT5MBtgiKq6LHoKvnmajoOjDKc+xqQbh/hvxC
 eMgcVwEPffYlwACWXUi1gs/CXp7JnECW7JUaMcu0VMmZmO5dU6EUao3FmnhdqlR5tSol
 4Gfg==
X-Gm-Message-State: AOAM532xR17NxoID928dLyGOAieHoTFzyrwRCHfRbMMg9PhG7j9VoriQ
 wd7/jSAbCf64v72kqgQxLw==
X-Google-Smtp-Source: ABdhPJzmSm1l9KeZ7xin3mM3VRpjOgzsfhTJVT5XJXunHLlw3L7+E8CSBQCNd27nsxA6+jJBbAA/5A==
X-Received: by 2002:a05:6808:220d:b0:2d4:99cb:3849 with SMTP id
 bd13-20020a056808220d00b002d499cb3849mr15214493oib.63.1646169848201; 
 Tue, 01 Mar 2022 13:24:08 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.googlemail.com with ESMTPSA id
 x9-20020a9d6d89000000b005af61bd7e93sm6959942otp.23.2022.03.01.13.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 13:24:07 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Leilk Liu <leilk.liu@mediatek.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] spi: dt-bindings: mediatek: Set min size for 'mediatek,
 pad-select'
Date: Tue,  1 Mar 2022 15:23:57 -0600
Message-Id: <20220301212358.1887668-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_132411_801436_9ABAD88B 
X-CRM114-Status: UNSURE (   9.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The minimum array length defaults to the same size as the maximum. For
'mediatek,pad-select', the example has a length of 2 and in-tree .dts
files have a length of 1, but the schema says the length must be 4.

There's currently no warning in the example because the schema fixups
are not handling this case correctly.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index bfa44acb1bdd..ac9ff12ae27a 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -62,6 +62,7 @@ properties:
 
   mediatek,pad-select:
     $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
     maxItems: 4
     items:
       enum: [0, 1, 2, 3]
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
