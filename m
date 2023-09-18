Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281A4CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWp0xuHtGNDM2q0MX2IuLa+MoAcWG/Z6OFEc/bGdWI0=; b=eLetvn/gC0MyTqm2B7jSrjswG/
	peYnWBJnMe9NpCApsXbIWJIMxUbzBrZpcZgDGLAsQ3ii41h/4qhgnAdopm4821qcnpNhieaZlwx7m
	lDMFxtPBRZsCaeBZeagmYOkKIH/iHsvTsKCb0qDpxQfRM8NynBs8E0q1Hn18hvyQQusl6SjKknrRm
	Cm8Y1fa7r2YYF+3h1p63B2SF2S6xoTk4pJaZEI3UaMDajlLzm0vdjHzbXs59nstaMkt/Oh5BbhcXR
	IMRAM+s2bSpdiaLLcKCVh/Oikc16FKqipMlRVLQuI2b3e121che21tDESd1UDJKsHefmlnl5VkTLK
	HxA6FUgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiA46-00EtKB-0L;
	Mon, 18 Sep 2023 08:57:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiA42-00EtIm-1g;
	Mon, 18 Sep 2023 08:57:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 38C6D6607038;
	Mon, 18 Sep 2023 09:56:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695027417;
	bh=9BQdC/JHkHcdOqMH85ztpqyqjqMwin/967MJsdBXVpk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GjhmQ/oT89hKNZL51q4P1v5TzHe7qLIabTL366gJs7IMO6eF2+ppo1lUDnicxG6d7
	 J6sQwSYRh0PCvqBkt1RogueXr5PlpLz+dLtt+HoUxat03wS5dmtM+3Ji4su8by/MTp
	 POUDWq/bUCfggy4rFiCMF1pC5KAyGpaRCTS6RnnWmzA/FFQ6CJiWMW2NNs16prEHXR
	 HM0f/K6PlMtgU2HEwu+AFsZZZAjsYzfc6cWGhE8z+tEKV1MrHa1y81LmAGoo2++ZkZ
	 /yICq5aXagG4iGLjulIHPlbWhxfn63RxDn2g52Qs+blFm8OHvdI9ktc3s1rD+8amGB
	 m7yC+84dq4/mA==
Message-ID: <6e37b93f-7806-8d50-d169-12171a2b29ae@collabora.com>
Date: Mon, 18 Sep 2023 10:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/1] drm/mediatek: Add missing plane settings when async
 update
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: Bibby Hsieh <bibby.hsieh@mediatek.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230918070028.17915-1-shawn.sung@mediatek.com>
 <20230918070028.17915-2-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230918070028.17915-2-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_015706_685796_980DBB86 
X-CRM114-Status: UNSURE (   7.89  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/09/23 09:00, Hsiao Chien Sung ha scritto:
> Fix an issue that plane coordinate was not saved when
> calling async update.
> 
> Fixes: 920fffcc8912 ("drm/mediatek: update cursors by using async atomic update")
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



