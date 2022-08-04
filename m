Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548E7C19F29
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 02:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6h8M1A1G7Y+QL85kji3FNJLQMA3EuQxaas20Zx7PelU=; b=0Qi+MXpb0B/x+7m0tmhGPbxZmk
	Cvn+6saeAFovGJovQDCcQx0YSoNPj0mXfBz80s/n+2ihL6zGMzQP/z04HiuHRWf1EyqihufwrZ2C2
	iA4k8v1k7Q1EoJ0UXqu7Ay9jt7aHae434gnk9bu8aDIuItzpiCxyYTotlFQtPipAo9VIuJuGrnTEv
	DltqmB8BMFwY7AxiI6f7lvbxZQEd79IYqFQgJa2QkqjzbmT4dXfAWSHjU8PAoaXxcN6zrxgLVYKqW
	7ECv3LVWbk8ujdDaD9t6nFdooJ2kqlvkbtg3GFl16hCKehz79sEZ9SorhYWd8PaZWkO1fjIf9BMD7
	wIou1huQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJQyu-00EpEa-JS; Thu, 04 Aug 2022 02:53:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJQyb-00Eok2-Cb; Thu, 04 Aug 2022 02:52:47 +0000
X-UUID: a4041779cd2b45c98d3737a4276e37b1-20220803
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:e9fbf282-93bf-4900-869a-73f77628ec91,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:58712dd1-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a4041779cd2b45c98d3737a4276e37b1-20220803
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1649573447; Wed, 03 Aug 2022 19:52:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 10:42:06 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Aug 2022 10:42:06 +0800
Subject: Re: [PATCH] usb: typec: altmodes/displayport: correct pin assignment
 for UFP receptacles
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Mediatek WSD Upstream
	<wsd_upstream@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	<stable@vger.kernel.org>
References: <20220727110503.5260-1-macpaul.lin@mediatek.com>
 <YujSNEGm2ikg3j8a@kuha.fi.intel.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
Message-ID: <09f8d925-7d11-d101-8a12-8df858e74057@mediatek.com>
Date: Thu, 4 Aug 2022 10:42:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YujSNEGm2ikg3j8a@kuha.fi.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_195245_484636_0B981975 
X-CRM114-Status: GOOD (  26.09  )
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

On 8/2/22 3:28 PM, Heikki Krogerus wrote:
> Hi guys,
> 
> On Wed, Jul 27, 2022 at 07:05:03PM +0800, Macpaul Lin wrote:
>> From: Pablo Sun <pablo.sun@mediatek.com>
>>
>> From: Pablo Sun <pablo.sun@mediatek.com>
> 
> Looks like there's something wrong with the formating of the patch
> here?

The duplicated line will be removed in patch v2.

>> Fix incorrect pin assignment values when connecting to a monitor with
>> Type-C receptacle instead of a plug.
>>
>> According to specification, an UFP_D receptacle's pin assignment
>> should came from the UFP_D pin assignments field (bit 23:16), while
>> an UFP_D plug's assignments are described in the DFP_D pin assignments
>> (bit 15:8) during Mode Discovery.
>>
>> For example the LG 27 UL850-W is a monitor with Type-C receptacle.
>> The monitor responds to MODE DISCOVERY command with following
>> DisplayPort Capability flag:
>>
>>          dp->alt->vdo=0x140045
>>
>> The existing logic only take cares of UPF_D plug case,
>> and would take the bit 15:8 for this 0x140045 case.
>>
>> This results in an non-existing pin assignment 0x0 in
>> dp_altmode_configure.
>>
>> To fix this problem a new set of macros are introduced
>> to take plug/receptacle differences into consideration.
>>
>> Co-developed-by: Pablo Sun <pablo.sun@mediatek.com>
>> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
>> Co-developed-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>
>> Cc: stable@vger.kernel.org
> 
> If this is a fix, then you need to have the "Fixes" tag that tells
> which commit the patch is fixing.

Thanks for the review.
Will add "Fixes" tag and "Reviewed-by" tags in patch v2.

>> ---
>>   drivers/usb/typec/altmodes/displayport.c | 4 ++--
>>   include/linux/usb/typec_dp.h             | 5 +++++
>>   2 files changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
>> index 9360ca177c7d..8dd0e505ef99 100644
>> --- a/drivers/usb/typec/altmodes/displayport.c
>> +++ b/drivers/usb/typec/altmodes/displayport.c
>> @@ -98,8 +98,8 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
>>   	case DP_STATUS_CON_UFP_D:
>>   	case DP_STATUS_CON_BOTH: /* NOTE: First acting as DP source */
>>   		conf |= DP_CONF_UFP_U_AS_UFP_D;
>> -		pin_assign = DP_CAP_DFP_D_PIN_ASSIGN(dp->alt->vdo) &
>> -			     DP_CAP_UFP_D_PIN_ASSIGN(dp->port->vdo);
>> +		pin_assign = DP_CAP_PIN_ASSIGN_UFP_D(dp->alt->vdo) &
>> +				 DP_CAP_PIN_ASSIGN_DFP_D(dp->port->vdo);
>>   		break;
>>   	default:
>>   		break;
>> diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
>> index cfb916cccd31..8d09c2f0a9b8 100644
>> --- a/include/linux/usb/typec_dp.h
>> +++ b/include/linux/usb/typec_dp.h
>> @@ -73,6 +73,11 @@ enum {
>>   #define DP_CAP_USB			BIT(7)
>>   #define DP_CAP_DFP_D_PIN_ASSIGN(_cap_)	(((_cap_) & GENMASK(15, 8)) >> 8)
>>   #define DP_CAP_UFP_D_PIN_ASSIGN(_cap_)	(((_cap_) & GENMASK(23, 16)) >> 16)
>> +/* Get pin assignment taking plug & receptacle into consideration */
>> +#define DP_CAP_PIN_ASSIGN_UFP_D(_cap_) ((_cap_ & DP_CAP_RECEPTACLE) ? \
>> +			DP_CAP_UFP_D_PIN_ASSIGN(_cap_) : DP_CAP_DFP_D_PIN_ASSIGN(_cap_))
>> +#define DP_CAP_PIN_ASSIGN_DFP_D(_cap_) ((_cap_ & DP_CAP_RECEPTACLE) ? \
>> +			DP_CAP_DFP_D_PIN_ASSIGN(_cap_) : DP_CAP_UFP_D_PIN_ASSIGN(_cap_))
>>   
>>   /* DisplayPort Status Update VDO bits */
>>   #define DP_STATUS_CONNECTION(_status_)	((_status_) & 3)
>> -- 
>> 2.18.0
> 
> thanks,
> 

Thanks.
Macpaul Lin

