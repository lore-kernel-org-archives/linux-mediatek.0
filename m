Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D222CC52D7B
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Aug 2024 18:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeggRLrefKS4NRHp55eXF+21fQVTmgaEKucAb/25uG8=; b=rJLNpxEvEV898VBp6spvCtBAnu
	3jdVBYZdzIYi5FCNfMTRszct7VLVZ362jHESot1AwpWWyUSbsDQPVAgqv2idkmdnNPUMLdNM2erKv
	P+5md9cHbzJ7iOI46WIx9w1vf79hE2hOEKwSCk1JyQaqJEgWOBhCgGwL5N3/iYL9AFaSjvl+9SBJN
	d9UDT8KSjoJ0ELIlqF15GhOlCsUrlZ1jrx/cNrGtYbDdfCC+qIz6TNdiWyHzMrQ7Ph5xZL3f4ja0M
	LfEZ+/S/uToAK6i3VM6DxlrD67b2NGZZWjouutaSBOafkGSl4NMz49Np6n1XtJBNjWDu64xb51Dh+
	fyWL9khw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdD8j-0000000Fve2-257N;
	Sun, 11 Aug 2024 18:18:01 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdD86-0000000FvOq-1khH
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Aug 2024 18:17:24 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52f024f468bso4219971e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Aug 2024 11:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723400240; x=1724005040; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IeggRLrefKS4NRHp55eXF+21fQVTmgaEKucAb/25uG8=;
        b=ziHTBI2xuyZdq07RI4bMFKJ2Ugcx9g9H+kBmulHRrY7svDJJJ0AY0yZEt0qY8i2JGp
         G0WXLEsZySIvNkZ2C9mpxg5QgyiyJY+eJTQ0e0+s8UC8wHNd804zre/tvmB3Bq8T2G0h
         bEwsg6m5TQWGcDorzmGttFWmIAf2bU07cS73kghWPg/w4tNePo7uEWQBibSF6et2x28B
         B6VdOv56QNsUS10b4yaZw5LUFS4STl59zNNnCnDkjuQAbCbjml5c4vEvkQ8Nn7btwNnu
         aU/oTDGuI/QAsA1r974rijeqkR7KFW/Nd8bLlier2tLtZ3UBsNfCHG8Sc7fk9XRrzfo5
         iU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723400240; x=1724005040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IeggRLrefKS4NRHp55eXF+21fQVTmgaEKucAb/25uG8=;
        b=Wa4mzUgSS7SNaYGWxfnWEbKY10QBRfLsFiY68lKMkSm1C+xMZi2YLlME4oSZsPn0iS
         P/5FKmb1nqt4+BE2OZWCgqSHBY6U8UhM3x/mRkZq897dbWBegpxOQKaITMrVkKQ4u7EC
         Nt3/oZkTZ5IP0iDwAmZktiew5LFFq2matOJ/GBxxKFNEFQz4vRP39+N/44kzh+9PA0Nu
         +jjb7CYQUys5+vxx2WJakdCR9KCdoZ3inDiaSUQIo6HSsIsxmcZNaWM+uX3zxuKQyNDp
         7PVzeBO0S3dUAXCuVtGtZPcamiwzZtOilw3NAgBr8LZ+7WICwSLokIetpn9BfofqfKVE
         bHvw==
X-Forwarded-Encrypted: i=1; AJvYcCXZMQ/0nvWl8IraQP0aLaWWwgUTHmy5vZCDswAYFaVgYhpaDDc4KNknshw/aADcBq1ja5vm3TmjGNfMZ2ijY2lH2tTOR01A09gXm1k1a/cTdXao
X-Gm-Message-State: AOJu0YzTslCr7rSDrtc6J3Iuxi5fIm5jGHgbs+YNJPgZLrs19DrXs6U+
	roO2o4s+Z1K9DbHwnQC2gXfstPR60b0bt3FBSuhNURWPr9BYkWNUl/WCPySCXU7RXFjS99K8+UT
	e
X-Google-Smtp-Source: AGHT+IGo96lPHtsUXjiRmEnFORtSb+OG6u30XA7cbQkXT2T8/BFuRGLG4MYUDVs7QheieToXGlwKTg==
X-Received: by 2002:a05:6512:110d:b0:52e:f2a6:8e1a with SMTP id 2adb3069b0e04-530ee9d0b5bmr5672768e87.29.1723400240286;
        Sun, 11 Aug 2024 11:17:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a6032c1sm1610593a12.92.2024.08.11.11.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:17:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 11 Aug 2024 20:17:04 +0200
Subject: [PATCH 1/6] dt-bindings: serial: add missing
 "additionalProperties" on child nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240811-dt-bindings-serial-peripheral-props-v1-1-1dba258b7492@linaro.org>
References: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
In-Reply-To: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Daniel Kaehn <kaehndan@gmail.com>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=o1Pg+WYSU+1aP3K7rSMBYgVoWMnaQYMrTTQy4scWqrU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmuQAnOXoFWzTi2CdjfGUgn4ZzAkWR4980rKV/3
 sazBXuxtKyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrkAJwAKCRDBN2bmhouD
 17SED/4rdw923+Og8fvQ6box0oI2553Pq0Sy01E56fmyMW37SSXn72uzCc9LccCaq9xWSZsUpHa
 fGKKaRzDCArQZlxv+37ArKnHQZudrzWpvF5hU+PvVS0BwhaFdmcnay3X8u4D7HjbtY1zPl74MYE
 1vRbFIUvuomlKIgnkGtyqnS/qxhaKBSQhoo7QSy/c+1c7fYcBV1TWDfcN62O0mLPjfxxV2N3wMS
 IQsPCaUDtnDA4QxaORdzjUMrOVv0EsSdrlpn3cQBzG8GMyXM1bl9h5B5RU2lEa7dbiB1CdzuP5e
 Db1y2CN4fVQ77UFUoNz+YIfkmAKYkzLm6wcYRz9kxPiWu/ES6e0LhDOJl0EOQsixs4Yb3SF5oou
 MMemYJSH84VgCdaiQZNh/HpJq7awc5PDpD9NAxYNMvFE/UqWL70OGKBNNhuNRHtCQs96M2ibMNi
 IlmSDrBR6KXRWEnQJ8QJKXLoY0NL8wMR65VencMz1CZ5uV3N4PWs/UW0iPRJ4HTHYKn3HyJtsJb
 uY8ebPIDItug1xo4oUts4fmciO/Q4JKhli8C6ouFJvAfD2Fzc4RmphNm1Rc7jLwhUGtNfW4dbX7
 IVTs0ibDN/ne8F1QHDvrBcwq/2d+TGFLdn6+20WnjvTwRKkHqlDRnIQrtUXpaRkrPQLKlA8kXpn
 meevMgUeFiHveug==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_111722_496915_544C4E21 
X-CRM114-Status: GOOD (  11.64  )
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

All nodes need an explicit additionalProperties or unevaluatedProperties
unless a $ref has one that's false.  Add missing additionalProperties
for serial-attached devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This patch should probably go via Rob's Devicetree tree.
The context of the next patch depends on this one.
---
 Documentation/devicetree/bindings/serial/serial.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
index ffc9198ae214..40e05dd37826 100644
--- a/Documentation/devicetree/bindings/serial/serial.yaml
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -92,6 +92,7 @@ patternProperties:
     if:
       type: object
     then:
+      additionalProperties: true
       description:
         Serial attached devices shall be a child node of the host UART device
         the slave device is attached to. It is expected that the attached

-- 
2.43.0


