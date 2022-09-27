Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248F6C6FA90
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 17:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqiG1WugCjG/eS40Y8bIQccm3nHdg5o4wRzobrd5PZM=; b=r7a3dkcPgnV2TqN/HHPiJBa0Zp
	hVmSqMi2rjf9ZeSJOYYzT1zFMGOfFmUj5SXIdgvoaRWbdH26Ck7kXNyXZZM0DnP8raMJUN7b/tI47
	8b+Ip3gy5Nw74ZoQC90g+93qwo2b28k8/DY7gqIRgYpl3hT1hyg4AyrzYGFL1qieh3GYHqZgCdpoD
	eseE9wAlG9Ko/3KPyzHVB9CWK9mFMoRoBTRye1+E83tcTeiN9UG1AG1l7rsoFrJXiMnmJDdUZUc6P
	kiVJjv+68YlCa8zqGCJwI51Mx98f4ZY37CxocZUUl73snzPD0Tf2HyqoS5gotyCz4a4zqsjEzJZ7j
	e1jPJxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odEK1-00BxkS-Mm; Tue, 27 Sep 2022 17:24:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odEJz-00Bxj6-6p
	for linux-mediatek@lists.infradead.org; Tue, 27 Sep 2022 17:24:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A291661A82
	for <linux-mediatek@lists.infradead.org>; Tue, 27 Sep 2022 17:24:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1669FC43470
	for <linux-mediatek@lists.infradead.org>; Tue, 27 Sep 2022 17:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664299477;
	bh=TI0BvvVUQvfDFyPxhMOeQD2Z7W2gOKC/PbAYirHGfbU=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=insC2Yow9mB9pyJOosDWkDvhobrjLCp36VqA2VCsteBrBLGL56xNm+WfVh58KG52Q
	 VaUGj7iH+0RrdmqI9PKRQsbHmfFELeFRU/96swq5ht9Coe1gRefrx0kqHUVVLI8tJl
	 ZTV3cVBN8aLZqs/6ZTVZmwLCckM3Cj7Zh4P8EA4vsm6XjqW225NdEPV+/8QjoacUM6
	 +TaLxilHN28uySnYYAfKxUfkvSIcIISW1UQbsfDHFwZsL7O8cephAdfRkoNCfGQPUp
	 Cdnu9omrCkhSrsqXCrZ3gxX/Bc0qU40LyOAWzHT6GzW3ZRgM98beA+GxOcDBsKNGz9
	 ACEmAgl1GUD8A==
Received: by mail-oi1-f179.google.com with SMTP id c81so12629224oif.3
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Sep 2022 10:24:36 -0700 (PDT)
X-Gm-Message-State: ACrzQf0uuwjFqJIJ67pslMLJM9kK7Bv4Lzat7yVoHDIHzuIUOOyV9Hhz
	FK5NDTrE42J00KW/59B3A+iW60G0p7DnCrz4U2w=
X-Google-Smtp-Source: AMsMyM6Dilao0hoDFn/xSyW6e8QpYB71i1FlNEUQ9P9OTOv2JrNTar5iq54912h3mtkvO+i8XDEfuiGj8FF1LdaF+eE=
X-Received: by 2002:a05:6808:bca:b0:350:b366:157 with SMTP id
 o10-20020a0568080bca00b00350b3660157mr2291162oik.3.1664299476149; Tue, 27 Sep
 2022 10:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <835f393df9cc985fe5b815bc6eeaf06ab4d07192.camel@mediatek.com>
 <CA+5PVA60ODTEZPoYqPMqjxu_ARxFLmeHie11McQUAx95+bXwFw@mail.gmail.com> <668c8e070faa138d5a2bf345f65a27fab908842f.camel@mediatek.com>
In-Reply-To: <668c8e070faa138d5a2bf345f65a27fab908842f.camel@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 27 Sep 2022 13:24:25 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7WBOhyYp3frrAmYjeF7NZOmQrgorrAv9Jx8DAKn8XZdQ@mail.gmail.com>
Message-ID: <CA+5PVA7WBOhyYp3frrAmYjeF7NZOmQrgorrAv9Jx8DAKn8XZdQ@mail.gmail.com>
Subject: Re: [PULL v2 linux-firmware] Update mediatek mt81xx SOF firmware
To: TingHan Shen <tinghan.shen@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	chunxu.li@mediatek.com, allen-kh.cheng@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_102439_371467_FC35F932 
X-CRM114-Status: GOOD (  29.58  )
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

