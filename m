Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E302C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 10:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNXOfJ0Sk+d6RapZSvtX+uRsExHzOwzIjWgDrU7EdWI=; b=yDaHBp3xoG4etKIuf2wz3HHOLp
	vU8k1QiNirDzTDjP1EofEtv4yqdnVDd5YavJBaR0kvLJLQalDLo+/N3BjHlcQYaF7KkeUTpNYGzzU
	v7dN9IfW60f99fRQp1MygW1ZFyDIIqbBZd5tmNorrJz5GCvYmF/EgnTVd68Ri0SrMi+Gl2uywR35q
	xeUf6EZxANdbU+ozLh09H4Voqs4IhRgHp1ucun/2oQTzWPVWobbam8vThwR7uNZbx+5u1gpEJyiwC
	vuXANoZnvf+VFhFHNwv7clsz+p1hyxU8ATeCeQv0Tf+I9CeXWGqwg5o9WuiMRYVXC+h/5vk7Z2D7s
	iyrLJ+jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsXS-00000000nGa-3CAL;
	Wed, 19 Jun 2024 10:27:38 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsXM-00000000nEU-41fP;
	Wed, 19 Jun 2024 10:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718792850;
	bh=Po6rLiiLYmVB2a4i9yoEDHQtVf1CvljI6wljwScnm/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kq8EXNUEhE6G5wgiCNTojlxDD0ITutYp3eNUlwYNjNrYROuZrSQn83dvBAwhSa5KF
	 nGsT2K20V+mL9JeixZ2gcpIdxgXGf8va3gsMwv46qFMC43VjzzJuZLP1aBH63+dima
	 u8zyjfnsuUmO5Kfsj8o8DyBayOE1IHEaNHvwTs8dl7nn2UddiLIDPlx/hJpXdygng7
	 Va9lvIFRRLz1RDpWUN3THDw4x5lOvwjM24PSq97K40nXIWbnay1zgnko1L9g9F1scU
	 y+J6boAX5/19xL/Ur5N8i11AJjCsnnjrarBPsmBcKu2FwcKjIkcUQUwkFFzuHQPd2t
	 WXDrIZpiGbJGQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B54A93780F7F;
	Wed, 19 Jun 2024 10:27:29 +0000 (UTC)
Message-ID: <c8ec67c6-a486-4665-b5ce-ea858116a8a2@collabora.com>
Date: Wed, 19 Jun 2024 12:27:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: mediatek: mtk-mutex: Add support for MT8188
 VPPSYS
To: Fei Shao <fshao@chromium.org>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, amergnat@baylibre.com, moudy.ho@mediatek.com,
 hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com,
 u.kleine-koenig@pengutronix.de, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20240322092845.381313-1-angelogioacchino.delregno@collabora.com>
 <20240322092845.381313-3-angelogioacchino.delregno@collabora.com>
 <CAC=S1niaYZ=NNTwfSrJPdj79uG_hmqGm=cz_Sis3Zrf9octsnw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAC=S1niaYZ=NNTwfSrJPdj79uG_hmqGm=cz_Sis3Zrf9octsnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_032733_218078_7F4B21F6 
X-CRM114-Status: GOOD (  18.93  )
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

