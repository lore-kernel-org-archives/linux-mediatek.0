Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1179EC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 10:52:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A482764E77
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 10:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A482764E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K4/y1jbygWpvhcE8+BtEtXxE0ptuAOd7LBOkCo8WC4Y=; b=Sberbyu1Al/vm6zRAxhz2vPIBw
	15z6L+2olBC+vWMazX/ugWwUnCkwO39nQuhogmRVoEP3jD4mkjSscnRbvb+0lv2eqc9I8j67ATlXx
	a6+AdLS+ffNhU5hh5j2QBICYCmue8RTFLN+D8kMtIShl6EDAjTsmiIMMfZTSzgjz/g5kJMNFQBjuZ
	Ubqq5GbghrfiyG4OnInQqQBuezLBXzOVvaL7KvqmlGEbCeUbOTEVz3napg+ESCTuNRACfESm5KC6J
	aDj5W+i7x9l95i5KXWt+n9bowTMey49pdocwleXyyp6Q7X1IaE+S2nZ84h/CoLQKd4fvjRBDmB97K
	5uPE9ZZw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLkpt-00FZX0-GN; Mon, 15 Mar 2021 10:52:33 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLkn3-00FYle-9h
 for linux-mediatek@lists.infradead.org; Mon, 15 Mar 2021 10:49:39 +0000
Received: by mail-pf1-x435.google.com with SMTP id d21so266578pfn.1
 for <linux-mediatek@lists.infradead.org>; Mon, 15 Mar 2021 03:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DhxSzlXHtGlfEeBFDHzLfSiaE4UuFtHOZg5BLqDfKGQ=;
 b=h5wxAM7hyMHc11zgLkRJWZG0jSomLKZxjPxdytbduWCYJiOTQpUADHNXaMsuso0fcJ
 WAVBNfxAu4pcFVLC1R5Pe/5BeHisZfTyCv2D+M2DVpJfu3ua4Oi9EtxX794WalARDSsk
 /hwk/IGJ+Fm5X4CA3ENmF5itjQ9LiZBedBLco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DhxSzlXHtGlfEeBFDHzLfSiaE4UuFtHOZg5BLqDfKGQ=;
 b=MnxGSauOMsTJ9q+q0MSHJ9MWU1nN+5el//Xo+H0//Lymt+jtHE6I7GQyHPO/k8O7H4
 polV796HcPb//OWg6neyJTtlY3Wbc57BJIyHGhJNjbW11fulTmlHdt2ZNmJJJGftqvkX
 bx4vujWVTbMsnIVD3zcM4gXvhhc+lRryyDB8AXgWqWIfLeD5zd14P271hvuHdB+dNU+K
 c8grqjbR33oIfF6zRcaPldNR9OzjSacpF/vIM+9V+/ofILpbmQYT2RHqQe78ZDJCWsv3
 S9PySIhE7B0tBi1yCilF1Ou846mj5KiquCZ7d24IWAPtvobUkIeol2QuA8VdtPUsKWVO
 8rcw==
X-Gm-Message-State: AOAM531n0yEaYPqQswF7iPIZPYJOlmqsrrvKTIqp0vjVAB9zrjB7QdGT
 FhisQ4wN3RGOzLBZ4Pcbiw6jCA==
X-Google-Smtp-Source: ABdhPJxiPBCV/qAXEBni+f8RFql0OIpLXQ7R8q8cJ/NXIl5z6NNYkjPBkxamX5CJqsbw88pK4mKGNA==
X-Received: by 2002:a05:6a00:16c7:b029:1b6:68a6:985a with SMTP id
 l7-20020a056a0016c7b02901b668a6985amr23948626pfc.44.1615805375030; 
 Mon, 15 Mar 2021 03:49:35 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:89b7:339b:c097:5ebb])
 by smtp.gmail.com with ESMTPSA id s19sm12906201pfh.168.2021.03.15.03.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 03:49:34 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Ho <Ben.Ho@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-damu
Date: Mon, 15 Mar 2021 18:49:29 +0800
Message-Id: <20210315104930.1087142-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_104937_701538_F27A6A87 
X-CRM114-Status: UNSURE (   8.52  )
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

mt8183-kukui-jacuzzi-damu board also known as ASUS Chromebook Flip CM3,
using mediatek mt8183 SoC.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 93b3bdf6eaeb..a86716cdd408 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -125,6 +125,10 @@ properties:
               - google,krane-sku176
           - const: google,krane
           - const: mediatek,mt8183
+      - description: Google Damu (ASUS Chromebook Flip CM3)
+        items:
+          - const: google,damu
+          - const: mediatek,mt8183
 
 additionalProperties: true
 
-- 
2.31.0.rc2.261.g7f71774620-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
