Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96098C64E7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 03:29:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1A3C20725
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 03:29:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YCu+czqY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="AZtLUEXU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1A3C20725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/YeGqj4boYBXgSwRFNSVKJ/8mc86R92nmP4JsRtSUJY=; b=YCu+czqY/mFCmFhWV9yaBKtGg
	tGc7eQxy/0j2rSa2b2oDGFdra1K6N/bZogmcrRccDWnN6qTRoC9EISf7mcwF1heVlE6jaJLvcO+28
	/lcVttgGzBxG9g4abCYd/PC1EnCYsy2tTQLm97twruGv+F8CL2fXu89ZKooxxusiROyC6mpqlW8J4
	0wm/Ml1NmMvJWTyHzwBYsq1QZbnS7fgm37CKUyyJohlXmYBm19VDZheLzm1YqYD31hgpahnwCt82A
	jF+RvlFBNkfXFHoqYWHPQkCGWtIOtXUqqwsybDLllC4UOMVXvvSuM1biCIOKooI8l1sy8RL70p7Ab
	PmGQYrpvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjwMH-0004yH-M5; Tue, 01 Dec 2020 03:29:41 +0000
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjwMD-0004xi-SS
 for linux-mediatek@lists.infradead.org; Tue, 01 Dec 2020 03:29:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606793378; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3e5O5WzuaYMeaQ05gvvQ0q7C+TOB0SwgYc2NPdP+STo=;
 b=AZtLUEXUm8jee9etqqeOG8ERThYsHskOC2026mx7BSiGa2e6MnHI7Dhl3BQkQvv4/FdCA0tf
 16ixi1C3keaBRCapGnEgyW5a/L/bGhbz5m/9mx7dGt6Rg+RuGwyOUSuVoV5+9Ac2Lc0VgASc
 uOLMsZQ+gqZLzshTy2Toy2kWbTw=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fc5b89cf2eedd9084690d4f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Dec 2020 03:29:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3F392C43466; Tue,  1 Dec 2020 03:29:31 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 44E0AC433C6;
 Tue,  1 Dec 2020 03:29:29 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 01 Dec 2020 11:29:29 +0800
From: Can Guo <cang@codeaurora.org>
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Subject: Re: [RFC PATCH v1] scsi: ufs: Remove pre-defined initial VCC voltage
 values
In-Reply-To: <bf6e03ee-95ab-4768-7ce5-7f196ab6db60@codeaurora.org>
References: <20201130091610.2752-1-stanley.chu@mediatek.com>
 <568660cd-80e6-1b8f-d426-4614c9159ff4@codeaurora.org>
 <X8V83T+Tx6teNLOR@builder.lan>
 <4335d590-0506-d920-8e7f-f0f0372780f9@codeaurora.org>
 <X8WwPs1MPg64FEp8@builder.lan>
 <bf6e03ee-95ab-4768-7ce5-7f196ab6db60@codeaurora.org>
Message-ID: <e2a2c2c7e4de03ac04d812b95aa55c69@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_222939_079632_B22E3AB2 
X-CRM114-Status: GOOD (  29.38  )
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
Cc: linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 alim.akhtar@samsung.com, beanhuo@micron.com,
 Stanley Chu <stanley.chu@mediatek.com>, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, peter.wang@mediatek.com, cc.chou@mediatek.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 avri.altman@wdc.com, linux-mediatek@lists.infradead.org,
 jiajie.hao@mediatek.com, Bjorn Andersson <bjorn.andersson@linaro.org>,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 martin.petersen@oracle.com, kuohong.wang@mediatek.com, nguyenb@codeaurora.org,
 alice.chao@mediatek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-12-01 11:19, Asutosh Das (asd) wrote:
