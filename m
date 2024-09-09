Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79FDECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 11:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eSPMDqXmxOOBZ2+bT3H0bytGBe/kVJSeEJXvBbWjwBM=; b=4N0shEdCSzsVry
	+r7fJ/Ku2s2CqQKvdR61NPm2/Yx3r8Q5LZF0iHZrk9BgMh+SVAf3PE2WHQVdcEQE6SE0UJP+0tK43
	xaZPLdKFDh5LSbjIG2hPaEmdYXPgiJ63zmEQ6H9dFbtX0ApiZWB25M7r/s7+zKEWaAy9iRHOq7VKx
	MmOBdpeDG5VcRQ0UGboGWYxUkgMqGgVB6TNMXOC0OTtmqKQlxh688Q8BqtPYNdng3EP/BevwaGUDR
	2ReK21Bg4HUwcOC2Ody2ekZs2WwXmjY4YTK71YIVU22mukwbX++9QMgYDLO0OR0sGuw5jQJwOE6Kw
	fFeBLUNCRMet/1vutleA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncj1-00000001hOo-3vbF;
	Mon, 09 Sep 2024 11:38:31 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncPB-00000001dDM-2vFH
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 11:18:03 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-205659dc63aso40368825ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725880681; x=1726485481; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSPMDqXmxOOBZ2+bT3H0bytGBe/kVJSeEJXvBbWjwBM=;
        b=MxjfHqfYpJ/nxvN8xsV1HVQa2+6Inf5HilziRzjlH5wNj4EYmrlZ1UEUFsjbOaE+j6
         1b47nANhMw6CPzpiq9Kk5XYTwjNsUmLah7sRt+WQjLrvAURaNLqu0lMgz2LNkq0gG0VL
         XxVh4e5FkgbmCq5Go3H636Hb8UqB9URJ+IMAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880681; x=1726485481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSPMDqXmxOOBZ2+bT3H0bytGBe/kVJSeEJXvBbWjwBM=;
        b=W1VnhZAn0yVVYEWHBQxoe7UP1KuCdMoctR5P9U6q/NtvkyF1m3kaSlsuBv8oH3R8k4
         jJZABHLp0jfeLK2XfyjJHd75q36CPRBol4GRRZLLg3NH5G6M/qms86/xE34GNYljTrEl
         lbnvvH0PhrPBPyqPbMZ62fpHkC7M9isqKrfgTUMtf1JmrRPMDkA6CXX6uKr0kOD1/h/d
         Pc6YmAqe9RhsuP/w/bSDxwxXhaMOUcpZJGOvsOzRUrYnUq+Q64PDUdQ3Hp/0pHG2fTrz
         VwzwqhpbEHrfEAXcvrYh5SgB0r4MBOXZQt9af34tUb306liQIj9hBRef1GKit56B5KnG
         iF3g==
X-Forwarded-Encrypted: i=1; AJvYcCXx5o3jIJ4HNiChmWt9ayolyW4OPwhXUkFYK8onuHpNXrLtPmGZwZevE4Pb/w9VfLtZ0eYVYz9Y2K93piviZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTag1Fu95atzENdZ99mazk3QU3JJxfLE+IZ6jXIw3uDQ5n85Nw
	OBgtstMwLEOHIl7IlyJthUVbI5fcfyzslNckr0zVoy2ewjWN0vVJMvnuofkrNw==
X-Google-Smtp-Source: AGHT+IGHVTuEQzGi8BTEcqf2mCRiL5XS1yhXsk1hu/kaz1W0RCb0r+W6kSM7h0W7qrtU4wtKiSxLSw==
X-Received: by 2002:a17:903:22c1:b0:1fd:5eab:8c76 with SMTP id d9443c01a7336-206f05e7881mr97040825ad.41.1725880680731;
        Mon, 09 Sep 2024 04:18:00 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:6647:6d5f:dd48:8f5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1dc55sm32039745ad.186.2024.09.09.04.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:18:00 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 05/13] arm64: dts: mediatek: mt8188: Add missing GCE clock names
Date: Mon,  9 Sep 2024 19:14:18 +0800
Message-ID: <20240909111535.528624-6-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240909111535.528624-1-fshao@chromium.org>
References: <20240909111535.528624-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041801_816323_722A7EE7 
X-CRM114-Status: UNSURE (   9.19  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the missing clock-names property for GCE nodes to fix errors from
`make CHECK_DTBS=y mediatek/mt8188-evb.dtb`.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 445d30eee2a1..2900d78b7ceb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1316,6 +1316,7 @@ gce0: mailbox@10320000 {
 			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
 			#mbox-cells = <2>;
 			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
+			clock-names = "gce";
 		};
 
 		gce1: mailbox@10330000 {
@@ -1324,6 +1325,7 @@ gce1: mailbox@10330000 {
 			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH 0>;
 			#mbox-cells = <2>;
 			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
+			clock-names = "gce";
 		};
 
 		scp: scp@10500000 {
-- 
2.46.0.469.g59c65b2a67-goog


