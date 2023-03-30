Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23941C761A6
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 10:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJ4kHmOyB5GJCNT97r/CEXr1tfWeNmV/zja7PhdakrM=; b=PdTmZ5kCtJQTwMVZ75tgteN2ao
	TwEEYI1TbTKqJVGCzbAKQ+2k6BxQfAEwiAT7qe+whDyKXXGPY+fruQ3tqBJrqSP2VuRINiKVIMPum
	hkg503UxFv0ObR4g4KxZbBPrdyej4nlKmshQFR0gg4+F6hAFR0maFMGMgFU5PuGMYwHwPsEiGmE/0
	fSWjU1+UqHknejf75RJDm5yZeqzu50+U78cTT1i5UZqWSBphO6kd13UhIPdWTQe26r6eydPdGxJR9
	UU0EdykRiTmu50M6XwUfD1ynHs0euBozRN3fO56tUhtTakZoagSaLpQpCk46qdZwwb/+cc2PF9VL9
	9QB9TUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phpmU-003WaX-1A;
	Thu, 30 Mar 2023 10:45:22 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phpmQ-003WY4-1H
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Mar 2023 10:45:19 +0000
Received: by mail-ed1-x52f.google.com with SMTP id w9so74700890edc.3
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Mar 2023 03:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20210112.gappssmtp.com; s=20210112; t=1680173115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nJ4kHmOyB5GJCNT97r/CEXr1tfWeNmV/zja7PhdakrM=;
        b=lGerEYp3RodGDGGbu9v46KqIKVUtY8TeLHCWxCyKo+lIj9VCOEqmYXb5Luv5Icdw83
         /Q3ohcVMs8/k4KEjqUfKTm0pm1obz2hYyDJZEGwY4xvSV70Uh8/o0fRR62eoC40mv/Bv
         UEBYsZ9wt18DBWpVrq6PHs0ItsJPyhMLJmMVYdRNaFyf6g5o43qmVx2ExIW9JPB5NAcT
         SXRLeONaXaaxnx6NDDtdppC3NfBaEjMNaKyBR43dlSVVCegyF8RxQYNMsOAzUTzA2au6
         2XuJdBK+c0uj4WiQDcWKQjhPoR9V9sl3rqUkq8GEkpgIesqP2468KV0nJR3pSnsRbAgW
         ihWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680173115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJ4kHmOyB5GJCNT97r/CEXr1tfWeNmV/zja7PhdakrM=;
        b=auj2sXcElLYgENiW0eT1bzp6kwZqT9hxhbLChm4JqhWUDhEPaMTOLZOi63uBR+PHsu
         BbZz0LT8qntq3wDU7cfj5FDbvCs705gLd60RLcpdklTt8Ici1M0frJmF3vGBIXdAlfno
         BRQ2peBx83NAkfgc8+EsXbErCP4C0jttdVV0QXnmFyfJi+B69Sy+5u99OgVRMidt1ZPn
         LsIh79/45D/2N3nDCQ0Bt07E0LbOQx9/1iCPCMCMpbrCeedyOHGxesvAbx9tIFWslTgp
         oS2urLW29MJx5Jd0qW4O+r+O+rJOX6ofQfrVGr0R7B7bAClIfHJdPX2YUdnp0JFAGfxc
         3SKw==
X-Gm-Message-State: AAQBX9eXOsZOOBdhQ145zvbMxCbLwgSdBCIVoL3lX6Pte41XtEej8kDQ
	8bbOYSq/Wr0sSjwEiKgVFKGkNw==
X-Google-Smtp-Source: AKy350ZCwuMbyX3imXZjyklWc/tn6fTJgMv803a+AfMakTywcrCsiPGJxBzQ+0cpDFJ7UWixfjodXw==
X-Received: by 2002:a17:906:738a:b0:878:58e6:f1eb with SMTP id f10-20020a170906738a00b0087858e6f1ebmr20132191ejl.23.1680173115494;
        Thu, 30 Mar 2023 03:45:15 -0700 (PDT)
