Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37E5606A31C
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 13:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GNF+VJag;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fHhxxYPk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PB3bcTSjIDz4nO+XHXTgRZYRg2UXUqYLAr6X7az+r2o=; b=GNF+VJagaUIytWh8jyNoaRtxcK
	1ug6o4BoStt6bBz5paWb4w2yugM2yeXzbu5k4c8q2vQatKrj/ujYZsilgZ5N01g4cvBlw4b3AHsTF
	ZcOM2YB4gUflNxJeVC1aei4z0yz7FBADMMSYbC92kkbuAKBVo6kmV2fCZZzJlxNayh3eoTLsR5r1j
	DSDT7s2YaSBXrprfs276B7k6DTfL4ADDWGyKA9enC8rPfBMUIcDEFDssCjTIQEGevg/qtcznLLt+1
	vGT/WDtO3PSNBUh3qfEJGhqLF3yzwMnjIZkT3PuqrlIM4WpeMe1l6b6RkwsIsIa2QO4P2XZ7KhEeP
	VEr4oSeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3z0-000000076a9-35Zh;
	Wed, 28 Oct 2026 13:46:26 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3yy-000000076Z2-0lmN
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 13:46:25 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1846bc43c28so1119048c88.0
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2026 06:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793195183; x=1793799983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PB3bcTSjIDz4nO+XHXTgRZYRg2UXUqYLAr6X7az+r2o=;
        b=fHhxxYPkkgnvx/p8ikMLsQx6mw46QEIUkuQYWPBguUN8nPzU7jE0u0SV6r0vqjNE4t
         wIy2/5HmPGTv4h25ryVy19D9yUBubUnBqAY7HLbBG8jSGU/8WQByn9Xp1wakt5q5Vb/R
         awiiKE4wsBdukARhRFvLrLuVIl5S9zpEo9wbXn89gK9sK6dXYHB1sffhODpom1GGtR7u
         0yY9JHHd69JRX7FARYoSigALDh0R/nzlLGXYSCMu2/aNkzOf1iweHvM5k0Ol04N8Tf6m
         hkTfJt5wO9pvJuDIPooUk4eT24CdOcIFRQs1YYzn2YE9+ieeypvaCI3S4HaLzBBGBgUP
         vIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195183; x=1793799983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PB3bcTSjIDz4nO+XHXTgRZYRg2UXUqYLAr6X7az+r2o=;
        b=XseOuVzDQeq5zO+vsU/ZOb+C6/hbehGLkmrVZ0qzCippbeqTYQelgqZ9h5UNm4Arep
         CuNqO9zgMh8IG2iQK9ohBu8R9PnRrFyjDRImmN7qpegdUBo7pOuJHrxXINelZnwJP9T4
         vh6vfnu/Hc/Jcx9uE5qAwGTpz4ZR+EPKhRotZQXtBOXpc83HBzVz/hm5tqaa8a9X39bs
         /En9bJI8qDJIjFSS44aXAZLPTvV/vhAClqYcsu/ZINFv60Eu1l0+QZHniCHlvNuxBSRP
         1srbJO0PfQ+H1R8Y2pDDF5uN2ypwx2/GeHThZ1/reuW4Ho8we384piPZVFcI/ioAHWAN
         h6ng==
X-Gm-Message-State: AFq9FYJVyQObka8yh93KKEhA49PP01AaDqz125248lMo+6A8l7Ps44Qk
	6rNV/Wdxh3vWq0n3qEtGiFOl42I1ucbkYo+DlvdUl1rX/w9IrEb9QsRs
X-Gm-Gg: AYBFou2KiS4RDi5iXho4f84sAD9dXlbKmCM6Ur/EtbPFcRZTYelTXeR1rDh4IaTTrZa
	U++pAdS7gYIht7hBBZEbdf95mIH9RAgIMS7ztnm0fcvQxb2QgoQAfXD6TxRob/7aCkyZxdcK83g
	yD+fT9mOePpm+zEyYp8ERG0QLm3Opvd+a7sfyZW05XngxErIuzi6OKsyX5ar+yu+OwcMa7PC3aX
	Seqsxb4aez4t37Wb8byzFnoN9podIpyB2/byq4hoVrsb1rcu34xcLMzI2CCm70T7w+vFA5dQcH5
	kPmrgsFVMaJPz9KNBsUDsD4yIW0Kask0yvOyGim5EhQHClC25iHUI8hqTYRWF/mPn7TxBTAkvXi
	DSXx4MMJ2IsltGOmnH60SPYxawGcQ3AgBCsE4KSIKDqO15k+ADVE3+uX9LR8C6ztY6cgIJ3hM56
	oYr9dLpHAucKe4SN3RY/9lzcgO0ZN54oSIL7rq61fG8ekgkc3nQbUNTET+RQHmFOWqxRRm2EF8M
	IPnkNxkHeay8ZqyC3e3xFbG6PrRysZSfOZvJ0otiE78qttj+m0i+NJEerRqkzEch5bYA5Gg0ipp
	bzXCGotRhQ5jGoiy9w==
