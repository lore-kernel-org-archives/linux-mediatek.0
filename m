Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38CBC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 03:08:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0FCE61108
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 03:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0FCE61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k2ALxIqsR+gS7/Gd5ISq8kx4vteO7kvMKcWMi06fa5g=; b=wm2dwun22oZsKh
	B+EOeK5wWUD6NJ26bIlrvgYohwOyrLF8ysPZvQtN6LDGB68Iwr9CxZJGmYnVxPgtMmbFstx/vjTk8
	BNja6+nbe5Pr35xqW+ut08vxd/BjZQHRSZR6XlRCAOXuZWCOPa01j03uvIr0txcSxFSw5yUL9POa5
	sQ/ZAu/5z3hwsuhvcPaNdjra5SQGRioiY5meL5SgTVOR0pqu14LF+sJ6n4peLxUKuxTpTn/BYMmUw
	mLX8hEwwQ9tJpUhVVNKRMsLd0IMBpUQFEbbvFWjXh4LCHetJkag3rbhAglll9SSlwikDKioSGpBya
	vIlN1jzAZTP8l55hv5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvWlq-005T19-1v; Tue, 22 Jun 2021 03:08:14 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvWld-005Syn-3r
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 03:08:02 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso1395077pjb.4
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Jun 2021 20:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lkbW9hluwcztIOh5kOua513vVzY59E2u/mei+FpwsSU=;
 b=RkwrsYDbtUQcWzbVeDSJAQgCYy9gRaRRqozIRYV1yWbYfhv7cdakF5J3Bv2BUngsfK
 hFeLAZPesXvPVBLBNLFE0napPJPxpRWdvXy5QwbvejJwJkDMbYaqL24vsX5nu6api4WC
 +9MX/N1/6gkIAn8RNjfy/zz3PpXPQPBYS/XsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lkbW9hluwcztIOh5kOua513vVzY59E2u/mei+FpwsSU=;
 b=QZKhBIE0kT33RlfkK1KkM2wKNCtj8UqLniaahPxJ75pYsH6Rh5c5kMCqwUdQLVjHVs
 Gdx7vIuC/7eBPlNSpRzraSBPAesX1Se9emiFFaoMJOmfbsaTYwcCCx8iVBAYc4JwDuG3
 Hzn3L/dYxRiUYViTjgQVdaGOAmfTLu5APCr499Lzv5aIgEu8aK3wmUY7MUuorGC41lOP
 0V08MC22R3JmNJDT0ASLzEwQwW2l6nMXAVueCDvFStYedxHTuen8fwFiCoBLUW6AFpTY
 KP/ywYwktz0toouOppiQhuF/J+72gUdoZlPGz22EYIeM3Hg7TXsD3AzpBKj2tRX5LOH4
 sgDQ==
X-Gm-Message-State: AOAM530n+DOGahENz4Nj1uvbhNzplUJCoNAFM7kMm5mXRnm7llCiH0dH
 eANkKz5g84B9eeUGySirT034Hw==
X-Google-Smtp-Source: ABdhPJywluBdydO/3+koxsNDeRCsfm/8/sSu9Nh+eXDSX8Lh9XieDEU9gLyfXK1qghmIJoNiqBpV6Q==
X-Received: by 2002:a17:90a:c002:: with SMTP id
 p2mr1501687pjt.132.1624331278548; 
 Mon, 21 Jun 2021 20:07:58 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:aaeb:6e67:2eb9:f492])
 by smtp.gmail.com with ESMTPSA id z6sm13740722pfj.117.2021.06.21.20.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 20:07:58 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jassi Brar <jaswinder.singh@linaro.org>
Subject: [PATCH v3 RESEND 1/2] arm64: dts: mt8183: add mediatek,
 gce-events in mutex
Date: Tue, 22 Jun 2021 11:07:41 +0800
Message-Id: <20210622030741.2120393-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_200801_222212_3619B85E 
X-CRM114-Status: UNSURE (   8.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mediatek,gce-events is read by mutex node.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c5e822b6b77a3..cf22d71161e58 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1250,6 +1250,8 @@ mutex: mutex@14016000 {
 			reg = <0 0x14016000 0 0x1000>;
 			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
+			mediatek,gce-events = <CMDQ_EVENT_MUTEX_STREAM_DONE0>,
+					      <CMDQ_EVENT_MUTEX_STREAM_DONE1>;
 		};
 
 		larb0: larb@14017000 {
-- 
2.32.0.288.g62a8d224e6-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
