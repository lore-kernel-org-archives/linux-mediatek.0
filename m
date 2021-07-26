Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737DBC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 05:09:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B47BF6056B
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 05:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B47BF6056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BxoNsLgrew+fVdXlkzM2H5WYjeh+LzZN1zwUrha56Ms=; b=a5p6q6+3/OtYr5
	x8edHGr5y/Gol+uDEZ++d7kBm/2RQMnt6jnX6tSJn3AfIZKRVT4pjB/6voZOu+j+AluBoUDfvbN4e
	N/6iLnx7d/aPnE92hkZuB9befGhpmye3pB/TNM7V3+5IJinIiVmAA3qMhvIGYxXitKYV3y1OIl5qe
	WovWnguTCG5bw0TZFLIED2HdL7JrQ87rt1Uojg9Kt1Er3omtBuYS6E65wjlKnp04iK+BrhRR3QmtB
	Dcmz+2IdtpTH/OMp2y/r/a7dHog2hVM3mRqFUpOQcizLLaXGgTsgOG46KZPM3F8Csq6WHcZQawF28
	IdhwmxSOs/H9CDBxFUEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7srC-009c4V-Om; Mon, 26 Jul 2021 05:08:50 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7sr9-009c3X-TI
 for linux-mediatek@lists.infradead.org; Mon, 26 Jul 2021 05:08:49 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 gv20-20020a17090b11d4b0290173b9578f1cso12126036pjb.0
 for <linux-mediatek@lists.infradead.org>; Sun, 25 Jul 2021 22:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q19QZx3IM7uTYknYeZNzKDjl5AnKkceiIehImoXzjxY=;
 b=CZwPjWqV6j/Knp8s+qP42VKurVJ7iRtYSe7bZAsIb0X+kP/kjIqY9XEyX+FF/s0oXS
 OVkuYjiP7st6B/JKf5Mcff0AmZmDvoBaE6dDbA8MLHCfceW0Vyit7zkCByRGqUVTKHPj
 B0BNVVDg/Nx+woF7Ld5wL/jT3mYvue9wtfkTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q19QZx3IM7uTYknYeZNzKDjl5AnKkceiIehImoXzjxY=;
 b=HQEWVnJj2SyB+bNoHBZk/yO+XaeWZKR/beqF3ZF2v94B6BURRmQr8jFhNkdhG5iD5q
 FV9i+127E0aE1l2HhqlYOrRLJ5wIlkOAQtC6KbK73b8Dv5whfsBAC6VIhoS+zQus7+pJ
 HfcQgWhFXqLsYCV1k9qwxw8yY9E/Y8McnboQI+ueUgC3DHHzwllqg1I2pMgvk3kzHUip
 LE9YeMKOdyStYlsD1jH7s0bVJzZ/qAZ5H+hVzk/F0QjDBrFTrPPgcchO6IqvhzL19RC3
 MHhHTlwh2uNjIhdB6IdtFfL4bLc42BQWdefTkyYs5AD3Lrym8wBh3kNRTmuekpjTEzjf
 6Omw==
X-Gm-Message-State: AOAM533xCHZk5wLsmlDFFvD5pVzQ5l6LuEEwMGjexYw2oLZaw1sewtkK
 EKMuGRQQZexX/SIwzlba1OWnCQ==
X-Google-Smtp-Source: ABdhPJxNYNIzJ6h+knYVR+R+nInHYQ0LoXhr0E0f86kyTkieRytU+Cg57mNifxFausYXPKEyySAXsQ==
X-Received: by 2002:a17:902:c10a:b029:12b:565f:637a with SMTP id
 10-20020a170902c10ab029012b565f637amr13037468pli.57.1627276123312; 
 Sun, 25 Jul 2021 22:08:43 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:24d6:d449:2832:1652])
 by smtp.gmail.com with ESMTPSA id a20sm39810768pfv.101.2021.07.25.22.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 22:08:42 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, eizan@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mt8183: kukui: Use aliases to mmc nodes
Date: Mon, 26 Jul 2021 13:08:31 +0800
Message-Id: <20210726050831.1917982-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_220847_971024_04DD2CBC 
X-CRM114-Status: GOOD (  10.49  )
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

Use aliases to mmc nodes so the partition name for eMMC and SD card will
be consistent across boots.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ae549d55a94fc..ed499e17b6570 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -13,6 +13,8 @@
 / {
 	aliases {
 		serial0 = &uart0;
+                mmc0 = &mmc0;
+                mmc1 = &mmc1;
 	};
 
 	chosen {
-- 
2.32.0.432.gabb21c7263-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
