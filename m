Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D187C48297
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 19:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2OvECw22Q5BgjGgES2GE/cj2wE+wa6UeJvpJpV2/xA=; b=G4o6fIYvm0+8UnesN+ZAg6rqOV
	6FJz7mSWETUWnx7F/Pl67O4uKvIy1I0+CmLikc+SluQT4qKiazx6gbckJU2+J01I5fOvGZqflcouw
	xG37gC0mO8TsSAP4eDRMt9EJXERtjjSbZlcyln6Ub8651uDx7jvvr5BTFxF5HoWhNUypjhLInOJCu
	E7Gp/dkKTKRY7A2mfSbI4f7kX5yX5JEUB39i05FsM8o8VYWQvY5LdvPEexDiH8NyjMjSfSAhivD8/
	BXe66LeIuqNUA3V2v43yHBSbt0Vh+JeuMyrVIdgtm5wiFLR6MgyYNe19R/f7/2HAN2Ne2VIY4ygCS
	rTDBI0Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXQrt-00000008eWI-1eRB;
	Tue, 06 Feb 2024 19:12:29 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXQrq-00000008eUv-0NPe
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 19:12:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82F731BF207;
	Tue,  6 Feb 2024 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1707246741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D2OvECw22Q5BgjGgES2GE/cj2wE+wa6UeJvpJpV2/xA=;
	b=PkuBisEY6c4fyspRm7MgI4OZgeWLGfeUHFJc2NSejPhYd7i5x4k4jAYmFGhhe7q0sqryj4
	sQ7Eom6w3g++5HWtxmvbJa1T3Tjyj+ywv2ipmZGq4meBIhNXDBmwldAZO1sOFZBJ3gOZgQ
	Sw/DRJX36lPiYCBggPHiGXjv1OvA6CU+3aDJ8AyfIjuyNKWdN3l99TNE181SvYpChh0Mp8
	D04fqY9A7SETFkYdaLWyw5YtMINnGCh47bn+TQ8nQoUtgvCHnkKMqZ/wKd5xJPROkB5TU7
	6RA53ANELXnsyiPWlcGk3vsz39Qrd+pxmIdPHN1T97QvLMMwwd056MpVv7rYVw==
Message-ID: <99ff1729-b076-4a58-b241-461d5425a4e5@arinc9.com>
Date: Tue, 6 Feb 2024 22:12:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] aquantia-firmware: package MediaTek's Aquantia
 AQR113C firmware
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Robert Marko <robimarko@gmail.com>
Cc: openwrt-devel@lists.openwrt.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Christian Marangi <ansuelsmth@gmail.com>,
 Daniel Golle <daniel@makrotopia.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20240205132308.24015-1-zajec5@gmail.com>
 <CAOX2RU6pZb+WfZAj8+EZnye=uwcA0FTSpAspApXA90QLOb1ihQ@mail.gmail.com>
 <b3b72faf-46fe-48db-996c-5e7e4e7b47f1@gmail.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <b3b72faf-46fe-48db-996c-5e7e4e7b47f1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_111226_427388_E33A666C 
X-CRM114-Status: GOOD (  16.69  )
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

On 5.02.2024 22:10, Rafał Miłecki wrote:
> On 5.02.2024 15:15, Robert Marko wrote:
>> On Mon, 5 Feb 2024 at 14:23, Rafał Miłecki <zajec5@gmail.com> wrote:
>>>
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> Aquantia AQR113C is PHY that needs loading a firmware. Some devices may
>>> have it stored on flash and some need filesystem to provide it.
>>>
>>> MediaTek holds its own AQR113C firmware file for its boards. Package it.
>>
>> Hi Rafal, not going into details of this patch, but what is the
>> license situation with
>> redistributing the AQR firmware?
> 
> Good question. I don't know.
> 
> Cc linux-mediatek@
> Can we get some licensing help, please?
> 
> 
> 
> Initial firmware file
> Rhe-05.06-Candidate7-AQR_Mediatek_23B_StartOff_ID45623_VER36657.cld was
> added in the commit:
> 
> commit 24ba51c5be18613127b2d8407b0223174624b130
> Author: developer <developer@mediatek.com>
> Date:   Tue Nov 15 11:22:46 2022 +0800
> 
>      [][kernel][mt7988][eth][Change AQR113C firmware download method to MDIO gangload]
> 
>      [Description]
>      Change AQR113C firmware download method to MDIO gangload.
> 
>      If without this patch, AQR113C cannot boot from MDIO gangload.
> 
>      [Release-log]
>      N/A
> 
> 
>      Change-Id: Iddc29f5e1c73c772bcea9313938b6daccc10025a
>      Reviewed-on: https://gerrit.mediatek.inc/c/openwrt/feeds/mtk_openwrt_feeds/+/6781059
> 
> with not licensing details.
> 
> 
> 
> Later there was a firmware update update handled by adding file:
> Rhe-05.06-Candidate9-AQR_Mediatek_23B_P5_ID45824_LCLVER1.cld in the commit:
> 
> commit 405b1e31f924b97d379719fb39f0d28c0fac43a9
> Author: developer <developer@mediatek.com>
> Date:   Tue Mar 28 17:00:41 2023 +0800
> 
>      [][kernel][mt7988][eth][Fix AQR113C 5GBASE-T compliance test mode4 tone1 fail issue]
> 
>      [Description]
>      Fix AQR113C 5GBASE-T compliance test mode4 tone1 fail issue by
>      updating firmware version to
>      Rhe-05.06-Candidate9-AQR_Mediatek_23B_P5_ID45824_LCLVER1.cld.
> 
>      If without this patch, AQR113C might not pass the 5GBASE-T mode4 tone1
>      items for the compliance test.
> 
>      [Release-log]
>      N/A
> 
> 
>      Change-Id: I3b2c6e6cf1a6ba8183daa7e30110ff2c839c5989
>      Reviewed-on: https://gerrit.mediatek.inc/c/openwrt/feeds/mtk_openwrt_feeds/+/7305781
> 
> but again with not licensing info.
> 
> 
> 
> I also can't find any readme file specifying licensing of those files.

Maybe these should be submitted to the linux-firmware repository (by
MediaTek or with MediaTek's approval) and the license specified on the
WHENCE file.

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/

Arınç

