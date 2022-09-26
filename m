Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8D1C32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 05:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQm/cyI6O2TECbE+cPd+sUKnp2FCGlHvQ4HWSuz+uSg=; b=Iv4UODk3RD9v/hrFP56SmFFBGt
	3M660694XFV5EdTuvRbxt0BMJ4TMOmy054QRAE/cKquDjrSBGl8xx6rNH3xVZTECXMRcc5gQ3paPn
	OwOBrjIzAqfHI5SrjrmbdqL3ZBY5JShWYHoPAebDUPm7LZgTyc9pDjOj2w/GYBWyktUd7+0wEMZam
	nlqFV9jIJKpF+ktVJnbfWT6CCVwVd6GhFA58RTn+gElyDhrbu9lT4YMxjde9ZGAn+w/ia7jmv7+Ku
	vQIJIY6KB0sTh+9E/cUSfAvzVk/b1BUocIQhD4XNxxu8o6RtYjkj+lMvLNwdW2k8oTtJ+VzUDt8fb
	1XmqyMRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocgmB-0021Ud-Do; Mon, 26 Sep 2022 05:35:31 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocglz-0021RJ-AK
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 05:35:22 +0000
Received: by mail-ed1-x52a.google.com with SMTP id f20so7460818edf.6
        for <linux-mediatek@lists.infradead.org>; Sun, 25 Sep 2022 22:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=uQm/cyI6O2TECbE+cPd+sUKnp2FCGlHvQ4HWSuz+uSg=;
        b=bvj4BJCXhuoY+XVd7CpW0wyJbpTiRkIRiYp5uuTDkAbcaXZe8AzQT/VxPZLxL3Yorg
         xdtZuFe7/VqVVkB3XXhYGSa3RMXjHjZTOhD8G2nHvEN2zaQOYaHrsWWh0Jv3hyyoD3x2
         E0Wcv+6JZdSQryG4iCkzVhAd3XiX3pnqGTDQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=uQm/cyI6O2TECbE+cPd+sUKnp2FCGlHvQ4HWSuz+uSg=;
        b=QR+7vRcdp5Md/LqGrp0n1a93c0e1LQcEyiDQKu8RiQmfzxU5diICTWnzLsOmrGJ2vg
         gFiNZvrPpJ/33b8OENQTkliSeOXzQVr+1cSk7SjXpW4FvTZ5gG9XQ5ZsauCJvQAAEebs
         bLAW0Ii9F+iwVsbZXzA10qprsDw6/ZXi45gtypqYTsiBcO2iiOkSq8TM0EGBR7OCpmZm
         nTkNaTVVGXQ7XBAfcK++cnsuTSKAIjO4eU7q5nREvSvj8AOMyh8ach6WySongAeVJ9l4
         NadsU1DcOaso9jvz6sqUdUBaQyss6wyW3Z73nRq4VlnCUji1nGYoR0+CZFB6Qu3OrcyB
         /kgw==
X-Gm-Message-State: ACrzQf2An+CyL/9hRyYmbrMPiEIjKoyakFhNNmEvVWfNMFCUhStJrC5K
	CJ21518VY/x3VV7v6bMBYTAMKAPPxGsa/7N0930CCw==
X-Google-Smtp-Source: AMsMyM5sOF/np8p+lz3ZmwY9NsZIytiFDwGMSg6JHrTesURDkV9WMexbAV6SKC66ej7VC+axAK4njLND0s0MeZqSPD4=
X-Received: by 2002:a05:6402:280f:b0:44e:ee5c:da6b with SMTP id
 h15-20020a056402280f00b0044eee5cda6bmr20607304ede.256.1664170517096; Sun, 25
 Sep 2022 22:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-2-4844816c9808@baylibre.com>
 <CAGXv+5GJrjxG0pEGqseEacz_KFCRhWJSiLoiwuwwUTaSeO0RBg@mail.gmail.com>
In-Reply-To: <CAGXv+5GJrjxG0pEGqseEacz_KFCRhWJSiLoiwuwwUTaSeO0RBg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Sep 2022 13:35:05 +0800
Message-ID: <CAGXv+5Gw_fKHfhTEAOQi7R_GtD5OSiSTQ5wCvKjEckXBwjLLQA@mail.gmail.com>
Subject: Re: [PATCH v1 02/17] clk: mediatek: add VDOSYS1 clock
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, Pablo Sun <pablo.sun@mediatek.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220925_223519_367189_F678CD00 
X-CRM114-Status: GOOD (  12.70  )
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

On Mon, Sep 26, 2022 at 1:09 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Tue, Sep 20, 2022 at 12:59 AM Guillaume Ranquet
> <granquet@baylibre.com> wrote:
> >
> > From: Pablo Sun <pablo.sun@mediatek.com>
> >
> > Add the clock gate definition for the DPI1 hardware
> > in VDOSYS1.
> >
> > The parent clock "hdmi_txpll" is already defined in
> > `mt8195.dtsi`.
> >
> > Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

I've queued patches 1 & 2 up here [1] and will send a pull request to
the clock maintainer later this week.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/log/?h=clk-mtk-for-6.1

