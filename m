Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4884BC77B76
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 18:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+gcuDMOZWCtxpv6z/iFhlVXuBky0Myo5zMF3+w7sJI=; b=qi/vP5Kjwg2/0d
	/0TCm4AxzPyBvq8J6b/a3mdaCwKCsAShOnGRotAM1ArkY7szwkutbh5Dri/nBAy8Zq8xMinGEYRWH
	pR+C3eu02b6oyoWz1vnpwBFUUtJ4RybgK9k0kFMyKSgEbcfVtUQJ6p56jDsvubx2vjMou5kVec/wg
	qJ6QyqGUIdfDCkYWLfNj6MrPQmCuFdq8F5FWQwstYrfkGVjGEU1EUiZZa39rzYuNCZS/EGdc5UUfN
	lTW0vTkd//LV7g9IToYCk7HgdWlcXYIZFRQvdoyqXdM6aQ+ATf08M/uxNKKspJ5KiaW6cx2ihjnL/
	fAdCG6h6QuN2h3LDQFjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvnc-00BekU-0N;
	Fri, 21 Apr 2023 18:48:00 +0000
Received: from sender3-op-o17.zoho.com ([136.143.184.17])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvnX-00Bejl-3D;
	Fri, 21 Apr 2023 18:47:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1682102846; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WlW2ItHJ5I82ifMUpee32dq8wAb+HJ0OrHqIwU6Jy0ylH9gZu4LNMVagnwM+WrgQLahzolbblXgT0tjtN5DgJGkNNAj1R+uFFfM2yZvEk6F7Z0PgfElSf21kJEEXiybuYD9MtX/JoUOtSg5ljA+1hOrPD6ZXKe32AQkp8UbtWSQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1682102846; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=k+gcuDMOZWCtxpv6z/iFhlVXuBky0Myo5zMF3+w7sJI=; 
	b=A5yY5dEqMZGCoXdHRfshhL7DN8Hppd02YkMdNzQy/AVvQoqh/IAuAhE5OWRluXrXDM81xuh+/qSQcFcwxx4yZtHXlcgsNoPFbLNye+g9ucWG6L17PuMZW72M3z63c8seyc1acFi9sWHVsOSFxr9hoL5aAUQ1eAiv1ONEUURNrLw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1682102846;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=k+gcuDMOZWCtxpv6z/iFhlVXuBky0Myo5zMF3+w7sJI=;
	b=QV+YUS5RinB2XYLU4sw3GcrTxDsb79QEgDudmItKcJ+JeUTF6f9+wEpUOLk0ExQ9
	FkRrB+kq3uLrMrLDBuTo3WFN/AYaWO31x4f2Qtwe0K7MoQALhWpD/A3EPz+mCQ7vqfN
	Ebbgq4+7KpIQZk5+c018PZZMhZCTjgRGDkPO0tTk=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1682102845365352.98085651829706; Fri, 21 Apr 2023 11:47:25 -0700 (PDT)
Message-ID: <7982894a-029c-585a-9ab5-3a6295c6abaa@arinc9.com>
Date: Fri, 21 Apr 2023 21:47:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH net-next 20/22] net: dsa: mt7530: force link-down on
 MACs before reset on MT7530
To: Daniel Golle <daniel@makrotopia.org>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
 <20230421143648.87889-21-arinc.unal@arinc9.com>
 <ZELZAd4O9SyHLkwn@makrotopia.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZELZAd4O9SyHLkwn@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_114756_090368_F918C1D3 
X-CRM114-Status: GOOD (  21.39  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org, Richard van Schagen <vschagen@cs.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, erkin.bozoglu@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 21.04.2023 21:42, Daniel Golle wrote:
> On Fri, Apr 21, 2023 at 05:36:46PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Force link-down on all MACs before internal reset. Let's follow suit commit
>> 728c2af6ad8c ("net: mt7531: ensure all MACs are powered down before
>> reset").
>>
>> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   drivers/net/dsa/mt7530.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index ac1e3c58aaac..8ece3d0d820c 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -2203,6 +2203,10 @@ mt7530_setup(struct dsa_switch *ds)
>>   		return -EINVAL;
>>   	}
>>   
>> +	/* Force link-down on all MACs before internal reset */
>> +	for (i = 0; i < MT7530_NUM_PORTS; i++)
>> +		mt7530_write(priv, MT7530_PMCR_P(i), PMCR_FORCE_LNK);
>> +
> 
> Moving this part to mt753x_setup just before calling priv->info->sw_setup(ds);
> is probably better. Though it isn't documented I assume that the requirement
> to have the ports in force-link-down may also apply to MT7988, and for sure
> it doesn't do any harm.
> 
> Hence I suggest to squash this change:
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index a2cb7e296165e..998c4e8930cd3 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2203,10 +2203,6 @@ mt7530_setup(struct dsa_switch *ds)
>   		return -EINVAL;
>   	}
>   
> -	/* Force link-down on all MACs before internal reset */
> -	for (i = 0; i < MT7530_NUM_PORTS; i++)
> -		mt7530_write(priv, MT7530_PMCR_P(i), PMCR_FORCE_LNK);
> -
>   	/* Reset the switch through internal reset */
>   	mt7530_write(priv, MT7530_SYS_CTRL,
>   		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
> @@ -2423,10 +2419,6 @@ mt7531_setup(struct dsa_switch *ds)
>   		dev_info(priv->dev, "found MT7531BE\n");
>   	}
>   
> -	/* all MACs must be forced link-down before sw reset */
> -	for (i = 0; i < MT7530_NUM_PORTS; i++)
> -		mt7530_write(priv, MT7530_PMCR_P(i), MT7531_FORCE_LNK);
> -
>   	/* Reset the switch through internal reset */
>   	mt7530_write(priv, MT7530_SYS_CTRL,
>   		     SYS_CTRL_PHY_RST | SYS_CTRL_SW_RST |
> @@ -2907,6 +2899,10 @@ mt753x_setup(struct dsa_switch *ds)
>   		priv->pcs[i].port = i;
>   	}
>   
> +	/* Force link-down on all MACs before setup */
> +	for (i = 0; i < MT7530_NUM_PORTS; i++)
> +		mt7530_write(priv, MT7530_PMCR_P(i), PMCR_FORCE_LNK);

MT7531 has got a different bit on the register for this, 
MT7531_FORCE_LNK. Are you sure PMCR_FORCE_LNK would work for MT7531 too?

Arınç

