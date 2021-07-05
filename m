Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D77CC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:05:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 216D1613DA
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 216D1613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tsUF0HzpXCyVNiW5FaXd2rBun4SZa8zTkX5fDKD/F0=; b=sNs0IyrZv+SDK/
	nnpHA6CyjMslVaDUjWeErhYx3shO20WGR7iA6pEz9IcQpD7XUxAYSiX+Qtlc+LNRgPpefcKMZNNE0
	tU5FpUuAmgeSMmgPYIwXMtolfI4Tco8NhwfiShP3g+eFb6cOpuN0m2lb0w8tjtxDwFDaNNvY2Fwrf
	H3mdavehbunZ2nOdnVK5sgFO06xtR698h10hb+EZayRCN5HZmgRnlVpuAZ5eHNu0/ClAeEjc2xDtq
	5nfJmIJNuWiD2M4h0d0m7V7HWdtxGdBRxDO5mMXAX5fJ18zaSNBZmY6QLVaxipC/Qqn6cIpAjQ08m
	TzWFXV6P025Lnqgz0mzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Gmr-007oiJ-Pe; Mon, 05 Jul 2021 05:04:53 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Gmp-007ohB-LX
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 05:04:53 +0000
Received: by mail-lf1-x12f.google.com with SMTP id c28so6747256lfp.11
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Jul 2021 22:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nzm0nWj/aTYJHOKXonLiG7z2GGnZubrdTmRQ0xRi/ZI=;
 b=A7xlaSndZwByNH1ngHi12Wy4wDajC6l1MlhCftDjaKo5zes9hg+ZZImW9ll3V2hBiX
 Y+iX+Fq9yigCH+771Lca7wXR92k0ABqkWePAkW9suWUo0E2GTeeqMYOeX9v5NysFKOnq
 nAJp8E0T7iCgoGRwvXnArWptJ45g9Uibv9rCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nzm0nWj/aTYJHOKXonLiG7z2GGnZubrdTmRQ0xRi/ZI=;
 b=r7CWZMpjsCZKlFa+xkdTMPiHXXOQxmaCEeLcjvuvuB81Swsam/Tj+LYFS3OjQ2yyMF
 o4xnGoFpNAccev3prdD6MFcIfTBWH8wmSNVARmThBJD6BPCtQsg+SOXnhm/3ON/3NMyR
 ZBmwnGNBZnoSo73AngS4uzougp5xc7rA+mGiIsRMxeDJrR/Zwy5b1wqxVsGgquKnBExa
 +crYJCCsjYjWJ+2jwA+jjiSH4jTKZGxovfONuOo+azL/XalpktB18rHok9OJH2N7A7Ek
 6za6wnHyAF9kglMh8Dg97ivos6FAB7u9ze3Xbj/ob40L+Y7Yib6Him8M1SqT/G/nlEuJ
 qvOQ==
X-Gm-Message-State: AOAM531nNOIlcmf9mfWLaXU4lxNMoygtu1mg8sjiZ1XrKBnYr1JjayJm
 GjIq6uVcGf6PbVcXBQfDmqL8b5muZmoq4A==
X-Google-Smtp-Source: ABdhPJwS/hVIbgaqUY3LNWP4PCoyrfNnOpQZ3Z2/3BN+5IKiQAJgzF9iOcH2V9IoX1iWJGkF+UQQ5w==
X-Received: by 2002:a05:6512:991:: with SMTP id
 w17mr9081899lft.57.1625461488590; 
 Sun, 04 Jul 2021 22:04:48 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41])
 by smtp.gmail.com with ESMTPSA id s6sm961527lfd.171.2021.07.04.22.04.46
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 22:04:47 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id p21so8440564lfj.13
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Jul 2021 22:04:46 -0700 (PDT)
X-Received: by 2002:a19:5e16:: with SMTP id s22mr9437459lfb.614.1625461486444; 
 Sun, 04 Jul 2021 22:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-6-acourbot@chromium.org>
 <9b37044d-f909-9169-3d22-fa6c5f788822@collabora.com>
