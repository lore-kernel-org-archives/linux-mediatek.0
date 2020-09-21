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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6897C43465
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:16:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFA1720708
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:16:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y5aNH7gt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="adyOI1QZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFA1720708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BN2y4j40LLLCf0zjpXbCk0TCojq3eGSl1JWhuhnhtBo=; b=Y5aNH7gt1ajgo55eFwFnHfFKH
	9d1+E8B3XWn1FgU3puy5szD6ZqMBpsQHYtYYPvCFXvI+2+0ZCLqE6r3TdDX/Zqeq2dGffi/f92NHK
	HKUtoc/dhephJ7qW9S8PdwovTe+6Job3O5Fi1qpmCAXahuf42juKcSiFzn9/ysw6HWPpeO5o91qpa
	xuOJ9JYo8Be+wUVOHBxRrxM2zcbwHc8bRqXOH61iJwjC6USPLP2CwlVJ3vHvATN/uOnue76PWF2o/
	mRWBGv9BB0iYmFYBY6DtjZS9dyBCHE4ATeFdKeN/nTW92DUsQlsuWU5a3PxrbpVnSV7CHnREdIeCk
	1E+euExsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKOTx-0001fA-Fc; Mon, 21 Sep 2020 16:16:01 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKOTW-0001Ki-5A; Mon, 21 Sep 2020 16:15:40 +0000
Received: by mail-wr1-x443.google.com with SMTP id e16so13440329wrm.2;
 Mon, 21 Sep 2020 09:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/AzBFVjyB9M35TCkoVfiCJG5gVr+4aRpJymg5fjIeRo=;
 b=adyOI1QZVXu5/sDgfgrREwI18axbJUHVHZf+au8Ry+GgFshgEUioSEsGC71GCW9dLu
 sWNaG1NpaQrUsWUB4sGHhwVmKL3P60CCEkoVjK/l2A7jy710+V3t/Laq6l8VfbzwIda8
 TgroX58KWlScsvkuEsrT5Au63ICALvxtgLZaMMEUdHN2JAn6DY+dqA5zYLjnL8+/GaYS
 MNPWa7t6XUo6ss8lFgjElJQHC0N4GIeYkg12BKamF3SSN9RyltBM1+k6fRWWB05YQYMa
 Q0xJXMPuFBgKqSBNcVs2VSc/LvvXFSvtInzTh/3uRwxGaHgJnsQgedNh1QwfGomN7znL
 g9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/AzBFVjyB9M35TCkoVfiCJG5gVr+4aRpJymg5fjIeRo=;
 b=sxDH2juDV7SaBPKrufJfutiqAG1bhVhKnwfUhfpzOw51vng84qIBOw9VoECLp1ttUW
 +Oz0XfOT/nOQMlDb5k9T1qDtD9GOjAQZEPo1eGJxeny0lhFb5BtodBhTlKuGYofADdsO
 c25lXCytYolw6KbK10ryLdyhsKB1/dnpLb9Eruqb8p5fn0/RH3yPHYiYMouTSvt8Ovbl
 g1TMZ0qiaczKjKaKmO1IMZm/PA5U3U0tOAVSRRTMXLB6jBQ7H85SK65rverExQJS5G9F
 pY9w/10QUIFTXmVHHTzTNlmHt3KeJAtm99a/HPyUtA6MKZXBHcbrzDmsIi1eX63b8JfB
 PRwg==
X-Gm-Message-State: AOAM533BjweWuYfyHUsUgSHJMPlW3sUMpD8QWE/OnhMw+MjeImeziLmE
 SrGymb+6OH+2XxUhD8sR/8ErJj8MZK7Rdw==
X-Google-Smtp-Source: ABdhPJzVnGb+f+wfWSeWuA70pTjkhGJd856/BU9GbrNasUolNL1dWGqI0h48k/ZLL1ZWGjM/efha4g==
X-Received: by 2002:adf:eecb:: with SMTP id a11mr547226wrp.356.1600704931276; 
 Mon, 21 Sep 2020 09:15:31 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id o4sm20760014wru.55.2020.09.21.09.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:15:30 -0700 (PDT)
Subject: Re: [PATCH v3 2/9] soc: mediatek: cmdq: add write_s function
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-3-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1fa46c55-2bc9-ad73-bb65-91825fcd4b9e@gmail.com>
Date: Mon, 21 Sep 2020 18:15:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594136714-11650-3-git-send-email-dennis-yc.hsieh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_121534_410405_A28A6819 
X-CRM114-Status: GOOD (  24.14  )
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
> add write_s function in cmdq helper functions which
> writes value contains in internal register to address
> with large dma access support.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Now pushed to v5.9-next/soc

Thanks!
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c   |   19 +++++++++++++++++++
>   include/linux/mailbox/mtk-cmdq-mailbox.h |    1 +
>   include/linux/soc/mediatek/mtk-cmdq.h    |   19 +++++++++++++++++++
>   3 files changed, 39 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 9faf78fbed3a..880349b3f16c 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -18,6 +18,10 @@ struct cmdq_instruction {
>   	union {
>   		u32 value;
>   		u32 mask;
> +		struct {
> +			u16 arg_c;
> +			u16 src_reg;
> +		};
>   	};
>   	union {
>   		u16 offset;
> @@ -223,6 +227,21 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>   }
>   EXPORT_SYMBOL(cmdq_pkt_write_mask);
>   
> +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> +		     u16 addr_low, u16 src_reg_idx)
> +{
> +	struct cmdq_instruction inst = {};
> +
> +	inst.op = CMDQ_CODE_WRITE_S;
> +	inst.src_t = CMDQ_REG_TYPE;
> +	inst.sop = high_addr_reg_idx;
> +	inst.offset = addr_low;
> +	inst.src_reg = src_reg_idx;
> +
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_write_s);
> +
>   int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
>   {
>   	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 05eea1aef5aa..1f76cfedb16d 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -60,6 +60,7 @@ enum cmdq_code {
>   	CMDQ_CODE_JUMP = 0x10,
>   	CMDQ_CODE_WFE = 0x20,
>   	CMDQ_CODE_EOC = 0x40,
> +	CMDQ_CODE_WRITE_S = 0x90,
>   	CMDQ_CODE_LOGIC = 0xa0,
>   };
>   
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 2249ecaf77e4..9b0c57a0063d 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -12,6 +12,8 @@
>   #include <linux/timer.h>
>   
>   #define CMDQ_NO_TIMEOUT		0xffffffffu
> +#define CMDQ_ADDR_HIGH(addr)	((u32)(((addr) >> 16) & GENMASK(31, 0)))
> +#define CMDQ_ADDR_LOW(addr)	((u16)(addr) | BIT(1))
>   
>   struct cmdq_pkt;
>   
> @@ -103,6 +105,23 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>   			u16 offset, u32 value, u32 mask);
>   
>   /**
> + * cmdq_pkt_write_s() - append write_s command to the CMDQ packet
> + * @pkt:	the CMDQ packet
> + * @high_addr_reg_idx:	internal register ID which contains high address of pa
> + * @addr_low:	low address of pa
> + * @src_reg_idx:	the CMDQ internal register ID which cache source value
> + *
> + * Return: 0 for success; else the error code is returned
> + *
> + * Support write value to physical address without subsys. Use CMDQ_ADDR_HIGH()
> + * to get high address and call cmdq_pkt_assign() to assign value into internal
> + * reg. Also use CMDQ_ADDR_LOW() to get low address for addr_low parameter when
> + * call to this function.
> + */
> +int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> +		     u16 addr_low, u16 src_reg_idx);
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
