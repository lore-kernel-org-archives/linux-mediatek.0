Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193C5C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Nov 2023 06:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnUk2lN233lJF/YyaHvDp2l8ZWBM31IpiG9Lcizf72Y=; b=GB8ToYAiZw7xgZ00NSBbmHycNx
	F06SIg/gqjX3oecDobhh+72WIBkcd+Q0VzbNyZ1zN9BUdRB+5lwfYgabxmhx0MdoD/Hcy2nPQa34P
	oyf5C6Nz8xF9y99CwJXIXH3L4eWn33x6xKayS5dc9KVUMZtQpGpaIFXGIN6njMJ2Wj6Wsw4zC2Xqy
	dIJ7La846z/oOfwcFOZ4NlDTZeKvGsczuFaeYXKake8bPYnP0q1gHY1VlLMFyc+BX/71o0IwzlD2a
	VpbF6HmSLMct444jpu22NZ3IWITJkU46UO3muvA8saXImt73//m7t55EXMu5hLcVJiB/HElNDb28A
	7afErGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0cCm-00367O-35;
	Wed, 08 Nov 2023 06:38:24 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0cCk-003666-0k
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Nov 2023 06:38:23 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-da7ea62e76cso5367017276.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Nov 2023 22:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1699425499; x=1700030299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnUk2lN233lJF/YyaHvDp2l8ZWBM31IpiG9Lcizf72Y=;
        b=jviww+6BBAOLDja4C03xI5D0YOUulC6W3xrvhwacRbObMsYLvqJP0QFJ++CQVOva1J
         Fnn1/TC1PkVJZUA0b6t7qFWtO+0er8er5JDlAwvR6pEvvBuTm28+OpphzNCBtbSy4Ogv
         E2SC1OVkHg0LbgVGW83bbyxmDSKU+3quB/Yz+pcGVG6BEaaQQtJ9MbfOg6a7zGime3at
         hKq1vatiqFZzn1/+inEzL/G/TR6bPAWT+YXVv0ZmjOCHWqTGkUz3z8S1OaFJJAArwAxb
         3Yky9fEu2FvhTTKYotDmKdWeOIQkH3E3oelKpQzbD3VpvDAzYVRxVE+fz9rQL2+l4Vkd
         uObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699425499; x=1700030299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnUk2lN233lJF/YyaHvDp2l8ZWBM31IpiG9Lcizf72Y=;
        b=N8DT2wYSRU8x0dO5LiUUyXEusipql0d4W/73AR6/Eb92f2Muvtuf9/CXd9aWTF+lVJ
         rVgtZgf8dY+3tx/yxDFtYNMMW2wR90wlsl8WuZB0SsdvzhbBtJUYWxAuXKnfwmIRzLfH
         xJ1Ugj6fE5A4PDui5Fs+7cIVPlNay7gWGyx6wViLSWx57fWm02n5ZZBTk0LlrfvIzmoe
         E20xTHLmPUKU7QhM484OtTWwg6kdazlufA6bHln13h9sxTNPwURIB83RvRzH2MnFAtJv
         fAXWg0GfixS0wtfZyWwZkEO48adK1shVUwi32Iu2zsH8hYe+z+G8p6eztkvK0yWkgLBL
         10oA==
X-Gm-Message-State: AOJu0YxtH6Tu26APjapbRg2UovPY1r5tSQEDv11p5I2wX3Qf49XRYGSA
	rA5TBW9LKiG445xDzu/rHREKgQ==
X-Google-Smtp-Source: AGHT+IHvElmDIAzzTZgl3H9gkvFKWs2kG+fqXmHaKSyPbD5f9Ly/HwL680gzesqVZn1vwJHktE1dqA==
X-Received: by 2002:a25:da56:0:b0:d9d:746:1f0a with SMTP id n83-20020a25da56000000b00d9d07461f0amr1026355ybf.8.1699425496149;
        Tue, 07 Nov 2023 22:38:16 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id u8-20020a627908000000b006baa1cf561dsm8588660pfc.0.2023.11.07.22.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 22:38:15 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v3 1/3] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
Date: Wed,  8 Nov 2023 14:38:02 +0800
Message-Id: <20231108063804.592982-2-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231108063804.592982-1-zhourui@huaqin.corp-partner.google.com>
References: <20231108063804.592982-1-zhourui@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_223822_269287_94C75C0C 
X-CRM114-Status: UNSURE (   8.02  )
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

Add compatible string "mediatek,mt8188-es8326" to support new board
with es8326 codec.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 4c8c95057ef7..f94ad0715e32 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -15,6 +15,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - mediatek,mt8188-es8326
       - mediatek,mt8188-mt6359-evb
       - mediatek,mt8188-nau8825
       - mediatek,mt8188-rt5682s
-- 
2.25.1


