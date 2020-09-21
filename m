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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D235EC43465
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:17:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 478AB20708
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V8XCTp3k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LzbH1QjW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 478AB20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BLhwTFa8D36zMve2C9V/Ztn/BneyT3bDbqZqykNGQho=; b=V8XCTp3kDYpZTYKfjP85s2dXU
	sE4X+hg/Dw3d42cNxfYjm6Jl/A9Ng57zQHDiB7ldF2BcTmrq1G3rqF2koKCD9R/L92B2v+5r8fXNA
	XT+iWYKhYPdVcMvFlxsPCI5myWZ1hTItruiKwEHqKcKSzYU10CfqMzkeQinXCTL3yrdEicjYnVDYp
	oGghvXdJF0ON+4WHUBSHHWPI18u82r8tz5yloJICrg5uYNtoCa6JOxvV60h0KCat6Nyxy8X1/tc/8
	77JyQ88d5ZehHW8s5tsA2ja5W/hlSxEGviwG/TLMs4vroKBsRiAoYwbZKYokEC0Q9AgGOn3H+lZxh
	b8xovUkOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKOVV-0002VV-LU; Mon, 21 Sep 2020 16:17:37 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKOUH-0001mb-TW; Mon, 21 Sep 2020 16:16:25 +0000
Received: by mail-wr1-x442.google.com with SMTP id o5so13398958wrn.13;
 Mon, 21 Sep 2020 09:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VlG26JqU7FwBeORSXeuhuiFQeJWA8DcS5yfbqqgjFoI=;
 b=LzbH1QjW77tl2JRTNZN+3mCCa1VJDaXInHVdXNXHD/lXhEsyT30taOJQpj4pCMB9ia
 /B4raLutHcC8Y/FBNWleD/TkOIxoZGIseZ8hjvBudXz4F1zyyt0k9qqJuUZE1SN7A3vF
 DS2/5+vcFMWwXrwwuh2/mgywxnFUPMDNlhOHz0VDb+SGI0VQDR4MuTHCWkj2TAq9wmY0
 toPY6uCGKQkVYvzWCvLM6bHwJEkVO9Lk1TX7bu+gT9cFszv/srm0bvpReMgynk1e7ujn
 jZUceJnx5S4D4BpjVE2ImgfCS0uSS8DUmtm6mzMrxh4vitjcBWScXtxRybZ1XBWn5PZw
 rNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VlG26JqU7FwBeORSXeuhuiFQeJWA8DcS5yfbqqgjFoI=;
 b=bIGeE7dIXHv6u98T6OS41kYYqPy2jacrs83ObRLhEFHGcLe7dfwobr4c6K+UUaltBd
 kudQBTrnldWfMecG+zyfugGSDOc3OtsG1VuB7899uapKXwkHlPkNHjXmsoIcilT87uJ7
 irroQh6BBKdxYrQnE5vH0AOm9y7aSliRyF9pxpFJi48c59iLqrFvNFKzb9MuAxxESfNA
 2lGu/Ihuocm39uAi3zLAJD+P649kF6VH3xxlmKAdIKBtqUf5dn8K8u1K5Rhit8u6urxS
 oVhdnw3767OpD+fibgMaQdlChFRqWHxCtvMRj1AR7+15grJt4d21YIFCNIefuMMVRh16
 MSjg==
X-Gm-Message-State: AOAM5309qsVC83LmlUWlI3MX9deUird9IfnSW9aX34flDgsnSenng9ER
 jJ66J3/kRIyxYaSz6t4WQze1NPiPy+ZAtQ==
X-Google-Smtp-Source: ABdhPJyNwvoduPPv6j+uBwraRDRsICqaWW6gD6+FGnI81kjd5ZWwWFDuh/xvlGa6UijBkTDICaAixA==
X-Received: by 2002:adf:aa84:: with SMTP id h4mr559557wrc.426.1600704977232;
 Mon, 21 Sep 2020 09:16:17 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id a5sm21218422wrp.37.2020.09.21.09.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:16:16 -0700 (PDT)
Subject: Re: [PATCH v3 5/9] soc: mediatek: cmdq: add write_s value function
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-6-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <db10d46a-18fb-345f-17a2-b847fb8d0bac@gmail.com>
Date: Mon, 21 Sep 2020 18:16:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594136714-11650-6-git-send-email-dennis-yc.hsieh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_121622_262831_3C71BCA6 
X-CRM114-Status: GOOD (  22.88  )
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
> writes a constant value to address with large dma
> access support.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Now pushed to v5.9-next/soc

Thanks!

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c |   14 ++++++++++++++
>   include/linux/soc/mediatek/mtk-cmdq.h  |   13 +++++++++++++
>   2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index ed9f5e63c195..4e86b65815fc 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -280,6 +280,20 @@ int cmdq_pkt_write_s_mask(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
>   }
>   EXPORT_SYMBOL(cmdq_pkt_write_s_mask);
>   
> +int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
> +			   u16 addr_low, u32 value)
> +{
> +	struct cmdq_instruction inst = {};
> +
> +	inst.op = CMDQ_CODE_WRITE_S;
> +	inst.sop = high_addr_reg_idx;
> +	inst.offset = addr_low;
> +	inst.value = value;
> +
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_write_s_value);
> +
>   int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
>   {
>   	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index cd7ec714344e..ae73e10da274 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -152,6 +152,19 @@ int cmdq_pkt_write_s_mask(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
>   			  u16 addr_low, u16 src_reg_idx, u32 mask);
>   
>   /**
> + * cmdq_pkt_write_s_value() - append write_s command to the CMDQ packet which
> + *			      write value to a physical address
> + * @pkt:	the CMDQ packet
> + * @high_addr_reg_idx:	internal register ID which contains high address of pa
> + * @addr_low:	low address of pa
> + * @value:	the specified target value
> + *
> + * Return: 0 for success; else the error code is returned
> + */
> +int cmdq_pkt_write_s_value(struct cmdq_pkt *pkt, u8 high_addr_reg_idx,
> +			   u16 addr_low, u32 value);
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
