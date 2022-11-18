Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63A7C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 12:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qL0MWfk0whbJBdZgcjuWJByj5YAKiFsWU1H3uPv0QrY=; b=kDm2btelwAlp8rFzTilaUYKO6W
	pxgqycGnUTNIXCxMNt1NiiPAF7cMZblm98zvFitNFpJwea3BQNppqM61oU9LSVl7heQdAmkVkxn0p
	Bl7/Oy+0qGSzHwiLOdhQM7xxzoXapXO8rs0IcfDo5n/0JuUNZpy6PRsZhWWgEz5wx0YkdXMaYaRS7
	DxEl9tmUCgvLe9+JOIQDF4eYmQPgazeoQI7IOFAuPbbPfJm3DNdJxqxcvW+kMa5AH4kRaACbzw/Bi
	AOeObMtm+Ddbn4cVK2TpiZ+xQrUsa2HGl6ZdPmNf2358NMbwO1Tjm5rO0mLwAdNaFoT1Q8vXc3DTG
	Mkitw8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow0SD-003sLg-Lc; Fri, 18 Nov 2022 12:26:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow0S1-003sIV-NP; Fri, 18 Nov 2022 12:26:35 +0000
Received: from [192.168.15.130] (unknown [194.152.46.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ABEF96602AB2;
	Fri, 18 Nov 2022 12:26:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668774388;
	bh=j00aZO+NDvxxNv4Ex5q1J/k6GVW5ZjtAsEcGyBIHILI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=XvGN1rr80SkGZAX41h1EW5AQp/607Z4LBayXwxrsqjLq3fFJRCAzUCQhWEbOh5LqB
	 41iQMd56+70Ria0SVmZgI5nmuIRHdiuS25l3GhW/fUG6BlJkTxhq+yVYlVx1DvMJ/G
	 iiYnpRhcbEgmiFfBs7oSp6hUux5nML+DTWrQPBH9034LNSEaiU9PeKbolyCeMkq4I+
	 1hSKvku6osLUPK760X8GD6acGejQa3AakDoNNc6DNDVQxiYxFgMWsiTOpokEYh5XRT
	 Fb8iyAsIR/2/Y2PdVsC38pdikcIWIolD27LAEAlAxmuFgjGLYG5LUaDh3yKyJ3oQhO
	 Bo6YV2enLcirQ==
Message-ID: <64f08478-16a7-1d33-e520-9f0fbcab47b9@collabora.com>
Date: Fri, 18 Nov 2022 13:26:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v6] media: mediatek: vcodec: support stateless AV1
 decoder
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221117061742.29702-1-xiaoyong.lu@mediatek.com>
 <0672e801-1489-f222-2143-e0e7317d7eaf@collabora.com>
In-Reply-To: <0672e801-1489-f222-2143-e0e7317d7eaf@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_042634_118780_5B02F855 
X-CRM114-Status: GOOD (  22.86  )
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

Hi again,

W dniu 17.11.2022 o 13:42, Andrzej Pietrasiewicz pisze:
> Hi Xiaoyong Lu,
> 
> Sorry about chiming in only at v6. Please see inline below.
> 
> Andrzej
> 
> W dniu 17.11.2022 o 07:17, Xiaoyong Lu pisze:
>> Add mediatek av1 decoder linux driver which use the stateless API in
>> MT8195.
>>
>> Signed-off-by: Xiaoyong Lu<xiaoyong.lu@mediatek.com>
>> ---
>> Changes from v5:
>>
>> - change av1 PROFILE and LEVEL cfg
>> - test by av1 fluster, result is 173/239
>>
>> Changes from v4:
>>
>> - convert vb2_find_timestamp to vb2_find_buffer
>> - test by av1 fluster, result is 173/239
>>
>> Changes from v3:
>>
>> - modify comment for struct vdec_av1_slice_slot
>> - add define SEG_LVL_ALT_Q
>> - change use_lr/use_chroma_lr parse from av1 spec
>> - use ARRAY_SIZE to replace size for loop_filter_level and 
>> loop_filter_mode_deltas
>> - change array size of loop_filter_mode_deltas from 4 to 2
>> - add define SECONDARY_FILTER_STRENGTH_NUM_BITS
>> - change some hex values from upper case to lower case
>> - change *dpb_sz equal to V4L2_AV1_TOTAL_REFS_PER_FRAME + 1
>> - test by av1 fluster, result is 173/239
>>
>> Changes from v2:
>>
>> - Match with av1 uapi v3 modify
>> - test by av1 fluster, result is 173/239
>>
>> ---
>> Reference series:
>> [1]: v3 of this series is presend by Daniel Almeida.
>>       message-id: 20220825225312.564619-1-daniel.almeida@collabora.com
>>
>>   .../media/platform/mediatek/vcodec/Makefile   |    1 +
>>   .../vcodec/mtk_vcodec_dec_stateless.c         |   47 +-
>>   .../platform/mediatek/vcodec/mtk_vcodec_drv.h |    1 +
>>   .../vcodec/vdec/vdec_av1_req_lat_if.c         | 2234 +++++++++++++++++
>>   .../platform/mediatek/vcodec/vdec_drv_if.c    |    4 +
>>   .../platform/mediatek/vcodec/vdec_drv_if.h    |    1 +
>>   .../platform/mediatek/vcodec/vdec_msg_queue.c |   27 +
>>   .../platform/mediatek/vcodec/vdec_msg_queue.h |    4 +
>>   8 files changed, 2318 insertions(+), 1 deletion(-)
>>   create mode 100644 
>> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
>>

<snip>

>> +
>> +static void *vdec_av1_get_ctrl_ptr(struct mtk_vcodec_ctx *ctx, int id)
>> +{
>> +    struct v4l2_ctrl *ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl, id);
>> +
>> +    if (!ctrl)
>> +        return ERR_PTR(-EINVAL);
>> +
>> +    return ctrl->p_cur.p;
>> +}
> 
> I see we keep repeating this kind of a v4l2_ctrl_find() wrapper in drivers.
> The only reason this code cannot be factored out is the "context" struct pointer
> pointing at structs of different types. Maybe we could
> 
> #define v4l2_get_ctrl_ptr(ctx, member, id) \
>      __v4l2_get_ctrl_ptr((ctx), offsetof(typeof(*ctx), (member)), (id))
> 
> void *__v4l2_get_ctrl_ptr(void *ctx, size_t offset, u32 id)
> {
>      struct v4l2_ctrl_handler *hdl = (struct v4l2_ctrl_handler *)(ctx + offset);
>      struct v4l2_ctrl *ctrl = v4l2_ctrl_find(hdl, id);
> 
>      if (!ctrl)
>          return ERR_PTR(-EINVAL);
> 
>      return ctrl->p_cur.p;
> }
> 
> and reuse v4l2_get_ctrl_ptr() in drivers?
> 
> A similar kind of void* arithmetic happens in container_of, only with '-'.
> 

When I think of it it seems a bit over-engineered to me now, it would
be better to give up the macro and simply pass struct v4l2_ctrl_handler *hdl.

Another second thought is that including such a wrapper in this patch
would make it too noisy if all potential users were to be updated.
A separate series would make more sense.

Regards,

Andrzej


