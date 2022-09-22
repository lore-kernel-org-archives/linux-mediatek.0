Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948C5C6FA82
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 14:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAHUtRsMY5eEQSKIl1HLFSP5O77TN4tNjCEjxGo9gF4=; b=LQ3EjSwc//jYp0r4W2UlhDmRoH
	wqv94yy635M8J5hwH3h6/6LHSKDjGWE6iL3qvk2x+KOlulpjWtgn4GKO9hW5XLM57jy8qbRAHJXDp
	vBVRmV46EpwS/uouYFUyljD+d5yHO82a266cQamNYccvTX4xJqMN8m7BZGGhvSQfYcPjZZNwHh6a/
	UdFB5dbDQ6M5UYgwp1TuHLEu5Pkhzfo9XDtyosHWeG8HhdLHroVo1bgGR9StkPV53csiNn+EpRPNP
	R1Zm9RZuQsxwR2CE7gjppECxMu/ZM6FfCHWdBL2l5VpDc3iRfFJUwRZn1uJq5SP6qw1wpF1Qpgbeq
	lWznks3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMuv-00Fu83-Ei; Thu, 22 Sep 2022 14:11:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMuj-00Fu4m-Rv; Thu, 22 Sep 2022 14:10:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E089D6602226;
	Thu, 22 Sep 2022 15:10:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663855851;
	bh=TRFbPqxLjzBnnRuOCvs2z9tXxp7atOEkeLU6sHlD8YU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CxncZmHMmvJEFr47r1L2iLmzqZ6K/ReKW1iYT8vOzF88RAlJRHAyRpucfkUqZlCU4
	 Ajpzu48dd3cJyhGPrAOdgwv2dzeLBjo/+/+6JnZZivUPaCXlPetWhYa+SzYcR0OXgw
	 ozNqeBeszz/ytO+5hUT00f6rUJNoWC2tCV1/V19Uu9tosPk7Ok7AmxDStWcSiWuRxK
	 MStKSKGriOOaQ2bW6lR9Eu0IkLM8swgd+emBPBN8EVDGV5i/8TQ1PA5i0ouOGbOq3l
	 37kypuWk60yKQz10gaVkiIUX8hd+2aR31u/a8FYLH84+vtQVtTn6TGySpqMCW4k37u
	 bYz0fknrWd5Bg==
Message-ID: <ce4a6e7f-dee3-c260-bd42-bc77927916e8@collabora.com>
Date: Thu, 22 Sep 2022 16:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] ASoC: mediatek: mt8195-mt6359: Use snd_soc_pm_ops instead
 of custom ops
To: Mark Brown <broonie@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
References: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
 <YyxGXXSp2JD9a6ah@google.com> <YyxjZ9nCBdVovkVs@sirena.org.uk>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YyxjZ9nCBdVovkVs@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_071054_142124_E723DBE1 
X-CRM114-Status: GOOD (  11.94  )
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

Il 22/09/22 15:30, Mark Brown ha scritto:
> On Thu, Sep 22, 2022 at 07:26:21PM +0800, Tzung-Bi Shih wrote:
> 
>> snd_soc_pm_ops[1] sets some more fields.  I'm not quite sure whether
>> it would introduce any side effect or not.  Perhaps Trevor could
>> provide some suggestions.
> 
> If it does it should be to fix isues rather than introduce new
> problems - I suspect the other operations just don't work
> currently.

 From my upstream tests, this didn't introduce any issues, that's why I've
sent this patch.

In any case, let's check with Trevor, just as to be extremely sure, but please
use an upstream kernel for eventual tests, as there are quite a bit of changes
between 5.10 and current upstream.

Cheers,
Angelo

