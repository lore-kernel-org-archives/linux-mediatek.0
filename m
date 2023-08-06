Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF822C001DE
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Aug 2023 09:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woOMOS/2vNFpFVmzX0Do7WRSCj4Hieyp/f+e03kiv+8=; b=dGq9TIEpKTK3H/zVCzHO+W+9Dp
	In6lnGoeajKZhe2Yp9coG55rPCj0ug4PV1oiE/FWWFNLDXvErmfw+FFGGg0mClRUk0Sl+lZA9gfwn
	OBAI/ZZE/r+ChZ1CWt9ES4W98b7/me3xQmkEseyzzoYuzctLvoDRQQkQMrH1NHAk3D2flOSkjUCL3
	n1VwmpTI1rO1kE4nb7VuWopnAJwzWQrj/iZJ56mKghOiMQNT9PHuoGq8yQ3ppopS3imbKbLbYde/J
	fzs15kUnnwYj+pCV/yvsFNM342YEpDNAHRXDhBQZKhnIV+tXXGPqJmbYg3WzTqgDLl7oHVGfOyCz/
	REwMSX4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSaD9-00F8vq-18;
	Sun, 06 Aug 2023 09:38:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSaD2-00F8vO-2G;
	Sun, 06 Aug 2023 09:38:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D043160FE5;
	Sun,  6 Aug 2023 09:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DBFC433C7;
	Sun,  6 Aug 2023 09:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691314678;
	bh=eVpmHvQ+el5oYnGHhCSpJ5MEq+qn7dtrQFEijdKMa8E=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=hVSQsnl40hPx5Hzzj5zBBPn+ff8r3wDMB4k07G0sRzVhqsLlZsELCofYkyX1vHEH9
	 03ftiNg9xoj/PdueOZCPd4+FYwDyorhR9keodEEfyj9p9KA4/h9hFsiKMDTw1wM7lf
	 //8t24an4y9cxraswJL0vsj9Y8Zk5jSE5vPvdgX9dinzZrLvJvcZVXFm6si+6Nq2rF
	 1Tt8WY1cesvzjLLo4dNhnZQZE5teSMdzrfqdtaOHt49D6vcGVyzszm2dZZYrfboNVH
	 m6uPs5ND889+AtHQvdUCRX8b03lZtROnjo0oDt7LRhtMcC0TWq4ZFRWob1DxWot5kb
	 F1CL31Cx36ztg==
Date: Sun, 6 Aug 2023 17:26:09 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>,
	Tsahee Zidenberg <tsahee@annapurnalabs.com>,
	Antoine Tenart <atenart@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Jean-Marie Verdun <verdun@hpe.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Has him <shiraz.linux.kernel@gmail.com>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Jay Fang <f.fangjian@huawei.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 04/23] ARM: berlin: Drop unused includes
Message-ID: <ZM9nMTHTFEY8JcC/@xhacker>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-4-d8de2cc88bff@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-4-d8de2cc88bff@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230806_023800_847944_4131AB6B 
X-CRM114-Status: GOOD (  14.59  )
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

On Thu, Aug 03, 2023 at 04:42:44PM -0600, Rob Herring wrote:
> Several includes are not needed, so drop them.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

Thanks!

PS: what would be the better merge path? Arnd take it directly with each
sub-maintainers' ack or something else?
> ---
>  arch/arm/mach-berlin/berlin.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/arch/arm/mach-berlin/berlin.c b/arch/arm/mach-berlin/berlin.c
> index 2424ad40190c..13d5c899f09e 100644
> --- a/arch/arm/mach-berlin/berlin.c
> +++ b/arch/arm/mach-berlin/berlin.c
> @@ -8,11 +8,6 @@
>   *  (c) Marvell International Ltd.
>   */
>  
> -#include <linux/init.h>
> -#include <linux/io.h>
> -#include <linux/kernel.h>
> -#include <linux/of_platform.h>
> -#include <asm/hardware/cache-l2x0.h>
>  #include <asm/mach/arch.h>
>  
>  static const char * const berlin_dt_compat[] = {
> 
> -- 
> 2.40.1
> 

