Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50E2C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OISVtpQdJwXw9SRc0/7pEcw0tsOW4ljXKAMzHzxjrTE=; b=mR9TO7vuM+nxdh
	lTVKtiiACVFZlXf9Rmt7+mNexWkfF0n+c5l8dJfjnR5inJG8ShPXidfZN4+Wu7KUKGHy80jmsi+jE
	ZQDZ9YdZu2LqljctdsQU/qGfMnmIllGGo0QsXn7ZnqLQ0R8YBMGiRv5ukfWAkZm2MF5+MbhEkpOiF
	tgEElFF3+oazkW6459QkGH/HiRplEOgzCBr+KK3+/tNBwSsXQE5iHBSarizi21R7PC0J1Nl4p6rk5
	JUc9dIxvpB8orsqZB7HRA/9/LkNFv0XYwtv2nGZPzJK+lo9+iD2fVTXSF/GuarOPyIhOY+1G/wjAE
	zgcDGyxa94jajsTx9iCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLSh-00Egy2-7y; Tue, 26 Apr 2022 13:42:39 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLRu-00EgVi-FK
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:41:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id m62so594844wme.5
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXQbkkr1OF+Ro+dWXJqCAX6WABW7vUg3V8zjyeYbcCY=;
 b=x6zFqf+/EmVz0TvduZBvJRSfkSVefrxagUAWXYZ0+kEwhEkh+cUuE6WBr5+Xi11Weo
 XharkEOrZUMOBUft5Pv+xdS/UaSk/wc614P6T+6Cb/KTf7l0/qDb6pR4M+CoiEBiVD6d
 4JBsW0uyko9MjgeHfrkjb0WX6urHDMz5KD7Z1P5fL5srgFIwtNGepM8/NXuSRm6nijje
 ebuZqO1/tuUI/CfGb1zqRXbYJUkKNndqsC+WdAzORXjojkONvwblAOxJeIUHTj6L9QHc
 /Sd9AI+osICH/ENT85KECJkgchRVTqu7Jbz39RY8FINgdGBSVGEGH27CWRLxSd4msMcE
 IUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXQbkkr1OF+Ro+dWXJqCAX6WABW7vUg3V8zjyeYbcCY=;
 b=Gf5aJc5yW9WF/k68YHpIxfhhe5L5hc1+IxCekOnYlkvNg44pCFuBH5nA1AcJTfgrHq
 uERNLSIiKfSmi4P2Rquua5UwyXse/gWc5PY685iZgXUiYPCa1Du7dXuNUHGuA2Ou5b/z
 Xs2v08ZW/IaqMsnMyQCPXuXwKpqlUQ11I+MEqhxr/YsCjed7eykLoBUXZq6GyjTlcrM8
 UE5B4u0V87ICcuBrYFs3x7EImGt/58qI+YwJ2YZACbUeOCt3oDUUp3ngLkiTU8D0+MVy
 IMjNIU7eDvL9Oj7q8WE4mfA/dh86SnsE+5aE4zNvTdvm+cqe4wYo6e/dr7yEBVpjPbYD
 yf0g==
X-Gm-Message-State: AOAM530KJW+KKW4T4kpPEeDKENc4sKjvUyosgLGMtVHTFL+YlgEfc6rP
 rEw5IzYNJD80/Ue+FAiJWaBOJA==
X-Google-Smtp-Source: ABdhPJwjCz5bSKe6Ekot1VUMdiUvbf6MQuP6zLDwMQtDT48tOMws/2TXKGP3aFcjlclS3xlYidSiZQ==
X-Received: by 2002:a7b:c341:0:b0:37b:c619:c9f4 with SMTP id
 l1-20020a7bc341000000b0037bc619c9f4mr30559500wmj.38.1650980507577; 
 Tue, 26 Apr 2022 06:41:47 -0700 (PDT)
Received: from radium.lan ([88.160.162.107]) by smtp.gmail.com with ESMTPSA id
 b6-20020adfd1c6000000b0020aac8a9946sm13628475wrd.47.2022.04.26.06.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:41:47 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: usb: mediatek,
 mtu3: add binding for MT8195 SoC
Date: Tue, 26 Apr 2022 15:40:59 +0200
Message-Id: <20220426134106.242353-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426134106.242353-1-fparent@baylibre.com>
References: <20220426134106.242353-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_064150_543795_F0B7AB51 
X-CRM114-Status: UNSURE (   9.96  )
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

Add binding to support the mtu3 driver on the MT8195 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index df766f8de872..37b02a841dc4 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -25,6 +25,7 @@ properties:
           - mediatek,mt8173-mtu3
           - mediatek,mt8183-mtu3
           - mediatek,mt8192-mtu3
+          - mediatek,mt8195-mtu3
       - const: mediatek,mtu3
 
   reg:
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
