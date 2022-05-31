Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18148C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9jm6n8WmzNJLzolujJAya2ieIhaKHJNqi1U+VbzK8vY=; b=J2Xd9vvJVI6m0E
	+RTCW22rIQ/nL52R55BYBkQDJIeFdcLX1q6s3MUcUHueOdVrL5zJ4+kXg2gko3jsLGvVSJLtNBi5y
	e89vORtodDXK1bMl4dHDxr44jQUFgXl8ibiprW5e57LL22T/EUzijnRbs0kyRMyNkjveqwBgp4yFm
	ezOXVb81yf3fjB7NaQp3yPjGvKHbZ7qe/QLiw/lmfdxPFH9e0+8Z1fTHdpHdW8NmcygamY8Zwyq9A
	b24h6wY2Rqkk17GCTeMrW69DM3YsiRxrBT0Dk+sz0MdxNpAtaUHsOeqc3RcF8ggstclqp13fpPIsA
	1DcsfehiGI2vFUyo7WZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0Ji-00AYgR-3p; Tue, 31 May 2022 11:45:42 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw0Jd-00AYdz-Vt
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 11:45:40 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q7so7351810wrg.5
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 04:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m7wMZQlqIVLxhzJ4d1t/ELkzaXc9kr5ySRrjRBJot3E=;
        b=SGhJnZz0e2Odbkv884INRKwNwnjTSyzmQ+ewY47ETUW1pGmWomFBE5igGYmCZIrnJZ
         766uTQ0g81Z8kZ9qQjDpa8eKFCQ0lgvUofA5hlqAjFdXvJzz5XLtoeIX/+W5nKerLOAx
         nIs19QVBXD2CzaVwHj0ZSrtKXNRs8FiaTA2zcbQaZduEbYl8X1pN43TSOAk+Boj0zd6W
         jKeqOqAEkxL3Kp4J3Dh97veJm/82yN3t87/CTAPqLY+GNpYxfAAMgrRNBnhhjCnjMlZd
         Es+Zp9ARBC2GHoywC4RkW/1ByOZTupcZndlU9elkwJun8uAmiOGZo9natKlk7kn1uyYn
         sexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m7wMZQlqIVLxhzJ4d1t/ELkzaXc9kr5ySRrjRBJot3E=;
        b=l2lWfz8Rnr9MsYtjcCZxw10RDdN/LxCKMPYnBOmsRIOK99RRFcM7YrIbeG/uHwS93q
         EfN09WvSEYxNruciFpPXMkYIz5VDbwy4AhI/L7ipyI/2ggYcuq2XXocSnkDeAeu2znR9
         Y0Yb7ctxI7Rs3Y++oonAVKoH950DRe6bkbwcvSAkiAeawZRvPWrnw6evyDKmWDS3Smrq
         rPLUW739wZ15jLXHjKgFdiIixfoFtqSR3pUNueHUWASWVgUZ2rEb21x1yc3gm3YSLtG+
         Y7PJfkXUgFjdjf1Lch9FhRY1QNLEQYUW9xTQlVisWPXMLcv2cZZkPgwn9fQ3jws8Xr7/
         8NEQ==
X-Gm-Message-State: AOAM531wWkdXQAJH1asDhSUNWFpSjgOAqNaFlHmvGaBawcGHM1MzOhtf
	hKoUC+Ve86hh+Xwuu0RsblpuCA==
X-Google-Smtp-Source: ABdhPJzaigv2LfXPVBVdkqcThmw+HR5X3hxrRPPBc8aVHnRmWua+xDAK+a8kKwJwCgT+2Qc7sfGc8g==
X-Received: by 2002:a05:6000:2cd:b0:20f:d035:84f8 with SMTP id o13-20020a05600002cd00b0020fd03584f8mr38402854wry.263.1653997535368;
        Tue, 31 May 2022 04:45:35 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id e15-20020a056000178f00b002102f2fac37sm7695660wrg.51.2022.05.31.04.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 04:45:34 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/2] dt-bindings: usb: mediatek,mtu3: add binding for MT8195 SoC
Date: Tue, 31 May 2022 13:45:25 +0200
Message-Id: <20220531114526.144275-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_044538_286874_D0FDEDBC 
X-CRM114-Status: UNSURE (   9.72  )
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
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
