Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83022C4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 19:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a20qnw0GLumbuloJftibE3OVN8W8kYVkmwiQ3AXnu9c=; b=tLYaEfSlbK7aqvTxrXw/6goRmI
	BW1Z60ILzSFEAaM+r2bdpgWZHaM1oCQlFYsZKt03e84gUNv4KvVKr0dfp2BZZUL5LefTsHNv/gwBZ
	/IKkIPmqnZ1kGNVMYps7lkH0xyy5MzckTPqY0n0Ky536E/KVzRdkbRIkGCznpZ1D4OW2YsY0ODo2m
	wsVOJtw4Y52Gdp41T+6/AvCyPqAQdfOk2/lpydrYg2PqXQknGMjlihKCBduD7RvE0bfsnl0dniZrG
	degQB78fBA1ywkPacMxSnyINTNxJySMvCYlVWxkasEQ2+crD8wqnts5mTA4lxEn4Bq7xCJ3xrA1bU
	677GmcXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4MW-00000004WKS-3znL;
	Mon, 05 Feb 2024 19:10:36 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX4MT-00000004WIx-3Enb
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Feb 2024 19:10:35 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-55f0b2c79cdso5793443a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Feb 2024 11:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707160231; x=1707765031; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a20qnw0GLumbuloJftibE3OVN8W8kYVkmwiQ3AXnu9c=;
        b=aIU3lTfBI3LMhYYKk8iyixh+rJfb2+jXuinrcsN4K600vrBV19yXeAL8VQIsqMlVQc
         ybmotuXeZq7C2ZYOcjNlD33hfP3+RSR2yDExK/dSMHMAmOXRYJcK+uAmFNn8YcmdxFda
         e+gJm9NoIjxvuop3TE2JIxpv9xxd6rWzz+J6sHQJlJX0Az835qx3FA1BRgQf6p1bJw9o
         Zd9vCPPlsbzPttcIDlQqPB9R4W4z3MlIdlGWJiByQWOB33RAwSs1g2IcERRDCU6+m9zg
         cKGXL2ps/r4ibkimYUsnA1baw0cQH6+AKsQpZ1Z9flgwCXiM+2M2K5M7Ut3W202qTzPB
         VWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707160231; x=1707765031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a20qnw0GLumbuloJftibE3OVN8W8kYVkmwiQ3AXnu9c=;
        b=Qc2eRKp5Y2DqfK8RXE4aJvPGIue6eTN+NyOGiXXqhME3gCoRmLCmEj5ohw8IAO3XUu
         Ta93XplIeQ1VLLB5IVSOb3zNDI963wR/d84MuydQuIIYn+HU3J+TLnCjJz8ci4kvoiSy
         8YktT/UUQoUc9ShVpVuf74cggZSF7CQR/X0bEsOnvKJr5oI5hiH8tjk9HtShqOQtC/Zs
         zrGbUvT3+jGa8ATluhTumDYca5BYnZVwMo/9YYlF01ImMOd7wxPBeXPC8AwbuUELCjrJ
         qSQrqFpqSVgx/6jjxuT9FLaX8X/ZejiNvvCcI2mMAw1YBQknWtGJT2vJOAZT4ZO1TxDY
         ZK+Q==
X-Gm-Message-State: AOJu0YyCDuU8Io4l2+yGs2/KKJy5i6LgrmJEVwWEXX5fw8nO/mGB267L
	ocBVLoUklLLLqJ7dR2AzNIogNER92qqO29a9Be6z0fJm9icjeWxt
