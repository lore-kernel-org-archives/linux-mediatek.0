Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B0EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 10:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zeUujVhQKy9z0iHIKqP5rV/3Hvp7IOmSKqElQIsQoc=; b=hDLURjV2mLp9Wf
	9gLj65kaS4UUiNcdWWuCbuiWdVfdbF5xAf6ht4n727lthjoK5qKfwaD5keTY4snksN3fiVd4Byfub
	n5B0hxYvj6SUMTu2gyzB/KEyZomaMMy8txSbSZFRyElgC5GcFXnLRxi11u7L+ZBJ60hQWyynChQOZ
	gH7MsBH3UB0UhJ0+YpPmXdf6riBM91e6rAtEzQozW6IZgh6W7+6xN+Qn4wKnbmjNwoYl8gtAPJztx
	xnXkL6tH903GzQ3UiJDFYFnbQJiJDzGgDFsNiVQjR+U3FXqbBC8UxDyhyFzyf6HAHZJi9piaAUUaw
	mSM/i02AwUgfSnyAtpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRAuV-00HCkZ-Dz; Mon, 07 Mar 2022 10:48:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRAuJ-00HCjq-Kd; Mon, 07 Mar 2022 10:48:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4D0E31F439A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646650082;
 bh=49t+Gh0dKiobgSrRoBPHYN0oflRxS0fy5vammERcD9Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ckDLd4+mGZqYjg43wSSNh8ENXccLafofoibRdJ6DUWeBrF/ziCo5rmFWPsOqABo1S
 c+ctH56yYj8HD6VhDuQKodPGFgvkWBdSOAG/SbAoyunw/6uSj9jJC0N11hHOxuS9xd
 3CqwPUqZE9DBWz/jFgevf+jJLGWbvcu6Fzomcs2TYrvSorDdHNtmjlHn3NE7s/gZ1Y
 L40vsM6GEjXt5F+VINR/3kgQfXSdnCtLTJjys/aMxmrlLTJTvpEhnddTecG2n7V1Du
 qM0kkxmk7zZ0NPoyFiO2549Z4+lU+erGrVaz2smG+y4ldIIeJSpoGFACWBMuboIypM
 lg7f2zof2HD2Q==
Message-ID: <f7f49cb7-54c1-895d-320c-1836cb2ff29a@collabora.com>
Date: Mon, 7 Mar 2022 11:47:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v1 2/2] i2c: mediatek: Add i2c compatible for Mediatek
 MT8168
Content-Language: en-US
To: Kewei Xu <kewei.xu@mediatek.com>, wsa@the-dreams.de
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com,
 liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
 housong.zhang@mediatek.com, yuhan.wei@mediatek.com
References: <20220307033649.11564-1-kewei.xu@mediatek.com>
 <20220307033649.11564-3-kewei.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220307033649.11564-3-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_024803_839511_C79CB4D0 
X-CRM114-Status: UNSURE (   6.42  )
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

Il 07/03/22 04:36, Kewei Xu ha scritto:
> Add i2c compatible for MT8168. Compare to MT2712 i2c controller,
> MT8168 need to synchronize signal with dma.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
