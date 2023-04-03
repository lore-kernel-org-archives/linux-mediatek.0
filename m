Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109DDC76188
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 19:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T50vLVbG2ABwfUlTpSJpYxSsSe8WTt2ADzn7FKCrPrc=; b=4P1ZalJkPH5OQPrcWvxy+mbYr8
	CqE5hmmUXGUguIV74/HWKJ9Xm7SkxffkH6cVlFoy5ULmn4z50JgNBLYpeR8jttBv9oHaxUH2yRONa
	y51uGtBEOAVOOtcZuqZoZdscflQRjPZ9SWKsJuvTOkBL9iMBe1BuQtXf6FrYUEZT+y2FC3qXc4KAp
	40rHdg00ekoV2F5bHHUeA+qsqxOe2vwiHmZRjIW5NmwLwPtYwsr4oMgbAXwFGBGGgYiGv6UNQrEQj
	isRK5lYT0OF2WJTbSovlD1xkl19BV8+EbokZ9Mq/VytcLunCPYETUMGyw5srPIOMAX4S60eKnTtlP
	dgrztz9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPhl-00GMYh-3D;
	Mon, 03 Apr 2023 19:19:02 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPhh-00GMV5-2r
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Apr 2023 19:18:59 +0000
Received: by mail-ed1-x534.google.com with SMTP id x3so121456246edb.10
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Apr 2023 12:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680549534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T50vLVbG2ABwfUlTpSJpYxSsSe8WTt2ADzn7FKCrPrc=;
        b=lxDkaT0emfLY1s6ASwAH+xPT1yl1OINFW3kEQzy5PxOvrSnFuNt0wX1voX3n3/V1hV
         y5/N6ZhPpWV/HQUrOoSd8uL+DsVe2441goDeqN0ehD5Qq0HNdmeOsasBHYYkWsqDVh3s
         HKElw/fVzdmX/RGxoJGn4K6m8O6oMhhfapJidAkBiwvi3QxmpcvuqYesrqm6zYT9FQaY
         YCDW1zbhf5HW0OAWy5POQIxYpw4SmrZ4ksgpqTZdFYPLmQ43dI9A98gNENk5uPF3GtdP
         zSs0FcMGyJ9t/AQnQ0sCuZGxmCyyG8DNgnjzRXvD9CRZHhmps86zfFIgrOjUYR1rHlux
         jeNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680549534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T50vLVbG2ABwfUlTpSJpYxSsSe8WTt2ADzn7FKCrPrc=;
        b=uZ9M4bc0X8DZ3+XjKeIZQRXqQLb/pCc+uKVwzvc+bkzOMU56/QITPeIO0C9LVqKn9o
         4z2Kyj1kxpOXHr6v4gTCGNQJ0gEkMaFkuwHPndV5R9b1v/rSvbXH/mRglg0Q7QLZ+/rv
         l46krQgL72AEtfSdTRlelY8Vxr6EqRl3Bep0nywd3GDWkRghgR+ZcQIh1CGNKpUHuHMk
         UMXT5KxWN5p8X1RdqgyjHLnBMG3bQJIeUNaOfIZi+Zfp/xjEnicDUDeadcesyUGY+htN
         AMaWifqtmG1VzM02QIkFhBH6txK8TX2SeZsFN3QQRSxO3sHWnCkYJv6crHBeC74vjz7Z
         O6jA==
X-Gm-Message-State: AAQBX9dHiDMQx0VhTpDLAPCIb7y6t2xXpVXCz3kPYaQPQgt6YPliEl5r
	9pYtOUBVIIK1I+sGdUyO2ixmVg==
X-Google-Smtp-Source: AKy350YBucBFpI7LWLV8I9pfg1VQ8D2Lt2FtPllMkqHAraFUGDE/STpHjDWLQK4w/9H5f/INQk23Lw==
X-Received: by 2002:a05:6402:604:b0:502:45e7:4139 with SMTP id n4-20020a056402060400b0050245e74139mr207649edv.37.1680549534219;
        Mon, 03 Apr 2023 12:18:54 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id n19-20020a509353000000b004c09527d62dsm5022999eda.30.2023.04.03.12.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 12:18:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] dt-bindings: usb: ti,j721e-usb: drop assigned-clocks
Date: Mon,  3 Apr 2023 21:18:49 +0200
Message-Id: <20230403191850.374839-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403191850.374839-1-krzysztof.kozlowski@linaro.org>
References: <20230403191850.374839-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_121857_944539_9AFEAA76 
X-CRM114-Status: UNSURE (   8.76  )
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

The meta schema from DT schema already defines assigned-clocks, so there
is no need for device schema to mention it at all.  There are also no
benefits of having it here.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
index fd36dd02fe74..95ff9791baea 100644
--- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
@@ -53,12 +53,6 @@ properties:
       VBUS pin of the SoC via a 1/3 voltage divider.
     type: boolean
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-parents:
-    maxItems: 1
-
   '#address-cells':
     const: 2
 
-- 
2.34.1


