Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FB1CFC52C
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 10:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lGAj2jLrEzgkhSMMiUrwfy4iHgtWvXHx4K4cAraijBo=; b=QdbWWZ2UPBJbd7
	aiFAoGPe7hoYmFJeMRQOd+QLq9nk1l6u0I1voNXPdi+cc0KLWDppl09NMnl26KZ8zry5bxa/sps38
	I5BD5FxNrZ+G2NTAhAyQnzofvx6EAXe3QtsEQF048l3bD5SbBnCymfN2BqrVga1XtODJKxlJFD3f9
	rWxtazwPIJu9SF4ahTwrYLNoq1OuDwYcxc4DvvG94GK1XoyXoyGvuU/FmpoMKTRFGFJewxpHQjOQK
	AZX8Ats3w0zu1LscJ9x6XGzRSM/vj64s6s1HjmmI3ySEQJKGgYkZifGjHYd/Vem3PLIjbvPguVxEl
	5BkYUPx7Ip6sGgPU1sHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Hus-00000004dJm-1VeZ;
	Mon, 14 Oct 2024 10:03:06 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Hew-00000004aZ4-3D60
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 09:46:40 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71de9e1f374so2810831b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 02:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728899198; x=1729503998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lGAj2jLrEzgkhSMMiUrwfy4iHgtWvXHx4K4cAraijBo=;
        b=VI9I2aWW5zhQ54h9xE0LkFBWda93/yqPCh2ou1s/WvjbaWx1ey4U/ijl45n1JatJZS
         f1H/OlmJeg714UFQZuljwaB0RCikQkNBVfjsjzb9UTOWQWyZUvxe5/CxIZ0QONAzYqHx
         /x4U53sxHYN0q1rYVeqmjL7xj7uawVOPgvNCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728899198; x=1729503998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGAj2jLrEzgkhSMMiUrwfy4iHgtWvXHx4K4cAraijBo=;
        b=m8CI2+asNmJ44r7IuJMPrxrijMbc4P/4LDnO1YOoROeHzLm9vEF9ZmrotWV9dcObnz
         sVnN4t2z0W4x44wDwzkq14e8gyAi2sJlPxHVW8oPQcYstjzwOaCQidVIv9X/GKPAKDQh
         hJBOtdnQf7zbyYYcjYlQlYXpH6w2mY+RVgBBl4BluB2FI9BDLM+EZ5p6d1r6DqrUxd7k
         DtCBE41q2VCU/qRR5rwF+r3yBBFmy6Egj4Jq8N81CtLWIcwnId/eVRMcy75wqaJ1Aw+A
         Wicxz5EQ3DPLKiymMIO+YkD7rBHeu4aMySdo0dyJ5mnV9ovHxjRjhas8ki7GW5o+fep1
         xJpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsT6Z7n1zVD4DvpbB552hoLvJiyXYxj7KWaDPyjcpDtVL7W3FklxAT99Cdg57rG1wHzkfKzM/fUxazvKKUzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YySOS2WAAcfcqWsy7fRJHHuvGJQMeXAeMUp8RVh2+QFIFWgO8KX
	0wfM2wcyS/qvMCv2GLbuL5Elw8mtSBE/binaYaLhkKiKDzc3/OkWXLXrN+QZFg==
X-Google-Smtp-Source: AGHT+IGZNvapvPp6Etbzc/rr1MG2WKLL55pkoqmLVJ0fD4PI/ZmMSCXiEmbU2xQIPmAA26hDfWLABw==
X-Received: by 2002:a05:6a00:2ea3:b0:71e:69e:596a with SMTP id d2e1a72fcca58-71e38074bc2mr17890339b3a.25.1728899197736;
        Mon, 14 Oct 2024 02:46:37 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:4907:d52a:1a1a:58d0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e4868e657sm4891705b3a.67.2024.10.14.02.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 02:46:37 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] arm64: dts: mediatek: mt8188: Fix MERGE's alias IDs
Date: Mon, 14 Oct 2024 17:45:31 +0800
Message-ID: <20241014094622.1720289-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_024638_854227_16E7DCB8 
X-CRM114-Status: GOOD (  10.18  )
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

MediaTek's ovl_adaptor driver requires the alias IDs of the MERGE
components to be indexed from 1 to 5 to construct the MT8188 vdosys1
routing path, since merge0 is particularly reserved for vdosys0
according to the mmsys routing tables.

Update the alias IDs to ensure that ovl_adaptor can find the correct
MERGE components, allowing DRM to initialize without issues.

Fixes: b13ecb7c6f67 ("arm64: dts: mediatek: mt8188: Add display nodes for vdosys1")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index b493207a1b68..8c2667ac2b64 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -29,11 +29,11 @@ aliases {
 		ethdr0 = &ethdr0;
 		gce0 = &gce0;
 		gce1 = &gce1;
-		merge0 = &merge0;
 		merge1 = &merge1;
 		merge2 = &merge2;
 		merge3 = &merge3;
 		merge4 = &merge4;
+		merge5 = &merge5;
 		mutex0 = &mutex0;
 		mutex1 = &mutex1;
 		padding0 = &padding0;
@@ -2698,7 +2698,7 @@ vdo1_rdma7: rdma@1c10b000 {
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xb000 0x1000>;
 		};
 
-		merge0: merge@1c10c000 {
+		merge1: merge@1c10c000 {
 			compatible = "mediatek,mt8188-disp-merge", "mediatek,mt8195-disp-merge";
 			reg = <0 0x1c10c000 0 0x1000>;
 			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE0>,
@@ -2711,7 +2711,7 @@ merge0: merge@1c10c000 {
 			mediatek,merge-mute;
 		};
 
-		merge1: merge@1c10d000 {
+		merge2: merge@1c10d000 {
 			compatible = "mediatek,mt8188-disp-merge", "mediatek,mt8195-disp-merge";
 			reg = <0 0x1c10d000 0 0x1000>;
 			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE1>,
@@ -2724,7 +2724,7 @@ merge1: merge@1c10d000 {
 			mediatek,merge-mute;
 		};
 
-		merge2: merge@1c10e000 {
+		merge3: merge@1c10e000 {
 			compatible = "mediatek,mt8188-disp-merge", "mediatek,mt8195-disp-merge";
 			reg = <0 0x1c10e000 0 0x1000>;
 			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE2>,
@@ -2737,7 +2737,7 @@ merge2: merge@1c10e000 {
 			mediatek,merge-mute;
 		};
 
-		merge3: merge@1c10f000 {
+		merge4: merge@1c10f000 {
 			compatible = "mediatek,mt8188-disp-merge", "mediatek,mt8195-disp-merge";
 			reg = <0 0x1c10f000 0 0x1000>;
 			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE3>,
@@ -2750,7 +2750,7 @@ merge3: merge@1c10f000 {
 			mediatek,merge-mute;
 		};
 
-		merge4: merge@1c110000 {
+		merge5: merge@1c110000 {
 			compatible = "mediatek,mt8188-disp-merge", "mediatek,mt8195-disp-merge";
 			reg = <0 0x1c110000 0 0x1000>;
 			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
-- 
2.47.0.rc1.288.g06298d1525-goog


