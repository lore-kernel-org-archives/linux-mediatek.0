Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36886C7115D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jun 2025 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68lUwuyihGJ/FS/O4Rr1Ufo0z7cvUD/WCV61oL8aits=; b=MS0zwdsUT+NRTfX0OHqRIlMNqQ
	gtrGM3qjOzYj4fG5K3DTaw3S/cd+rNnqWM8n7yugvU7da4+iXb73Ig7dAEwLilkTPNUiFq4GpysIK
	9/aFUN0vsGmLzEdcEvnYmjlrdZr4msGxRwCTtUjc4PrLOQWq+uT193jGvEaifjaptQZOm3u4WSiCc
	+n0Sh8HMatxpxCjc1CONwL9s7Af+oimRYh2XkTs2guA9Zmw/MfwKPw/X+oP//oHgP3n/n6V9UwJif
	AmJj1uMxU6ASX3oz07Wlqj2fsfrz3aJPKjyQa/X9+UWOJ3mqaYMfImcB+oXe3lVYyIeqmSwXR+fI4
	9jWEN5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTcu9-0000000246p-0iHZ;
	Mon, 23 Jun 2025 08:51:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTce6-0000000215j-1hfB;
	Mon, 23 Jun 2025 08:35:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750667717;
	bh=YU41Sp80pqlhUDxe2jPkjz382ottt88kUUyJc6M5FDs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UyLJtDQZtrSmzZPL7ocG7LPyv+UtHaMBKwtS5T0jLgBTlimfsQ7B0wmKQNVHpZQMj
	 NsPS8SoKF6gFiSTh7AqBPBpt5gtgsxkRZ1wVxl20Dx6QoHjoV6Hvw5394pboV/neuq
	 gg37ihdAihWa566F8hu2HQcan4cmyI0MIniaD2dFeye5VTBLaRmNl9+FKu6NMcFiYG
	 AOE4OkTeTBIWgXqEpXebShUcQZc8uIQntzzG8W09dMLpFR3u5H7uLah445l/TRPTtc
	 OJDfynR+Shv5AK/ajGN1WimF492uR4BXapTqtoUSg4HuqEFEUtsaB9bw25qVo2Dk3g
	 7dcsYbx2VTgxg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B90717E156E;
	Mon, 23 Jun 2025 10:35:16 +0200 (CEST)
Message-ID: <b0c43d9e-bd29-4fcd-9c62-269f6c6ef7e4@collabora.com>
Date: Mon, 23 Jun 2025 10:35:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] ARM: mediatek: show the hardware name for the
 MT6572
To: wctrl@proton.me, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org
References: <20250620-mt6572-v1-0-e2d47820f042@proton.me>
 <20250620-mt6572-v1-7-e2d47820f042@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620-mt6572-v1-7-e2d47820f042@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_013518_611551_7C79F4B2 
X-CRM114-Status: GOOD (  14.79  )
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

Il 20/06/25 17:40, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Add a compatible string for the MT6572 SoC.
> 

Please clarify the commit title.

ARM: mediatek: Add board_dt_compat entry for the MT6572 SoC

after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>   arch/arm/mach-mediatek/mediatek.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
> index e6e9f93a1f01c7d043cf4312b9406b25c8897198..5c28124bd0078b31665fef647e496f4131b82c8d 100644
> --- a/arch/arm/mach-mediatek/mediatek.c
> +++ b/arch/arm/mach-mediatek/mediatek.c
> @@ -38,6 +38,7 @@ static void __init mediatek_timer_init(void)
>   
>   static const char * const mediatek_board_dt_compat[] = {
>   	"mediatek,mt2701",
> +	"mediatek,mt6572",
>   	"mediatek,mt6589",
>   	"mediatek,mt6592",
>   	"mediatek,mt7623",
> 



