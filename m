Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536DCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 22:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2r5U2Ex4e2h4OexMtp8APTGdcVDDBSeEkanGpYV2G3M=; b=04mlNiuTc0fr7t
	E1H+tFtPYNDu+R4KheXsQGn8rWJrIrhgYkWsHjkio/qDrCxUDtE7O/OF8lcka/HDhiuJSkWyOm94i
	stbgQSqesV3q85Gntt6YnhLGHErXd8Ea69yu/t2Fa0Uaphwb/5z6JB6CE7yJvWcPI1lyxQmm8vNGD
	Wsmvc4QpFO1IeFGrpg4zASjpPlcMqy0MLiou3FoRgcRam+SO8JLZWuTKWLHuFN28vteCgsSQNlDw2
	cHFiWamNm/oFwCW0Z8gQZ8HcE/1wDKhQfLFuc4DITZyP1bTQWkm0xD7KybgKYZJiU+McdLKgKojrC
	MH9OiRjCxtOiRTvxsKIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOoJL-00EHfp-TW; Mon, 28 Feb 2022 22:16:07 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOoJ9-00EHdK-JG; Mon, 28 Feb 2022 22:15:56 +0000
Received: by mail-oo1-f43.google.com with SMTP id
 n5-20020a4a9545000000b0031d45a442feso12807867ooi.3; 
 Mon, 28 Feb 2022 14:15:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OEmvWFYcUlvLI2qOQZZbyye8qQFK9MgvtHyOAXPOp8U=;
 b=j/mcTU3u47lIEYcs3wmORg/H93+wQfu7d80T7dhS0TBPpbMyeEyau6B1HjRBFnNd1X
 D54GLTiSdDg91eoZtifDPpz9LXXSxeUjdiAoW3yNZV0JgoWGgjei12PfDwL54Pv3wXdP
 8Vw1TJh+kNTSB7sKGLzyXOLE1r+SppsMW9IgLf4k9Hh5Y6azZngSu3ePSmL1ZxBm/okL
 +q2UjqKVtcZ45RFGQ2LGJ1AqlmX6QkRMnwMDa2W5UEAONHbrErPgKv8Gq+qRLjd4qlMr
 aoK27Dcti3aQizd3dhrYLi2EN13z3o88H5MLJ/T/a/ivxdLhGRiQIBwi+S9IflSkTphu
 HK1A==
X-Gm-Message-State: AOAM530ty2tAAdAs1XWBFF5MCPjZzuuJ9aIHSnuoWPxhi4FfaNJXbYWs
 Bz8X/xLlObMaUHHIYV3pWw==
X-Google-Smtp-Source: ABdhPJz03WhL44Cw8TDPnrAAhE5YNR7G6nXVzt9q331dU3Co2p6qYpvGwJfUqyb2mMaeRoSteXVOaw==
X-Received: by 2002:a4a:db95:0:b0:31c:23c8:554d with SMTP id
 s21-20020a4adb95000000b0031c23c8554dmr10094963oou.64.1646086554672; 
 Mon, 28 Feb 2022 14:15:54 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.googlemail.com with ESMTPSA id
 t1-20020a05687044c100b000cd7b642bedsm5027977oai.14.2022.02.28.14.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 14:15:54 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee.jones@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: Add compatibles for undocumented trivial syscons
Date: Mon, 28 Feb 2022 16:15:37 -0600
Message-Id: <20220228221537.1700071-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_141555_659179_B565AA35 
X-CRM114-Status: UNSURE (   8.69  )
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

'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc',
'mediatek,mt8135-pctl-a-syscfg', and 'mediatek,mt8135-pctl-b-syscfg' are
all used in DT binding examples and/or dts files, but are not
documented. Add them to syscon.yaml as they are all trivial cases.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index eeac1cbc5a17..29d4a97f7108 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -44,6 +44,10 @@ properties:
               - hisilicon,hi6220-sramctrl
               - hisilicon,pcie-sas-subctrl
               - hisilicon,peri-subctrl
+              - intel,lgm-syscon
+              - marvell,armada-3700-usb2-host-misc
+              - mediatek,mt8135-pctl-a-syscfg
+              - mediatek,mt8135-pctl-b-syscfg
               - microchip,sparx5-cpu-syscon
               - mstar,msc313-pmsleep
               - rockchip,px30-qos
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
