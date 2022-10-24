Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A14C67871
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 22:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByQe9Tozm56e2z/SgB3MMCCorS7ZbSTQRv+bdNrKwdE=; b=w3pLlRELPCs2UaUm8GUaCvf9B9
	imWBqSf/9DxyDRFaJATiQdyS+8bfDm4aIemRvLZHoKSj3IrDXidDoQ+6CMMnc9Oc/GVOL8F/GJHVu
	Q5Qga9b6Jzh4+oWD2jbGDaylB6Zl4B8BoU23YXGo4M9V+JgFTfgJRYvqnKUczsA1aBSlchw65V9OL
	EsRc9hg/H3PTlfU56EHGrAUKCh9wf0IDVf3A8JY1Bwe6q+xfuK58ZrOI+0CilmZokiTitylPr3UYi
	AHLB5lZr9ZeUebOamlKk4VtowqUKdlCKKVmHkyVONohdSV9comYIV+VJYAhKAlNPUX9NafYZM4V8z
	OMqOQ3rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5dz-003E3L-Jo; Mon, 24 Oct 2022 22:10:03 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5do-003Dzz-7J
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 22:09:53 +0000
Received: by mail-vs1-xe29.google.com with SMTP id a2so9209785vsc.13
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Oct 2022 15:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ByQe9Tozm56e2z/SgB3MMCCorS7ZbSTQRv+bdNrKwdE=;
        b=JgdDEVBxg/ntSWNzMrV2+DAouotMkeLAl8ig+QRuxdAxGtxDaogmaDiUj5V8NyxKfK
         WDiASJc1qpyDfiBni5iH7FGk+hafgfLKCFKh4c7X1IfD77F85ZbkjHoXkOayVMF98Bdt
         nHgATL15mNYC6xRj1cDcWULvtUJHZfhqB9x2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByQe9Tozm56e2z/SgB3MMCCorS7ZbSTQRv+bdNrKwdE=;
        b=CdZz3TDFLMTrwy4GPO9emn4J5xg16D1QHXyCtyDA1x1SryF/qhr7vs/uOTFQpHQAd8
         +bRNjZ+NzWk1w31vArhS3Gwx97wd2RO3zKo7E06AUDEzZvyrBqJNyZEwR5EqI+rIOtV7
         J5wwFYsZt0/hxc2IxCRHhhl2kVYO8HlcFgeAJt7Np/EuXFwPU78Ddfbx1HNhoeMxPsP1
         OVsQhav68Lk7xq8/8pSVxVb88E+mgm7ch3e3IxE7//CDiCI/76ZvaAkp05wqo/iymjgq
         NxJbHEgcnwPbWfBYN6bPynjFtWbYZTO2H5It5MtjPE7E36Jl/vvxMAK0VWy5XBcvr9O6
         gV5w==
X-Gm-Message-State: ACrzQf2X5CFUSt8d1xX8zUuTceG9KiicgjB276cHv4SfJ9BPQojzUMrq
	DXJe4ZL9ZEMeX3xf9VWbJ6Um8+ld9Uidie0KSQFy8ajA9gAUkQ==
X-Google-Smtp-Source: AMsMyM7A2eK5sg7PivulAlOOyHSElA3puwh6IhCEXpMZi6C2X3SGLXYd7wCb17hHCkzTdu1UUZhq9l8JVdzWoRJi0cI=
X-Received: by 2002:a05:6102:38c9:b0:3a9:7206:b99e with SMTP id
 k9-20020a05610238c900b003a97206b99emr20719006vst.65.1666649379415; Mon, 24
 Oct 2022 15:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-7-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Oct 2022 15:09:28 -0700
Message-ID: <CAGXv+5Gx2hSzKSdizThXLshz0ZhO_VUwDCbckUrWOjjy1pTHZw@mail.gmail.com>
Subject: Re: [PATCH 06/10] clk: mediatek: mt6795-topckgen: Drop flags for
 main/sys/univpll fixed factors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	miles.chen@mediatek.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, jose.exposito89@gmail.com, 
	yangyingliang@huawei.com, msp@baylibre.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_150952_268037_06D7D226 
X-CRM114-Status: GOOD (  11.66  )
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

On Mon, Oct 24, 2022 at 3:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The main/sys/univpll clocks are used as clock sources for multiple
> peripherals of different kind, some of which are critical (like AXIs);
> a rate change on any of these two will produce a rate change on many
> devices and that's likely to produce system instability if not done
> correctly: this is the reason why we have (a lot of) "fixed factor"
> main/sys/univpll divider clocks, used by MUX clocks to provide
> different rates based on PLL output dividers.
>
> Following what was done on clk-mt8186-topckgen and also preventing the
> same GPU DVFS issue, drop CLK_SET_RATE_PARENT from the aforementioned
> clocks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Looks good to me, but I'm less familiar with the design of this chip.

