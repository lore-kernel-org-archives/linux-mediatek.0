Return-Path: <SRS0=mrrP=63=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080AFC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 16:22:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A1D92054F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 16:22:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DE3ohJ0h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+qtKFp0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A1D92054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzDVdxppF1B3aOGJb+k/rwjVmS7UvEE8PwbychYsLSA=; b=DE3ohJ0hnryiUC
	tPGHF7z91b4G5NSIKrYNO5WiawZybg17pm18RvVVhPJgZJzKqPwWKv0cdN7v8/F8NRG2wvmJXfhns
	+OS1VWCZZEQLqfP363UfPCVqog6/TdNYsq/LDL2nIOWlR+zpKZ/VVTNghopvR2dw+Wx+2ge8Kp//s
	2emJdrxS0h02zs8qiI/D1G5ds7uqxdmMQMOWLpoFH5MFwN/1SwDn4j3DFU4Xb6wC8rAGqvua/JYbG
	8ZNfeHmnrKo/KReMXhqLitYmzPNoZvBrzGrgeu9cmr7N706EO892j3Gx6uFM+trQ/3MJxWOqrf+NJ
	7cZjRetUJSRh7AkbqBzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYu9A-0001Uk-S0; Wed, 13 May 2020 16:22:16 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYu97-0001UD-Jg
 for linux-mediatek@lists.infradead.org; Wed, 13 May 2020 16:22:14 +0000
Received: by mail-pl1-x642.google.com with SMTP id t16so32294plo.7
 for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2020 09:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vr4xrBPd6WjwGJ9UzkknlTs/G07kz8VNYmqVhHv2SyM=;
 b=L+qtKFp04VhJiTPE26PtBtsN3xx4OPyKOk87nXqdhh8cutiT+AdExFlLX5fGsUfPc9
 EiiQjvu0nQmrPz9UfwAUmmKblXukSy5CoK6pMgt1koyOL+ltqTVwNGIsehuU6EeepwGd
 zEWMNzN39iShzqN6U4HRjCwVQjXGS8d63sevuDfpQkQ+QpSJEBeRxRYkNo+XzCwwrTjk
 nz1MlmDL+XaPT8O4+mw/ZohQ4sxPl1mG4m9Mc76hpmBZ/ZmHlC7ZplkVyHNGzp4JXeX6
 4fujrdRW+oIurc4h6mizG8QpGWvQ35gM2yBJXvSLQmFUIAVFBiXOkDl0wLDFqE1DWp2q
 PHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vr4xrBPd6WjwGJ9UzkknlTs/G07kz8VNYmqVhHv2SyM=;
 b=Vzu25ISFp24nW8ZSqE+o3Bk2UUYtdacyj1loW2S6eatgNNF1WjUH+J/cDQ0uJCSeu5
 qpCmyAPgFBKlxQrVh3asmD37YwTBIbL3kJcK06zfOQHVuTx1Tai80gn8mn38wBvJW4ms
 4UzAX0d+kirJbCZ6OOqEozwcWIkmbRM5+KQV5As7byqlG/u4TtaYgh01uOGOpzeXk93d
 EQqbOVMK4pXDENgNIO3B3z58vtCySAXsPKTu1LseFt0s6JHQWWC936apWcBqY0VJARD0
 mWKHs+XBp6t4BzjLNWXGzmFUG/SLqYNuS4sEgTxjL6R0Oo8fIh9IFITWrfJ/HcxIF5sI
 5eEA==
X-Gm-Message-State: AGi0PuaDVO97H3UBLdnMdBTpHjPnFle9BviFBAXDOo2ebqt4wgwysOMu
 ugofeSYcuKydUuivtHHbFQs=
X-Google-Smtp-Source: APiQypIAunS+VuOWk0L1U8KjD+iXDjrbOKSioete0M+CIUAzQKtjgeqCWkCPByMQ8tlSG0/d7fnCvw==
X-Received: by 2002:a17:902:b948:: with SMTP id
 h8mr24776566pls.309.1589386928799; 
 Wed, 13 May 2020 09:22:08 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id b13sm146266pgi.58.2020.05.13.09.22.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 09:22:08 -0700 (PDT)
Subject: Re: [PATCH net-next] net: dsa: mt7530: set CPU port to fallback mode
To: Vladimir Oltean <olteanv@gmail.com>
References: <20200513153717.15599-1-dqfext@gmail.com>
 <5d77da58-694a-7f9c-53fb-9d107e271d40@gmail.com>
 <CA+h21hr_TyWQyvGukXqS0SocmvOBWUp6keghuhZh6HSaxAGb8A@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <280bce1d-a95d-b2fd-6b46-0e3f46508292@gmail.com>
Date: Wed, 13 May 2020 09:22:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CA+h21hr_TyWQyvGukXqS0SocmvOBWUp6keghuhZh6HSaxAGb8A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_092213_647951_3E24D7B1 
X-CRM114-Status: GOOD (  18.00  )
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>,
 Paul Fertser <fercerpav@gmail.com>, netdev <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 Vivien Didelot <vivien.didelot@gmail.com>, DENG Qingfang <dqfext@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Stijn Segers <foss@volatilesystems.org>, Szabolcs Hubai <szab.hu@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, riddlariddla@hotmail.com,
 "David S . Miller" <davem@davemloft.net>, Tom James <tj17@me.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 5/13/2020 9:17 AM, Vladimir Oltean wrote:
> On Wed, 13 May 2020 at 18:49, Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>>
>>
>> On 5/13/2020 8:37 AM, DENG Qingfang wrote:
>>> Currently, setting a bridge's self PVID to other value and deleting
>>> the default VID 1 renders untagged ports of that VLAN unable to talk to
>>> the CPU port:
>>>
>>>       bridge vlan add dev br0 vid 2 pvid untagged self
>>>       bridge vlan del dev br0 vid 1 self
>>>       bridge vlan add dev sw0p0 vid 2 pvid untagged
>>>       bridge vlan del dev sw0p0 vid 1
>>>       # br0 cannot send untagged frames out of sw0p0 anymore
>>>
>>> That is because the CPU port is set to security mode and its PVID is
>>> still 1, and untagged frames are dropped due to VLAN member violation.
>>>
>>> Set the CPU port to fallback mode so untagged frames can pass through.
>>
>> How about if the bridge has vlan_filtering=1? The use case you present
>> seems to be valid to me, that is, you may create a VLAN just for the
>> user ports and not have the CPU port be part of it at all.
>>
> 
> What Qingfang is doing is in effect (but not by intention) removing
> the front panel port sw0p0 from the membership list of the CPU port's
> pvid. What you seem to be thinking of (VLAN of which the CPU is not a
> member of) does not seem to be supported in DSA at the moment.

Indeed and I replied to Qingfang already that I had misunderstood his
patch originally.

> 
> As a fix, there's nothing wrong with the patch actually, I don't even
> know how it would work otherwise. DSA doesn't change the pvid of the
> CPU port when the pvid of a slave changes, because 4 slave ports could
> have 4 different pvids and the CPU port pvid would keep changing.
> Fallback mode should only apply on ingress from CPU, so there's no
> danger really.

Agreed.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
