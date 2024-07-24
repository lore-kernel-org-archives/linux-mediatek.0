Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2268C3DA63
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jul 2024 17:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSt2KK2zIYK1hYL/2M3AjkN5i0z/uG64IXDus0gPHfk=; b=28GYuxuZRzOJvkh2HuGd0BFkqT
	aA2AopA8/U/meW6/rDmG7BjIAZ/rvmNLr0Qt3dY3BnVw/uNJs0t0yXcKvM98zzERlilJZQATgWSvv
	nph+R+lSx1rrH0ZZZdPgrdBQJKlOv8M5Ru4XoDpj0xef7nORY3NRFLMfIvs873HulIoYDXZEp9S+5
	mu1GGrjriUv20Ztn6ijRWCBJzAmNahotewBubQ3hQ4XtgfqNySSlJrQTLt3mJgRP8DhlAc+jS8aMl
	fKL+BMpWM1WMy2bBELeMHLGLH8oJ/q4hVEc/O2cckikdgRkLRdnkeWzyw6hfrVP3bFYAdoJxq428I
	qdQg5FOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWfxJ-0000000G719-0lON;
	Wed, 24 Jul 2024 17:39:13 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWfxG-0000000G705-3Cow
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jul 2024 17:39:12 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2cb510cd097so64077a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jul 2024 10:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721842745; x=1722447545; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSt2KK2zIYK1hYL/2M3AjkN5i0z/uG64IXDus0gPHfk=;
        b=3pQMJzB2Ya/D3141a0rbqwa5C2GTKjl/sJ1Z5PEI9BPpAIkn5gfeh6lkCwMzK9iQrm
         X3g4vBYuPOxYJGuwEGrYXI6GXY/TR5xuX8SNzrhQ9gLrh5YWc0kUaQSb8dSuj4/fmIRq
         LZ2RoaA4QHsP40iEvlgyvQDGPZNlWcr0NixM8emSRhst5OerZEQgu6bxAvU3hxktC1zB
         LbWvTvQBqKTgJ8Z8TeX8bQUGiwPGOxmCE1pmgH754t0k0x4Up6ypJJ3SQeLMpNhz9Hli
         a33B7fGV57p5deg4crxtyeLac2I8Bw+EhXuihA4ni6mzDIMQl3CMltMNV5rZ+Cvqq0wl
         G1Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721842745; x=1722447545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSt2KK2zIYK1hYL/2M3AjkN5i0z/uG64IXDus0gPHfk=;
        b=MbjQXvuGQ4GufigLe4/+ulYMx9vSsBB9sz4NGOaPJtCNW2ZZkUs+IWPK7LywBOvJ5Y
         GBH6flZjHcL32qgxWqjzqsnoTNTD+sQ4TUOebsV8ysFUFCXH8d/PmiyuJPN+kWxAy8r6
         kP5hq5je9rfiMcHDQmG0gr/Qr6ruGO2iY5SJGQ8+Jh2O+nOOjbVv1yefTaaFCy9OwSHx
         dlSlqND8Uhci52/y4msCfa+eV6O4V0N1ovYy/SOrbeSRXRfIhRfN12EgFOAQ2K6uBt3n
         BNCgNpc+suJI3zPhLsphVlaPAKs3uSvjPZvm1jNeQ9ESnNrj1hVA265M+DWSREdDLIP1
         tOPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2yXQT/d+36EDs06DuPqijTB2wiHVck3HKAuQeUfvJI5oiBhExYOzbM5fh65SJFHttpW5G/s+/bQX5N0SYWOfL8WVY9Xf/K08N5ojuQ5BU28d3
X-Gm-Message-State: AOJu0Yw2c85OLN24sx708m8Ttan6UwnVuWl8fJBOCg/on2QvQN8hrAHs
	AFW1VQCUjDpA4RGE9OlrwLoBikhIzfifftjTGhaJ/gqka574489QxUyDvFWAJc6vIv0XU59xYNT
	AxjcMWuYjnu39FT2zkKPoC1VQhq39T9BRYYwI
X-Google-Smtp-Source: AGHT+IHE/F/3+xd2ienNaLYTqimWsJdW5ypyI+UzRtp57//RlQnOGuhoHJ3mTM8RSp8YJO2JNwcBhTYslPPXNmdftPE=
X-Received: by 2002:a17:90a:17a1:b0:2c4:af69:5c39 with SMTP id
 98e67ed59e1d1-2cf237a08camr295456a91.13.1721842744809; Wed, 24 Jul 2024
 10:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240719022132.30990-1-xiangzhi.tang@mediatek.com> <e8e66f8f-4238-4d8a-ad20-32bc4cb1dbb1@notapiano>
In-Reply-To: <e8e66f8f-4238-4d8a-ad20-32bc4cb1dbb1@notapiano>
From: Curtis Malainey <cujomalainey@google.com>
Date: Wed, 24 Jul 2024 10:38:53 -0700
Message-ID: <CAOReqxh_rCST_7jfy6rrPreii6DmOM1S8nootuB_cZYYP_GPqQ@mail.gmail.com>
Subject: Re: [PATCH] mediatek: Update mt8195 SOF firmware and sof-tplg
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Xiangzhi Tang <xiangzhi.tang@mediatek.com>, linux-firmware@kernel.org, 
	linux-mediatek@lists.infradead.org, hailong.fan@mediatek.com, 
	Xiangzhi Tang <xiangzhi.tang@mediatek.corp-partner.google.com>, 
	Curtis Malainey <cujomalainey@chromium.org>, Wojciech Macek <wmacek@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_103910_825799_61CC95E5 
X-CRM114-Status: GOOD (  19.92  )
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

On Wed, Jul 24, 2024 at 5:24=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Fri, Jul 19, 2024 at 10:21:32AM +0800, Xiangzhi Tang wrote:
> > Update SOF version: sof/sof-mt8195.ri
> > Release version: v0.4.2
> > Remove sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
> >
> > Signed-off-by: Xiangzhi Tang <xiangzhi.tang@mediatek.corp-partner.googl=
e.com>
> > ---
> >  WHENCE                                        |   3 +--
> >  .../sof-mt8195-mt6359-rt1019-rt5682-dts.tplg  | Bin 20895 -> 0 bytes
>
> Hi,
>
> the firmware file you're removing here is used by the MT8195 Tomato machi=
ne:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/s=
ound/soc/sof/mediatek/mt8195/mt8195.c?id=3D786c8248dbd33a5a7a07f7c6e55a7bfc=
68d2ca48#n575
>
> So with the latest kernel and linux-firmware, Tomato doesn't have working=
 sound.
> I see there has been a patch a few months ago to change the topology used=
 on
> Tomato, but it hasn't been merged nor followed up:
> https://lore.kernel.org/all/20240318183004.3976923-1-cujomalainey@chromiu=
m.org/#t
>
> If the non-dts topology does indeed work for Tomato, I assume we'll see a=
n
> update to the patch updating the topology for tomato very soon to restore
> functionality?

Yes, I was waiting to resend my patch until this landed. Now that it
has, I will be resending it this week.

An aside on this patch as well is that it missed updating the ldc for
the firmware, which will need to be fixed by MTK.

Curtis

>
> Thanks,
> N=C3=ADcolas
>
> >  mediatek/sof/sof-mt8195.ri                    | Bin 173832 -> 100740 b=
ytes
> >  3 files changed, 1 insertion(+), 2 deletions(-)
> >  delete mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-d=
ts.tplg

