Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25113C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 13:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VKUVrLTFueS1qvpxkzMZOec9xy+cLwegOWFu44hdC0=; b=kf3YAS3QL8gCDniqKZyRuomDoo
	7gvNknkPNKHtH4NqVu/t6Fp8KuFXsU1q2E+xCEww0Lue7y9SQjbnahNB1QG72ha9RPNcCMnKsiEcf
	YHpRMIQl6Ha/5ibYSDF+m21EukIRAPArcwDcH2TFxeemLSyWRweSDX49skvvxNla3LyVJQMjYCNta
	lpKdlAOTM/do+8/7rtWVTL7ncOMPHczVijJPQ6ugNzpT7lzLJIa2c3riFQNdOQMm+BGKbQFc14/nD
	fZ0iP0mZOSjfUxncGdW2H+f70lVtxkzGaUzsg69GMx2ky9XzAqjudRTnnnoqeedUj2gR6YAOjkas5
	gUPIPv6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOzcs-0000000AEyg-2t1F;
	Wed, 03 Jul 2024 13:02:22 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOzcg-0000000AEvS-033J;
	Wed, 03 Jul 2024 13:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720011728;
	bh=TOADNGjX56WX/yUPHZlqe4KeE8KUG2F1J81HJ0Nduqg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B3QwUuHMiLSNKY8w9FvSDHWQGC8RtMk2lCdQq680c5dTUYDC/xAUAToJfsYk4gQqd
	 Vka1X3ruIcwYyoVLk7s6JNyUtCMW0ib1JuQsk40T2B5QvFINWA3n0Augx1T7UNBjhc
	 SLyJ9mqrkTvrCFepImK9vz23Ap1/wd3ktUlbZbeI6Dx9oXQ74s4knmj8TLq0C+9sG3
	 aOBDnN1SONNb81JtpD6lX1CHNFL3s6uPPvRizudbF2VQ+boZioAzfZmSdKsfCoAkvJ
	 1uDZiztl0i4Jsj/j1OoazfDi8AqdtGNJnQYAyUnoj4QNTQcPOxN60sZfVpCSaWy//R
	 Tow4qrC+Y1+Lw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AACA43782194;
	Wed,  3 Jul 2024 13:02:07 +0000 (UTC)
Message-ID: <59b24780-3c17-4e1a-ae3c-14584f9f5101@collabora.com>
Date: Wed, 3 Jul 2024 15:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: mediatek: pwrap: Constify some struct int[]
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 matthias.bgg@gmail.com, fparent@baylibre.com, fchiby@baylibre.com,
 s.hauer@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <cover.1719652155.git.christophe.jaillet@wanadoo.fr>
 <626783bb264a8b3b0c8cd7e1d9f9b241f0a494b6.1719652155.git.christophe.jaillet@wanadoo.fr>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <626783bb264a8b3b0c8cd7e1d9f9b241f0a494b6.1719652155.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_060210_246035_03CFA356 
X-CRM114-Status: UNSURE (   7.27  )
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

Il 29/06/24 11:19, Christophe JAILLET ha scritto:
> These arrays are not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>     text	   data	    bss	    dec	    hex	filename
>    45528	   8532	     16	  54076	   d33c	drivers/soc/mediatek/mtk-pmic-wrap.o
> 
> After:
> =====
>     text	   data	    bss	    dec	    hex	filename
>    52664	   1384	     16	  54064	   d330	drivers/soc/mediatek/mtk-pmic-wrap.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



