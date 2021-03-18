Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA46C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 04:39:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB73364F18
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 04:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB73364F18
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TZJNNjyfwGG229WjzOCWVOvLrNZODkUXQw6x/62e2+E=; b=i1sQ6W1b8HU2igF1dpL4RGtro7
	Jpy/JCnBoLtB65+WnUWKhSLFX11b6vzeBNQk1xY3UO55R9qeC0C55sSNk21Ep+LLl8E3nzZLQZHZF
	mOk0pD/uvSC55cIpxARKYzf/oAn3j4d+CHH4iy10+ZpZyKfhddAJ2L5+ghDFars8L6TYt0TxFFmOW
	fj/FSYiDGhxD2jp23MummjSUGjFann0Rsgi15UGQp0UulAgoUYQDGQTSA+LXgcxfowPy/PIn/JMjI
	MDeuTzd+KOnS0EmkPT+Nll0LmJSm4HpqqCLx8KyrWSXKTD6Dh1V98ExffO4LgJcMiI6kb3eUuy6fg
	O9yUOofA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMkQi-004PyK-9V; Thu, 18 Mar 2021 04:38:41 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMkQ7-004PuE-2H
 for linux-mediatek@lists.infradead.org; Thu, 18 Mar 2021 04:38:04 +0000
Received: by mail-pl1-x62e.google.com with SMTP id h20so651518plr.4
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Mar 2021 21:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wu0UN0qTxD7NQTRZi1+qshriPs2sSwGOFj55/TJrhfs=;
 b=JnhEYHtG8GcWblkEqlnukB3sW2ozfkVUOTi3eX2FyFLMPicJSZpmzGzd+87u7SdNwT
 GWnRMgt6j7VvIAueGQqv9p9IOntxQzyunv1Xjh5gRySqiBmJVRdvVYuF57pLWJsqrqaU
 Jc3Wx//wy9wlk3spgOF09gRE0KkQhOyFxTUfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wu0UN0qTxD7NQTRZi1+qshriPs2sSwGOFj55/TJrhfs=;
 b=Kr4p/W6eLmx0TfwgYCg+9pvxbcDxjrVnuYmHLnpXBYEJ27DD/oBOR3ThotuBqA1yGN
 vXyq6BxiPQulo9wmQfl72ZmvRqK43CWGwPB2CB9F1ILM071vwdFsSudNmti7kMEevL3W
 KZvqMDsM012kzpqK9Z66FC7A6dKm4dxNDEVojTDyv3RrVnjzTjnwtwTiQU0SATWIf5FD
 MURz2MFqTXcKjG9+ZSocC0bCQ+Dp3shFs1Kmvi+lEJQOIiCOQjlN3E3mzolYVNd9HfDJ
 IIL3BdxKBOMoZlsyo6c7EU4z7AT/jS0C9BaWc7J601AOYRjU5FtIiPB4rSc1zL/JdeVE
 5BIQ==
X-Gm-Message-State: AOAM5332DZpbzInY+cCM2kHhgPSHLM2ko30mTbBVDQ8s4LW8SiGWmoBm
 dYW+uGEBYp7UAYgkFk+72UFLcA==
X-Google-Smtp-Source: ABdhPJzIaZ6w7w9IBg3hxpIxje9WnBHc4M9GJ0YeFtZVWASjJiKw0xd9PcjxU1CC3FLuBSfqt4Gq9Q==
X-Received: by 2002:a17:902:ec84:b029:e5:bd05:4a98 with SMTP id
 x4-20020a170902ec84b02900e5bd054a98mr7801174plg.76.1616042280176; 
 Wed, 17 Mar 2021 21:38:00 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e12f:5c36:14f:bbf5])
 by smtp.gmail.com with ESMTPSA id ft22sm611234pjb.8.2021.03.17.21.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 21:37:59 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Ho <Ben.Ho@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-damu
Date: Thu, 18 Mar 2021 12:37:54 +0800
Message-Id: <20210318043755.2273782-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_043803_311963_E8A20F16 
X-CRM114-Status: UNSURE (   8.15  )
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
