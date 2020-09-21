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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE11C43465
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:17:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30A6B20708
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:17:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="deowYPeJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLkui3TX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30A6B20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wpb7uWy2IyNrVvGqjWwKxrtb85SSPcZCjfuAWxNOhts=; b=deowYPeJ/SZ4Gh3Jx8OgK4GBh
	KAn1rAAqhmCpvZm6HIOg8S1hE8E4MgZA+rLN7vYIPRXDIcJPe5AE/lLqHOKm6HZOhiAl7S1RuGmLD
	DHYcjoI/Gg2bRdGuM16hyVcQ4G5xTKOo8qI11skTWh/qWrslsUxihYrnLvvDAE8QK/ZYgs6PJiRco
	UYPd8w1eDxeKg6sPYYgEmVvN90EdBdq16Xj3b7Zzd8Y0cTv0tBJpPG46SWvXqd2nS137efBC9Kz5f
	sk8W1Tj1lIb//8GkufCNyoUvR7QcsqNBxQ/5kv0AJdACsV2c0INzit6Y4BTLBoDmxS3ZJQAYnBJk4
	556EZeGJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKOVM-0002NI-Ab; Mon, 21 Sep 2020 16:17:28 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKOU3-0001h5-J2; Mon, 21 Sep 2020 16:16:13 +0000
Received: by mail-wr1-x441.google.com with SMTP id w5so13414177wrp.8;
 Mon, 21 Sep 2020 09:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XFpxcM6XUPIah7zzLKeBoWdYZ+ocbEsyrrWoWDds4JU=;
 b=fLkui3TXyRWE/tfTme+aWiB/zCdNLRk3btahb1DrnPLN1jVP/RbrlKeBCYrm6t2Mee
 /LqdXtErXrriFo++qL3BihhUXCl69gd0mKrcn1hCdAfaGIIXau+UPr2E75afwYSVcZtC
 0mkRuUCB6cXWokP/sYZpXFaSQrlHZs4nPTGUgsO1hr3wkEcgLjAkswtK4rTeaZCh5TtZ
 t47cKM+04wJi86WDd3310dChRrLfvVeaMOuVfCRmLiyD+jtUdPyjEEz1O21mIMw/hLcx
 QdQXAP7Bey03iWKs2vi5/UnIltpGK1zW449254TmBZF0efZbGNu6ZvACVyOgjpoEjuuP
 Ot5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XFpxcM6XUPIah7zzLKeBoWdYZ+ocbEsyrrWoWDds4JU=;
 b=JXEx6vtdDksRWFRilC3pG7P/IgPvjq0KoV9EO63V7nQgPEaebGIozK3TpaunOf/n+n
 bpFANYd7srHZ6xJqydBc8jFi8zQJ9a68/vqNs+25V91ZTu/zPEdMtk55ML6V0XLzJnc2
 8vZJD18B3hedLemiOFLwNOKYI6eV5ir660l0VmoDnhUv1t7fBHL5rUJuK2qOogZTrcqq
 /LA+NyfjCZuSl7/WF9wPckM6xLKjI3Ihk8PdBQJyoXvBnv6ezRFb10aKaFPyIY2fe0jB
 LoApswvKUdLAFIrdxQsuOVWv5YttKi+MJf2cOpmENG0jAb+S89KmxE1fgMYpV43uh4Un
 0j6g==
X-Gm-Message-State: AOAM533rYATWktdfT2cQEWh61Rxy+4q3NQLESwDLlwE+sdJdYr1QqvDo
 W5rJdbPUtaxsym34KZ0rqdc=
X-Google-Smtp-Source: ABdhPJxlKA2A2s9DM+LuR07uxc2hXxduS8/5sPYYupoj0yeuPukqpex99x7SyNRtFXbgj4U//+/+uw==
X-Received: by 2002:adf:81e6:: with SMTP id 93mr534258wra.412.1600704963655;
 Mon, 21 Sep 2020 09:16:03 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id t17sm22013545wrx.82.2020.09.21.09.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:16:03 -0700 (PDT)
Subject: Re: [PATCH v3 4/9] soc: mediatek: cmdq: add read_s function
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-5-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <89ff84a9-dd22-536b-7a41-8a802df97868@gmail.com>
Date: Mon, 21 Sep 2020 18:16:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594136714-11650-5-git-send-email-dennis-yc.hsieh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_121608_160124_68139F66 
X-CRM114-Status: GOOD (  22.76  )
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
> Add read_s function in cmdq helper functions which support read value from
> register or dma physical address into gce internal register.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Now pushed to v5.9-next/soc

Thanks!

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c   |   15 +++++++++++++++
>   include/linux/mailbox/mtk-cmdq-mailbox.h |    1 +
>   include/linux/soc/mediatek/mtk-cmdq.h    |   12 ++++++++++++
>   3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 550e9e7e3ff2..ed9f5e63c195 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -227,6 +227,21 @@ int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>   }
>   EXPORT_SYMBOL(cmdq_pkt_write_mask);
>   
> +int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx, u16 addr_low,
> +		    u16 reg_idx)
> +{
> +	struct cmdq_instruction inst = {};
> +
> +	inst.op = CMDQ_CODE_READ_S;
> +	inst.dst_t = CMDQ_REG_TYPE;
> +	inst.sop = high_addr_reg_idx;
> +	inst.reg_dst = reg_idx;
> +	inst.src_reg = addr_low;
> +
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_read_s);
> +
>   int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
>   		     u16 addr_low, u16 src_reg_idx)
>   {
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 90d1d8e64412..efbd8a9eb2d1 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -60,6 +60,7 @@ enum cmdq_code {
>   	CMDQ_CODE_JUMP = 0x10,
>   	CMDQ_CODE_WFE = 0x20,
>   	CMDQ_CODE_EOC = 0x40,
> +	CMDQ_CODE_READ_S = 0x80,
>   	CMDQ_CODE_WRITE_S = 0x90,
>   	CMDQ_CODE_WRITE_S_MASK = 0x91,
>   	CMDQ_CODE_LOGIC = 0xa0,
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 53230341bf94..cd7ec714344e 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -104,6 +104,18 @@ struct cmdq_client *cmdq_mbox_create(struct device *dev, int index,
>   int cmdq_pkt_write_mask(struct cmdq_pkt *pkt, u8 subsys,
>   			u16 offset, u32 value, u32 mask);
>   
> +/*
> + * cmdq_pkt_read_s() - append read_s command to the CMDQ packet
> + * @pkt:	the CMDQ packet
> + * @high_addr_reg_idx:	internal register ID which contains high address of pa
> + * @addr_low:	low address of pa
> + * @reg_idx:	the CMDQ internal register ID to cache read data
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_read_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx, u16 addr_low,
> +		    u16 reg_idx);
> +
>   /**
>    * cmdq_pkt_write_s() - append write_s command to the CMDQ packet
>    * @pkt:	the CMDQ packet
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
