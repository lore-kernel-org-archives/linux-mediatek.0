Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3BCC2BA83
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 12:00:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FE0F2187F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 12:00:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Krmwud+z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U30YN/B2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FE0F2187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BwDdo2LMCCvd9V3ic1qDeED8CnfpaDrRr9kefnclOnI=; b=Krmwud+ziQL4Ox
	1ortap5MWGe5K2bddIhDFBG2l7lM+Z4PhdKP9QO3N0jUrDKIQmxpQfeOEwO30jZa6gGYAEDhir2Rt
	i0gY/q7b9/uR8NTOpXPWnKDKpKrKM9XMMjSrtN7bmPxHcAnZK6wXmPVW/SpGqoSG6cnoljoGeq8Oa
	Aj0wB5woWvIWJ0P6/4e7cjiOaqpd0sW/k/9DofhiQGaxtWVo3jY+XLUNW1aZU7/CleVwW+oWfBAaE
	lvSC5q9nQ+9ru5zbdelVrjEjwCcuGzC+T3bGPePmlrvnHEPedOMlMiZoJT9CszXnSl2E+l8wjXuvv
	EyPKVmMNipT6wEKF9zcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Zdn-0003oH-3N; Fri, 14 Feb 2020 12:00:15 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2ZdW-0002SU-AT
 for linux-mediatek@lists.infradead.org; Fri, 14 Feb 2020 11:59:59 +0000
Received: by mail-io1-xd43.google.com with SMTP id t26so10224958ioi.13
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Feb 2020 03:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1uraVtsrzVMHzePG2yR6DCPEUMyavhEyjVs6nxEu24o=;
 b=U30YN/B2MumWYRiXps0fXkEWwSbju05SSBqJ4/raPl8BGRwatykH4NN5BhmTGAAcSP
 t0MWzBlOIlELWnQbS7pogaTu9V3noHu3hw2QYvs8WYZ93cF4NLKnuYa/kfrmCHch/ADb
 lbs1t4fy6PqAkeECeCkNqgUuytFbP1GcOSaDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1uraVtsrzVMHzePG2yR6DCPEUMyavhEyjVs6nxEu24o=;
 b=hice7v6zMEMP4mNwHChmRp0tPMqfTGzEpPotNVspESxNhht1bFQhtT/83h8wyhvq6e
 1THPuXkdd1rduxR8vEMQ/Ok80hYlq/JQU3xqyuE22lI7vw30oxkjE8aVf5s3yFOKtSDk
 IUsxIkosqCd6+zNqbKVm+5LP2J3ungciuSzeMFtbekTG9axJ7zvogaVQ/JwiSzD1uypw
 c45JD04zJ+ff8jQ2MvPt/DBRm4d1AkKiLFmscEOvp2iiSmRRO23Rk6w2ABgTBojlEDXp
 k5BT8a4a4m6M08pvtJYM8o/ExJUZxg2zL++FkpyrNoYu82HOR91eCHnUDQu69GKxfIH6
 SzyQ==
X-Gm-Message-State: APjAAAVIV3oLk8zHlbfXAG87zxefeJJdWzOi6kPVOSGiEe4NxDpg4M2D
 01xcwQVdvLem5RS89D51+32XsHl4glex6woT8a1b+g==
X-Google-Smtp-Source: APXvYqxMO1/xuTDVrtKd0ZSFbiILKTJtYtsmXOvsUOD0CpbVMimQ6kn9e/yNKOWoZ4c8M8RRzOmpBWPZFwTqt9iA31E=
X-Received: by 2002:a6b:3845:: with SMTP id f66mr2068307ioa.102.1581681596283; 
 Fri, 14 Feb 2020 03:59:56 -0800 (PST)
MIME-Version: 1.0
References: <20200210035351.227499-1-hsinyi@chromium.org>
 <bf9205b3-6b02-625a-670d-16cfd44d3274@xs4all.nl>
In-Reply-To: <bf9205b3-6b02-625a-670d-16cfd44d3274@xs4all.nl>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 14 Feb 2020 19:59:30 +0800
Message-ID: <CAJMQK-gaEq7RA8vQBsM4-LcFONRQ5GY0nUiSUJ08uhggTSHcNA@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vpu: avoid unaligned access to DTCM buffer.
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_035958_388680_BC0C51DF 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 lkml <linux-kernel@vger.kernel.org>, Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 14, 2020 at 6:52 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Hsin-Yi Wang,
>
> On 2/10/20 4:53 AM, Hsin-Yi Wang wrote:
> > struct vpu_run *run in vpu_init_ipi_handler() is an ioremapped DTCM (Data
> > Tightly Coupled Memory) buffer shared with AP.  It's not able to do
> > unaligned access. Otherwise kernel would crash due to unable to handle
> > kernel paging request.
> >
> > struct vpu_run {
> >       u32 signaled;
> >       char fw_ver[VPU_FW_VER_LEN];
> >       unsigned int    dec_capability;
> >       unsigned int    enc_capability;
> >       wait_queue_head_t wq;
> > };
> >
> > fw_ver starts at 4 byte boundary. If system enables
> > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS, strscpy() will do
> > read_word_at_a_time(), which tries to read 8-byte: *(unsigned long *)addr
> >
> > Copy the string by memcpy_fromio() for this buffer to avoid unaligned
> > access.
> >
> > Fixes: 85709cbf1524 ("media: replace strncpy() by strscpy()")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> This patch results in the following sparse warnings:
>
> sparse: WARNINGS
> SPARSE:mtk-vpu/mtk_vpu.c mtk-vpu/mtk_vpu.c:834:52:  warning: incorrect type in argument 3 (incompatible argument 1 (different address spaces))
> SPARSE:mtk-vpu/mtk_vpu.c mtk-vpu/mtk_vpu.c:609:29:  warning: dereference of noderef expression
> SPARSE:mtk-vpu/mtk_vpu.c mtk-vpu/mtk_vpu.c:613:35:  warning: dereference of noderef expression
> SPARSE:mtk-vpu/mtk_vpu.c mtk-vpu/mtk_vpu.c:614:35:  warning: dereference of noderef expression
>
> Can you take a look?
>
> Regards,
>
>         Hans
>
Thanks, I'll send a v2 to fix this

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
