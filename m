Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA98EC77B7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGIgThl++ZlF8ormgW9eww/BPZkmzyGskeuhPTWOpsQ=; b=ryvZM1aWJMYY7yGuoKfZK/t8tV
	untTFe8MHwrBLM4c6L1xI/ekPgq1AFW5qwRAH7b1xiC4dNHZOziqzjEjH4mVkt/sAsjAZucGiLjLE
	AFF2dEuLnHGkgyhAa6klaY6QYIJDUKzglmrv85HhdqnVOitMWmRGZjdH5D7lIAjdklUrqy503Gqcc
	odcxzhjkySt8WFxV5TQ2SpOS3Gq+gEXncdeFmKkpKbi4LXd7LI3ehH84L7mhxY4Qk1dOMaLe6c3Gk
	hOYqja7RNGSkYV7iCtsZi7UUH25alc9btNfjXqkwV2RHmxFeSrlajuBEI0UlJ+lo25gcwI/sZnZ8R
	qXvZSi1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poL8A-00FWxS-1s;
	Mon, 17 Apr 2023 09:26:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poL86-00FWwK-05;
	Mon, 17 Apr 2023 09:26:35 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9F0B76600013;
	Mon, 17 Apr 2023 10:26:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681723592;
	bh=wrJ4ynBY1xVL3ge4ZihlSbCn5HYxZm48w8kZO/CHf+w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Aon1cpdXhDBwX7d5ZvMHQBNmf4nWFCvOaIxNEnw392rCQ8N+QAUUappXpnjNH/spS
	 c+2/Qtt1hFum+eIiX7R/R6B4AXnd2sNM1XytdBijLYZJwb3ZU3Iy2cJyVOxqZYMiXe
	 DqSHOPzoamHthEhVteDANAotRsWQaYLYcYy1kPFhrwk+Brznct9PLZywJ1fxqk56Fa
	 luZ7b6V4Mzih+0yvJdtrM2yR4IAW99mM1Xohue5d/pPWb8yK5a+han9oNPGMY5+NWF
	 j1+OUulcc1SE89UbxURoCD/UclEnepBQ69132uNsy+s0FZUx57UT41z4nmI/rcEuRY
	 K5SU1TR5I9AWQ==
Message-ID: <26ac9fbc-cc7a-7f25-0db5-30ede1068501@collabora.com>
Date: Mon, 17 Apr 2023 11:26:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/6] media: mediatek: vcodec: add the definition of
 decoder status
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230417054816.17097-1-yunfei.dong@mediatek.com>
 <20230417054816.17097-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230417054816.17097-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_022634_191529_F29DED32 
X-CRM114-Status: GOOD (  15.23  )
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

Il 17/04/23 07:48, Yunfei Dong ha scritto:
> Adding the status used to separate different decoder period for
> core hardware.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
> index a5d44bc97c16..19508be08566 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
> +++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.h
> @@ -21,6 +21,13 @@ struct mtk_vcodec_ctx;
>   struct mtk_vcodec_dev;
>   typedef int (*core_decode_cb_t)(struct vdec_lat_buf *lat_buf);
>   
> +/* current context isn't work */
> +#define CONTEXT_LIST_EMPTY           (0)
> +/* queued to the core work list */
> +#define CONTEXT_LIST_QUEUED          (1)
> +/* context decode done */
> +#define CONTEXT_LIST_DEC_DONE        (2)

I would prefer an enumeration instead; you can keep the documentation for those
status signals with kerneldoc on the new enum.

/**
  * enum core_ctx_status - Context decode status for core hardware
  * @CONTEXT_LIST_EMPTY:    No buffer queued on Core HW (must always be 0)
  * @CONTEXT_LIST_QUEUED:   Buffer queued to the core work list
  * @CONTEXT_LIST_DEC_DONE: Context decode done
  */
enum core_ctx_status {
	CONTEXT_LIST_EMPTY = 0,
	CONTEXT_LIST_QUEUED,
	CONTEXT_LIST_DEC_DONE,
}

Moreover, since this is a rather simple addition, please squash this commit with
patch [3/6] where you actually also introduce the actual usage of the new enum.

Cheers,
Angelo

