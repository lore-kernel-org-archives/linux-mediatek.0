Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85255C369AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmVpDCANpDWXjfc77hOC3nlqo3wLCB+cB+2xYUcVaDA=; b=gVMlDQ/PHIjFT+9LUk7U16H6n7
	dOrU2c7SICWdy4N2dYszpPt7Wot4Qsg+rzIzLdD4dCgiC0ZPtDgjzkhjndk/wW8FCDZ6sUCnxhN9n
	EWymSeTKb+UZSiofUYqirnxsiRsTWpfAi4nHwsAWqPV9BsbTHOKXs6K1qzP1ohfBxoSXYkuWDLkMq
	NmAYV+WOKHowVyETYWFopvBiNhOT3LtoZIqmpg7DxeqGSw7NqFYTeedawoYJ0/CLGvwdP0LOXjmrj
	LlfxTgIkrYEUDSIHaB+ynoCDqczLnteyeBWo4GZ78cEtE7YPmbYjzxwIyZi+jVxaJDgjEKcJZol97
	I5It/saw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7v0z-0000000DuLf-26Zy;
	Thu, 24 Apr 2025 11:45:13 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tmJ-0000000Dfcz-2INc
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 10:26:01 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-223fd89d036so9368605ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Apr 2025 03:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490358; x=1746095158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmVpDCANpDWXjfc77hOC3nlqo3wLCB+cB+2xYUcVaDA=;
        b=JC9uoW4kSaCTWO7B5OfhVwr3rNqvfDx09n1pLRMDXyB6KXj3uC1OZQ/3CTbi8tR8gF
         DCvy7msa98A0LLJLftnYtj8r4933/jA2Hp6Z+dtY8YvaQKueLyBcra7eRi6Fg/Mk+Oq3
         tIqySEdhZlVsvnTlN76JwRlwxkVpAcR+7SwoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490358; x=1746095158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmVpDCANpDWXjfc77hOC3nlqo3wLCB+cB+2xYUcVaDA=;
        b=ocGB5tevoutKqBheMNePy7ECkuaJ+MuccRd50h4grIX5d37SuyTGDf79igwu4zTVqH
         sqdBSgNmhYu+JQnmh4g72jhSeG6zZTLEMqkVebYnJDJ2TL4F1wX9ENH1dOsm/FhnEMLQ
         aBl0OSgh5RAMjgXQciKoVTXaqm/cR7/7PSnOxrIWJZIF4vaeBE73ubvBPKaRuWPJjvto
         HuDXC9Gm+zLa/bolPGIi9WjY1YOsBT6YOTRRB2pRP24a8Uo1R0pL4n6LQfRl8jAJ1Rsx
         3VQUjc/SAzo8/VG0zVpkUANxBT4QsSps1efUC+etb7FX2f+xn3YO7vAO4ClZfMHLUqRn
         KAmA==
X-Forwarded-Encrypted: i=1; AJvYcCUnpj39RTkiEBdD9ybeohyQZx2ERsuFKhTdjLmhNSVm5RPljrN4zveava1Sn9GfhXNgA7UBwvmjNreZGbYwoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YygFlVkk40hMkh08yxvj7xIzG0ldyFTI/ZUMNaHUmqOf+37C2d9
	NwtUIQsIe53HVMlv0UQzyF+eqCYSHjl1nwJZCKx0VRa0D6GVQ75BKwtTVT+RvsshBkUk4JrMVqA
	=
X-Gm-Gg: ASbGncstFCwdqqS/8zt0zg+OYAIjmWX/9fiXThAEgAwKyGn1wwmn7yZsO1oQHq525UX
	FkTZewoJoHqG3VAybvbQ/y6bVTvZBmgx2mnejtDZA0G5FpnnZ24MSFP1Ar2aZ6eAFPQ51W0+w5P
	MR0mirnDs3MHFeiNL+XQHkNYqu2B9mqGCeuew8nn6D5Lz/Dn7NgDRLrapbkEtMhYDblb4E06tch
	9pRZjOvYK2YVaJdEE5z81GchvBNX5RRpBUoOEm4/YfSAcLnSiofCnuq4MZ0uvvJDoMdlgPnnD2Y
	+mWNUZRzdTqwafUnpSvmlpcj4Y+hutQW89DshyytjC5jEq0duBy9v13jzA==
X-Google-Smtp-Source: AGHT+IFNUWW8GiZ4JqKUF9pP/L7lY/ZM2afy9ZsZUC4Qoy35aYMkl4OZHCBcklsXj7mBYosm+Ajr0Q==
X-Received: by 2002:a17:903:3c48:b0:229:1717:882a with SMTP id d9443c01a7336-22db3bae48bmr32665265ad.4.1745490358416;
        Thu, 24 Apr 2025 03:25:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] arm64: dts: mediatek: mt8186-corsola: Reserve memory for audio frontend
Date: Thu, 24 Apr 2025 18:25:06 +0800
Message-ID: <20250424102509.1083185-13-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_032559_581658_DE0BC5B6 
X-CRM114-Status: GOOD (  13.30  )
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

Some MediaTek platforms already reserve a small block of memory for the
audio frontend. These platforms reserve it at a fixed address, though it
is unclear if that is due to hardware access restrictions or simply
compacting the reserved memory blocks together.

Reserve the same size of memory on the MT8186 Corsola family as well, to
align with the other MediaTek-based ChromeOS platforms. This also helps
with memory starvation as these devices sometimes end up in low memory
conditions.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index c864ed495702..b139588ae246 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -161,6 +161,13 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		afe_dma_mem: audio-dma-pool {
+			compatible = "shared-dma-pool";
+			size = <0 0x100000>;
+			alignment = <0 0x10>;
+			no-map;
+		};
+
 		adsp_dma_mem: memory@61000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x61000000 0 0x100000>;
@@ -310,6 +317,7 @@ &adsp {
 };
 
 &afe {
+	memory-region = <&afe_dma_mem>;
 	status = "okay";
 };
 
-- 
2.49.0.805.g082f7c87e0-goog


