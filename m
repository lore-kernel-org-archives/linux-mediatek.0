Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45240ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNqbufpN5FCsVdK8ndQFqiXUCnbD9u84sO+9Of5lLKM=; b=Erdt3AvnMddLJg
	e5WGGHJwV2l5NBwvqXux4utlLCcHsU0469CuUQ3D524rPpqn2cfWVYKpQ6mh58UmfWg6T4cqbyXhG
	HnM/FonHr4Hf8YRDlu+jAtbRtJOfHF5kDouVJXVCWfM0xAfYECdzC2l7HoZ5u87JCcY++fsjmlLx6
	qIqDsRVmVwTFVPgcMs9GxvdJkow3UUSQ4Gwn2c3bQY+goeP9eb3oOjthQjEppQVm3UJl/tiap/R04
	UnbAVt2LE2SaZIhAlLYMVbNr3CImt/LIiCFQcPI22Jq9Xf1hbfc8wKjuzbtfdxsO/phxnGkOh79xL
	ld21WrbY5uhffjDZK9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snewK-00000002B65-30Z3;
	Mon, 09 Sep 2024 14:00:24 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncPO-00000001dKc-2ynJ
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 11:18:16 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2054feabfc3so36356135ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 04:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725880694; x=1726485494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNqbufpN5FCsVdK8ndQFqiXUCnbD9u84sO+9Of5lLKM=;
        b=RKF81GibY2oxdlSlA03x5z0LHRFMZni4at8Bc5cNQJ34uZJgujIFeVfsoCe/Dx+DLZ
         7Irw+BmNXx+vj6szb1IEREzCfhK5eyD1EKKC51Hgt+q+GmOWh2EbnIuTr9QVVay8rZkh
         srcVw1RuSXOnJvLqroWjAnaR47vALQgUwgpMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880694; x=1726485494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNqbufpN5FCsVdK8ndQFqiXUCnbD9u84sO+9Of5lLKM=;
        b=YuXcu4wWKa0DK10yFv0bvcQx/Nx3zcjlJgd9lDeWKj/h1LqJvB+6815esXCmmOI4xJ
         SB9leJmXVwxt3oHzQBTF1k+BnDUiQu4nKJQflLAMBff2J7KlndIC8RpWQRxQ5vixjxWk
         6S5ypMLPnKmjaWtGWn7ClXLTpEAPRpvvEJeLiYnghHbasimPD7JXj64NnLeOdALOfE1e
         kfBJg+EW8oUsf9IK9IN4p4XF8NY70Z+jcghRqLQIh322rMEeBaFvv/O6f1RNfvQm15zX
         O4Bc2U4eVZLrmVccPrHow5eSgkUVn1KMt/MZ8h1dnG4nOooeI7b7Wh+U5cFjbxtg1VHV
         9b/A==
X-Forwarded-Encrypted: i=1; AJvYcCXBxnjCYwFMjjEFLUkqVsUxcLblP1w4JCJdKBlrIBinoDFYfyC/z715bX5xKOhFGMopExfHxIA/q5VX4xZ5iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgDHTrrG2dk+EVV3g7FUMOyv9cjGQltw64yUnQKuxA7U1p/fPI
	n5FCrXF9fF7DzbGRHnzkfIjFxoRqi9opWIFm3eMWC4Uda4nylhJeHFGWbaTOag==
X-Google-Smtp-Source: AGHT+IGiL0uiJ3/UtmaNB/VuKJWcQ4ITc3x9BGi+tHsy7sGnjDVOgP5vjRA7jI/WSNOATWmtN91Reg==
X-Received: by 2002:a17:902:f606:b0:205:76f3:fc2c with SMTP id d9443c01a7336-206f05157bamr190100235ad.16.1725880694082;
        Mon, 09 Sep 2024 04:18:14 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:6647:6d5f:dd48:8f5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1dc55sm32039745ad.186.2024.09.09.04.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:18:13 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 10/13] dt-bindings: spmi: spmi-mtk-pmif: Add compatible for MT8188
Date: Mon,  9 Sep 2024 19:14:23 +0800
Message-ID: <20240909111535.528624-11-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240909111535.528624-1-fshao@chromium.org>
References: <20240909111535.528624-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041814_786910_13F9447F 
X-CRM114-Status: UNSURE (   9.91  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible string for the SPMI block on MT8188 SoC, which is
compatible with the one used on MT8195.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
index ac99883a3f29..7f0be0ac644a 100644
--- a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
+++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-spmi
+              - mediatek,mt8188-spmi
           - const: mediatek,mt8195-spmi
 
   reg:
-- 
2.46.0.469.g59c65b2a67-goog


