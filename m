Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E76C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 09:14:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2B686108E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 09:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2B686108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nhF0Dkklq2toA1TCUCyF6kNbZ8pk328RGaEz10jgh3o=; b=Z2a/WR6hkTBEcn
	wGEAvkQ7vtq+PpcYnLg/UcMiyOK9huHb8zeMXZWuNGMZ+dJ6Evdf9ypijVEEVK1mRi+G2IlOOUzft
	QyKVO2q0flF7Io6jhzFveTaGBirkp71xVEify7uE7Uqot1/mT2forwJzZbAAXE7fZGMCxsdTDP62g
	h6GbUV1wIZaiGp+PiL7Dd53Q6SRnlvGmxybFhlXTN43zaW9kR4ylVc29620uB7djpLsu79VjCyr4R
	mThEqUG++XDAf0xVf6ikNCfSH3qNMyJtpMX0nvEzJxzAylgs7EE5XJUOQtl5i5UOWO5LbDr/U+VFH
	LXYYz6QMUrbgKDWCjcHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJBSk-009e1I-Bz; Thu, 26 Aug 2021 09:14:18 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJBSf-009dyp-F5
 for linux-mediatek@lists.infradead.org; Thu, 26 Aug 2021 09:14:17 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 d22-20020a1c1d16000000b002e7777970f0so6347233wmd.3
 for <linux-mediatek@lists.infradead.org>; Thu, 26 Aug 2021 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ubJENgQIOzugIH6aIzu4aa5SOJeA5cH0TBu7UkdkwRo=;
 b=eWRM7qqism/66evB0/Z4A1uCvrnvkvTzAGwtb+rUwe1sPIN2AMyEYIn4BzeKGJqUoC
 JGhvessjn+k+1RDfzALVQ7b/43qoTxbHmhrfxabjnYDh33tDAFwtHDmh+cc99/k9KK+t
 5e/Btgkaw0RYWxCnueUGZR0K4Rlqxa35b/K5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ubJENgQIOzugIH6aIzu4aa5SOJeA5cH0TBu7UkdkwRo=;
 b=FNbwmJ8z3wn2ip8Hhcc20+x0tlzhdgvboo8B364W8NkrAweKXaJAIa0jVFFvAW9C9q
 zHBNZHdFtCHQ6hNvAm2Pu7eHCTIzs6Z5HZFe2BhQnDCU23/8wSeC+uxEdEap1zIeXsWJ
 oDjXRO3KO+AoycXvsulfgsOjflJpRPGDiMB4crQQ8XBvHPMywSugnqg/KQvw8STPHq1B
 k3TMEEbT+WujKvqrB0QCSiDXOWdWsw64Ys90dc04Pa80OxLKZY7orkH1WK6n+tLpBUFy
 DMaXh6PMrmHajV5HA+TOpCuuaRYMjWHk5cpZgIExS6UhiNTPY830NjbIlELaFUt5/3ww
 Zmlg==
X-Gm-Message-State: AOAM532x3EeNKKlYxRNnWCHLVWMeEGVvCHCjVNxYgrBTfoxl8uNnNyq+
 omr98AIGMzdtzBydEhv5MQpEow==
X-Google-Smtp-Source: ABdhPJykiq+3RMvVzHhR2iD4afcW8Q8OoeIr3XVAh723gjD1Rvwc9Ym8gi6QoDtjdhPbP2Ip1lCUVg==
X-Received: by 2002:a1c:a903:: with SMTP id s3mr2538905wme.171.1629969250495; 
 Thu, 26 Aug 2021 02:14:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z137sm7917167wmc.14.2021.08.26.02.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 02:14:09 -0700 (PDT)
Date: Thu, 26 Aug 2021 11:14:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Daniel Vetter <daniel@ffwll.ch>, Yunfei Dong <yunfei.dong@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 George Sun <george.sun@mediatek.com>
Subject: Re: [PATCH v5, 00/15] Using component framework to support multi
 hardware decode
Message-ID: <YSdbXzCJRsj/jsnl@phenom.ffwll.local>
Mail-Followup-To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>,
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 George Sun <george.sun@mediatek.com>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <CAAEAJfDWOzCJxZFNtxeT7Cvr2pWbYrfz-YnA81sVNs-rM=8n4Q@mail.gmail.com>
 <CAKMK7uFW3Z=Up=OCJO4dNR9ffaTdFjHwoND9CrUw6LHmQ4t_AQ@mail.gmail.com>
 <CAAEAJfB3CoTU7bZe08wYEfTTm6=6UPOae9u39AtdbJ9saYknBA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAEAJfB3CoTU7bZe08wYEfTTm6=6UPOae9u39AtdbJ9saYknBA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_021413_560392_11F8F81E 
X-CRM114-Status: GOOD (  37.62  )
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

On Sun, Aug 22, 2021 at 02:57:15PM -0300, Ezequiel Garcia wrote:
> On Sun, 22 Aug 2021 at 13:50, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Aug 18, 2021 at 4:12 PM Ezequiel Garcia
> > <ezequiel@vanguardiasur.com.ar> wrote:
> > >
> > > +danvet
> > >
> > > Hi,
> > >
> > > On Tue, 10 Aug 2021 at 23:58, Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> > > >
> > > > This series adds support for multi hardware decode into mtk-vcodec, by first
> > > > adding component framework to manage each hardware information: interrupt,
> > > > clock, register bases and power. Secondly add core thread to deal with core
> > > > hardware message, at the same time, add msg queue for different hardware
> > > > share messages. Lastly, the architecture of different specs are not the same,
> > > > using specs type to separate them.
> > > >
> > >
> > > I don't think it's a good idea to introduce the component API in the
> > > media subsystem. It doesn't seem to be maintained, IRC there's not even
> > > a maintainer for it, and it has some issues that were never addressed.
> >
> > Defacto dri-devel folks are maintainer component.c, but also I'm not
> > aware of anything missing there?
> >
> 
> A while ago, I tried to fix a crash in the Rockchip DRM driver
> (I was then told there can be similar issues on the IMX driver too,
> but I forgot the details of that).
> 
> I sent a patchset trying to address it and got total silence back.
> Although you could argue the issue is in how drivers use the component
> API, AFAICR the abuse is spreaded across a few drivers, so it felt
> more reasonable to improve the component API itself, instead of changing
> all the drivers.
> 
> See below:
> 
> https://patchwork.kernel.org/project/linux-rockchip/cover/20200120170602.3832-1-ezequiel@collabora.com/

Patches get lost on the mailing list, and rockchip is one of the lesser
maintained drivers. You need to ping this stuff.

For bridge/panel I still think we should work towards removing component.c
use from them.

> > There has been discussions that in various drm subsystems like
> > drm_bridge or drm_panel a few things are missing, which prevent
> > drivers from moving _away_ from component.c to the more specific
> > solutions for panel/bridges. But nothing that's preventing them from
> > using component.c itself.
> >
> > I'm happy to merge a MAINTAINERS patch to clarify the situation if
> > that's needed.
> 
> Indeed, that would be good.

Ok I'm going to type something.
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
