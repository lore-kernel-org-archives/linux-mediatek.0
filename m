Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA47C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j24PmU46L4PAMC/RVoIYqNyiHhsIfAtiZhWC9tyZA9w=; b=48pGxuiRXHY9jqTpIPQPsDtvLZ
	bzhbqewl0pI1Nc2pYhyQ/MbKCMMRsCjTIY5bG50P8/t7UmolmIjqnB7x+QKE8Isc71nwc4ZXFP9Fk
	nXiUnGASQomppI2fNAp/gWBoH7WOp5+C8iTCefSDGu1IYIHR4DHhJ5gY1vQZUW3N6gH19aRokkz9M
	ufV32DfT5YQYEoOumtw+jmgOw+LDJtdTtbJyrogYlKFAzmTJqTLVi6QI93l48TiwBwQHU0GqC1cx2
	24G7qofPEN1+DmBLxCegvft6EvSDx9ua6PzIw2rp6ZLGjkIrdRH1vqM/yV8V0wqUIZ4LbckRZNYvK
	Z8eFlajQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZki-0039zM-2v;
	Wed, 12 Apr 2023 12:39:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZkd-0039vh-2X;
	Wed, 12 Apr 2023 12:39:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6312C6341A;
	Wed, 12 Apr 2023 12:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7770FC433D2;
	Wed, 12 Apr 2023 12:38:58 +0000 (UTC)
Message-ID: <f133f378-4e4b-8747-4c0c-58caca861c4b@xs4all.nl>
Date: Wed, 12 Apr 2023 14:38:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [v9] media: mediatek: vcodec: support stateless AV1 decoder
Content-Language: en-US
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
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
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230412033022.7766-1-xiaoyong.lu@mediatek.com>
 <00a8fb79-580e-5389-f03f-abb7bba9f092@xs4all.nl>
In-Reply-To: <00a8fb79-580e-5389-f03f-abb7bba9f092@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_053903_916049_AC639451 
X-CRM114-Status: GOOD (  20.32  )
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

On 12/04/2023 14:22, Hans Verkuil wrote:
> On 12/04/2023 05:30, Xiaoyong Lu wrote:
>> Add mediatek av1 decoder linux driver which use the stateless API in
>> MT8195.
>>
>> Signed-off-by: Xiaoyong Lu<xiaoyong.lu@mediatek.com>
>> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Hmm, I get this compile error:
> 
> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_setup_uh’:
> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:48:58: error: ‘V4L2_AV1_FRAME_FLAG_UNIFORM_TILE_SPACING’ undeclared (first use in this function); did you mean
> ‘V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING’?
>    48 | #define FH_FLAG(x, name)                (!!((x)->flags & V4L2_AV1_FRAME_FLAG_##name))
>       |                                                          ^~~~~~~~~~~~~~~~~~~~
> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1322:41: note: in expansion of macro ‘FH_FLAG’
>  1322 |         uh->uniform_tile_spacing_flag = FH_FLAG(ctrl_fh, UNIFORM_TILE_SPACING);
>       |                                         ^~~~~~~
> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:48:58: note: each undeclared identifier is reported only once for each function it appears in
>    48 | #define FH_FLAG(x, name)                (!!((x)->flags & V4L2_AV1_FRAME_FLAG_##name))
>       |                                                          ^~~~~~~~~~~~~~~~~~~~
> drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1322:41: note: in expansion of macro ‘FH_FLAG’
>  1322 |         uh->uniform_tile_spacing_flag = FH_FLAG(ctrl_fh, UNIFORM_TILE_SPACING);
>       |                                         ^~~~~~~
> 
> This flag was renamed from V4L2_AV1_FRAME_FLAG_UNIFORM_TILE_SPACING to
> V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING in v5 of the AV1 uAPI.
> 
> So this suggests to me that you are testing with an old version of the AV1
> uAPI. The correct one is v7:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20230306161850.492072-1-daniel.almeida@collabora.com/
> 
> You have to compile and test with that v7 patch since that's the version we
> want to merge.

smatch also gave this error:

vdec_av1_req_lat_if.c:2121 vdec_av1_slice_lat_decode() error: we previously assumed 'pfc' could be null (see line 2056)

Regards,

	Hans

