Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5676FC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nWzKwVCDyHQ7mwhifVhMCJzCIh+xtVosBG2ctAqRgCc=; b=1iIFfjnyy0JsUSKioQ0hIczEY8
	hpvV6uiV4OrcQdmuTpMBWyeKmh4VKpyvO6ydev6Uxc4R3r4gQlnjaSDoW5D9i6J/1ZYUMBCk7nf/B
	ue9RFmkIGnUSuCm2oDXQ/c0O6Nuggz+C4ab00fBtmmBklfVIi9i0VfWiSgbt4eVEaTsdRy5QpOFrw
	CIi89lbMNWSs04Jiu90mqre5ahdjH4prkT9/JqpF8eCWADlb2rLGMGuQgU5IKXFSnt+gdpW5W8t/2
	dSH4bibUgMqmU5INrmv4e2iRk0X2bR73bhGj1Ey5L/GC0YMH/eCoit4/acQqboqdgd08bLGVPepuR
	pxyQS0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7weC-00DhFw-4G; Wed, 21 Dec 2022 10:48:28 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wUc-00DXTS-71; Wed, 21 Dec 2022 10:38:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F6256602CBF;
	Wed, 21 Dec 2022 10:38:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671619112;
	bh=IkQJWZasZIrnDPiyIB1GoQaNvpe67gEZajUnu33b75g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bc3MAK9zTC9soHtTCyi+kokUtU1Y0sO3YRPmUzkuCjpgq4BqaATzj7D41w2cKcxON
	 JKY/46f6OzYd8jzwQrYa2unYHcOH1r9O/HEhUt7Q0yFG8/DPWNR6tGYmMhjcQoajww
	 ZAjfZ3iGZoxzTNW22Fe706/WOYMupEcg8M6gUqykM7k9im8jg1kEJgr+irXkeFwe6c
	 U2pVfi8B/v4c20NDV80Z2CK91ZESLYcYM2yJ8E3jxeE97c5kg5Z2ClY2mpmEaU/nk7
	 cYQ2fqIteumZeMTWTR/PSE6e4syXEmgZc/RejXkLyY+yaa27HV3ykHsghE03HChCgr
	 8L7ed3ZjE8Phw==
Message-ID: <9e2d13f2-03cc-1c4c-d24d-b653aae81936@collabora.com>
Date: Wed, 21 Dec 2022 11:38:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] media: platform: mtk-mdp3: fix Kconfig dependencies
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Moudy Ho <moudy.ho@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221215164021.694343-1-arnd@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221215164021.694343-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_023834_463776_04C86E42 
X-CRM114-Status: GOOD (  13.06  )
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

Il 15/12/22 17:40, Arnd Bergmann ha scritto:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The new mdp3 driver uses 'select' to force-enable a couple of drivers
> it depends on. This is error-prone and likely to cause dependency
> loops as well as warnings like:
> 
> WARNING: unmet direct dependencies detected for VIDEO_MEDIATEK_VPU
>    Depends on [n]: MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_MEM2MEM_DRIVERS [=n] && VIDEO_DEV [=m] && (ARCH_MEDIATEK [=y] || COMPILE_TEST [=y])
>    Selected by [m]:
>    - VIDEO_MEDIATEK_MDP3 [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && (MTK_IOMMU [=m] || COMPILE_TEST [=y]) && VIDEO_DEV [=m] && (ARCH_MEDIATEK [=y] || COMPILE_TEST [=y]) && HAS_DMA [=y] && REMOTEPROC [=y]
> 
> This specific warning was already addressed in a previous patch,
> but there are similar unnecessary 'select' statements, so turn those
> into 'depends on'. This also means the dependency on ARCH_MEDIATEK
> is redundant and can be dropped.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Fixes: 9195a860ef0a ("media: platform: mtk-mdp3: remove unused VIDEO_MEDIATEK_VPU config")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



