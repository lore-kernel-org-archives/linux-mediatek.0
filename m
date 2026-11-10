Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373B360A6F47
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 12:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LRwnfTGR;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=c3GHa2+1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fOFRdn7z24nh5HHdH+lcQ22pYuvFi8+a4KYRKJ+WMTc=; b=LRwnfTGRgZMME2
	tRWdMRntZzMvRqfwWEsD5rWBOyeVVQPMk1WPRTa+MTQzZ9ZSMKVTfpqncjpv1mxrwqnREnJgME1qy
	rFjkWTCabrzSx9vDcPcF0w6zF3Y95Di9XYCBl+WvEfAMWc05SJzteunr5bw7RW1pRn5IarovPE8e6
	sN7pXaTKD0Dgx+oIifiY/95J/MEvV/IS97PFBiijFhPLXf8WZOQtAPQ9a/nyFLGNPvD4KNLxmkuCa
	m3CKiWD++go+YnO2ef1pHcOgbQblWJyXPPT+fGxM/u2SqQT03+po1/F2m4I19COjhELLacHgmWyhm
	Hv5d3R5zBPCut4hqmViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkew-00000003koH-3SWz;
	Tue, 10 Nov 2026 12:09:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQket-00000003kix-19xn;
	Tue, 10 Nov 2026 12:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794312539;
	bh=tYsCCetG8oTk0mstJCHvbXche/Jiq/UwGP0ULa31RX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c3GHa2+11BmBBOuQ8GIVVV2EdY5LFRNpPEqG+Sd65bh7Vg1dChqzr5bSb+JMBr6Ue
	 DtOgje6DIBkf5gM6Y04AfbSWcGVZ3Mb2/ixb2YI2GmR4Jf28j4Z2Zx1Ob4E92Uvx0V
	 NclsUIp3C4YtCWC+Gou+TLc5uhxmtbOmpoKK1x9w+MiozgZZgFGX9pRAFPO4dxz5Q5
	 qXF2dqfnyYaJ9Ygzlm0+EudAztmq0FHEDl1CUoTcT/q/H86aoQgX3jcCIwfyD8uLfu
	 8o6uHAUMtUbAWxI1iSTL3tRW9W2NvIjD6b2yHeettBNFK3cdTZfYsEE8QrnVKjuo/P
	 K/OFAM9k0PZQA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E3AAC17E0311;
	Tue, 10 Nov 2026 13:08:58 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 10 Nov 2026 13:08:48 +0100
Subject: [PATCH net-next v5 01/10] dt-bindings: net: mediatek-dwmac: fix
 unit in rx/tx delay property description
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-dwmac-mediatek-mt8189-v5-1-7d99d6292962@collabora.com>
References: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Andrew Lunn <andrew@lunn.ch>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794312537; l=1905;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=tYsCCetG8oTk0mstJCHvbXche/Jiq/UwGP0ULa31RX4=;
 b=Vmf531z+jzieeklTIFtqbhu4kmoYXsK84c/9JuEtdGQVrM1zGWCQ6XAL0knA0b0OABWB/cwf3
 3JYdsIkkwVnClRdjZTJrlFUrQHDMp3bdXm8xxNU1BRAiBLZgeQioYwN
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_040903_490120_76BC4F73 
X-CRM114-Status: GOOD (  11.66  )
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

The "mediatek,rx-delay-ps" and "mediatek,tx-delay-ps" descriptions say
their values are in nanoseconds but their names with the "ps" suffix
suggest it is picoseconds.
They are in fact used in both driver and devicetree as picosecond.
So, modify the two properties unit description to fix their unit.

Fixes: 150b6adda6b1 ("net: dt-bindings: dwmac: Convert mediatek-dwmac to DT schema")
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
index 3aab21b8e8de..14f9683f20fe 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
@@ -81,7 +81,7 @@ properties:
 
   mediatek,tx-delay-ps:
     description:
-      The internal TX clock delay (provided by this driver) in nanoseconds.
+      The internal TX clock delay (provided by this driver) in picoseconds.
       For MT2712 RGMII interface, Allowed value need to be a multiple of 170,
       or will round down. Range 0~31*170.
       For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,
@@ -91,7 +91,7 @@ properties:
 
   mediatek,rx-delay-ps:
     description:
-      The internal RX clock delay (provided by this driver) in nanoseconds.
+      The internal RX clock delay (provided by this driver) in picoseconds.
       For MT2712 RGMII interface, Allowed value need to be a multiple of 170,
       or will round down. Range 0~31*170.
       For MT2712 RMII/MII interface, Allowed value need to be a multiple of 550,

-- 
2.56.0