Received: from [192.168.0.161] (62-73-72-43.ip.btc-net.bg. [62.73.72.43])
        by smtp.gmail.com with ESMTPSA id p25-20020a50cd99000000b004bf76fdfdb3sm17878396edi.26.2023.03.30.03.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 03:45:15 -0700 (PDT)
Message-ID: <6f0d0f2d-474b-caaf-78a7-289e660c3aa0@blackwall.org>
Date: Thu, 30 Mar 2023 13:45:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 net-next 6/6] selftests: forwarding: add dynamic FDB
 test
Content-Language: en-US
To: Hans Schultz <netdev@kapio-technology.com>,
 Ido Schimmel <idosch@nvidia.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Kurt Kanzenbach <kurt@linutronix.de>,
 Hauke Mehrtens <hauke@hauke-m.de>, Woojung Huh <woojung.huh@microchip.com>,
 "maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER"
 <UNGLinuxDriver@microchip.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER"
 <linux-renesas-soc@vger.kernel.org>,
 "moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
References: <20230318141010.513424-1-netdev@kapio-technology.com>
 <20230318141010.513424-7-netdev@kapio-technology.com>
 <ZBgdAo8mxwnl+pEE@shredder> <87a5zzh65p.fsf@kapio-technology.com>
 <ZCMYbRqd+qZaiHfu@shredder> <87fs9ollmn.fsf@kapio-technology.com>
 <ZCUuMosWbyq1pK8R@shredder> <87mt3u7csh.fsf@kapio-technology.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <87mt3u7csh.fsf@kapio-technology.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_034518_656890_81696EF4 
X-CRM114-Status: GOOD (  26.17  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 30/03/2023 13:29, Hans Schultz wrote:
> On Thu, Mar 30, 2023 at 09:37, Ido Schimmel <idosch@nvidia.com> wrote:
>> On Tue, Mar 28, 2023 at 09:30:08PM +0200, Hans Schultz wrote:
>>>
>>> Sorry, but I have sent you several emails telling you about the problems
>>> I have with running the selftests due to changes in the phy etc. Maybe
>>> you have just not received all those emails?
>>>
>>> Have you checked spamfilters?
>>>
>>> With the kernels now, I cannot even test with the software bridge and
>>> selftests as the compile fails - probably due to changes in uapi headers
>>> compared to what the packages my system uses expects.
>>
>> My spam filters are fine. I saw your emails where you basically said
>> that you are too lazy to setup a VM to test your patches and that your
>> time is more valuable than mine, which is why I should be testing them.
>> Stop making your problems our problems. It's hardly the first time. If
>> you are unable to test your patches, then invest the time in fixing your
>> setup instead of submitting completely broken patches and making it our
>> problem to test and fix them. I refuse to invest time in reviewing /
>> testing / reworking your submissions as long as you insist on doing less
>> than the bare minimum.
>>
>> Good luck
> 
> I never said or indicated that my time is more valuable than yours. I
> have a VM to run these things that some have spent countless hours to
> develop with the right tools etc installed and set up. Fixing that
> system will take quite many hours for me, so I am asking for some simple
> assistance from someone who already has a system running supporting the
> newest kernel.
> 
> Alternatively if there is an open sourced system available that would be
> great.
> 
> As this patch-set is for the community and some companies that would
> like to use it and not for myself, I am asking for some help from the
> community with a task that when someone has the system in place should
> not take more than 15-20 minutes, maybe even less.

I'm sorry but this is absolutely the wrong way to go about this. Your setup's
problems are yours to figure out and fix, if you are going to send *any* future
patches make absolutely sure they build, run and work as intended.
Please do not send any future patches without them being fully tested and, as
Ido mentioned, cover at least the bare minimum for a submission.

Thanks,
 Nik


