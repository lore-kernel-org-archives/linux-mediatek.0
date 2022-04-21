Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1345C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvtedaBJBaAgdyF6drzQ2akWVcZNU982d5EVCAt/WMc=; b=Vxwhd6LP5Up+yj
	om76ykmmurLO5ITIUDy8hbvBeMdP2TDOcJTvoThriZevWOjQwnjRzBjH6spq9NN3GmUxiPrIaaStS
	8fmGtBPA+HEbAm58Kg42OsWgKsNFLRRYz8OsXFQW1vlE/p9k32SY29+nm+0xiTkZ/RIQv9yuSW8dm
	yLAaqHTIAQmiOUxO4T5n4T1iyH0wtuUvW3UyWR4vib5jOcRadnSaeRgVPdadn/wviaGP4CA0d06B3
	7Hz8dzh26TYo2ih1USqw6Zl3omg/dFdmX3ggDKLK67zTy6MLzOvYv3nEDZMBMEC3R06DxMuUkhxJq
	2sNEY8M0mkUi5u6l85Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhTJl-00CpCt-8g; Thu, 21 Apr 2022 09:41:41 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhTJi-00CpAc-6S
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 09:41:39 +0000
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2ef4a241cc5so46079367b3.2
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Apr 2022 02:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lNExmSjlaYtm/wBO2/VQ+pMd8GmkEdKrkvYHc/Wjj4Y=;
 b=ZTayUALaY5kyKRozk55vRKsPIf4+z2700Gqa/7hhKzCqFAWs3UsbO9Aba/9NjKXURW
 dr3iE3+e9nAyrim9V8f/ldsLFTs67iMkt6NC8BE7tBKetLn4/tuAXUqOta8pd/cYtAxV
 /91cpH4ZeL1nxvLtiyqPnxx8okn/XAq289jp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lNExmSjlaYtm/wBO2/VQ+pMd8GmkEdKrkvYHc/Wjj4Y=;
 b=0X41z0b1sim/C9UuYypAFITXLo+DMcYqmZ5GJzIUMj36FuyYHxCweejqMSSXcSJVhg
 j+y8zDq0oK2WF2Z1vYDz0XlS4rkTpe/KMnNahsPni0TCRmi5P/qB0WsgeFAIx2KQt7sb
 FqtyPXncwXofpjV34Qw3iFWLVjbow1UoBhu9VLEkAA+OYDSwbjMq5XRpoX5ZuXTll70w
 hTJ5jYgjQmhdvbC30RIr0BG7dbd7lYbSJP72bUAM+gIVwY3HpstIfiOv2hkrfdMCCCsA
 GBaviwD4IBAtlGA9pFy8VGUEVmn87tRpaTMJl3LmtcJR48ymvH4xOWd2gxh9z5+LD0rJ
 c4qA==
X-Gm-Message-State: AOAM530YHpjXlWjsoGMlczTxJXv2WiuSX0NVSFbLD1N7+DJcflNS2RT/
 cSLrGYeXDWgbz3Y5upg82eZZ3/ydRhKW131LwFkSuA==
X-Google-Smtp-Source: ABdhPJxEzCRntzAGeWIxrjGr/qnshzvCXz8EgyFfSbtLFpl+eCBT8hZWVlr/oyyY0OyXpG2DMrqCNnDkpGPQu5St42o=
X-Received: by 2002:a0d:eb46:0:b0:2ef:4946:544 with SMTP id
 u67-20020a0deb46000000b002ef49460544mr25077698ywe.286.1650534097187; Thu, 21
 Apr 2022 02:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-6-rex-bc.chen@mediatek.com>
 <90ad46a5-8b67-e9ca-25df-2a7cc6110bff@collabora.com>
 <CAGXv+5FL=YdjonwBWV9ZkRf3jstCsxCEonmH02g2+1PAopObYg@mail.gmail.com>
In-Reply-To: <CAGXv+5FL=YdjonwBWV9ZkRf3jstCsxCEonmH02g2+1PAopObYg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 21 Apr 2022 17:41:26 +0800
Message-ID: <CAGXv+5E_1iAhBe3Avjrb4DWpanKYOMJHkopTqk9t2V34OYhx9Q@mail.gmail.com>
Subject: Re: [PATCH V2 05/12] clk: mediatek: reset: Add reset.h
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mturquette@baylibre.com, 
 sboyd@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de, 
 chun-jie.chen@mediatek.com, runyang.chen@mediatek.com, 
 linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_024138_273123_C3999BD7 
X-CRM114-Status: GOOD (  19.42  )
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

On Thu, Apr 21, 2022 at 5:14 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Thu, Apr 21, 2022 at 5:07 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> > > Add a new file "reset.h" to place some definitions for clock reset.
> > >
> > > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> >
> > Right now, you're adding the enum mtk_reset_version and *then* you're
> > moving it to the new reset.h header, but does that really make sense?
> >
> > I think that this series would be cleaner if you add this header from
> > the start, so that you place the aforementioned enumeration directly
> > in here...
> >
> > ...so we would have a commit that moves the mtk_clk_register_rst_ctrl()
> > function from clk-mtk.h to a newly created reset.h, mentioning in the
> > commit description that it's all about preparing for a coming cleanup,
> > then the addition of enum mtk_reset_version would be in
> > `clk: mediatek: reset: Merge and revise reset register function` directly
> > into reset.h.
>
> And probably name it mtk-reset.h ? 'reset.h' is a bit too generic, and
> I'm sure there are multiple files with the same name throughout the
> kernel source tree.

On second thought, please ignore my comment.

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
