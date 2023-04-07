Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E870CC77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 10:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJjfak4UG2kt7LD+AoFzMT7Gsf1sr+ZsaQfW8YlBLvI=; b=uN9eYtYZCX3XSexNEuVpbnay4S
	JX9UStkLgsWVANufqczXxpbRSmnvDVGLy994eNHU/WGyvo+wtp56fNrj/qoWr5Xpobhr6mceoL+D9
	TSQKggMqL2zjywN3kbgNW/on3JGoTEISxIDuP9wV8SCo8wvXScWPOrGHI599A3zHdxXVAyFYw2otL
	KVkGScAhOPGdX1DS1ff8fZIB7aUaDYhSSJUzcWZ1xXR9rIcYt0cZ4FgeO8BBgNpmHYm5RXvEpAQD9
	Mw03QcbLcBk0IAjUZ2GIL4aDlw3dXs4h7hMG8cX12BxgpKRIlvQ+PHj7iJZOPi6Chh/UuwQtSP+cg
	Mzw5x3Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkjAL-009m5Q-30;
	Fri, 07 Apr 2023 10:17:57 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkiAa-009cv8-0F
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 09:14:09 +0000
Received: by mail-wm1-f49.google.com with SMTP id o32so23731227wms.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 02:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680858845; x=1683450845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJjfak4UG2kt7LD+AoFzMT7Gsf1sr+ZsaQfW8YlBLvI=;
        b=OajeO3O/qXkxLZpoot1SLLIdYXgjV4BiDAPRlXxnMUldzeW+b3H4YrsRw/xCLsZUEl
         LROCs5z2IY1AyERqEUT7Maqm3o/ajKCprSieO9pWzSMTnLXoejiI+DplNq7hdgdjOB4Q
         CxXyr0M80n8tpJ7ZyraoX7qqqD7q58C+Ej1xjeKJ1QqeqLuhpf3CoG/1JyL3b/NBCse0
         nuwaZywuBzg17T2/Whx/sHQ4DApT6fOJl/2l3wKyo6ecUtLD24D3zmHUOl191RngKY6p
         UzopT/Ky+wYfCLK310bSQ9pdOJdU5eqycfsBA9TmVeGdfAhYhWT85XGyxCtAH5YwO8Ia
         Fmew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680858845; x=1683450845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yJjfak4UG2kt7LD+AoFzMT7Gsf1sr+ZsaQfW8YlBLvI=;
        b=BfMpP5qHNj6dxDrQEn2LwPkmr1KNPgwHlSosXphyygumkApwczjqjGYK/OlFMf1H5R
         3Yo0cgCH2tr2P6RXbTQ7QuFhQ6BieTt4vbvrazpSXsKsJMOiOWnFH+0/nxTgyutaCrCN
         gsc1UYH0OJkLAUw8AcGLNCViVZOvOT52tEPT+qmGuC+ndJ2XkO1pYplEIFTxLhqByuoO
         bOWVyi9VLiFu6o2buPGLn5isHfR+MvcUGDeOTfiPfMUAZKRaqGSZH3IxstmcLNaTuBbM
         cRhTj1kjGqjOIMs+QqKiZwHJ5I3tO82uUJzTAO4ZxhEWgJdK73+/zejhy4YUXGGyXizj
         3Dfg==
X-Gm-Message-State: AAQBX9cRLiY9W36Qf6rdKPHufU/cgwpC9ZBnPcldDPNry1Llm29zulk2
	iCi2eoPG9bvcjEDw8aiNDRCSzA==
X-Google-Smtp-Source: AKy350YRyyblA2ED1NB7dgg4zlXhQ/NwohrnxiB+9oAsMQm2YpP5CEal0pHG1lm2ErKnHopqrmnnVA==
X-Received: by 2002:a7b:c00c:0:b0:3f0:3d47:2cbe with SMTP id c12-20020a7bc00c000000b003f03d472cbemr829714wmb.10.1680858845224;
        Fri, 07 Apr 2023 02:14:05 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id k22-20020a7bc416000000b003f04f0c5a6fsm4026429wmi.26.2023.04.07.02.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 02:14:04 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 11:13:52 +0200
Subject: [PATCH v2 2/3] dt-bindings: memory-controllers:
 mediatek,smi-common: add mt8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230407-smi-driver-v2-2-8da6683cdb5c@baylibre.com>
References: <20230407-smi-driver-v2-0-8da6683cdb5c@baylibre.com>
In-Reply-To: <20230407-smi-driver-v2-0-8da6683cdb5c@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=vTUD/c9kbSLzmx+cLlLgYeDYjimwFLetURuSQCdLVkc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkL97ZTwWW1lBNlbsl6zFLUXT27WoZqxh+yur5qJw0
 7/uB5feJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC/e2QAKCRArRkmdfjHURXeHD/
 4jwJ2NkMaaZkG4IPOWz9qEdPzHJectYFYU41nxo17Hmcufv89qEjOxLUpJ9G7UZ15QjdvkdqyNkV7e
 qOCjFiG9cwtUfyeoo5A9PEydCtRhOS4W+hmKks0UaMRQyXIXFCcG6j7IOnbmNgQ9+JQr/aurfrsCT8
 T43u6aNNSg0yB+DvFpmxsXkzkMbUFaxk6d5gWfMXOrqwNnxUK/SQiCeamM2yBrTQrhONG6TVFjONtW
 crV7NQXnIzCabu9QdykM7hxW7YTxhFAouZMtys7ZuZ9/Im9ZY9J1jGea1gu/YgouYB222VVxrc/vza
 e983I/+wub1e3fZmzfWrPRwb3E3ttj9teoVJo1SDVv85gazMCKqfouA3S2k3KYuSs55s2ByiPhKp/Z
 RE5wtY/V4Rfs/CjXfodePtSoUzr9NQYSxR8Z9cM9P5Mb+OWYZpldKSkOf1wBzJt105p9zxf+DaLUM1
 qqlWVgKu5UL2RwboCTznrfXsufgvYTLsGKdu6Ze4VKEs4B52zKNHvirTh0aBcJgxlsQ7Bwmw1FvpAv
 tknrTYi1A+fH6hIvmk7alYqLMsEGSHI+aElFiNMkgHUlgv3nP6dpbMQFKZbsV6f5DSiL6vVKzM/nwW
 o7Xri3hB7zVWSoPT9MD/UzJ28MIjVq/FSVx24xhAwIgJtN72eu+gq2mJH+AA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_021408_109995_9B74C02A 
X-CRM114-Status: UNSURE (   8.46  )
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

Add binding description for mediatek,mt8365-smi-common

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/memory-controllers/mediatek,smi-common.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index a8fda30cccbb..2f36ac23604c 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -43,6 +43,7 @@ properties:
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
           - mediatek,mt8195-smi-sub-common
+          - mediatek,mt8365-smi-common
 
       - description: for mt7623
         items:
@@ -133,6 +134,7 @@ allOf:
             - mediatek,mt8192-smi-common
             - mediatek,mt8195-smi-common-vdo
             - mediatek,mt8195-smi-common-vpp
+            - mediatek,mt8365-smi-common
 
     then:
       properties:

-- 
2.25.1


