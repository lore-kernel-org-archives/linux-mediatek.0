Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669DDC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 07:28:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27EBC61075
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 07:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27EBC61075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cv5eyUorxqslnp1DwaXCpEjsGuerg2NvOiKpdE7e//w=; b=XAV4JS0nlblMUE
	Cb57O7Em/Mu6AcKzMIanOXsFT1mIbK80tajqbkwpk837GIVfll+CcpSBZhylW8+SBqa7455UECyJQ
	x9/4wQKs7+VzQy5qME7cRiH3G94IEPmQysIjMbSlhSxVnw1Zwy7pz/vTg/zE7hwt1DuM9QufODshh
	BGRoaXEClKInZRolpUhaMuzGkiNoRAK61r7Iu6/zN8LOz1mlGZsxFldDBtk9b1LaBwziR1znPt0xP
	Rvq5I+4rYBToOoAaeFCjqBRYqtAZzMNdDkFF9+zog7LGJysDZLn0y5iKheOu1Bji+uX3R/7M2a3Gn
	dkvEHkOsSaY9sewN/ztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjz4j-00FZXY-PN; Mon, 08 Nov 2021 07:28:17 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjz3v-00FZ7N-6H
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 07:27:30 +0000
Received: by mail-pg1-x52f.google.com with SMTP id q126so10443171pgq.13
 for <linux-mediatek@lists.infradead.org>; Sun, 07 Nov 2021 23:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7VRwqE4mljaTBbEn84HnhMeSkIM9YCg3MxPTKXVa2zs=;
 b=SEil9SApMgo3zx21+CayURwOiP6vwjadUGGhRy1wur3B06MtS4rni4k3GLVSKHMx3P
 LDI2CF2bB8tznlGhuROYtBbjsha6Mldlbn++gD2gYYirfP0L4ZaD4DbQJkJPHh8iXnoa
 N2H+pcLHqvwF1eI8yKjpo3A+7rBi9TWaCvHQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7VRwqE4mljaTBbEn84HnhMeSkIM9YCg3MxPTKXVa2zs=;
 b=DSEwunY/6i6whhBAhR6wgguqhv8wyeqpS71DYLWBt6xEpj02gy2j1sdRQX48wbnOH8
 OTy1e7Gr8mEMIx8qa8NqBFySvfUdwgHRIcsHSOeY2ILE2OEM/F1PaxriMoRpcJst8s7a
 VF2z7mcemlQndwzOpgC2YP4bkL/VMd6iNVcbLNAsOLtANE092AAslRg62mzjWrIiPLDy
 7w+eY9gPxbCQsvAKl3YNvQDZ2CWKwNjw2SM5YVWLWVZp2Yraoq2w4C43NbUmK4B1L7xo
 TFVROpyAoc2obB/2krn/kl7JwDeo760RCHVRhYVfAKRFNGko7TvUrV3CaAjQi2kmrOqP
 cc7A==
X-Gm-Message-State: AOAM530j88NJkE+dPFMI0TgNLD4j7ZvtFERN/H4xnW2b8Tv2XPoC+75m
 0GZqkBrpYTLz+VYHp0DgHzi82A==
X-Google-Smtp-Source: ABdhPJz0KGRio6+Vfg/0zl1gPXCnZf6PlR0Ubx5ZdyQMG7go+EpTemLTEnTrnxJ8YifJIDmL4Zp3kA==
X-Received: by 2002:a63:7d46:: with SMTP id m6mr60136373pgn.409.1636356446512; 
 Sun, 07 Nov 2021 23:27:26 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5f03:6a9b:24e8:3a2e])
 by smtp.gmail.com with ESMTPSA id e8sm11684972pgn.46.2021.11.07.23.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 23:27:26 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] dt-bindings: arm64: dts: mediatek: Add more SKUs for
 mt8183 fennel board
Date: Mon,  8 Nov 2021 15:27:10 +0800
Message-Id: <20211108072711.1628566-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211108072711.1628566-1-hsinyi@chromium.org>
References: <20211108072711.1628566-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_232727_312413_A632DCDE 
X-CRM114-Status: UNSURE (   9.75  )
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

Add sku2 and sku7 which uses different audio codec than other fennel boards.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 7cf0c76cd31006..99e7f8e294cd03 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -147,7 +147,9 @@ properties:
           - enum:
               - google,fennel-sku0
               - google,fennel-sku1
+              - google,fennel-sku2
               - google,fennel-sku6
+              - google,fennel-sku7
           - const: google,fennel
           - const: mediatek,mt8183
       - description: Google Juniper (Acer Chromebook Spin 311) / Kenzo (Acer Chromebook 311)
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
