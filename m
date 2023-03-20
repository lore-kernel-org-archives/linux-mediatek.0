Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B7AC7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 14:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrRGbnOK1FX9i/ojAu5G2AQ/RmNkK4/39qO+PqO+1zk=; b=C2hHRzJrrylo931guetSyD+zVd
	KYe2Eqxk/2i4tCW1Sfw4xEpSBa8P2uAbh61xiwi9hUKfcMf6HsjT7jy25t3G05DVpgORncpf0dwm5
	C3WmcWMpIeIf7FcwmhpGVdFtjqBPasTBSJsP8p/zt8NCMGiFiqQOFB+p/QfRix0dqs5k4EatLFsuM
	5XmVfB8QYK3ES6Cn0Feck7kZGTNMAh0OxXlAMX4eNb7aJE7CkVqGCWnhGMNW64tPING+KPzE6sq21
	uWj0s5ZccE3mspAHNk16XG2q9tfBCe4yqwsoY5bsQ3IebB2I8eOk5XPpBoXoU4rnVHyHmxciQzod0
	08XoOeFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peGiy-009MPl-0m;
	Mon, 20 Mar 2023 14:43:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peGiv-009MOW-0D;
	Mon, 20 Mar 2023 14:42:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D410D660212C;
	Mon, 20 Mar 2023 14:42:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679323372;
	bh=1PCOMoENo5QV1yJfjTv1LPzClFUUYLNo+EJ9cnM0EJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fQA6F6bYqkFXmYuOYjx5Fou2CI4BblLmcXlfoMWjrjA2/B6OGqG1Pq285ZJHu5fOQ
	 XjjDmuyiqgA5Oc+0+zkcfn6WY3A7k0RvYOfHrw3FPhjSufylFiVpC7uqMpWybRWfrp
	 87iJx1ywBEZr1SpucGKR76fu82VIniQ0u0wKtTp4SkWXZl4LllksBxZrMhcjOSu5fi
	 Z8ndbUKPhGeGRwOeRNrJ8HAaXVUN4qDqiYBk21V6RE3hcD5UAqrGzo6mC7aZuhxOGF
	 XW8VmJ+tN+mYOS7nxL6FKvenceibyx2cVcQLOK6rj5fbpcU5hMqF5+1Xmz9zoGJB+w
	 fi4Ee8x+a9IEw==
Message-ID: <01964ce6-7a91-a86e-6ae0-73ab177ba01a@collabora.com>
Date: Mon, 20 Mar 2023 15:42:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ARM: mediatek: Remove unused configs MACH_MT6592 and
 MACH_MT6592
Content-Language: en-US
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230320132634.17331-1-lukas.bulwahn@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230320132634.17331-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_074257_320198_A5CE48E8 
X-CRM114-Status: GOOD (  16.03  )
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

Il 20/03/23 14:26, Lukas Bulwahn ha scritto:
> Commit ad8a221e1f49 ("ARM: mediatek: Add config options for mediatek SoCs.")
> adds four configs MACH_MT6592, MACH_MT6592, MACH_MT8127 and MACH_MT8127 for
> foreseen future use in the MediaTek pinctrl driver. As of now, nine years

........

> after that commit, the configs MACH_MT8127 and MACH_MT8127 are used for
> that purpose, but tconfigs MACH_MT6592 and MACH_MT6592 have not been used.
> 
> Remove the unused configs MACH_MT6592 and MACH_MT6592.

I say that there's some confusion in the commit description... :-)

Please fix.

Thanks,
Angelo

> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>   arch/arm/mach-mediatek/Kconfig | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
> index 35a3430c7942..521af13a79d8 100644
> --- a/arch/arm/mach-mediatek/Kconfig
> +++ b/arch/arm/mach-mediatek/Kconfig
> @@ -15,14 +15,6 @@ config MACH_MT2701
>   	bool "MediaTek MT2701 SoCs support"
>   	default ARCH_MEDIATEK
>   
> -config MACH_MT6589
> -	bool "MediaTek MT6589 SoCs support"
> -	default ARCH_MEDIATEK
> -
> -config MACH_MT6592
> -	bool "MediaTek MT6592 SoCs support"
> -	default ARCH_MEDIATEK
> -
>   config MACH_MT7623
>   	bool "MediaTek MT7623 SoCs support"
>   	default ARCH_MEDIATEK



