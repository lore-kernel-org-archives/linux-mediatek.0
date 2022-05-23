Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C539C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Gxo0AHfUlCBIAXtiJSCu2i0U2mtXwM5dCwilZbbqnY=; b=fJLvGAYX+bat5N
	NNIUsDsirU4iLmJT+dD/HDls+mXxJI5iluZlR4i3LMdLaX29rvkQllf6FqCFerFVJHXNduuShOEYN
	kp2PGry845FHkxCeAoO2TVvXSVkxcaRGC/h6ZJ6vJXJ5PGognp7uK6wWSirdKcaR+3khI2ImZmunQ
	T4QhsUiRjs5zTfeTlvtUdVTkA6K3zPFHUYtTjfXIr+6gd0b7AVzeF20v0ACN1QGwQbNTmEuqgtEFI
	sN0LrRKipehYObMshZJi6En2LWaQgdWHxxIUMFT780fSTaayLN8TLUy4NglnxOSnwb6Jki+x14zL/
	WSWzMGoj0tEbHwJh1v7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5Wt-003LrF-RR; Mon, 23 May 2022 10:43:15 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4QS-002s1v-Gd; Mon, 23 May 2022 09:32:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0A4861F42DBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653298351;
 bh=ZH48jvF0up+hCWZK5ypwMWTFHlSbfZaq2hSsrwUJGyw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VYgCeGVHMpNsdy8YVaOEe6io1q1onUzgTlJlgffHMUa3cVhgDBooaQjGRMCYJb4hy
 fWsFmiPkEZsyZwrmRvECcT0NvOjnz1P7iVo0nIycEBX8QSnXNyhGLxsuhDlLqQLOTG
 Gg5syFe5GXzK1k11GHoqEU2yhR+hosiul+EyjucubTJ8lWiRjU+fYrjbP2eVZvjymg
 gxRLLyMH7L8Vs87RqqolD/UnFJv1AqaBjEEd+WMp66phr7ybmrv2LXLp6frDGmpzpD
 XGq+FnLXjRarmnzZDNNC1FzkdZG1F8XQQgqNVif6k77QujkXloOpFkT0pZWz6+DNYb
 bdssQlXDE2kyQ==
Message-ID: <22b05750-6062-8c59-ac30-c7b342194ea8@collabora.com>
Date: Mon, 23 May 2022 11:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v11 3/3] mmc: mediatek: add support for SDIO eint wakup IRQ
Content-Language: en-US
To: Axe Yang <axe.yang@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Yong Mao <yong.mao@mediatek.com>
References: <20220523074017.12649-1-axe.yang@mediatek.com>
 <20220523074017.12649-4-axe.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523074017.12649-4-axe.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_023232_756644_594641F5 
X-CRM114-Status: GOOD (  13.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/05/22 09:40, Axe Yang ha scritto:
> Add support for eint IRQ when MSDC is used as an SDIO host. This
> feature requires SDIO device support async IRQ function. With this
> feature, SDIO host can be awakened by SDIO card in suspend state,
> without additional pin.
> 
> MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
> turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
> resume, switch GPIO function back to DAT1 mode then turn on clock.
> 
> Some device tree property should be added or modified in MSDC node
> to support SDIO eint IRQ. Pinctrls "state_eint" is mandatory. Since
> this feature depends on asynchronous interrupts, "wakeup-source",
> "keep-power-in-suspend" and "cap-sdio-irq" flags are necessary, and
> the interrupts list should be extended(the interrupt named with
> sdio_wakeup):
>          &mmcX {
> 		...
> 		interrupt-names = "msdc", "sdio_wakeup";
> 		interrupts-extended = <...>,
>                                	      <&pio xxx IRQ_TYPE_LEVEL_LOW>;
>                  ...
>                  pinctrl-names = "default", "state_uhs", "state_eint";
>                  ...
>                  pinctrl-2 = <&mmc2_pins_eint>;
>                  ...
>                  cap-sdio-irq;
> 		keep-power-in-suspend;
> 		wakeup-source;
>                  ...
>          };
> 
> Co-developed-by: Yong Mao <yong.mao@mediatek.com>
> Signed-off-by: Yong Mao <yong.mao@mediatek.com>
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
