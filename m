Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F42C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 23:26:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE7F820758
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 23:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WtcKKyck";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yGg2rh9P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE7F820758
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NbRSqwMKCU9HgYVL04tci8oJjTUypU9YefBbn7SS0fo=; b=WtcKKyckHR4pmw9xNj5NfRL/P
	HPdHwwqFSzocrhrklXkYhbccj7Bkyw0iqHD7FRCSZbhUfOQ6zLaV/eVlnbMEMNwzv3vTgv/UzBLN0
	E7/LRpDTlUiF1cKKIr6dY1Gzo60pPO06erdoXvvWc80ZuuB19KXv/mN29t5pph5FYP4qvZ0npQxJ1
	msrJtwVN5aKdjAHWT60ukwjTRr1hJJywSk+iWdDaNIYCpKyJEbmLZDIxT0NhGcmal7mKOST8n2AWz
	GsUA8VAXvZzuge/T04wdZk7jBJmsRcvJZgOPWYAwZdaQjMio9VaLETWifS5bVPvRZzZ6Wk6mTrWGQ
	p6+B1qZkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDc8n-00033f-JV; Wed, 02 Sep 2020 23:26:09 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDc8i-000333-5E; Wed, 02 Sep 2020 23:26:07 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 082NQ0C5022347;
 Wed, 2 Sep 2020 18:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599089160;
 bh=HlAs1wgxV8DXY4mBeHgZx/mwNEWUVkjB7NzPw810ZHI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yGg2rh9Pr23KfE3TOCb4MWQLWIBp6pJrxqWekCjjbl1sjaH6TbLojmkRDEzaJke4e
 gxtcr5dsqEIWpvE8TnJDMdGgbdrSpFJPtY+KkvMuPT00ioz0BfBMBAZnVl5TEeyNDi
 AS4VlsadUXUYBbFC1lXZLpDy1cuw5Yxv1ImoR/rM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 082NQ0Pm062378
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 2 Sep 2020 18:26:00 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 2 Sep
 2020 18:25:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 2 Sep 2020 18:25:59 -0500
Received: from [10.250.34.112] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 082NPwxZ121283;
 Wed, 2 Sep 2020 18:25:59 -0500
Subject: Re: [v4,2/4] dt-binding: reset-controller: ti: add
 'mediatek,infra-reset' to compatible
To: Crystal Guo <crystal.guo@mediatek.com>, Rob Herring <robh@kernel.org>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <20200817030324.5690-3-crystal.guo@mediatek.com>
 <20200825190219.GA1125997@bogus> <1598440183.30048.14.camel@mhfsdcap03>
From: Suman Anna <s-anna@ti.com>
Message-ID: <6c292056-1cb1-bc6c-0422-46e047dcf08f@ti.com>
Date: Wed, 2 Sep 2020 18:25:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1598440183.30048.14.camel@mhfsdcap03>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_192604_287764_5836B176 
X-CRM114-Status: GOOD (  20.47  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?WW9uZyBMaWFuZyAo5qKB5YuHKQ==?= <Yong.Liang@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 =?UTF-8?B?U2VpeWEgV2FuZyAo546L6L+65ZCbKQ==?= <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?RmFuIENoZW4gKOmZs+WHoSk=?= <fan.chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?WWluZ2pvZSBDaGVuICjpmbPoi7HmtLIp?= <Yingjoe.Chen@mediatek.com>,
 =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

On 8/26/20 6:09 AM, Crystal Guo wrote:
> On Wed, 2020-08-26 at 03:02 +0800, Rob Herring wrote:
>> On Mon, Aug 17, 2020 at 11:03:22AM +0800, Crystal Guo wrote:
>>> The TI syscon reset controller provides a common reset management,
>>> and is suitable for MTK SoCs. Add compatible 'mediatek,infra-reset',
>>> which denotes to use ti reset-controller driver directly.
>>>
>>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
>>> ---
>>>  Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
>>> index ab041032339b..5a0e9365b51b 100644
>>> --- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
>>> +++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
>>> @@ -25,6 +25,7 @@ Required properties:
>>>  			    "ti,k2l-pscrst"
>>>  			    "ti,k2hk-pscrst"
>>>  			    "ti,syscon-reset"
>>> +			    "mediatek,infra-reset", "ti,syscon-reset"
>>
>> You need your own binding doc. If you can use the same driver then fine, 
>> but that's a separate issue. There's also reset-simple driver if you 
>> have just array of 32-bit registers with a bit per reset.
>>
>> Don't repeat 'ti,reset-bits' either.
> 
> Do you mean I should add a Mediatek reset binding doc, although Mediatek
> reuse the TI reset controller directly?

Hmm, how do you envision not repeating the same bits in a separate binding?
Does it help if I convert this to YAML first without a ti, prefix in the file name?

The usage philosophy definitely was to use a <soc-compatible> followed by the
<generic-compatible>. This is how all of our reset nodes were added as well.

Looks like Andrew may have misinterpreted your comment [1] during the original
binding and changed "syscon-reset" to "ti,syscon-reset" in the final version [2].

regards
Suman

[1] https://lore.kernel.org/patchwork/comment/876688/
[2] https://lore.kernel.org/patchwork/patch/693172/

> 
> Best Regards
> Crystal
>>
>>>   - #reset-cells		: Should be 1. Please see the reset consumer node below
>>>  			  for usage details
>>>   - ti,reset-bits	: Contains the reset control register information
>>> -- 
>>> 2.18.0
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
