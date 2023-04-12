Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39D24C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pUas2dlpUgBu3QakLI1oqabYCvKLJzsmBkGW4tq+VI=; b=Iu5sOI671PJ/x3TJ+k+6OtfeIc
	HyjONAm6+KFUv9K7Oqb6q78nfR8sbXAQz75yE2AtmLNwvWw7Tz8lw+6qlrzgWe0qYE7ewQR1Zz4RA
	8/Q9XzLpFsdugX5nrjlJfq3cIwqJ18Ra78wcKNntpxzx3XkGvrD+5lrSkwS3nIIC4f2TBfdcT9ice
	YlzhOkSYndg3LwCocjrHL7iEuDTjmYMuXaSqdiO42/7Cn8zizB5TfFhAc5LFr2YSn6FB6qZpVjUNh
	GNzoYW8owRWzUkW27NsKOHEo2nd6nC+oW11WWQO+hTSokKXBAMLCqube/3p0IEpovbjdeUOoPP596
	AcC/ovuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZUY-0034EQ-0B;
	Wed, 12 Apr 2023 12:22:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZUU-0034D2-07;
	Wed, 12 Apr 2023 12:22:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A0DC63322;
	Wed, 12 Apr 2023 12:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07DCC433D2;
	Wed, 12 Apr 2023 12:22:16 +0000 (UTC)
Message-ID: <00a8fb79-580e-5389-f03f-abb7bba9f092@xs4all.nl>
Date: Wed, 12 Apr 2023 14:22:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [v9] media: mediatek: vcodec: support stateless AV1 decoder
Content-Language: en-US
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
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230412033022.7766-1-xiaoyong.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_052222_151871_812938EA 
X-CRM114-Status: GOOD (  15.55  )
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

On 12/04/2023 05:30, Xiaoyong Lu wrote:
> Add mediatek av1 decoder linux driver which use the stateless API in
> MT8195.
> 
> Signed-off-by: Xiaoyong Lu<xiaoyong.lu@mediatek.com>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hmm, I get this compile error:

drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_setup_uh’:
drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:48:58: error: ‘V4L2_AV1_FRAME_FLAG_UNIFORM_TILE_SPACING’ undeclared (first use in this function); did you mean
‘V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING’?
   48 | #define FH_FLAG(x, name)                (!!((x)->flags & V4L2_AV1_FRAME_FLAG_##name))
      |                                                          ^~~~~~~~~~~~~~~~~~~~
drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1322:41: note: in expansion of macro ‘FH_FLAG’
 1322 |         uh->uniform_tile_spacing_flag = FH_FLAG(ctrl_fh, UNIFORM_TILE_SPACING);
      |                                         ^~~~~~~
drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:48:58: note: each undeclared identifier is reported only once for each function it appears in
   48 | #define FH_FLAG(x, name)                (!!((x)->flags & V4L2_AV1_FRAME_FLAG_##name))
      |                                                          ^~~~~~~~~~~~~~~~~~~~
drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:1322:41: note: in expansion of macro ‘FH_FLAG’
 1322 |         uh->uniform_tile_spacing_flag = FH_FLAG(ctrl_fh, UNIFORM_TILE_SPACING);
      |                                         ^~~~~~~

This flag was renamed from V4L2_AV1_FRAME_FLAG_UNIFORM_TILE_SPACING to
V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING in v5 of the AV1 uAPI.

So this suggests to me that you are testing with an old version of the AV1
uAPI. The correct one is v7:

https://patchwork.linuxtv.org/project/linux-media/patch/20230306161850.492072-1-daniel.almeida@collabora.com/

You have to compile and test with that v7 patch since that's the version we
want to merge.

Regards,

	Hans

