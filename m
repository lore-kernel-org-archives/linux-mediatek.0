Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E724C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:07:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A9BC61445
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A9BC61445
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=84vykQZTNRKI6/d/d6zCMNR0R2r1L88LmTFzYTZ4o1k=; b=M4ZHHNswExCdersa016uucM9d
	AwpCuknfrEcQQXOoyi1Y/7xq5nkz5nR42i5G4QQfpqDgH1iCn9urN3oKw+IhjNGIlkAyNMkNkGxwQ
	BtjK8bHfVPMhHhwc0XLiKh67NfpEne5l8Tnl6NG2fK0ffqBy/H4pRpKIN2RqibhREglrV33O84csx
	EzKGHgu5K3JFcR70yAJsdNldEurYnoy3UbDKUX1ATbtawFDKaGD6MYjtjRRdGNv9ikrvlXIEk1LjF
	4xrmi1YDN3vYTdxXP6MCirJPWJShxJrr2a3jLV4Qi8v0XVGdMgmyvrUhzoasARlE4SfPwjgATbk+j
	aGnB0Lntg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ8ov-00E31t-C0; Wed, 21 Apr 2021 09:06:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oK-00E2w9-UM
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 09:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=QWgC8UArenPHBW1aYUb6FqZ0mkj1u4DDyNUYpTlPpb8=; b=qrNNRk93fVQ/nHmAOsvXn4NdoY
 LtDB2vgM55HRxCHOP9FbFZAE/mYcZ81xQeurPBWyaSZ6JhSS8aSeMjwkAuD5HWeV989Wk/IfPe9PQ
 jpshGDVQRmg76+NIqHBJdZdvc/UNVPbxUYGFDkaYmlp1VNX59+EkfTjzutCdA4QEfbcZ/UnHti27G
 GpuL1rGhmmEiLwUflKvP6fD3L6Mj57jHiuvyZgNj5fbIzaDtQbrT+TnpWMO1USKpH9WErIs8Zb0Cg
 iDRGnbCupQ62sBHkmInfr912smXpt1G3+CHgO8KP75I09BqB550oqrXLBSON50KSidYpbJ9v9iizl
 qrYod4AA==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oF-00Cjdz-Ty
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 09:06:15 +0000
Received: by mail-pf1-x433.google.com with SMTP id w6so13598377pfc.8
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Apr 2021 02:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QWgC8UArenPHBW1aYUb6FqZ0mkj1u4DDyNUYpTlPpb8=;
 b=aGvfuUnnCYvkTk5yAEYOXpPO4NCnqVdm/mqDNTkak20CuF2UXTjy5/D52iMKU69WEF
 u34V9v3InRXWf5pTM17jNfgYk3V/tKq5ZI1aw5YqsDLiDec4/ox+zLfrbNw3QlDaOpYO
 AvXZ8PNr0mgKYe398F3I9e6ONhRBXHE8RAjTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QWgC8UArenPHBW1aYUb6FqZ0mkj1u4DDyNUYpTlPpb8=;
 b=sdKZBAuRe4wjxqbr3VgkVNaCwuNLBNBkid4GoIt96/kb9HF8bY2PTU5TjyLbhReYGk
 bAgXV0rbDs8BxkURCF76Ljr7dZhFWg7A0vzETXIXlq8Pd/hoGWMa1n8LJMQxy5Wjg0s2
 n8ka0pdZ72p5AcTrwE/cnoksOpKe6TRA/nWpphCgbezSl0Q0XqvndAzF/CftxzqcH02p
 u7u+30IXx5r23h785Dm/em/fowbi6bz4p6w9lE4vamLm9z8hoO3z9V87OPJ9eZYh90+z
 sAsltRRtgrEvqhICaGKXEKL2CENnBCadL1RUhLk/zb5yCLIczNh581qVl4WyzeO//ioz
 RjWQ==
X-Gm-Message-State: AOAM530AyQZ9jTD9VGbPr6ZcLxsMMJodD/rp8Y/iL0hyw+KE/Dvd+z4E
 98gwGnaojC3z6CVXEEDOMgc77A==
X-Google-Smtp-Source: ABdhPJy7Kt/q9fTmLhyxL5oYeMtHnm7I9rlO5JivPR35TDa/G4bfD5Yn3cibH7YCQxUr5Fh1SIEA7w==
X-Received: by 2002:a62:e203:0:b029:260:d99:57bb with SMTP id
 a3-20020a62e2030000b02902600d9957bbmr13828717pfi.31.1618995971364; 
 Wed, 21 Apr 2021 02:06:11 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:60c1:887e:ac53:9b5c])
 by smtp.gmail.com with ESMTPSA id jx20sm1495889pjb.41.2021.04.21.02.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 02:06:11 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3 03/10] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-burnet
Date: Wed, 21 Apr 2021 17:05:54 +0800
Message-Id: <20210421090601.730744-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210421090601.730744-1-hsinyi@chromium.org>
References: <20210421090601.730744-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_020611_981954_54EA6547 
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

Burnet is known as HP Chromebook x360 11MK G3 EE.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
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
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
