Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A2CC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 02:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRYDzS6yAt4cpvGVye2SW5vgcMntnZG/i/Ggtx20GY8=; b=XShKXEuM3XV2gVzizrFxnHfdvC
	mWuWBgv/ZLCrE/Imm4fxtvmEmU0YyDLOAsklD29JGb3XdszcWDUPDm/2HPVZE0rkOccFs2eou4wmX
	XxUEBOoYP47+E0/scYiBL9H1DZIwg6DE8kUj8f8Nm7h7IEgfWV3KOAY0XhP032e8R8Jul9gbw4ux1
	c4Navq8z/BnTf3EW5cudprXiqpUt1wgJ6dpA+HsnoDo4kdGaL09fPafmllGPLBT53hC/wWMJWncIg
	+GmDzpqeXADS2FUTsb1+0lGXeaS8ODjepbF3cDL8BpW1HLkRpjxiikl1ocs8hQGgEZgaQsYcHCiHJ
	NS8qMZbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum7k-006z9F-8v; Tue, 15 Nov 2022 02:56:32 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum5s-006yLm-DO
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 02:54:41 +0000
Received: by mail-ej1-x631.google.com with SMTP id f5so32933849ejc.5
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 18:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRYDzS6yAt4cpvGVye2SW5vgcMntnZG/i/Ggtx20GY8=;
        b=EdE8bFuG4EphbFKpcxdIIfm3ak/iOs7F6ye5Bw0bJUAMo88bMnH11/qvrugOAb0cLJ
         /8JttmWZG+cKt4QUAgJJ8Q8SHaInulLWvMW6KaIImNUEmVu+k/yR8haNYmvu71pxC6E0
         foS3sUTx6outGy/xCAtIryaY0bjeY64ogC9UuYet4q1kHfq8nEt6f2gkYlGqSDJY0/Wd
         RaU2nVc6RhuSy2gTRhkVbYNfaVF0J5d976lmTLy0BtAKvmGqBTYZFqRxyMLYhftYTB6M
         zrlWD1VNaVIuCBMowc7TKbtYCzBdfgbW/IgrERUC6ePilpBkG1ET56YiluIrKVUmBYLN
         e+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRYDzS6yAt4cpvGVye2SW5vgcMntnZG/i/Ggtx20GY8=;
        b=7EVNkn3B78rqGpU1gtAVvfmDMT97w//08A5As/yh9wZx0F/1LClcicMLOrD7geiRup
         27+8iZlUvMDVufLjqGp4t1D4oRO4qEsDnwH5q0v4qbKqjpi8631dVWfxwflQjp083/k0
         8Yltk5fElEZEcEsPqeT+9j9LiRnTX7qta6zD0CabIYPzGZbBtUA2S4js0g0u1LuXBogk
         +ONLpGIkXNLaRf0eydddgiUsRFdTnVRpBk5+5mijxtxskQegUZcqlXeyija9B55ghGy3
         4au8+fP6uYyikj1eWVYFI0IPS56KPJ3qYw8vclbP8AYHSfsdwnorbR2pk8djEpzwzmZ5
         WJJw==
X-Gm-Message-State: ANoB5pmkZDHFT+2yrDkd7U1M4NtmVzvePnqTO4GniOGaHFGuZTmLapra
	AHR5CrabaJhZQ36N1T1wqXt0f06Yci4sm7LM
X-Google-Smtp-Source: AA0mqf582fgL1+vzC2joPQG/FmqgK3d7CgczhTfJbJeR1vCerfkmq+R4+r8ZixBzOGX3gC+jqC9F0Q==
X-Received: by 2002:a17:906:4a0f:b0:7a2:36c7:31eb with SMTP id w15-20020a1709064a0f00b007a236c731ebmr11503557eju.491.1668480874002;
        Mon, 14 Nov 2022 18:54:34 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d9a0d0cbcsm4861177ejf.72.2022.11.14.18.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 18:54:33 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 06/15] dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
Date: Tue, 15 Nov 2022 03:54:12 +0100
Message-Id: <20221115025421.59847-7-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115025421.59847-1-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_185436_508910_3C027587 
X-CRM114-Status: UNSURE (   8.60  )
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

From: Fabien Parent <fparent@baylibre.com>

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 939623867a646..3b92725bbc99b 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -34,6 +34,7 @@ properties:
           - mediatek,mt8188-xhci
           - mediatek,mt8192-xhci
           - mediatek,mt8195-xhci
+          - mediatek,mt8365-xhci
       - const: mediatek,mtk-xhci
 
   reg:
-- 
2.38.1


