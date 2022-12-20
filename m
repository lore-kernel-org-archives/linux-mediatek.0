Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B133C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Dec 2022 21:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGBStJPQMoU1T93Q2AMWHFSr3O3MSy8/Uza6vrZKt84=; b=ZDDQ6bgT6OzPcBO4pRrCmBwPPT
	X3hbJnnpCX9mhzCiKwf6NdhOqVpeq36Ggd2KLslgXwuZnfXlj08SthiSU6CqIRTXpCcpM35hTFq7/
	lr6RuE1AeVPBC/14T+qi5ZCWMP5xLy9Uc9RJW71AY471mEszMLIo7tU5QwoBIMwE9A9N2L6ujUXO/
	VW1c4HGxPSlapnZD2D9DAiEEctIpBL8g/qWF/EtdXnHpWpEWugT2GJuWVCZkgETuibFOyfA6vGXrx
	BWWJbIE/3KTTPdJGp/OAYZD9lqIWfAYpeELhbQh6D423tCmJycThkXUTR8BDcAbeTgaJdFgyRd92w
	F4lI1PbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7kJz-004Tbw-Uk; Tue, 20 Dec 2022 21:38:47 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7kJU-004TJk-0r
	for linux-mediatek@lists.infradead.org; Tue, 20 Dec 2022 21:38:18 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d82so9379506pfd.11
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Dec 2022 13:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yGBStJPQMoU1T93Q2AMWHFSr3O3MSy8/Uza6vrZKt84=;
        b=Bu+HQ4gHLIpW4V7dmMzGXkkKqSs4vm24OQBqjKeS2ixezSZx9ddk3CbItfbny7I565
         vChkh+mkHwcEvLjxtgVe0W9dApKHUCr9TSu3XLvapL9sHXfkxns5Zyh3HVaesGrfj9yf
         34+EP8ZoMPLSAJmrAWbRf0/Od/Id7Dm0PxA9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yGBStJPQMoU1T93Q2AMWHFSr3O3MSy8/Uza6vrZKt84=;
        b=IdEUvAxL+omsnAKPVKXDdEn/Fl/wjtzZnl+Z8WvbEXXnrXlHNQS1mhhx/njpvPOk3S
         raJSKK/24KRj8mOrRSZ7dFewKMD53wNLnXViqXwDNnRp+F76zbbSw4CBssWEHg20P6zC
         q1FPO7r7TRRLViIkNQN7YyxxoO9CSGMZkxB04MwL2zsSbaLe6wUp8IenQec5k8ETlCzN
         ZlOC1hzR4cnh0Y3hM5qUey4DNJ3QAv60RmGIMgcA6kk1MBKfMX9xf7Lzo8GIxMu54ZoL
         c+t1t/Dwa5F8+7WcKuLSWlyxVdpbfGy5ZzJETRgCFzFfy2dUqG0K/insgasjLJZ8YzlH
         d/zg==
X-Gm-Message-State: ANoB5pneYdxF3crHgedHBVoMKKOyYh+pii9f14jXbnbMDvVH7U1xHTpr
	WT1t1RB6zALjitSnVAmG79QIJWWPC5fCk+GA7iU=
X-Google-Smtp-Source: AA0mqf4cw2FUJkbufqyaEuUIV4BiyukvK8AVIOqYEKs1sjdXCrFoBKeSxkYBBxJD/QNtnLwpLcRZ+g==
X-Received: by 2002:a62:6303:0:b0:578:83f5:554d with SMTP id x3-20020a626303000000b0057883f5554dmr38145297pfb.23.1671572292761;
        Tue, 20 Dec 2022 13:38:12 -0800 (PST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id i22-20020aa796f6000000b0057630286100sm8881175pfq.164.2022.12.20.13.38.10
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 13:38:11 -0800 (PST)
Received: by mail-pj1-f45.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso1945724pjb.1
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Dec 2022 13:38:10 -0800 (PST)
X-Received: by 2002:a17:903:446:b0:191:2a9b:ec94 with SMTP id
 iw6-20020a170903044600b001912a9bec94mr464516plb.8.1671572290248; Tue, 20 Dec
 2022 13:38:10 -0800 (PST)
MIME-Version: 1.0
References: <20221127-mtk-svs-v1-0-7a5819595838@chromium.org>
 <d683a2e7-b886-9bf6-27df-d8c67cedbbdd@collabora.com> <b8b14bcb-845f-aa18-f8aa-ad0bed9fb0bb@gmail.com>
 <52fb6ccf3fe1cb11f3e330ecc4d9c6cf1225c98a.camel@mediatek.com>
 <e0d3f5c7-6f6b-ee21-170c-51e5240de114@gmail.com> <CANiDSCv-625Jt7KYe3QdHv1tmU2W_c5195T+SitSM1ROocbQ2g@mail.gmail.com>
In-Reply-To: <CANiDSCv-625Jt7KYe3QdHv1tmU2W_c5195T+SitSM1ROocbQ2g@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 20 Dec 2022 22:37:58 +0100
X-Gmail-Original-Message-ID: <CANiDSCvQONPtvYzjhonAZMpsQqix5jQW_gPbAVqxLRQ4si1JJQ@mail.gmail.com>
Message-ID: <CANiDSCvQONPtvYzjhonAZMpsQqix5jQW_gPbAVqxLRQ4si1JJQ@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: mtk-svs: Enable the IRQ later
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?Um9nZXIgTHUgKOmZuOeRnuWCkSk=?= <Roger.Lu@mediatek.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_133816_103081_11AB0474 
X-CRM114-Status: GOOD (  32.08  )
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

Hi again Roger

I think I managed to reproduce your issue on an "asurada" Chromebook.

Sending a v2 of the patch.

Thanks again for the heads-up and sorry for the mess ;)

