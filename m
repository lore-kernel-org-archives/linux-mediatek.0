Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20F7C25B48
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 19:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1OFWJeTJZ0BbVCP/+krvvrTex+iNjXDOseWbkL0Relg=; b=gejBE81lbT/d7ewZLnI4+1LaPp
	27ZxDQJXmECblIcqeIQQYtuV5uj4UYcJuksNkgJfAiArOpdCRdOqo0oC53Nw1/G43CaudwPN/J+hE
	84l5S7i0yenSDj0geukdCV+PBv9N0LC/WMbIv3el0HstlmIGV2rmsafKxNt5SN+mmj3XlmdUEQ0fO
	84pPfMTZcgg4XQAerDBgfer0LX+h+0vfHNQw0e2LMYCDY6XSGxsdc09wtNUw0yOTD1NOiAefq9Xen
	3aH6sWNp5Em0GXLur3Vtveb1xMLzPvQHGUHa2mQPdGNf6LPL+uB4w20M3NvnSqQ7QAXa28+ekgXD9
	rIm1oPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw5o1-00F2KP-2g;
	Thu, 26 Oct 2023 19:14:09 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw5nm-00F27c-1s
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Oct 2023 19:13:57 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5a9bc2ec556so1068336a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Oct 2023 12:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698347630; x=1698952430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OFWJeTJZ0BbVCP/+krvvrTex+iNjXDOseWbkL0Relg=;
        b=gUlx+9VnFaPibhHqPogn3oz2NXbXRMAHJZ3CFNmnYdhcdD3i7Ou0afn4Jk8X6OUuQ4
         dYZQCdGh1qtz7Cf5bTOrqeCtu5pqKxutTWhHQKYCJiDEUsao0bbX7HfDbqv5xxYsTKzJ
         k4n1U2Fi7pl6OBDY/Ou2Kl5eufIZIosTfHn5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698347630; x=1698952430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OFWJeTJZ0BbVCP/+krvvrTex+iNjXDOseWbkL0Relg=;
        b=NK4jfsyXa2hDOMvjNpdQkidGPTBMbO07KYEofhmH7MW3uxnltnw+PGAWWdkUENkbGy
         ECNF6sbrEFWvA3Py5bH9RRmOzUb5CIBJ1V2NakNEoOkO3dqP9ENRjtWPI3CIA/hL5YXW
         lAirgX4LJzfnCSiRPtNq2zzm0oIGF2dFxdX51TYx/KtDsDo8vJeLBtL2JGjBPUO1+P0g
         8zsUEw5gnuxPtOsdyeawlXHUHWzPecfYPYKvx4qGUtlSn44gbM5k4jVWSos1gf/F3NXU
         4/OarHgjeHnbLZvqGEf1tYUKeTyWrE6VLuazMrDoxmsytmL50B+bsRAvsq+1w6/27qs1
         YMNA==
X-Gm-Message-State: AOJu0Yw2S3n7HcbQQEEAyBBlPNo3opSLoaiY4Y7ZZKpO3jCQb51/xNR2
	3uaGqMG19NA8KQ/a4U968PdUvQ==
X-Google-Smtp-Source: AGHT+IGKFCR2N7o33SsWtgj5xAsMYXuAF9RtVdH88kWpjjYB8UGtUqMYI8P2T4uYs5XYLatDKH++HA==
X-Received: by 2002:a17:90a:3003:b0:27d:8d42:6df2 with SMTP id g3-20020a17090a300300b0027d8d426df2mr447016pjb.43.1698347629959;
        Thu, 26 Oct 2023 12:13:49 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:f0fe:5c3b:1d70:d0bb])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a031600b0027476c68cc3sm2183639pje.22.2023.10.26.12.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 12:13:49 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 2/7] dt-bindings: arm64: mediatek: Add mt8183-kukui-katsu
Date: Thu, 26 Oct 2023 12:09:11 -0700
Message-ID: <20231026191343.3345279-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
In-Reply-To: <20231026191343.3345279-1-hsinyi@chromium.org>
References: <20231026191343.3345279-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_121354_646192_6ABE2FC8 
X-CRM114-Status: UNSURE (   8.89  )
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

Add katsu sku32 and sku38 which uses different audio codec.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index a5999b3afc35..4fe58cfe6f1b 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -235,6 +235,13 @@ properties:
         items:
           - const: google,kappa
           - const: mediatek,mt8183
+      - description: Google Katsu (ASUS Chromebook Detachable CZ1)
+        items:
+          - enum:
+              - google,katsu-sku32
+              - google,katsu-sku38
+          - const: google,katsu
+          - const: mediatek,mt8183
       - description: Google Kodama (Lenovo 10e Chromebook Tablet)
         items:
           - enum:
-- 
2.42.0.820.g83a721a137-goog


