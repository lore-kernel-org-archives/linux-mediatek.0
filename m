Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAB1E706E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 08:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8D9RuYcfcAy2UJypRVFsot3Dg7xp21KbB1OjeUqGZo=; b=pHmHZWGYp5IhIOtFQ3kYDMyi5A
	BgWOYelkAgYpJvnjWphUvyt3r8uXsTLU5YH8IjaygnIBLnLDN6MSsixT1Dc2kcRKVAhpdjS2owt2z
	yKOoBqw7yMJYYZ0YhD5in00N1h/lwcWfoS0AWSO43RwORrmNR/VrX/d+JO+D/r6te2pN8YhB9pX/w
	AxuAPHmguIQsbdnDJb3k1nfFmQuuYU64YwMmOfpSF7vzDdCBSyvXQNfpdW4/16XD3lrbja0HHPviN
	/6lrLOqZfnmsuJnaXlsgFlSqDsozcfgWfQHALnTcH5y/cn8TlxEyIkGZ46VCKTSheuNq3tTjvZ1/1
	NhTDGEog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEbW-005Qg8-09;
	Thu, 21 Sep 2023 08:00:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEbR-005Qed-0A;
	Thu, 21 Sep 2023 08:00:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D3FFE66072E9;
	Thu, 21 Sep 2023 08:59:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695283199;
	bh=ey5W+Sdk5cYFx0SpuDyLNMLly9gNgQcl9KZF+Hs7Q3c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DUp4O18ORCwaBC4JEDWvmA28I6oVL5oekiq2Gl2O/Of+Cl4OjfquAG9qsVYC5qoMr
	 BYIQ9lPFIJEqOCnZO68P99AhTNdyanMSD6IMixj7eydBklxRuiRiLCR6qUTMR1ZMgx
	 9G8c+51+k9VVFf6+ue7kh6EMgkpemHseCPwtYP3PgrZdNutDY/ujy9wiUIA45GcUi4
	 btnRRTEUAtZwDv/xfhVERmXmp3/MCwqzIslni4swqZq60BqIf0x8V/cp2RQZ1cLuVN
	 iOgvFicl15QZCvkPzDAEO936AWvM98dKEz/JjNzn+NMYoPN0O1z5JGTzD5VbgtghmG
	 6ZDmYXuD5Zlzg==
Message-ID: <83993f62-76d7-78ec-4711-b65e95e3aed9@collabora.com>
Date: Thu, 21 Sep 2023 09:59:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1] thermal/drivers/mediatek/lvts_thermal: remove extra
 error check in lvts_debugfs_init()
Content-Language: en-US
To: Minjie Du <duminjie@vivo.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Balsam CHIHI <bchihi@baylibre.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Cc: opensource.kernel@vivo.com
References: <20230921075518.3016-1-duminjie@vivo.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230921075518.3016-1-duminjie@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_010001_292854_A968EF01 
X-CRM114-Status: GOOD (  16.06  )
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

Il 21/09/23 09:55, Minjie Du ha scritto:
> As per the comment above debugfs_create_dir(), it is not expected to
> return an error, so an extra error check is not needed.
> Drop the return check of debugfs_create_dir() in
> lvts_debugfs_init()
> 
> Signed-off-by: Minjie Du <duminjie@vivo.com>
> ---
>   drivers/thermal/mediatek/lvts_thermal.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index effd9b00a424..171ce25fddf5 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -213,8 +213,6 @@ static int lvts_debugfs_init(struct device *dev, struct lvts_domain *lvts_td)
>   
>   		sprintf(name, "controller%d", i);
>   		dentry = debugfs_create_dir(name, lvts_td->dom_dentry);
> -		if (!dentry)
> -			continue;
>   

This is fine as it is: the `continue` is here in order to avoid allocating regset
if the debugfs dir couldn't be created.
NACK.

Regards,
Angelo

>   		regset = devm_kzalloc(dev, sizeof(*regset), GFP_KERNEL);
>   		if (!regset)



