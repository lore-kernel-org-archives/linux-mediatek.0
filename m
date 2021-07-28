Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4D8C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 04:07:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75F9360EBB
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 04:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75F9360EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pg72spnwJaObGDqDkzWs2+L/HjVee17XglozxS3PsZA=; b=QfuYfX5fqfELvV
	hat/x+K+yZ+tJROpEzvzlvoKxqWKetFLRqfjd4RXGJHEhUzBxeTex9VbF80OLgi8/CMM+X3DzsNkH
	AnlyqiGbr0vkPPPXiXgmdu33COAQVmu+kSgK2EuP0NB0PRrlIDVUajrgFLCp7eg7Odhovmp54nbrU
	TxY2rC1BtHzUkRg+ABvdpHzAvIVB7bUNv8BqjgfiZwaNN3QV8PhSPn/OZKeGPwiE2LbGd2YWgk7Au
	ylGN1zIl2NXsRFv2s7wBh9BvQWwl9A5JSF8iV409mPi61ITtCryuU6LtlW55hb3hSAbZjGhNRMbb+
	Yqc6nKxFJPDT+G97Q3qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8aqy-00H12U-Ca; Wed, 28 Jul 2021 04:07:32 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8aqk-00H0yp-2d
 for linux-mediatek@lists.infradead.org; Wed, 28 Jul 2021 04:07:19 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so2307386pji.5
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 21:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pks90ivSERYpMZj4hwgFuxICQ3PbMdWHSdug+r6DdN0=;
 b=fN6OB9+rOqF2+0AFhpPtM/haCGqRJ7JsODJOFsCEcERuuTE3aB5cIrjUKdhQwJ8CII
 LVp+mM1J0c/7BLHTLg9gnQhyGP3nQ64G6jaiMP97sFY7vxwaItPm8n+1OvUMvyB7jQfC
 NX7Gls4xWfl4rgH6SxBlHQNP3qk4b4mbNEF98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pks90ivSERYpMZj4hwgFuxICQ3PbMdWHSdug+r6DdN0=;
 b=C1xHGYpduM7nV5f31rmHy7B93+jWByMvPV2bae6Wn+LsOvTN7KUKV87N3UzlYyiadh
 TtsNL5jH9MVz4Rc4cNaKCwt8cp7SdubLYSKqHQokpn+jeTfkBbFZoOnXEFH6QmFbXza2
 SOVVYFOOuxHDnIgffCwxPLsQmLUiNtpwQADqZme8LzyqEeP4JIDCFIV6z/Te9SNh6ske
 5FSWcCTOMvUAgbdU0d4nSMk404phXlbbqFNrf29tGsNnZ5I74Nd0/VbIs+8/b1OQ7Rtj
 +xrW+7X6F0hOAEbULRkjv6Huf+l0o3HXjKXNbnAeci/erJqob1384MBaUOjuuWJ18ILp
 wjCg==
X-Gm-Message-State: AOAM531ZLy/31jd5CG0lan5GsjvjnUiE8ouOFhV4dA8jl1KOdV1Wbfyk
 NpG87dYrzHiE01KllRzHosRXAg==
X-Google-Smtp-Source: ABdhPJzA5Yn7qXrzqWhBBZSJiX8eTQpgB2GRbV65UIQ8yec4OJwIMR1tPd7b67aFSc/ImJX+yARX9g==
X-Received: by 2002:a17:902:ab98:b029:12b:acc0:e18c with SMTP id
 f24-20020a170902ab98b029012bacc0e18cmr21358229plr.10.1627445236800; 
 Tue, 27 Jul 2021 21:07:16 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5176:76cc:2193:9b8f])
 by smtp.gmail.com with ESMTPSA id 6sm5536012pfg.108.2021.07.27.21.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 21:07:16 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, eizan@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] arm64: dts: mt8183: kukui: Use aliases to mmc nodes
Date: Wed, 28 Jul 2021 12:07:09 +0800
Message-Id: <20210728040710.2891955-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_210718_199677_40411057 
X-CRM114-Status: GOOD (  11.20  )
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

With commit 1796164fac7e ("dt-bindings: mmc: document alias support"),
a way to specify fixed index numbers was provided. This patch use aliases
to mmc nodes so the partition name for eMMC and SD card will be consistent
across boots.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
v3->v4: change commit message based on review in v3.
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ae549d55a94fc..8e9cf36a9a41a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -13,6 +13,8 @@
 / {
 	aliases {
 		serial0 = &uart0;
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
 	};
 
 	chosen {
-- 
2.32.0.432.gabb21c7263-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
