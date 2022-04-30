Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433D9C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Apr 2022 16:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tLfxwPdbatCNwT7h3YwE6A/0OMTn/2zgfMjqkasGYME=; b=OsIHgcrTSEJQD4
	tG3LUL7EX2r3i1r/BhbL/CZ7h01CUfgxnreCSI56puDQU6TKedmoi4aGQLm5Hm92nSUJI6D33V94W
	x+QMik9+9nTd4shOvSTRczD7zdLVHSnt+w45HB7O8ZT56j2umkV7DghmTOH9qTNUQInA0mT0/Hr7c
	YS4/3PZRfy1Vg2eZc+HDeRPMXwIbBvANytxAYYA9Qi7Uft19JrpvF4Lvj38xLtTsVeDT/Zfsen6gK
	j+dPhdHnUxPKZEpN3ELwweRjtSkdf7TODrxgMzxAClOMVvu+RZ+Sv1g/hn9W4xyylmmG8ukOY6pDP
	jjucwQjFYNQKCWY2itew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkq4Q-00EeL8-OV; Sat, 30 Apr 2022 16:35:46 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkq4C-00EeFS-T3; Sat, 30 Apr 2022 16:35:34 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1nkq45-00087w-AY; Sat, 30 Apr 2022 18:35:25 +0200
Date: Sat, 30 Apr 2022 17:35:15 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, John Crispin <blogic@openwrt.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm: mediatek: select arch timer for mt7623
Message-ID: <Ym1lQ/4WHmWYEBX+@makrotopia.org>
References: <20220430162748.535317-1-gch981213@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220430162748.535317-1-gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_093532_970924_33E0069D 
X-CRM114-Status: GOOD (  14.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, May 01, 2022 at 12:27:48AM +0800, Chuanhong Guo wrote:
> armv7 arch timer is required on this platform for a functional system
> clock. Select HAVA_ARM_ARCH_TIMER for MT7623.
Typo: HAVA_ARM_ARCH_TIMER should be HAVE_ARM_ARCH_TIMER.

Otherise:
Acked-by: Daniel Golle <daniel@makrotopia.org>
> 
> Fixes: 31ac0d69a1d4 ("ARM: dts: mediatek: add MT7623 basic support")
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  arch/arm/mach-mediatek/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
> index 35a3430c7942..8a8d9142260a 100644
> --- a/arch/arm/mach-mediatek/Kconfig
> +++ b/arch/arm/mach-mediatek/Kconfig
> @@ -26,6 +26,7 @@ config MACH_MT6592
>  config MACH_MT7623
>  	bool "MediaTek MT7623 SoCs support"
>  	default ARCH_MEDIATEK
> +	select HAVE_ARM_ARCH_TIMER
>  
>  config MACH_MT7629
>  	bool "MediaTek MT7629 SoCs support"
> -- 
> 2.35.1
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
