Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77F2C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 23:05:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DD4320767
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 23:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WUo7h3bM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qsAbeb7G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DD4320767
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yQmvniuyoJKsx+k1fQ8/D4C08e1F9qvVqiq8SRqNd9o=; b=WUo7h3bMKdxmBB4itTXWjygR9
	0X4W2nn9cSQ+Z345eE8nc43nPGSbIshVx1aU+UhZrxa3KLN0dLpqrabZbn/dNovFX9QkiXDVlzky/
	C0ShGELYWMPVT+fxJ18GN710kp4zP7hiVvnGdJ6YJ0gCKZxGOPhL5EBreKWAE9RqLvhkbMhtniTkA
	In35fKbbeNMugd2OYlTAWbpce55Kp2rbTr7YlCTOEcyKGQSx75s/VQhjslcW/+Sw0Ix0Okyq2xCrI
	iV8vxyHDUumqIAsBIuoHfz/B/R6vAWJvDvRt7HLJCdFcGUJ7m/z7ScCOXAgZTXK+BsLpZ93N1/bh8
	96Wpg1l4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDbod-0000td-6V; Wed, 02 Sep 2020 23:05:19 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDbob-0000t1-BZ; Wed, 02 Sep 2020 23:05:18 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 082N5D3f003529;
 Wed, 2 Sep 2020 18:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599087913;
 bh=kgvzmdT3jeZ6E0CgRBKSKJBSYYL2SuexF1i/gVlvoIQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=qsAbeb7Gi3mKvZaHELNtNgyxAqgLYHYbTRUv2WhIlLuKNXXJGwyJS8V1o5fyEvDsa
 0roJSqsLSyRBz7+HrChAy2fR/l7LhlQ2U8ZKlbAoKqsJYU56fi6pzodWXmF86vB0nj
 PbSFWk1TjuN0vmG2M1xLnNNCP3vr6Lc9pJ+aAzYs=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 082N5D7F065189;
 Wed, 2 Sep 2020 18:05:13 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 2 Sep
 2020 18:05:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 2 Sep 2020 18:05:13 -0500
Received: from [10.250.34.112] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 082N5CWO036329;
 Wed, 2 Sep 2020 18:05:12 -0500
Subject: Re: [v2,5/6] reset-controller: ti: Introduce force-update method
To: Crystal Guo <crystal.guo@mediatek.com>, Philipp Zabel
 <p.zabel@pengutronix.de>
References: <20200803061511.29555-1-crystal.guo@mediatek.com>
 <20200803061511.29555-6-crystal.guo@mediatek.com>
 <3413ca889fcef11c6dafe1d6b135e1887d84a6e4.camel@pengutronix.de>
 <1597042656.11360.39.camel@mhfsdcap03>
From: Suman Anna <s-anna@ti.com>
Message-ID: <44c878d8-8138-2afa-b4a3-335823932262@ti.com>
Date: Wed, 2 Sep 2020 18:05:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597042656.11360.39.camel@mhfsdcap03>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_190517_479636_FFEDE47F 
X-CRM114-Status: GOOD (  22.81  )
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
Cc: =?UTF-8?B?WW9uZyBMaWFuZyAo5qKB5YuHKQ==?= <Yong.Liang@mediatek.com>,
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

Hi Crystal,

On 8/10/20 1:57 AM, Crystal Guo wrote:
> On Tue, 2020-08-04 at 15:03 +0800, Philipp Zabel wrote:
>> Hi Crystal,
>>
>> On Mon, 2020-08-03 at 14:15 +0800, Crystal Guo wrote:
>>> Introduce force-update method for assert and deassert interface,
>>> which force the write operation in case the read already happens
>>> to return the correct value.
>>>
>>> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
>>
>> Added Suman and Andrew for confirmation: I think writing unconditionally
>> can't break any existing user. Just changing to regmap_write_bits()
>> instead of adding the update-force property as in v1 should be fine.
>>
>> regards
>> Philipp
>>
> Hi Suman, Andrew,
> 
> Can you help to give some suggestions about this change.
> Is this can be changed to write unconditionally, or should I add a
> update-force property to force the write operation.

Sorry for the delay on this one, I have tested your latest v4, and everything is
functional on the TI SoCs. We do use the same register for asserting and
deasserting and is not self-clearing, and have additional non-reset related bits
in the register, so this change doesn't impact us. I have some minor
comments/questions that I will post on your v4.

Removing Andrew to not have the emails bounce.

regards
Suman

> 
> Best regards
> Crystal.
> 
>>> ---
>>>  drivers/reset/reset-ti-syscon.c | 15 +++++++++++++--
>>>  1 file changed, 13 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
>>> index 1c74bcb9a6c3..f4baf78afd14 100644
>>> --- a/drivers/reset/reset-ti-syscon.c
>>> +++ b/drivers/reset/reset-ti-syscon.c
>>> @@ -57,6 +57,7 @@ struct ti_syscon_reset_data {
>>>  	struct ti_syscon_reset_control *controls;
>>>  	unsigned int nr_controls;
>>>  	bool assert_deassert_together;
>>> +	bool update_force;
>>>  };
>>>  
>>>  #define to_ti_syscon_reset_data(rcdev)	\
>>> @@ -90,7 +91,10 @@ static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
>>>  	mask = BIT(control->assert_bit);
>>>  	value = (control->flags & ASSERT_SET) ? mask : 0x0;
>>>  
>>> -	return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
>>> +	if (data->update_force)
>>> +		return regmap_write_bits(data->regmap, control->assert_offset, mask, value);
>>> +	else
>>> +		return regmap_update_bits(data->regmap, control->assert_offset, mask, value);
>>>  }
>>>  
>>>  /**
>>> @@ -121,7 +125,10 @@ static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
>>>  	mask = BIT(control->deassert_bit);
>>>  	value = (control->flags & DEASSERT_SET) ? mask : 0x0;
>>>  
>>> -	return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
>>> +	if (data->update_force)
>>> +		return regmap_write_bits(data->regmap, control->deassert_offset, mask, value);
>>> +	else
>>> +		return regmap_update_bits(data->regmap, control->deassert_offset, mask, value);
>>>  }
>>>  
>>>  /**
>>> @@ -223,6 +230,10 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
>>>  		data->assert_deassert_together = true;
>>>  	else
>>>  		data->assert_deassert_together = false;
>>> +	if (of_property_read_bool(np, "update-force"))
>>> +		data->update_force = true;
>>> +	else
>>> +		data->update_force = false;
>>>  
>>>  	data->rcdev.ops = &ti_syscon_reset_ops;
>>>  	data->rcdev.owner = THIS_MODULE;
>>> -- 
>>> 2.18.0
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
