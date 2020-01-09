Return-Path: <SRS0=DZB5=26=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60219C33CA2
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 12:02:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3237420661
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 12:02:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gQhDnUUs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3237420661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i6dNF8GbBMS4BBYmFR4LwkHHVjDFWkiwQXZbgAjH1bY=; b=gQhDnUUsUzUEswzx5CFFXjyL3
	+cXTBCgb7idCB7nvHlUMnPG3MVwWkhGs1Pyd/GaNIkxzuIiFVcaNYDENJmouql0CD29ANlyhV5Vqg
	RKUVBZwOrGZGXl8W3D3zUmXw090K/I7nzwinDEInwiMZD51H1mQRAhgddE4bBogKPyixh53OSxtwk
	604C07dw03IlhGv/j9Xw3si8eMG/BVCn6XW/yNgUsFoix8G4OeAYJe5F52ES0ySR0NO+2kUNn+EUD
	bLd8MpD7UN6XYTozZb9c/X4tyLWnsaF2ev3PURzrQkRhq7sQoN3eWmVZiV3vbHxIFAoNIMfITwdnC
	mQ8S4e3qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipWVc-0005ad-Uh; Thu, 09 Jan 2020 12:01:52 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipWVT-0005S0-6U; Thu, 09 Jan 2020 12:01:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E422D31B;
 Thu,  9 Jan 2020 04:01:41 -0800 (PST)
Received: from [10.1.32.29] (e122027.cambridge.arm.com [10.1.32.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF2CD3F534;
 Thu,  9 Jan 2020 04:01:38 -0800 (PST)
Subject: Re: [PATCH v2 0/7] Add dts for mt8183 GPU (and misc panfrost patches)
To: Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
References: <20200108052337.65916-1-drinkcat@chromium.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <79fe7055-c11b-c9f6-64e5-48e3d5687dfe@arm.com>
Date: Thu, 9 Jan 2020 12:01:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200108052337.65916-1-drinkcat@chromium.org>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_040143_327230_5CF51F16 
X-CRM114-Status: GOOD (  25.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08/01/2020 05:23, Nicolas Boichat wrote:
> Hi!
> 
> Sorry for the long delay since https://patchwork.kernel.org/patch/11132381/,
> finally got around to give this a real try.
> 
> The main purpose of this series is to upstream the dts change and the binding
> document, but I wanted to see how far I could probe the GPU, to check that the
> binding is indeed correct. The rest of the patches are RFC/work-in-progress, but
> I think some of them could already be picked up.
> 
> So this is tested on MT8183 with a chromeos-4.19 kernel, and a ton of
> backports to get the latest panfrost driver (I should probably try on
> linux-next at some point but this was the path of least resistance).
> 
> I tested it as a module as it's more challenging (originally probing would
> work built-in, on boot, but not as a module, as I didn't have the power
> domain changes, and all power domains are on by default during boot).
> 
> Probing logs looks like this, currently:
> [  221.867726] panfrost 13040000.gpu: clock rate = 511999970
> [  221.867929] panfrost 13040000.gpu: Linked as a consumer to regulator.14
> [  221.868600] panfrost 13040000.gpu: Linked as a consumer to regulator.31
> [  221.870586] panfrost 13040000.gpu: Linked as a consumer to genpd:0:13040000.gpu
> [  221.871492] panfrost 13040000.gpu: Linked as a consumer to genpd:1:13040000.gpu
> [  221.871866] panfrost 13040000.gpu: Linked as a consumer to genpd:2:13040000.gpu
> [  221.872427] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor 0x3 status 0x0
> [  221.872439] panfrost 13040000.gpu: features: 00000000,13de77ff, issues: 00000000,00000400
> [  221.872445] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
> [  221.872449] panfrost 13040000.gpu: shader_present=0x7 l2_present=0x1
> [  221.873526] panfrost 13040000.gpu: error powering up gpu stack
> [  221.878088] [drm] Initialized panfrost 1.1.0 20180908 for 13040000.gpu on minor 2
> [  221.940817] panfrost 13040000.gpu: error powering up gpu stack
> [  222.018233] panfrost 13040000.gpu: error powering up gpu stack
> (repeated)

It's interesting that it's only the stack that is failing. In hardware there's a dependency: L2->stack->shader - so in theory the shader cores shouldn't be able to power up either. There are some known hardware bugs here though[1]:

	MODULE_PARM_DESC(corestack_driver_control,
			"Let the driver power on/off the GPU core stack independently "
			"without involving the Power Domain Controller. This should "
			"only be enabled on platforms for which integration of the PDC "
			"to the Mali GPU is known to be problematic.");

[1] https://github.com/ianmacd/d2s/blob/master/drivers/gpu/arm/b_r16p0/backend/gpu/mali_kbase_pm_driver.c#L57

It might be worth just dropping the code for powering up/down stacks and let the GPU's own dependency management handle it.

Steve

> 
> So the GPU is probed, but there's an issue when powering up the STACK, not
> quite sure why, I'll try to have a deeper look, at some point.
> 
> Thanks!
> 
> Nicolas
> 
> v2:
>   - Use sram instead of mali_sram as SRAM supply name.
>   - Rename mali@ to gpu@.
>   - Add dt-bindings changes
>   - Stacking patches after the device tree change that allow basic
>     probing (still incomplete and broken).
> 
> Nicolas Boichat (7):
>    dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
>    arm64: dts: mt8183: Add node for the Mali GPU
>    drm/panfrost: Improve error reporting in panfrost_gpu_power_on
>    drm/panfrost: Add support for a second regulator for the GPU
>    drm/panfrost: Add support for multiple power domain support
>    RFC: drm/panfrost: Add bifrost compatible string
>    RFC: drm/panfrost: devfreq: Add support for 2 regulators
> 
>   .../bindings/gpu/arm,mali-bifrost.yaml        |  20 ++++
>   arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 ++
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 104 +++++++++++++++++
>   drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  18 +++
>   drivers/gpu/drm/panfrost/panfrost_device.c    | 108 ++++++++++++++++--
>   drivers/gpu/drm/panfrost/panfrost_device.h    |   7 ++
>   drivers/gpu/drm/panfrost/panfrost_drv.c       |   1 +
>   drivers/gpu/drm/panfrost/panfrost_gpu.c       |  15 ++-
>   8 files changed, 267 insertions(+), 13 deletions(-)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