Thanks!

On Tue, 20 Dec 2022 at 21:44, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Roger
>
> Thanks for the heads up.
>
> This is the tree that I am using to test this:
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/=
+/3918592/7
> ( https://chromium.googlesource.com/chromiumos/third_party/kernel/+/3daf5=
7d76c9e3d7c73d038ff2e43984412b503a2
> )
>
> You can use this tool for kexec:
> https://chromium-review.googlesource.com/c/chromiumos/platform2/+/3953579
>
> The syntax is kexec-lite  --reboot --kernel /boot/Image --cmdline
> "$(cat /proc/cmdline)"
>
> On Tue, 20 Dec 2022 at 15:50, Matthias Brugger <matthias.bgg@gmail.com> w=
rote:
> >
> >
> >
> > On 20/12/2022 12:03, Roger Lu (=E9=99=B8=E7=91=9E=E5=82=91) wrote:
> > > Hi Matthias Sir,
> > >
> > > After applying this patch, SVS probes fail as below on my MT8192 plat=
form. If
> > > thing isn't too late, please do not merge this patch. I'll ask Ricard=
o how to
> > > reproduce this issue and give the correct solution. Thanks in advance=
.
> > >
> >
> > Ok, I just dropped the patch from v6.2-tmp/soc branch.
> >
> > Regards,
> > Matthias
> >
> > > #MT8192 platform SVS probe fail log
> > > [   10.209430]  SVSB_GPU_LOW: init02 completion timeout
> > > [   10.214402] mtk-svs 1100b000.svs: svs start fail: -16
> > > [   10.219479] mtk-svs: probe of 1100b000.svs failed with error -16
> > >
> > > Hi Ricardo,
> > >
> > > Could you share us how you reproduce this issue? I have MT8192 Chrome=
book and
> > > can give it a try to reproduce the issue you encountered. Thanks a lo=
t.
> > >
> > > Sincerely,
> > > Roger Lu.
> > >
> > > On Fri, 2022-12-16 at 13:47 +0100, Matthias Brugger wrote:
> > >>
> > >> On 30/11/2022 12:00, AngeloGioacchino Del Regno wrote:
> > >> > Il 27/11/22 21:22, Ricardo Ribalda ha scritto:
> > >> > > If the system does not come from reset (like when is booted via
> > >> > > kexec()), the peripheral might triger an IRQ before the data str=
uctures
> > >> > > are initialised.
> > >> > >
> > >> > > Fixes:
> > >> > >
> > >> > > [    0.227710] Unable to handle kernel NULL pointer dereference =
at
> > >> > > virtual
> > >> > > address 0000000000000f08
> > >> > > [    0.227913] Call trace:
> > >> > > [    0.227918]  svs_isr+0x8c/0x538
> > >> > >
> > >> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >> >
> > >> > Reviewed-by: AngeloGioacchino Del Regno <
> > >> > angelogioacchino.delregno@collabora.com>
> > >> >
> > >> >
> > >>
> > >> Applied thanks!
> > >>
> > >
> > > ************* MEDIATEK Confidentiality Notice ********************
> > > The information contained in this e-mail message (including any
> > > attachments) may be confidential, proprietary, privileged, or otherwi=
se
> > > exempt from disclosure under applicable laws. It is intended to be
> > > conveyed only to the designated recipient(s). Any use, dissemination,
> > > distribution, printing, retaining or copying of this e-mail (includin=
g its
> > > attachments) by unintended recipient(s) is strictly prohibited and ma=
y
> > > be unlawful. If you are not an intended recipient of this e-mail, or =
believe
> > > that you have received this e-mail in error, please notify the sender
> > > immediately (by replying to this e-mail), delete any and all copies o=
f
> > > this e-mail (including any attachments) from your system, and do not
> > > disclose the content of this e-mail to any other person. Thank you!
>
>
>
> --
> Ricardo Ribalda



--=20
Ricardo Ribalda

