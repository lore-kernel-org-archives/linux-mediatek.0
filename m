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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D9AC43469
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:17:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 440C120739
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 16:17:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IblEeBn4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8BLN9iV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 440C120739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CAa+C88qqrYdymXBMZThZTOkfEET5eY0Dl7A9TjjS7c=; b=IblEeBn4/1Y+6o7dynY/G4ZHs
	9OyMxBPNFHBuK3HfONxrj7exNWm6Ee0RyGBw3UPZ1ruaqEdAFbcBjZm1j7Rq4HMcLlStLrcVYiFlR
	6G1peu8WFGt3SIRIgvjMRAcdYVmGHVxQ2aWrKpIOoY6l/hSZ3pqpiPJn5TFj9phulxBBSfo+MsEDA
	BVi8JPsVv1Ke2llKqkHDbn9buN6qk/aQMIoJvW5cQr0uhFEXLeLkYPOHRWni2f39XbxN+LuaKmF5V
	SjesgKAmxNKQk59volsaf7V5lzPCzDySMCvO95daGAs4xsVtPmqhkTOhyjlUSOkEGvjN22IIBGCvr
	MkDmoOhAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKOUp-00024G-5h; Mon, 21 Sep 2020 16:16:55 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKOTm-0001ZM-VO; Mon, 21 Sep 2020 16:15:58 +0000
Received: by mail-wr1-x441.google.com with SMTP id s12so13406191wrw.11;
 Mon, 21 Sep 2020 09:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zZPtr60mHTjlNfqCvJeoZ3ko5+1eq2V7IMw/TOsfPRQ=;
 b=K8BLN9iVlIHxqwxjYXAkd6As9BW0RggJe7sjNn+mBBgCUQ2HLR8MRkhj9cpa3Q3tiF
 hbfpW3sJSZtSeOAY2P3zwddPEAglOL96HMb75BTU+j6CoRDcIXOr1wPPFjLTUgBQWxHi
 RNXt95VTVj0oc+r0ARYHsSTmW49ybfwgmD4Nk6Dw/VOoOFAZpCNCj6ABgsVds0llyZpt
 TJ61HLbVYxz7mggew/BVq62CyDMj4jM/iiTOIPMDVRvcNRNpGKmx7Kb4kpnz8Fi9H1M0
 IeVO8T8oqC91sRnAhj3mEoHuDypw1xWylKoblf+W1lCQlDcmlIgSK+Rs0TDqPtkt1VSf
 eAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zZPtr60mHTjlNfqCvJeoZ3ko5+1eq2V7IMw/TOsfPRQ=;
 b=GGSxSsI802V4bwcAZ4xybyxh1C+t4qgrSWUMYflCRx5ycpqmIOvqKMMb+VP9qymX4d
 R+Q/PgzAlmPUfXqSduEQkITlcWv5i78VUOTvV/0NhYvhSlW9nG0kdo3nl1OfE9abdd0M
 IlUwPiOUOBN6f9r3G2FeYlDbhPc2xmnv/mI02RpdMgaXtjaRt7+VY8kfOfiJYMuUOLW1
 z6LezMsQQ+SbZAn1NFf1Q2XHfkr3NGfK7BpMb+BCMPwSU2kwJRvGRhWgMw7TG4PeIwzq
 2R0o6qhSsezb+xRYI4sm5eJJ+25cQ2hpbr2h4r2UJhFSmi6dlAyk/Tpio4WleAVrn4KL
 bR5w==
X-Gm-Message-State: AOAM532LM5YN+am7LgUtsyzL8+LH/OeDUPZYVtdheRC1VYS0Gj2QErT+
 UZPy5po03O7c8OXwKhiAXXQ=
X-Google-Smtp-Source: ABdhPJyaI/j2BOiQ7LXv2eZPHmz6CaxDkz9OPzl3YJYlKBDrLEo6lJVeoR/a50CUcy2rfo0sAUN0KA==
X-Received: by 2002:a5d:6784:: with SMTP id v4mr598735wru.132.1600704949233;
 Mon, 21 Sep 2020 09:15:49 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id f12sm91029wmf.26.2020.09.21.09.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:15:48 -0700 (PDT)
Subject: Re: [PATCH v3 3/9] soc: mediatek: cmdq: add write_s_mask function
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>
References: <1594136714-11650-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1594136714-11650-4-git-send-email-dennis-yc.hsieh@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d37643f0-bf2e-264a-6dc1-cdd485b18576@gmail.com>
Date: Mon, 21 Sep 2020 18:15:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1594136714-11650-4-git-send-email-dennis-yc.hsieh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_121551_230344_4FAC9AF1 
X-CRM114-Status: GOOD (  25.66  )
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
> add write_s_mask function in cmdq helper functions which
> writes value contains in internal register to address
> with mask and large dma access support.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>

Now pushed to v5.9-next/soc

Thanks!

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c   |   23 +++++++++++++++++++++++
>   include/linux/mailbox/mtk-cmdq-mailbox.h |    1 +
>   include/linux/soc/mediatek/mtk-cmdq.h    |   18 ++++++++++++++++++
>   3 files changed, 42 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 880349b3f16c..550e9e7e3ff2 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -242,6 +242,29 @@ int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
>   }
>   EXPORT_SYMBOL(cmdq_pkt_write_s);
>   
> +int cmdq_pkt_write_s_mask(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> +			  u16 addr_low, u16 src_reg_idx, u32 mask)
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
> +	inst.mask = 0;
> +	inst.op = CMDQ_CODE_WRITE_S_MASK;
> +	inst.src_t = CMDQ_REG_TYPE;
> +	inst.sop = high_addr_reg_idx;
> +	inst.offset = addr_low;
> +	inst.src_reg = src_reg_idx;
> +
> +	return cmdq_pkt_append_command(pkt, inst);
> +}
> +EXPORT_SYMBOL(cmdq_pkt_write_s_mask);
> +
>   int cmdq_pkt_wfe(struct cmdq_pkt *pkt, u16 event)
>   {
>   	struct cmdq_instruction inst = { {0} };
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 1f76cfedb16d..90d1d8e64412 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -61,6 +61,7 @@ enum cmdq_code {
>   	CMDQ_CODE_WFE = 0x20,
>   	CMDQ_CODE_EOC = 0x40,
>   	CMDQ_CODE_WRITE_S = 0x90,
> +	CMDQ_CODE_WRITE_S_MASK = 0x91,
>   	CMDQ_CODE_LOGIC = 0xa0,
>   };
>   
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 9b0c57a0063d..53230341bf94 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -122,6 +122,24 @@ int cmdq_pkt_write_s(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
>   		     u16 addr_low, u16 src_reg_idx);
>   
>   /**
> + * cmdq_pkt_write_s_mask() - append write_s with mask command to the CMDQ packet
> + * @pkt:	the CMDQ packet
> + * @high_addr_reg_idx:	internal register ID which contains high address of pa
> + * @addr_low:	low address of pa
> + * @src_reg_idx:	the CMDQ internal register ID which cache source value
> + * @mask:	the specified target address mask, use U32_MAX if no need
> + *
> + * Return: 0 for success; else the error code is returned
> + *
> + * Support write value to physical address without subsys. Use CMDQ_ADDR_HIGH()
> + * to get high address and call cmdq_pkt_assign() to assign value into internal
> + * reg. Also use CMDQ_ADDR_LOW() to get low address for addr_low parameter when
> + * call to this function.
> + */
> +int cmdq_pkt_write_s_mask(struct cmdq_pkt *pkt, u16 high_addr_reg_idx,
> +			  u16 addr_low, u16 src_reg_idx, u32 mask);
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
