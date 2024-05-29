Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE42C27C43
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 13:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5SCwcaI1yB4vAhPMDaiNOgfeEBRhhXW8MbfTI9gKG+4=; b=4dvAlvJ0mfF5IAxpU3bYMLr512
	8ALBiM2kiJGrfUx0+/PiK+tgLgoxZMXz+fwIyV6i1yBzIDOQErmoUSbHcVyI6wpZn6jJp8CT5KrfH
	mxLgHSTo7b7ChuITr+D/8z3tpjCISuZD+RZf+qRH44VZmsgSEvDq6bNTROSQYBOpF85i6QXmYKiTU
	FkNURgLwtoumDnNSzcoZxcgQWf+aEYYNCP0ENr4yAV0epzBmNDfSm7Uvmr5XroVFtTaGzDe7OoHRZ
	UR2cCmEEvK+hArNSFVJKLdxdYEch3EdlAExpXzscoHRFlgugqxplSIxnHV5xZ0R2eVx+kYb48AgcV
	psJAhhzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCJ8n-00000004Dp3-1oEU;
	Wed, 29 May 2024 13:14:53 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCJ8N-00000004DcJ-3BHx;
	Wed, 29 May 2024 13:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716988462;
	bh=DHUO90PUPhlMJ3B+9LiJkV1K2D77bjBIutGq+bUUtz4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cw6Jd7fHS8GjpN9WNQ9abAufl1Zgwyndm8aJDcc0mYCCJHPbcDPU78u+hCucvxDSY
	 UuUcvR7Z/XnpiviS9esGpR2ppZhmT1GuURxOm0JxsV6CyfxnN0fTQ295HbpFApHVMn
	 /fFWBIWezuhTpAzL6uR9/j78oaPfGzcUMyX7At1AOi1iHRKf7KOXz51SBxqO7FTt/5
	 Zx7qZ+LqRGbNhmzRXYcpSyOe3VHiyCQaHY6lm8KmpORNlYeD9eN1DRmabvaiZcnGKo
	 9Thv4w6N9xiKisfM1Zu5Ax/HlyWJmGr5VKohI2m+4Gn34obcVbqH9eu7BxcPMxD54e
	 LrjCUgo6LK6HQ==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CE9033782087;
	Wed, 29 May 2024 13:14:21 +0000 (UTC)
Message-ID: <8a007787-c648-4ae3-829f-7a0b17dd9a89@collabora.com>
Date: Wed, 29 May 2024 15:14:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: mediatek: vcodec: fix h264 multi statless
 decoder smatch warning
To: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 "nhebert@chromium.org" <nhebert@chromium.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>,
 "stevecho@chromium.org" <stevecho@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20240229095611.6698-1-yunfei.dong@mediatek.com>
 <20240229095611.6698-2-yunfei.dong@mediatek.com>
 <4949bd54-8c32-4490-ab19-d38796d29ac1@collabora.com>
 <9ba79ccf849054974a937d1d605910cf4c8552d6.camel@mediatek.com>
Content-Language: en-US
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
In-Reply-To: <9ba79ccf849054974a937d1d605910cf4c8552d6.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_061428_176530_33991891 
X-CRM114-Status: GOOD (  17.43  )
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

Hi,

W dniu 3.04.2024 o 05:45, Yunfei Dong (董云飞) pisze:
> Hi AngeloGioacchino,
> 
> Thanks for your reviewing.
> On Tue, 2024-04-02 at 11:50 +0200, AngeloGioacchino Del Regno wrote:
>> Il 29/02/24 10:56, Yunfei Dong ha scritto:
>>> Fix smatch static checker warning for vdec_h264_req_multi_if.c.
>>> Leading to kernel crash when fb is NULL.
>>>
>>> Fixes: 397edc703a10 ("media: mediatek: vcodec: add h264 decoder")
>>> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>>> ---
>>>    .../vcodec/decoder/vdec/vdec_h264_req_multi_if.c         | 9
>>> +++++++--
>>>    1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git
>>> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req
>>> _multi_if.c
>>> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req
>>> _multi_if.c
>>> index 0e741e0dc8ba..ab8e708e0df1 100644
>>> ---
>>> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req
>>> _multi_if.c
>>> +++
>>> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req
>>> _multi_if.c
>>> @@ -724,11 +724,16 @@ static int vdec_h264_slice_single_decode(void
>>> *h_vdec, struct mtk_vcodec_mem *bs
>>>    		return vpu_dec_reset(vpu);
>>>    
>>>    	fb = inst->ctx->dev->vdec_pdata->get_cap_buffer(inst->ctx);
>>> +	if (!fb) {
>>> +		mtk_vdec_err(inst->ctx, "fb buffer is NULL");
>>> +		return -EBUSY;
>>> +	}
>>> +
>>>    	src_buf_info = container_of(bs, struct mtk_video_dec_buf,
>>> bs_buffer);
>>>    	dst_buf_info = container_of(fb, struct mtk_video_dec_buf,
>>> frame_buffer);
>>>    
>>> -	y_fb_dma = fb ? (u64)fb->base_y.dma_addr : 0;
>>> -	c_fb_dma = fb ? (u64)fb->base_c.dma_addr : 0;
>>
>> You're changing the behavior here, can you please explain why this
>> change is valid
>> into the commit description?
>>
> The driver already add the condition to check whether fb is NULL at the
> front, no need these two lines again.
> 

Maybe Angelo refers to the function never returning -EBUSY before?
While at it, if fb is a kind of a buffer, why not -ENOMEM
when get_cap_buffer() fails?

Regards,

Andrzej

>> Thanks,
>> Angelo
>>
> Best Regards,
> Yunfei Dong
>>> +	y_fb_dma = (u64)fb->base_y.dma_addr;
>>> +	c_fb_dma = (u64)fb->base_c.dma_addr;
>>>    	mtk_vdec_debug(inst->ctx, "[h264-dec] [%d] y_dma=%llx
>>> c_dma=%llx",
>>>    		       inst->ctx->decoded_frame_cnt, y_fb_dma,
>>> c_fb_dma);
>>>    
>>
>>
>>


