Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A204D3B7EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2024 08:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPnYr8aIDFby+4dgQKR60j9AMYM1qDxkn1rBoSKaia4=; b=cNlES98NAqGfOWuuoAqji81yle
	VQyEJoxI1zeSvzc+GZRtmF0XmHaX1/Co1MS0ksZx94AoBjtV7/p2/312ZeBuEN4DFYpKnaOb+8fe/
	WK8BqrIcZbrC5SxrTyEJYhD/4n0GGbdUiL7PKnidcoGeVLLp9Se2dZ5iG/j0whsCam3Jnx3Y6PhTD
	ICF5Bg0+xymsffFIe2H17ZpRTb6q09+csOg4DJn2JeoMzdQlNu4Z573xfHtMHqAM6bRAxcfueO3S/
	nhrBbaBvwnGClrMLIaPDR6Iczrf7CMaK4kG176EMZRiRAbBDh7NwGzHQn6UdMq7qGXW6HBya5Rb8P
	58pkEeYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUYY-00000007OlJ-2hy0;
	Mon, 25 Nov 2024 08:34:54 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFULo-00000007Mby-03pE
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Nov 2024 08:21:45 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aa5302a0901so245646366b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Nov 2024 00:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732522902; x=1733127702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPnYr8aIDFby+4dgQKR60j9AMYM1qDxkn1rBoSKaia4=;
        b=j2TAza9xRBN8QDTVs0eHv0GDrtbgq7JdbJnMs03gHakxJYWTZsB8tj6o57Rjeax1RR
         UkrJgYenyzd3bkWSC0WkFPkzy+lWNSuft3Coc5o5KrQZ7iwAMaZ7IkF/qZifcXYI6vOh
         +AwTqRnqe8TKlEln87XXWL7rhTuoWfNQ/sGX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732522902; x=1733127702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPnYr8aIDFby+4dgQKR60j9AMYM1qDxkn1rBoSKaia4=;
        b=VZEa1mZnsmCBwosbCqAs1Qwl9WrNamdduiTcCIkufNs0ebTqSLjq2qW3IPao4CtHYy
         2EKn6vtXkjniaZ3mmx6Qd2iPBRCr9GJOdt2DyL260Go0VVT3S6qUaKIIS40PgNXQGHTm
         yuyyCSdL6bZM+aRNKgm2p3Anxa2kQsrTPtJD7Fc0ZYvnvRreNB6o4U1cXeIHwhuA59PR
         ppXYkWhzoRpA6TlwBbIm+IUdXIvsulPulhvMNvnJosjVmab4LOQoYgVZU2tszx0+2oSu
         cMiAmD+LyIQtO8zu3miKtnX2IGX2g0dtwE4H5I/2dPhtX/S2xI23tcZ2xzHR/XWfrHdv
         96lw==
X-Forwarded-Encrypted: i=1; AJvYcCW1VeK5Yn3jpnDqCfWZIlG9L7qfUgziWR998WN8+U8O2FGy1XIqrTmbci2iL0/dyGFWA7UcLwlenrRWXGhunQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyA1//B7X8t4tdsjFCmi/wM3Y2prjb2To+C+jq1aZ4YNwGeRGTx
	nVQ88sH8gXSXAtmdJbDz2F5yk+NF9gPu/eUG4aVZJpoaJa2OoT8PpOIRPfmbAQ==
X-Gm-Gg: ASbGnctlwmhLsWnGOKsD0oiY1xprItvhdoDx78Zv3mUvMayBuk4OEgeg8Eg7y2BhUz8
	nrqRF+skkI8usYewpGS+25qm2lnM39wXVDY2LoFy4++CTZMYiXKGcMvv6Xi4hlGJdydD2O2/7gI
	juzyLE5A3j0NTYsWkXycZhHFe52FPCG2j8yC+aqamGzlW7HNLF8D+4sZS/awPw+wEOXVZ9KlHPs
	284RXMyUMgTHKsFo5ClAYU4BKuzyLKOWBPH6/x6ypRE16QLOT7bZYI7RLQxy8u9AGoxctHwASsY
	dGm8K6nf
X-Google-Smtp-Source: AGHT+IFnAzkhOOadrvOXWSDGzf+kPfjLpDwohhUu4l6LeAbOtGTBnyhEYnIeoSDJDix3CiMDzFUNxA==
X-Received: by 2002:a17:907:7712:b0:aa5:1699:e25a with SMTP id a640c23a62f3a-aa51699e2e7mr827925366b.10.1732522902261;
        Mon, 25 Nov 2024 00:21:42 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aa52e45391dsm318503166b.60.2024.11.25.00.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 00:21:41 -0800 (PST)
From: Wojciech Macek <wmacek@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
Date: Mon, 25 Nov 2024 08:21:28 +0000
Message-ID: <20241125082130.2390310-2-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
In-Reply-To: <20241125082130.2390310-1-wmacek@chromium.org>
References: <20241125082130.2390310-1-wmacek@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_002144_068583_B5D9865E 
X-CRM114-Status: UNSURE (   9.33  )
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

Add an entry for the MT8186 based Starmie Chromebooks, also known as the
ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
a tablet style chromebook.

Signed-off-by: Wojciech Macek <wmacek@chromium.org>
---

Changelog v2-v1:
 - Fixed items/const bidings description in mediatek.yaml

 Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d9..6191a5320c148 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -263,6 +263,19 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
+        items:
+          - const: google,starmie-sku0
+          - const: google,starmie-sku2
+          - const: google,starmie-sku3
+          - const: google,starmie
+          - const: mediatek,mt8186
+      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
+        items:
+          - const: google,starmie-sku1
+          - const: google,starmie-sku4
+          - const: google,starmie
+          - const: mediatek,mt8186
       - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
         items:
           - enum:
-- 
2.47.0.371.ga323438b13-goog


