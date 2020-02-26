Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D4FC4BA0A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 04:46:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CFCD21927
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 04:46:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aEOD16TW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ofvWS/in"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CFCD21927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZx/AbAa//cXW8I8hk1iS4XjfyKtFYl0W0DH7OeI3XU=; b=aEOD16TWpsONfv
	uWsqBNqTRm81EsoeiCFXbXnPXJdB5etyaMNMS9HPHfJ5vHnmLBf6m4/Gi1niF7YO6gcsq8p7WRRoS
	OxxhUcuLWPP1iFieSU/waTCmZn42uq5n6sOpAKT/27VikJXVgyDXtvvii9N8XmhX2Y8UvySBDv/pJ
	wzeuJE9LPgv4zEiRF3abAm2fv0GTExDOtl2plMwqe0Dk0ieUB1b8kL/UgBNFNnDUR0avZr7DdiRrB
	jYa0Zw1vH67C0bM2zLd/2Gr5sULQgEdhDizSxVnA+xwZhTYfS00uBV+wv0fkfGTvHqKHcdufhI/gT
	yoz0FiUwxOirxSX5+l+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6oaL-0002kM-0U; Wed, 26 Feb 2020 04:46:13 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6oa9-0002Yu-GQ
 for linux-mediatek@lists.infradead.org; Wed, 26 Feb 2020 04:46:03 +0000
Received: by mail-oi1-x242.google.com with SMTP id b18so1774429oie.2
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2020 20:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EKUyDP4lZW18OTJVqKNfcbTr/pNluBP+Ac8mA7k4evM=;
 b=ofvWS/inAusVCo3l1y8QovhX4A7p7BrHR3o/38cH5h/oY+oPPGklAZwzipfIf14QU6
 potN5ZirnfbpuqlD3FbwCDt68S2VNziAe29j031oaTGqS5jme9cfqbcq9aS2Ev3tHZ+Y
 4l+XyIFM0jvqUyCko5LHBk01vlk6v3SmOhxMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EKUyDP4lZW18OTJVqKNfcbTr/pNluBP+Ac8mA7k4evM=;
 b=t6/ECiQHo6zkQryagqwqMTWhVsv9WmdNAoAWo4dsrNsSMRyOHMpcPcBvXXAht0BeND
 DAX5H6oxg5NW1m7hxw1tYrlLLHtm0cys4mOlOo/aEAmQutJlqtQFxPRspa4O5K0RS8sJ
 SerleS5j2PQrPIr5fZTeErzciXM7cii+L2g+70cTW4vBSnaJ61hMZe9Q23yNvvh2PaD4
 9yWE+sYq0xs/iwCnmnBz+v4l0AQxyBR7wCn0ZNajukuQbhvNxwbE2o0Ho9VPa4RxTLD6
 RJn+sUDF/Xk5eR4J6BfzMOzZ5QaVtbKUw37NJqh9j/Nl6ZVDENyzhdr1AMZwUFzLmFAS
 fNfg==
X-Gm-Message-State: APjAAAXeqBB8CAg1bgXgYF4wf6Y78f0pWLFjeaXh8x1k31bmqGV6S6CW
 GbmYqT0hnptYu5cN12KPoiOq74k4NNf9nA==
X-Google-Smtp-Source: APXvYqzUjXFpzEUYpC32DMQJ5mu0NdbSTsXjUKA3mvBTmM5VmhUcWO0yePihMP0Fg/AtpgztkTW3mA==
X-Received: by 2002:aca:c507:: with SMTP id v7mr1693529oif.157.1582692359814; 
 Tue, 25 Feb 2020 20:45:59 -0800 (PST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com.
 [209.85.210.53])
 by smtp.gmail.com with ESMTPSA id z10sm363580oih.1.2020.02.25.20.45.58
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2020 20:45:59 -0800 (PST)
Received: by mail-ot1-f53.google.com with SMTP id h9so1743322otj.11
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2020 20:45:58 -0800 (PST)
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr1449424otq.97.1582692357955; 
 Tue, 25 Feb 2020 20:45:57 -0800 (PST)
MIME-Version: 1.0
References: <20200226033646.20949-1-gtk_ruiwang@mediatek.com>
 <20200226033646.20949-2-gtk_ruiwang@mediatek.com>
 <CAPBb6MWN6bXfYvpBJ6XyPCuvJSpdxNOf4Z9RbY0jbnB5=JX_sQ@mail.gmail.com>
 <1582690790.6276.19.camel@mhfsdcap03>
In-Reply-To: <1582690790.6276.19.camel@mhfsdcap03>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 26 Feb 2020 13:45:46 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWcoSjvxj5tHvWTiQWqY5CdgTemCmyhmio0yZMEq-4VWQ@mail.gmail.com>
Message-ID: <CAPBb6MWcoSjvxj5tHvWTiQWqY5CdgTemCmyhmio0yZMEq-4VWQ@mail.gmail.com>
Subject: Re: [PATCH] mediatek: move MT8173 VPU FW to subfolder
To: gtk_ruiwang <gtk_ruiwang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_204601_785144_454A857D 
X-CRM114-Status: GOOD (  15.47  )
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
List-Id: <linux-firmware.lore.kernel.org>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>, srv_heupstream@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-firmware@kernel.org, Tomasz Figa <tfiga@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 PoChun.Lin@mediatek.com, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 26, 2020 at 1:20 PM gtk_ruiwang <gtk_ruiwang@mediatek.com> wrote:
>
> Dear Alex,
>
> Do you mean to create two symbolic link?
>
> lrwxrwxrwx  1 gtk_ruiwang gtk_ruiwang      25 Feb 26 11:52 vpu_d.bin ->
> mediatek/mt8173/vpu_d.bin
> lrwxrwxrwx  1 gtk_ruiwang gtk_ruiwang      25 Feb 26 11:52 vpu_p.bin ->
> mediatek/mt8173/vpu_p.bin

Yes, otherwise older kernels will become unable to use the firmware. I
don't know whether these are supposed to stay forever or whether we
can remove them after a while... presumably the former.

Also the WHENCE file should probably be updated to list the new files.

>
> we create them at the linux-firmware root folder.
>
> Thanks
> Best Regards
>
> On Wed, 2020-02-26 at 12:41 +0900, Alexandre Courbot wrote:
> > On Wed, Feb 26, 2020 at 12:38 PM <gtk_ruiwang@mediatek.com> wrote:
> > >
> > > From: gtk_ruiwang <gtk_ruiwang@mediatek.com>
> > >
> > > Currently vpu_d.bin and vpu_p.bin are at the root of
> > > linux-firmware git tree, it's not appropriate so we move
> > > them to subfolder mediatek/mt8173
> > >
> > > Release Version: 1.1.4
> > >
> > > Signed-off-by: Rui Wang <gtk_ruiwang@mediatek.com>
> > > ---
> > >  vpu_d.bin => mediatek/mt8173/vpu_d.bin | Bin
> > >  vpu_p.bin => mediatek/mt8173/vpu_p.bin | Bin
> > >  2 files changed, 0 insertions(+), 0 deletions(-)
> > >  rename vpu_d.bin => mediatek/mt8173/vpu_d.bin (100%)
> > >  rename vpu_p.bin => mediatek/mt8173/vpu_p.bin (100%)
> >
> > This is nice as it removes some stuff from the root, but for
> > compatibility with older kernels that don't know about the new path
> > shouldn't we at least temporarily create a symbolic link between the
> > old location and the new one?
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