X-Google-Smtp-Source: AGHT+IFVme9c/3/l94jUhlVm22vQ2iZ9mazNsnWQ0UPRXOehEAE+IFBgkJt6XwK65LdV+btJfzyKjA==
X-Received: by 2002:a17:906:37d1:b0:a36:fdc8:34e9 with SMTP id o17-20020a17090637d100b00a36fdc834e9mr287924ejc.1.1707160230879;
        Mon, 05 Feb 2024 11:10:30 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUihPCVNBe7nssHwW+pyENceUcDGmXzFc4iWFWfZjrQNfR/s1Zt/bsmh0wrStUZ9jNRoKP7XTsMMsMW+obwraHrjaT3gH/fvnjBmECCd4/CchAxHZeG8+62Q/ERrBNs0gan+2eTiAVhKszoStRu8pWSlELa2qPU6lTB5m9Svh6iG752L02pxKFpDttwbwrYDl3X
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id ks27-20020a170906f85b00b00a37dda5a3d1sm147766ejb.197.2024.02.05.11.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 11:10:30 -0800 (PST)
Message-ID: <b3b72faf-46fe-48db-996c-5e7e4e7b47f1@gmail.com>
Date: Mon, 5 Feb 2024 20:10:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] aquantia-firmware: package MediaTek's Aquantia
 AQR113C firmware
To: Robert Marko <robimarko@gmail.com>
Cc: openwrt-devel@lists.openwrt.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Christian Marangi <ansuelsmth@gmail.com>,
 Daniel Golle <daniel@makrotopia.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20240205132308.24015-1-zajec5@gmail.com>
 <CAOX2RU6pZb+WfZAj8+EZnye=uwcA0FTSpAspApXA90QLOb1ihQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <CAOX2RU6pZb+WfZAj8+EZnye=uwcA0FTSpAspApXA90QLOb1ihQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_111033_836851_D8539539 
X-CRM114-Status: GOOD (  12.10  )
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

On 5.02.2024 15:15, Robert Marko wrote:
> On Mon, 5 Feb 2024 at 14:23, Rafał Miłecki <zajec5@gmail.com> wrote:
>>
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Aquantia AQR113C is PHY that needs loading a firmware. Some devices may
>> have it stored on flash and some need filesystem to provide it.
>>
>> MediaTek holds its own AQR113C firmware file for its boards. Package it.
> 
> Hi Rafal, not going into details of this patch, but what is the
> license situation with
> redistributing the AQR firmware?

Good question. I don't know.

Cc linux-mediatek@
Can we get some licensing help, please?



Initial firmware file
Rhe-05.06-Candidate7-AQR_Mediatek_23B_StartOff_ID45623_VER36657.cld was
added in the commit:

commit 24ba51c5be18613127b2d8407b0223174624b130
Author: developer <developer@mediatek.com>
Date:   Tue Nov 15 11:22:46 2022 +0800

     [][kernel][mt7988][eth][Change AQR113C firmware download method to MDIO gangload]

     [Description]
     Change AQR113C firmware download method to MDIO gangload.

     If without this patch, AQR113C cannot boot from MDIO gangload.

     [Release-log]
     N/A


     Change-Id: Iddc29f5e1c73c772bcea9313938b6daccc10025a
     Reviewed-on: https://gerrit.mediatek.inc/c/openwrt/feeds/mtk_openwrt_feeds/+/6781059

with not licensing details.



Later there was a firmware update update handled by adding file:
Rhe-05.06-Candidate9-AQR_Mediatek_23B_P5_ID45824_LCLVER1.cld in the commit:

commit 405b1e31f924b97d379719fb39f0d28c0fac43a9
Author: developer <developer@mediatek.com>
Date:   Tue Mar 28 17:00:41 2023 +0800

     [][kernel][mt7988][eth][Fix AQR113C 5GBASE-T compliance test mode4 tone1 fail issue]

     [Description]
     Fix AQR113C 5GBASE-T compliance test mode4 tone1 fail issue by
     updating firmware version to
     Rhe-05.06-Candidate9-AQR_Mediatek_23B_P5_ID45824_LCLVER1.cld.

     If without this patch, AQR113C might not pass the 5GBASE-T mode4 tone1
     items for the compliance test.

     [Release-log]
     N/A


     Change-Id: I3b2c6e6cf1a6ba8183daa7e30110ff2c839c5989
     Reviewed-on: https://gerrit.mediatek.inc/c/openwrt/feeds/mtk_openwrt_feeds/+/7305781

but again with not licensing info.



I also can't find any readme file specifying licensing of those files.


