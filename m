Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA70C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:42:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65406610EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65406610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a5awTBUaJMJ2FNB8+7O3kkEFIVdLujWnsqYPQfJ+CsA=; b=SUZpg+UcAvjalRiIZMQlas5Qn
	pdXJJq0uneaoEOaPnshJ3/4uvPj1iXxL2xgGETbuu3kAyhKZa/neO2h4xJcA2wczUZzrk8VknNYN5
	/RSNrajfSLfu4FQhO5PUgJYqH7SWKBW0aEaK42ogNIaAsu/R+8vpteQdU268SFsmU5iojBnNhFX1C
	TPT2EtSwnNdUtwRXxlJeN6eA/+ABZ0lS86qTWfZmEfeboQgcYQv1SWIe8KszkQdy9HvLVNPydU7On
	MIg8P+xs2ou6eUIUO4kLJVVn8Z2NzDA6xyrhY9fxUmAScmynUI63hER4Hg39z3oVvUXeJaW73LXVA
	d01bNHNHQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXRXW-002oiP-Vm; Fri, 16 Apr 2021 16:41:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRWp-002oaO-9f
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 16:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=vzcQwijJhfY7OpfvhBJPOdOpXaIv6ebJi2ScpoILz7g=; b=dRnisNEMv2NmWScDT3L4G6BE4C
 HstyI5eeZZk2E/DJIC62RRysLKbe39sR+WyHF3LhZ7+j1zptTPK+7OmUYgMWPeM0SXwGFzlpkulOF
 VPrVfPrWank0anodyxteiAOk4p8ziHRpTjg230Rt4KKGtO0GwHW2PU/KlRtuWFzJuMphLBEVyr6Es
 0D4AmxSN1lUrrn+teJbh1t+nGwetqDmRDfSBdW4IB47y4jnKemYfDK2EVhX8fn93Eko5taLAHNE0H
 WP1yqH/FcduT5E/ywo3DnRpdEkFSlRfoWaNS/4Ldj9bvcssLmB0mSWuOZyhgjVaFMAl0HoIMPTRmu
 c9L996nQ==;
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRWk-009YxF-8H
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 16:41:10 +0000
Received: by mail-pg1-x52d.google.com with SMTP id j32so4797037pgm.6
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Apr 2021 09:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vzcQwijJhfY7OpfvhBJPOdOpXaIv6ebJi2ScpoILz7g=;
 b=PHbuQvOJAqlLg3IDRJ/vUPfugXYBoCBVhndXgCkWJtDPPSxSbeE7zgKRHPtw9XTPVR
 U+nGFHJ8d/HjRZhUNqzBvYSW8ANQDQ2XJH3NQ92El4oeo3eOkuaG1RdnNUI0kM4+49Er
 vpfugcssifS5tZ7S6J9ISCL8p8sdh9bOXp5Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vzcQwijJhfY7OpfvhBJPOdOpXaIv6ebJi2ScpoILz7g=;
 b=OjVT1Dd38zH+AMSegc/AxQjCFjwPgMj3J4m9AGl0wgzxtRHmKsAHO1/6WSPEuz2B2v
 YCb2tJBbxvSUBfDdZ4Oj9InPwl5tg3SQeLBDMrkEaBYDSYMSsU7gmo6EQ2tHDHTMn4Vd
 lx8mB9+bp4il6VsWdxRbCwqjuQGjJus4LCG/tb3xonMtpFltxlYjooo/VCVly2fLqfl0
 d4QHvgel09QNfyzoG/AuNOmxvCNLPxrWx8Yd01X8TUAhjS+ANBEwfrcEgh3xEAYYQGXA
 a6qrHbQlid2KQXaehBoEVWocjspgOcvSPsosaoiv3h7Y1JcnnPOK8DbrBGUcLETbK7lq
 cf5g==
X-Gm-Message-State: AOAM530pyMPALgtT4sbuCH7xt42LS85JEdYctIqIAEq83Nm/lfnuI7Pt
 E75216P5ROlR5Hq/gW1La90ReiOL98+ysg==
X-Google-Smtp-Source: ABdhPJxUh/mtVkeY7xRtwh9IW1IBjcLiEAJh0wutc9cPsIFSvErkHlC647yq4IzxXMn86frujypE4A==
X-Received: by 2002:a05:6a00:1354:b029:241:91b9:75b3 with SMTP id
 k20-20020a056a001354b029024191b975b3mr8547393pfu.5.1618591263275; 
 Fri, 16 Apr 2021 09:41:03 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ccd5:218f:365:b90f])
 by smtp.gmail.com with ESMTPSA id g14sm6187186pjh.28.2021.04.16.09.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 09:41:02 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v2 3/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-burnet
Date: Sat, 17 Apr 2021 00:40:50 +0800
Message-Id: <20210416164055.3223088-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416164055.3223088-1-hsinyi@chromium.org>
References: <20210416164055.3223088-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_094106_312464_856B620B 
X-CRM114-Status: UNSURE (   8.56  )
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

Burnet is known as HP Chromebook x360 11MK G3 EE.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 96c401597bd8..0870490aa350 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -122,6 +122,10 @@ properties:
           - enum:
               - mediatek,mt8195-evb
           - const: mediatek,mt8195
+      - description: Google Burnet (HP Chromebook x360 11MK G3 EE)
+        items:
+          - const: google,burnet
+          - const: mediatek,mt8183
       - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
         items:
           - enum:
-- 
2.31.1.368.gbe11c130af-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
