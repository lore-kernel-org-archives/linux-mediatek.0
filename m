Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CD7C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Dec 2022 20:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFJ52Jvif4kqXh2cyc1/ZmoPfPIQip5jewjrb6LAFws=; b=fK3FEh1wSt3IenunzUac5C9zoT
	dcDZUv1FRDLpDjjCGmapaXCTwYVhiavWSAhcf1OzCXqYz+NqFyYaK8Nu+hEzGohWWxcIJA/WJjEEB
	/WVIWPESfaXvtGMpIe39Yd7FcK7WiFX873/2mV4U4YmCIs8ZhpS+flACF4etHZbRkGpzGghmaMJkw
	MaKImwCxYacngcNcP2nfeGypU0CkgP60bPqdxMomCdX9g2sIeUimxAqAl+EeBedQyom3JWWCs3eGj
	oNvIZ/40aT/BJjZrptoqZbk2x7+yAeof0amsT95Sg6eCFMR7E0QyxMxkMwY9HLm9DhLCzYKEg6Gun
	gu32lFjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7jTZ-003xAs-FH; Tue, 20 Dec 2022 20:44:37 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7jTL-003x5Z-TW
	for linux-mediatek@lists.infradead.org; Tue, 20 Dec 2022 20:44:25 +0000
Received: by mail-pj1-x1031.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso8542pjt.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Dec 2022 12:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFJ52Jvif4kqXh2cyc1/ZmoPfPIQip5jewjrb6LAFws=;
        b=Pd4ElttST4MpL9hibF2X3mMy+HUUfHhLj41kwyBAQaoYc1y2g0UHePF5FEZcnSduPY
         MLmI6S9+QF6SIny/exlAYN4fslzCVAhmMKqn/ZNFhkR3sWXpg9LXaLJ0+FxGo9hAO17v
         u4a/3gzKxYd16I/oOHmZQCuxu/S5Gihpx6O44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JFJ52Jvif4kqXh2cyc1/ZmoPfPIQip5jewjrb6LAFws=;
        b=qjHlQTdspF9/b35GhF+Jrksd+o61JYGNYSickxjpBGGhJt1e5lN7CCfx9q50Solkbc
         TUSBcDfZr1SI1K0ixOa6KLMiM7tUYXWVKzEIWH+OrmQ+tBsCFd2AvZc96xQEFs8uvw6W
         agigQX3L8nRERq/w9r9TdEIxk0q9zXBzNXRvOkzkQ7ILo3N2M0o9DE4BUJsgn/ufmiSM
         yJo1zl/L/2bLf7FxAiU6ANVC8vzrTVdeaW/xqpk/egwxnKVoLnd9O6DXZ2+MovKdWFtQ
         dDBuclXTUhusmSV9YyJOuYD3SyVFzm0mPGISlufAufjZ3KnqAwiJpNFno5YHq/dx/8xT
         kP/g==
X-Gm-Message-State: AFqh2kqk4RDIVL6r52vs71th/09LWQnGzl+GujQXaamBLqChfoPLWLIc
	jBUg2SS9AUQAUqRfFUt4gAKPPwEpyUwH3+Kz
X-Google-Smtp-Source: AMrXdXvusQwGPfE41wsP3kg75mJOV+M7XWF1goP8REpQb4AOtqzwuh0LuKxX+e1xnGnKfytxd/Dcww==
X-Received: by 2002:a05:6a20:3aa7:b0:9d:efbe:2082 with SMTP id d39-20020a056a203aa700b0009defbe2082mr16321725pzh.56.1671569060794;
        Tue, 20 Dec 2022 12:44:20 -0800 (PST)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com. [209.85.214.181])
        by smtp.gmail.com with ESMTPSA id k74-20020a62844d000000b00576e4c7b9ecsm9115389pfd.214.2022.12.20.12.44.18
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 12:44:18 -0800 (PST)
Received: by mail-pl1-f181.google.com with SMTP id d15so13479670pls.6
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Dec 2022 12:44:18 -0800 (PST)
X-Received: by 2002:a17:90a:9c09:b0:219:33a1:d05f with SMTP id
 h9-20020a17090a9c0900b0021933a1d05fmr1883291pjp.116.1671569057656; Tue, 20
 Dec 2022 12:44:17 -0800 (PST)
