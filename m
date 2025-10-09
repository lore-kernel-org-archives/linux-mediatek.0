Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A4F8CCD185
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Oct 2025 11:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xg8e20bFJTPFm4CfS78CF9jiJiS9NEIRmxnDRWL5VQM=; b=4GqSbTpKRktimp
	uAjAaiypgYTja3djemoxi8fIHQN0SyqYH0+VmpCyKGE0hveyQtQB4elHYls/CGUtoohbOuSCnB1I1
	4a87CcbPYobRVdn79PycmMUDXYF3Nwcds/Te+KEFgEPhXG5JVSeJyE6J9dt8WiL0gH3/eA3x0aJtE
	Rr3UHOv2qQo79kb10/SDQqFEzd//v4I8oO64xxpWVCDgJK0kNW6ueP30assWeAqwKdEboh9cZHCxD
	V/dPppkNIofAg318XDrx+XvRmI9p9KkiXZ4cjcn0HEtWA3fYyvRzTye38KQa7v+2hUqeOM11rnyiQ
	KdLF+brxkl7HwFRjxO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ont-00000005yFt-25sf;
	Thu, 09 Oct 2025 11:27:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6onp-00000005y9C-456x;
	Thu, 09 Oct 2025 11:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760009239;
	bh=enMp2lp+mdz3ReIJxikmUnpTeAbVNfhoqdA9uVU9ApM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oP2xDZoqFL5PLhQhyHBnhUABh6PaI43Ll58/kbmiLHe5BfHoBttFgvcylWiyoJu+K
	 KotHSxHgkvR+TaKKAkmT3ZT4HqSyNppSW8M6ZHL0He+f+UUW1KaPJ9pKlicdreP+G3
	 upGWaP6T5L4i1c46zRBJIesNnqvIM1FrnDIm9CoW2wKJnDXL30DwTuas9mERkKWVqf
	 FDvMroWVu80WqJTdv88/z5WikGiIUsct+cm9iw5LTdflKpetsKRnihjtlluu9uhme/
	 juX0MFUhAvVn11QxKTl1Uc8lIwP0RISxtF5/+MEL+TX8iA8jdIxYj+Le+08GTaRew4
	 Pk2fj78IMAiLQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C466617E01F5;
	Thu,  9 Oct 2025 13:27:18 +0200 (CEST)
Message-ID: <291edc0a-a892-428f-a2da-29e192f5a2e8@collabora.com>
Date: Thu, 9 Oct 2025 13:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/20] soc: mediatek: mtk-cmdq: Add
 cmdq_pkt_jump_rel_temp() for removing shift_pa
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20250827114006.3310175-1-jason-jh.lin@mediatek.com>
 <20250827114006.3310175-6-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250827114006.3310175-6-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_042722_221148_37C055C0 
X-CRM114-Status: GOOD (  19.35  )
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
Cc: devicetree@vger.kernel.org, Moudy Ho <moudy.ho@mediatek.com>, Xiandong Wang <xiandong.wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Chen-yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>, Project_Global_Chrome_Upstream_Group@mediatek.com, Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Sirius Wang <sirius.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 27/08/25 13:37, Jason-JH Lin ha scritto:
> Since shift_pa will be stored into the cmdq_mobx_priv of cmdq_pkt, all
> the shif_pa parameters in CMDQ helper APIs can be removed.
> 
> Add cmdq_pkt_jump_rel_temp() for the current users of cmdq_pkt_jump_rel(),
> and then remove shift_pa after all users have migrated to the new APIs.
> 
> Fixes: ade176534112 ("soc: mediatek: cmdq: Add parameter shift_pa to cmdq_pkt_jump()")
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 6 ++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  | 9 +++++++++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 8feeaa320359..4b1591e5b1ae 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -515,6 +515,12 @@ int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
>   }
>   EXPORT_SYMBOL(cmdq_pkt_jump_rel);
>   
> +int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
> +{
> +	return cmdq_pkt_jump_rel(pkt, offset, shift_pa);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_jump_rel_temp);
> +
>   int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
>   {
>   	struct cmdq_instruction inst = {
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 0c3906e8ad19..5e3a0e807980 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -377,6 +377,9 @@ static inline int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr, u8 shift_
>    */
>   int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
>   
> +/* This wrapper has to be removed after all users migrated to jump_rel */
> +int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);

/**
  * cmdq_pkt_jump_rel_v0() - Temporary wrapper for new CMDQ helper API
  * @pkt:   xyz (copy the descriptions from cmdq_pkt_jump_rel() here)
  * @offset: whatever
  * @shift_pa: [DEPRECATED] abc
  *
  * This function is a temporary wrapper that was introduced only for ease of
  * migration of the many users of the CMDQ API located in multiple kernel
  * subsystems.
  *
  * This has to be removed after all users are migrated to the newer CMDQ API.
  */
static inline int cmdq_pkt_jump_rel_v0(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
{
	return cmdq_pkt_jump_rel(pkt, offset, shift_pa);
}

...so you don't even need to add it in mtk-cmdq-helper.c: less files to care about.

> +
>   /**
>    * cmdq_pkt_eoc() - Append EOC and ask GCE to generate an IRQ at end of execution
>    * @pkt:	The CMDQ packet
> @@ -506,6 +509,12 @@ static inline int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_p
>   	return -EINVAL;
>   }
>   
> +/* This wrapper has to be removed after all users migrated to jump_rel */
> +static inline int cmdq_pkt_jump_rel_temp(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa)
> +{
> +	return -EIMVAL;
> +}
> +
>   static inline int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
>   {
>   	return -EINVAL;



