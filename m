Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557B5C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 13:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILEZLRB7WKKsVXmtfjC7vZ36qP1bbAKuiPA86TmVL3I=; b=zAhbVZkqmKesEd
	bHSX9w8tZfUQNovO8P27nUNfs1FFJamEAkPf2S4WPpkLotMELnvV4fOsz5fnm9zj/oqBMMGVmELpW
	DnrPCIPlU904hUgJ5mxm5IOaZlUs6xnhw6vzsZtxt059xQW3QMX7uxLybj0BB9CTyAMw1Px9xuZTx
	D891GwnHJnwsxdzyVvv6NfQzPY9MJFkxWcPJ8FNmBDK86UT34Q9WRGY+m5HgWGcNwgZzAWg3zZFcw
	dxGCOjCZKCzVa3gcl8rskIC3J/cZ2iSdrphw4uTEYYqwXHJRM2vCICwgDGgHLK30wslhpqC5/1UU8
	Nj9vKlOMMCRxHp6fatWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRa6X-004ZyZ-MY; Tue, 08 Mar 2022 13:42:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRa6I-004Zsm-10; Tue, 08 Mar 2022 13:42:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 81A161F433C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646746922;
 bh=AUBI82xQKetEKH7Mx6YE728kuNJKmLzt6+6XJDt5Mes=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LazTXcR5ieNSLqwAi7CvqlhlkxdusS1kLqhWCbbWDNGvDtf73NxW2k32sig2YH7+4
 GLYm8HrYCD6x+iqYT5U9irK2VsD+Y2zqI+EeHsG+K+mnRmgtIxTqcITz/plNDMnKXu
 J0kKsWjXYi8Luy2djuEPVK0xZBMe5vq5Gu33jZZcXUPWLW690Gsfmw7CHvUeK+H81a
 9bkNClUh/ZOb+j4qw0FIjmkpLy8KDYMzznDGN6cbMuRziOyaABvtQHkj4eIo1mdLK+
 saSo8MTM+2oX2+3K0CsB3yB30X5KEolCGxlY0Vi19Jtz4n6BDQywKRgr6t0B4WGT4M
 r1X37uN96bv5Q==
Message-ID: <d6fa28ef-fdbb-2b6c-acaa-4c35bb631ab4@collabora.com>
Date: Tue, 8 Mar 2022 14:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [RESEND v13 07/22] soc: mediatek: mmsys: specify 64BIT dependency
 for MTK_MMSYS
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220308093018.24189-1-nancy.lin@mediatek.com>
 <20220308093018.24189-8-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220308093018.24189-8-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_054206_246371_4099826A 
X-CRM114-Status: GOOD (  15.29  )
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

Il 08/03/22 10:30, Nancy.Lin ha scritto:
> Because mtk-mutex change to use unsigned long mutex module type,
> it should depend 64BIT. This is a preparation for adding support for
> mt8195 vdosys1 mutex.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index fdd8bc08569e..24f792c46444 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -68,6 +68,7 @@ config MTK_SCPSYS_PM_DOMAINS
>   config MTK_MMSYS
>   	bool "MediaTek MMSYS Support"
>   	default ARCH_MEDIATEK
> +	depends on 64BIT
>   	depends on HAS_IOMEM
>   	help
>   	  Say yes here to add support for the MediaTek Multimedia

Breaking old platforms is forbidden.

MT2701 and MT7623N are 32-bit ARM SoCs and:
- mt2701 needs mmsys only; but
- mt7623n needs mmsys and mutex.

Besides, this is an easy fix: just change your unsigned long to a fixed size u64.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
