Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE20C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 20:44:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BF2164F0C
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 20:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BF2164F0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hSlLtMJmGXfNgtyJY1M2NCnMdoZj1UOIO/EpCiP15Z8=; b=W7j1BeJJbMPAfadkUYXTi1O78
	l5AFnHXiSGOQMPQlj6ekyL2/JB9l3TreE10JS4w0lqGYOMQWvJXPliG8wPzKbOU+jiR8BKOuxIa/I
	ogfnq2amPmnAWnt0PLptqTnSHan/JbXvtJpYSj99a5HchKOqOcFHB9VSm47xq0v+BUXxCQXAzAvu6
	/UonC/Esm3joEFyte2t1g80B+Lbw1pg3E921urXKDGgs6BdYECFghU8s+IiJPTn5HTTBqN8XdQyuK
	N5hzT4PDAgSLm1FMLhhoYN4nH6aEK0AHD93Sw4OMNNCoKAtOHxaJRa7pIy6e4jlqojEaoRNR3Kmj7
	0gcoEAqqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLu4S-00GrfA-PN; Mon, 15 Mar 2021 20:44:13 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLu4O-00GreY-CH; Mon, 15 Mar 2021 20:44:11 +0000
Received: by mail-pl1-x636.google.com with SMTP id o10so3700379plg.11;
 Mon, 15 Mar 2021 13:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gnqsd573zZlQYyXiRV6aGjmdvXijjmPqldHUoXMDfu8=;
 b=vfMMAesX0+rn+X7Wj2z5RMXsCPGLZjCMN8eWSbUrbT9g0JBZPuVf2Gs7reRyy/1mBO
 lp2ecDobKwedGZU27DX61TEAAgRScaDFkC0TOMCDoRUZVxz6jyt23dU2iREeQYu0qYdg
 6gv6ZXGPcWaVcgRONG5OPGsQCMFYGD84Piuho2TT5vjNLgYuSlqQzI/8+iTH29sYCf8T
 qTKuWZdNZgOeFwADWV3ojVrsl7RCpALi6Hxlk476/H4V4pP42oYSwLKSHU83wvsQQG1M
 fx7ygt+BYQSLUuBXXoSjpR3BBZKqzWmqtTqpxfDouYOxKevgM99Vvcsm7BDWTwDp/yR9
 kE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gnqsd573zZlQYyXiRV6aGjmdvXijjmPqldHUoXMDfu8=;
 b=dm7hgFvU9Er3g88HvrWwHyCKWvSL3jMtzj79O2CYFHePtd4GzRTv5ECXWRNB7AYpYR
 AUFDLBYq/6QGRWBwXmu0hmcZMXgAojobnRHU60FR6CBAP+NQeoHmrqCJdlozYBbf265p
 gN3L5oY1J+fO4/r+q/LKGiwpJzNAbvw8pBG1QSQLwE5mPe04R2V3D3SROdo+lIg9Z9U+
 wybtYGXkPx8HuG/tCUxOlUexFVOPinM9eD9OrFQ/mBZNqYSODfNz5oa27ZN/MtbtAgqm
 XeDkiFWkHFTrDbf8A5ThkH7FMwR8BVE2nceGqbU5onI6a+0ToZGoht3NKiEaV1aieg7L
 Iu6A==
X-Gm-Message-State: AOAM530CmSJfOoKVfRzxCHYJzw/SOFZ/7a1p08MLjJHXWL6DzBNCq/ih
 PLcqLWYK/sNoS5a7c8yYF58=
X-Google-Smtp-Source: ABdhPJzdN21z/GugGt/PCV1b2jwA8YdA2VVf3bQs+ITDMpcq/FcfL3yglsVSyegGfeCgSTAQAobkgQ==
X-Received: by 2002:a17:902:9b84:b029:e5:ee87:6840 with SMTP id
 y4-20020a1709029b84b02900e5ee876840mr13424129plp.82.1615841046061; 
 Mon, 15 Mar 2021 13:44:06 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id e83sm14414215pfh.80.2021.03.15.13.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 13:44:05 -0700 (PDT)
Subject: Re: [PATCH net-next] net: dsa: mt7530: support MDB and bridge flag
 operations
To: Vladimir Oltean <olteanv@gmail.com>
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Russell King
 <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>
References: <20210315170940.2414854-1-dqfext@gmail.com>
 <892918f1-bee6-7603-b8e1-3efb93104f6f@gmail.com>
 <20210315200939.irwyiru6m62g4a7f@skbuf>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <84bb93da-cc3b-d2a5-dda8-a8fb973c3bae@gmail.com>
Date: Mon, 15 Mar 2021 13:44:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315200939.irwyiru6m62g4a7f@skbuf>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_204409_532841_98588FDA 
X-CRM114-Status: GOOD (  15.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 3/15/2021 1:09 PM, Vladimir Oltean wrote:
> On Mon, Mar 15, 2021 at 01:03:10PM -0700, Florian Fainelli wrote:
>>
>>
>> On 3/15/2021 10:09 AM, DENG Qingfang wrote:
>>> Support port MDB and bridge flag operations.
>>>
>>> As the hardware can manage multicast forwarding itself, offload_fwd_mark
>>> can be unconditionally set to true.
>>>
>>> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
>>> ---
>>> Changes since RFC:
>>>   Replaced BR_AUTO_MASK with BR_FLOOD | BR_LEARNING
>>>
>>>  drivers/net/dsa/mt7530.c | 124 +++++++++++++++++++++++++++++++++++++--
>>>  drivers/net/dsa/mt7530.h |   1 +
>>>  net/dsa/tag_mtk.c        |  14 +----
>>>  3 files changed, 122 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>>> index 2342d4528b4c..f765984330c9 100644
>>> --- a/drivers/net/dsa/mt7530.c
>>> +++ b/drivers/net/dsa/mt7530.c
>>> @@ -1000,8 +1000,9 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
>>>  	mt7530_write(priv, MT7530_PVC_P(port),
>>>  		     PORT_SPEC_TAG);
>>>  
>>> -	/* Unknown multicast frame forwarding to the cpu port */
>>> -	mt7530_rmw(priv, MT7530_MFC, UNM_FFP_MASK, UNM_FFP(BIT(port)));
>>> +	/* Disable flooding by default */
>>> +	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK,
>>> +		   BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) | UNU_FFP(BIT(port)));
>>
>> It's not clear to me why this is appropriate especially when the ports
>> operated in standalone mode, can you expand a bit more on this?
> 
> We are in the function called "mt753x_cpu_port_enable" here. It's ok to
> apply this config for the CPU port.

Because the user ports will flood unknown traffic and we have mediatek
tags enabled presumably, so all traffic is copied to the CPU port, OK.
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
