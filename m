Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D14FD1CDAB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 07:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPBvFd0csLQUXJSE14s/so+mpDpWxuoXRgoonDdlEEs=; b=KPUPFeZZrIYbJY
	S2Lu76evNuHH+2MQdrh0WeVa5ke0jb9BXrRfEnPBWM/ZeBhNNkw+ATxJMoh+1S1KIt913IRQ8OJqd
	N+Mkk+3i5JulFl8ZRycWF7na3mwsR7n7nxOT5uqf4zEnacgaMgmuCuL/+WAkzLP6Ms9fnHrKMjr1n
	ozm4SjiDedbOxrvpunL69/a2BQ1bru4HC1Tl5HHEeWW4ZRVBCq1Ue3xAd/bmYoS5JuJuiaEpEwVnZ
	r1lhAV59UiTxiUIVsps3NxkCTLx/aIS0iw4DZqNKKtXHInPySQ8rA9ruNQs7BVDpIOQEd0Nq3HRCC
	wEZ+Xw/+4zTEhuZLea9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t39Jr-00000009yTE-35F0;
	Tue, 22 Oct 2024 07:28:43 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t39Gx-00000009xtY-422f;
	Tue, 22 Oct 2024 07:25:45 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a9a0cee600aso668843266b.1;
        Tue, 22 Oct 2024 00:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729581941; x=1730186741; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RPBvFd0csLQUXJSE14s/so+mpDpWxuoXRgoonDdlEEs=;
        b=X9JeXlLeDua1YhvhroXqqMac0HrZBxLgOUmyLgnFj1NF6i3ZS7Ad5ru9iMIwWiu7X0
         RhmIRtLgk2F7CwHsSo/iHKfRxpvjpYrHn9/ERw3MiJZzgWRH4tzZD5RAF5atYZJfqFPp
         4/22G3qKH9t1XNEZ0RMDlqkmAtwKLuqT67teKx2R8z5AF678EWLwtDVE1aE5JvjLc7qe
         iWEFtTQou5q88qMEH/fqkRMgv9DqHztJ4A1lpels74ydsQd1ETI/PNh9tu5gOqAnXP9/
         q91UsxQBUTOQcpXXaJULCHJYDovLKq4L87PuOcvHP8eZXE3yPY/KYBwuDJ2+Yk/uU5+6
         JxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729581941; x=1730186741;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RPBvFd0csLQUXJSE14s/so+mpDpWxuoXRgoonDdlEEs=;
        b=a1hUtU/SsHNlxzKa/Eipi6zxRCL2XEhs5qtJcloF+0e8gWx+XVdPSnZ3MtAr7OGqy2
         H64JtK52Mo0GVFsEW36qlppXoqwDWaHdEkZF3TKZZlKQ/3L9SPdNuDsrh7FVRx7OUxLu
         rcED2tGzvP8vvdU5GJRNXqfXbDdXjRjkmt/2qDZoyfhzd2+W3bwU80MLFBY4W/aHgkNb
         DOMViT88tBXtPckQeMkQ5VDxTxLiqAMWhz0M8gq717RSmtIJ5q7efNLjoDflkhIOoO3p
         zdyyaEU3ynlMmSKxW6JjUymFyURhAI2j+EaEAytWmcLfIAJ04rnEiEdqKjQQ473h4zeu
         fyUw==
X-Forwarded-Encrypted: i=1; AJvYcCWW1eIZR9Dl5o3qTpjy9uokck7G/x0HYZPtUF5z1Za8EwKjsqa1tgP+k3q3XhTH1g3aKwJRHr1KNX3qSahtExQ=@lists.infradead.org, AJvYcCX+vwkRCWBemV0UZ/ZhS0h5yTY28abX9GwU1poLssZF4Hb0MGfBHUdyX8vHUUGj3M/CtoUPhwgQaoCdqfHd83Eo@lists.infradead.org
X-Gm-Message-State: AOJu0YwPBynSbdgnop7jvyZEW7ZyE7vEtxKcc76UR677x3/4gTBOeA1G
	a1/86DfHtjQMTVfEmWBbAmHJamncOc/P4C3V81yZkfedTzRFEoaz
X-Google-Smtp-Source: AGHT+IFgOViCVHZGVqc02ueX63hUlO23JFELymqv7xnRaAD5bkA+z0a7m5o4etcnJkf9oA9PvbTbqg==
X-Received: by 2002:a17:906:730d:b0:a99:e850:deb3 with SMTP id a640c23a62f3a-a9aace512d4mr147614666b.18.1729581940590;
        Tue, 22 Oct 2024 00:25:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91572575sm299075866b.156.2024.10.22.00.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 00:25:40 -0700 (PDT)
