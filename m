Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D26FC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jan 2022 00:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yrL1yviNOQfibmvO1Pln/smqTThcHqlO96dpn6M8eTM=; b=Sfr9E1hoN396ZH
	bGzc7JBms5dOxJU/ACUsYN6ACltsVv0XIVuHOVquPTlAejYSpp21MJEvmjdi/3T6vjlo8eZz9aR9E
	2kCkZTDPO4IorYydpEWBpO/e0C/CawPvLdxtJbbVSiYyAdoDvc43bzlSqUIoAq8CTvnm7nSqvkuZv
	e+x6b2qVL8P6rQ5iSKWhWRKtAi4DW1UOqYV/P1Qms57oEeV470dLi5nHEl0ZQbewuiPODFPEo5+gd
	u0+Xlgd3sPhq3uOmpQ7tK+YBH4SR8goRhL35go3XF2rAptxLMknGi7t39tsm/GQNGXFesK246WofU
	/OyNx9s+1Ty1lvFmqhlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8tja-00BikP-4B; Sun, 16 Jan 2022 00:49:26 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8tjW-00BijX-Fx
 for linux-mediatek@lists.infradead.org; Sun, 16 Jan 2022 00:49:24 +0000
Received: by mail-ot1-x32b.google.com with SMTP id
 a10-20020a9d260a000000b005991bd6ae3eso1421412otb.11
 for <linux-mediatek@lists.infradead.org>; Sat, 15 Jan 2022 16:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6p/O50RxDfDXj8F2gSC4MowoUivvHCS0e3BL4NSTAKw=;
 b=Nqgh49Px5R7DO0fvkf4emRtIOPPQB1ttBHl54nYcwmBVbUpKe7zRYYoEOON3g2eQPv
 QJOJItR3O3Dc+BAkBVkFgpFYEBSupFrLgugavxkviSYjapY90x4yxiPniMP4TsU7ItsM
 P2Jfc6yQwusXu2K+yPH3ShITezD8pC5FidTndQN/5MHwQZl8Sxh56IHann3//4D3Phgp
 KifPPZDSt8Of2hhf/y49TMj2RTdZWeWz9x0noEmw9TSBoDfyVUX++qf/tlx+EQwGKV4/
 uhinoC1O4mN8heUYf240pRmcE3Jq7LY1bJ7l4hAxYIKBNJkfdY1WC691m8M1M7zG29Qr
 KrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6p/O50RxDfDXj8F2gSC4MowoUivvHCS0e3BL4NSTAKw=;
 b=k6a6T58iaaP/ncg6CO3FKHApju8dVBsTLNLvFyt8xZ8WfmW41IX8HhuIimu+8AS0cA
 pimZVKR/SFcHOnt1W807V3G2c5sY6P7LNgD3dkazfZWLsHxPH4KqWZAeq8aveNJ2Jh4B
 vzuFVhReRlyJzSU3LGa5O8kwsbdbgzaU996a6dIGeAYU2pXsckI2AE1GiV+/nXTAZh7Z
 q3mLw/QQiotascacB/YZmXlD+p2swh1yhyOM98VhZuGAk92aM17MtzN3gZ2F03vRiqDE
 w70bZAGaV1Hdu4Y4xGWiUTfdFrBuEsLHyCOnagEBNCmJkc91Qe/1cQE68wW+aRC9UR3i
 xpzw==
X-Gm-Message-State: AOAM532Z3jVueSS+VAq7kG2bDIXjF4ehWpinUPNiDCzCsR0IKu/j/Vew
 ucC0nWWWnRBFEE7JtZ2mIvb6Z9JxjcWSBo7sjFwq6w==
X-Google-Smtp-Source: ABdhPJxTODp48xHCKhFaUN9ucAxJTdT/iwAFvpUSSRbtaQ4yeE5aXxbrG02X11dyWHsA3S9x2XjGL7EAntPOyAudiKo=
X-Received: by 2002:a9d:465:: with SMTP id 92mr11681452otc.35.1642294161540;
 Sat, 15 Jan 2022 16:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20220111112244.1483783-1-wenst@chromium.org>
In-Reply-To: <20220111112244.1483783-1-wenst@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 16 Jan 2022 01:49:10 +0100
Message-ID: <CACRpkdZCtEwZiVwoW+QNL4nTf-10fBDRfGkwVJavf1n_w-8q_Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: mediatek: Fixes and minor improvements
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Guodong Liu <guodong.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_164922_555268_CFA2817A 
X-CRM114-Status: UNSURE (   7.50  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jan 11, 2022 at 12:22 PM Chen-Yu Tsai <wenst@chromium.org> wrote:

> Here are some fixes and minor improvements to generic pinconf and the
> Mediatek Paris pinctrl driver.

Looks good to me, can you rebase this on v5.17-rc1 once it is out
and I will queue it!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
