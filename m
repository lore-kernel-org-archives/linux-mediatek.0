Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C1C606A335
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 20:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZDIgU0L/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NzfB+NX4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0oLkgc4LESe1RA5rsRbAFuQhuNZ8h5rAeMBrxjfEeoU=; b=ZDIgU0L//Z+mXX
	Kpd4eO4SGalAYXWEVmcWhi+Rc2XXOjq3vQxx/WOpPjxUDzzc9rcyyBizxJNTNPIHibsaItCzG5DIO
	qYRIovaEfa7kswDPJLb4lfLNQSQubhwe7BfIY72XsnHUuVJBqTk0yTuk1Gqb6gwcg96yj/EiYaSUs
	iMD2ycJFPFHSM+g9JUs16KDZMNFkt//9jYY2AVFzJNPn0bm7NAox/TanhyT+mE0D00vXWZKlbhesY
	sd/JD4DgL6NByCh+zcfr4McwUFUVezuvOwxsSQJW9vyWpCbIz9p0ERoKvSxNYSl7T8P7H/9h+5LbK
	G+Mu2JKmXDB42EVhIdHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxUm-0000000EKiD-1Vg4;
	Fri, 13 Nov 2026 20:03:36 +0000
Received: from mail-oo2-x09.google.com ([2607:f8b0:4864:31::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxUi-0000000EKgy-3sQH
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 20:03:35 +0000
Received: by mail-oo2-x09.google.com with SMTP id 006d021491bc7-717028b412bso511890eaf.1
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 12:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794600212; x=1795205012; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oLkgc4LESe1RA5rsRbAFuQhuNZ8h5rAeMBrxjfEeoU=;
        b=NzfB+NX4RYjblCMOdzAduQSPk5x9i+JEPFC+HtOEpwqTLvN5dKiWv46tzXpJyC0lnd
         3Gf8/pyv2gEgpD3MygdBeAE4KqpAQbpCk1bn9d4ejeff0J+u65OiQmXgiencZ1gEYH6v
         munDx4a5YkWU2seErH54w65+2z/65cmeivCtaNkbra69fxq/IJViRD/eMg0HZzm0WwoS
         9yx3QjnQwoTAdtZG6yHiQ9u3ldQPp6UjRkn5qO1BfQFcXobqAnH4R0L+zXmSp6PwKijv
         3Lr3rbazI85xEkwAAIFMGfjzQ4wednipEGWRrEbSS8KGELkzGugUgcEzPHgj2D1sfkFp
         DumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600212; x=1795205012;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oLkgc4LESe1RA5rsRbAFuQhuNZ8h5rAeMBrxjfEeoU=;
        b=1HkwrSLboYi5JI2FXzGF2hyStTCORFq6F4+NMQZRnNZJYYllT+zW9tC3Ebg2ZJjA2p
         XplCRmFiBt7M2UJsNvleZ+WbYwQKL7+E4olDpAkrM2gutsWxZy4q3hOk5899K5NH2n9F
         KP2s+JKYHzOOKo+D4tBvYYf/9wUSk96pfvIW+3kZjzEM9SyH9/tiV81e8Vyl+OYx4j7K
         K3TPHTgqHO8q/UB8M+IW+pWpmKcakL+cyL0qiLmfiEcWwiga7OTd76k9rT98Rs3X9qob
         A/gIVynjb/iu8uObQlO35gIxMJ7bKdkIV82tXpxvPgfTb1pc8+gqlnB5/zkBb/4Cr9cT
         JwWA==
X-Forwarded-Encrypted: i=1; AL+hErH+2ZWb3OleVOLhMNnfwsuF2HQF9O8Z2nbaoa8Zgg+Dm/AkhNbjVDKf6VmmhcNJuyDhx87gxXA1Fqj6UYhNBQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z91i3T7w8RsBn2LR5L+kH03YAC6tTkSUlConoxLbXe7baKVAdPu
	MSXeJ6EW/6nbxow5md/lk+jibmAisArcxoRSSX19FfrFueQ1XzG9Mi0u
X-Gm-Gg: AYBFou0Zll93RaEdXnm5RGkeaJm0ALrMKAY6UuUE5OOf+N1SHGVN3sqvYXy+wKluB8F
	+oQI0gqvYizItrWRhhXoXLrqyEjg3PqyClXAFOPW2DOYFpi+o2OrK+wFT2+q08PWoB95k3whv37
	iubElATMB8/GbzwBn6B6ZObI8hmK9UnDtsnumPSJQpRfeEso9+IE1HOpIQU2FDUyd+oJ6/DYjE5
	nNYqEQWVo6cNjfDDwh6CF2J6UYDR8VJxkTk1nFXeoQ6qEjLVdDIqj1y/KWq6UUjEu1XaipEStC+
	Vur3RpP5GTOvn/qKWi4KNKAE+9WUSY7uKZwBuf+qqAshF9O+ZIi3aVZeFahVcqQm8AHFV0m2PWY
	WFZK5YfQgdZtKo1GIJw9wXwMxBTUXd3ApWailVccgPsvbjzmsO7jh75o7mVFE3Fvzdv8+OmriL8
	SHtSFN2K374Luu2ijLQWcsKq0u7Y+/IR+xyXyBS2eq1N0/vZDQw3q0ZKrmuBvinihk44h6OUgbD
	Xqi1qTl4Y2r+Hao6KkuDIRGpGhVdw9QfbidRUeD7D5miEwuULeR1vaWFSGCOATMYJ9oqn7uWGLq
	+lKpDMVGbrGIDPf/CaFjz81xHme5r1h9v3fYJp56WCsh2dF5vkr5L2pw54JPezMg/YHDKjMXLUY
	kfyK94Y6HUYgYfI3xjVvwss5DBIZ9YJo1AoVraF1L
X-Received: by 2002:a05:6820:f025:b0:71a:ce4f:4a86 with SMTP id 006d021491bc7-71ace4f7613mr375277eaf.56.1794600211873;
        Fri, 13 Nov 2026 12:03:31 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4335912sm2485972eaf.13.2026.11.13.12.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 12:03:31 -0800 (PST)
Message-ID: <a6bc9228-8e81-4f16-bd26-2d9c72e9998b@gmail.com>
Date: Fri, 13 Nov 2026 14:03:29 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rtc: mt6397: provide the 32 kHz output as a clock
To: Lee Jones <lee@kernel.org>
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pm@vger.kernel.org,
 mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com>
 <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-2-9758f38d7053@gmail.com>
 <20261113185047.GH6323@joneslee-macbookpro.roam.internal>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261113185047.GH6323@joneslee-macbookpro.roam.internal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_120333_870071_8D25599A 
X-CRM114-Status: GOOD (  10.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 12:50 PM, Lee Jones wrote:
> On Sun, 01 Nov 2026, Ryan Brue wrote:
>
>>   
>>   struct mtk_rtc_data {
>>   	u32                     wrtgr;
>> +	u32                     con;
> These are terrible variable names.
>
> The nomenclature should be self-describing.

Hi Lee, two things:

1. I have a v2 out [1] from early November that fixed a null pointer 
dereference that Sashiko found. I can spin a v3 or resend v2 depending 
on the response to (2).

2. would you like me to update wrtgr as well? I can add a patch to a v3 
that changes that name in addition to con.

[1] 
https://lore.kernel.org/all/20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com/

Thanks for the review,
Ryan Brue

