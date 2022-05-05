Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC67C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQIar7kaXr75jar9l7KnBMY+38E1awkxaQNWDUy2dPk=; b=MT8P+RI6IgMB5B
	55bpfaTPCp01Il7+z8jKGS5j7qPOox+mOUakvvgT0BWZG4CFTWoe1AU1IQVIJ0duGrNlyza8SQjJ2
	NSUFQV2j+pd9J3Q3XR5+shJeZIyiD8u5ZKbeu+0NweFoOWRFetv3H42Z/qP2m3s9rrfFMO5z4fKdA
	SO5IilcoqLVnwC4EPK4GXY5qDGcGQMzPH/3GsdLkmvttsnMIUP9voFGD2d442DFCshnPK1ypNzCJI
	DmxQ4Mz6arXcBRk9qhk3RHBUfKa4Bpsqn2cEcsNcjVai3P0x3c/Af1z0p7dKI1zepTjNlOEuRvstX
	+g23f4O7MBv7zEkNro9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmaZC-00FnxO-1J; Thu, 05 May 2022 12:26:46 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmaZA-00FnvE-7E
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 12:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bxhplObq1dgPCl9SBs+XRfgFIWsy41N7X9TE2jdN/04=; b=P3RM3x1ZYtolI635ErGpNPQW9G
 53tVRiX1GoD1wXHMHQFdJMVebi3sAlTqY8c04vxjzmFXZS8s3H5HGCWuc+CV52DO4Mxij2OZY2T+P
 MIGvRMB4s1B99xjoIy+PHC9teHB9QinK8eqKAux7cHA69s/t+4LB3ydpOJT12ZwUoWWg=;
Received: from p200300daa70ef200412f484bca3869cd.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:412f:484b:ca38:69cd] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nmaYx-000180-1O; Thu, 05 May 2022 14:26:31 +0200
Message-ID: <95289bf7-005f-acb7-e45f-a8ea284ef160@nbd.name>
Date: Thu, 5 May 2022 14:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 3/4] mt76: mt7915: reject duplicated twt flows
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: Ryder Lee <ryder.Lee@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220505082554.16656-1-chui-hao.chiu@mediatek.com>
 <20220505082554.16656-3-chui-hao.chiu@mediatek.com>
 <YnPBaw1d3nA791PP@lore-desk>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <YnPBaw1d3nA791PP@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_052644_472837_2A98325F 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 05.05.22 14:22, Lorenzo Bianconi wrote:
>> Reject twt flows with the same parameters to prevent some potential issues
>> causing by duplicated establishment.
>> 
>> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
>> Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
>> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
>> ---
>>  .../net/wireless/mediatek/mt76/mt7915/mac.c   | 31 +++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>> 
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
>> index 94a1871fbf43..ff60a3d2d26d 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
>> @@ -2601,6 +2601,34 @@ static int mt7915_mac_check_twt_req(struct ieee80211_twt_setup *twt)
>>  	return 0;
>>  }
>>  
>> +static inline bool
>> +mt7915_mac_twt_param_equal(struct mt7915_sta *msta,
>> +			   struct ieee80211_twt_params *twt_agrt)
> 
> nit: please do not use inline in .c files.
I applied the patch already, so I folded in a fix for this.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
