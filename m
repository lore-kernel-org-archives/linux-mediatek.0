Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D583C00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 14:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kue/MY1r9+rCNbVx8h3Vekqbhj14LDDRvg6xS4QFw40=; b=01I/i709kf+nkelDIZSvgBIvhw
	KujvySbxj4TPiJJRLdBI19uxz4GZ73Kd1xo3xsIjqTFVB9zJkiU8ZrG/y801tLv/yNK0RemT1i+NH
	+1SyIEaMu57/iCLqlofxUwp0o15ozDx9Y78GTrRp/KT/12IG7End/4BljVoktWN91BAJbQKQM2PQK
	jhOdOcnDn9N8gvGZtT5+UZ53du55o9Ioa0UUJEPi2pvYB3onemZ9EdvzFjj912rdYdX9EBKIszbMx
	lcBVD36t5LHDK8qIGwFe4ePPbOBvsK0Xr43uu2SIdZ0b+yUP2Je0MlVjesdJWK42t2yGH1ukVF8WF
	UyJCz6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIVxe-005KFp-Oc; Thu, 19 Jan 2023 14:32:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIVxQ-005KBS-EG; Thu, 19 Jan 2023 14:32:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A43816600874;
	Thu, 19 Jan 2023 14:31:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674138719;
	bh=TfklRfGwn0ACn1i+EOgB79a5qIt+xJJJtBTtP7Db1bI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l8o933EOqXAmmNoskLSnZiyHmWEVY+5UKYec7sdgWKpDUHV5pUKicYh9A/ugUU5wt
	 8BPfxNEqizrPo0fn16g/e/FyAmYW2N7QvmLAqvXWkHhqpgZWbX0CmFWx8BbkBretQg
	 f7UtSFUk7OZxwecLEfkwTblG94WquztSkPGH4kN757gXXEBkKDFVNmiQ8qj8NFu34b
	 dOodNkr/pY7i3dGN1FzYzaeol19b9DDK1UsrUNYsujYvJ8T3utFPPShOxKeCBm53QG
	 gQ7L55DnnFZimZFy92QLKA9Vml4mLDLhUlEv9EbbaJS4lJViLcI9HeYJsNFHiaMbS9
	 sDXAz3el1pEsA==
Message-ID: <8100b3a3-60f3-3b39-1f25-2b6baba8310b@collabora.com>
Date: Thu, 19 Jan 2023 15:31:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] i2c: i2c-mt65xx: Use
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To: ye.xingchen@zte.com.cn, qii.wang@mediatek.com
Cc: matthias.bgg@gmail.com, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <202301191719589508843@zte.com.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <202301191719589508843@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_063200_634628_419EE0BA 
X-CRM114-Status: UNSURE (   7.50  )
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

Il 19/01/23 10:19, ye.xingchen@zte.com.cn ha scritto:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Thanks for the cleanup!

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



