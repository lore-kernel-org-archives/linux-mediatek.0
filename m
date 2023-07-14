Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04236C0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 19:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/E3MDN+s8txY9G/AmYo3fqfcfs5GGZ1rjxi0pj7FQ0=; b=doYQ/xCqFL11lxtNoZusB05fzf
	0EH/3pEaIrnyhI7gQJGElYKqkAs9Vz6xeNoFoXljx0EO3Byrwy3JIZZP901gtsFajAcY3Lwk0yupD
	YAOASe8Q1M4NjpdjkmVZ8g00iGXXRYoZs60oNAJG8huHCXiOH3LVfgaVbJXKOzthyJ9BiVFsA6Axt
	xaeyv+1MEOy6fwxgc1pek/d0cbZnRBzuRfLO0dTA3dTU+Loeejxx0V3AXQ/t0HzUIK4o/iVZTuBck
	xm10GZ0pO0YptuFShHJutNkvz8/v1ohI3/Ouuh3o7sZNKH8v2EeIUbC0hZCY+J2xC/MBEuYdFU4V7
	RF2bNJ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOZG-0076DF-0Y;
	Fri, 14 Jul 2023 19:35:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOZA-0076BM-1f;
	Fri, 14 Jul 2023 19:35:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5D0F361DAF;
	Fri, 14 Jul 2023 19:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64C0C433C7;
	Fri, 14 Jul 2023 19:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689363298;
	bh=coJii5owjJT4psrykdkd2QZrVS8+72vCzDQtZKFwADs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qs69AsxFTwxe7qQ9dAN1lLk532XZRcYbAlVYzjJD+j6L1k2cgP+nY21n8aKZ/xTqS
	 yIrUprT1gUdZd5+myyllx4fx2LY801n9XsQj9jB0Xv4vn8U95LkUyBsE6DQWUrtcaE
	 cfWcbUB5eykdGbpqw4cHUdzJkS423d39ApYdkQM2geD7Cl1DiHsuJmQNe5wuUVJIHF
	 ch+4A8vSG8vDxjMHCWdQ6oUXXQU5MBV0YIJS2gmEazA5YA3Y9sECSsM9D/DQ9+UYVp
	 V2VJbU8B0GRWLR4kA9/sBvV9Vu1sSV0YAreNqw0cWVX2eephIXifBN2sFYL8qEMnfH
	 sV5wF6scpfxDA==
Message-ID: <dce45b56-2b2b-850b-e5b6-fdc98cfa04ee@kernel.org>
Date: Fri, 14 Jul 2023 14:34:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] firmware: Explicitly include correct DT includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20230714174438.4054854-1-robh@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20230714174438.4054854-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_123500_622089_52D3D04A 
X-CRM114-Status: GOOD (  11.26  )
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



On 7/14/23 12:44, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   drivers/firmware/arm_scmi/driver.c | 4 ++--
>   drivers/firmware/imx/imx-dsp.c     | 1 -
>   drivers/firmware/imx/imx-scu-irq.c | 1 +
>   drivers/firmware/imx/imx-scu.c     | 1 +
>   drivers/firmware/mtk-adsp-ipc.c    | 1 -
>   drivers/firmware/raspberrypi.c     | 1 +
>   drivers/firmware/scpi_pm_domain.c  | 3 ++-
>   drivers/firmware/stratix10-rsu.c   | 1 -

For stratix10-rsu.c, Acked-by: Dinh Nguyen <dinguyen@kernel.org>

