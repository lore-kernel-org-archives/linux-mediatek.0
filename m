Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F136C53219
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 09:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxBpcLwQpOW2vKL5WhYL3BFfyuddH3BZqW5fz8lS/T8=; b=TF58617S1pAPPdWkjZ+QvQYkeV
	tt/TNgRoUOP38EBTkHt9uNrZsLSCybLSDF0cECwnHGR04hzSu2RzJW7TUjzbABnyW5hvtvebxIeEE
	HNvZm9pR+dPSizE2KxdVSVGFSILgrYRoqFYPLEEiI1TQZuu4pRAOHIbYO4bTW2xAHaRWLNBtJW/j3
	Vu9HqZMtRTfD6PZYKxUbLQ2Ro11RiUtmHav9NwqN11t7M1Ofug9DhVSWFOy76+Cw5zYqXjjI1JaHi
	+yCNev5oFv+wAZnrYZWmOM9ebOY60MVS0ck2dKHFHmuVcdDq68wqfTNleTKdrHR5Av3H2Y5O6CW/t
	sgfKnjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHSG-00000002J9f-1EXN;
	Mon, 27 Jul 2026 09:17:00 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHS1-00000002IzQ-0fgf
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 09:16:46 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cbb85186d43so1144400a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143804; x=1785748604; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxBpcLwQpOW2vKL5WhYL3BFfyuddH3BZqW5fz8lS/T8=;
        b=fBKDMOY3/1AyR0NFtlmTUaBnpS6xTQWQoX73NfGroG2WRS7IG0dk8aF5nHy7KFqA2M
         W/yelXdLjrc6XS5K2cROORRCmNUVkUTG5AaEMG4B+ayad6UMFt4OHqQmZT2F7jEKUzHM
         JdYhBQdi6s+1o40HqCMzTOxOFXVKlhFSP3zCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143804; x=1785748604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxBpcLwQpOW2vKL5WhYL3BFfyuddH3BZqW5fz8lS/T8=;
        b=mGE0oIaWCSD8aX5IqjuTdc+NgP2xF7+JafJq8rLI9UjHDzjPulJiMD5yaDRcZqGNrA
         dMeNY2fhCXuNGInQMYJIwOxccu2tXqfD7qMgSgaUUsFyvVyQsGtp7hpATbbrrugIGgDD
         tdk/kfAe83iru+42yqdKst7sufB0D/tf2WzOkMBMfQyUEldWOyfTD6AVbkvd6ovSyxUv
         iXgkA/AKhF0LyyqC0mQqWMi1gLbGmkPj8WVyjcEnFCaoQw8CAZwuM9p0i03ou+qF25SC
         EScovXyqEUSxMRI2OundQY/qU7qs5g+9GpgmiXHLxg9oJYU2r+R/p4bU1zOrcFSOfjKv
         Z4iQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFakagjy5D0/LCriz78IPJ7I/IB05zShRZ0C4jsy5or4TwHVLJRhhNz4DoB14wACUeFz6jpRwuQuVVlxZdrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkYHwIgn4C0Q76ht+7Qqo7UJvmzE5yfjvQCUsjSQybMRLcOTBx
	HWB4Z5MMrfm/ugaRZhAGOkTx2RI8F+8NxtLXyKI7ZU+h3A5zVda36RpSs8FOJDZ4RQ==
X-Gm-Gg: AR+sD10z0z7yOkw8xYVUWRBJfkmAhV/ObZ+LogI5UmSknYZdB1VWwV859nDaDlveBvB
	0oTG4y0UiS/pJy95JM4D2e/PuMIFpAcn+FlAAtKIUfm2JQfpTnWxUiCjfJShpjTkPnJ9+HtYE9k
	ia1K1FrmAJF8wqmgk/FX5nyn+0bTtFQHn89y6MCAQ4CqfAM4eiRTzbDbpYqk9l61nGZVBEyUYhn
	CrJouzWGs3qvomXw6ZfOu2cEWbk2ByAatofduzn1h6Yv0sfMGTpoGa8V8LLRYqA+pwiE3tjuaxz
	5J4tSIAw6TCeafTWgPtYCPTzsK4b7X+hH/jTkEleP+eJlYYxeaLwKVshYezcP4Zs6+HmmJ/EIFL
	X1prOUzonJngkQvh1Q10zwm9+VlvgFKYY4BQflzth5I8WIa+K+gOMgZDRphYngHJlEYQd7HMcPK
	f+5kgAyvn5Nh7tQMJbBuHBJijSuM+xpmEpNq68IGcK08ZyjTDQLiZm3EwyKw==
X-Received: by 2002:a05:6a21:e081:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3c67da6f7dcmr7155408637.17.1785143804308;
        Mon, 27 Jul 2026 02:16:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH v3 4/5] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
Date: Mon, 27 Jul 2026 17:15:53 +0800
Message-ID: <20260727091555.1023910-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260727091555.1023910-1-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_021645_215977_05B8F759 
X-CRM114-Status: GOOD (  14.27  )
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

The MFG_ASYNC domain, which is likely associated to the whole MFG block,
currently specifies clk26m as its domain clock. This is bogus, since the
clock is an external crystal with no controls. Also, the MFG block has
a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
diagram, gates access to the hardware registers. Having this one as the
domain clock makes much more sense. This also fixes access to the MFGTOP
registers.

Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.

Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..556e806b7787 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -505,7 +505,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
 				};
 				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
-					clocks = <&clk26m>;
+					clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>;
 					clock-names = "mfg";
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.55.0.229.g6434b31f56-goog


