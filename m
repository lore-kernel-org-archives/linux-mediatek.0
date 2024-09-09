Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08021ECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 12:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1Ttr2z+4sVDsV8+3XUKUGFQBqd5IhKsFwImuWWsKWQ=; b=skL3R7nQlH/mF1
	udaj50zkEMaXZLgH/nOhLuJLp+qd5vM8iB4GrC8hzE1qdJG34hqR14qAt8/wYUNOdpuH4/4cmjvxc
	ZOZNDWOuSgroYTHT92S0OcGlNOipboiUNFkfTJikK8MxWwI+7XsIRagDWACgtKkrC4sUSRPglAYWo
	oy/wMNjU3udoaxpq3eF6QQCPGhYtwlxWJV9tmqyk5Gk3bvZg7o1vNk9WRFi+oCmfSlXkEeB8yLtyK
	fAuWXmJmjEqoo65mXgOif0S8uyLwHNQ6ACYSx/gX16CMLSVmr3I7ukAQ81ruP+5Pc9g6OJe3zz/PT
	fsxUdpF/Bl4GlQQZZCuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndnJ-00000001u4Q-3PuJ;
	Mon, 09 Sep 2024 12:47:01 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncP6-00000001dAv-42Pv
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 11:17:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2068a7c9286so37672175ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 04:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725880676; x=1726485476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1Ttr2z+4sVDsV8+3XUKUGFQBqd5IhKsFwImuWWsKWQ=;
        b=ToQkp3ke6C6QWRK7oW2YXOCk6MxaMUz5GEKg0hfyeK5NUW/1o5Cb31jswdAyDNk4VF
         6eKDKrFgQzQKHzpLqypb12B5dMJlagn8BguUNykRGcypYqwkduG3u0TaWCtQCj2QhLma
         ohJFOsM5Gj5dopIN4Hx0bE3WORx3/NXW/2hkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880676; x=1726485476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1Ttr2z+4sVDsV8+3XUKUGFQBqd5IhKsFwImuWWsKWQ=;
        b=ax9Sd8/OeLqTslKBMBNyP4CdJoC7CoKHLVREi/KILpW9n13QIXPilInViiu0KxKDGv
         3uLSzG07o2N8tcu8J2zRMG1jS+J//QcMsttsajMxXz7Mj7V1i2/TQdbO5ziGEwy+1M6o
         B2xUNnaXYU3sOL0u1QFxSb2jyoayA0ptIC2cFN4qKoZQwLIlIjI1CCrjzpPMhkUtJa7K
         +enjOHwZVVIn6W/iIkPklGCkEXhUPy9e+KvvsX9V8v299/vJI5gvim//GGIx8DDmaFOb
         1iLVWp9aM857/RktZxRaXd0Vh+NVG1sa8q4SmhE/wZOE5sxB95v143z7X5sywzwrRhnz
         rx3w==
X-Forwarded-Encrypted: i=1; AJvYcCWVdUyP8qfWRHLDF+J7W0FPHuSY0V41hFHWpP36mXIYKN0gC0IwH9j/3Vs5j44kyykkpuvV3vX58nAXuLOZyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCFtsfSz6kSeqqEeMx6w/UIiy49dgjYwIdxuw2oOIXOsbEWBL/
	BFU6FZo3X6SrIkq8yMh1iJNzavVTYDuYFRwfN2PQYNg2h9exlY25+OosspEZvw==
X-Google-Smtp-Source: AGHT+IEjDpYo7XNu9Z1/fDj+e+7JTbEWp4nu6rsFIS8qHBK0NlIS+dKadP5GapUDsdnDfnQtg1bSHQ==
X-Received: by 2002:a17:903:2292:b0:205:5410:5738 with SMTP id d9443c01a7336-206f051ee5bmr125183735ad.27.1725880675836;
        Mon, 09 Sep 2024 04:17:55 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:6647:6d5f:dd48:8f5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1dc55sm32039745ad.186.2024.09.09.04.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:17:55 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 03/13] arm64: dts: mediatek: mt8188: Add missing dma-ranges to soc node
Date: Mon,  9 Sep 2024 19:14:16 +0800
Message-ID: <20240909111535.528624-4-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240909111535.528624-1-fshao@chromium.org>
References: <20240909111535.528624-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041757_025322_CEB966D4 
X-CRM114-Status: UNSURE (   9.64  )
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

Add the missing dma-ranges property to the soc node, similar to how it
was done for MT8195 and MT8192.

This allows the entire 16GB of iova range to be used and enables
multimedia processing usages, like vcodec and MIPI camera.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 788dfb5484bd..dfbc50c878c4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -888,6 +888,7 @@ soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		compatible = "simple-bus";
+		dma-ranges = <0x0 0x0 0x0 0x0 0x4 0x0>;
 		ranges;
 
 		performance: performance-controller@11bc10 {
-- 
2.46.0.469.g59c65b2a67-goog


