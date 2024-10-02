Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C88CF31B7
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 12:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1PbCagmKSyF5NfFazt3PlNiAfcyN7P8zftXuIOnLEJk=; b=riNo8RwsnhOiLY/Ve5DYoDsIlJ
	BkhqwdCIxnblG9/0M9tx2HcOWtxj2MIRn/WUdBnMZWAvD9qCMVGelihXDOdCZlEhOtlmcPVQo0WAd
	0AHU5EvxvizVOQztbKL0DkDkyHqeP0uCLRu47kAPEI1kqKpqTPvw8wfShKch5lsZCOytWZN5bWwg+
	NgjTm8RkJbEBDKcAlUG1jehBJOiY72pvJTI4eo9JsyzTxpHVBBtJLcaik8veRjT8QUbCEP2v8uwHp
	IU4opF+DWdLVJAKOTAKYYY0uUyiTRrZGyzweY/aHaVngP1+laTSJlLuckCpEwin4UdtJfkYy/FA12
	mLcZ5LQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svyqJ-00000005zED-0Nu6;
	Wed, 02 Oct 2024 12:52:35 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svyqG-00000005zDI-1Onu;
	Wed, 02 Oct 2024 12:52:33 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5398cc2fcb7so4804283e87.1;
        Wed, 02 Oct 2024 05:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727873550; x=1728478350; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1PbCagmKSyF5NfFazt3PlNiAfcyN7P8zftXuIOnLEJk=;
        b=cAMr7oRd79I9T21B2jyL4wmvmd6LSaCQ31XHioYO7ceRdypSWGDhotK4dbsMDllvZ+
         +jfz5GAK/qkFmByC4dNuEartrAkU0P4OxjGRcrGAhIZFEzLbsaVNDaTem3eWfqpwKZ+5
         gf1A+MTnmqXbUouHC3X4cMOtKCH5L9HBcH7XsiYuvPbAaL3G4GEXZpu5Me4Xh6RkA4oJ
         cUTCO544lKRKG3lqX4wTKjSEKX3+X2nYdImtQc3Tgd5VfIvLz5rLlEx8/P4/SWc3QxsM
         Txp3relkG+DhFr7Dz53SSxF3A2udyHVTjHYhI0Ug4yEiSJUrnOGm9JmxIiPlYm8uKo6q
         TsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727873550; x=1728478350;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PbCagmKSyF5NfFazt3PlNiAfcyN7P8zftXuIOnLEJk=;
        b=mEJDFl3bEb5PzJpZ4pv0qI7vk0G3N1FoOc9/HLzWzakF4DBfhWK8Aa/zNQVOuJWSL8
         f7Ps+yV0uo6T0rey1ecLtJgxCUob6QlefjuLPW3AlEOXsjIT33dgJeqinkObVMwY6sxq
         /nRGBJ2LrwDuBfg18xLbijPvRakVU71/JgunC6z5Sd66ntWhFpK0GDT0kmrwj5D4eAp1
         bBsG39cbotUKnASWHXWFOpC0ObWBI73tMx1kIXJAi6+tqmQYoVdPJb/vdoBPCWPXPjVc
         StRy2eXAPuFO77vdXlRBpTGTkF79paJuXgu2hkxKie+DsIumuDGj6qsRSDbgyYGGWc1F
         U2sA==
X-Forwarded-Encrypted: i=1; AJvYcCU7PBfKAnx56wfpXxa/BtVYAZiJ+uJL+Sd042ivCLeDuFK/0ftgH7zlfCNKjZRkhtusIVH5SlWFQRnNwfAb0ZE=@lists.infradead.org, AJvYcCUqKanGsnOyFpmEITdIpkunTAjwUVPE7l3jSqoqT3ZwCHPwHiApwn4VI1lX60+/iRcNw1dhv97ShXahVVKLfxzs@lists.infradead.org
X-Gm-Message-State: AOJu0YySKr1PIV66PWOnZ0BEiqQpfEtHMy2CeLTh5kCxObH0gcM8LT2c
	UBSYorziCXjhOO527NjhJtBYcnn5IObOXcgl4Nk7ZdoGIYR2/qG/
X-Google-Smtp-Source: AGHT+IEkHmSoDixHs/VplPEvIUMIMClIFrcuXm8VLSW0qSt6KY1AQ5IoxFZ+eDLS86l5ehfDXsXI2w==
X-Received: by 2002:ac2:51ce:0:b0:539:9524:92bc with SMTP id 2adb3069b0e04-539a07a66fcmr2088738e87.55.1727873550108;
        Wed, 02 Oct 2024 05:52:30 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.162.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93d4bd51f3sm733367066b.92.2024.10.02.05.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 05:52:29 -0700 (PDT)
Message-ID: <e482ec86-c7c5-4fa3-b035-a469161b9eb1@gmail.com>
Date: Wed, 2 Oct 2024 14:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] soc: mediatek: mtk-cmdq: Move cmdq_instruction
 init to declaration
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20240918100620.103536-1-angelogioacchino.delregno@collabora.com>
 <20240918100620.103536-4-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240918100620.103536-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_055232_411541_2C03A22A 
X-CRM114-Status: GOOD (  15.95  )
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



On 18/09/2024 12:06, AngeloGioacchino Del Regno wrote:
> Move, where possible, the initialization of struct cmdq_instruction
> variables to their declaration to compress the code.
> 
> While at it, also change an instance of open-coded mask to use the
> GENMASK() macro instead, and instances of `ret = func(); return ret;`
> to the equivalent (but shorter) `return func()`.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 200 ++++++++++++-------------
>   1 file changed, 93 insertions(+), 107 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index 4ffd1a35df87..0b274b0fb44f 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
[...]
> @@ -474,11 +463,12 @@ int cmdq_pkt_logic_command(struct cmdq_pkt *pkt, u16 result_reg_idx,
>   			   enum cmdq_logic_op s_op,
>   			   struct cmdq_operand *right_operand)
>   {
> -	struct cmdq_instruction inst = { {0} };
> +	struct cmdq_instruction inst;
>   
>   	if (unlikely(!left_operand || !right_operand || s_op >= CMDQ_LOGIC_MAX))
>   		return -EINVAL;
>   
> +	inst.value = 0;
>   	inst.op = CMDQ_CODE_LOGIC;
>   	inst.dst_t = CMDQ_REG_TYPE;

I would add all members that are not based on left and right operand to the 
definition of the struct.

Regards,
Matthias


