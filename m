Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23E7C5517A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 16:06:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D882206C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 16:06:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mPAmt4nG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gc3wETkf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D882206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/tK2/a34owRPLZXZNpyJTG9FWGhN/AzDhFm3wzwONVU=; b=mPAmt4nGe7MhMEn7eI6usSadec
	fpwVewlV3k2UW68qfw27TwARuqRjN7ONx4kz4U2EiPhBOK0N2fmF0p6No8mkcjfg4STFL3gh359qO
	qqEDLY0vFiJYdJ2iyQuyjWcT2xf4M1swDLlVSTiEFYTY7D5h5H4ffLpKnIZBLAYjX0jOo5DxOlFSC
	T58c8UvZaxHK1Ayuz7unA+RhsvfqDQWFtyV99CcIC/FIzvvJU6MaEyVc+i8ITswUQ3A8kCm+joQw9
	pwhuUncv/IdU0TTzdVkp/XwtUJN4n1j/ffpg2IGngS85k053kfKKeLGvsUoGbKurJrDLETKXhfM0v
	GqsgrFWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXRUk-0008Bm-Dg; Tue, 27 Oct 2020 16:06:46 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXRUb-00086C-8S
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 16:06:38 +0000
Received: by mail-wr1-x441.google.com with SMTP id h5so2529614wrv.7
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2020 09:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2o0NP0S9IKMIYtZh0rK85wpdZyLqH3CjfIzafWh3T1M=;
 b=gc3wETkfZTjfdkDofvqk/rEFWOyZf/bsJh0lBSp4vQHy7Xmup3eUSnw0ckfNsMTlKc
 7qI0BUBC6g9BKYJP2QxOnBQY0WwTJ4qFmAIS7pnW7erJjxnqwbjpUyhU65bOG69ASDtX
 32MSBAfRRU1msgTl3ycWW1oIG07Nz7Z06ppDOy0s8jsIe9ajHSEQTZRHMiyjhfE5G/kV
 wSx83YYM4BUtB/Til+Psdi8mMYz470jReTlXEilugMS+GkbYA5dvWuiWoY/1v17vkE5E
 2Mf3vPTWa6G70bMLabvnxNa5WNbXhaXG5DXvElQz57gEIeMF38qvGRks8mpca4L30rgr
 JI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2o0NP0S9IKMIYtZh0rK85wpdZyLqH3CjfIzafWh3T1M=;
 b=KExQlt7dyD7iTIIzPAQWWOZXdVk0Q8FtTOX2jl0BW4Gj+Sg3o8GdNbhBhJGop8G3XW
 9ClDr5Rlpecpp+IiKfaNwVUtu0OFVWLR/v1MvmwwtyxCSuF3Z59g9p80df8Ete/jGVyH
 frtc2N8/vY0Xd7WX12oKdP8iviA04fJy4K+MnJ5KaTI6qopG+sluFuY6JrrHAf1qplUk
 PoVwZQmMYcfZhEVsNwkWWvC57LXLxcnlED8EDWZBoNqjvz2/2dyqXX36h882jBWoVhpq
 LMgdESNq49UzEWSSiFo9SDZVUiZSTy573eKxai7wBUlPnbVh44GSuPmvj9IWP7gG2Yh8
 E8vg==
X-Gm-Message-State: AOAM531eL06kwh3BomjRUBxGN6u+fx4l+RDLbK5ens7quEWi4pJQgUND
 8itjwHiPwpgWH1BVbl3BdneYxw==
X-Google-Smtp-Source: ABdhPJx7aos5PzrahnnOd9RdHxUgT77NM16RV43TCCat0bwz+NKJkLk+zqi21kJ4IXAXwFVHn5MHog==
X-Received: by 2002:adf:e885:: with SMTP id d5mr3732878wrm.100.1603814795825; 
 Tue, 27 Oct 2020 09:06:35 -0700 (PDT)
Received: from localhost.localdomain (159.174.185.81.rev.sfr.net.
 [81.185.174.159])
 by smtp.gmail.com with ESMTPSA id u15sm2656988wrm.77.2020.10.27.09.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 09:06:35 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/2] dt-bindings: mediatek: mmsys: add mt1867 binding
Date: Tue, 27 Oct 2020 17:06:29 +0100
Message-Id: <20201027160631.608503-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_120637_519521_3B2C3475 
X-CRM114-Status: GOOD (  10.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation for MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
index d8c9108c3b4a..78c50733985c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
@@ -13,6 +13,7 @@ Required Properties:
 	- "mediatek,mt6779-mmsys", "syscon"
 	- "mediatek,mt6797-mmsys", "syscon"
 	- "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"
+	- "mediatek,mt8167-mmsys", "syscon"
 	- "mediatek,mt8173-mmsys", "syscon"
 	- "mediatek,mt8183-mmsys", "syscon"
 - #clock-cells: Must be 1
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
