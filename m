Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D842C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 11:37:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60D856102A
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 11:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 60D856102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L9bzvuHloF4k/WLOCR7dPiTLJZH/E3rsSoGqw10gUq0=; b=DZJd7RhT9cdYWW
	wRSuUM6URUGeAZ3Esj1nXS3Zbfd4TOgNLx0jP4rQ/mfoqfp/8lxn7idpB1KTZnW3FuezpmCMS9MpV
	gmJcb23xCa7Mtc1WZrI1T461An2QRYHeF32oEssFGK0ounk4dIPc+S8mVI4KPg2az9pDx6S9tCDFn
	tguqezxXSZrxmKLLJtU0jKqbMQrI7OBB7M0/+xxsicRMCopySSJ0G/OXlPX8Pox3rJ4FfxtEfslPZ
	uNqPCYMilmj580OnXsY75f+S3nps6ar4qQxgYMC3UhH2mW/FxuOSDk1kXX5H81khF9zIW//0q5JWX
	Ik01JkFKEMQam8wSMzaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJDhS-009xW7-UU; Thu, 26 Aug 2021 11:37:38 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJDhC-009xSw-FD; Thu, 26 Aug 2021 11:37:25 +0000
Received: by mail-wr1-x42e.google.com with SMTP id i6so4569474wrv.2;
 Thu, 26 Aug 2021 04:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PVy3x/gpaGlyIL2qP4pHOSUUYbRwv09MHpiWHWZWURQ=;
 b=PLjSL3fyyywCH92vqbI2tusTBrwiymMrmM/Wws2eEV6jYdx9o1SlJPyKZkzLple30O
 WOh7BIMBIb2LhE8coiVeCYE/ybKLAAiROPgq0YYCiQ5YUal/sKNUJNhMQs3WxgbRCEky
 1fYQZ1ArsEURbzYuWdTgTEMLWoP1zWxRITjXDTpQBW/RL0uzMUB4npwBWRRiZV+3ezh2
 hZI6u+5Wbftg/iok+6WHTh8v92YmDYWai3D20jSVrEgRTP9ibJ21mFy3fKaA55fpZ6Vs
 Iw5nZwYWUyZfq3iJePLLBd+TXMoBRYo3/IpfqMt0y1tppd4TN9XwNxkBYybeWBrsbxT+
 OFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PVy3x/gpaGlyIL2qP4pHOSUUYbRwv09MHpiWHWZWURQ=;
 b=Lv6wG1YOjxsPDUu6vfunMCciCnF/eWM5J4PR6rwkz58NXjmapi7CMjSwM9TzSy/7pB
 I/2BgRGwgtpS7e8P+5LOc6tg1t2ho3E07sCkvWxJUZaunP8/5zjK3D4ayI9Rryb4ODbA
 4WY7mKK+KWKzZAbjbfqnShAul0S2UKV7mKpY1IL2zDNtAFKppcMwn1ac13hf/XjXQ33e
 XO6yU4L5/z2b++MZYS0fWHaEcHk9Lv0FLSe13jD4nOhfhVTTgM0WHSfPeI/sMHyhQoQl
 PpKxcNCqIJ7waxj4UU0fOdnkLKIooj0u5ZRa0INRrEokf8oaESbl7GR5hxXyu1OHrc58
 0AmQ==
X-Gm-Message-State: AOAM531hNuSJSPivviliCIkF/Vyoz2goOoWWDmXHFyFdLPbeAlXADg9I
 4A8Eoo571gIn0ef101kO/2b/P0LCyDSc+g==
X-Google-Smtp-Source: ABdhPJyiPAPPK/QKKtI37MIt74tUHsI2gmeuEdCkJGlWux9B5TiRR6goXs66qq1aoMfSta4Xj3Knyg==
X-Received: by 2002:adf:eacb:: with SMTP id o11mr3441381wrn.418.1629977840667; 
 Thu, 26 Aug 2021 04:37:20 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8192:e700:d55b:a197:684c:2cfe?
 (2a01cb058192e700d55ba197684c2cfe.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8192:e700:d55b:a197:684c:2cfe])
 by smtp.gmail.com with UTF8SMTPSA id l12sm2429237wms.24.2021.08.26.04.37.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 04:37:20 -0700 (PDT)
Message-ID: <109fb944-e310-4cdd-82e8-367217bfd2f2@gmail.com>
Date: Thu, 26 Aug 2021 13:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.2
Subject: Re: [RFC net-next 2/2] net: dsa: tag_mtk: handle VLAN tag insertion
 on TX
Content-Language: en-US
To: DENG Qingfang <dqfext@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210825083832.2425886-1-dqfext@gmail.com>
 <20210825083832.2425886-3-dqfext@gmail.com>
 <20210826000349.q3s5gjuworxtbcna@skbuf>
 <20210826052956.3101243-1-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20210826052956.3101243-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_043722_548406_B0F5A65F 
X-CRM114-Status: GOOD (  15.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 8/26/2021 7:29 AM, DENG Qingfang wrote:
> On Thu, Aug 26, 2021 at 03:03:49AM +0300, Vladimir Oltean wrote:
>>
>> You cannot just remove the old code. Only things like 8021q uppers will
>> send packets with the VLAN in the hwaccel area.
>>
>> If you have an application that puts the VLAN in the actual AF_PACKET
>> payload, like:
>>
>> https://github.com/vladimiroltean/tsn-scripts/blob/master/isochron/send.c
>>
>> then you need to handle the VLAN being in the skb payload.
> 
> I've actually tested this (only apply patch 2 without .features) and it
> still worked.

OK and this works because now you always push a MTK_HDR_LEN tag which 
you were not doing before for VLAN-tagged frames, right?

You don't seem to be clearing mtk_tag[2] and mtk_tag[3] anymore, is that 
intended?

> 
> The comment says the VLAN tag need to be combined with the special tag in
> order to perform VLAN table lookup, so we can set its destination port
> vector to all zeroes and the switch will forward it like a data frame
> (TX forward offload), but as we allow multiple bridges which are either
> VLAN-unaware or VLAN-aware with the same VID, there is no way to determine
> the destination bridge unless we maintain some VLAN translation mapping.

There is no "bridge" on the other side from the CPU port's perspective 
on egress, only physical ports, so how does that comment apply?
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
