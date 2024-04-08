Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F3BC67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 18:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uODaAsGcejErYuW1YygJ3cxSc6qnAISZuPiqVvd2Fxk=; b=r2MKRNYAb1Eo0s7TSrtJzsNyvi
	cFZLmrl7X7Dz/5k7+pBE+SRCwn9lbqfT8fup17sCbEPyf6fIqNbSdg+pMP1UK3K6qBTyxO8DoeUrT
	v9sz8154hHesCakcnJvW3aPz4oR+w3yl/XLJO8YPVsaV3nRGQ/y4Uj+R4sGQQUpoRZoBJnnrpXUDa
	sEoWyh2d5FEJnM5EqD8mQ/Z6beRvTWt+cGy7iajwxH4iQ1kJUdNdCZNbaCIv3x67Nv3kvhp74PCIJ
	H2SphCtTmZDHwmw7jKEYkZMh29nIWLkxXoVK9GKsUvXm2WGKxYaVLdNU7/wuHFPvF4LMxnDbIaX/R
	5LvD/qPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rttwR-0000000GWUN-3G95;
	Mon, 08 Apr 2024 18:42:03 +0000
Received: from out-17.smtpout.orange.fr ([193.252.22.17] helo=out.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rttw0-0000000GWLz-06Be;
	Mon, 08 Apr 2024 18:41:51 +0000
Received: from [192.168.1.18] ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id ttvHraeeh8kwettvqrxLFy; Mon, 08 Apr 2024 20:41:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1712601689;
	bh=uODaAsGcejErYuW1YygJ3cxSc6qnAISZuPiqVvd2Fxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=B65DQIQoh++9ClW+m9OS7AvA+W5nnU8YNdGLOzf90gDeJpzJIH1p8rDandXiTXb82
	 RJX7TfgHHeFsQnilRsDh8IA6uxZrmx7exkET3nebzDGuTuCeJaiPceXVD+nZAM9d4X
	 vgD9LwUJHGMvME/h49yuS+L7faj5zuEKE7lAQoOn6hMIWCsMfzvDeE2WnmVAR/jPeJ
	 669E2dZc0eyMq1ERcIEwPnRFtAh5LT32pHa0Hl1LBq/3SU2ubwhCdDzacg8qgWjeag
	 ASS7M5nckPusI7uTkvL2fHApeeoxZnLwwingI9z8RPJkNsRfCwe3BqzvYaVaCCsO57
	 /6MYHLvVJXsJQ==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 08 Apr 2024 20:41:29 +0200
X-ME-IP: 86.243.17.157
Message-ID: <4ebbe227-38b1-4a1c-af34-9ba7bdfecad5@wanadoo.fr>
Date: Mon, 8 Apr 2024 20:41:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal/drivers/mediatek/lvts_thermal: Improve some
 memory allocation
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <42a87fb9837f1760d1ad4eb7162a7536785dc6f5.1712520052.git.christophe.jaillet@wanadoo.fr>
 <8cb69f245311a348164b0b5ca3dbc59386746035.1712520052.git.christophe.jaillet@wanadoo.fr>
 <d97f2a57-d318-455b-a860-8bd7972c8aaf@moroto.mountain>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <d97f2a57-d318-455b-a860-8bd7972c8aaf@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_114137_026233_25E4B67F 
X-CRM114-Status: GOOD (  20.07  )
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

Le 08/04/2024 à 10:09, Dan Carpenter a écrit :
> On Sun, Apr 07, 2024 at 10:01:49PM +0200, Christophe JAILLET wrote:
>> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
>> index 3003dc350766..b133f731c5ba 100644
>> --- a/drivers/thermal/mediatek/lvts_thermal.c
>> +++ b/drivers/thermal/mediatek/lvts_thermal.c
>> @@ -204,7 +204,7 @@ static const struct debugfs_reg32 lvts_regs[] = {
>>   
>>   static int lvts_debugfs_init(struct device *dev, struct lvts_domain *lvts_td)
>>   {
>> -	struct debugfs_regset32 *regset;
>> +	struct debugfs_regset32 *regsets;
>>   	struct lvts_ctrl *lvts_ctrl;
>>   	struct dentry *dentry;
>>   	char name[64];
>> @@ -214,8 +214,14 @@ static int lvts_debugfs_init(struct device *dev, struct lvts_domain *lvts_td)
>>   	if (IS_ERR(lvts_td->dom_dentry))
>>   		return 0;
>>   
>> +	regsets = devm_kcalloc(dev, lvts_td->num_lvts_ctrl,
>> +			       sizeof(*regsets), GFP_KERNEL);
>> +	if (!regsets)
>> +		return 0;
> 
> I understand that this preserved the behavior from the original code,
> but the original code was wrong.  This should return -ENOMEM.

Hi Dan,
I don't agree.

For me, this memory allocation is of the same type as all debugfs 
functions that we ignore the error code.

If it fails, it is not a reason good enough to have the probe fail. 
(anyway, if we are short on memory at this point other errors will 
likely occur)

> 
>> +
>>   	for (i = 0; i < lvts_td->num_lvts_ctrl; i++) {
>>   
>> +		struct debugfs_regset32 *regset = &regsets[i];
>>   		lvts_ctrl = &lvts_td->lvts_ctrl[i];
> 
> The blank line should come after the declaration.

The blank line was already there, and in this file, it looks like the 
preferred style (even if not completely consistent)

Let see if there is some comment about 0 or -ENOMEM in case of memory 
allocation error, and if needed, I'll repost without the blank line.

This patch being a really tiny tiny tiny improvement (IMHO), so it may 
also just be ignored.


CJ

> 
> regards,
> dan carpenter
> 
> 
> 