Il 19/06/24 12:09, Fei Shao ha scritto:
> Hi Angelo,
> 
> On Fri, Mar 22, 2024 at 5:29 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add MT8188 VPPSYS0 and VPPSYS1 mutex info to driver data
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/soc/mediatek/mtk-mutex.c | 41 ++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
>> index 73c256d3950b..b5af1fb5847e 100644
>> --- a/drivers/soc/mediatek/mtk-mutex.c
>> +++ b/drivers/soc/mediatek/mtk-mutex.c
>> @@ -496,6 +496,39 @@ static const unsigned int mt8188_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>>          [DDP_COMPONENT_MERGE5] = MT8188_MUTEX_MOD_DISP1_VPP_MERGE4,
>>   };
>>
>> +static const unsigned int mt8188_mdp_mutex_table_mod[MUTEX_MOD_IDX_MAX] = {
>> +       [MUTEX_MOD_IDX_MDP_RDMA0] = MT8195_MUTEX_MOD_MDP_RDMA0,
>> +       [MUTEX_MOD_IDX_MDP_RDMA2] = MT8195_MUTEX_MOD_MDP_RDMA2,
>> +       [MUTEX_MOD_IDX_MDP_RDMA3] = MT8195_MUTEX_MOD_MDP_RDMA3,
>> +       [MUTEX_MOD_IDX_MDP_FG0] = MT8195_MUTEX_MOD_MDP_FG0,
>> +       [MUTEX_MOD_IDX_MDP_FG2] = MT8195_MUTEX_MOD_MDP_FG2,
>> +       [MUTEX_MOD_IDX_MDP_FG3] = MT8195_MUTEX_MOD_MDP_FG3,
>> +       [MUTEX_MOD_IDX_MDP_HDR0] = MT8195_MUTEX_MOD_MDP_HDR0,
>> +       [MUTEX_MOD_IDX_MDP_HDR2] = MT8195_MUTEX_MOD_MDP_HDR2,
>> +       [MUTEX_MOD_IDX_MDP_HDR3] = MT8195_MUTEX_MOD_MDP_HDR3,
>> +       [MUTEX_MOD_IDX_MDP_AAL0] = MT8195_MUTEX_MOD_MDP_AAL0,
>> +       [MUTEX_MOD_IDX_MDP_AAL2] = MT8195_MUTEX_MOD_MDP_AAL2,
>> +       [MUTEX_MOD_IDX_MDP_AAL3] = MT8195_MUTEX_MOD_MDP_AAL3,
>> +       [MUTEX_MOD_IDX_MDP_RSZ0] = MT8195_MUTEX_MOD_MDP_RSZ0,
>> +       [MUTEX_MOD_IDX_MDP_RSZ2] = MT8195_MUTEX_MOD_MDP_RSZ2,
>> +       [MUTEX_MOD_IDX_MDP_RSZ3] = MT8195_MUTEX_MOD_MDP_RSZ3,
>> +       [MUTEX_MOD_IDX_MDP_MERGE2] = MT8195_MUTEX_MOD_MDP_MERGE2,
>> +       [MUTEX_MOD_IDX_MDP_MERGE3] = MT8195_MUTEX_MOD_MDP_MERGE3,
>> +       [MUTEX_MOD_IDX_MDP_TDSHP0] = MT8195_MUTEX_MOD_MDP_TDSHP0,
>> +       [MUTEX_MOD_IDX_MDP_TDSHP2] = MT8195_MUTEX_MOD_MDP_TDSHP2,
>> +       [MUTEX_MOD_IDX_MDP_TDSHP3] = MT8195_MUTEX_MOD_MDP_TDSHP3,
>> +       [MUTEX_MOD_IDX_MDP_COLOR0] = MT8195_MUTEX_MOD_MDP_COLOR0,
>> +       [MUTEX_MOD_IDX_MDP_COLOR2] = MT8195_MUTEX_MOD_MDP_COLOR2,
>> +       [MUTEX_MOD_IDX_MDP_COLOR3] = MT8195_MUTEX_MOD_MDP_COLOR3,
>> +       [MUTEX_MOD_IDX_MDP_OVL0] = MT8195_MUTEX_MOD_MDP_OVL0,
>> +       [MUTEX_MOD_IDX_MDP_PAD0] = MT8195_MUTEX_MOD_MDP_PAD0,
>> +       [MUTEX_MOD_IDX_MDP_PAD2] = MT8195_MUTEX_MOD_MDP_PAD2,
>> +       [MUTEX_MOD_IDX_MDP_PAD3] = MT8195_MUTEX_MOD_MDP_PAD3,
> 
> I know it's too late since this is in the tree already, but I noticed
> that MDP_COMP_TCC0 is added in the 4th patch but not here.
> Is that expected?
> 

Many, many, many thanks for that. I missed TCC0 for real in the mutex mod
list for MT8188, even though it's present at bit 10.

I'll send a Fixes commit adding that bit in a jiffy.

Cheers,
Angelo

> Everything else looks nice, so just a record in the mailing list:
> Reviewed-by: Fei Shao <fshao@chromium.org>
> 
> Regards,
> Fei
> 
> 
>> +       [MUTEX_MOD_IDX_MDP_WROT0] = MT8195_MUTEX_MOD_MDP_WROT0,
>> +       [MUTEX_MOD_IDX_MDP_WROT2] = MT8195_MUTEX_MOD_MDP_WROT2,
>> +       [MUTEX_MOD_IDX_MDP_WROT3] = MT8195_MUTEX_MOD_MDP_WROT3,
>> +};
>> +
>>   static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>>          [DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
>>          [DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
>> @@ -735,6 +768,13 @@ static const struct mtk_mutex_data mt8188_mutex_driver_data = {
>>          .mutex_sof_reg = MT8183_MUTEX0_SOF0,
>>   };
>>
>> +static const struct mtk_mutex_data mt8188_vpp_mutex_driver_data = {
>> +       .mutex_sof = mt8188_mutex_sof,
>> +       .mutex_mod_reg = MT8183_MUTEX0_MOD0,
>> +       .mutex_sof_reg = MT8183_MUTEX0_SOF0,
>> +       .mutex_table_mod = mt8188_mdp_mutex_table_mod,
>> +};
>> +
>>   static const struct mtk_mutex_data mt8192_mutex_driver_data = {
>>          .mutex_mod = mt8192_mutex_mod,
>>          .mutex_sof = mt8183_mutex_sof,
>> @@ -1089,6 +1129,7 @@ static const struct of_device_id mutex_driver_dt_match[] = {
>>          { .compatible = "mediatek,mt8186-disp-mutex", .data = &mt8186_mutex_driver_data },
>>          { .compatible = "mediatek,mt8186-mdp3-mutex", .data = &mt8186_mdp_mutex_driver_data },
>>          { .compatible = "mediatek,mt8188-disp-mutex", .data = &mt8188_mutex_driver_data },
>> +       { .compatible = "mediatek,mt8188-vpp-mutex",  .data = &mt8188_vpp_mutex_driver_data },
>>          { .compatible = "mediatek,mt8192-disp-mutex", .data = &mt8192_mutex_driver_data },
>>          { .compatible = "mediatek,mt8195-disp-mutex", .data = &mt8195_mutex_driver_data },
>>          { .compatible = "mediatek,mt8195-vpp-mutex",  .data = &mt8195_vpp_mutex_driver_data },
>> --
>> 2.44.0
>>
>>