> On 11/30/2020 6:53 PM, Bjorn Andersson wrote:
>> On Mon 30 Nov 17:54 CST 2020, Asutosh Das (asd) wrote:
>> 
>>> On 11/30/2020 3:14 PM, Bjorn Andersson wrote:
>>>> On Mon 30 Nov 16:51 CST 2020, Asutosh Das (asd) wrote:
>>>> 
>>>>> On 11/30/2020 1:16 AM, Stanley Chu wrote:
>>>>>> UFS specficication allows different VCC configurations for UFS 
>>>>>> devices,
>>>>>> for example,
>>>>>> 	(1). 2.70V - 3.60V (By default)
>>>>>> 	(2). 1.70V - 1.95V (Activated if "vcc-supply-1p8" is declared in
>>>>>>                              device tree)
>>>>>> 	(3). 2.40V - 2.70V (Supported since UFS 3.x)
>>>>>> 
>>>>>> With the introduction of UFS 3.x products, an issue is happening 
>>>>>> that
>>>>>> UFS driver will use wrong "min_uV/max_uV" configuration to toggle 
>>>>>> VCC
>>>>>> regulator on UFU 3.x products with VCC configuration (3) used.
>>>>>> 
>>>>>> To solve this issue, we simply remove pre-defined initial VCC 
>>>>>> voltage
>>>>>> values in UFS driver with below reasons,
>>>>>> 
>>>>>> 1. UFS specifications do not define how to detect the VCC 
>>>>>> configuration
>>>>>>       supported by attached device.
>>>>>> 
>>>>>> 2. Device tree already supports standard regulator properties.
>>>>>> 
>>>>>> Therefore VCC voltage shall be defined correctly in device tree, 
>>>>>> and
>>>>>> shall not be changed by UFS driver. What UFS driver needs to do is 
>>>>>> simply
>>>>>> enabling or disabling the VCC regulator only.
>>>>>> 
>>>>>> This is a RFC conceptional patch. Please help review this and feel
>>>>>> free to feedback any ideas. Once this concept is accepted, and 
>>>>>> then
>>>>>> I would post a more completed patch series to fix this issue.
>>>>>> 
>>>>>> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
>>>>>> ---
>>>>>>     drivers/scsi/ufs/ufshcd-pltfrm.c | 10 +---------
>>>>>>     1 file changed, 1 insertion(+), 9 deletions(-)
>>>>>> 
>>>>>> diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c 
>>>>>> b/drivers/scsi/ufs/ufshcd-pltfrm.c
>>>>>> index a6f76399b3ae..3965be03c136 100644
>>>>>> --- a/drivers/scsi/ufs/ufshcd-pltfrm.c
>>>>>> +++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
>>>>>> @@ -133,15 +133,7 @@ static int ufshcd_populate_vreg(struct device 
>>>>>> *dev, const char *name,
>>>>>>     		vreg->max_uA = 0;
>>>>>>     	}
>>>>>> -	if (!strcmp(name, "vcc")) {
>>>>>> -		if (of_property_read_bool(np, "vcc-supply-1p8")) {
>>>>>> -			vreg->min_uV = UFS_VREG_VCC_1P8_MIN_UV;
>>>>>> -			vreg->max_uV = UFS_VREG_VCC_1P8_MAX_UV;
>>>>>> -		} else {
>>>>>> -			vreg->min_uV = UFS_VREG_VCC_MIN_UV;
>>>>>> -			vreg->max_uV = UFS_VREG_VCC_MAX_UV;
>>>>>> -		}
>>>>>> -	} else if (!strcmp(name, "vccq")) {
>>>>>> +	if (!strcmp(name, "vccq")) {
>>>>>>     		vreg->min_uV = UFS_VREG_VCCQ_MIN_UV;
>>>>>>     		vreg->max_uV = UFS_VREG_VCCQ_MAX_UV;
>>>>>>     	} else if (!strcmp(name, "vccq2")) {
>>>>>> 
>>>>> 
>>>>> Hi Stanley
>>>>> 
>>>>> Thanks for the patch. Bao (nguyenb) was also working towards 
>>>>> something
>>>>> similar.
>>>>> Would it be possible for you to take into account the scenario in 
>>>>> which the
>>>>> same platform supports both 2.x and 3.x UFS devices?
>>>>> 
>>>>> These've different voltage requirements, 2.4v-3.6v.
>>>>> I'm not sure if standard dts regulator properties can support this.
>>>>> 
>>>> 
>>>> What is the actual voltage requirement for these devices and how 
>>>> does
>>>> the software know what voltage to pick in this range?
>>>> 
>>>> Regards,
>>>> Bjorn
>>>> 
>>>>> -asd
>>>>> 
>>>>> 
>>>>> -- The Qualcomm Innovation Center, Inc. is a member of the Code 
>>>>> Aurora Forum,
>>>>> Linux Foundation Collaborative Project
>>> 
>>> For platforms that support both 2.x (2.7v-3.6v) and 3.x (2.4v-2.7v), 
>>> the
>>> voltage requirements (Vcc) are 2.4v-3.6v. The software initializes 
>>> the ufs
>>> device at 2.95v & reads the version and if the device is 3.x, it may 
>>> do the
>>> following:
>>> - Set the device power mode to SLEEP
>>> - Disable the Vcc
>>> - Enable the Vcc and set it to 2.5v
>>> - Set the device power mode to ACTIVE
>>> 
>>> All of the above may be done at HS-G1 & moved to max supported gear 
>>> based on
>>> the device version, perhaps?
>>> 
>>> Am open to other ideas though.
>>> 
>> 
>> But that means that for a board where we don't know (don't want to 
>> know)
>> if we have a 2.x or 3.x device we need to set:
>> 
>>    regulator-min-microvolt = <2.4V>
>>    regulator-max-microvolt = <3.6V>
>> 
>> And the 2.5V and the two ranges should be hard coded into the ufshcd 
>> (in
>> particular if they come from the specification).
>> 
>> For devices with only 2.x or 3.x devices, 
>> regulator-{min,max}-microvolt
>> should be adjusted accordingly.
>> 
>> Note that driving the regulators outside these ranges will either 
>> damage
>> the hardware or cause it to misbehave, so these values should be 
>> defined
>> in the board.dts anyways.
>> 
>> Also note that regulator_set_voltage(2.4V, 3.6V) won't give you "a
>> voltage between 2.4V and 3.6V, it will most likely give either 2.4V or
>> any more specific voltage that we've specified in the board file 
>> because
>> the regulator happens to be shared with some other consumer and 
>> changing
>> it in runtime would be bad.
>> 
>> Regards,
>> Bjorn
>> 
> 
> Understood.
> I also understand that assumptions on the regulator limits in the
> driver is a bad idea. I'm not sure how it's designed, but I should
> think the power-grid design should take care of regulator sharing; if
> it's being shared and the platform supports both 2.x and 3.x. Perhaps,
> such platforms be identified using a dts flag - not sure if that's
> such a good idea though.
> 
> I like Stanley's proposal of a vops and let vendors handle it, until
> specs or someone has a better suggestion.

Agree, vops is all we need as of now, please upload a change to add one 
properly.

Thanks,

Can Guo.

> 
> -asd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
