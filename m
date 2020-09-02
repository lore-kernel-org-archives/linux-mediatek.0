Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C5FC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 14:53:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 060D420829
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 14:53:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AT72ZJ9Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OFHTYHEq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 060D420829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6ZwYVmnGlWQ3C/LNdHdvPwxdHenYtPluugB5V+Bn66k=; b=AT72ZJ9Y+PCOtoiYAqNgbCn1a
	iNZuAZvVerjcMCSKs1iOCUFoRmwccdMBX+3OgRN+98FZYrDubavyKnvWqtdsA1JTP0wDqHmdBuMMB
	luxVhmpVLrYlpsazfw8IkqHvQ1BU2hrn1aKsSHG0QT6c7P2Nq0G3pR15y9BuGIbI1ppAnBavgjlEG
	Tcf/D+z9r40dL8fey88Ru2LBbfwmMHEIH1ldePB4iQVyuhnnsJ9lXMcxPUfGizal7yDU6LM/7zc/9
	8g8ANWIMGB2wtRPBXe2SV4pNwscRG5rwJYKWoMOakW28YlfTNQwi7XQNFoR0POQCpUcpIi24cApbA
	o2itrTERQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDU8k-00025E-CB; Wed, 02 Sep 2020 14:53:34 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDU8g-00023V-BN
 for linux-mediatek@lists.infradead.org; Wed, 02 Sep 2020 14:53:32 +0000
Received: by mail-il1-x143.google.com with SMTP id l4so1007719ilq.2
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2020 07:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EsQpeI7D1H5k/d2ldZ6dL5UBletkvcQ405Mqk41kvtA=;
 b=OFHTYHEqJUI+FtLrE6PAi2aZwioFNMDfiqJjDZVXi/KHUzL54VOMwMkSZ/Na4d4Ogw
 OflZqUSOYEI/YWnGu7gZBbi63l+atE12YXmZ0ywQPPRb7gqc6b+FVmj0taaL11erEQnH
 0mPWDuTQEQy4kc7PVUtsjcTMS4PkoSyJxV4Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EsQpeI7D1H5k/d2ldZ6dL5UBletkvcQ405Mqk41kvtA=;
 b=Qlb5xEcnc/6pHMkJpEtIdbJ/y0VVzkDf9kkHoR3cwhB3piy8i2WwNgG5hfMHKhR6bR
 mdHD/XFpaJMpd04E+FpVoKGtnWpKifbgqpwzEer0J6qbAow9jTRWt2YBnYQaIPVZMSV9
 3Ii6TJencysOK+4Lokl85cUZGwPVt6nsp3IOruW4jJJHem4MAb3ArXJesgCwTUOl0DEk
 0Gpxj+pKG+/9M7d4o9vLojEAzgaDLh3EY48adTcKZlGq3jIXhkVjpjMoiYJHUHPmkRti
 lfkxdzR3Q60qCvDUbN+NxTLvUkmfv8Csj0LFuNKpnykl+UCTZ2pzdREyYaHPDQLx9COs
 JOZQ==
X-Gm-Message-State: AOAM5322C7q9xPgXNMdGWoZlcibtEwYJkDGMEgFfOWodFnwo32UcQvXP
 rQVh+ExtwgjaULjoQFeVXL2D8MBsS/eN662I1bQzqQ==
X-Google-Smtp-Source: ABdhPJwfWW+4DdbIXIThrd4HJdbvX+osez09zDgESRDix7dRhl57slXevJAI1SafQdAFByT88optw/yw5bUXiIOhQDE=
X-Received: by 2002:a92:c008:: with SMTP id q8mr4094957ild.106.1599058406623; 
 Wed, 02 Sep 2020 07:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200821041414.1560707-1-hsinyi@chromium.org>
 <f8c5b7e0-66a2-7ec6-041f-82679a863758@arm.com>
