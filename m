Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0F6C5478C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXpm3Lxsa/EON1LdUGUiNzJoZa+2X4P6JE4uKIIns20=; b=bpA2SlszzsJVmg3B5bCNCzoYTo
	b7WZjpoOA5j2PEhxR1ggG2d+ls/s/udOuny2fMTdkCvx/ATWIx8xpNhiNaPMUNrp9LiHIVfVXhmrY
	8ug63nwvro9n1tcd24bKFoeGpuB2QPyzfKK+2KGks1mwwHJrKNbnm1MfM5fTwUD0Dfne1AFcdKSpB
	8ElLXfymho/7tivAa1HzhG3z3QFfnyANWedjADbV/U9eYa0zWliE9paMzYtuVVjOgWv2LTqTL8am+
	HdQBlx1ay7ZnuQ51Y+PBYU0o+NZTiGDveeVbF7BM4W2wMcardfka0rduF8vVjuF5a5L2FOaFxzeIS
	r8jeUWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzJP-0000000HCGz-0G0g;
	Fri, 01 Mar 2024 09:36:15 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzJL-0000000HCFY-3kG3;
	Fri, 01 Mar 2024 09:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709285770;
	bh=Gmf0uAuSVCHCNz8dYID/8N8Eng78uQAJL21zEESINHQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ig46G8V0pkgNPXWHGVJB/JcKf0H593/uLUmsUXQHbWjQx4kF5UVwVCYRuSoK2aOdw
	 BP3PDLMyaGt+zv3W7kFW1FMQSsNolK0+DaQ4EG4RRDTAJnkA28kNFcs/Utre/aP0eK
	 q+RDgJWxv+p1RjN5fwX5tad13FyU54e2tPc5j+iwYEI5FJUCEjWMO8I5wS+jAD79rG
	 NOn7t+DvE0GrKqvqoFxYDp22QBfde1KIDbxhIJ77KEz1887NulmfZIgyvACmGBGzVU
	 y+DmCWHqEOzCv+QJT68pdrrbES/pVEyoycyNuP2AIWR42ajqEP97BUhealuWYyeiF0
	 aIbd4jGPtJgGg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6783B37810CD;
	Fri,  1 Mar 2024 09:36:09 +0000 (UTC)
Message-ID: <7de218a7-680f-40a8-a002-d6a2c87f53ee@collabora.com>
Date: Fri, 1 Mar 2024 10:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mediatek: vcodec: support 36bit physical address
Content-Language: en-US
To: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 "nhebert@chromium.org" <nhebert@chromium.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
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
References: <20240301020126.11539-1-yunfei.dong@mediatek.com>
 <ea7f25bf-2294-4ad4-bc18-226827d49ae8@collabora.com>
 <c1f489c474e3d00ff8573225c5d282df4d82f9e1.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <c1f489c474e3d00ff8573225c5d282df4d82f9e1.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_013612_093171_47FE4D0D 
X-CRM114-Status: GOOD (  18.70  )
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

Il 01/03/24 10:23, Yunfei Dong (董云飞) ha scritto:
> Hi AngeloGioacchino,
> 
> Thanks for you reviewing.
> On Fri, 2024-03-01 at 10:03 +0100, AngeloGioacchino Del Regno wrote:
>> Il 01/03/24 03:01, Yunfei Dong ha scritto:
>>> The physical address is beyond 32bit for mt8188 platform, need
>>> to change the type from unsigned int to unsigned long in case of
>>> the high bit missing.
>>>
>>> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>>> ---
>>>    .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        | 4
>>> ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git
>>> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_
>>> lat_if.c
>>> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_
>>> lat_if.c
>>> index cf48d09b78d7..85df3e7c2983 100644
>>> ---
>>> a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_
>>> lat_if.c
>>> +++
>>> b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_
>>> lat_if.c
>>> @@ -1074,7 +1074,7 @@ static int
>>> vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance
>>> *inst
>>>    	unsigned int mi_row;
>>>    	unsigned int mi_col;
>>>    	unsigned int offset;
>>> -	unsigned int pa;
>>> +	unsigned long pa;
>>
>> If you used the right type from the beginning, you wouldn't have to
>> fix that ;-)
>>
> Yes, you are right, thanks for your remind.
>> Is there any reason why you didn't - and still don't use the
>> `phys_addr_t` type
>> for the `pa` member?
>>
> pa is also iova, dma address. Change it to dma_addr_t looks much
> better.
> 

Ok, dma_addr_t looks good as well.

Cheers!

> I will change it in next patch.
>> Cheers,
>> Angelo
>>
> Best Regards,
> Yunfei Dong
>>>    	unsigned int size;
>>>    	struct vdec_vp9_slice_tiles *tiles;
>>>    	unsigned char *pos;
>>> @@ -1109,7 +1109,7 @@ static int
>>> vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance
>>> *inst
>>>    	pos = va + offset;
>>>    	end = va + bs->size;
>>>    	/* truncated */
>>> -	pa = (unsigned int)bs->dma_addr + offset;
>>> +	pa = (unsigned long)bs->dma_addr + offset;
>>>    	tb = instance->tile.va;
>>>    	for (i = 0; i < rows; i++) {
>>>    		for (j = 0; j < cols; j++) {
>>
>>


