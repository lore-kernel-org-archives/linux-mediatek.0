Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9D7C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 10:50:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 662742312F
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 10:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 662742312F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h7tadABK3pyTnv7gCHlEqQNqk4AVDMr9RdazuWAHGiE=; b=GB0nLGI5dGVyslmS3f3ZVi7Vv
	ql3IlTZFsmkWUjfI3/nLkEIY75fj6nF6pt+vC3VOf883qsX09OofOV58vGnGg+MmFclO64N6zrWVD
	0BirDOrUOk+0ggC3YrrkOQ7m/zwCJ5E78cY/dPj2gCXMXGJbMmGjvEiV8atNnlb6XSiFUmIgfCNFD
	dPqHWzhvlOxb1Eh/TZaNXezzV7d3f6tZRQ9YlR2f/ahhFO9zlBG/OMun6uj5TiI9KnP3YRdimZzxN
	kR1YDdhp0jITPy2VCgeIfPvBsDrt+3gsPaditE/mj+BumZm/0eZy9lICjN9KdBI5EV4eybVXKc1i2
	X0XZlBFag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxSrZ-0005fp-D5; Thu, 07 Jan 2021 10:49:53 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxSrL-0005ZL-4u
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 10:49:43 +0000
Received: by mail-pg1-x531.google.com with SMTP id v19so4548741pgj.12
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 02:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iFfCx+LuozwWLtVN8azhQEZlQYaFV/Z/K3Si+kVMmvA=;
 b=M2C8UJWYctlfBsoEloYIC8eHhdbSZatpZnoZ48cwQVMpzTLaeLX2J6QfMH7VrNlV1j
 q+sleU6zxAaLR6FJR+cCZZHLfHAVoP7Nn9dy5wTxrQ596Je1cm8z3bwFrOcYvO8wQm5b
 +mFu4N+xuQ01jyqhnhWNajpW3YvQP156W/Oiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iFfCx+LuozwWLtVN8azhQEZlQYaFV/Z/K3Si+kVMmvA=;
 b=A1MXCPo1xOQZxWVLbPhJaY/Gf4AjRi4YOG2XD+UoVBaCDOIs49OmN20LbMbCxQKiGb
 rR1ayg6ARNgSyAacxXyCzOqYZeXQz8oJUxB7sta1i+os4JqW2V4vSOSnvtzs60LdB6Ss
 P0VmUSypRYb7jHeY9NpsbjyUz51Fjw2QDLDIWjEiJ/h5oW1tcd/7QrSv/spnGoO2gs+n
 cbDXRXATABSCf455yrefO+GUdZst/iWDAyGnk0wfW64/yEIDgPQRn8vHuRrqull3m3rf
 acmNHgCTXHqx8kqCHPnksn15pTilFP6B+COknTk34h4G03krhVb0OM08xtdzl0fjyPKZ
 8IgQ==
X-Gm-Message-State: AOAM530tKtPCxD5OhCVKW26+9lN9rRz//Pvb1fqy9o9LYM5ktmNmfg8B
 ac+FASQpP29i10IcyMyexh0Iug==
X-Google-Smtp-Source: ABdhPJzK0f3Ap54aR5l3MHRTWPZFN5C44dJQBKmXlnRYhT+kskc6pRlqcYllRbLIUaLiuXN+ZxPS2g==
X-Received: by 2002:a05:6a00:134d:b029:1ad:b17:dbc4 with SMTP id
 k13-20020a056a00134db02901ad0b17dbc4mr1639504pfu.53.1610016577313; 
 Thu, 07 Jan 2021 02:49:37 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id n10sm5381974pfu.176.2021.01.07.02.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 02:49:36 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8183: Add domain supply for mfg
Date: Thu,  7 Jan 2021 18:49:16 +0800
Message-Id: <20210107104915.2888408-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210107104915.2888408-1-hsinyi@chromium.org>
References: <20210107104915.2888408-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_054939_285123_3BFEF651 
X-CRM114-Status: GOOD (  12.43  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add domain supply for mfg node.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi       | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index bf2ad1294dd30..ebd53755d538a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -709,6 +709,10 @@ cros_ec {
 	};
 };
 
+&mfg {
+	domain-supply = <&mt6358_vgpu_reg>;
+};
+
 &soc_data {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5b782a4769e7e..bda283fa92452 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -360,7 +360,7 @@ power-domain@MT8183_POWER_DOMAIN_MFG_ASYNC {
 					#size-cells = <0>;
 					#power-domain-cells = <1>;
 
-					power-domain@MT8183_POWER_DOMAIN_MFG {
+					mfg: power-domain@MT8183_POWER_DOMAIN_MFG {
 						reg = <MT8183_POWER_DOMAIN_MFG>;
 						#address-cells = <1>;
 						#size-cells = <0>;
-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
