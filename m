Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAA3C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 13:11:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7B3C22D50
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 13:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7B3C22D50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tAHe9QbRFVQxTDH9Mz9j7WC/w8/Xt7FKQHtq1jwKw4U=; b=TE27fOA4vEEAYYjm3jy1PyW29
	Z/rvK40ndetrASWoVHBihb7Vwo+1tVePH42c0GhQJW+VQA2nvWPL9pL2yZlyz0uU13Uyk2N735j3m
	skg5IdPCtjHQeZOoZkz/t0ZtPVz+sGIS22KTgEx6YbEvkzklt8G1bQslul2cXiF8r2WL8UZRtTORS
	/r5B1A4XrQjcpeTCiVpWg/cPMH2FquG5pCOnOW90FSG6FYNlsefqgUXfgEc4XA4aw6OXD1T/mj13f
	WC+wPf20r4Q+eqrtJlIMlZyNMtvPIsFo9oi50Ahxiu3Ho+xcYx0qBE2Qzqf3WK5e2aSMLSazHfVwK
	ZpyB34oAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l41ed-0004nI-Vr; Mon, 25 Jan 2021 13:11:40 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l41ea-0004lQ-32
 for linux-mediatek@lists.infradead.org; Mon, 25 Jan 2021 13:11:37 +0000
Received: by mail-lj1-x235.google.com with SMTP id i17so15227067ljn.1
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Jan 2021 05:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1LHPs6veKloMhyGbYCzf5Tkrc+RdfRRKizZUrP4RKFk=;
 b=no554Qq64SPim1EkiyV++9RtKXhSiJqgj89U4AUxO5hNWnnHViu7BjgjSz8ZDoJYqf
 LW0GdBFzeFeszL7hHdwkSntSWE2O/C4QGTBl5cxeS393dYKAbrciyRWA8TwJeTkSq7LF
 GlwdRfD5eT2bZ6lf9IEY1x1vKreOlXrNEsIwVN789eG5pH3s+8xzpJN3Dl62us/rCTHc
 KfmMOr/E4La8i+C5E9aGQVCMT6CnvHAoxMebnW7K5drwNziItNuyOutIGjYHA0BVMTb9
 p0C2E34IUVLijevWi8jla6iVc19Qjv7J5byAsZty6fAhKWu66e5nk58F6EB2B0Vsz4/c
 BByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1LHPs6veKloMhyGbYCzf5Tkrc+RdfRRKizZUrP4RKFk=;
 b=oGHAk/A9prtMaiiu+JoPMvjmi2gtbdxJj3fpJzJuezwmW2CXI2aoEGytFdcj4+qzP0
 NZ7/UtHLq9qN2MueWxnUOPAao24DRz10iEZrANaPotEwnke6ygGMjg6TORZThdZO6WD/
 zYEkesgI0nIkSyyNiFPImgdmS7Zwm4ZX7UmX4FQVEfuiVZBmQIgTrjvorwuIPqOUb82d
 RafzrYr0hmp1043VJkClgsXU94LhZVRPvJ6l/+r4XM1eH6qumyRT9Ocsb1pIIb1xPfk+
 IOgGT0tOiXHwagIIswlWDl6ZBcRTuKahJRwI7OGURwWIwsoOgpsJDqM5rh6Jgy4F6Bk6
 LJ1g==
X-Gm-Message-State: AOAM532u7dvSLb3gf/6isUd35ObqoJEL0pgodG+C7HCgiUHQdICaRnT1
 Zv6BAmHGP2bENnU2dE1dJcSuDbX8zR+my2Gyee9ptQ==
X-Google-Smtp-Source: ABdhPJy4HpEIGMikU7HZMCkt1pVwvvpvX/8qj1OgXZGQhen4TdHca8wLEsqLlamFaD35zyCmUp0OaXP94h/RKNN2IeA=
X-Received: by 2002:a2e:964f:: with SMTP id z15mr166740ljh.368.1611580294339; 
 Mon, 25 Jan 2021 05:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20210125041753.2214-1-hailong.fan@mediatek.com>
In-Reply-To: <20210125041753.2214-1-hailong.fan@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Jan 2021 14:11:23 +0100
Message-ID: <CACRpkdadvp9t5xdpK+=35jwfbrR0AXM0bRSWBfWH9jJFBbEyeA@mail.gmail.com>
Subject: Re: [PATCH V3] pinctrl: mediatek: Fix trigger type setting follow for
 unexpected interrupt
To: Hailong Fan <hailong.fan@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_081136_171317_579FF257 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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
Cc: youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, chentsung@chromium.org,
 Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 yong.wu@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Hanks Chen <hanks.chen@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, gtk_pangao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 5:18 AM Hailong Fan <hailong.fan@mediatek.com> wrote:

> When flipping the polarity will be generated interrupt under certain
> circumstances, but GPIO external signal has not changed.
> Then, mask the interrupt before polarity setting, and clear the
> unexpected interrupt after trigger type setting completed.
>
> Remove mtk_eint_flip_edge: because mtk_eint_unmask already calls it.
>
> Signed-off-by: Hailong Fan <hailong.fan@mediatek.com>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

Took out v2 and applied this v3 instead.
(No idea what the difference is, you don't say.)

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
