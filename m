Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6ABBC43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 15:10:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CA8C22268
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 15:10:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wiVxNtaf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="u/+ts5j5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CA8C22268
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CXzeA+YAmVYRTmXUPkkSdbwU214Ja05+QVVPNZ2jUFQ=; b=wiVxNtafzihhgRU0q7zU1VRup
	p9gP1mM1zMN0Jo+lligmJSFAGm9UBFkqW3CdlYMbmpWiROf2nctRHMjDGtk0l38soypVO2GNpgiom
	EpLcNd0jDcdBjC7x41LqPG8fzOj0sPqTC4MJWO8sq+UB3JmxyxhT3aYTwcrUTSQ32p2b/L8BajflG
	nEr3ZBzD91MOtYguP0ezY9cDb5SVAzm5KKYvCFqvoWzH/hYvNT1iYVHn4rMl+HaPcMtFVJZV0XXYa
	yoTfnMNEisR5Cj6f1XVoyfph0Uq1njY6t7cbcvq9+j9bMHiRlwf8A8jqDm6pr2Gfr2a4bWPxemdlN
	E6ZiPjgZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG1jk-0008MA-KR; Wed, 09 Sep 2020 15:10:16 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG1jh-0008LU-Qq; Wed, 09 Sep 2020 15:10:14 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 089FAAnU061479;
 Wed, 9 Sep 2020 10:10:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599664210;
 bh=y4ypjBJCmmVVWSAzOMpL0Yzjxk7jCoHxtQOFSri+Anw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=u/+ts5j5SpV+waYzgQySKVrYaTAvl6uBOp84sSfEcJAW//jpLjWcjzkvnMwA3Frda
 DcgUnu9/SR6ASEHDG8soaQr/EkhVrE5ai+thntuHL3iTqY/7r++fqS6qUx7nOGhlcq
 SPIlVSjWsVfaLxzELrbxRnvkTv2hHoKgNfcaYKp8=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 089FAAeT090290;
 Wed, 9 Sep 2020 10:10:10 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Sep
 2020 10:10:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Sep 2020 10:10:09 -0500
Received: from [10.250.34.59] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 089FA99W115484;
 Wed, 9 Sep 2020 10:10:09 -0500
Subject: Re: [v4,2/4] dt-binding: reset-controller: ti: add
 'mediatek,infra-reset' to compatible
To: Rob Herring <robh@kernel.org>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <20200817030324.5690-3-crystal.guo@mediatek.com>
 <20200825190219.GA1125997@bogus> <1598440183.30048.14.camel@mhfsdcap03>
 <6c292056-1cb1-bc6c-0422-46e047dcf08f@ti.com>
 <CAL_JsqKuL7XM2CL3z0OQdRua5YJO2ZRdsoE3fdAH948mKGfWnA@mail.gmail.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <b91c4ddf-8f12-2154-0a41-bf9563b5aefd@ti.com>
Date: Wed, 9 Sep 2020 10:10:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKuL7XM2CL3z0OQdRua5YJO2ZRdsoE3fdAH948mKGfWnA@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_111014_156778_3E2EF1A3 
X-CRM114-Status: GOOD (  23.83  )
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
 =?UTF-8?B?WWluZ2pvZSBDaGVuICjpmbPoi7HmtLIp?= <Yingjoe.Chen@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Crystal Guo <crystal.guo@mediatek.com>,
 =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9/8/20 1:49 PM, Rob Herring wrote:
> On Wed, Sep 2, 2020 at 5:26 PM Suman Anna <s-anna@ti.com> wrote:
>>
>> Hi Rob,
>>
>> On 8/26/20 6:09 AM, Crystal Guo wrote:
>>> On Wed, 2020-08-26 at 03:02 +0800, Rob Herring wrote:
>>>> On Mon, Aug 17, 2020 at 11:03:22AM +0800, Crystal Guo wrote:
>>>>> The TI syscon reset controller provides a common reset management,
>>>>> and is suitable for MTK SoCs. Add compatible 'mediatek,infra-reset',
>>>>> which denotes to use ti reset-controller driver directly.
>>>>>
>>>>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
>>>>> index ab041032339b..5a0e9365b51b 100644
>>>>> --- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
>>>>> +++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
>>>>> @@ -25,6 +25,7 @@ Required properties:
>>>>>                         "ti,k2l-pscrst"
>>>>>                         "ti,k2hk-pscrst"
>>>>>                         "ti,syscon-reset"
>>>>> +                       "mediatek,infra-reset", "ti,syscon-reset"
>>>>
>>>> You need your own binding doc. If you can use the same driver then fine,
>>>> but that's a separate issue. There's also reset-simple driver if you
>>>> have just array of 32-bit registers with a bit per reset.
>>>>
>>>> Don't repeat 'ti,reset-bits' either.
>>>
>>> Do you mean I should add a Mediatek reset binding doc, although Mediatek
>>> reuse the TI reset controller directly?
>>
>> Hmm, how do you envision not repeating the same bits in a separate binding?
> 
> I mean 'ti,reset-bits' isn't really something that should have been in
> DT in the first place, but rather implied by the compatible string.

Ok, should I be deprecating this and move this data to driver then?

I am assuming that is how you are envisioning the new Mediatek binding to be
atleast.

regards
Suman

> 
>> Does it help if I convert this to YAML first without a ti, prefix in the file name?
> 
> No, I don't think this should be a shared binding. The driver may be
> able to be shared, but that's independent from the binding.
> 
> Rob
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
