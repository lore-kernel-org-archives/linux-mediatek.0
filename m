Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC796C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 12:20:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 419CC2086A
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 12:20:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aNhzsico";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.b="D2Ap3uJ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 419CC2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ibtO9uAdV6sRtOhWQ6VphKcBfFdhrcAllvHoxrgFWsI=; b=aNhzsicoYlL4Ah+JBClh95aAE
	WBj+QB9dtR5ZOyPupopHwnn9TofmWk915zgeyEyHftIS8t+LZnvB9ZW6MgfnuK2UoAgXuRucYT/Do
	tOVh9ETqrxzB5ryYV0b8KUYaVpwhK9H1tMFhTNGv2sQsvOA30kD/q5CGDMOxJk041C/8ZN/LryEnc
	o4Tjp+XBelgORyPZ+ZV9lVxVXLgEaj7v+7xEysMy78D0ORkhqwY8EQGcBUZ3KxKPSOT8EloWGg5Ez
	l/JIwxoayY5iSBx9+81f9A7oHZmMCJDExp9A9Q1Jl6DZZ9xhQxfMgmnBKiCTZAGU1rKISXWrz688f
	RbXy2ZIFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLmiI-0006zQ-CT; Fri, 25 Sep 2020 12:20:34 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLmiD-0006yV-Qd; Fri, 25 Sep 2020 12:20:31 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601036427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UTjLXvwP0cQUzqYMdns20Sc75oW9I9O0WLbhYPi/g6Y=;
 b=D2Ap3uJ0bRyha3Q5Dk9iyHybJ8SxmC2Vt2I7yKsb0rlwZ4sYLYJzPGgNJQKdwpOFzBVwjU
 PTXQicBP3X+v/ig4f+3+gFutR8Th4NAZnB2IF6Vs1nTkdaUSDpcivPS3wbEzg50VXkjTeM
 RT/euPAFWT/ZCUQewn0epAcsk5lW/zA=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 576C8AC5F;
 Fri, 25 Sep 2020 12:20:27 +0000 (UTC)
Subject: Re: [PATCH 08/12] soc: mediatek: pm-domains: Add subsystem clocks
To: Weiyi Lu <weiyi.lu@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20200910172826.3074357-1-enric.balletbo@collabora.com>
 <20200910172826.3074357-9-enric.balletbo@collabora.com>
 <1601031353.1346.71.camel@mtksdaap41>
From: Matthias Brugger <mbrugger@suse.com>
Message-ID: <923ec8f9-32fe-5a1c-e7fe-8dc1c55d664c@suse.com>
Date: Fri, 25 Sep 2020 14:20:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1601031353.1346.71.camel@mtksdaap41>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_082030_070811_7825DFEE 
X-CRM114-Status: GOOD (  21.87  )
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
Cc: drinkcat@chromium.org, linux-kernel@vger.kernel.org, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 25/09/2020 12:55, Weiyi Lu wrote:
> On Thu, 2020-09-10 at 19:28 +0200, Enric Balletbo i Serra wrote:
>> From: Matthias Brugger <mbrugger@suse.com>
>>
>> For the bus protection operations, some subsystem clocks need to be enabled
>> before releasing the protection. This patch identifies the subsystem clocks
>> by it's name.
>>
>> Suggested-by: Weiyi Lu <weiyi.lu@mediatek.com>
>> [Adapted the patch to the mtk-pm-domains driver]
>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>>   drivers/soc/mediatek/mtk-pm-domains.c | 82 +++++++++++++++++++++++----
>>   1 file changed, 70 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
>> index 0802eccc3a0b..52a93a87e313 100644
>> --- a/drivers/soc/mediatek/mtk-pm-domains.c
>> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
[...]
>>   
>> -	pd->num_clks = of_clk_get_parent_count(node);
>> -	if (pd->num_clks > 0) {
>> +	num_clks = of_clk_get_parent_count(node);
>> +	if (num_clks > 0) {
>> +		/* Calculate number of subsys_clks */
>> +		of_property_for_each_string(node, "clock-names", prop, clk_name) {
>> +			char *subsys;
>> +
>> +			subsys = strchr(clk_name, '-');
>> +			if (subsys)
>> +				pd->num_subsys_clks++;
>> +			else
>> +				pd->num_clks++;
>> +		}
>> +
> 
> In fact, I don't like the clock naming rules, as Matthias mentioned
> before. So in my work v17[1]
> I put subsystem clocks under each power domain sub-node without giving
> the clock name but put the basic clocks under the power controller node.
> 
> [1] https://patchwork.kernel.org/patch/11703191/

The quick answer, there is no perfect solution to our problem. If we put all 
basic clocks under the parent node, then we will have to have a list of basic 
clocks in the driver data for each SoC. Apart from that the DTS would not 
reflect the exact hardware, as the basic clocks needed for every power domain 
would be hidden in the driver data.

Given this, I think the best way is to distinguish the clocks by it's name, as 
done by you in earlier series of the scpsys. It will give us a cleaner device 
tree and we won't need to add long clock lists in the driver data. If I remember 
correctly Rob acknowledged your binding change for that:
https://patchwork.kernel.org/patch/11562521/

Regards,
Matthias


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
