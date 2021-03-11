Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30896C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 03:20:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0D8864FA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 03:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0D8864FA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v4vD2g+VTgFt3bSzu1zFgKW2RTR/kth7JvLzXQspczg=; b=jGJ5+iDBnYbFqNfZakkGrhatZ
	x1+vz3+r3lpT9h7HRa75ixOFl9WS4r7SNdqbpNDJfbYwS9asVU8jIou5nn+nSO6ULQ5cgiNBfZC78
	2/fKxDF6wNQFdxfABLPZegPkkA4ljJot8MNDOBxkJYZrtKK0GEjkStD3p7DkYfa9fHhlGmJXS1C+P
	kWk7v9EBmlZ46SDNAVlWOEXSSpJbwm3RWThzvVTnvBhYcndur88ysRKdbHfm5UP4uoe/l/IQHUaky
	pZMtT37HxVyLfGsaG/2hLxkgGWTvJsVgCRlwdZao8fjWrxoQ5QMsejsQIprynMsFVnAWy2w0eoLl5
	CIrE8FEqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKBsN-008I74-8n; Thu, 11 Mar 2021 03:20:39 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKBsJ-008I6W-Sv; Thu, 11 Mar 2021 03:20:38 +0000
Received: by mail-pf1-x42e.google.com with SMTP id q204so13459590pfq.10;
 Wed, 10 Mar 2021 19:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jSq/VmwagzBOBa03hMY+8so/zoyaXeG8kRRLRJzJ8nk=;
 b=uumTrVJ45hnIy/cf95GpU7MA5pyBCfjmEDmJpYejNC0Z1j9cKwl0AbhpHoX5XjqV7b
 JTZLciKAgw5DEXkHPOBcXIhjouosdT8l7iPBbAdKmHDw8fANKTRdaQR3GgS4yMI7mEK1
 F7L4rgqIfm1IT4N0bwFMtsx1r9VJcDfkHdlqZqbgdg6FRtQ4J6qHWt49TlhTb/v/RSFT
 7qk/VgA6YoKF4HPN9+pkgCd1ACT+WnQTcIfszMpt4kKDkV2qgS5CTBiII/UONmd2l7lb
 mmA6ScrjQbpyW/N+ppXWF0CV9UH7I2VJ6Rsdb2WilRbWRU3madrg1yA/YArANlu0BjIy
 c/Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jSq/VmwagzBOBa03hMY+8so/zoyaXeG8kRRLRJzJ8nk=;
 b=I9a6P1YxTNr1qtkRokb6nUwgdgJmLoh5RvU46wfU9a5tDTN9bcpFerd52xf8ckIoyv
 HumrhXD19xpGnpUknHBWFZkS3yUC5Fiy7XCmYm2QJS/HUe3Rc1w30nBDF6V8IWi/Mffc
 h3SPmPBXdAPD64/pqL8GVV8ylPRRTVHpPxZmhiwwYTGvg9zP1IkP8bC3SyrjVRbugJUY
 b8vf9+FdM0o74i8TbYhoGzQRiinkSg/UHRzCK+R7sQpBG3hAPf+berC+gOSLMzgiLbXm
 wGxny4T5Li2yMcNr5Q71Z4LtZXbXlWUhFwIE1FY1jSA6Fzn8mNiP8e+3jrKdz1ImIsFk
 U+eg==
X-Gm-Message-State: AOAM5314534Qmc4FDqxMju3QkoOpygeAs+dA3QgyfrtbFzh+036/za6w
 vnVZ6PToS4RKqiBexXbOScE=
X-Google-Smtp-Source: ABdhPJxgQK9RkpzDwxLk/UFqgLqSvjr0yAQt+fkwlG4zBDNpJDIK/lM6YvMZvupw0+OuWnP1TW56sg==
X-Received: by 2002:a62:3085:0:b029:1ec:a570:682c with SMTP id
 w127-20020a6230850000b02901eca570682cmr5774827pfw.28.1615432833737; 
 Wed, 10 Mar 2021 19:20:33 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id a15sm670517pju.34.2021.03.10.19.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 19:20:33 -0800 (PST)
Subject: Re: [PATCH 3/3] net: dsa: mt7530: setup core clock even in TRGMII mode
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Russell King
 <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210310211420.649985-1-ilya.lipnitskiy@gmail.com>
 <20210310211420.649985-3-ilya.lipnitskiy@gmail.com>
 <20210310231026.lhxakeldngkr7prm@skbuf>
 <CALCv0x0FKVKpVtKsxkq5BwzrSP2SnuYUaK38RHjd_zgoBCpdeA@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <169c64ac-c200-fa5d-6563-3be5263d0b99@gmail.com>
Date: Wed, 10 Mar 2021 19:20:29 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CALCv0x0FKVKpVtKsxkq5BwzrSP2SnuYUaK38RHjd_zgoBCpdeA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_032036_024482_3C2FDCA8 
X-CRM114-Status: GOOD (  18.83  )
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



On 3/10/2021 7:17 PM, Ilya Lipnitskiy wrote:
> Hi Vladimir,
> 
> On Wed, Mar 10, 2021 at 3:10 PM Vladimir Oltean <olteanv@gmail.com> wrote:
>>
>> Hello Ilya,
>>
>> On Wed, Mar 10, 2021 at 01:14:20PM -0800, Ilya Lipnitskiy wrote:
>>> 3f9ef7785a9c ("MIPS: ralink: manage low reset lines") made it so mt7530
>>> actually resets the switch on platforms such as mt7621 (where bit 2 is
>>> the reset line for the switch). That exposed an issue where the switch
>>> would not function properly in TRGMII mode after a reset.
>>>
>>> Reconfigure core clock in TRGMII mode to fix the issue.
>>>
>>> Also, disable both core and TRGMII Tx clocks prior to reconfiguring.
>>> Previously, only the core clock was disabled, but not TRGMII Tx clock.
>>>
>>> Tested on Ubiquity ER-X (MT7621) with TRGMII mode enabled.
>>>
>>> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
>>> ---
>>
>> For the networking subsystem there are two git trees, "net" for bugfixes
>> and "net-next" for new features, and we specify the target tree using
>> git send-email --subject-prefix="PATCH net-next".
>>
>> I assume you would like the v5.12 kernel to actually be functional on
>> the Ubiquiti ER-X switch, so I would recommend keeping this patch
>> minimal and splitting it out from the current series, and targeting it
>> towards the "net" tree, which will eventually get merged into one of the
>> v5.12 rc's and then into the final version. The other patches won't go
>> into v5.12 but into v5.13, hence the "next" name.
> I thought I figured it out - now I'm confused. Can you explain why
> https://patchwork.kernel.org/project/netdevbpf/patch/20210311012108.7190-1-ilya.lipnitskiy@gmail.com/
> is marked as supeseded?

That looks like a mistake on the maintainer side, I do not believe that
patch should be Superseded since you just submitted it.
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
