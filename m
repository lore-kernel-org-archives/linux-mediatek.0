Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151E7CD343F
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2026 14:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2nhovRvFw1+XQcDcRJ+2hvlsNXDoa4sYKL7qfbTHmc=; b=AbzM5aRZfNyH4aji9UYyhNK5X5
	h5AUG+ttQKaTAW8E1hfzJfGcWWaHqrsZ1MoMADEGoHZfLWi3GAE0trQ4NyMP++SejvlPEDO92j95U
	aQEkNEbe1bqx4KPg093oeJRvoxINyIvaekyjQqIOqb61zKbaXNyeIIMlbcu9xmAt1BHRbzl8CyKJo
	rirV3NpqlpfiDJkCNmwzaVKU1XqnqIO4y05s9xHYLHAqL4FTbOqcLPxN6C+aPDSZg0HpjHoUFj71D
	8SskVRiMUrFn024qvZlfjelbc2X5jVJc7R4vST1KLRHu3TUL/vUKnlLj1DvuIu086Mv1ZHSFCd+I/
	Y63XXTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzPE-00000004101-3Kax;
	Thu, 07 May 2026 14:08:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzPC-000000040zV-1Spt
	for linux-mediatek@lists.infradead.org;
	Thu, 07 May 2026 14:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778162925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w2nhovRvFw1+XQcDcRJ+2hvlsNXDoa4sYKL7qfbTHmc=;
	b=ba9NRdwtNchs3C1yZ5WACCJnB5cEx7w/p7jb9La71BElniHsLPh+ZT0j6ph4EyWoekbZYZ
	3Pd69vtoeAuv8WwdXrBTJTJqM7Qs/RjD0tTcJsC5TfOZh2Ahg6t8G04fgT3fIqpXjsLNuM
	0vY583ff+W64BRwokPZsVXIXtcysj5A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617--D5vdnnaNeqXOJlsvJRUcA-1; Thu, 07 May 2026 10:08:43 -0400
X-MC-Unique: -D5vdnnaNeqXOJlsvJRUcA-1
X-Mimecast-MFC-AGG-ID: -D5vdnnaNeqXOJlsvJRUcA_1778162919
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43d789cebcfso1445272f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2026 07:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778162919; x=1778767719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2nhovRvFw1+XQcDcRJ+2hvlsNXDoa4sYKL7qfbTHmc=;
        b=SAH7O9Wn0zD31p2TuSb/9eeYJr9R+0LahvBhwcExceNeQutX3rDQDrVFjZzM7MKt4e
         b+pV5uW+/tMzYTaZBqKuPoJSjTbvGYd2J2D95UqDQ/eb90BU8dXa8Jro+UkLyV7GZOAI
         zj3d67IPeVJe8kUjw5p7yQQeXH2XGE9WqdtfrlT2BsEy6/ze+1JzAa2b9qHgvHIDV3sN
         FIyEogV0WX4nTgNtgMvtHimCWrjmTUasEuO/SURm2olrifWzHneIqfaT+MXA+B4L+rPU
         kmC28ucFR/2COUp/ABUY9Cfy6ILFLuA6vKgizi1GXfcxYFoL6fFGGPNPskJwBqYHKj7K
         pE7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+4QXdihpRX70mDH8Ma5C0rfx5LqAuxXWcDCdR4cA1VSVfWVwYhsyD/CkfxiWUvFaznz72zXUIL8HQ3UWoMAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwS4fA7CAg5aEzFY1Y4FNSS9ZvzLldV8GC/nbB4z2dcpRTVze7x
	bCaVS5e39yHgrqRcG2GvpcsQPSIdbjOkkOevprZMu2WhHdyi8r2fnPaWWGxyPcInxbVGGFhPSyX
	btJ+0sS341QENTQjU9ici5G7un/WIZv+RmfhpzgEX42qzJb0EDUVViL/8HnHuwd3Ww4nF3LFxhQ
	==
X-Gm-Gg: AeBDievPkpLxMrEal2L6NuwEszXB7suWJxAxJRw2ZfkmdeiW+9WoT2uwFzTUZ9c2rxl
	lNXXbqxY00zDxxdzcdFU3h/BkqSKtsWviUWVAfPKwaiYu7mpD2T2fmBAe+DMYwNgDDBZqQBKAjy
	e/MTH+NZFkOvQg5y6U/zed+GSYvX7pTq6M/ZZ3nT2dDc2D1+jxvGYLt/sJLm2oWdahDME2WmXTU
	QvWHUhnv9jSkNBO9tMZQT65/gWwUI6B4xAAmS+0DvgFwsX+p+mhJEMpBO0rtdtv9jh0gIDyXVXu
	UFVYWdgCpWXCoTyqVtN2rRNHcFe3Bdf7zahFIahF4AY1kmVgDucJ9dmn3LzwN7Pjwk/8NJfimJ7
	P3+gkj3nMahTHR6KflOIEBK1qjTjYXuER+M+pUwpW0M9WQMbfIOuNCXciFQzeyehvh7QJhti16H
	Wv
