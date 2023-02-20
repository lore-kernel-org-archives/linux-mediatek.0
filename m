Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11727C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r03vOJafeW8bLrIlYeef5dwlOQUUAiC1FpEOzDghrq4=; b=NCmReir/7r8abudNghC79GUn/m
	hLAqd3jGzPsEp/yR+PH/qytbyZeaOVIJ2GvlA7GO3opEw1uRbC4wRKQtlyT+j/AwvPwNKzDVqkwqm
	XYH2Nfy9PkQvWDld04sC7TjbJjomwhV5NxUhdXTRaMEHdHZvMyXocRMfK2k7N/AZXnAC8AaDbmgla
	YxPewpOlOZysqM0nHgKZPBpt1HSUn7qo6KmJExLSxgA5GlFfv+fbRYBSDs8/HKM4Pfd53tvJrVKrf
	ggtoMeAYx4JjqLxM/CEGUffp5gX8L3iR8ox75fJ2qivhV+FVZx0cXtDEhr19TIp5syMJ0PZcd7Dge
	KWYSG+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU26f-003RW7-HQ; Mon, 20 Feb 2023 09:05:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU26R-003RRd-8w; Mon, 20 Feb 2023 09:04:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E66026600872;
	Mon, 20 Feb 2023 09:04:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676883893;
	bh=6pMjB3CwfdxT0lcoBj6rbLitJri1o6cACyPKXzc0sMI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dRU1TbHgVoJ3/QskG6P40PtEurbE7EFYxSln9fuV05r4Om8/FzVIs5CLSDC/nx5oG
	 CvNL+ae8p8pFMoa2kdA3L+EqUfqZFkk5vNK60JvMC2K0r+23tjSecqX3OlLIBD8Q49
	 jXNsb8VkRIUxrGze9sIxSwatCW+1Bwibnq72sqeTJJXHigUl5o6i9WJNiJ3mUJ7wzw
	 ZLIe6awyeFIXTcDall9sq8vCRxmSiujh1jpY6hxj1e6LJbejXrxp6KHKvfMxuA6fRF
	 tKSgROVZH1QO6NLgjUXXZkQwHMJ3SiXEmQDPNGbMZEEi4285IKUqk7IdCtvGPGtekC
	 nTE+iCMAqGo8A==
Message-ID: <d67a960a-5a24-3744-276b-bf65bdddebfb@collabora.com>
Date: Mon, 20 Feb 2023 10:04:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] mt76: mt7915: expose device tree match table
Content-Language: en-US
To: Lorenz Brun <lorenz@brun.one>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bo Jiao <Bo.Jiao@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>,
 Sujuan Chen <sujuan.chen@mediatek.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230218112946.3039855-1-lorenz@brun.one>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230218112946.3039855-1-lorenz@brun.one>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_010455_468037_AF2B35C4 
X-CRM114-Status: GOOD (  10.53  )
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

Il 18/02/23 12:29, Lorenz Brun ha scritto:
> On MT7986 the WiFi driver currently does not get automatically loaded,
> requiring manual modprobing because the device tree compatibles are not
> exported into metadata.
> 
> Add the missing MODULE_DEVICE_TABLE macro to fix this.
> 
> Fixes: 99ad32a4ca3a2 ("mt76: mt7915: add support for MT7986")
> Signed-off-by: Lorenz Brun <lorenz@brun.one>

I don't think that this commit needs a Fixes tag, as you're only adding (good)
auto-load commodity.

Regardless of that:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


