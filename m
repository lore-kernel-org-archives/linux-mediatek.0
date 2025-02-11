Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DD9C0219E
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2025 17:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/56BFQCA/x0+5Zxz4AvQg+9pW1+xObkEyrqUGNwQiI=; b=ZWPfxvoW3fFHGS
	axmCvPWKmFfP3qmuFGo2ZKBPdFr7xvn/d2hmEypoknwnYkRO11MtekgxCkacb+KcZz1hixJl8UHYh
	CR3dnR4jhYRlwCeqXmVuaobFv/6QNARCB5BOxMgsDEJpPzhC/R25WJIDo9PSro6aqqpuAqepac8MV
	MS7KIiVE71kdqxwxYIndsCxbABP0XvS8YijPGLsj4W07zooHyFCi2DLe0kc9TWmKr85H9BNayhQbY
	jiaxeVLrS0oxFygeZ7VseNZuvPuZQwZ9LeV589jxlCeulprQ/oVm0T4boNLMhuB3+yGgR0vSR1ezv
	yjAaAc9zBxw6oRuZkWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thtiL-00000004ch3-1qg2;
	Tue, 11 Feb 2025 17:06:25 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thtes-00000004c5t-28uF
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Feb 2025 17:02:51 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ab771575040so1118276166b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Feb 2025 09:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1739293369; x=1739898169; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/56BFQCA/x0+5Zxz4AvQg+9pW1+xObkEyrqUGNwQiI=;
        b=opnXNsUBJagtxrgbBLsVT0mkAQOEV5qkEXooAfxheSTZ3Be1FekM9ClfUaSbAvAWCJ
         dzBT/0PLlgiIdm9J2l8aX18cVPZtN1wfXiodGNlxHAhVoHY47/csoSXjDBFEH6LfftEy
         G07w7Oke36WwaBbCQXQziOOxEFLiF+xQW6Cw23qMUNvID2P2+vC+4iQKdMxD6Ebejzff
         xN7Zu/rZ+3sumuQej4cGemysQ2hF0EdQ+vLfttB+hA2La8Ci5Yab5tQCmtd3xBLqnaEk
         nNCPEQ6vrol2CFITIkObHnm2KlFm7BvueI5qmgTWpczj4tTXdTUQ98WF+jXsbiRqilF+
         v3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739293369; x=1739898169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b/56BFQCA/x0+5Zxz4AvQg+9pW1+xObkEyrqUGNwQiI=;
        b=cy74jI4E4UETrEIVmG1A94fYHs3v8n+6yHNPv35ZIuNpyVqyjJxwciE3iRNpPFanT/
         l4uVSwnppD2I4Ivwsl9/Wv2nTSeTHYHkldv+GrnxMZdRB6JGBnCr4YlVgIbF22v3zFlZ
         0J3YbIHb7D1lsGjiBBQRha3P+yPGEzzzq7zCJ5cIWEQJyw9q/ECQyNphskvoFJ0aKw0x
         FNgyuz6c5oItfobmEZvNUDLVoMuaremQd+83XIT/Rc6PHG9+F6fGyRwvTsub1xnzkN/E
         iuMWqKFamJyEKWiUZM5Q+XdXMocFBPJwScuRPS6vZdzvlN4Gmc/sCoJT356ysDLYeHib
         gXoA==
X-Forwarded-Encrypted: i=1; AJvYcCUm0e+ExJyNNoJzSJ3WKZCG7+CYbKpGwVXhpM3Rh4cys52JSQ4g386Z20UEjq1aN53ScSbZL6z1Rhpsk9h+9w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+8L1vErKzcFfYbj60UaZWcLByxrCB2T0g551J56oxcwqSWh1f
	RyNSf4rdk5hM9OsacYX0Ik2+HcCu26dVBu3vlXQYqQQAA0vW3lt4f5JTVZwmefk=
X-Gm-Gg: ASbGncsG6+/OIi5S4Y8Ms6+r75MsPC2uiUIBTpkiUIS1iQAf8r/DETZSnRM+Y2PtMWk
	nRHa0btAXOeezqNqM6lYBLgA4zy7q9pm3I+bSsUHZZlx82oYuXmFPlV3+K4SebPl5AuUKcK+RJh
	pf1dbnbrva8LZ43I0XrmF2IWNJ8yBk4/nPEmjOGpgfQevoERzDRWgz7qFF/A8G/PcnqxQN7Wjln
	odZACYiW/OYY4NfWi3t2OGjrPiPlbtaJBoNn5y3HcS/jXZbaLUVF9AG7vHm5K9vj4I9vEECNleX
	F3jfMAyrFfhXJRXocr+lAqB0RMF0cBR2CB7HlH3TvIIiefw=
X-Google-Smtp-Source: AGHT+IGAPbzjetBMyKn9xpkEx6mNiLaz6Iu+7FJStrC2CQYkHtGpuLCTUuKU+eMJA/ubyZG+xRvimw==
X-Received: by 2002:a17:907:7fac:b0:ab7:cd14:2472 with SMTP id a640c23a62f3a-ab7dafca27emr340636066b.23.1739293367291;
        Tue, 11 Feb 2025 09:02:47 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b4e96185sm543848166b.86.2025.02.11.09.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:02:46 -0800 (PST)
Message-ID: <2609939e-fce9-42ff-93ee-890598437f25@blackwall.org>
Date: Tue, 11 Feb 2025 19:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 05/14] bridge: Add filling forward path from
 port to port
To: Eric Woudstra <ericwouds@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
References: <20250209111034.241571-1-ericwouds@gmail.com>
 <20250209111034.241571-6-ericwouds@gmail.com>
 <20250211132832.aiy6ocvqppoqkd65@skbuf>
 <91d709aa-2414-4fb4-b3e1-94e0e330d33c@blackwall.org>
 <1aa60578-ba4c-458b-b020-cff59b119bdc@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <1aa60578-ba4c-458b-b020-cff59b119bdc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_090250_808794_C9352691 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Ivan Vecera <ivecera@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Joe Damato <jdamato@fastly.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Jiri Pirko <jiri@resnulli.us>, bridge@lists.linux.dev, Kuniyuki Iwashima <kuniyu@amazon.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lobakin <aleksander.lobakin@intel.com>, netfilter-devel@vger.kernel.org, Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2/11/25 18:35, Eric Woudstra wrote:
> 
> 
> On 2/11/25 5:00 PM, Nikolay Aleksandrov wrote:
>> On 2/11/25 15:28, Vladimir Oltean wrote:
>>> On Sun, Feb 09, 2025 at 12:10:25PM +0100, Eric Woudstra wrote:
>>>> @@ -1453,7 +1454,10 @@ void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
>>>>  	if (!br_opt_get(br, BROPT_VLAN_ENABLED))
>>>>  		return;
>>>>  
>>>> -	vg = br_vlan_group(br);
>>>> +	if (p)
>>>> +		vg = nbp_vlan_group(p);
>>>> +	else
>>>> +		vg = br_vlan_group(br);
>>>>  
>>>>  	if (idx >= 0 &&
>>>>  	    ctx->vlan[idx].proto == br->vlan_proto) {
>>>
>>> I think the original usage of br_vlan_group() here was incorrect, and so
>>> is the new usage of nbp_vlan_group(). They should be br_vlan_group_rcu()
>>> and nbp_vlan_group_rcu().
>>>
>>
>> Oops, right. Nice catch!
>>
> 
> Hi Nikolay,
> 
> I gather that I can include your Acked-by also in the corrected patch.
> 

Yes, thanks.