In-Reply-To: <9b37044d-f909-9169-3d22-fa6c5f788822@collabora.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 5 Jul 2021 14:04:35 +0900
X-Gmail-Original-Message-ID: <CAPBb6MV35sJ-LY8w-nhpnndRHtJXapSN63xFzUiAbYQFLvm1dQ@mail.gmail.com>
Message-ID: <CAPBb6MV35sJ-LY8w-nhpnndRHtJXapSN63xFzUiAbYQFLvm1dQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] media: mtk-vcodec: venc: support START and STOP
 commands
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_220451_732040_C99849A8 
X-CRM114-Status: GOOD (  21.22  )
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

Hi Dafna, sorry for (again) taking so long to come back to this! >_<

On Fri, May 28, 2021 at 4:03 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Hi,
>
> I applied this patchset and tested the stateful encoder on debian with the command:
>
> [gst-master] root@debian:~/gst-build# gst-launch-1.0 filesrc location=images/jelly-800-640.YU12 ! rawvideoparse width=800 height=640 format=i420 ! videoconvert ! v4l2h264enc ! h264parse ! mp4mux ! filesink location=jelly-800-640.mp4
>
> I get:
>
> Setting pipeline[   79.703879] [MTK_V4L2] level=0 fops_vcodec_open(),190: encoder capability 10000000
>   to PAUSED ...
> Pipeline is PREROLLING ...
> Redistribute latency...
> [   80.621076] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.631232] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.640878] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.650766] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.660430] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.670194] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.680967] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.691376] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.701718] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.712106] mtk-iommu 10205000.iommu: Partial TLB flush timed out, falling back to full flush
> [   80.722272] [MTK_V4L2] level=0 mtk_venc_set_param(),371: fmt 0x3, P/L 0/0, w/h 800/640, buf 800/640, fps/bps 25/4000000, gop 0, i_period 0
> Pipeline is PREROLLED ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> [   81.918747] [MTK_V4L2][ERROR] mtk_vcodec_wait_for_done_ctx:32: [3] ctx->type=1, cmd=1, wait_event_interruptible_timeout time=1000ms out 0 0!
> [   81.931392] [MTK_VCODEC][ERROR][3]: h264_encode_frame() irq_status=0 failed
> [   81.938470] [MTK_V4L2][ERROR] mtk_venc_worker:1219: venc_if_encode failed=-5
> [   82.974746] [MTK_V4L2][ERROR] mtk_vcodec_wait_for_done_ctx:32: [3] ctx->type=1, cmd=1, wait_event_interruptible_timeout time=1000ms out 0 0!
> [   82.987392] [MTK_VCODEC][ERROR][3]: h264_encode_frame() irq_status=0 failed
> [   82.994471] [MTK_V4L2][ERROR] mtk_venc_worker:1219: venc_if_encode failed=-5
> [  104.163977] cros-ec-dev cros-ec-dev.2.auto: Some logs may have been dropped...
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> 0:00:00.4 / 99:99:99.
> ^Chandling interrupt.
>
> And then the streaming hangs. The same error happens without this patchset, but without
> this patchset the statful encoder does not support V4L2_ENC_CMD_STOP/START needed by the spec.
> I am not sure what cause the error and wether those mtk-iommu erros has to do with that. The issue
> could also come from the mtk-vpu used by the encoder.
> Do you have any idea where this can come from?

Mmm, this looks like the firmware is unhappy about something and
hangs. I wonder if the IOMMU messages above could not be linked to
that, I remember seeing similar problems when the buffers were not
properly synced on the device side.

I'll try and see if I can deploy gstreamer on the old MT8173
Chromebook I am using to see if I have more success here, but no
guarantee I can test in the same conditions as you unfortunately. :/

The MTK folks are the most qualified to look into this issue though.
Yunfei, do you have any idea about why this is happening?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
