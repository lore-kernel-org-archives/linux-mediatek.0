Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FD7C64EC7
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Feb 2023 10:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZlTyV5gXSWpUhRTyRZWDDfy9ZYKtV/X37QY0RZg8Qc=; b=F5gjXb+3NPbdOPfEZ4DM98dW5e
	g/TBQM28rDDY84z/VsIihK0yARcObwGoZyX6CM+DI8mzPsu4sBZLDbKuyuDiO/wxVISHE1s68AU31
	c7bvgR3CZoR0WuKriLOiVKwoK11Ue+DWLDHOWLdUODAQEEJJn3U/njbxbVx3Y8ZJWdmbKO+o328Vp
	SsWsjnmDzIhISIAVch0zs60oU36XpTHPY3b9ApzkFVH67TpyaIL1PyLzlaHE2gWNK0GpJ2vSa7o1t
	zXxvJ6EKqtlyja5KUlV/6669zBkKs6mCXEFeIGZ2hkOq/pifP65YLE7A93SoXX0z/YetotiJsEQJY
	3Sb4ZYSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVrcK-005Sh9-EN; Sat, 25 Feb 2023 10:17:24 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVrc9-005SZo-7f; Sat, 25 Feb 2023 10:17:14 +0000
Received: by mail-ed1-x532.google.com with SMTP id h16so6815925edz.10;
        Sat, 25 Feb 2023 02:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZlTyV5gXSWpUhRTyRZWDDfy9ZYKtV/X37QY0RZg8Qc=;
        b=lfNgoABENzvAU9vbrDDeIhipKTEOAzm+1ypKOJOfED6srDbCB+THw/3/nsmJfXTk+j
         9P6wrt3CNxTndnx7wHv4EdutmhyRy9bhOllkOpgCzTtmqKtTeLKYKNFTAO/lzDwr0rvV
         5fNGKbXpqTyeAT6OfF0478xebq52pK+D2jLjHaAYhrzOtfwr9KmAVEpQ6P6rLZLiTQ+v
         ujdYh5GrtEimemw1iBAfWwk4Uust9HsNXs7fPaGz3xFG7xwWV0u0x3nr7A0Zt5fuc/2Z
         HLa3y2auSiKZvwbHDAAm+EvVu1Q9dQiEsRx7hRcSmlgbiDVfCqG1faAQZaSpXs5nDp0J
         zWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZlTyV5gXSWpUhRTyRZWDDfy9ZYKtV/X37QY0RZg8Qc=;
        b=1to3oFD07FCpO2KsHLFASDfOg+VPz9kVGINmVhV41wr3fwTARPqmIklfEUDyCELg0D
         u52QF8zBOh53LsfF7agH7Gva/z/wfyWoWplPc4/0dq7XfEcaMwd8ImfUNX5Fz3wqvgvB
         N/2gF46/9WRxBW9zX5FEx2bB8dxocUiKEzcyjL32RMmNXtZ/yTmP/DYLzf5rU1Wo+Xzb
         1b37GiB/STAI/VOFbVq4fwIvmfi+8AnjmNEroeKC9Q33loMBBoezR+MusW1jRQ8LxPe3
         RhZFYHk2nTqCWGl8gW0Exj8aXnXFTcQ6dOHec1jw/3WToTdAKLi5BjbdJRkm7TOt3jQ1
         cmUA==
X-Gm-Message-State: AO0yUKUnGeWSmSgQUgg+aaEDrWSD0MtjrFZtHRMWNk1qIyqhOwnYUMb/
	s0GuMfyXdKnZohFkZzewKdBLHxTp+E4=
X-Google-Smtp-Source: AK7set+p80yxwive0vFrfuDaRCkLAO2YhJ0YF72bVGf3x/DXOphxfSCDrLe8RInslHnX6xHo8AlhOA==
X-Received: by 2002:a05:6402:845:b0:4a3:43c1:8431 with SMTP id b5-20020a056402084500b004a343c18431mr3099829edz.5.1677320232660;
        Sat, 25 Feb 2023 02:17:12 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id y23-20020a50ce17000000b004af6163f845sm677722edi.28.2023.02.25.02.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 02:17:12 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] dt-bindings: soc: mediatek: scpsys: Document MT6735 SCPSYS compatible string
Date: Sat, 25 Feb 2023 13:16:28 +0300
Message-Id: <20230225101629.264206-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230225101629.264206-1-y.oudjana@protonmail.com>
References: <20230225101629.264206-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_021713_304184_8D985791 
X-CRM114-Status: GOOD (  10.80  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add a compatible string for MT6735 SCPSYS.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 Documentation/devicetree/bindings/soc/mediatek/scpsys.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
index 2bc367793aec..54ba2e06403a 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/scpsys.txt
@@ -10,6 +10,7 @@ domain control.
 The driver implements the Generic PM domain bindings described in
 power/power-domain.yaml. It provides the power domains defined in
 - include/dt-bindings/power/mt8173-power.h
+- include/dt-bindings/power/mediatek,mt6735-scpsys.h
 - include/dt-bindings/power/mt6797-power.h
 - include/dt-bindings/power/mt6765-power.h
 - include/dt-bindings/power/mt2701-power.h
@@ -20,6 +21,7 @@ Required properties:
 - compatible: Should be one of:
 	- "mediatek,mt2701-scpsys"
 	- "mediatek,mt2712-scpsys"
+	- "mediatek,mt6735-scpsys"
 	- "mediatek,mt6765-scpsys"
 	- "mediatek,mt6797-scpsys"
 	- "mediatek,mt7622-scpsys"
-- 
2.39.2


