Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6A2606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mLMKqYfm;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ktwb49I3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EYOpW2xyp4wYDs/95GrYDxNW739hVA53XI7RSeqe3Ss=; b=mLMKqYfmIH0sY8NawdxZJaxX/p
	WfVW/J1jvphXS1RCaQ103f28Ykwr88+HEBy0z2k0udQdZEdXbv+sFdIP8SgE254nRVJfr7x94JdoT
	gpc3YdlX0snEA9x26JcJYVdsJ4zghxJnAxsSdJ6ExMWtJkm5U+afAX8eS3SgcsaK7xHfvTc8QXkFA
	PGoQeKtLzMB9tIm6j1DcR5dJt7Y6EZrfOIDSKWB78AfqVo8joHrbmMzWxDhyH1k444zvOr+0Rn2lt
	5QGuXeMKRuLR7nb02wKSTZNzEv0rOyX5NscAFXMPutCgGeOI7H68xM3KA//PKspIX6hCxvHnDRPN+
	eIu56XkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTICd-00000005bzW-1EAV;
	Tue, 17 Nov 2026 12:22:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTICZ-00000005byC-3Fm5;
	Tue, 17 Nov 2026 12:22:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794918136;
	bh=tlK4X7iJfVxdWbikBhdNu8DWcD6//ek2zxb6rtNVeRM=;
	h=From:Date:Subject:To:Cc:From;
	b=ktwb49I38KXsD31YAQ5oqisSeLavEGHwgLnMRYO88DMuRMwl0NMgkJUnWLtnsmHfF
	 6pl79lmyQhXanj9yThuk3Nb1P9WnGdxcZcIFJBs+uSk8usohffQoUwwHGcgYl6K7Q5
	 QCgBlex+LTS14DQKdczCHopYymtGzJRIRF/QOEuYUVYIAEuG3U69oLm7HzTTaztS4j
	 XTLzM8yb6jZw2xA8GKkTPz8b3FpgmmdINnP/yNPGwhj/idGbB8/8rQDGp0laZdFJD2
	 /vDTHqdrgoyq3kwxwX7fNkNoO+teuS01bEGHq7OfUVyIgyCWe2J262/Zum5c6MPlQH
	 WnLFcZepAUmaA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 93EF917E0311;
	Tue, 17 Nov 2026 13:22:15 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 17 Nov 2026 13:22:07 +0100
Subject: [PATCH] arm64: dts: mediatek: mt8370: fix CPU map core ordering
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-mt8370-fix-cpu-map-core-order-v1-1-00c6c74c7629@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NywrDIBBFfyXMugOa0mjyKyULq9PWhY+OJgRC/
 r3SdHkul3N2KMSeCkzdDkyrLz7FBvLSgX2b+CL0rjH0oh+klApD1Vcl8Ok3tHnBYDLaxISJHTE
 KM97cSFpp0UNzZKb2/Pnv88lMn6Vl6jnCwxRqhhB8nbpIW8V/aoD5OL6djYh7oAAAAA==
X-Change-ID: 20261117-mt8370-fix-cpu-map-core-order-0a95d9e87802
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794918135; l=1923;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=tlK4X7iJfVxdWbikBhdNu8DWcD6//ek2zxb6rtNVeRM=;
 b=bL2y8Jmr77VlkoCdxT67HLHwyaSTFwIsIIP1lFZfF8tqFleRe+xGtbOjhaGfCjiP38Cl2l7nf
 JBlw9sT3KRmBPIZllUFFTEl347UC3xHH11osVMDc3LKoLUg8KE97bTu
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_042220_029027_DF25659F 
X-CRM114-Status: GOOD (  13.09  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In mt8370.dtsi, the child list for the cluster0 node of cpu-map is
overridden, to reflect that the MT8370 SoC, as being less powerful
variant of MT8188 and MT8390 SoCs, has less ARM Cortex-A55 cores
number than MT8188 and MT8390 (4 vs 6) but the same Cortex-A78 cores
number.

How the cluster0 node override is done makes the core child nodes to be
named in a non sequential way (core0 to core3, then core6 to core7).
First, it breaks the cpu-map child nodes naming convention in the
cpu-topology bindings. It also causes the arch_topology driver to skip
the A78 core nodes during its devicetree parsing, leading to at least
incorrect CPU capacity computation for them.

So, modify the override so the A78 cores are seen as core4 and core5
in the cluster0 node.

Fixes: 49b07ed22e37 ("arm64: dts: mediatek: add support for MT8370 SoC")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
The patch has been tested on Mediatek Genio 510-EVK board, that
integrates a MT8379 SoC with a kernel based on linux-next tree
(tag: next-20261116)
---
 arch/arm64/boot/dts/mediatek/mt8370.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
index 7ac8b8d03494..3fa48f2e6a6a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8370.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
@@ -16,8 +16,16 @@ cpus {
 
 		cpu-map {
 			cluster0 {
-				/delete-node/ core4;
-				/delete-node/ core5;
+				core4 {
+					cpu = <&cpu6>;
+				};
+
+				core5 {
+					cpu = <&cpu7>;
+				};
+
+				/delete-node/ core6;
+				/delete-node/ core7;
 			};
 		};
 	};

---
base-commit: 38c8be16846f10f3a710351357e4f4ace7254c8e
change-id: 20261117-mt8370-fix-cpu-map-core-order-0a95d9e87802

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


