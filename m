Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14693EE4991
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxB+6fvHWEXWAoAcmBCe/+3gaojpv5E5mRIj5J3oWjM=; b=NA6agmZC3POjwG
	fYhx6PAf9ia67k92z/IBhrOmXRAZ/po8pEuAZnpPXcuPQGXOuaGkR+bR0DKNoL+on0CV1rmGoZcwt
	VANdQKaMu+8xh+0CJWcJ+T5W04WMApqzltEjP44xTDxritynYtMapdNBVo8PDiQ3QoJ31mJMo3sTQ
	4TXqHZYthk6BAtSNVR4Vxq/djJ9gDTGSGTxX6dqIPNCiKvZ4+KtiD4BQ9NRUWIMPUBUYkqayI4Lbh
	bOdQ1d6TubrNgOv3SZ6walfnPw+U6x/bi1Zn/8CiftLRusgMiUHkT+DPOgHcvhpNeBpEPjVcM4GBf
	Kv+g7sowJySX8FRnlngA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soL5F-00000009CtT-2zNs;
	Wed, 11 Sep 2024 11:00:25 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKxC-00000009Aq3-2Vwi
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 10:52:08 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20688fbaeafso67964415ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 03:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726051926; x=1726656726; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxB+6fvHWEXWAoAcmBCe/+3gaojpv5E5mRIj5J3oWjM=;
        b=NgUK13aSJkD+fKOF+HOgZyVy41gAntzqodkkmqLhCXLMIdXsaruOFgnB9FLCh6tS3H
         bfOyFP6KwwrHwaJXMu5+V9f1GInH+eRcBzJA7mW+fWn7qYdmi8hCDQp8I2GZexy7txhp
         1ONt7w8VhYuCyvt/bwZTJCSr3Rqsk9g+p8FzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726051926; x=1726656726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxB+6fvHWEXWAoAcmBCe/+3gaojpv5E5mRIj5J3oWjM=;
        b=tvjDvOJvbiI85GSB323i5K0ejjC0ftmz01doOEqByLnNkLTKjiW+MYqY3DHvcdNSSk
         2Y79OlRRHZ48srrwuTzbrKK+efOWa6H2YpxXVhVJnGerOUsF5hc+JDR1ZK3mUPV70JH8
         DGJeLvCQmt7j1nZXP0BvlCmqehNffyF+7gfX86OUh5J2tYA4GX6tCEP20f6x0yedZg5t
         uiUBzHlVlBpV+46jaclQSDAjSPdSU0MvkCo40ogcIy77Bmm0FobGynVWBQPzZyYIeju7
         qkht9wv4tXS6BRcXBA/eCIlZLNmtxVa12iKI2OXPW0urVvvdZ9WAhxd4bVuspyeQJBeF
         hs7A==
X-Forwarded-Encrypted: i=1; AJvYcCXs13f1qVfC3LfVn6FcrxXfcD/FSba1PorIi+/m/3JU/buM6fBFOgl7xIBzQfBsAqetZf38ryopFIZQkydTYw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg16T8NuJnuFnWrcKiI5N7t3ph4So7ru15VJO0pujSTLbsSMop
	lgArGRu7V+xWy8IXTyoie8Vi4oWyAjcZtoU0WBWf1s+t4x0T60COspGVOVjY+g==
X-Google-Smtp-Source: AGHT+IFTR5yrOi8klWJqx+NBpQgcvZapfM72vRbdkK7qyKiVUV1zLbAi0kvSlxVkP+q2NaVXR1gr5A==
X-Received: by 2002:a17:902:d509:b0:205:5dfe:7d9 with SMTP id d9443c01a7336-2074c5e71fdmr49347935ad.19.1726051925359;
        Wed, 11 Sep 2024 03:52:05 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8242b3d13sm7147352a12.52.2024.09.11.03.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:52:04 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/8] dt-bindings: spmi: spmi-mtk-pmif: Add compatible for MT8188
Date: Wed, 11 Sep 2024 18:51:06 +0800
Message-ID: <20240911105131.4094027-2-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911105131.4094027-1-fshao@chromium.org>
References: <20240911105131.4094027-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_035206_710889_B89BFA03 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add compatible string for the SPMI block on MT8188 SoC, which is
compatible with the one used on MT8195.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

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
2.46.0.598.g6f2099f65c-goog


