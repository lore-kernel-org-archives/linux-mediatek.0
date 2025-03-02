Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB63EC19F32
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Mar 2025 17:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4scr6gSbN7AwK8PnI5Z9xg4swpYbSR8HhTZ4QDwNMo=; b=JxVph3mbd2ZwQDeHgFAOSCLC7C
	l7dVUyn/GHBNb7dKCrjU/ns4NH7VaHReimkLiot5R2OpnkFiHSYdt5NPoN3ZaemxiwZ4J0leW7naI
	SnwFJo+lp9C0WBTYKgP12qJAiTFMH2U576y+nhZ0wykZ2XUt6fFmv3bgvtDMqf1/PVLnUI6F6AWXl
	MdDXahV5iTuI+QoMFVJ/4ewSRDKV4FSoZtOXHOSB7/JtWb/yjsCQTfCACQsmnIQkjChq0m4oa537j
	U7Y27RMF6ofb9Yw0oXbS8DQdSRTDlHsfwYkoEsRD5K7pM1JTaHBBzDW96EWnEWwroP2L9l0pEgMin
	VMZDXSnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tomjp-0000000GOup-4AaP;
	Sun, 02 Mar 2025 17:04:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tomFG-0000000GKiq-3luJ;
	Sun, 02 Mar 2025 16:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740933169;
	bh=vy7W4XMABxoxejxdW3NIH5jjNnEdXu3h8szhJ30eV5s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gMRm2RCwsPFGw7WJ7Tn7/ZFH8fpan3ZHxSy5CkP7HU11qyYX9nHj0STvUe93UMPFX
	 iTpEwzTB+MhioplZOqrgARamas0vuKGEDyKkCJpp0AcCGVX2WA6hf15W96A2IWG3wN
	 nCCrWqoU0i0w0nyLef8wgC0YkAymZpWGEhP4a2mUpUQRXom7covdScFFnOxFUED4V+
	 YZsFqHg2ul7FW7Bpk10AoVEJiWeWGGZrIb/nQ/nAJn1w622V52pfn9fjegxSN3YrlS
	 A1GT3YZR4bS/4OJjkgBrSKsg8fuMnxUct//F45XNmdebYq7N/oxdVKGzGkUSOrj96/
	 FLSc+gCOFZ5JQ==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1002])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A570517E023F;
	Sun,  2 Mar 2025 17:32:44 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Sun, 02 Mar 2025 13:30:59 -0300
Subject: [PATCH v2 20/20] arm64: defconfig: Enable MT6359 ACCDET
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250302-mt6359-accdet-dts-v2-20-5bd633ee0d47@collabora.com>
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
In-Reply-To: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_083251_086088_01A6AAAF 
X-CRM114-Status: UNSURE (   7.80  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enable support for the ACCDET block in the MT6359 PMIC, which provides
jack detection capabilities to MediaTek platforms.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e675bedbc170ccb191f4991e348e36b5de0707a7..dec4708d5e946fc890751cab8de2cf3f302e9447 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1065,6 +1065,7 @@ CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_SOC_WSA881X=m
 CONFIG_SND_SOC_WSA883X=m
 CONFIG_SND_SOC_WSA884X=m
+CONFIG_SND_SOC_MT6359_ACCDET=m
 CONFIG_SND_SOC_NAU8822=m
 CONFIG_SND_SOC_LPASS_WSA_MACRO=m
 CONFIG_SND_SOC_LPASS_VA_MACRO=m

-- 
2.48.1


