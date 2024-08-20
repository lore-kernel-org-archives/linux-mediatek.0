Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C1DC5320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Aug 2024 08:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iox3pW+t1+/mCNWqBkSwh8gOTlOVaTTolmdqxDRdGuE=; b=W01DndrgAHKg8WzcO5WwpYiQcc
	GnmMgzobMiNOTWG0hEvg8Jtq9QVqPizOoKW8JFnQlwAcovlHjU5wUnLXV5uGITPzrPlkJ6Ed6SLGz
	ryfOkLz7838x6drU4fNQMfRqv0eic7udBhjEong5gg28ZfHj8RBy6oNpo/iLOp7/mx1lbHAiYHNzq
	oq8KAapCKPauGShJTvbOesqcwPN7bYrfdkgmz5fmBSk5p6egYtJYuwdKlyD+/DWfvdqhO/jq9njQA
	ampWRPfiqK+W8t+vZfG2+0TQ5bUq/QaJ9r+E6W9XnseC4q4y9t5NR3AVVJasw12sXTAUY5JxTl+ER
	h9gfB7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgJv9-00000004KQq-020x;
	Tue, 20 Aug 2024 08:08:51 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgJth-00000004Jxg-3scs
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Aug 2024 08:07:24 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7c1324be8easo4279155a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Aug 2024 01:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724141241; x=1724746041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iox3pW+t1+/mCNWqBkSwh8gOTlOVaTTolmdqxDRdGuE=;
        b=RmjkHZ/czMH0ZbTGiLSoQ2Cu9piskv+OtNSK7F+KDsuaiPjst92n2J4E94rBKqelO6
         JClf9L6CZAA/y5cJAuYavEyJH+2Uj7xa8u3xXWuDe3ptePa9pPl9wNMqb+zM1p898njQ
         d5RUF4iEMbdBVZ9pptrUjrIgVAJT+J/hQKbQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724141241; x=1724746041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iox3pW+t1+/mCNWqBkSwh8gOTlOVaTTolmdqxDRdGuE=;
        b=VZTdhw+JIZ7jwOEOIn5W6bgHcVqEHqxmUuQjXQqZmetenWBZNl9f0H8YzddFl5GZIE
         FIaVO4+FpSlzzddUuNvi1Ax//gCcorxGBAuP4CYkfQhfEyViWja+kL3qbmJ0JZs1GsvD
         TLpAID5u9NfdcqrNhgc1n2y3WixQWzhizFEeajJlvGs3Oo6qZhlmbDeyc4QBqpk1+b8G
         gU4g/dQK9DqJCxA7BuRsnoAkdEi3pr3++guHjVhvAvMzO86puEC0/10IZtpGoFJAdNvu
         K04/nkIEDueRd3Hviwei68+wvd/A1HFzIGwneQMH3haLUrNBRyGqw73KhwNXeSHAcJTY
         98mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv7TaYjmzp5p/BQymGXp1O7iCMLS5JGULQHQrJdokRVFFsgJ4h+IZUg7h0zJqCqhvf2dm9oC8fVdfD07yraQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdlASK+ZDVb1doWNZIscQABjHxEw04zQamaNSKSqocHmm6qpX3
	TmYg8/gzZLOPAaq8Rw/ZIXRrlcJOMi/PTtfWlavmQHyG0t5lRHXcgzxDPJriCA==
X-Google-Smtp-Source: AGHT+IHQpe/xH18Gz0WxkaiRSQ8MloxnO4Qm6+EYZVdcVqYqIRvsLVNRO0UiYRv0FQyI2NXLjvAwEA==
X-Received: by 2002:a17:90a:ce08:b0:2ab:8324:1b47 with SMTP id 98e67ed59e1d1-2d47327c70bmr3278247a91.15.1724141240742;
        Tue, 20 Aug 2024 01:07:20 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com. [34.143.174.185])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2d3e3c752aesm8640053a91.42.2024.08.20.01.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 01:07:20 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8186: Add power domain for DPI
Date: Tue, 20 Aug 2024 08:06:58 +0000
Message-ID: <20240820080659.2136906-3-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240820080659.2136906-1-rohiagar@chromium.org>
References: <20240820080659.2136906-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_010722_121655_410C8E62 
X-CRM114-Status: UNSURE (   9.08  )
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

Add power domain phandle to the DPI controller in mediatek
mt8186 SoC.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 4763ed5dc86c..e27c69ec8bdd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1824,6 +1824,7 @@ dpi: dpi@1400a000 {
 			assigned-clocks = <&topckgen CLK_TOP_DPI>;
 			assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;
 			interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_LOW 0>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
 			status = "disabled";
 
 			port {
-- 
2.46.0.295.g3b9ea8a38a-goog


