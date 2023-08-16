Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D9CC19F4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 19:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Bw8IWacgQTkThLac2vje/xz+YOEIscDPy2Ds4ZGFvU=; b=d/VIxmg9x/ud6Tq5odts8rDW5J
	LmK8iEqJEcStvbvU+R9Kh6q81Y+UnQAQdJUULS0KhU7yetfktAHRwFn+aXMrmfaj0/8mv+vrsB++Q
	fR9fEmsTMiyFClwp6INOIRyO0fB8u+p5VOCJr9X9RPR0MHjFEmJbj+gwL4rGPydGagyNv9FLMVgMk
	ndobcBvWgr+g1DiBHap/kZulUxrADszZOxNBf+ZMouY0ncH/65U50L+hpxPLWMEfOLjZhp1Xqs9nD
	sRYku1I2BWrqc7czVk7RvTTqk56mKtGOr2AJbghZQ+KUzUby9YkLTzFyiQKOl41eEeiyOVeBo4SBc
	PJPi4tvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWMeP-004v6X-3D;
	Wed, 16 Aug 2023 19:57:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWMeN-004v5Y-0Y;
	Wed, 16 Aug 2023 19:57:52 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D89666071BF;
	Wed, 16 Aug 2023 20:57:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692215866;
	bh=FMkSrLQnK0fv59W1YNP5gvyExhodhHPfroxk6P347ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TxkNLLmSy4yNx8xb1w/UCoaDppZS9oG1fLVkiOHuPJF62f+5oY0MQxhr5IcKYBM99
	 RsCiuZ1QIlMG/BNB4EBH6HBxsKtVMkzdSEJUcFfffi6cDhYOsC2aHBfkDHr3mL/YEF
	 M0vXiAsq6rNNqk7Qzdstia4opWm4VLPvULlj5libNlu3JWCGmLswtOavtxCDCu4j74
	 L35yOR34cTWlYe/DUxdKpAWvNX6WtaVPnSPq17ip3+40sEGILhWetPEe9nEu5Jg7wp
	 yjkzVEBm4Yjj/sencVpY0dEvFa3C8JUORYccPz82YQDNcKBNuoaLq7RSk1FUPFFmP3
	 PECPQU6PptiFQ==
Date: Wed, 16 Aug 2023 15:57:40 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: daniel.lezcano@linaro.org
Cc: Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	angelogioacchino.delregno@collabora.com, rafael@kernel.org,
	amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org, ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	wenst@chromium.org, james.lo@mediatek.com, rex-bc.chen@mediatek.com,
	abailon@baylibre.com, amergnat@baylibre.com, khilman@baylibre.com
Subject: Re: [PATCH v4 0/5] Add LVTS support for mt8192
Message-ID: <107678ff-c3d5-4c3a-ad0e-fa292a125daa@notapiano>
References: <20230530195132.2286163-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230530195132.2286163-1-bero@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_125751_338145_6886AB5A 
X-CRM114-Status: GOOD (  17.32  )
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

On Tue, May 30, 2023 at 09:51:27PM +0200, Bernhard Rosenkränzer wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add full LVTS support (MCU thermal domain + AP thermal domain) to MediaTek MT8192 SoC.
> Also, add Suspend and Resume support to LVTS Driver (all SoCs),
> and update the documentation that describes the Calibration Data Offsets.
> 
> Changelog:
>     v4 :
>         - Shrink the lvts_ap thermal sensor I/O range to 0xc00 to make
>           room for SVS support, pointed out by
>           AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
>     v3 : 
>         - Rebased :
>             base-commit: 6a3d37b4d885129561e1cef361216f00472f7d2e
>         - Fix issues in v2 pointed out by Nícolas F. R. A. Prado <nfraprado@collabora.com>:
>           Use filtered mode to make sure threshold interrupts are triggered,
>           protocol documentation, cosmetics
>         - I (bero@baylibre.com) will be taking care of this patchset
>           from now on, since Balsam has left BayLibre. Thanks for
>           getting it almost ready, Balsam!
> 
>     v2 :
>         - Based on top of thermal/linux-next :
>             base-commit: 7ac82227ee046f8234471de4c12a40b8c2d3ddcc
>         - Squash "add thermal zones and thermal nodes" and
>             "add temperature mitigation threshold" commits together to form
>             "arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones" commit.
>         - Add Suspend and Resume support to LVTS Driver.
>         - Update Calibration Data documentation.
>         - Fix calibration data offsets for mt8192
>             (Thanks to "Chen-Yu Tsai" and "Nícolas F. R. A. Prado").
>         https://lore.kernel.org/all/20230425133052.199767-1-bchihi@baylibre.com/
>         Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> 
>     v1 :
>         - The initial series "Add LVTS support for mt8192" :
>             "https://lore.kernel.org/all/20230307163413.143334-1-bchihi@baylibre.com/".
> 
> Balsam CHIHI (5):
>   dt-bindings: thermal: mediatek: Add LVTS thermal controller definition
>     for mt8192
>   thermal/drivers/mediatek/lvts_thermal: Add suspend and resume
>   thermal/drivers/mediatek/lvts_thermal: Add mt8192 support
>   arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones
>   thermal/drivers/mediatek/lvts_thermal: Update calibration data
>     documentation
> 
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 454 ++++++++++++++++++
>  drivers/thermal/mediatek/lvts_thermal.c       | 160 +++++-
>  .../thermal/mediatek,lvts-thermal.h           |  19 +
>  3 files changed, 631 insertions(+), 2 deletions(-)
> 
> base-commit: 8c33787278ca8db73ad7d23f932c8c39b9f6e543

Hi Daniel,

just a gentle reminder. As you've just applied [1], there are no longer any
concerns with this series, and it'll provide both working interrupts and
reliable thermal readings on MT8192.

Thanks,
Nícolas

[1] https://lore.kernel.org/all/89fabd50-66ce-d94f-38c8-6dd6f343958d@linaro.org