X-Received: by 2002:a05:701b:2044:10b0:1a0:b650:5c93 with SMTP id a92af1059eb24-1a6cfde23a7mr3093747c88.41.1793195182199;
        Wed, 28 Oct 2026 06:46:22 -0700 (PDT)
Received: from jklsarch ([38.244.63.126])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76056a001sm8583561c88.22.2026.10.28.06.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:46:21 -0700 (PDT)
From: airjinkela@gmail.com
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] arm64: dts: mediatek: Fix malformed SRAM ranges property
Date: Wed, 28 Oct 2026 21:45:44 +0800
Message-ID: <20261028134544.594888-1-airjinkela@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_064624_243104_3D3858F5 
X-CRM114-Status: GOOD (  13.31  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, StarField Xu <airjinkela@gmail.com>, linux-mediatek@lists.infradead.org, Sjoerd Simons <sjoerd@collabora.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: StarField Xu <airjinkela@gmail.com>

The eth_sram nodes on MT7981, MT7986 and MT7988 sit under the soc
simple-bus, which provides #address-cells = <2> and #size-cells = <2>,
while the SRAM nodes themselves declare single-cell addressing:

    #address-cells = <1>;
    #size-cells = <1>;

A ranges entry is therefore sliced by the OF core as 1 + 2 + 1 cells:

    child-bus-address  (1 cell,  from the SRAM node #address-cells)
    parent-bus-address (2 cells, from the parent bus #address-cells)
    length             (1 cell,  from the SRAM node #size-cells)

The existing values place the parent address in the wrong position, so
the 64-bit parent base is decoded as 0x1540000000000000 instead of
0x15400000. dtc and dtbs_check stay silent because the total cell count
still matches na + pna + ns, and the sram driver only translates child
addresses, which currently do not exist on any of these nodes.

This is a latent bug: adding a pool or export sub-partition, or any
other child with a reg property, makes sram_reserve_regions() fail with

    reserved block ... outside the sram area

and the driver probe aborts. Fix the ranges tuple for all three SoCs so
that the mapping actually resolves to the SRAM window.

Fixes: 65f0e3970143 ("arm64: dts: mediatek: mt7988: add basic ethernet-nodes")
Fixes: d0c970091abf ("arm64: dts: mediatek: mt7986: add sram node")
Fixes: 9846a8c60318 ("arm64: dts: mediatek: mt7981b: Add Ethernet and WiFi offload support")
Signed-off-by: StarField Xu <airjinkela@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index e63ba3ae395e9..2718c7dd7eb60 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -492,7 +492,7 @@ int_gbe_phy: ethernet-phy@0 {
 		eth_sram: sram@15140000 {
 			compatible = "mmio-sram";
 			reg = <0 0x15140000 0 0x40000>;
-			ranges = <0 0x15140000 0 0x40000>;
+			ranges = <0 0x0 0x15140000 0x40000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 		};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 318639a7c64e9..98fd74824653d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -579,7 +579,7 @@ eth_sram: sram@15140000 {
 			reg = <0 0x15140000 0 0x40000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0 0x15140000 0 0x40000>;
+			ranges = <0 0x0 0x15140000 0x40000>;
 		};
 
 		wo_ccif0: syscon@151a5000 {
diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 8c9a5aba25791..d497ac826d669 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -1009,7 +1009,7 @@ eth_sram: sram@15400000 {
 			reg = <0 0x15400000 0 0x200000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0 0x15400000 0 0x200000>;
+			ranges = <0 0x0 0x15400000 0x200000>;
 		};
 	};
 
-- 
2.56.0


