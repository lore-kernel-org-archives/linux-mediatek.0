Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33146C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:07:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E16E6143D
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E16E6143D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t8S8qmU3knaqjXCW4Pv08fb3BYbpKN8Sv0wQqn5RAxw=; b=PXtDkYujos0A0Jkuz3Ei26uxq
	ZOQClbSILjbarWbHvq9KSV4DM68iXv7sVGK6hJ/7hUEDv57Wr6xfNPgx2+QxLvxShDUxeEJMhWhLu
	Gq6yNOGaVLnWDfZufYXp1tz/6yI9sHcIPnb9NIq+2Oik+MU9xFe6D4IWKmCkgvnhngguZyR/xjJsb
	dOWagwvRlRr0TID3wBk2Tmz8s/62CGODXJDcjfqMknXQ1DU0z9fQvHTDOSJp3sTeM6p4/WyueEyuQ
	VMNAG/B0NNrjfK8D2lnAx+O6nTNFOvhv8BdJ2lDk+Y33ZkJeivg1GHXjNQ7/9GTcw3ISc2kVIwFU2
	3Fh4NKKHw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ8pV-00E39t-J5; Wed, 21 Apr 2021 09:07:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oH-00E2vx-CO
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 09:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Lry1BwRcX1DIKG66zy5DdtnzBVoqpe6oY2tgO8jcTBw=; b=SsFW01YkDN2Wd55iQtfWTRSp74
 v4T5XCT2XOw6UEj2TD5WBFGQb2j85HS9+EyZ+PBSZqFRZ56vLenWzRJh7GQ+HaicbbVyrjMSi5ebZ
 kChCQwGrsE9JroZUArHoHy4riP+M31T2oR0PCrmMbahi8L7VRI10NYfKRCbqNVl3dNqdM3a8/ekHZ
 tDcRkBPkMnGwsdf5sBPRih0rVP3Jfp79Nle3zVixm74cKWhUeaprfaaBwj+ZxJUTP4ZDEOB7YXxaJ
 zrYcKD6e33Az4OjMvDjRiifIMQueVfyxDVPUspL6+nP9Mv0H+YOqbg3l/ZSCQWhtyva20nAmagGDJ
 llf9LDNA==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oC-00Cjck-9K
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 09:06:12 +0000
Received: by mail-pl1-x629.google.com with SMTP id y1so5624540plg.11
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Apr 2021 02:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lry1BwRcX1DIKG66zy5DdtnzBVoqpe6oY2tgO8jcTBw=;
 b=kZV3TZGbJifrkF+1IKw2rQMLyr0wzwJKVCoRsmvbPmmXf6WByeyK7+t8b7S4Trp4CB
 BWTNKhxieeZzGFkpDNW8swZAZ6paU2wsFhVBqjXK+pW1DQuQ/14zZKmCvQhZ28wumTHf
 33ibJhdasuAWI+qPp6z1w1gxQdCX+REwyyJ48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lry1BwRcX1DIKG66zy5DdtnzBVoqpe6oY2tgO8jcTBw=;
 b=dfbSmfbLDoaPoPFW2LeWs58v4z0k6/mR7IkfxsWvEKkUsstE2EA47KMGss+MGAIGuY
 udOUbBVTOiB0ogpxr8EZ6GwI+bFeSeLIJOt3zkbN6UJQ9mbPxSjlRCqnFuJDOlks+D/f
 vRvhIAb+wVv4Ay6V6gk6WiNf+yfMy7UyWcwk31oG8m7sCdvsqC4lmFil3M6M30IfatiV
 NzzadlL+zRDkITS/zmk2iY5ONNZRSpYywFVIsq4PwT6JVTwDEvpY8PLEmwM8DXxHJB2s
 mKnA2I4bfEKJmVNDItRipHBvS4lFtH7XEriyzTA/4BJ0+XYGpFPYZIv3hFUfbNNpz/Vc
 4bzg==
X-Gm-Message-State: AOAM533o91+Cjv7BcX0D2WYfBZ2WtbBc97bFGkRQamTRaN/7UQY0z/Q8
 wpC9kEhLAWiB/xeVKsbKFPyMjg==
X-Google-Smtp-Source: ABdhPJwU7paLEQSz6xwbh38lSoIwoOVf6qULB9EDv5p0KWIvFYKrIsCoq95kTJvECz7EPu1l57D+ww==
X-Received: by 2002:a17:902:a515:b029:eb:2723:3fde with SMTP id
 s21-20020a170902a515b02900eb27233fdemr33179409plq.56.1618995967538; 
 Wed, 21 Apr 2021 02:06:07 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:60c1:887e:ac53:9b5c])
 by smtp.gmail.com with ESMTPSA id jx20sm1495889pjb.41.2021.04.21.02.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 02:06:07 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3 01/10] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-kappa
Date: Wed, 21 Apr 2021 17:05:52 +0800
Message-Id: <20210421090601.730744-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210421090601.730744-1-hsinyi@chromium.org>
References: <20210421090601.730744-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_020608_344085_20014C8D 
X-CRM114-Status: UNSURE (   9.15  )
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

Kappa is known as HP Chromebook 11a.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index aff57a8c8c30..81b86b189a8d 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -144,6 +144,10 @@ properties:
           - const: google,kakadu-rev2
           - const: google,kakadu
           - const: mediatek,mt8183
+      - description: Google Kappa (HP Chromebook 11a)
+        items:
+          - const: google,kappa
+          - const: mediatek,mt8183
       - description: Google Kodama (Lenovo 10e Chromebook Tablet)
         items:
           - enum:
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
