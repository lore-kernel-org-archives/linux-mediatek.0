Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270C4C05052
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 05:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIpMh1ckMPp0pwSG3jz+S16SYpjeiHVjbokVOUrNcHs=; b=Q7N+nMzngW5kmNrP2gisQqp1ZL
	ichznv1bbSdII81ZC5lQ9DDNegffzCs7r1LF8iO63RcOyhelBqZf5JgIyJ0y8tIMXPn88vTG1oqZV
	+XkhwT62YEuhF5IXTfyTOQjUFXMk4kVnd5n4kZp5A0WXZD3JopiHsHbAxpYFlkbQem01DIvppLYkP
	VoVKA+pKZazqlhdVs+PifS4J3B8Zkegpxi3/b8HKGdkhDHDYkE24530y9XoEI4h4e1ea+G/N9868W
	q54ex+YSVu4Gq9ansdjkcYBvy2ncc0hwGqPpNI8VJovS3Q4AsN3gCwyKVaM7uCPFRW52R2qdpDUwI
	1QNNjfeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWrk4-007ivz-2d;
	Fri, 18 Aug 2023 05:09:48 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWrk2-007ivQ-0A
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Aug 2023 05:09:47 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3497a6119abso1838605ab.3
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Aug 2023 22:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692335384; x=1692940184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIpMh1ckMPp0pwSG3jz+S16SYpjeiHVjbokVOUrNcHs=;
        b=cWAoEPd4TGNOFoByoR9+1njrd8xoYo9sqkpyr4IZIUE7ieengL9XoGcs02d643PTqm
         NjMfH3Bgh+3G+w8cnYbKSlu8TJsSoxsoV1n4ens+sYPc4bY3YD3B1P3B3HotZQS9Yf9X
         cZxSMe3BjSKJX4hif3IoBIKtYMd3GuWRtr+bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692335384; x=1692940184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIpMh1ckMPp0pwSG3jz+S16SYpjeiHVjbokVOUrNcHs=;
        b=dS++jpCIEyrkHX57aWpoMR8SuC6LShep9OzwC37Pf9wtJJTsbKPEzrPzW/8b74FJ22
         Pe3WAt8tyl0FvMGuGWZvSxO/gtpfk8ixRP/fCyjBkKB/tArYeMlX8ktZy0dVvHcCEvq4
         6DI3OskdtNlNflZxVtzDOYNjw9YMosEdp5j1wF0ImUQKJn1kdzub2F9Gd+JdmzF7lq2A
         xN2Lqg+h4J7/FlZsBLOal903wCNSZm8CH/91G+Kxr3N9oxrDZfkZ4tzxCWO54/BanGWQ
         Ykz69sNf2cFXoy05VTmoHsft8S8E7V7QJd8y1N24majlqMGGHd2K7/FtjSWC12CECTAi
         W+1w==
X-Gm-Message-State: AOJu0YyFbm6TYxLeMzvKV/UY83/hV8mpbjufrmXndpKV9oCVgDQcTe0v
	tiNZRNAajpEg1+cuiH+8CyPfNLuyXLQA4eUPLz0=
X-Google-Smtp-Source: AGHT+IFj67iP43WlnnL87vyh5z//Ynem/rnj+P0S1+EMyTOshYzFyDlewqAQqe4KaY11uA9wUtLHJQ==
X-Received: by 2002:a05:6e02:f48:b0:34a:8bb9:d7a9 with SMTP id y8-20020a056e020f4800b0034a8bb9d7a9mr1470181ilj.27.1692335384540;
        Thu, 17 Aug 2023 22:09:44 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id ge4-20020a056638680400b004300eca209csm295506jab.112.2023.08.17.22.09.41
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 22:09:41 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-790ba9cf42aso17708439f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Aug 2023 22:09:41 -0700 (PDT)
X-Received: by 2002:a05:6602:22d3:b0:783:5452:e343 with SMTP id
 e19-20020a05660222d300b007835452e343mr1848533ioe.14.1692335380847; Thu, 17
 Aug 2023 22:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230717173934.1.If004a6e055a189c7f2d0724fa814422c26789839@changeid>
 <CAC=S1nhFP6+fo-OU86PzCMtK77x+X23C1O4Bt=hxOsC+xzVGig@mail.gmail.com>
In-Reply-To: <CAC=S1nhFP6+fo-OU86PzCMtK77x+X23C1O4Bt=hxOsC+xzVGig@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 18 Aug 2023 13:09:04 +0800
X-Gmail-Original-Message-ID: <CAC=S1njm0ExE3DvWZQyPBm7LC8P_aJXX0xVY=fPuGBe1BKVmwg@mail.gmail.com>
Message-ID: <CAC=S1njm0ExE3DvWZQyPBm7LC8P_aJXX0xVY=fPuGBe1BKVmwg@mail.gmail.com>
Subject: Re: [PATCH] spmi: mediatek: Fix UAF on device remove
To: Yu-Che Cheng <giver@chromium.org>
Cc: James Lo <james.lo@mediatek.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_220946_090791_D7A4D2CE 
X-CRM114-Status: GOOD (  15.59  )
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

Just to float this up. Any feedback on this?


On Tue, Jul 18, 2023 at 2:57=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> On Mon, Jul 17, 2023 at 5:41=E2=80=AFPM Yu-Che Cheng <giver@chromium.org>=
 wrote:
> >
> > The pmif driver data that contains the clocks is allocated along with
> > spmi_controller.
> > On device remove, spmi_controller will be freed first, and then devres
> > , including the clocks, will be cleanup.
> > This leads to UAF because putting the clocks will access the clocks in
> > the pmif driver data, which is already freed along with spmi_controller=
.
> >
> > This can be reproduced by enabling DEBUG_TEST_DRIVER_REMOVE and
> > building the kernel with KASAN.
> >
> > Fix the UAF issue by using unmanaged clk_bulk_get() and putting the
> > clocks before freeing spmi_controller.
> >
> > Reported-by: Fei Shao <fshao@chromium.org>
> > Signed-off-by: Yu-Che Cheng <giver@chromium.org>
>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Tested-by: Fei Shao <fshao@chromium.org>

