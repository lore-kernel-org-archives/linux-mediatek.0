Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABC5C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 03:33:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B983A20734
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 03:33:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ksq2O1nK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NvJeHCRq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B983A20734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GggSr8K8YXfRt6LBineVYePe10EYXi4JsKsFjKHIcPI=; b=ksq2O1nKD6JxgUopTdsU45gYy
	mCc6zGJwOjXxi/Oc33JThgz3wycMua0MNhyNSa05RZK6IFPGrtVodcy/wYsB4yABYwOt3Y96Ns/VV
	lxMgxcG+MlF+7YfIna9P7Oc51HA4/p+U/X427yI+7skdDRdXliSAK+kIOEdEl4W4VooABx987oHPG
	/xW0af4fMQM7DoXERt83rPElRKqTMBNhD1yzdRQaLgKpvIrkA4VoXKSw+nyW3jEgRKM9J1akGrDtR
	90WE4b2ISJwDEEuBMqMHFf5nLw03Zf1LmsWy/z5fr3q3RgFOZ2s79nMhw//K58blYu7watVBi6o/c
	wW3BB6N/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jseM0-00050r-E1; Tue, 07 Jul 2020 03:33:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jseLy-00050K-Ae; Tue, 07 Jul 2020 03:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=vl6KXRcrocPNDZrmREX3V5N1vmHQHID4t2FGejDxCgc=; b=NvJeHCRqtpSeaNJDRjVwBsJm5Q
 jySkdyljWzRDEmZVioCs/H6AEKMxaiOXD+fPzH713D2kdSGRL9GEwxQO4whMc8GQN4U9QcQpR8sgj
 sRYmBbP/NwhbqzDKcT/GNcz90QAzYYy7OvOk7Ix8Tk0Lz3joEj8jtbMV0Z5x+Vl94YyWyKhI+qcZA
 uL2quRo7w3XZ7uODPl93BGahhMyReZQvgGlKqWLsmaKM+KDS/o524yiXG4doBLxpb4gvc3KLKnHI6
 z/iUTk0R9xoA7jlC8WNWcn2c1OxP29Ul8pltJoU45wTae4JIX6AqXvSLb7xObhCchW8WBdvMhVbGI
 alL5m0zA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jseLt-0003lY-1z; Tue, 07 Jul 2020 03:33:02 +0000
Subject: Re: [PATCH 2/2] soc: mediatek: devapc: add devapc-mt6779 driver
To: Neal Liu <neal.liu@mediatek.com>
References: <1594027693-19530-1-git-send-email-neal.liu@mediatek.com>
 <1594027693-19530-3-git-send-email-neal.liu@mediatek.com>
 <dd03ec1e-e511-4c13-4e12-a9f8ec407326@infradead.org>
 <1594092631.20820.4.camel@mtkswgap22>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <eb2eaab3-1ecc-d2c8-fc40-5bbe51ee31c4@infradead.org>
Date: Mon, 6 Jul 2020 20:32:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1594092631.20820.4.camel@mtkswgap22>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 7/6/20 8:30 PM, Neal Liu wrote:
> Hi Randy,
> 
> Thanks for your review.
> 
> On Mon, 2020-07-06 at 09:13 -0700, Randy Dunlap wrote:
>> On 7/6/20 2:28 AM, Neal Liu wrote:
>>> diff --git a/drivers/soc/mediatek/devapc/Kconfig b/drivers/soc/mediatek/devapc/Kconfig
>>> new file mode 100644
>>> index 0000000..b0f7d0e
>>> --- /dev/null
>>> +++ b/drivers/soc/mediatek/devapc/Kconfig
>>> @@ -0,0 +1,17 @@
>>> +config MTK_DEVAPC
>>> +	tristate "Mediatek Device APC Support"
>>> +	help
>>> +	  Device APC is a HW IP controlling internal device security.
>>
>> preferably:               s/HW/hardware/
>>
>>> +	  MediaTek bus frabric provides TrustZone security support and data
>>
>> 	               fabric
>>
>>> +	  protection to prevent slaves from being accessed by unexpected
>>> +	  bus masters.
>>> +	  Device APC prevents malicious access to internal devices.
>>> +
>>> +config DEVAPC_MT6779
>>> +	tristate "Mediatek MT6779 Device APC driver"
>>> +	select MTK_DEVAPC
>>> +	help
>>> +	  Say yes here to enable support Mediatek MT6779 Device APC driver.
>>
>> 	                         support for Mediatek
>>
>>> +	  This driver mainly used to handle the violation with 1 DEVAPC AO/PDs.
>>
>> 	  This driver is mainly used                           ^^^^^^^^^^^^^^^^
>>
>> 	                      What is that meaningless string of chars? ^^^^^^^
> 
> I did not see any meaningless string of chars from my original patch.
> Is there something wrong?

To someone who is reading the Kconfig help text but is unfamiliar with this device,
I would say that        "1 DEVAPC AO/PDs"                    is not helpful at all.

> [1] https://lkml.org/lkml/2020/7/6/168
> 
>>
>>> +	  The violation information are logged for further analysis or
>>
>> 	                            is
>>
>>> +	  countermeasures.
>>
>> thanks.
> 


thanks.
-- 
~Randy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
