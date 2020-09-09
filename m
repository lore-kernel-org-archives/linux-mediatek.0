Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A3DC10DAA
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 15:40:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E6C20672
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 15:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="auml2N0w";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xRFxHL9/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38E6C20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zsrpAqtsQ9FStr2zYnKOClVgzESG759e5FW+ZwV9Ebs=; b=auml2N0w/WlOgStwLSZTHTdmr
	QscZYT0KHdORJoFxtkOf+FR3mC8NJ4Hb3JDrwn3ssbqpjQKuBmg7nv4fTpv3F+6gbMJMJNTcsEXa3
	CeULm8Rei5U17rGribnJSoOMrxCbTRJF7G7pM0qq0tkQYuzIQYHrr4qkQDB9zFmyMvgkxlIo23PBA
	itRcWXHMGvH8V0R7jzVxCqXt9yauT+yRSQOzYU5VBT8Y+h54jf0oiVPcsdBpl9j7MtFLKXlvOeHjV
	77z8kOlodWdGRYR/hUHrRQL7pnwTOWE7c/JPfo2qRLBMN9DRpAoy3v7KyJVMSM+jT5Wv8R02uojgk
	roHNLVKYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG2CT-0006xX-2m; Wed, 09 Sep 2020 15:39:57 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG2CP-0006x7-To; Wed, 09 Sep 2020 15:39:54 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 089FdoE7086333;
 Wed, 9 Sep 2020 10:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599665990;
 bh=PKpzgV2pHlGLyVf0qMwwItFiGxw4/quKFW+Xh2YeSG0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=xRFxHL9/w7zkT7aaPLp/M1+RW59j3iiaB9ENw29hbFZzb/OiWd6JXatoXnNkm2dRn
 yfWwA3+wnOxaENRjTWWNizCao/nX+SZ3F2UOdGTXAOAuG3NoTS74sHWgncefUcH1bs
 bQNyQXzevSqeFWfpQ5G76s0gL45NNMRPs5iSfYDo=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 089Fdo8U087352
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Sep 2020 10:39:50 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 9 Sep
 2020 10:39:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 9 Sep 2020 10:39:50 -0500
Received: from [10.250.222.86] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 089FdlZ4108164;
 Wed, 9 Sep 2020 10:39:48 -0500
Subject: Re: [v4,3/4] reset-controller: ti: introduce a new reset handler
To: Crystal Guo <crystal.guo@mediatek.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <20200817030324.5690-4-crystal.guo@mediatek.com>
 <3a5decee-5f31-e27d-a120-1f835241a87c@ti.com>
 <1599620279.14806.18.camel@mhfsdcap03>
From: Suman Anna <s-anna@ti.com>
Message-ID: <096362e9-dee8-4e7a-2518-47328068c2fd@ti.com>
Date: Wed, 9 Sep 2020 10:39:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1599620279.14806.18.camel@mhfsdcap03>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_113954_052952_EF6403E4 
X-CRM114-Status: GOOD (  27.21  )
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
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?WWluZ2pvZSBDaGVuICjpmbPoi7HmtLIp?= <Yingjoe.Chen@mediatek.com>,
 =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9/8/20 9:57 PM, Crystal Guo wrote:
