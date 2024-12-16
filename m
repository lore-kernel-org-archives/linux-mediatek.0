Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763ECE7717F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2024 19:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5kZVKUWskIt1OSlJiQEy1Snr3cIH4HAWD8HrXVz2bg=; b=gnZGcKfntTwbUNoiNTDoF4/iB4
	dbeFtd77oQOOZO0OkubgtphLukLKGXVlF0vjxPi1BOyVT+mywQAAOfZf/nfe6jWMPD/w2TBwsR49N
	myX6TsBDdHdUceXoUZm1wr7M259yZ5I5MF60r+X3NvpGfFr4QPS8l2SjPqvbcCBtoPdFk3jWzskhD
	CgMTub51R2yVtlfgz6b3gfHjpnqVizzlSKr62ON+rH7T9Kx3+xu5KyFFAcsKdEy+i7nLbOfCpHgs3
	E+eGuMovTu8cgyGagj2TbJ2imLiXlTOmjo8A08g8i9dP2kn5TYvxLg5L8sgRKqAyVFl383FdxTAIX
	uS3I8sHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHAX-0000000BAtp-2bCq;
	Mon, 16 Dec 2024 19:54:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNH7w-0000000BAR7-3QvM;
	Mon, 16 Dec 2024 19:51:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734378694;
	bh=W1Z3MQX8y7Qi7AiKCyHgSsfkmQSyhI/S7kFBYOrFXE8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ko3vgjS81uyB4VcKRN0CFurxKkz2pbTaUoqa0X64auwPou0zSD8eCTLOyKuhtJjT2
	 E5Svb0WjpxBUl/asdIkcEbyebiFpjauYZ9w1pKKsd0sHIOBJZzCeG5R39JgKFstg0n
	 dr+xquZsLvUyaDKuFy5MNrpdvYljKS0MkGCVfzPLHoWpsOwqI/UaRdXLqbOepo9AoY
	 qPPJQ74Cg7cSEc5PC2vD1SEmzQk1g0TUHF/Wt9490MmF9Z7DD7KCRcDRPGrTN1XEWi
	 o0LqyGihmQgYF9nWH4nBP7A5+ieGbVq6CmXagJyzVuS6bNUsW74jGCW8foRN+ntIJB
	 bj0Hfqr+3Nq9g==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9874C17E3801;
	Mon, 16 Dec 2024 20:51:32 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 16 Dec 2024 16:51:25 -0300
Subject: [PATCH 1/2] arm64: defconfig: Enable sound for MT8188
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241216-genio700-configs-eth-sound-v1-1-04a719035d6e@collabora.com>
References: <20241216-genio700-configs-eth-sound-v1-0-04a719035d6e@collabora.com>
In-Reply-To: <20241216-genio700-configs-eth-sound-v1-0-04a719035d6e@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_115136_997395_64F1BEA5 
X-CRM114-Status: UNSURE (   7.95  )
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

Enable platform and machine sound drivers for the MT8188 SoC with the
MT6359 PMIC codec, as well as the MT8186 SOF driver which is also
compatible with MT8188, in order to get working sound on MT8188 SoCs.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dfa5c8d5b65863741be7d7d3c6f6f05567d336da..95af0377ddc673be7003d7517e3990012a817cbe 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -970,6 +970,8 @@ CONFIG_SND_SOC_IMX_AUDMIX=m
 CONFIG_SND_SOC_MT8183=m
 CONFIG_SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A=m
 CONFIG_SND_SOC_MT8183_DA7219_MAX98357A=m
+CONFIG_SND_SOC_MT8188=m
+CONFIG_SND_SOC_MT8188_MT6359=m
 CONFIG_SND_SOC_MT8192=m
 CONFIG_SND_SOC_MT8192_MT6359_RT1015_RT5682=m
 CONFIG_SND_SOC_MT8195=m
@@ -998,6 +1000,7 @@ CONFIG_SND_SOC_RZ=m
 CONFIG_SND_SOC_SOF_TOPLEVEL=y
 CONFIG_SND_SOC_SOF_OF=y
 CONFIG_SND_SOC_SOF_MTK_TOPLEVEL=y
+CONFIG_SND_SOC_SOF_MT8186=m
 CONFIG_SND_SOC_SOF_MT8195=m
 CONFIG_SND_SUN8I_CODEC=m
 CONFIG_SND_SUN8I_CODEC_ANALOG=m

-- 
2.47.1


