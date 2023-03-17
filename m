Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD373C74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 07:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOlA7p2n35uyKSyoFZIBhpkurk+v23HjN2xPwWZXphI=; b=bad0ZDyEZFHF8PYgd97hIpniZ0
	DU+8dURj0rqHxN0w7tA5mG2HoEEeCyeskZDWyoaJAPa3a0Y3qAHH/N/2hlew6SNVqJjoJX0c5c5zb
	mlsn38ZMWYUdJ/ta1coEj9LMpoe16/7PcvTUbXfcoHMGiMladEwZNaWlWL44Rt9OSfU7YPUZ+3/qG
	i1FjHlWgq7lvtwI48Fzq93OuEXh+8giPt+v1cwZBGxdip8bX+8QgNff3Wano/gL1nvZSfBgpTlHZa
	ojOQr66c2qOTInpgqPf/bvg+5s78G4mINaAcr0yoEphmR8h6JfMTLs3Ta6rAc2MpvsMugiNfSEUMj
	yQFkjAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd4uA-001M99-2Z;
	Fri, 17 Mar 2023 07:53:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd4u7-001M7e-14;
	Fri, 17 Mar 2023 07:53:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 46CCC621CF;
	Fri, 17 Mar 2023 07:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5E9C433EF;
	Fri, 17 Mar 2023 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679039613;
	bh=FHqeoUzoVZtRqyxQJUT/4e1BNJn6xtdz6lPXXgD9+QU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vj1ByAAC/ZRd2EHSGZHX0kRv5PTnfDa6eJPKaJ3uRVm4e9ye0AdQngEC1EoNQXbZM
	 hI6/uUPPS3nLTIgu2WNwAyYWplTI1WuagQxQ5I+ERvldOyt6/rK37eHIkbOFLPCSjV
	 yroVnV+uMQJHJSqhEZOx2LquTRtov+j86ySViL0a3PawzrXRMcpkIftj20ZPvn5fxj
	 2QL6eAz/lClygp5T9Hjs9yZ72iMi7aQBsSH8Q2p1qUAmIJn9NjFglQ/DX2b+lCGReh
	 pr8ObugbtbXKMP/+RUPiBTIWZNX43Snzm0j0Y0JjS4lx2x59oBn2RKz/a0gSxxKk8s
	 bKsCzQLPNrXhA==
Date: Fri, 17 Mar 2023 07:53:27 +0000
From: Lee Jones <lee@kernel.org>
To: ChiaEn Wu <chiaen_wu@richtek.com>
Cc: corbet@lwn.net, pavel@ucw.cz, matthias.bgg@gmail.com,
	andriy.shevchenko@linux.intel.com, jacek.anaszewski@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-doc@vger.kernel.org,
	peterwu.pub@gmail.com, cy_huang@richtek.com,
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	szunichen@gmail.com, Alice Chen <alice_chen@richtek.com>
Subject: Re: [PATCH v18 1/3] leds: rgb: mt6370: Add MediaTek MT6370 current
 sink type LED Indicator support
Message-ID: <20230317075327.GA9667@google.com>
References: <cover.1678430444.git.chiaen_wu@richtek.com>
 <1df93a583c3f508a7158b83b95857e9bce235e1b.1678430444.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1df93a583c3f508a7158b83b95857e9bce235e1b.1678430444.git.chiaen_wu@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_005335_411135_2EC1D5B1 
X-CRM114-Status: GOOD (  16.09  )
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

On Fri, 10 Mar 2023, ChiaEn Wu wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
>
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual
> Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>
> Add support for the MediaTek MT6370 Current Sink Type LED Indicator
> driver. It can control four channels current-sink RGB LEDs with 3 modes:
> constant current, PWM, and breath mode.
>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Co-developed-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> v18:
> - Rename 'MT6370_VENID_MASK' to more human readable
>   'MT6370_VENDOR_ID_MASK'
> - Define the const number vid.
> - Unwrap each line by 100 chars limit.
> - Remove the redudant space in 'mt6370_gen_breath_pattern()' comment for
>   patterh data allocation.
> - Define a sub function 'mt6370_assign_multicolor_info()' to tidy up
>   'mt6370_init_led_properties()' for multicolor case.
> - Define a sub function 'mt6370_multicolor_led_register' to tidy up
>   'mt6370_led_register()' for multicolor case.
> - Refine 'fwnode_handle_put' in probe function with 'goto'.
> ---
>  drivers/leds/rgb/Kconfig           |   13 +
>  drivers/leds/rgb/Makefile          |    1 +
>  drivers/leds/rgb/leds-mt6370-rgb.c | 1010 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1024 insertions(+)
>  create mode 100644 drivers/leds/rgb/leds-mt6370-rgb.c

Applied, thanks

--
Lee Jones [李琼斯]