Message-ID: <540a623c-3e7c-40a7-ae77-6833e81fa11e@gmail.com>
Date: Tue, 22 Oct 2024 09:25:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next 11/12] bridge:
 br_vlan_fill_forward_path_mode no _UNTAG_HW for dsa
To: Vladimir Oltean <olteanv@gmail.com>
References: <20241013185509.4430-1-ericwouds@gmail.com>
 <20241013185509.4430-12-ericwouds@gmail.com>
 <281cce27-c832-41c8-87d0-fbac05b8e802@blackwall.org>
 <6209405e-7100-43f9-b415-3be8fbcc6352@blackwall.org>
 <20241014144613.mkc62dvfzp3vr7rj@skbuf>
 <b919a6b1-1c07-4fc9-b3dc-a7ac2f3645bf@gmail.com>
 <785f6b7a-1de1-46fe-aa6f-9b20feee5973@gmail.com>
 <20241021134726.dzfz5uu2peyin3kk@skbuf>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <20241021134726.dzfz5uu2peyin3kk@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_002544_078830_B8C63AB9 
X-CRM114-Status: GOOD (  34.22  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Nikolay Aleksandrov <razor@blackwall.org>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pablo Neira Ayuso <pablo@netfilter.org>, Jiri Pirko <jiri@resnulli.us>, bridge@lists.linux.dev, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/21/24 3:47 PM, Vladimir Oltean wrote:
> On Sun, Oct 20, 2024 at 11:23:18AM +0200, Eric Woudstra wrote:
>> So after doing some more reading, at creation of the code using
>> BR_VLFLAG_ADDED_BY_SWITCHDEV would have been without problems.
>>
>> After the switchdev was altered so that objects from foreign devices can
>> be added, it is problematic in br_vlan_fill_forward_path_mode(). I have
>> tested and indeed any foreign device does have this problem.
>>
>> So we need a way to distinguish in br_vlan_fill_forward_path_mode()
>> whether or not we are dealing with a (dsa) foreign device on the switchdev.
>>
>> I have come up with something, but this is most likely to crude to be
>> accepted, but for the sake of 'rfc' discussing it may lead to a proper
>> solution. So what does work is the following patch, so that
>> netif_has_dsa_foreign_vlan() can be used inside
>> br_vlan_fill_forward_path_mode().
>>
>> Any suggestions on how this could be implemented properly would be
>> greatly appreciated.


> I don't know nearly enough about the netfilter flowtable to even
> understand exactly the problem you're describing and are trying to solve.
> I've started to read up on things, but plenty of concepts are new and

Another way of shortly describing it, considering the software fastpath,
only there it is a problem:

Same case #1:
When looking at the ingress hook of the fastpath for a bridged
switchdev-port (non-dsa) with PVID set, the existing code is written so
that the flowtuple needs to match the packet INcluding the PVID.

Same case #2:
When considering the ingress hook of the fastpath of a bridged device
that is not part of a switchdev at all and there is no dsa on the bridge
(so it is not a foreign device), the existing code is written so that
the flowtuple needs to match the packet EXcluding the PVID.

When looking at the diagram of this patch, wlan1 would stand for any
foreign device. Because of the use of BR_VLFLAG_ADDED_BY_SWITCHDEV, case
#1 is applied, instead of case #2.

> I'm mixing this with plenty of other activities. If you could share some
> commands to build a test setup so I could form my own independent
> opinion of what is going on, it would be great as it would speed up that
> process.

I've only setup the bridged part with systemd-networkd. When trying to
re-create, it will only happen if the total action of the bridge,
towards the foreign port, is:

ingress + egress = untagging

So in the forward-fastpath, tagging in the forward path is done by a
vlan-device and untagging is done in the forward path of the bridge.

> With respect to the patch you've posted, it doesn't look exactly great.

Agreed. I was experimenting now with having br_switchdev_port_vlan_add()
first to try it only for non-foreign ports. If not successful, then try
it with foreign ports. This way the calling function will know if the
port is a foreign port. Therefore, no need for the switchdev driver to
communicate back to upper layers.

> One would need to make a thorough analysis of the bridge's use of
> BR_VLFLAG_ADDED_BY_SWITCHDEV, of whether it still makes sense in today's
> world where br_switchdev_vlan_replay() is a thing (a VLAN that used to
> not be "added by switchdev" can become "added by switchdev" after a
> replay, but this flag will remain incorrectly unset), of whether VLANs on
> foreign DSA interfaces should even have this flag set, and on whether
> your flowtable forwarding path patches are conceptually using it correctly.
> There's a lot to think about, and if somebody doesn't have the big picture,
> I'm worried that a wrong decision will be taken.

The entire usage BR_VLFLAG_ADDED_BY_SWITCHDEV does need a careful review.

I also realize my patch-set needs to do more with the switchdev and vlan
combination, then it does now. So for now I will leave it as RFC, as it
will not work properly with switchdevs other the dsa.