In-Reply-To: <f8c5b7e0-66a2-7ec6-041f-82679a863758@arm.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 2 Sep 2020 22:53:00 +0800
Message-ID: <CAJMQK-huFDrEKGcwPO4XkzZ0Dvc5OF22uDothKczu9NoQxsx3g@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vcodec: set dma max segment size
To: Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_105330_409284_B531DB39 
X-CRM114-Status: GOOD (  20.48  )
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
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>, Irui Wang <irui.wang@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Anand K Mistry <amistry@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 2, 2020 at 10:25 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2020-08-21 05:14, Hsin-Yi Wang wrote:
> > Set dma max segment size for encoder and decoder driver.
> >
> > Fix following warning with CONFIG_DMA_API_DEBUG_SG=y
> >
> > [   75.147825] ------------[ cut here ]------------
> > [   75.147844] mtk-vcodec-enc 19002000.vcodec: DMA-API: mapping sg segment longer than device claims to support [len=983040] [max=65536]
> > [   75.147876] WARNING: CPU: 2 PID: 4069 at kernel/dma/debug.c:1302 debug_dma_map_sg+0x1a8/0x2c4
> > ...
> > [   75.148139] Call trace:
> > [   75.148149]  debug_dma_map_sg+0x1a8/0x2c4
> > [   75.148165]  vb2_dc_get_userptr+0x228/0x364 [videobuf2_dma_contig]
> > [   75.148178]  __buf_prepare+0x3ac/0x8c0 [videobuf2_common]
> > [   75.148188]  vb2_core_qbuf+0xa4/0x58c [videobuf2_common]
> > [   75.148199]  vb2_qbuf+0x88/0xe4 [videobuf2_v4l2]
> > [   75.148211]  v4l2_m2m_qbuf+0x80/0xf8 [v4l2_mem2mem]
> > [   75.148221]  vidioc_venc_qbuf+0x3c/0x70 [mtk_vcodec_enc]
> > [   75.148234]  v4l_qbuf+0x48/0x58
> > [   75.148242]  __video_do_ioctl+0x200/0x37c
> > [   75.148250]  video_usercopy+0x360/0x834
> > [   75.148259]  video_ioctl2+0x38/0x48
> > [   75.148267]  v4l2_ioctl+0x6c/0x80
> > [   75.148276]  do_video_ioctl+0xefc/0x4b70
> > [   75.148284]  v4l2_compat_ioctl32+0x5c/0xcc
> > [   75.148294]  __arm64_compat_sys_ioctl+0xf4/0x240
> > [   75.148304]  el0_svc_common+0xac/0x198
> > [   75.148312]  el0_svc_compat_handler+0x2c/0x40
> > [   75.148321]  el0_svc_compat+0x8/0x18
> > [   75.148328] irq event stamp: 0
> > [   75.148337] hardirqs last  enabled at (0): [<0000000000000000>]           (null)
> > [   75.148347] hardirqs last disabled at (0): [<ffffff90080e65c0>] copy_process+0x380/0x115c
> > [   75.148356] softirqs last  enabled at (0): [<ffffff90080e65d8>] copy_process+0x398/0x115c
> > [   75.148364] softirqs last disabled at (0): [<0000000000000000>]           (null)
> > [   75.148372] ---[ end trace 588bf529451e3531 ]---
> >
> > Reported-by: Anand K Mistry <amistry@chromium.org>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 8 ++++++++
> >   drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 8 ++++++++
> >   2 files changed, 16 insertions(+)
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index 97a1b6664c20..3bbd0bac56d6 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -242,6 +242,14 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
> >               mtk_v4l2_err("[VPU] vpu device in not ready");
> >               return -EPROBE_DEFER;
> >       }
> > +     if (!pdev->dev.dma_parms) {
> > +             pdev->dev.dma_parms = devm_kzalloc(&pdev->dev,
> > +                                             sizeof(*pdev->dev.dma_parms),
> > +                                             GFP_KERNEL);
> > +             if (!pdev->dev.dma_parms)
> > +                     return -ENOMEM;
> > +     }
>
> Since 9495b7e92f71, dma_parms is included in the platform_device itself
> and always set, so you can drop these allocation paths.
>
> > +     dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
>
> The segment size is simply a size, not a bitmask, so UINT_MAX would be
> more semantically appropriate.
>
> Robin.
>

Thanks. since this patch is already in media tree:
https://git.linuxtv.org/media_tree.git/commit/?id=13483fc2f20f0e2db7ba9c39b095ac7ea46f8de8,
I'll send a patch to modify this.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