X-Received: by 2002:a05:600c:3e86:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48e5dffabcamr46917735e9.9.1778162918802;
        Thu, 07 May 2026 07:08:38 -0700 (PDT)
X-Received: by 2002:a05:600c:3e86:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48e5dffabcamr46917155e9.9.1778162918260;
        Thu, 07 May 2026 07:08:38 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530d8691sm91116195e9.2.2026.05.07.07.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 07:08:37 -0700 (PDT)
Message-ID: <dc0f052e-797e-4849-87c4-a98b8ede19d3@redhat.com>
Date: Thu, 7 May 2026 16:08:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/5] net: dsa: mt7530: fix FDB entries not aging out
 with short timeout
To: Daniel Golle <daniel@makrotopia.org>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 DENG Qingfang <dqfext@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <cover.1777986341.git.daniel@makrotopia.org>
 <f285707e09a0febffd1b987f204ff4eb71736489.1777986341.git.daniel@makrotopia.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <f285707e09a0febffd1b987f204ff4eb71736489.1777986341.git.daniel@makrotopia.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tgHdP5CnX4ocMERdK6RciVeBUt8ksnLWorLnz0Y0d_k_1778162919
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_070846_464559_41C81F86 
X-CRM114-Status: GOOD (  22.31  )
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

On 5/5/26 4:16 PM, Daniel Golle wrote:
> When setting a low ageing time such as 10 seconds, the algorithm in
> mt7530_set_ageing_time() finds AGE_CNT=0 and AGE_UNIT=9 as the first
> exact match (starting the search from tmp_age_count=0).
> 
> On the MT7530/MT7531 hardware, the per-entry aging counter is
> initialized to AGE_CNT when a MAC address is learned. With AGE_CNT=0,
> new entries start with a counter value of 0, which the hardware treats
> as "already aged" and never removes, effectively disabling aging.
> 
> Fix this by starting the search from tmp_age_count=1 to ensure entries
> always have a non-zero initial aging counter. For a 10-second ageing
> time this yields AGE_CNT=1 and AGE_UNIT=4 instead: the timer ticks
> every 5 seconds and entries are removed after 2 ticks.
> 
> Fixes: ea6d5c924e39 ("net: dsa: mt7530: support setting ageing time")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/dsa/mt7530.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 44d670904ad8..b1903da7d500 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -1027,8 +1027,12 @@ mt7530_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
>  	if (secs < 1 || secs > (AGE_CNT_MAX + 1) * (AGE_UNIT_MAX + 1))
>  		return -ERANGE;
>  
> -	/* iterate through all possible age_count to find the closest pair */
> -	for (tmp_age_count = 0; tmp_age_count <= AGE_CNT_MAX; ++tmp_age_count) {
> +	/* Iterate through all possible age_count values to find the closest
> +	 * pair. Start from 1 because the per-entry aging counter is
> +	 * initialized to AGE_CNT and a value of 0 means the entry will
> +	 * never be aged out.
> +	 */
> +	for (tmp_age_count = 1; tmp_age_count <= AGE_CNT_MAX; ++tmp_age_count) {
>  		unsigned int tmp_age_unit = secs / (tmp_age_count + 1) - 1;
>  
>  		if (tmp_age_unit <= AGE_UNIT_MAX) {

Sashiko noted that the above will have problem with secs == 1:

What happens here if secs is 1?
Since the bounds check at the start of the function allows secs == 1,
tmp_age_unit would be calculated as 1 / (1 + 1) - 1, which evaluates to
0 - 1, resulting in an unsigned underflow to UINT_MAX.
>  		if (tmp_age_unit <= AGE_UNIT_MAX) {
Because UINT_MAX is greater than AGE_UNIT_MAX, this condition will fail for
all iterations of the loop.
[ ... ]
>  	mt7530_write(priv, MT7530_AAC, AGE_CNT(age_count) | AGE_UNIT(age_unit));
If the loop exits without ever finding a match and entering the if block,
age_count and age_unit will remain uninitialized. Could this result in
uninitialized stack variables being written to the MT7530_AAC hardware
register?

/P


