Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E1EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 08:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6x79cyqMeUqgncuVR2a4oMn8UE4CTl339HsUNe/4K08=; b=gHJJyiy7iqbeE/
	r5hAZ8P0fZpdj0HknyIjHW6MTAjotvWArtlo96F2Y29SAyZqjvOvP0GhtrVku5+EW1app+2DijN4R
	mUFgrlMgwc44kjCQbnNzYQwUuW1ziduJpQYT6Ew3N6EEJ7qA94JLUikD+z/dkGhAoDFhuXZfWx3ct
	TooQCRP1d8BMtjyxCDiD5yiBMJdeevfztXAULsdz1A/FSQaiN5BSfVxEMLqLjjJ55rNusiXhTxwLX
	kVS9Omiempm8n208oikrhi9PHCs9Uo9MPfPmPcwPa8Q/CZlR8vEsOzg3Q/P9EB3BNjU/2OPkb8VEw
	LbPOx02wITm6lRas98tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njcgd-000UCZ-6o; Wed, 27 Apr 2022 08:06:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njcgM-000U5w-8r; Wed, 27 Apr 2022 08:05:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 540FFB824AA;
 Wed, 27 Apr 2022 08:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18AC4C385A7;
 Wed, 27 Apr 2022 08:05:48 +0000 (UTC)
Message-ID: <06c5c170-f39c-cd8e-4aa6-5fde56bfa09b@xs4all.nl>
Date: Wed, 27 Apr 2022 10:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] media: mtk-mdp: make mtk_mdp_comp_init static
Content-Language: en-US
To: houlong wei <houlong.wei@mediatek.com>,
 Eizan Miyamoto <eizan@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
 =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
 <Andrew-CT.Chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?B?TWluZ2hzaXUgVHNhaSAo6JSh5piO5L+uKQ==?=
 <Minghsiu.Tsai@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <20210811171512.1.I4a34d99ace27ad2fe55e22c90244d3bba2c29bab@changeid>
 <484e199d23a09d79f121ea37eb9e7d95eabfd886.camel@mediatek.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <484e199d23a09d79f121ea37eb9e7d95eabfd886.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_010554_490753_802E2629 
X-CRM114-Status: GOOD (  20.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

Since the patch series this depends on hasn't been accepted (and using
the components framework is highly controversial in the media subsystem
anyway), I'm marking this (just as the patch series itself) as
'Changes Requested' in the media patchwork. If you want to continue
with this, then this patch should be folded into a v8.

Regards,

	Hans

On 16/08/2021 06:26, houlong wei wrote:
> On Wed, 2021-08-11 at 15:15 +0800, Eizan Miyamoto wrote:
>> This function isn't and doesn't need to be used outside of
>> mtk_mdp_comp.c
>>
>> This patch depends on and is a follow-up to
>>
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=524929
>>
>> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
>> ---
> 
> Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
> 
>>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 2 +-
>>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 2 --
>>  2 files changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
>> b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
>> index 9527649de98e..2cf8f1864f8c 100644
>> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
>> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
>> @@ -234,7 +234,7 @@ static const struct component_ops
>> mtk_mdp_component_ops = {
>>  	.unbind = mtk_mdp_comp_unbind,
>>  };
>>  
>> -int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
>> +static int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct
>> device *dev)
>>  {
>>  	struct device_node *larb_node;
>>  	struct platform_device *larb_pdev;
>> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
>> b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
>> index e3d6aef52869..aa6442cc8c1d 100644
>> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
>> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
>> @@ -21,8 +21,6 @@ struct mtk_mdp_comp {
>>  	struct device		*larb_dev;
>>  };
>>  
>> -int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device
>> *dev);
>> -
>>  int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
>>  int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
>>  
>> -- 
>> 2.32.0.605.g8dce9f2422-goog
>>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
