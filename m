Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DCEC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:49:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09E92613A6
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 12:49:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09E92613A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Acid3/sPAGZJtSnteMrKT5nfk10SzIxDA4MMijRZWGg=; b=uIhSLISDx426FL
	OimDVe/im7fWUJ73a5aBeHtdDH26yu0U4OtyIMEW9sy8uoI1B8j6FUFzsqySb/dvCWsRo6AD0tPhy
	KDqNbv5I0Zd+WsL6RI9SPF0dCP3UlDVCt47wCiQ1KSW9IV/8vH1fKxuTGQBNwAZr25pd3S+DD/nns
	EbW527Gv9kfcAOozYeu6fO+NM6pvlDsJi5/kMGtkc8yuniYA+WM6APWE6/wWL1UXmcFeUHUuij0qj
	GPdy1StyD0xqH0nCOvSeToRbBwBV5JwWviUUk9lVGKRFA0Y9cU8MZuH5aVd4jwCmEZNZYmL3v9R9B
	WvT0kC8aB61yN23Rk8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI9Nc-00GpsZ-NY; Mon, 23 Aug 2021 12:48:44 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI9NX-00GprU-Ix
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 12:48:43 +0000
Received: by mail-lj1-x22c.google.com with SMTP id q21so31264131ljj.6
 for <linux-mediatek@lists.infradead.org>; Mon, 23 Aug 2021 05:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jW88Mmr9kKDSsQvXNUmfFT239ViVAMgYapLhyDQd6No=;
 b=jrcE9KAVRTDTCyaS7h3RvPgbiT1PjcDchBYeawJaqWt4FU+7CQhua86DdX45l9VL82
 aAmXjPTB1MJySt1b7k0J68jdTSMw8ar/eQf6gtNlcknCNDhTgTFHu1cHjqxzhXpVYFIJ
 Q2NvBezkST/1wLHB79f4zjGRQKIfGVGBQhX4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jW88Mmr9kKDSsQvXNUmfFT239ViVAMgYapLhyDQd6No=;
 b=YdXxYQFXMuy7IlpETQl8poBSgZBi9eOfJ0xrsvHuUV4I4pLdL6wJGL5JrJqHh56cCR
 4Kez22Kd+ClnGABCLbf2QwGkv18rVBFrE21QSIysokUheLXkee2lKwQ7u/krDozycRNC
 0S17nnfcxV35doW25jFwaVkQkHUailS9dIxs29vK409Ch6GRnVkOxDs6dizAn4YfY2Xg
 wdEjdgg0ZW4R+uCI3OcwqyiJqa69rpY8Jeo4SH2jlyrd3pDQsxTtcEat0M9oJRRLRJ1v
 w+ZROPLEJPWyyBcWGgGIZA7MpBGQ12ptPyEaBh4G4WTu2uRRck4VB9kveQx+hUJh1kBQ
 QDHQ==
X-Gm-Message-State: AOAM531+I9lixF2oIoslvKhR5PHPmztOzGWm67z10JUcJlLAsEu+GIbx
 1RkM5bhvLBuL2hHJQ4qw2TUxDSSZxxSQMyAjE34S2A==
X-Google-Smtp-Source: ABdhPJxVdu+J2/ouZrq35GIQglMEtR89HwwgR9u2T2JxSfcRKL1Jm3K4FSNW8564lZ+iNMFT8P5OiCEU/eXRM3gABIc=
X-Received: by 2002:a05:651c:211a:: with SMTP id
 a26mr14057616ljq.305.1629722916767; 
 Mon, 23 Aug 2021 05:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-25-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-25-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Aug 2021 20:48:25 +0800
Message-ID: <CAGXv+5H6pLtNk_KzAoCreX24t4Fs-7wswPwiZaJYmpXo=9p5iw@mail.gmail.com>
Subject: Re: [v2 24/24] clk: mediatek: Add MT8195 apusys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_054839_686367_D78C11A0 
X-CRM114-Status: GOOD (  13.06  )
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

On Fri, Aug 20, 2021 at 7:37 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 apusys clock controller which provides PLLs
> in AI processor Unit.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile                |  2 +-
>  drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 92 ++++++++++++++++++++
>  2 files changed, 93 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-apusys_pll.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 4288ad39ba41..e10b1d6b0cf4 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -83,6 +83,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-mt8195-cam.o \
>                                         clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o \
>                                         clk-mt8195-vdec.o clk-mt8195-vdo0.o clk-mt8195-vdo1.o clk-mt8195-venc.o clk-mt8195-vpp0.o \
> -                                       clk-mt8195-vpp1.o clk-mt8195-wpe.o clk-mt8195-imp_iic_wrap.o
> +                                       clk-mt8195-vpp1.o clk-mt8195-wpe.o clk-mt8195-imp_iic_wrap.o clk-mt8195-apusys_pll.o

Wrap line ...

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
