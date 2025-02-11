Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2688C0219B
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Feb 2025 16:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hI/ECcJmQ5+lRsmCQ33ubWCT5i7ZlE5HoQwEXVHTSj0=; b=UalU87TIJ3XuA+
	LiIIXeNpDayFKZjduXgynjUgBovdgIUXV77IRmoAc+7XQS9cqYv86W5jFE6Wt8tCN4SFFPSVZS96K
	UKX0ozzQTsl+EOo6GJy3uxtrjeetVkZ3pGE9aLAleD4qyvJv0MwdJrUbK7rIWTuy2pCF0Zyb2ujOy
	EeNMz5lk+iX4TasZzKdd83fXsxMa9c3KozRTAt5onMf/P6vYd2vn/ILWIfLxEMqObDej6JbaFpGOG
	qxuk6GfuZsMzfa2ZNXPoRopOWiuA66s4If9lcN0VxGGy7HJkTkKIrv711NFyxUsRK7+g6iHwObdy2
	pxVACu+uyQLh3Q/c7y1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thshm-00000004PCW-3W1J;
	Tue, 11 Feb 2025 16:01:46 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsgE-00000004Olv-2zl1
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Feb 2025 16:00:11 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ab7b7250256so411123666b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Feb 2025 08:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1739289608; x=1739894408; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hI/ECcJmQ5+lRsmCQ33ubWCT5i7ZlE5HoQwEXVHTSj0=;
        b=ybfaNS7bvGLf/aCqoDlgNoqGt8N0xJfdWM2JOr9MOSJKT6z+gFc+UeiDnXq9C5EBr4
         CHlYEz0ldNpLk8mq9cpN2LIdMB9K9D+6vq4Me3kqX6K8aES6kC1zG7LTyp2vWYgYONi5
         t+2OgYhUtyA851RWE3F5JXUpHpYnFfoNDUTJFJ5+BFy0gp8i2sQ8/13onflgS7ud1XhB
         mjfSctRr+gD+nO91GxqNEvMPDzt8YhpFAYgv7hyfJxYK4WJUjF1fp+iMb62aVqFAWMpg
         WVJYjsIkcKaO7uSCpdwTzGXbVDvufxVJfjIwi3ubb7XXAUfixnnQseQ2Gduw9WmuxIvd
         cacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739289608; x=1739894408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hI/ECcJmQ5+lRsmCQ33ubWCT5i7ZlE5HoQwEXVHTSj0=;
        b=EPwIsONw9KVWFcWkneCpoAW2QaXnrEucYGeJoGwz62kPSulvlfcTDzU/Phqqj7e95S
         K2CgLacFRcmtlfagrB06o620WCasZ/GIl8Yl6XQWIixsDMvLF6oQuEM0/rtfY91W9zrf
         /Jep5FLto/NA9WAsEfXAt1jKCkLB1Njaw5nWZbyVCHttvWQ2RrvXQlDnkpIx/tjsgDEU
         j2RsCe5cyCaOATBztj6Jj4DdCPCr9XfTnvsD8RwPWqQOHJPpH6bOQ2HfkkCNIrNC9C7B
         RzJKJqpUUGgr9TB1aP0Ojf5hZDhZxJ5HSI7AKzwPviYNsPB9Fuk0lu3FrckjoJVPFJye
         /2gg==
X-Forwarded-Encrypted: i=1; AJvYcCWQavHSSqJTLiWNGLc28NkVidvpad0J2TTQvUudAt5ZxCryjzDje2zTJGKsKXYRZ1tZx1/bujcLJU1pSHmV4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YycH2KEKseae9AU9+BuKuK8t115kubVDOh0NnTLzcyGIvNTcgX7
	N/+Gm8QUCyMYNix4F0ecewp2EqD62ZsBddBhpEbPUdAbgfkQBNLbh5I9F2P+NBA=
X-Gm-Gg: ASbGncuHh5paXXWLkU+NStE+Fo4SnIYTXO8NCXrnR4aym2sy7ElR+KdtzZ4caWdX4pv
	YTJAKZ+P62/8xfY6JbUTfaLokwZeEHf7lQ2IHGglkqwMXuCbOomr9atqXwks/bCtBOZNd7GACzr
	RWePjU+10IKoqiXvjEjTXWJtiONIdQvf0wKg5P3D/6sSiLZuByGrsQFrurHRQDqmc8Io+Rvl8dA
	FqdwDVRm8p2JlYJrXjqj104dmCgidzAUhTnB321hnTHRQuD18s5mQJpt3/MiwpcPFpJ5ROHiSEM
	NpegeklvycbzcI0ujLVG4y9CCJvVUQBtGN3BUzcy029c/sU=
X-Google-Smtp-Source: AGHT+IE7ksSku6fs3EFiOJ7qMjT+Xj86y9WzUfaIKnMbJB/roCniH1bXiqumQdCG0sjm3B/UGhh56Q==
X-Received: by 2002:a17:907:2d24:b0:ab2:ea29:b6 with SMTP id a640c23a62f3a-ab7f01cc9bemr17039766b.35.1739289608146;
        Tue, 11 Feb 2025 08:00:08 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7ce2e91e9sm307325466b.117.2025.02.11.08.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 08:00:07 -0800 (PST)
Message-ID: <91d709aa-2414-4fb4-b3e1-94e0e330d33c@blackwall.org>
Date: Tue, 11 Feb 2025 18:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 05/14] bridge: Add filling forward path from
 port to port
To: Vladimir Oltean <olteanv@gmail.com>, Eric Woudstra <ericwouds@gmail.com>
References: <20250209111034.241571-1-ericwouds@gmail.com>
 <20250209111034.241571-6-ericwouds@gmail.com>
 <20250211132832.aiy6ocvqppoqkd65@skbuf>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250211132832.aiy6ocvqppoqkd65@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_080010_809985_D1DC58C4 
X-CRM114-Status: GOOD (  11.73  )
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

On 2/11/25 15:28, Vladimir Oltean wrote:
> On Sun, Feb 09, 2025 at 12:10:25PM +0100, Eric Woudstra wrote:
>> @@ -1453,7 +1454,10 @@ void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
>>  	if (!br_opt_get(br, BROPT_VLAN_ENABLED))
>>  		return;
>>  
>> -	vg = br_vlan_group(br);
>> +	if (p)
>> +		vg = nbp_vlan_group(p);
>> +	else
>> +		vg = br_vlan_group(br);
>>  
>>  	if (idx >= 0 &&
>>  	    ctx->vlan[idx].proto == br->vlan_proto) {
> 
> I think the original usage of br_vlan_group() here was incorrect, and so
> is the new usage of nbp_vlan_group(). They should be br_vlan_group_rcu()
> and nbp_vlan_group_rcu().
> 

Oops, right. Nice catch!


