Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B229C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 03:23:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21EE960C51
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 03:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21EE960C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ze7xtYvWNDgqiePjVg5+vHhukbg9fe8aceJFFbDnaQ4=; b=jVvi6te1/vmonb
	OfrOkiSO6cnZuOByp+HENVyzPnTHhUx645ZBPekGSGfO8ruNRF3X+zPTkyT/w2/yyCBh2tIvuNGa3
	JVaO+qdMmlqAwyWZM52jl5e1zk1JguH+OIzMgPD6Bh4eqE8hIe7TfmkJBttLrEN2TxHZC8SbaT8kG
	FYK2ap6bKIq0+FFvZK7ncnTJFW7x/XOClf0s3Msb/JDUFdR0jNGK3N7KZBU3FpOmwjLPhIALF+Lnk
	H28GiQ+8G4kK+AeMKGwxo/6wip6qmQF2uuGogANNTRCNNSjmyxnUW/hp1j4acDc6xrdvho2MSFFLO
	mzj9T1NNH9Dd1WQOvpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCvt6-00H1Qd-8o; Mon, 09 Aug 2021 03:23:40 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCvss-00H1P0-JA
 for linux-mediatek@lists.infradead.org; Mon, 09 Aug 2021 03:23:27 +0000
Received: by mail-lf1-x136.google.com with SMTP id w20so4368102lfu.7
 for <linux-mediatek@lists.infradead.org>; Sun, 08 Aug 2021 20:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mxoe8ehx2Vi2y4afm7gLthqvb5ao6MbjaelzeHBMKik=;
 b=q/Zl/iRSG6c/YsgaY48vbGEN4c/w8jgzqDkmTLGeAD/ceUoxEHEV0of9v0CfFN4sYp
 /jQhut2BLnjKmy6ddXsA10qPQDJMcrQJY5PKNPChLVZCH29Tm4tiUWCL3CbHW6VDKbwg
 xuzKN73tQPqLuA4lHVClUCcueQyvJgX6YYcEagQ63LxV1LUdQOzEuBUCMGRlSYHpmDGl
 zoCFc844we/Ko56ys3bmodpP5EkXbX2fSFtBKeu9B2ABgwQTCEf6zseqC0SpawMLt3pM
 6fwaiLb700kqRIoywGMqEzWt1X6MxF5u3zxXTHJzIpGVNpbYHrztTQIv9904UDgLAj8E
 8JTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mxoe8ehx2Vi2y4afm7gLthqvb5ao6MbjaelzeHBMKik=;
 b=HfdCLFBF0PZwXkmSNjwdDJJtLZeuDCb/pzfpsVbQg7bfpB4pJQI9JnM3kEC4JjsVKV
 PMnGV+bSB99m57B3NJTE5iyOx93Ddsc+fqwmxyEAShKfTdALzRNkRhB2KnMyClSAIggz
 iZ5WkArQsk6Irp+CUaUpG9OG4qG6sPDgyp+a+47wLJ5dpbePRSOEVo887F39xr4Pu+n6
 M2+c5/Smlj+FYOXLGGHyV0SrPCkXn8CqIo4afOMoQPDuNBND0ryJFKoyvca2sY5ibxKE
 Cd9i9NjrK3lA577uGItfirS8uoStLGZReDSxB29syDJKe2XFkOF0Xteu8LsPc2C9ErKy
 xPrA==
X-Gm-Message-State: AOAM532YxHTMtT/kbKpGV16mxJmW3SojwDtn85fRBsycOhd0ZmzOR6M9
 himT7LZAbrUgQeB1HNhz9D27AFISOa29CkRcR1bJLg==
X-Google-Smtp-Source: ABdhPJyF5d28CUqPE1qLCZjGKLbJzgTLfTykog6rlo7Obra6pUgcXcZSei8APEftxH0BfOw8s8nvQbvyRxvAdceRU0c=
X-Received: by 2002:a19:da01:: with SMTP id r1mr6694335lfg.437.1628479401416; 
 Sun, 08 Aug 2021 20:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
 <8fe5ac46-a9db-710e-a6d1-856805ab2773@collabora.com>
In-Reply-To: <8fe5ac46-a9db-710e-a6d1-856805ab2773@collabora.com>
From: Eizan Miyamoto <eizan@google.com>
Date: Mon, 9 Aug 2021 13:23:04 +1000
Message-ID: <CAOak1e_xw84Q+ikAn7TEqie00Sbv4Qpaax==jZ5MJVfPP1pf0Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] mtk-mdp: propagate errors from clock_on
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: linux-kernel@vger.kernel.org, wenst@chromium.org, houlong.wei@mediatek.com,
 yong.wu@mediatek.com, enric.balletbo@collabora.com, 
 devicetree@vger.kernel.org, chunkuang.hu@kernel.org, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_202326_661439_B0BB9BC0 
X-CRM114-Status: GOOD (  17.85  )
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

Hi Dafna, thank you very much for spending time to review the patch,
your time spent is very much appreciated.

On Thu, Aug 5, 2021 at 4:06 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
> > +err_clk_prepare_enable:
> > +     for (--i; i >= 0; i--) {
> > +             if (IS_ERR(comp->clk[i]))
> > +                     continue;
> > +             clk_disable_unprepare(comp->clk[i]);
> >       }
> > +
> > +     return status;
>
> There is an API function clk_bulk_prepare_enable to prepare and enable an array of clks
> so you can just use it.

As per Enric's suggestion earlier in this email thread, are you OK
with me making this change in a follow-up patch, particularly since
the logic as it is was preserved from previous functionality?

> > -static void mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
> > +static int mtk_mdp_clock_on(struct mtk_mdp_dev *mdp)
> >   {
> > -     struct device *dev = &mdp->pdev->dev;
> >       struct mtk_mdp_comp *comp_node;
> > +     int status;
> > +     struct device *dev = &mdp->pdev->dev;
> > +     int err;
> >
> > -     list_for_each_entry(comp_node, &mdp->comp_list, node)
> > -             mtk_mdp_comp_clock_on(dev, comp_node);
> > +     list_for_each_entry(comp_node, &mdp->comp_list, node) {
> > +             err = mtk_mdp_comp_clock_on(dev, comp_node);
> > +             if (err) {
> > +                     status = err;
>
> You can get rid of the new var 'status' and just return ret in case of error

This seems like a nit (please let me know if you disagree), and it's
also cleaned up in a follow-on patch in the series ("don't
pm_run_time_get/put for master comp in clock_on"). Is making the
change you are suggesting here something that should require uploading
a new series version?

Eizan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
