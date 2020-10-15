Return-Path: <SRS0=+2Q0=DW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02143C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 09:14:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61FCB2222E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 09:14:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XdPo6gow";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3DdtBPX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61FCB2222E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C5z0drTkIh/8irz0f7FH3EYz4aezPu835VSqhqFoUFs=; b=XdPo6gowJG5hFU0tfLNv/LPzv
	qChWs1wOUKMhcK/tC7U/aVrV2DTnF90estrOKJh3Y2EiL+lVYFfZwt8Aep7vQM0Kw6U3GAnr9pOrL
	ih6Wqsvm98UfSHtUF08HpAgudGSVvxLWt2BBRVFe6oxYJ98m8VyG5nDSAXGsVc23AQrkbJauElGCa
	oG2sYer7eAhG3cSB46CwTuTLc4Kv4RU9hKUynrHlXywPbBuao0kqzYOa0jhDR9TiKD23eBjItFZ09
	EyHrWgoAS70YeXk8jKncs0yWdQaowcB4wsmZqlqFEOJnGuTGi3nndmQXYg/mrB/KwAik77ozUw0Bc
	kS0DD77sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSzKd-0005En-Pe; Thu, 15 Oct 2020 09:13:55 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSzKa-0005DJ-HX; Thu, 15 Oct 2020 09:13:53 +0000
Received: by mail-wr1-x443.google.com with SMTP id s9so2476132wro.8;
 Thu, 15 Oct 2020 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A5VqVZaCxXPdKV0bJ6e/lxbXj3PVs7Fd+/vx+IhRFsc=;
 b=h3DdtBPXe4J+VunFr8LqpY18tJf9rTH9HJEsmp8EvUOZK+jnA08olp8uDK3lTC69Fp
 bOdKJjubfdgKAsufE4rpYqtTj+zuKYm4kNxb24GhXlhXe380SQoDV2Xfm7vC7C5K4ujI
 NUTL38uf1p/fnpgsgkMDBsRtwVZmfV0a/l5RvJm8gKkUx8S5impL+5Nwho+e3DdQgeiP
 rNJzrHs7K0j391iiDzf8LVq6X9pEDqZQ6sEWDLQABmXnQS+g6xG1uiyqj4uL4w1CHL2x
 jr4Xe58aGLZgJsSZ6Iq7V26MchlrcBphi2cpUCxQfGH3V/ikX1A9VLfwpIVWFPMuQtlb
 FkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A5VqVZaCxXPdKV0bJ6e/lxbXj3PVs7Fd+/vx+IhRFsc=;
 b=nq7zuV05Kcptdk0IIzS1aqQokiQjuzzMWGJ9CXnJi6WpLEwZ0LblviKUpJnYsd22Ut
 QsLS8rMZMf11fIMUirkKjqVBf7onD7TBe0E23zw8EfI14S5f5B/qhqFQkB1aweEqVJCR
 jdDyeyeW2sREt9FhnkJEHGaMQd2ImA4ea/0rPJWrZGtMW1ULEaq8HPRqs0tfvAqc5Hut
 purNq3CfmhiFyroQk9ZYLsgP6db5tLiIPz5j7XN06uSeuJMiOJUsRV/1c0OqPHMnPX4Y
 WTgEM9UHCapAvMhi5eXyfkidtaj1W7vTB2pV6lNW0C1dC5eXij7ZyZDlKosbK96C805D
 f6pA==
X-Gm-Message-State: AOAM530mm6whqNqENXrQ8h40OSXKBGp1SFN2IaOeejXGmwSjPZLUTjhH
 phG0adHILC97Tx+48Pyyg+g=
X-Google-Smtp-Source: ABdhPJzFwvWaKtfDPdwDPVvA9EabbSQw9Ukdhfdkgwnoo5xuU9VSbTIlTrGeB7ahBceyeanZcP/arg==
X-Received: by 2002:adf:a345:: with SMTP id d5mr3414231wrb.55.1602753229966;
 Thu, 15 Oct 2020 02:13:49 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id d7sm3233985wmd.48.2020.10.15.02.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2020 02:13:49 -0700 (PDT)
Subject: Re: [PATCH v7 2/2] soc: mediatek: add mt6779 devapc driver
To: Neal Liu <neal.liu@mediatek.com>
References: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
 <1598497593-15781-3-git-send-email-neal.liu@mediatek.com>
 <c41ec664-73a0-3c63-a31c-48c89028dfac@gmail.com>
 <1602124514.28301.17.camel@mtkswgap22> <1602728017.11536.5.camel@mtkswgap22>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <bf202a0f-49e3-c618-5d74-934fe739dd18@gmail.com>
Date: Thu, 15 Oct 2020 11:13:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1602728017.11536.5.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_051352_614896_4448B352 
X-CRM114-Status: GOOD (  23.00  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 15/10/2020 04:13, Neal Liu wrote:
> On Thu, 2020-10-08 at 10:35 +0800, Neal Liu wrote:
>> On Wed, 2020-10-07 at 12:44 +0200, Matthias Brugger wrote:
>>>
>>> On 27/08/2020 05:06, Neal Liu wrote:
> [...]
> 
>>>> +static int devapc_sync_vio_dbg(struct mtk_devapc_context *ctx)
>>>> +{
>>>> +	void __iomem *pd_vio_shift_sta_reg;
>>>> +	void __iomem *pd_vio_shift_sel_reg;
>>>> +	void __iomem *pd_vio_shift_con_reg;
>>>> +	int min_shift_group;
>>>> +	int ret;
>>>> +	u32 val;
>>>> +
>>>> +	pd_vio_shift_sta_reg = ctx->infra_base +
>>>> +			       ctx->data->vio_shift_sta_offset;
>>>> +	pd_vio_shift_sel_reg = ctx->infra_base +
>>>> +			       ctx->data->vio_shift_sel_offset;
>>>> +	pd_vio_shift_con_reg = ctx->infra_base +
>>>> +			       ctx->data->vio_shift_con_offset;
>>>> +
>>>> +	/* Find the minimum shift group which has violation */
>>>> +	val = readl(pd_vio_shift_sta_reg);
>>>> +	if (!val)
>>>> +		return false;
>>>
>>> So bit 0 of selection register (pd_vio_shift_sel_reg) does not represent a
>>> violation group?
>>> I don't know how the HW works, but is seems odd to me. In case that's bit 0
>>> actually doesn't represent anything: how can an interrupt be triggered without
>>> any debug information present (means val == 0)?
>>
>> This check implies HW status has something wrong. It cannot get any
>> debug information for this case.
>> It won't happen in normal scenario. Should we remove this check?
>>
> 
> Sorry, I missed the most common part. Is function is in the while loop:
> while (devapc_sync_vio_dbg(ctx))
> ...
> 
> We keep find the minimum bit in pd_vio_shift_sta_reg to get the
> violation information, (pd_vio_shift_sta_reg might raise multiple bits)
> until all raised bit (shift group) has been handled.
> So I don't think it's necessary to add WARN message in this case.
> Thanks
> 

Correct we would get a warning every time once we have read and cleared all 
violations, but we are only concerned about the IRQ triggered with no violation 
present. But we can skip that check for now, if we see that there could be a HW 
error we can think about it in the future.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
