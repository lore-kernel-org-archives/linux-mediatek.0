Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A20C25B6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 00:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nh7y/+UHR4rfaD1MdlnQhy3jizucTRA5pP5JKPfuUQY=; b=qORfrfTban/12P
	9PBvm9dyhDQcqNJDLyChbgdKfCI8vtC6dQsdTMQG574JqzNSd7DyoHMKnl/Qpd97ZDNz11D+HyTli
	STc96YrxtJgDfFS6rnFG8o0+2KOoI0pl5iZxk9xoPtYHaGVEegEiiaFfuN5EUGqAmbrR5+frpb9Kr
	Fps3oHDwYEYNilzZT0To7APZUGg0y0GvDgrLZn8f9Nf8mziWSCrmrJ0k3k71PLlQOFp0HSFbKPuBH
	vJc/aF6K9YKbAu3ePexR1D+HCqg6DCQ7bIEMflbenz4a7Di/gCuA5uMlf31ymGaeD2QPPRazRSm7a
	ZbnYg8Ni40sP9Zird5Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv4xQ-008Urc-1e;
	Tue, 24 Oct 2023 00:07:40 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv4xL-008Ums-19
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 00:07:36 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c434c33ec0so24357065ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 17:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698106051; x=1698710851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nh7y/+UHR4rfaD1MdlnQhy3jizucTRA5pP5JKPfuUQY=;
        b=leKQmL/9pAV3WlRERlIshWJdq5HiTEsfw/H9vcp9ugRcRZDika1dln42frO1Git9/Y
         74Z4tTrSqpvW6snG6kRlBFYeNcHdx8u/c1wTzgZInDFEbAAefqj3fHiBpe6eHS8g9pl8
         2E9Pp4/Cq8yesiW/2THnTuYsPlamNn0isDVyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698106051; x=1698710851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nh7y/+UHR4rfaD1MdlnQhy3jizucTRA5pP5JKPfuUQY=;
        b=bMcAp0leSmD6B+qL7T8gQG3GFUA2E5elrsTfJ5JEUqEpO9rnWAUc0jSP9KToa/M2v7
         zNJzPsJb0VRaXnOW3Yo18LUaMjVtStuTYmrv4lBtPG1l9kXZXjqNSbho05oe0eXUQipo
         zH301h1MMto4dQH2NLJDHmer4NO3YZzYd4+I5JW0UAhy6ubt/r7ZrTNIOl7G6dqoEJWO
         YFv6mbW8KUAn+nMJEnmgrQx5GwNSAJftCAgMOH2i6Wf79xpba8xzumHmynmPVOBMBcfF
         VK+8tRuGGXotkRSTC+R3o8WtPsm1dgvtgiwqMK2PoPEJYglddugolBXoetD7Ca6JVrhh
         fkXw==
X-Gm-Message-State: AOJu0YwBAk7W6qhTueGwcphptsSMWPWtgyJu18jP7aH2lWL621TGNY+e
	2mqENPQCkyk/nORjQNoK4FhM0A==
X-Google-Smtp-Source: AGHT+IEnbELuJfwTbSKJpQL3L82YAF2nHCHHuweCeoPOIKHXo8oxA5ZYmCAL+Ez/OQucHg3ovI5ADw==
X-Received: by 2002:a17:902:ea09:b0:1c8:9d32:339e with SMTP id s9-20020a170902ea0900b001c89d32339emr8959999plg.50.1698106051216;
        Mon, 23 Oct 2023 17:07:31 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:5a2d:c345:7f3f:d26c])
        by smtp.gmail.com with ESMTPSA id a10-20020a170902ecca00b001c5dea67c26sm6505510plh.233.2023.10.23.17.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 17:07:30 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 1/6] dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-katsu
Date: Mon, 23 Oct 2023 17:02:24 -0700
Message-ID: <20231024000724.57714-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231024000724.57714-1-hsinyi@chromium.org>
References: <20231024000724.57714-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_170735_394593_3897AC43 
X-CRM114-Status: UNSURE (   9.23  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add katsu and katsu sku38 which uses different audio codec.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index a5999b3afc35..fe8c488a3207 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -235,6 +235,12 @@ properties:
         items:
           - const: google,kappa
           - const: mediatek,mt8183
+      - description: Google Katsu (ASUS Chromebook Detachable CZ1)
+        items:
+          - enum:
+              - google,katsu
+              - google,katsu-sku38
+          - const: mediatek,mt8183
       - description: Google Kodama (Lenovo 10e Chromebook Tablet)
         items:
           - enum:
-- 
2.42.0.758.gaed0368e0e-goog