MIME-Version: 1.0
References: <20221127-mtk-svs-v1-0-7a5819595838@chromium.org>
 <d683a2e7-b886-9bf6-27df-d8c67cedbbdd@collabora.com> <b8b14bcb-845f-aa18-f8aa-ad0bed9fb0bb@gmail.com>
 <52fb6ccf3fe1cb11f3e330ecc4d9c6cf1225c98a.camel@mediatek.com> <e0d3f5c7-6f6b-ee21-170c-51e5240de114@gmail.com>
In-Reply-To: <e0d3f5c7-6f6b-ee21-170c-51e5240de114@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 20 Dec 2022 21:44:06 +0100
X-Gmail-Original-Message-ID: <CANiDSCv-625Jt7KYe3QdHv1tmU2W_c5195T+SitSM1ROocbQ2g@mail.gmail.com>
Message-ID: <CANiDSCv-625Jt7KYe3QdHv1tmU2W_c5195T+SitSM1ROocbQ2g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20221220_124423_974803_49F9BA4C 
X-CRM114-Status: GOOD (  28.42  )
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

Hi Roger

Thanks for the heads up.

This is the tree that I am using to test this:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/=
3918592/7
( https://chromium.googlesource.com/chromiumos/third_party/kernel/+/3daf57d=
76c9e3d7c73d038ff2e43984412b503a2
)

You can use this tool for kexec:
https://chromium-review.googlesource.com/c/chromiumos/platform2/+/3953579

The syntax is kexec-lite  --reboot --kernel /boot/Image --cmdline
"$(cat /proc/cmdline)"

On Tue, 20 Dec 2022 at 15:50, Matthias Brugger <matthias.bgg@gmail.com> wro=
te:
>
>
>
> On 20/12/2022 12:03, Roger Lu (=E9=99=B8=E7=91=9E=E5=82=91) wrote:
> > Hi Matthias Sir,
> >
> > After applying this patch, SVS probes fail as below on my MT8192 platfo=
rm. If
> > thing isn't too late, please do not merge this patch. I'll ask Ricardo =
how to
> > reproduce this issue and give the correct solution. Thanks in advance.
> >
>
> Ok, I just dropped the patch from v6.2-tmp/soc branch.
>
> Regards,
> Matthias
>
> > #MT8192 platform SVS probe fail log
> > [   10.209430]  SVSB_GPU_LOW: init02 completion timeout
> > [   10.214402] mtk-svs 1100b000.svs: svs start fail: -16
> > [   10.219479] mtk-svs: probe of 1100b000.svs failed with error -16
> >
> > Hi Ricardo,
> >
> > Could you share us how you reproduce this issue? I have MT8192 Chromebo=
ok and
> > can give it a try to reproduce the issue you encountered. Thanks a lot.
> >
> > Sincerely,
> > Roger Lu.
> >
> > On Fri, 2022-12-16 at 13:47 +0100, Matthias Brugger wrote:
> >>
> >> On 30/11/2022 12:00, AngeloGioacchino Del Regno wrote:
> >> > Il 27/11/22 21:22, Ricardo Ribalda ha scritto:
> >> > > If the system does not come from reset (like when is booted via
> >> > > kexec()), the peripheral might triger an IRQ before the data struc=
tures
> >> > > are initialised.
> >> > >
> >> > > Fixes:
> >> > >
> >> > > [    0.227710] Unable to handle kernel NULL pointer dereference at
> >> > > virtual
> >> > > address 0000000000000f08
> >> > > [    0.227913] Call trace:
> >> > > [    0.227918]  svs_isr+0x8c/0x538
> >> > >
> >> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >> >
> >> > Reviewed-by: AngeloGioacchino Del Regno <
> >> > angelogioacchino.delregno@collabora.com>
> >> >
> >> >
> >>
> >> Applied thanks!
> >>
> >
> > ************* MEDIATEK Confidentiality Notice ********************
> > The information contained in this e-mail message (including any
> > attachments) may be confidential, proprietary, privileged, or otherwise
> > exempt from disclosure under applicable laws. It is intended to be
> > conveyed only to the designated recipient(s). Any use, dissemination,
> > distribution, printing, retaining or copying of this e-mail (including =
its
> > attachments) by unintended recipient(s) is strictly prohibited and may
> > be unlawful. If you are not an intended recipient of this e-mail, or be=
lieve
> > that you have received this e-mail in error, please notify the sender
> > immediately (by replying to this e-mail), delete any and all copies of
> > this e-mail (including any attachments) from your system, and do not
> > disclose the content of this e-mail to any other person. Thank you!



--=20
Ricardo Ribalda

