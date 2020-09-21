Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D91FC43465
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:18:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B96C20739
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:18:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yRnzi6R9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFr/8F0r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B96C20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hGepKny2VgamWVa1HhtzCWmEjUmcwG8qkx6xi40kAS4=; b=yRnzi6R9fnsBn4ZaoBH9axOGq
	dqYgmeo3Jn4eAK6CSzFtQPpZIVSRovMd5C2J+YuONzbq/PmB+Qt263M1BfRFWJ7UCZwgSi7HDWOuZ
	DnEzMIcdiPkf02JW8WQkoklu5er48CrpX+sDbzwLUjJp5icLNThXMjxuLHJtI+aqWvYEiRVZpFRID
	uysFNdpFYLigvGcEnEO8vDoceTD7EuQjN0QUhlAone0QzE3MhjlZb78pIHXyKxAM4Tvo8M72ldpYa
	myoPfSmHOFL62GppPKystyFH4ufwH+bbsNoXAAZy0Fv1eRVCwq0sZmpOfJb9+4mExDhtRIO3dA2an
	bBBbi3Kog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKOW3-0002rH-MG; Mon, 21 Sep 2020 16:18:11 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKOUP-0001qK-Vw; Mon, 21 Sep 2020 16:16:34 +0000
Received: by mail-wm1-x341.google.com with SMTP id z9so91235wmk.1;
 Mon, 21 Sep 2020 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=htPCe9d3Pa34TUPhjBFaGH8jRG+GS7pqXbTfR7z8+ow=;
 b=bFr/8F0r8SQESPG+ae54M5kO3y6FJPn/zwCLYrMQZraawA77/OO7/q6mgP3wWpVDC3
 c/SeKw1k9YRMjOTs612ls6tyHIFP/czLpsQ5AP27Ju3iQglx2JTIU/RDTOmsCbRbVDEL
 kIqS6kj41Y1rnt0GJlu8gKKtRxLpOmfzifKg7CANEf4OoZ4qExU17GLLr2PKmThEhgwt
 OQrzNZNm4kaQi7P5Z3/NqMPH3xbUl+CeSWtdWInpuHpt0Hl7LlNk+Vb+N9Hjf/ITfd3+
 bMfQzlziZuc5U2m2ddQfl1+c8svX1aF1+zP9mY2081/UqiWS+1TWOcGour0yfJxlhbK0
 sfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=htPCe9d3Pa34TUPhjBFaGH8jRG+GS7pqXbTfR7z8+ow=;
 b=hCbrwy+SfVNPJkhF6M8jzRcGPdJX9Y87Uu62DPVKFkgSROhKcmOWR7qXtb2FaQBuBy
 QZzd9fIeQgyQRc7hjXnzhhBUxhbqAj10m8q5EJwzjhVnnYN0swoajRALDmZesp3OpdeQ
 kpCm/LqG8nAx99AsIwZn7laRZDWkW8mjdoOuJgxAE8+yXnt8qbaiQ2372ozSiYslrDEh
 KYo7oNHQPHDkFxVPhPZ6LhuaVkKNN/b7ODajUXzo5EYoFYF71NVlm31wPyKr4iqFTLYV
 g+2Hs+rXWaeTaVl+0urLa8bIUJKZmslB7UQSJ5NuBE0EjX5Y+OWCZWPfqKNw9TZI0ThU
 v8cw==
X-Gm-Message-State: AOAM533FpCETO54MbL9e455I9yHftjUr1cRRTCVM55cegkBWr4JTLfxk
 POFk5iQaaVNOmWEOPXK/4pbemtKTONKSiw==
X-Google-Smtp-Source: ABdhPJwROwWW5Cd9tMiIlzNGJ1RQLMos0xb80a01XNW5a03Lm1yduKnwbtLNjxfaN/pF20k1d7GARg==
X-Received: by 2002:a1c:4886:: with SMTP id v128mr118594wma.139.1600704987151; 
 Mon, 21 Sep 2020 09:16:27 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id m18sm71951wmg.32.2020.09.21.09.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:16:26 -0700 (PDT)
Subject: Re: [PATCH v3 6/9] soc: mediatek: cmdq: add write_s_mask value
 function
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-7-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <9073ff83-ad99-8e40-e25e-360df74435fd@gmail.com>
Date: Mon, 21 Sep 2020 18:16:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594136714-11650-7-git-send-email-dennis-yc.hsieh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_121630_222393_AFCB87F5 
X-CRM114-Status: GOOD (  24.45  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, HS Liao <hs.liao@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 07/07/2020 17:45, Dennis YC Hsieh wrote:
> add write_s_mask_value function in cmdq helper functions which
> writes a constant value to address with mask and large dma
> access support.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Now pushed to v5.9-next/soc

Thanks!

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c |   21 +++++++++++++++++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  |   15 +++++++++++++++
>   2 files changed, 36 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 4e86b65815fc..b6e25f216605 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -294,6 +294,27 @@ int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
>   }
>   EXPORT_SYMBOL(cmdq_pkt_write_s_value);
>   
> +int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
> +				u16 addr_low, u32 value, u32 mask)
> +{
> +	struct cmdq_instruction inst = {};
> +	int err;
> +
> +	inst.op = CMDQ_CODE_MASK;
> +	inst.mask = ~mask;
> +	err = cmdq_pkt_append_command(pkt, inst);
> +	if (err < 0)
> +		return err;
> +
> +	inst.op = CMDQ_CODE_WRITE_S_MASK;
> +	inst.sop = high_addr_reg_idx;
> +	inst.offset = addr_low;
> +	inst.value = value;
> +
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_write_s_mask_value);
> +
>   int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
>   {
>   	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index ae73e10da274..d9390d76ee14 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -165,6 +165,21 @@ int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
>   			   u16 addr_low, u32 value);
>   
>   /**
> + * cmdq_pkt_write_s_mask_value() - append write_s command with mask to the CMDQ
> + *				   packet which write value to a physical
> + *				   address
> + * @pkt:	the CMDQ packet
> + * @high_addr_reg_idx:	internal register ID which contains high address of pa
> + * @addr_low:	low address of pa
> + * @value:	the specified target value
> + * @mask:	the specified target mask
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_write_s_mask_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
> +				u16 addr_low, u32 value, u32 mask);
> +
> +/**
>    * cmdq_pkt_wfe() - append wait for event command to the CMDQ packet
>    * @pkt:	the CMDQ packet
>    * @event:	the desired event type to "wait and CLEAR"
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
