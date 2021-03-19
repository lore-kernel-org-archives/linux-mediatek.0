Return-Path: <SRS0=VEyR=IR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80077C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 03:53:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15FB064E07
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Mar 2021 03:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15FB064E07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TZJNNjyfwGG229WjzOCWVOvLrNZODkUXQw6x/62e2+E=; b=BBYTTGE42HiZYd56Yh/l5nigqi
	2ySoLYM8kNASyM4T0/PaUgSDc+u+4dn+TMjlS/maqivMrTSICCgO5uXp1rUQ2jMd5PhEBdr1v8vO5
	VQ+nf+U0YWB3mCFpzTLhfOxwD/E20rbTWtYDXxjoEbcHi0fPn3E3n1j320MRRvjXfVngnNXI54HNj
	+vivv2Ja1DcB/biBd5tH8Eta46Efwjb4NqLf2utXp3FjheHZbf3aBkIRmlsoqdatq/yZUOHkqAZb9
	MqiyljVXLZn+UCfqnPifMHsZydA9pMS50gVk/TfIdFvBM8OMvyj5l5QSZIJFE/RiT6H8ymkjsAhkl
	vWJN67FA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN6C2-006Qas-AQ; Fri, 19 Mar 2021 03:52:58 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN6Bw-006QZL-9v
 for linux-mediatek@lists.infradead.org; Fri, 19 Mar 2021 03:52:54 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 q6-20020a17090a4306b02900c42a012202so4177702pjg.5
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Mar 2021 20:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wu0UN0qTxD7NQTRZi1+qshriPs2sSwGOFj55/TJrhfs=;
 b=fqqvH2c7HgMSttFHhPrVseaYGYI7ND17sa4mOG9uxCnTyKNZoYpah+jzIMyTWsQtVi
 cFHQa6VIMlMw0oO9A//gedyeB84lyFm9tYX2HqoJw3TnRchhRUgaoeRvuHLtJDK8xRZD
 UhV+9UZ6BYweMxfHNxIw6wIEauX5a/w0sb/vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wu0UN0qTxD7NQTRZi1+qshriPs2sSwGOFj55/TJrhfs=;
 b=n4VbBNNe6+H+AnoLj4Z0rCqKIejAC045bd8WU9dU0vBPvjxbqrU4rSrjPDdCdgprm5
 5qwKlS5bWF9BkiCfDHNzCZzML69M3bHpABpv8Xjm5vXCB8q9SmhX5jl82MqxPTa0qpot
 U+HVXG00DPKf8xAmc7kjkKRfpltTy1NRlixiOvRt0qVpLQUceVUZme5hwD5RV12UfiYc
 mDMdaDFzz0qd8KSzjDeoGbHdNXrkNh5FVPyiDGdObV4o68SogfVKOV/8yir38J5CgVfr
 HacVqPrg0MfFNOtHG6uwdXvhSiewU/SkvzVHci+XT5tjlMjCxiAdFxwRmyTiVvIqOb3t
 Pxhw==
X-Gm-Message-State: AOAM532/zWNxk49QjQkuI/yJQL/n82SrOTL9g6cKmVwCFknAZJzjGpte
 GyduaGB7zjssLQsA7CjxorasAg==
X-Google-Smtp-Source: ABdhPJwtstJdF7ulIAFEh2bGsL+qpO3Qj+dYWl2OUYKZAv1QwvYbJBHLwVcpzF2cMuew4wQ5OLgG8A==
X-Received: by 2002:a17:902:ecc4:b029:e6:1a9f:3397 with SMTP id
 a4-20020a170902ecc4b02900e61a9f3397mr12844270plh.9.1616125970722; 
 Thu, 18 Mar 2021 20:52:50 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e12f:5c36:14f:bbf5])
 by smtp.gmail.com with ESMTPSA id u66sm3442180pfu.186.2021.03.18.20.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 20:52:50 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Ho <Ben.Ho@mediatek.com>
Subject: [PATCH v4 1/4] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-damu
Date: Fri, 19 Mar 2021 11:52:42 +0800
Message-Id: <20210319035245.2751911-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_035252_700622_85B1ECA5 
X-CRM114-Status: UNSURE (   8.19  )
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
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
