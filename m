Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B795AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 03:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uM0SoVjFzNNGKb79YSEbme9xN/V987yjDaq8t+i3zBQ=; b=c+GUhPDPF6dNnw
	zy4MQdnW9aoOVqcmg3Dums4e3DlIEJxFmjFiSiNreqlh7tsgHhX8I05aVIhv8hwk/4UQQBI/sDuZL
	/RzpsW3kCJ9Zi7Bde5SS9Vd+uCvmc9abFJ9AVyPhBrPqnapLvvLlCTdB/nPKOKgO7Q6V+fsXe+dKW
	aemdHlfZkuRm9wmuxLbYZHaAm+0QomiRu7Pr6ya2Ye6Jf71V/y/h8GGsEzAUzXyJ110kH7ivJmCq7
	hYyTexIvoHE7msZNrDRnXlo2Wqf4ovCZi50jkkBeCd8HluqCL+fk0rOJVoH81S58pPaFkfVu//5w7
	CiGeKZ43Zb37RJWSmK9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npLvD-00EIFg-8T; Fri, 13 May 2022 03:24:55 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npLuz-00EIB1-VB
 for linux-mediatek@lists.infradead.org; Fri, 13 May 2022 03:24:44 +0000
Received: by mail-ed1-x52b.google.com with SMTP id c12so8411987edv.10
 for <linux-mediatek@lists.infradead.org>; Thu, 12 May 2022 20:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dsUfqE+Asp1gNUkJYB0COTXKbzgCWxG3zxsJ5TkJHqU=;
 b=AFPRfp+LmQIDkPXMKr02tf0SObEzYQ9vjFxnrPp/pI7us+kD0uO22lsQPf+kEah98i
 JIrxehfF4eXsHUeE6eJHZZfStVWALFfBwoz0rniInbdBCZn834Cj3q+x4Rof2PES77Pz
 7Cn/vnjdT3dB0amG/DWEQYycMmqlaSRCcwO3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dsUfqE+Asp1gNUkJYB0COTXKbzgCWxG3zxsJ5TkJHqU=;
 b=jmXyvbb/sA8mn9o0CsWxnCzOtkCSpvn9z2+cNOwqQ9GF0sWmesYnDNtlenqGVb4Fs6
 JK5rw9OqHJWeWlgE0RnCgKAs4qOsl8s0YlJskfeInhFpKWqK5jnxprWbr79657dADoM7
 VKZW0IOpnLQQKR17xUFdF++ewJ3ugIaMVZa/Z4agzt8JbHI3tW+vyaaYfwn5MuqUyvem
 PLXabaMOVicFqkBRux5yP6W17dEM6kod5Lxwevhe8BcPS9Nvo7nvouy64OBIAhIfD+wd
 Jg76Afks+WSjps8F8kWfpwk5zzTSGJElpDb+HV1i+vcVyW5ucBit50N50kAYq74aXZrJ
 FeYA==
X-Gm-Message-State: AOAM531uMI8TgYrHXp5gqrZ1MuY+zFLCcFElXDQ5C9Zf8rtGH21S34GS
 ZuR2IkXznOxRn2/cUxYqTRdzzxyzGcZu1dZRMKNDCw==
X-Google-Smtp-Source: ABdhPJyemQEQJ87mCvmVJk9JNFNVUXVKoddMhChDbRfTDCX1kw/pVm0m1xb0vuVB4JDhcv8QsmzONfgYGd3OsK04Qlw=
X-Received: by 2002:a05:6402:34d6:b0:427:cc9d:a130 with SMTP id
 w22-20020a05640234d600b00427cc9da130mr38203722edc.356.1652412279705; Thu, 12
 May 2022 20:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220510104804.544597-6-wenst@chromium.org>
 <20220512144924.4114-1-miles.chen@mediatek.com>
In-Reply-To: <20220512144924.4114-1-miles.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 13 May 2022 11:24:28 +0800
Message-ID: <CAGXv+5Fipb2Sjypv8ayRbHqNfiLxtaFXatM-vMRtX2UNFzZ-3g@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] clk: mediatek: mt27xx: Replace 'struct clk' with
 'struct clk_hw'
To: Miles Chen <miles.chen@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com, chun-jie.chen@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 matthias.bgg@gmail.com, mturquette@baylibre.com, rex-bc.chen@mediatek.com, 
 sboyd@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_202442_029774_E9CE388B 
X-CRM114-Status: GOOD (  16.07  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 12, 2022 at 10:49 PM Miles Chen <miles.chen@mediatek.com> wrote:
>
> >  static int clk_mt2701_bdp_probe(struct platform_device *pdev)
> >  {
> > -     struct clk_onecell_data *clk_data;
> > +     struct clk_hw_onecell_data *clk_data;
> >       int r;
> >       struct device_node *node = pdev->dev.of_node;
> >
> > @@ -110,7 +110,7 @@ static int clk_mt2701_bdp_probe(struct platform_device *pdev)
> >       mtk_clk_register_gates(node, bdp_clks, ARRAY_SIZE(bdp_clks),
> >                                               clk_data);
> >
> > -     r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> > +     r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>
> We have of_clk_add_provider() and of_clk_add_hw_provider() the same time,
> so we can convert of_clk_add_provider to of_clk_add_hw_provider by 2xxx, 6xxx, 8xxx,
> without introducing build breaks.
>
> However, there is no mtk_alloc_hw_clk_data() for mtk_alloc_clk_data() in [1]. (03/11 in this series).
> For bisectability, patch 3~8 should be one patch, or we should have mtk_alloc_hw_clk_data()
> to help us?

As mentioned in the cover letter, the patch is split between the manually
edited parts and the coccinelle converted parts. This should help with
review, especially trying to identify which part of the coccinelle scripts
failed. The split also reduces the size of each patch so that they don't
get blocked.

I opted not to add additional APIs, as we would just be removing them at
the end, and that just results in even more code churn.


ChenYu

> [1] https://lore.kernel.org/lkml/20220510104804.544597-4-wenst@chromium.org/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
