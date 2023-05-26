Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14D6C77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 12:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRFuPfXJs9GjxtyX3vAwSVfOy9RduuiXndDd9XBbKiw=; b=oSwh4snPSITGI0pngxBCxGWkVh
	U0+RYvE1BuGEM3NVlxmImo68+8zE/z0WpHNFj5NTuvdbloE0DxCB3SL9b8WiSbtsdCL9FC0mwJT8v
	9Ch/S+Pdxt3cAKGPX3ilNReCB3OQ0FGDn092NSCR+3Yew4aGe0gfjPAatEHkZoNgASjK5remiOrtD
	QLTqbf0f/r+5I9uK8qAjryTAtsQyZTHifX+LuKZFNypXRoNKuF75bFC3M4z3sr5AHWFmQ4q6rzin2
	eVzvPDDyFX0RjinlhbznBYcJXqINMsOL90YavvHPewK8RpHa3RbjixLsq4+F/EwMYuouh2lo5Jq7W
	Dr32//kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2WBu-002Q4Q-18;
	Fri, 26 May 2023 12:05:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2WBq-002Q2Y-0P;
	Fri, 26 May 2023 12:05:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 28735614EF;
	Fri, 26 May 2023 12:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F23CC433D2;
	Fri, 26 May 2023 12:04:55 +0000 (UTC)
Message-ID: <bdee7988-3551-4011-f93e-c4dd1e4ee76b@xs4all.nl>
Date: Fri, 26 May 2023 14:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [v10] media: mediatek: vcodec: support stateless AV1 decoder
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
References: <20230414083020.22219-1-xiaoyong.lu@mediatek.com>
Content-Language: en-US
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230414083020.22219-1-xiaoyong.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_050502_198975_46BC2CB7 
X-CRM114-Status: GOOD (  11.24  )
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

On 14/04/2023 10:30, Xiaoyong Lu wrote:
> Add mediatek av1 decoder linux driver which use the stateless API in
> MT8195.
> 
> Signed-off-by: Xiaoyong Lu<xiaoyong.lu@mediatek.com>
> Tested-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

After rebasing on top of our media staging tree I get these compile errors:

  CC [M]  drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.o
drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c: In function ‘vdec_av1_slice_lat_decode’:
drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2075:46: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
 2075 |                 vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
      |                                              ^~
drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c:2114:46: error: ‘struct mtk_vcodec_dev’ has no member named ‘msg_queue_core_ctx’
 2114 |                 vdec_msg_queue_qbuf(&ctx->dev->msg_queue_core_ctx, lat_buf);
      |                                              ^~

That's due to the patch "media: mediatek: vcodec: move core context from device
to each instance" that has now been merged and that drops that queue.

Can you rebase v10? This is now the only remaining blocked for the av1 series
to be merged.

Regards,

	Hans

