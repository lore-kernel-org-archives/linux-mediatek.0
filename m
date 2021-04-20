Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EB4C43460
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 12:59:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D106613C3
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 12:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D106613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7+sReM6Z1CLqvaenj7J3wFojMbCFO+Sh8chkXKwsm5w=; b=AUZwAink7QukFVoiqZLpj3ZjA
	Vnp4W5C0QrWLNwfj7Qzf/UD+GVwdwJk2iFWN96hlmPJIiRn6qYod3gwYEa9QUgg51T/7V6XUD7vO8
	6ZfxWnMFMZrSOgF5F/afU9xcBibrrqgKg9S31M+ENNtiWBZuQsGOw547FwOvXKinBgy0bhFsyPNIA
	CB/vJLTx9CKclyYeBY3pD+gXtGUdYSET4TNR9AIeH9kqNyAUi2Uf0uX3DRQiNG8aFREU/uQadWLJe
	n+i5ixftejfAOa0lAI4FpCWboTJIn1lpKmS8RQIUIm/QjCj7lyEUSmRAw53GuO95H2ptP2df4a/IU
	aj6jfASjA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYpxr-00C8q0-Gw; Tue, 20 Apr 2021 12:58:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYpxc-00C8oL-ET; Tue, 20 Apr 2021 12:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OPoNHmYKzg3NQ0yTc8euCs3aFdFN9Uv/CVAUqMPYohQ=; b=IJEjjyfJWkImUxkIt7STbzw+m+
 ubwBu4X2WQPF+c1lhbK9cIZOWXKZ+SdMWC4PdIsYDjA7vnDU0bwnJ1e423ii7v6a6q23g+P4mMlIL
 mocPVO23O/DfJXKa7gmU+zFDO/HIV7eDrQQWbLxX5X99o+66bgqckfsnsd86qw3BykXE8Ggi8u/V9
 HsJDrEP8z0TIoRGUROXTR3cnowMC6RMCyKvlHSnOVXDEkS41VhLLqsZFRCuo8UTbiZ20GezkLqHFv
 KOekia3MaF35orD8L1Cyhjwz5asC31Woxcl4e4Av0VfY286kfkcBfZWEHDtMEGotStoQEtHsS1y6u
 2i1VlKMg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYpxW-00C7UO-M9; Tue, 20 Apr 2021 12:58:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EEF17613D3;
 Tue, 20 Apr 2021 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618923510;
 bh=99lo4qWbGVchdHKfpjjskiYnwE4yEy5FKLw4Af2QoTY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=le1X6pX/B5Wn4w/Z1bB7qH1/M742fBddF3Mvu8VDniJGGLsoLE9ovmio7NUoYTXmk
 hLiD/he2svewzxHUYIo4vvZTr2PTqI64RX6pY98JmoBW4WT8C/fdUVJiQj24CMzD6p
 OUUzAMUS2LwFtM1iSBWTD1jec0wcQr74HzwUjQlmGzAqlbHODWpJ5KSjJqreg+sJ3H
 Hu3c0LqgOb+RBgL8YtU+NA4OsctJo2UF6Vi7KqbvIRejyBmHLg8o36ctzqH8Vc1kUJ
 TCTA6bFo4n8uoeOfQr0mlJrh9BvsfycD4LiTPbbpX+Q14SdmL5ATy7Qy98DOrzRcTh
 oYqo8vWB+YreQ==
Received: by mail-ej1-f42.google.com with SMTP id n2so58097630ejy.7;
 Tue, 20 Apr 2021 05:58:29 -0700 (PDT)
X-Gm-Message-State: AOAM532x/Kjv5s8giew9HG5pE8Cq+c0ofCAW0BZ4feLJy7pCRw5RcTkz
 1eQB95L2P1+WKYM2DeDvWb5Doyedfzd50y6neA==
X-Google-Smtp-Source: ABdhPJw7wi8fw9oOO7qnDlntNFZJyzsrZFVwINbXEnj2d321/UyqKkStdDq602PvgaUm3VtOxj3OOyejbMRwi5kf5vU=
X-Received: by 2002:a17:907:367:: with SMTP id
 rs7mr28084034ejb.468.1618923508307; 
 Tue, 20 Apr 2021 05:58:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210126011759.1605641-1-drinkcat@chromium.org>
 <20210126091747.v11.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
 <20210205175543.GA3363048@robh.at.kernel.org>
 <CANMq1KAshVgWPp=4KpjkwfAD=N4ZOw0xBCZHkfGob-TY0RCGew@mail.gmail.com>
In-Reply-To: <CANMq1KAshVgWPp=4KpjkwfAD=N4ZOw0xBCZHkfGob-TY0RCGew@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 20 Apr 2021 07:58:12 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKSSfuy0b9x70rd2u7Af=FDRY8S39PW8y+fS-Q4pevVig@mail.gmail.com>
Message-ID: <CAL_JsqKSSfuy0b9x70rd2u7Af=FDRY8S39PW8y+fS-Q4pevVig@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek
 MT8183
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Fei Shao <fshao@chromium.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, 
 lkml <linux-kernel@vger.kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Kristian Kristensen <hoegsberg@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_055830_823320_016B69B3 
X-CRM114-Status: GOOD (  21.68  )
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

On Fri, Feb 5, 2021 at 9:02 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Sat, Feb 6, 2021 at 1:55 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, 26 Jan 2021 09:17:56 +0800, Nicolas Boichat wrote:
> > > Define a compatible string for the Mali Bifrost GPU found in
> > > Mediatek's MT8183 SoCs.
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > ---
> > >
> > > Changes in v11:
> > >  - binding: power-domain-names not power-domainS-names
> > >
> > > Changes in v10:
> > >  - Fix the binding to make sure sram-supply property can be provided.
> > >
> > > Changes in v9: None
> > > Changes in v8: None
> > > Changes in v7: None
> > > Changes in v6:
> > >  - Rebased, actually tested with recent mesa driver.
> > >
> > > Changes in v5:
> > >  - Rename "2d" power domain to "core2"
> > >
> > > Changes in v4:
> > >  - Add power-domain-names description
> > >    (kept Alyssa's reviewed-by as the change is minor)
> > >
> > > Changes in v3: None
> > > Changes in v2: None
> > >
> > >  .../bindings/gpu/arm,mali-bifrost.yaml        | 28 +++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > >
> >
> >
> > Please add Acked-by/Reviewed-by tags when posting new versions. However,
> > there's no need to repost patches *only* to add the tags. The upstream
> > maintainer will do that for acks received on the version they apply.
> >
> > If a tag was not added on purpose, please state why and what changed.
>
> There were changes in v11, I thought you'd want to review again?

Looked like a minor change from the changelog, so it would have been
appropriate to keep. However, I see another issue.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