> On Thu, 2020-09-03 at 07:40 +0800, Suman Anna wrote:
>> Hi Crystal,
>>
>> On 8/16/20 10:03 PM, Crystal Guo wrote:
>>> Introduce ti_syscon_reset() to integrate assert and deassert together.
>>> If some modules need do serialized assert and deassert operations
>>> to reset itself, reset_control_reset can be called for convenience.
>>
>> There are multiple changes in this same patch. I think you should split this
>> functionality away from the change for the regmap_update_bits() to
>> regmap_write_bits(), similar to what you have done in your v2 Patch 4.
>>
> 
> Thanks for your suggestion.
> I will split this patch in the next version.
> 
>>>
>>> Such as reset-qcom-aoss.c, it integrates assert and deassert together
>>> by 'reset' method. MTK Socs also need this method to perform reset.
>>>
>>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
>>> ---
>>>  drivers/reset/reset-ti-syscon.c | 26 ++++++++++++++++++++++++--
>>>  1 file changed, 24 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
>>> index a2635c21db7f..08289342f9af 100644
>>> --- a/drivers/reset/reset-ti-syscon.c
>>> +++ b/drivers/reset/reset-ti-syscon.c
>>> @@ -15,6 +15,7 @@
>>>   * GNU General Public License for more details.
>>>   */
>>>  
>>> +#include <linux/delay.h>
>>>  #include <linux/mfd/syscon.h>
>>>  #include <linux/module.h>
>>>  #include <linux/of.h>
>>> @@ -56,6 +57,7 @@ struct ti_syscon_reset_data {
>>>  	struct regmap *regmap;
>>>  	struct ti_syscon_reset_control *controls;
>>>  	unsigned int nr_controls;
>>> +	unsigned int reset_duration_us;
>>>  };
>>>  
>>>  #define to_ti_syscon_reset_data(rcdev)	\
>>> @@ -89,7 +91,7 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
>>>  	mask = BIT(control->assert_bit);
>>>  	value = (control->flags & ASSERT_SET) ? mask : 0x0;
>>>  
>>> -	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
>>> +	return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
>>>  }
>>>  
>>>  /**
>>> @@ -120,7 +122,7 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
>>>  	mask = BIT(control->deassert_bit);
>>>  	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
>>>  
>>> -	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
>>> +	return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
>>>  }
>>>  
>>>  /**
>>> @@ -158,9 +160,26 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
>>>  		!(control->flags & STATUS_SET);
>>>  }
>>>  
>>> +static int ti_syscon_reset(struct reset_controller_dev *rcdev,
>>> +				  unsigned long id)
>>> +{
>>> +	struct ti_syscon_reset_data *data = to_ti_syscon_reset_data(rcdev);
>>> +	int ret;
>>> +
>>> +	ret = ti_syscon_reset_assert(rcdev, id);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (data->reset_duration_us)
>>> +		usleep_range(data->reset_duration_us, data->reset_duration_us * 2);
>>> +
>>> +	return ti_syscon_reset_deassert(rcdev, id);
>>
>> I echo Philipp's comments [1] from your original v1 series about this. We don't
>> need a property to distinguish this, but you could add a flag using match data
>> and Mediatek compatible, and use that within this function, or optionally set
>> this ops based on compatible (whatever is preferred by Philipp).
>>
>> regards
>> Suman
>>
>> [1] https://patchwork.kernel.org/comment/23519193/
>>
> Hi Suman, Philipp
> 
> Which method would you recommend more?
> 1. like v2 patch, but assign the flag "data->assert_deassert_together"
> directly (maybe rename "assert_deassert_together" to
> "reset_op_available")
> 
> 2. use Mediatek compatible to decide the reset handler available or not.

I would go with this option. Anyway, I think you might have to add the reset SoC
data as well, based on Rob's comment on the binding.

regards
Suman

> 
> Thanks
> Crystal
> 
>>> +}
>>> +
>>>  static const struct reset_control_ops ti_syscon_reset_ops = {
>>>  	.assert		= ti_syscon_reset_assert,
>>>  	.deassert	= ti_syscon_reset_deassert,
>>> +	.reset		= ti_syscon_reset,
>>>  	.status		= ti_syscon_reset_status,
>>>  };
>>>  
>>> @@ -204,6 +223,9 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
>>>  		controls[i].flags = be32_to_cpup(list++);
>>>  	}
>>>  
>>> +	of_property_read_u32(pdev->dev.of_node,	"reset-duration-us",
>>> +				&data->reset_duration_us);
>>> +
>>>  	data->rcdev.ops = &ti_syscon_reset_ops;
>>>  	data->rcdev.owner = THIS_MODULE;
>>>  	data->rcdev.of_node = np;
>>>
>>
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
