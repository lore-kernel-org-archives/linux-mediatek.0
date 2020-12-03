Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895FDC63777
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 08:01:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8EC020709
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 08:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8EC020709
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ta6bCd/ZVEtyvDQIyi/tzgS5nhewowT8QqKROPG87YM=; b=QSDsGQSfhDU41PGF1qhqusVxX
	TPekyC7ESDaSTyOwKJzHmGJYMOypvnQ301yNI2/0pPvL2JMFKFMZfbqO00AK7413CTqPAicuayFew
	sjfB3ZoWDBr+d6RotVjy0TFWXeqDOOv3xZ4BjelyW2t1NEgPqon4myYpSiWgFgDPqPlAepHEfpXhU
	ZRjaQ10DzcmdCz+EkuVTXpn2GgCYCEzxz8LdyBpicnYyzI34Asv4ZqV7B97YDfnDKuY66YiJxbkWb
	ueZH+t3jmhM4qVlM3Fk8KiSJvg3DMnEgfjxv8VyH4YZJJ4F+1OhKcPOpLqfUuV/D1UogsDSMm0HlZ
	YyeKVY9ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkjYd-0000nF-Et; Thu, 03 Dec 2020 08:01:43 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkjYY-0000la-Hx; Thu, 03 Dec 2020 08:01:40 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B381DS3099378;
 Thu, 3 Dec 2020 02:01:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606982473;
 bh=t3mia9tWr7VVYPxO7gEa0Qj6gwWziqiiNMTIVqvILto=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=w4mllMSBk8uEIu0v1CEb6TC/dl5nRxvQbXBIfVa9a8BD6UB68310/Wbb0Pw7AQcHY
 1nkWVMF82yEPhdvzAOGM3wZZIaJOmaX9eI7ba3qfmWa5UF243dASBguo1vdBttpTg6
 LdE8cyiSbHSpfES10g3b5JjD5QPYvhjhyiu6uSgU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B381DTi129337
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Dec 2020 02:01:13 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 3 Dec
 2020 02:01:12 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 3 Dec 2020 02:01:12 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B381A2Z066616;
 Thu, 3 Dec 2020 02:01:11 -0600
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
To: Qii Wang <qii.wang@mediatek.com>, Wolfram Sang <wsa@the-dreams.de>
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
 <20201202153543.GG874@kunai> <1606958735.25719.29.camel@mhfsdcap03>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <629d171a-0e77-3d74-ae23-e6439dcf17b7@ti.com>
Date: Thu, 3 Dec 2020 10:01:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1606958735.25719.29.camel@mhfsdcap03>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_030139_528850_060A3430 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 03/12/2020 03:25, Qii Wang wrote:
> On Wed, 2020-12-02 at 16:35 +0100, Wolfram Sang wrote:
>> Hi,
>>
>>> Some i2c device driver indirectly uses I2C driver when it is now
>>> being suspended. The i2c devices driver is suspended during the
>>> NOIRQ phase and this cannot be changed due to other dependencies.
>>> Therefore, we also need to move the suspend handling for the I2C
>>> controller driver to the NOIRQ phase as well.
>>>
>>> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
>>
>> Is this a bugfix and should go into 5.10? Or can it wait for 5.11?
>>
> 
> Yes, Can you help to apply it into 5.10? Thanks

To be honest if you still do have any i2c device which accessing i2c buss after _noirq
stage and your driver does not implement .master_xfer_atomic() - you definitely have a bigger problem.
So adding IRQF_NO_SUSPEND sound like a hack and probably works just by luck.


-- 
Best regards,
grygorii

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
