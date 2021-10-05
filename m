Return-Path: <SRS0=zM/7=OZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AA8C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 06:14:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FB3A61139
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Oct 2021 06:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FB3A61139
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tB2Z6nUT3Fb2edL0uUzMfskDsJ2+kRx8NrJpnYFqxdg=; b=atPk7OeYrGYhBz
	MkFsYYfyeAXCLPZPgWOzHNxr9DiINe4aDi/BYlQJ2nzUI1Cnhi4PsybBPZopUZY/IWujmofifzrg6
	5x2SVHM/n0f0u21cctQkszN/yvf4QhbDOgeDSUdPkLN+x5cMNkymBHUD6uRDwQjt/ShrH6rbg6klD
	/qAhrrhJ6e/pgyyfxbGtC/Ji0uIPr+OxhVDRF1qq/uDrILaiQ65XuZxpueTKaUWijPtdNASQ/s2kC
	gqrWN9RwYdKplP2+I7TUPDnwhTsxQ+MIoUjESni4UhOZ0pBdz/jol5DVvivtIPePbh0UF78ynvnrT
	B6zhbjTWdoXDM5B18zEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXdiM-0097ka-53; Tue, 05 Oct 2021 06:14:10 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXdiA-0097fJ-MJ
 for linux-mediatek@lists.infradead.org; Tue, 05 Oct 2021 06:13:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 r4-20020a7bc084000000b0030d6fc48bd2so1180308wmh.1
 for <linux-mediatek@lists.infradead.org>; Mon, 04 Oct 2021 23:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j0gdpa7QFj6JEtxCL0CAkQhhWBN7lylbx+e4M1Vsb7o=;
 b=VSMlRsoRvLnUs/myw52hG6menRckaTpfD/sc8jEUT0jyW5v3NKcZHtBWqWykMD5xpQ
 mFu4QMfCZ9RQ9gHcJ9QFLXWCDQioaZGzCLDj2r3q5cK6Bu/YSHR3txAyRLJylC+4AKLR
 g55PRWGvVR45Df7AB215vAr2ryBVF9UVBNPf2zz3lLIf+C6rBUlNftwFmbW96vlrWdTq
 hCwjH6VQ0tr1DWzEEMjTxsoihIPbk377R7bOZfQPdhVWl10LaMlIoj6UaOF+EZtODQyV
 LwPycfL7e8vNKveuzSRdCDYLP9xDWVdJMnpBwUvvLfFs+gIqIOclKdHk3GCXIwYTLdoB
 y/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j0gdpa7QFj6JEtxCL0CAkQhhWBN7lylbx+e4M1Vsb7o=;
 b=f5qvtC3L8pT5fEx94ggvwBl0mleBkiSD1PmGESzxdSerWTNSNFdiGFKOEnP8enFb1V
 5Az32mXIZqCpLX16/C9mhG7UncIDmgvDtxv3aN5rp0YCD2TA4wCzhy/vAOm08mwE1xwr
 LSHaRspdycgd00yeG/ApLnFk+HC0LKphPGOO/2DmgBjXonLForj7nbkwKzZENiHdW2gC
 vBBl6EjsF1pfQ0NOIOXTnCDMpWbeRYOBw1Lx9Bnf4/ohSo3Pqo5FjjEeonnE0wmlmzpy
 F4kSIffDJ1QPrynnCFU9EMUrI6QbqqIFROx1CwZcIUdVLL9CFX1eBdvicURXkL+UgfZJ
 bBSg==
X-Gm-Message-State: AOAM531KxaKOUKvT4Ko/6E9yxXnPhb2CLDZ+qQNBycc2qF6vR6JCWZgp
 MDYq8dv8m7EAsIGR54rAUo2LLZiR3Bb6n4+I7ZUc6A==
X-Google-Smtp-Source: ABdhPJwvzH04gXiNcjIVGCd6bQFa+g35hTdKUKGTFBM4UFTMR14Ybiy5zm5HBrSroG102mfVLu4iLioSc6A1uZAaB2I=
X-Received: by 2002:a05:600c:1c9a:: with SMTP id
 k26mr1406845wms.169.1633414423545; 
 Mon, 04 Oct 2021 23:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
 <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
 <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
 <b7ed8b71578a98704e9b8ca29cac63c67cc14b3f.camel@mediatek.com>
 <CAAEAJfCHEBFc8B7C0bu7UxtJdffvDarqgA-rset1wPjLOiV01A@mail.gmail.com>
 <CAC-pXoMR=mOwnKqP5SFAfF3Ka5UrG0F8Mj=sJuEziU=uOKftoA@mail.gmail.com>
In-Reply-To: <CAC-pXoMR=mOwnKqP5SFAfF3Ka5UrG0F8Mj=sJuEziU=uOKftoA@mail.gmail.com>
From: Tomasz Figa <tfiga@google.com>
Date: Tue, 5 Oct 2021 15:13:32 +0900
Message-ID: <CAAFQd5DzLMFarc2fFkrcE4t+T3mk5XJtCoWa8WpHNuOS5++SbA@mail.gmail.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
To: Steve Cho <stevecho@chromium.org>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 "yunfei.dong@mediatek.com" <Yunfei.Dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, 
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <Andrew-CT.Chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_231358_757791_0A4A4320 
X-CRM114-Status: GOOD (  15.78  )
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

On Tue, Sep 28, 2021 at 2:02 AM Steve Cho <stevecho@chromium.org> wrote:
>
> Hi Ezequiel,
>
> Thank you for reviewing these series from Yunfei!
> This series is one of the main obstacles for us at the moment for MTK
> so please continue to help & support reviewing this series.
>
> > > According to google's suggestion, it's better not to use v4l2 async
> > > also.
> >
> > Hum? I haven't seen such objection on the mailing list.
> Maybe coming from Tzung-Bi?
> Yunfei, please let us know.

I do object to using V4L2 async. It's designed for independent
components of media pipelines, handled by multiple different drivers
and also modelled as V4L2 subdevices. We don't have anything like that
here.

How about just open coding something trivial that only fits the needs
of this specific driver? I think it would be as simple as a linked
list and registering the V4L2 devices only after all the nodes probe.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
