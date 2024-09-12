Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3995EED60E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENHzAa0J3LYULKcETMFEp8gDeg2pft3wUA50kLkpahc=; b=j+54l7nVFRp+wpnaYFlIJaLGfN
	UpKBMUlbsuerh7NhBbUWmtnZCdtq2qWxLi/k/p4Gi9r8W/myKXAzyny39Yley+jkq1iNV+HgHIAhr
	4WzqiZ7mYWZvaj4/y/ffS3EpArXXaak9Exai5jPm9DqCReWW98OCrHl1ncaecjabdDEM13FBT11vP
	zb+QOd1+g1ARPJdo0n2jWpvkhsQ3q9jl6X2MUFqFfOJwJQGnYEfNQSpV6iROXw+bAjduAHMZdEHYs
	o1ReHZ+LUR1uPZwxxdNAFLibyByhn6tlWHdbDNcn8qViVE1r6c64AxqI3BnFcBTlQJAXswuHoMVqx
	OdkDZkgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sol5y-0000000DPsr-13ds;
	Thu, 12 Sep 2024 14:46:54 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sol3t-0000000DPFN-1QvW
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Sep 2024 14:44:46 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-718f4fd89e5so908101b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Sep 2024 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726152284; x=1726757084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENHzAa0J3LYULKcETMFEp8gDeg2pft3wUA50kLkpahc=;
        b=TYpc2HcYytKQvVfayZS/Ct/n1rYs/MFtZSV9kqcZ76b8OGkUDiThmXB2EyIGIqf0RJ
         xybUprFnZAoD2y9PrYWByciKVbut9+rj6k3tulhSaZJ07OZcLILVvu0FcQNMcUSUCV0F
         fdtOiVO4h8p0fsv7/rm0GECqhBAbz61IqawFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726152284; x=1726757084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENHzAa0J3LYULKcETMFEp8gDeg2pft3wUA50kLkpahc=;
        b=w7KBj/cuYgoIyNhKU3861UB3vNf2BkVKzFCkP219hce6ULxsLqwzt8JvSTdx9Z4X/5
         LqWSEAlTq4aTd0uM0VwZV0Cx6la10oE/PB+zV31FIZC9LFrFn7hQy2pKLaDCflRWvFO1
         ZXD6pbkKZKyN8E+ZWg9R+8Ov30eU2YrroJAYKfjBJioj/BJj40fidR9DJJeMIXeFJmOQ
         fXd7lx7zLMuqvQ+JJJy3Frlo1N/euSDSLjwwzEbp+50r+bdlH22T9UlGIkIjtqlkqx6z
         zeLFAJdQJgZXF1OruVBZw/ENCxu5pnZvuL5aZIGXSoBlnCPohZR+BrAWr+349LSO0wwy
         FDFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0w1WNyN2QzesaQtJ1A1KB/H6VfecBYA9DN+X7w5LYKr57r7LaoOdAV3ZorUsakoiESna0seb6MongHqYcVg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGyPE3JBppl3rupanMtNhKrOFQ4Kg2zqQlqnCBhFIX5BkZtaMj
	tj5mGhYXR0StGMR1eJxliGeEzffH3FOpaOg5wcuqNVjVfuwaWbm9W6K0VHaqHA==
X-Google-Smtp-Source: AGHT+IGmocmHhOdJqPoiASVWIbhrUvuzbyP0frIxr5SqJiWxgxpjRkvqPtBS2tOxjv28s+maVvPRJA==
X-Received: by 2002:a05:6a00:1790:b0:706:a931:20da with SMTP id d2e1a72fcca58-719260654f6mr5526880b3a.3.1726152283924;
        Thu, 12 Sep 2024 07:44:43 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:8638:897f:b6cd:8c44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fdee186sm1826269a12.85.2024.09.12.07.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 07:44:43 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 2/2] arm64: dts: mt8183: Add port node to dpi node
Date: Thu, 12 Sep 2024 22:43:59 +0800
Message-ID: <20240912144430.3161717-3-treapking@chromium.org>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
In-Reply-To: <20240912144430.3161717-1-treapking@chromium.org>
References: <20240912144430.3161717-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_074445_438372_E0F0E1BE 
X-CRM114-Status: GOOD (  10.50  )
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

Add the port node to fix the binding schema check.

Fixes: 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409110843.Hm5W9upr-lkp@intel.com/

---

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 266441e999f2..0a6578aacf82 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1845,6 +1845,10 @@ dpi0: dpi@14015000 {
 				 <&mmsys CLK_MM_DPI_MM>,
 				 <&apmixedsys CLK_APMIXED_TVDPLL>;
 			clock-names = "pixel", "engine", "pll";
+
+			port {
+				dpi_out: endpoint { };
+			};
 		};
 
 		mutex: mutex@14016000 {
-- 
2.46.0.662.g92d0881bb0-goog