On Mon, Sep 26, 2022 at 10:13 PM TingHan Shen <tinghan.shen@mediatek.com> wrote:
>
> On Mon, 2022-09-26 at 10:27 -0400, Josh Boyer wrote:
> > On Fri, Sep 16, 2022 at 4:35 AM TingHan Shen <tinghan.shen@mediatek.com> wrote:
> > >
> > > Hi maintainers,
> > >
> > > This pull request adds new MediatekTek MT8195 SOF firmware and
> > > updates MT8186 SOF firmware.
> > >
> > > Please let me know if there is any problem.
> > >
> > > Best regards,
> > > TingHan
> > >
> > > --
> > >
> > > The following changes since commit f09bebf31b0590bdc875d7236aa705279510cfd0:
> > >
> > >   amdgpu: update yellow carp DMCUB firmware (2022-09-13 08:02:23 -0400)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://urldefense.com/v3/__https://github.com/tinghan-shen/linux_fw_scp__;!!CTRNKA9wMg0ARbw!zqfFVP7tWlJ3XFU-l8fMAh36-BXt04WguMdj2WJq4tCdMxoKl0Ikb3chkJ9nzBB0I0Q$  mtk-20220915
> > >
> > > for you to fetch changes up to 3e08c58f8af488c41573c4a64a261e3b3f35849b:
> > >
> > >   mediatek: Add new mt8195 SOF firmware (2022-09-16 16:19:11 +0800)
> > >
> > > ----------------------------------------------------------------
> > > Tinghan Shen (2):
> > >       mediatek: Update mt8186 SOF firmware
> > >       mediatek: Add new mt8195 SOF firmware
> > >
> > >  WHENCE                                                                                      |  11 ++++++++---
> > >  mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg}           | Bin
> > >  mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg                                  | Bin 0 -> 20895 bytes
> > >  .../sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} | Bin 16191 -> 16191 bytes
> >
> > This fails check_whence.py:
> >
> > [jwboyer@vader linux-firmware]$ ./check_whence.py
> > E: mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg not
> > listed in WHENCE
> > [jwboyer@vader linux-firmware]$
> >
> > Can you fix it up please?
> >
> > josh
> >
> > >  mediatek/sof/sof-mt8186.ldc                                                                 | Bin 0 -> 48436 bytes
> > >  mediatek/sof/sof-mt8186.ri                                                                  | Bin 128712 -> 128712 bytes
> > >  mediatek/sof/sof-mt8195.ldc                                                                 | Bin 0 -> 40568 bytes
> > >  mediatek/sof/sof-mt8195.ri                                                                  | Bin 0 -> 100740 bytes
> > >  8 files changed, 8 insertions(+), 3 deletions(-)
> > >  rename mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg} (100%)
> > >  create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
> > >  rename mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} (86%)
> > >  create mode 100644 mediatek/sof/sof-mt8186.ldc
> > >  create mode 100644 mediatek/sof/sof-mt8195.ldc
> > >  create mode 100644 mediatek/sof/sof-mt8195.ri
> > >
>
> Hi josh,
>
> I forgot to update the WHENCE after added the file.
> I'm sorry, and following is the udpated PR.

Thanks!  Pulled and pushed out.

josh

>
> Best regards,
> TingHan
>
> --
>
> The following changes since commit 126b56964ff8714657eb51a28cc07a31629e603d:
>
>   Merge branch 'guc_70.5.1_huc_nover' of git://anongit.freedesktop.org/drm/drm-firmware (2022-09-26 10:30:08 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/tinghan-shen/linux_fw_scp mtk-20220915
>
> for you to fetch changes up to daee413cb1a49ce87d237247dbdfcea405ee3b99:
>
>   mediatek: Add new mt8195 SOF firmware (2022-09-27 10:03:00 +0800)
>
> ----------------------------------------------------------------
> Tinghan Shen (2):
>       mediatek: Update mt8186 SOF firmware to v0.2.1
>       mediatek: Add new mt8195 SOF firmware
>
>  WHENCE                                                                                                |  12 +++++++++---
>  mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg}                     | Bin
>  mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg                                            | Bin 0 -> 20895 bytes
>  mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} | Bin 16191 -> 16191 bytes
>  mediatek/sof/sof-mt8186.ldc                                                                           | Bin 0 -> 48436 bytes
>  mediatek/sof/sof-mt8186.ri                                                                            | Bin 128712 -> 128712 bytes
>  mediatek/sof/sof-mt8195.ldc                                                                           | Bin 0 -> 40568 bytes
>  mediatek/sof/sof-mt8195.ri                                                                            | Bin 0 -> 100740 bytes
>  8 files changed, 9 insertions(+), 3 deletions(-)
>  rename mediatek/{sof/sof-mt8186-mt6366-da7219-max98357.tplg => sof-tplg/sof-mt8186.tplg} (100%)
>  create mode 100644 mediatek/sof-tplg/sof-mt8195-mt6359-rt1019-rt5682-dts.tplg
>  rename mediatek/{sof/sof-mt8186-mt6366-rt1019-rt5682s.tplg => sof-tplg/sof-mt8195-mt6359-rt1019-rt5682.tplg} (86%)
>  create mode 100644 mediatek/sof/sof-mt8186.ldc
>  create mode 100644 mediatek/sof/sof-mt8195.ldc
>  create mode 100644 mediatek/sof/sof-mt8195.ri
>
>
>

