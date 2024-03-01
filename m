Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7603AC5478C
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bs+bGHzHMYL/338SX/K5MzlkAEy0y9kD3aqdeFvqn+o=; b=isFiJB73NrJv3zPZUJq+PWqxYl
	FVqv805y3Dlg2McZtGnHgXQzwya+QSNIW5izbkD4AIm1Szs9rjeJoYiTGMrleb3ud9RKAJyoKvqi6
	YrMeyr0xF0Pxnb0a8ZH4A5/wFGs5d0IWvA1cDFej8pHIzVoc9IU90nB8OKMlBZVa2PGa9HiMnXMUM
	Bb67qOmwe0kdegwBahHBkWP0jMBbaZ91hRSUjuMXGWv7nUBBy2jAG2U/eX02suZc3lUr7ApM67d+G
	llWqsrMeFh6DvlyAiOsWX3XsURpgM0C2OTCOzqPsoAvDXxdY46YJ2fxPprbWyfAqM23J/+UbAci2q
	uoGBGLKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzan-0000000HFrr-0bic;
	Fri, 01 Mar 2024 09:54:13 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfzai-0000000HFqk-42fy;
	Fri, 01 Mar 2024 09:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709286847;
	bh=TvOeS+gkrSoRl27YcSo8vGBcXBu+FwFHZ14acWBgVEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tGYVJO92s/E6trrtTDfgT+rP/d8KDOX34glXLf4m+QrACnCjhGQFkS61NSd/RtYCF
	 8pQV8vHl1BXN0RvsMg20mMlWgowlIXj4u7OaTaG5W5WBm4xBzQOyWiTS/ZmEIdcZIZ
	 /+EpvaJqbevyu6cTOK43M1ChP0zaLSdLHXL3nZvaOeIRj2IVPFRBn0Z0ZFzW+19ZPw
	 pER4iNs+324frTCLttf+rGsb4BQYYGSwDk/pdPgbJjmNbhEIdNNJH/GuvALrLSwOdN
	 A9wYGh9bD/PdgMGUgx9Jbp4prk+iLBBgeN2RVHdE4PCbrMj76auO5kMYxihIwy1IL9
	 xGyZBwAfYDT7w==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 788D737820C2;
	Fri,  1 Mar 2024 09:54:07 +0000 (UTC)
Date: Fri, 1 Mar 2024 10:54:06 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yunfei Dong =?utf-8?B?KOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"nhebert@chromium.org" <nhebert@chromium.org>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"nfraprado@collabora.com" <nfraprado@collabora.com>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"frkoenig@chromium.org" <frkoenig@chromium.org>,
	"stevecho@chromium.org" <stevecho@chromium.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"daniel@ffwll.ch" <daniel@ffwll.ch>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"hsinyi@chromium.org" <hsinyi@chromium.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] media: mediatek: vcodec: support 36bit physical address
Message-ID: <20240301095406.4xu2fadgwgswn6jj@basti-XPS-13-9310>
References: <20240301020126.11539-1-yunfei.dong@mediatek.com>
 <ea7f25bf-2294-4ad4-bc18-226827d49ae8@collabora.com>
 <c1f489c474e3d00ff8573225c5d282df4d82f9e1.camel@mediatek.com>
 <7de218a7-680f-40a8-a002-d6a2c87f53ee@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7de218a7-680f-40a8-a002-d6a2c87f53ee@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_015409_157075_E6CD623C 
X-CRM114-Status: GOOD (  12.48  )
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

Hey Yunfei,

On 01.03.2024 10:36, AngeloGioacchino Del Regno wrote:
>Il 01/03/24 10:23, Yunfei Dong (董云飞) ha scritto:
>>Hi AngeloGioacchino,
>>
>>Thanks for you reviewing.
>>On Fri, 2024-03-01 at 10:03 +0100, AngeloGioacchino Del Regno wrote:
>>>Il 01/03/24 03:01, Yunfei Dong ha scritto:
>>>>The physical address is beyond 32bit for mt8188 platform, need
>>>>to change the type from unsigned int to unsigned long in case of
>>>>the high bit missing.
>>>>
>>>>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>>>>---
>>>>   .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        | 4
>>>>++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>>diff --git
>>>>a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_
>>>>lat_if.c
>>>>b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_
>>>>lat_if.c
>>>>index cf48d09b78d7..85df3e7c2983 100644
>>>>---
>>>>a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_
>>>>lat_if.c
>>>>+++
>>>>b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_
>>>>lat_if.c
>>>>@@ -1074,7 +1074,7 @@ static int
>>>>vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance
>>>>*inst
>>>>   	unsigned int mi_row;
>>>>   	unsigned int mi_col;
>>>>   	unsigned int offset;
>>>>-	unsigned int pa;
>>>>+	unsigned long pa;
>>>
>>>If you used the right type from the beginning, you wouldn't have to
>>>fix that ;-)
>>>
>>Yes, you are right, thanks for your remind.
>>>Is there any reason why you didn't - and still don't use the
>>>`phys_addr_t` type
>>>for the `pa` member?
>>>
>>pa is also iova, dma address. Change it to dma_addr_t looks much
>>better.
>>
>
>Ok, dma_addr_t looks good as well.

Ah alright, disregard my comment about unsigned long vs u64 then, but
please have a look at the other casts in the driver as well as you
currently cast to either:
- u64
- uint64_t
- unsigned long

Greetings,
Sebastian

>
>Cheers!
>
>>I will change it in next patch.
>>>Cheers,
>>>Angelo
>>>
>>Best Regards,
>>Yunfei Dong
>>>>   	unsigned int size;
>>>>   	struct vdec_vp9_slice_tiles *tiles;
>>>>   	unsigned char *pos;
>>>>@@ -1109,7 +1109,7 @@ static int
>>>>vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance
>>>>*inst
>>>>   	pos = va + offset;
>>>>   	end = va + bs->size;
>>>>   	/* truncated */
>>>>-	pa = (unsigned int)bs->dma_addr + offset;
>>>>+	pa = (unsigned long)bs->dma_addr + offset;
>>>>   	tb = instance->tile.va;
>>>>   	for (i = 0; i < rows; i++) {
>>>>   		for (j = 0; j < cols; j++) {
>>>
>>>
>
>

