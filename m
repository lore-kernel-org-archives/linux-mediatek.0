Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4A9C4363D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 13:12:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA7A2206B8
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 13:12:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DM7cW+Q7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="maJ20F6E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA7A2206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cBeiHAf29uvm5erfeN3wSW5n80Gsgk7q7cJJl0aTKko=; b=DM7cW+Q7+6bcwFJWtFILxvpBN
	/CxPpSTK6zELVOwkYCmdIEt6R7quQZ4qTo3IKr4qUTyNZkWvt1Ga39M8hrWNRz0L+ilCb30LlIdUw
	mkOk26asr0o9f2AOJl9ZxW8YSc0XmFTsY52Jeu5ApVK7uegMmTMF7jfommLcLvQLlbeQkb3r9UIHo
	YrXKPROQXOEnhk7B2PSlEFZmxiry/allKOxB0KB7lAcdq2L8iqmE/AXEoNaM3WbuBWBe66nCvlolB
	DlYmV+NKb7XzeMYxXOZR4funRKmRqDBVGqndy1KQlBiCERCSuwdYi1YrP55jgGLOOR6OTiHI6/ZKC
	cO5Nq8CEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLR2S-0000qZ-OL; Thu, 24 Sep 2020 13:11:56 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLR2Q-0000pV-0S; Thu, 24 Sep 2020 13:11:54 +0000
Received: by mail-wr1-x443.google.com with SMTP id j2so3751523wrx.7;
 Thu, 24 Sep 2020 06:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=fAIKdX6Q8v6X6iiHvQpMrhkDP+drcMiwEPPTPZj0rvw=;
 b=maJ20F6EGsDJEim/bn2SH7SAi5AhsgRO1Ou/NdSDvJ8bad8V10rA0qkN9VcPuFXOxF
 8hCDaJozazVQ/EdNOFUemlgtfLN4qDfhWNKqDzdSnL1v+D8LYePxnPpYh4LhIPdGbeCF
 8b661AurKiqj2W9Techzj6W6U0G60bB7j8YkplNkq+JbNARKQZuFXPPUVCde5V2W+Oeu
 01UjZMLeLXqW+t5NdKlw7U8MPgMrbYS2Wh/neePdBoMxbFfymPfNTvNO5wP9z/Ar4rSo
 BvZxEDQ4/6iLrJYgi7gy863iv524Ychrd52L4phMSEwNJX1eo6AgYhdwmP7H4M6gnrIE
 w2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fAIKdX6Q8v6X6iiHvQpMrhkDP+drcMiwEPPTPZj0rvw=;
 b=M7kTw+g8OJY8UvhCf1YGCbpWBeT64TAj15luTjk2VIVIWYaZKzjtKRra1BgEBrRQZM
 DZP07UIwe5K+p9OWMpsXijxIhBAD7bdKjG0OxBseoCKWEwx6HDL95pJqmJc/jta9znpT
 wmK1UNpUAKmCWUE6ORbmPUbBoJ2bPQmfRaZwwCHLvIgDt+blPExpn/Wu5qe1wLEWLTpW
 chcTjeA0pORD+hUWqRLaR4dr7U+cLQsjPF/ibKNvDRBLRIm8/Y6ysajUXITZ15LK9YlP
 ShLUaKirLK+s48cXM+Gz7p7XF9NzyUOj2eO87pJALEJVRMn/ZD2A654sl/hHL/y+Alil
 hYfQ==
X-Gm-Message-State: AOAM53114a1EA1CT1UX2pwmkskeU9/VVDq3B5BMyEmoPoaTLEg5VEWJO
 ANlHFDymsmd6c7mzGh5mFYs=
X-Google-Smtp-Source: ABdhPJwak7AwvSOJanVnyh+S25XeMOY/zNR+z/BdD9LIi4y4Giqh8DJfmf4ARGB0l7/ZbiqMxZIvKw==
X-Received: by 2002:a05:6000:85:: with SMTP id
 m5mr5014939wrx.160.1600953111296; 
 Thu, 24 Sep 2020 06:11:51 -0700 (PDT)
Received: from [10.101.10.94] ([176.12.107.132])
 by smtp.gmail.com with ESMTPSA id p11sm3302323wma.11.2020.09.24.06.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 06:11:50 -0700 (PDT)
Subject: Re: [PATCH v2] net: dsa: mt7530: Add some return-value checks
To: Landen Chao <landen.chao@mediatek.com>
References: <1600327978.11746.22.camel@mtksdccf07>
 <20200919192809.29120-1-alex.dewar90@gmail.com>
 <1600949604.11746.27.camel@mtksdccf07>
From: Alex Dewar <alex.dewar90@gmail.com>
Message-ID: <9db38be8-9926-b74b-c860-018486b17f3a@gmail.com>
Date: Thu, 24 Sep 2020 14:11:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600949604.11746.27.camel@mtksdccf07>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_091154_059134_D0ECEABD 
X-CRM114-Status: GOOD (  17.47  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sean Wang <Sean.Wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-09-24 13:13, Landen Chao wrote:
> Hi Alex,
>
> Thanks for your patch. By linux/scripts/checkpatch.pl
>
> On Sun, 2020-09-20 at 03:28 +0800, Alex Dewar wrote:
> [..]
>> @@ -1631,9 +1635,11 @@ mt7530_setup(struct dsa_switch *ds)
>>   		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
>>   			   PCR_MATRIX_CLR);
>>   
>> -		if (dsa_is_cpu_port(ds, i))
>> -			mt753x_cpu_port_enable(ds, i);
>> -		else
>> +		if (dsa_is_cpu_port(ds, i)) {
>> +			ret = mt753x_cpu_port_enable(ds, i);
>> +			if (ret)
>> +				return ret;
>> +		} else
>>   			mt7530_port_disable(ds, i);
> CHECK: braces {} should be used on all arms of this statement
> CHECK: Unbalanced braces around else statement
>>   
>>   		/* Enable consistent egress tag */
>> @@ -1785,9 +1791,11 @@ mt7531_setup(struct dsa_switch *ds)
>>   
>>   		mt7530_set(priv, MT7531_DBG_CNT(i), MT7531_DIS_CLR);
>>   
>> -		if (dsa_is_cpu_port(ds, i))
>> -			mt753x_cpu_port_enable(ds, i);
>> -		else
>> +		if (dsa_is_cpu_port(ds, i)) {
>> +			ret = mt753x_cpu_port_enable(ds, i);
>> +			if (ret)
>> +				return ret;
>> +		} else
>>   			mt7530_port_disable(ds, i);
> CHECK: braces {} should be used on all arms of this statement
> CHECK: Unbalanced braces around else statement
>
> [..]
> regards landen
Hi Landen,

Sorry about this... I usually run checkpatch over my patches. Would you 
like me to send a separate fix or a v3?

Best,
Alex

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
