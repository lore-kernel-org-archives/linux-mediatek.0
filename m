Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2133FC10DC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Nov 2023 07:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zy3bexk/UdkiFEYq/BgshHxcfzBMkkII0D9hrrzOht8=; b=lbyXPIAYXrdriJAV/92ooEQ5D1
	N+/29bpLk0v+DmOo0JP29m2yVZkv3Lu0i0l1AMe8gqTUNyssoHRpI+524UejRiJvJBC0qTLAmrQx3
	jtFYb5OMcZgDyqb0eqjuty2WTEHWre/JA3dDU00kOhJgaqckBQh9agsWRK/qv8B64yKVNx2cWbGBP
	taonVzoZX2vQ1Ks7eUIBW8mrNRR+zuNOEAkbVgtW1l0M7G8g2m9BCR3s8v1TdDmtG8gam+ZVzuYrJ
	nyMSDg1KcGbhBDdUyFFBgF86WRaj5t2et0o30arpVYsCr9rXJ50VE8KmDzBDmV5SnZzuSPjLRX/G/
	426ZCufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8bfQ-00A7Ne-0F;
	Thu, 30 Nov 2023 07:41:00 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8bfJ-00A7Jy-1N
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Nov 2023 07:40:54 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1fa20395185so287076fac.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Nov 2023 23:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701330050; x=1701934850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zy3bexk/UdkiFEYq/BgshHxcfzBMkkII0D9hrrzOht8=;
        b=BDtghXMbGY+BAnQXbZENx5JaU8FQJUujyATsIFREOxiQ6wvGJBjwjfgobIqcwRgvQ4
         NOYKyanT0y4X+3VDeJdkLiRw2h4Zkp5qFMkBY1jl3cW88xFZpP/Gy+h2Duc267UZHdbw
         6qWitmFditksFnRA6rxSRCRivyvE/h8GlRkA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701330050; x=1701934850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zy3bexk/UdkiFEYq/BgshHxcfzBMkkII0D9hrrzOht8=;
        b=E6bjww6uEw2+QKLp8LgmJztzcsHui55znnttLebzYd8kn1s9CDMdDjnyErwCN1F5bq
         DqMNgpzugs6cmV/7mhn3bSNP31bLIqQQLO3PndQ1qCUei2RUA16lbbwsM8c5JkZfFTum
         Pt0pmWMXJLkwvnsh97SC9OszQjHK4WUt8jNRbBaWAJC0bzA4xSYJyUVFedIuheFjj5Kv
         5eOvfHiiOdqVmm4wqLjQtJHGJ+4nK1QmIlabC6nHEz/qYfTmoY+1H2J2qHR3FAbBUK7Q
         DtWN1ife5GJJaJHcuo9/lZPtLdpk6KgMcynKwk2/0jjehEXV+gpv2RZwO+BUQAeWlalq
         7YiA==
X-Gm-Message-State: AOJu0YxF/PEObdj5M7//iuVzdKKj33ZU7AFdIsnPG6K5Adb7pPZO2kDI
	gPPWu5TWP7y35Mpfh70HznxLLQ==
X-Google-Smtp-Source: AGHT+IHwi9RcnosuzpIAvSOXNm0G5GIasdXoLS/n1bNO323T/kQvMYm8EOB8Q6YuOyc1t9+FjbG4JQ==
X-Received: by 2002:a05:6871:7588:b0:1fa:25e2:efa8 with SMTP id nz8-20020a056871758800b001fa25e2efa8mr18245153oac.15.1701330050507;
        Wed, 29 Nov 2023 23:40:50 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7c8f:dafd:65c3:2bcf])
        by smtp.gmail.com with ESMTPSA id p35-20020a634f63000000b005bd3f34b10dsm612870pgl.24.2023.11.29.23.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 23:40:50 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8186: Fix alias prefix for ovl_2l0
Date: Thu, 30 Nov 2023 15:40:31 +0800
Message-ID: <20231130074032.913511-4-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231130074032.913511-1-wenst@chromium.org>
References: <20231130074032.913511-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_234053_461464_FC4CE95D 
X-CRM114-Status: GOOD (  12.32  )
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

The alias prefix for ovl_2l (2 layer overlay) is "ovl-2l", not "ovl_2l".

Fix this.

Fixes: 7e07d3322de2 ("arm64: dts: mediatek: mt8186: Add display nodes")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index df0c04f2ba1d..021397671099 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -22,7 +22,7 @@ / {
 
 	aliases {
 		ovl0 = &ovl0;
-		ovl_2l0 = &ovl_2l0;
+		ovl-2l0 = &ovl_2l0;
 		rdma0 = &rdma0;
 		rdma1 = &rdma1;
 	};
-- 
2.43.0.rc2.451.g8631bc7472-goog


