Return-Path: <SRS0=4Hoy=HZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39935C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 21:51:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C27F564EC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Feb 2021 21:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C27F564EC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iaYesjtvRITWiYKbxhMqPBWfLy/f0VOLJDkPcPN13YM=; b=vkD+XOHOjjwav/1+kjHPCWnKDc
	ggFc+bll24KNmljaUBYmoQUVRRi0nvxmOoec1Y2MrReDH8dMPYtRpmo92fZVUeU5b8pXIgYfqz3Yg
	euFfr5YSN/iRmiyfaRayVRsMD2QuXzIxWxVxFMDxKUnsEAW/dIOMb951ZCrn982HK4YFhj0gxDxfU
	jrq/6s61HPeJ9GJqsEcoWDfpm4HlQ0r4UuAbbiGJLL7Gx0qIVO5GW0ZwhclJwX+ph7vIxMFLLEgRz
	jIRBLdMTP3sCfDPmBVQFcd6BXP+XmvPnXMXyYXXbWU2BxJNR9V8SKFxD1qjFVT2xc2jvpJArPcpv1
	611tnt3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEfaA-00026V-PO; Tue, 23 Feb 2021 21:51:02 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEfa8-00025l-Ey
 for linux-mediatek@lists.infradead.org; Tue, 23 Feb 2021 21:51:01 +0000
Received: by mail-oi1-f178.google.com with SMTP id f3so215303oiw.13
 for <linux-mediatek@lists.infradead.org>; Tue, 23 Feb 2021 13:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AsR9ipt+b1mHYtmLjiSKpblxqFVh4LbdCrUVluojW2Q=;
 b=BltUhJbxeippcObY4k8yQG1yLiXq8c08sB7JXIe1EZbBGkQPd5pCH5+m/aYb6bMM+P
 rQoGa/n4tud6lITcnIA2KcxAdsZvqaJX5bOOqigEpTsqR3qKp6NMqwDZd62wii7wc9VN
 hl0dFufLQBVGbfrSbfSs7kUMh/UiwFrtNUznXPCDJ8jV+9cPSE6bWbKusQmxPLzia/yb
 sMfDJbkVf9Ik3unOxBcds9SawVENpl8EQ+DQNNVtaIC/mz+iIzk+VfvdQUnxwwCVhrlU
 s8ia5047eyqHXS1pXA/1wBzPBRjV33f8uhex3CPLWJ9Ovuq1rCHTbcfnQS89HWEx4+xT
 8faQ==
X-Gm-Message-State: AOAM530Dmkw1fPia0aYI3DRgmsGdNgSlhBjEHZc7tQA/oSWZxJEdFSwt
 MkPs7TvsMjBqZ99aE3IDpQ==
X-Google-Smtp-Source: ABdhPJwy7fsmg2yVC2MxWgcLyRFaNJiQxfoU7ly52FmudKmJznM3YDMN6gBOsgvWng4cpxYEOHkXaQ==
X-Received: by 2002:a05:6808:14d0:: with SMTP id
 f16mr601770oiw.56.1614117059629; 
 Tue, 23 Feb 2021 13:50:59 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id p26sm1444867ota.9.2021.02.23.13.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 13:50:59 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: display: mediatek,
 dpi: Convert to use graph schema
Date: Tue, 23 Feb 2021 15:50:57 -0600
Message-Id: <20210223215057.125708-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_165100_513529_9101BABD 
X-CRM114-Status: GOOD (  11.03  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Update the mediatek,dpi binding to use the graph schema. Missed
this one from the mass conversion since it's not part of drm-misc.

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: CK Hu <ck.hu@mediatek.com>
Cc: Jitao shi <jitao.shi@mediatek.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/mediatek/mediatek,dpi.yaml       | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 6cdb734c91a9..eb84b53cabb1 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -50,15 +50,10 @@ properties:
       - const: sleep
 
   port:
-    type: object
+    $ref: /schemas/graph.yaml#/properties/port
     description:
-      Output port node with endpoint definitions as described in
-      Documentation/devicetree/bindings/graph.txt. This port should be connected
-      to the input port of an attached HDMI or LVDS encoder chip.
-
-    properties:
-      endpoint:
-        type: object
+      Output port node. This port should be connected to the input port of an
+      attached HDMI or LVDS encoder chip.
 
 required:
   - compatible
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
