Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35EACFA750
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 08:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gil00WTRUs28RjwOxxPhf1SQACB/MVsyKZW95qYNQ4=; b=0vCeOuxtj9FuOZ
	oWRtqOJWyuy06c9hTFjGxCkLesFg9pxoQUAqYeETC9PI3OyIcTFVkD0u6IcALicY70KhKbkV4egx0
	wUJaVUmGeR1Kp/gCh0EsaBPmTV+bSirtHn+nHhM5ey1p1jN7T/9qa1a1j29F9bQdE3hCh9AN6vze/
	a8f2bUfmfUqQBJfe24DV/r4lguIV2BcrMnX7ufcl35HIQ8/mL8lCgUkARnqQCHM3agJZhKqVC0TsQ
	HJHFRppRjJ1dPYZFPU8jgF+0PFfOtM9Ec7CYzAKnljL/xMcTCOPf5VTblAsP/ouOkc5it6+wFH27r
	tVbBGp87wCM4VWfTAxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdTm-0000000BNF5-1EI2;
	Fri, 04 Oct 2024 08:16:02 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdQf-0000000BLyA-1sOb
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Oct 2024 08:12:50 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e0b0142bbfso2094695a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Oct 2024 01:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728029568; x=1728634368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gil00WTRUs28RjwOxxPhf1SQACB/MVsyKZW95qYNQ4=;
        b=IgUnbQS8uf+4i/1i6ygs3Cuzk0cMrxyrh0urh1mlykF6J0bkYacPTdYF9kRHDczdV2
         T809MZr3tUQJfj8pXH/j8j7Ox+Mki/PEbNyJh5RgG4IMLIviJLuSKfIBHavmzotD+GLp
         gDn74wVV7ZXpe7tAuc9WQg60gsZNWGEpXWIO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029568; x=1728634368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gil00WTRUs28RjwOxxPhf1SQACB/MVsyKZW95qYNQ4=;
        b=mIYdl/77vusBejnxt8bfdd77vErlnIL54ChmJxqxXn6FjFZ1Ofy3jsjd0k9fDX6Grp
         uym8nQqQf9rvCyEClzw4dp1a4Jqbp5q+jUEg39C2tBmu3laE7RjSWbsggiYnfVfApnTO
         0d95LWaSebq01FwQUSZR4NLN8LqXA08RzHfThdY8YhJ+/fI4LA/EoDt4FwZGeizx/BF8
         ATPpu22H24Bwhn1vVlos/tJIoDkV+p2S+tupMWH/Yy0+qMc0girRggx6hE1BadluV0Eq
         WOWHfT1LbCjSKHtUcijI64ggm0UhtvNlwQrhc6rTMqPthG/FaA+Mx8AphJgAoA/Eo+at
         ePiw==
X-Forwarded-Encrypted: i=1; AJvYcCWnyQsqJWmvWPIhXGDV9o7MYpaB4Y9zX/RvB4CVbag/vqrEx28Lhj7jIB5z58RSArLO5E7S8PR6Y8M7yT2ujA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yybgl+3uWjVwz6IgyXciokWU5SAsoaTtNps0eQVjCRLAH7PEagK
	KuydW7tu0sbKPeaQz72eEZ2I21Jq3AreJ3LTCDsgRheL9B8qt6Y5lBAD0UtNAvX7dwlHhkMgMTY
	qUA==
X-Google-Smtp-Source: AGHT+IFn9dbv1FKSmefLnlaSAgdh6flAWmhvi+pxqutep67yPjijwY7klZoIY7dKHPFmh46np4cNkA==
X-Received: by 2002:a17:90a:a004:b0:2c9:90fa:b9f8 with SMTP id 98e67ed59e1d1-2e1e5d62794mr2987730a91.10.1728029568545;
        Fri, 04 Oct 2024 01:12:48 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:73bb:cecf:e651:2ce6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beefad264sm19401305ad.205.2024.10.04.01.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 01:12:48 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 1/9] arm64: dts: mediatek: mt8188: Assign GCE aliases
Date: Fri,  4 Oct 2024 16:11:53 +0800
Message-ID: <20241004081218.55962-2-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
In-Reply-To: <20241004081218.55962-1-fshao@chromium.org>
References: <20241004081218.55962-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_011249_513241_04634DD7 
X-CRM114-Status: UNSURE (   9.07  )
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

Create and assign aliases for the MediaTek GCE mailboxes.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index c02a93c1663f..e216a0b40b9e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -23,6 +23,11 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gce0 = &gce0;
+		gce1 = &gce1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.47.0.rc0.187.ge670bccf7e-goog


