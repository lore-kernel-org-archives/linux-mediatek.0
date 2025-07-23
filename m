Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2370DC83F17
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jul 2025 07:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdBxhQqA0EuSQNxoyT+C/DaAmV6AR+BgleFixQ2/J/s=; b=4j80cdWTAJch89BJ+yEN/qqDuX
	5wicaR+Y+JUOWRy5D8mr7zp4S1qOOKwKp+23N7fnmQhahTvSlAsqd/btBJBm9uyipMdKKSNO6rijm
	9Ut8TWU2FBNVP3bTpbT1CmjSsmOAmMNDRPGQCUVFhuSOrZRIvhyFShX01pV42T638VR3U7E2MYYDe
	s8ows5wEMt5beEskEfzQKMe7kuQ67yU9Ub5ZYA3m36JVCuVkA7bYLB+1Up9FT21yb0vD2A6qLZ5+N
	1jGXf47s1OgMCsnpbBrLLut4gAGnOWyn3DJs8f95F1X7UPSpV6abiDVzXiZRvXey7B6XPNgfHIPNO
	w+3BqOSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUNK-00000004JBQ-1zw3;
	Wed, 23 Jul 2025 07:58:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUAI-00000004H8V-3gBD;
	Wed, 23 Jul 2025 07:45:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 18A2CA55D44;
	Wed, 23 Jul 2025 07:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B0EC4CEE7;
	Wed, 23 Jul 2025 07:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753256725;
	bh=vYVvt8tih2kLkLnclEc/g8hovZ8gLvWrK/QtqjMeRvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E0gBpv9qz8jdRgwh2fedm5fs8AwMdzMxSXJFNBMhV75LHGS26aWcL/dA7waDsV6kQ
	 1/KPChHrjCkb7nvthlqmG0wS3vBPY6Bp7RbpFJlg1w2EseV3+cc8Q1l5Rkk3deOoxZ
	 6PBohu0rH4JZrEHJEimOlam2NMafaZ0O5eZRLGYtlhwETXB0qRXDYVsR2pN1+nW7Wc
	 lEgQJ/Gef+a2zBEFeZcodwvK9PkviMf1ntjmeuxAiGyyWqHbRTrhSsMTjMWJnmkC20
	 0ksNMLdZ71jvSgg27IE4ULdCaoThVuI503TA11KcP9wVsYKa7YYO0/3K3mlF6RqZYu
	 pCGs8darkjHuQ==
Date: Wed, 23 Jul 2025 09:45:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Ramax Lo <ramax.lo@mediatek.com>, 
	Macpaul Lin <macpaul@gmail.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v2 4/4] arm64: defconfig: Enable UFS support for MediaTek
 Genio 1200 EVK UFS board
Message-ID: <20250723-vagabond-unselfish-bat-c7ed9d@kuoka>
References: <20250722085811.2062790-1-macpaul.lin@mediatek.com>
 <20250722085811.2062790-4-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250722085811.2062790-4-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_004526_980963_9FDB39E3 
X-CRM114-Status: GOOD (  15.09  )
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

On Tue, Jul 22, 2025 at 04:58:11PM +0800, Macpaul Lin wrote:
> Enable the UFS related settings to support Genio 1200 EVK UFS board.
> This board uses UFS as the boot device and also the main storage.
> This includes support for:
>  - CONFIG_PHY_MTK_UFS
>  - CONFIG_SCSI_UFS_MEDIATEK
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> Changes for v2:
>  - No changes.
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index cc82faf1371c..b3c6728ed5dc 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1216,6 +1216,7 @@ CONFIG_SCSI_UFS_BSG=y
>  CONFIG_SCSI_UFSHCD_PLATFORM=y
>  CONFIG_SCSI_UFS_CDNS_PLATFORM=m
>  CONFIG_SCSI_UFS_QCOM=m
> +CONFIG_SCSI_UFS_MEDIATEK=m
>  CONFIG_SCSI_UFS_HISI=y
>  CONFIG_SCSI_UFS_RENESAS=m
>  CONFIG_SCSI_UFS_TI_J721E=m
> @@ -1616,6 +1617,7 @@ CONFIG_PHY_HISI_INNO_USB2=y
>  CONFIG_PHY_MVEBU_CP110_COMPHY=y
>  CONFIG_PHY_MTK_PCIE=m
>  CONFIG_PHY_MTK_TPHY=y
> +CONFIG_PHY_MTK_UFS=m

This is redundant. I don't think you actually generated it from
savedefconfig.

Best regards,
Krzysztof


