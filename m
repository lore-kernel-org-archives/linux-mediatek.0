Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EBCFF885A
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N3LbG04sbEceapIPPbET9a4VVHgMWotJp1E25yUbVLw=; b=HA2vLW0zIntC4fJ2SAC6dZrFQG
	cGMtFxGcOR3xDxVbX/DV14nKJL/4iWwFK96wDPRki4HP688nAuKODIzPP2XjUnFib7o/DqaJazlv1
	0ELwrAfH+Mb4kJBRus4sE7DEK1FpXtnzevrSJ3NG96hy8A0pQZersH/2+wRsEleVXqIbWugAeIr6V
	epEk7pAbfVLTpasjOfKCuFKl2xjYsu7uQzJDXvecXdAsEQ1RM9LRj/zGkXDoDFpPZ39gGPm/rISEX
	ZVUN4WHuEZoMAmozOWvZZMlhlsshxcEkKyCsMjiIqFB2F756LA1a/Jf8gGZ2dfAR417npHh7eMEFf
	FWR2FW3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnW-0000000Fquq-0f83;
	Tue, 05 May 2026 10:14:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnV-0000000Fqsb-0KfF
	for linux-mediatek@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=N3LbG04sbEceapIPPbET9a4VVHgMWotJp1E25yUbVLw=; b=iMj0IcpSTm6pFY4tafb0dYwBRw
	OO0lnZ+wcoge7c/r5mv/H3zAoCNogUKRyiMHP1O2M28fqcC7C8oQ8LvAPB/D/mU0okOeovzCRJfkE
	OvMXuzTtvLEOGjODGs6xJZ7SsRMAyLdUSu7xjYRA5H/hC/ulHuuul1cpabkKrY7UnhVlVs9khLJCq
	GOQIFob8ojibwGBY26UOobOsNkYdYOwibHhV14DaGXPF1rtROtkw6MpsRNaYwNq50P/qSy9qy2LPi
	OLmu7bctFX24+VksuyAIRP4Gq1vLQoLLUkOpfm2+L+o8lRzSJnY+V1HgD9gh4NOjkT5jeRJytYQYx
	4NHRi5ug==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnS-0000000D9Wq-198y
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:14:35 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c801912c903so959450a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976072; x=1778580872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3LbG04sbEceapIPPbET9a4VVHgMWotJp1E25yUbVLw=;
        b=OYU24GRYy49nepdAMIi5LTh2irkSRYAa792Qi/Q+9mfU+kb66oOS3iWnGtfq1uATb+
         szFaWNAA4sKOai3rYVVw9xxmbg77AxPkD6GkGlwbIsxAiX0cQeJooNnNUzfCOLYqos49
         YqrtbW/xOdYlPMjkqkXVoVLGFtBSsoQKM6h70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976072; x=1778580872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N3LbG04sbEceapIPPbET9a4VVHgMWotJp1E25yUbVLw=;
        b=dJ9mprTFrKAF9bV0dlueXQ2gKEu5i3SyfKZIHbuq2JlE6WKIStutfwjmQ5QugB8mHJ
         IHLYrLR7odmpbEetFlodzhRvhFw4tKLrEimrcI7RvdJvEDOTZrzQKFQIf1bMFIbuvBFT
         jBGuWymWLUkallxkY07jqXRQqERBIAakX+LaistQKVDNL2J9dLtac58qkQseuisQy2Ka
         0oWFOXXvnkNqTvwZDYZ0uu4MYONwtD0bBgyNtV+Hwl+nwG+KK8of5cg13uzDSXj4e+df
         nwOC6yHtJsEWHTk5YPQGiOwQNrpGhSMW3fsglYkWwtCXij6rXlEraKlJ5f1ZpNolge3U
         6GRg==
X-Forwarded-Encrypted: i=1; AFNElJ8QXvF4KMvvQr87Ccg8o6Rf/YWaBvjxHvrnKwpUOJXkJqn7bTPJi0DLKUDQ8dvZ9DFoy7QtHVziBnfpG1rxzg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvhzECNtjXPj/1uxseASLpMLpduUyIDgnTTLPgKNCFiNqncSAs
	uklJKYt5j8biQYP+lyVE/Kv7gh/wdI/UrERTs9E862M6MuNyHzTUfLghbtLdDsjv7w==
X-Gm-Gg: AeBDievAUJWzUwWifPGdIvazBjz+gGDJiqikMPGwH5pdKhRXXHuRLV0qjLFtExgtKeC
	jEBCpdCFCs5+QGaVf/mJ1wrRD4XEHzqOKYQu1/BhhIaYyPdW9HWJWMZxu2Tpe9fPK0sg3pYjyfV
	J541Jq/14qdz5HPXUeWcklo9VNSJFcTMk18aRv8RATqOll5sqEKj0uqP/SSeB3C4zcFDAQUtxfN
	SQCn4FjeXUShlfCa8GAPaVFBGMHjwBVPa0UBNF56dw5A+cdCAgREUDl6cYLC7MhZ/l+1mfuWLa8
	Rcb+khJt1sLvWTksAZAOdGRO3LaN1bNbdFmrao5+mqJAcsL/gY5Rjdq4Y1mq2C14r5EBe8kdgn0
	KVkLXiq4RPinAuta2yWEPPRcIV82T0QjJ0tf/1ItnZeTd3sT4lmmkBda8TIYr4bWFwbMbOwKGmN
	vwFppFxwynPmxsLDR0pvVI166UbgDcef2QqT+ku51ncnooGQW6dhfb97N63R0therC4qp2x7F3s
	dI+t6DYJ57OFhUxBSY=
X-Received: by 2002:a05:6a00:a58a:b0:839:d76e:aa7c with SMTP id d2e1a72fcca58-839d76eae56mr407393b3a.44.1777976072154;
        Tue, 05 May 2026 03:14:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/16] arm64: dts: mediatek: mt8192-asurada: Add supplies for ChromeOS EC regulators
Date: Tue,  5 May 2026 18:13:55 +0800
Message-ID: <20260505101408.1796563-6-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111434_401890_AEE93EB1 
X-CRM114-Status: GOOD (  10.39  )
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

The ChromeOS Embedded Controller exposes two regulators to the system in
the MT8192 Asurada design. Both these regulators also have power inputs.

Add supplies for these two regulators.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 13960d1c8a02..d08ba6aec382 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1529,6 +1529,7 @@ mt6360_ldo3_reg: regulator@0 {
 			reg = <0>;
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <3300000>;
+			vin-supply = <&pp4200_g>;
 		};
 
 		mt6360_ldo5_reg: regulator@1 {
@@ -1536,6 +1537,7 @@ mt6360_ldo5_reg: regulator@1 {
 			reg = <1>;
 			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
+			vin-supply = <&pp4200_g>;
 		};
 
 		typec {
-- 
2.54.0.545.g6539524ca2-goog


