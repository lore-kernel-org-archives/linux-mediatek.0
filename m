Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72334C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 08:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlB0PUG7evATLc0OuzKEpt6MawbG9iqAg7BGZuj7pfo=; b=Drh/3eMJsYCrUg
	eX6RhUDIDbN+jLoRm58xYunEORcV7AuuLYVgUcBZZ+/pNFQGNeymGIEOv2S/aDC59FbwTMLdeuK4I
	N088x7+ci5ibto3jICU+RCGacnTnHcPXDy536TedjRd4VbpIQ1C4q9SxljPASKhPgIYDVhPAQWcCV
	qgKpICzEH9BhfwevlRpJO47PrzQP/0fFdC+dyBb7TmroTAHRFy6l7tKglksw3ccUcXBzYLFDLUmfV
	j46bGYuxf2sYJcsZvx5726Cgkq+HUC4XuNhLdbacqUOFa4c7Y5ObQedKaah2ccSF2SZwD6CKkwylc
	0ynIrw8h8GZUaQcNDgMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMlNR-004N7N-1A;
	Mon, 08 Jan 2024 08:52:57 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMlNK-004N1Z-2O;
	Mon, 08 Jan 2024 08:52:53 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so155386766b.2;
        Mon, 08 Jan 2024 00:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704703969; x=1705308769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlB0PUG7evATLc0OuzKEpt6MawbG9iqAg7BGZuj7pfo=;
        b=chCcbkVGWHwrJY3xbryf/oZmQ5m72JtCN8f+TtAKF2s21XSowppiRkOtknEgoqpqXA
         V/NxPPCsMMpeogQCPqAa2OXUUE2+zbzxWkHGhzp4+fRGoeLlwSbxyateQTsdzeHQjXb2
         4uPSQ+MgI3MkiVaAlkv9Oj73HVgmDquhA9uJ0XE/6rxSDkM/4j4xoe/jq22iVKafi7zU
         DVNwZrGyuUcZ+26jJz9lSJ4HnkpYJd/5+7IbWzLEvo/IOsieCeA37cRHwu/2mU8UD57u
         /QV2q+pJ9ej74Qy9UgZ+Q1I86g06TSB4HiUO8eNHtIKgIOhOHSgKfEPtjZ2PIAR1wqQy
         3CjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704703969; x=1705308769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlB0PUG7evATLc0OuzKEpt6MawbG9iqAg7BGZuj7pfo=;
        b=dcprH/QjccjDEcecLriVxnitXIANHKjy0RJk89Ebv5ukHGmHNebyJD1IIEG3fRglOU
         2dQwT1DQJVFBYc9d0ghWz7UqabN1nNbXqaBNDOF8rWFCUD94zSIGy8lmto3fzlG+Vng5
         mxkkp8Khed7jm/IfUB9yVuw5Y9Wb1fpvA7SoiamVzYRBxhTyQCqGiT0/QnMd/cKKtbWx
         rGU65dKLMVobJzBWTEKVs5CguQzlkzeLZsBpbycEcj4hq9jPFjN+4tmz/afCFRwb2SaG
         XqcC/MHrjOtJMHeJdrXRlbApSjuEPsTkRSOV6wDkCOnhslixpXyTyxQrtNZyN+6ettbK
         jcWg==
X-Gm-Message-State: AOJu0YwcQ39dpH3rfvXoKGAt1E/1tkC7MSya7qMIb21MSPAsPPmm8650
	Jc5hCnwlaWm6dLqdsvqdD1E=
X-Google-Smtp-Source: AGHT+IGHmo2J4TCjtP36Ih8IdoN/1+GtQ55zi956x1gcSfvBrvHy+Bba5xv0qyV93l2ShK/wS6etmw==
X-Received: by 2002:a17:906:f919:b0:a2b:94d:1370 with SMTP id lc25-20020a170906f91900b00a2b094d1370mr3187ejb.91.1704703969068;
        Mon, 08 Jan 2024 00:52:49 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id uz29-20020a170907119d00b00a2aae23b414sm666046ejb.26.2024.01.08.00.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 00:52:48 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH V2 1/3] dt-bindings: arm64: mediatek: Add MT7988A and BPI-R4
Date: Mon,  8 Jan 2024 09:52:26 +0100
Message-Id: <20240108085228.4727-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240108085228.4727-1-zajec5@gmail.com>
References: <20240108085228.4727-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_005250_781411_1A131DBE 
X-CRM114-Status: UNSURE (   9.80  )
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, jason-ch chen <Jason-ch.Chen@mediatek.com>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Rafał Miłecki <rafal@milecki.pl>

MT7988A is another MediaTek's SoC with just 1 device available right
now: Banana Pi BPI-R4.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 6f2f64ae76fc..92dbfb862757 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -91,6 +91,10 @@ properties:
           - enum:
               - mediatek,mt7986b-rfb
           - const: mediatek,mt7986b
+      - items:
+          - enum:
+              - bananapi,bpi-r4
+          - const: mediatek,mt7988a
       - items:
           - enum:
               - mediatek,mt8127-moose
-- 
2.35.3


