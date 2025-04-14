Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0274C369B2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Apr 2025 10:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99x0tGbdw38C85IX3JD4zPDfiWMWW2a9teZScj+Y1hM=; b=cKaBnro7Hw3b/Ws0cFqqRdy3MF
	MCayKkD3IA/01bLi8Kz5kL8hz0mjaaf4OU2wcxPFm9uR0zUHX6X/twhCZRg8gPlLFC/DYAUpPUq6H
	IyjOWfmpsUn0e7VN8yQZEAIAXOfNtlTw0Hx2zZLeRq6cP8O4/04PXjEGFpG0GaLWZIgBuE9fTfZ03
	NEvPndAohmn3OWkEq8OKTXiOjrwvEE50ievvLtpqI9rMxNUi7nnea0sakpgRpqMdZgEAqPMWh+2xL
	kQK4I/j5y0ceNzaUXnLR19ZdZDcYWGsrjA0vne9aqFErgCWoGoBSQsTYodRUw3vgFzOgIfz2CioN0
	giRhxjnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GlD-00000001Qga-3oyC;
	Mon, 14 Apr 2025 10:09:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GXB-00000001MgV-1wzM;
	Mon, 14 Apr 2025 09:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744624520;
	bh=T4ONN1Yz2fGzXLrkieW4iad4t1ImsJfvVmB6Bgbe1kk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R2ZS19znVleLmVEzPH8Mx7/PHjELy3JlvA3R+Y1tDL1ZgZLaT7S+NxAvawocHksgV
	 KWuCAEG3E9fvh8IS+v+C+b6RcZXDux4UDZypOV+L+uove+NA8o1jCzzU8wV/VurEjY
	 XhmKiIG37Qaj1R+AwOqhVRoDvxVvivy+2wn3AmxKprp3jszdEXIdt1y9B8ipdRunDS
	 bClxquv5mL1ZzuDgd0EsaqF6sRxxEwi1vhe7IUUK+S3BUo1XggGvh0E1Wv2HcQqF+X
	 XgIQXgsftC+CnTwxfM+p5Vkoo2uqL8Qq+jVGMeDm4D/s5RB/6MnmG88mqVOsQ4TvPx
	 bq64wTDZfnQQA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5629B17E0809;
	Mon, 14 Apr 2025 11:55:19 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	henryc.chen@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: Re: (subset) [PATCH v1 0/5] MediaTek Dimensity 1200 - Add DVFSRC support
Date: Mon, 14 Apr 2025 11:55:11 +0200
Message-ID: <174462444556.45823.17207667106071511415.b4-ty@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_025521_647022_031EB437 
X-CRM114-Status: GOOD (  11.91  )
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

On Thu, 10 Apr 2025 16:40:14 +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the DVFSRC regulators
> and prepares the DVFSRC driver to also set bandwidth limits for the
> DVFSRC EMI Interconnect found in the MediaTek Dimensity 1200 (MT6893)
> SoC.
> 
> The interconnect driver wasn't touched at all because the intended
> change here was to enable support for the DVFSRC regulators but, as
> those anyway required new platform data, laying the groundwork for
> the interconnect came natural and would've been unreasonable to just
> skip that as it anyway consists in one small struct and nothing else.
> 
> [...]

Applied to v6.15-next/soc, thanks!

[1/5] dt-bindings: soc: mediatek: dvfsrc: Add support for MT6893
      commit: ba3297872a237c8949e812ffa72c64e81da38cec
[4/5] soc: mediatek: mtk-dvfsrc: Rename and move bw constraints data
      commit: b06785283ec1c24fadce95390047feb9db840051
[5/5] soc: mediatek: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
      commit: e5ea18102c9d3bc2fcb186a6e9f43c5a4aba4f98

Patch 5/5: Fixed to remove unused dvfsrc_bw_constr_mt6893 before applying.

Cheers,
Angelo


