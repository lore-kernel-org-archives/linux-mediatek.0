Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21044C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYM/OnVkAeeLJiLK4IWltIdHjVxqwGCUoUZr8sgx/EE=; b=2CpRo/TU2xzWnn
	vtMuvP4qXvHiLfHQ9uAX7DIOeNyashObN3smisaqYyM9OJ/3G1B6+kFQKOxGK4FoSRz4vT5VTLS8X
	pgN/zh1CkBcVcpPRdvUvGe+Fedh2EP6d6UQUigUYdKYhc/eTnLkiFof+6i6fCp48NYPc/dQQknkH0
	r4ZlVM4pFxOEOhqzKnaKG+JVI0RVIdmKlcBQuuUL045wQmm0WG7Nx+cxccGONiA/qYjeFIs4fivUj
	mG70LOUKvelMhlrRwRpox8Nq/11FGHIOIsutT3ea4uLFqTIncfOa8j7z2sRjF9U1fJ7MWa7EGa4X6
	+0oy3JeVJscOOEv1m5aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nETRl-008jwK-Pq; Mon, 31 Jan 2022 09:58:05 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nETRZ-008jtW-5B; Mon, 31 Jan 2022 09:57:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E429F1F42EBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643623071;
 bh=EEi29dsWai5AtPWSIO5AT3qqVcaOhrIJ5p08/cthRIQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BaVHoXjRJWFx7OC5C42/hLgEuAvv+qcmn2tFaG1/BDyCT6qZFgUIBicbgzhNXKXMR
 HvQzs2GUzlYTDPXmDYyBjvLBIeuCVW5lhF9dbHfuX5nYNPU2gavZ6WhKXxZARlGThN
 Vvfo7obqK3vipniGOOiTV7cKBgOr1hNCY7QT+QUc9B5SUYooMPoMAeQkYkdGADMJOb
 eXKqbSioyGQ/WeuW6ii71EiQr3yjicqgj1IQ2+QsFOKw5Wfsf4NbCptgwVo7N/GuvG
 xIwMvcP758TRuw5jAFLBWX3ere6Dws0GQ8aHDd614QoTG5vU24VIKRLygnQmY0kX+x
 8bCZ/ndGJ7gDw==
Message-ID: <2b5e6475-97db-b6b8-363a-7b33857a436b@collabora.com>
Date: Mon, 31 Jan 2022 10:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: mt8195: add efuse node and
 cells
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mathias Nyman
 <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianping Fang <tianping.fang@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>
References: <20220128062902.26273-1-chunfeng.yun@mediatek.com>
 <20220128062902.26273-3-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220128062902.26273-3-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_015753_416789_60963DBA 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
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

Il 28/01/22 07:29, Chunfeng Yun ha scritto:
> Add efuse node and cells used by t-phy to fix the bit shift issue
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
