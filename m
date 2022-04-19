Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4079CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 07:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vgTU+gtvYAKBR+/7CyuN/wbxW+qLmqMVfJ4bORGOkyY=; b=Pr1FuOIlvghJOy
	39L/iZXVrA/Ido4+uB2ouyH+9CKRhDob+ONdUWgIeOMP4/QnOtai3Un0Xza07igZOlLmIXoFQ7Kqd
	Nz65OTtWUsUW59ciCSmn65xm6QUSkIBKjwkOHib7EzMKAfF1hqpHbcCQs1vNLcYeeQy28u1PjnqM0
	0UUEwMfuMq44s0wfyiqLgCjw2N7E6QC2ykkrAtduP7NZrx9kIuwqk9aNck8skHRADATi+tKl4QaSo
	Inm+7h8WeKzrpyDTIE0elCsXiw08/NNr99iPQkHD2JTwQTxwsOeUkSkfF2ZudUjHECUQZBqgP2clR
	UnhKg7tsj5prxhy75Uhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngiJj-0020Ol-RM; Tue, 19 Apr 2022 07:30:31 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nghpX-001oNu-Vf
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 06:59:21 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id g34so29455536ybj.1
 for <linux-mediatek@lists.infradead.org>; Mon, 18 Apr 2022 23:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KLIrmWP9mXkLIC9iIHIn3XCQoyxe5sOSyoG//x2aOB8=;
 b=ThTeM3jBhBi2PiZY4yzkoSbixU5AkEHN0BKQVu2jZHDget4O3JgkMf9IsR5Zh8cPWZ
 Kh6IPc3MfXo81VDJ8zu2NXays2VI1Py8TNWRih6cW/zMfTr1eYTM/cE1+8DgVcbkWAqO
 B57yNQW8rfX0tdpnq9btq3LQ/72k6jMszPNeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KLIrmWP9mXkLIC9iIHIn3XCQoyxe5sOSyoG//x2aOB8=;
 b=WkloOKgpjZsylzrMzeX2zO9LjoL2j6Aag0GX2Cbaak/qoh6/8khyQS2+RYgiK/fVeq
 rHf0dPpv7cwg6wlYbJ5e8XNifS6oH+BwGaBNFT+zEh4h1x1APPpiCUmNscbce6fqcxNM
 xIzqhGKoOgvHOffwoITLKAN99qGUEtHd7O1IxvixmZAv/ifCSuwovQ1rCbFNNpqwle9D
 oTRmllgka2qz1sPNVHfF6c8Ci0la5vNU3c3FWV0qPvmQhHuhh0e2hyl/1QUDl4t8Fn4i
 dD2bTSjDGJgz3F8wzm0H4hB6y3xl1fdzGaNUD6Lab6GW8XXme6SorFJ2rw1z4hKr95Yi
 5otw==
X-Gm-Message-State: AOAM5328LJI/V9kFieBBSZhR27Kr2KmXPP+tKpd5eQtSsjE199ivV5d3
 Dj+N3NmnyrCb1YJNsTuQpLBCTulBjKFBFOGTUAPorQ==
X-Google-Smtp-Source: ABdhPJzek0zDeLDFbfPQO12QrLbP1YaoyRNgh912u/LHMLJKfU2u0znkiciiHGBZwK1caQDmdSb5GTb/aZ7aUwEgMjg=
X-Received: by 2002:a25:2ac3:0:b0:645:36f4:2db3 with SMTP id
 q186-20020a252ac3000000b0064536f42db3mr2136588ybq.189.1650351557830; Mon, 18
 Apr 2022 23:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
 <20220418132154.7401-3-rex-bc.chen@mediatek.com>
 <CAGXv+5F027EsJCG4zQarcoqCR8S4tew1n1DjeqU7_+HOzmZs2Q@mail.gmail.com>
 <a5da87dbed150b8de4495da4a7f9b98d88e176a8.camel@mediatek.com>
In-Reply-To: <a5da87dbed150b8de4495da4a7f9b98d88e176a8.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 19 Apr 2022 14:59:06 +0800
Message-ID: <CAGXv+5FSfF=vEx71MUhpw+80baHaAYcw9cWTsQD6BfMx-p6WWw@mail.gmail.com>
Subject: Re: [PATCH 2/7] clk: mediatek: reset: Rename reset function
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com, 
 chun-jie.chen@mediatek.com, yong.liang@mediatek.com, 
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org, 
 allen-kh.cheng@mediatek.com, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_235920_064975_380E456D 
X-CRM114-Status: GOOD (  27.62  )
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

On Tue, Apr 19, 2022 at 2:37 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> On Tue, 2022-04-19 at 13:57 +0800, Chen-Yu Tsai wrote:
> > On Mon, Apr 18, 2022 at 9:22 PM Rex-BC Chen <rex-bc.chen@mediatek.com
> > > wrote:
> > >
> > > There are two version for clock reset register control of MediaTek
> > > SoCs.
> > > Since MT8183, the version 2 is adopted.
> > >
> > > To make the driver more readable,
> > > - Rename them to v2 for MT8183 and v1 for previous SoCs.
> > > - Adjust the fuinction order in reset.c.
> >
> > I'm not sure that the renaming actually helps, since it is not given
> > that
> > people outside of MediaTek would know which chip use which version.
> > The
> > original name of "_set_clr" at least relays how the hardware works,
> > which
> > coupled with the register naming in the datasheets make it quite
> > obvious
> > if the hardware is using the "set/clr" variant.
> >
> > On a different note, the v1 hardware, where a hardware bit represents
> > the
> > state, is quite common, and there is a common reset driver that
> > handles it.
> > Perhaps that could be reused instead of code duplicated?
> > See drivers/reset/reset-simple.c.
> >
> >
> > Thanks
> > ChenYu
>
> Hello ChenYu,
>
> Thanks for your review.
> I will use reset_simple_ops to replace v1 in next version.
>
> What do you think the proper name of v2?
> Or I just use mtk_reset_assert for v2?

I would just keep the current name.


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
