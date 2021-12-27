Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E6AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 07:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOsW0Qg2JtdWUl2Np4uAzFvYHD1qmBr2kkFl24q/Ezc=; b=x5Ej0nxQpkdabQ
	IRwXn8/WaW6JkA4hheLHi8ej+opRFIhj1kWgs/YViVscCMnZ09ZA9A2nDnuC5iLE7IhpPjNQxfAq8
	gxtQ2Zx0mhrO+r6buSXolE7TME3oSJcGXxtKSdBibDT1N6wB+7RCpcr3ahatl2vkqJOGxShcelvym
	3EVy/4Ocx2DRvK0DqjcnEyCQWayNW+K5f5qpGTR3C4F/6Z9rFd/eAnndm7BfG4SQBwlqIAzcdmJDD
	bEq/HxKAsiMsIfeB/GP1FkDTGC1ZbI4J7lJyopOkXfbqCnsMCgaFzKdLHsD0ABzyiVi8+20GkLVOF
	CjZB0FFiIZOZnR22JjFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1kBa-00GIld-Eq; Mon, 27 Dec 2021 07:12:46 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1kBX-00GIlH-O7
 for linux-mediatek@lists.infradead.org; Mon, 27 Dec 2021 07:12:45 +0000
Received: by mail-ua1-x933.google.com with SMTP id p1so3472478uap.9
 for <linux-mediatek@lists.infradead.org>; Sun, 26 Dec 2021 23:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TGt9h2A85gxYft0rVPguvrwyauB5J7ujBUnVmtY0QIE=;
 b=UuGM08JNoPIZGbdzJTwhkqWus0Mk3UZF1YuJDDNqK7d7b23yzMmxkLcwqVZXdOyILw
 CrjCTshqvCB0YGZhAGrU7b8HOQdNB8O7LZTFwiwyTPBTu4ZaUKtm6DEUbPRcuzc41YB9
 ANpYlwsZO6IQtKii+/rd5T1GdsBy0+cUSSvlg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TGt9h2A85gxYft0rVPguvrwyauB5J7ujBUnVmtY0QIE=;
 b=7RP8jVPNsGqmUkcucNka7cSVr5fsBpUgkFvFcuDFjD4+rRXE/Ke6NIClEb3gJCmXGT
 F6JFh5Wr3bTGfGjeBimOQWmhcNKzVH6PwGiOudgjPl1Vco4q39ghbZsRtAOa2i6g/Hgg
 ZSVBaWyrUiiMCKXj9AKiGlWQwSIzDu4NMh9M4pbHh2L52dA5b2o3jf188Amh/WRNA4Eo
 WsXWsw19cbeuXbGwLX6OIOi3xGGoN84xbcR9dNGowf9iZW4cbphWqDM7Q7QZ5AsS/CAw
 YBNnElWT3mVAn/MXB7HX1NzFVbYCoqIUet5QCwqp0lqukw+rg/xT9Q+E2eOI+m6lD8jU
 +I9g==
X-Gm-Message-State: AOAM5316upLKP2BCAxKOyeE/Ia4dulpmDEfWqDFUaFZqCgq0RdtNdUh9
 D0jluMwMTDxTT2d8621EmnFqsqnDGlwJoA==
X-Google-Smtp-Source: ABdhPJwaolU8tRXHKmihd0AWMYw1L5ZAdJNg+EpqkH2MOdVE+9SkkxW1AxfVB89/5zXUTamXMe2mNA==
X-Received: by 2002:a67:3214:: with SMTP id y20mr4091560vsy.4.1640589162172;
 Sun, 26 Dec 2021 23:12:42 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id t130sm841018vkc.32.2021.12.26.23.12.42
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Dec 2021 23:12:42 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id v14so7919902uau.2
 for <linux-mediatek@lists.infradead.org>; Sun, 26 Dec 2021 23:12:42 -0800 (PST)
X-Received: by 2002:a05:6102:85:: with SMTP id t5mr3972571vsp.25.1640588780620; 
 Sun, 26 Dec 2021 23:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20211117130635.11633-1-dafna.hirschfeld@collabora.com>
 <20211117130635.11633-3-dafna.hirschfeld@collabora.com>
In-Reply-To: <20211117130635.11633-3-dafna.hirschfeld@collabora.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 27 Dec 2021 16:06:09 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVeohz94O5bXrBLmQkPddMTD9sj0ZMsOjG652_r7OyHSg@mail.gmail.com>
Message-ID: <CAPBb6MVeohz94O5bXrBLmQkPddMTD9sj0ZMsOjG652_r7OyHSg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] media: mtk-vcodec: call v4l2_m2m_ctx_release first
 when file is released
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 kernel@collabora.com, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, courbot@chromium.org, 
 Dafna Hirschfeld <dafna3@gmail.com>, eizan@chromium.org,
 houlong.wei@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Irui Wang <irui.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?= <maoguang.meng@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, minghsiu.tsai@mediatek.com, 
 Tomasz Figa <tfiga@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_231243_798141_29829B78 
X-CRM114-Status: GOOD (  18.43  )
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

On Wed, Nov 17, 2021 at 10:06 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> The func v4l2_m2m_ctx_release waits for currently running jobs
> to finish and then stop streaming both queues and frees the buffers.
> All this should be done before the call to mtk_vcodec_enc_release
> which frees the encoder handler. This fixes null-pointer dereference bug:
>
> [gst-master] root@debian:~/gst-build# [  638.019193] Unable to handle kernel NULL pointer dereference at virtual address 00000000000001a0
> [  638.028076] Mem abort info:
> [  638.030932]   ESR = 0x96000004
> [  638.033978]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  638.039293]   SET = 0, FnV = 0
> [  638.042338]   EA = 0, S1PTW = 0
> [  638.045474]   FSC = 0x04: level 0 translation fault
> [  638.050349] Data abort info:
> [  638.053224]   ISV = 0, ISS = 0x00000004
> [  638.057055]   CM = 0, WnR = 0
> [  638.060018] user pgtable: 4k pages, 48-bit VAs, pgdp=000000012b6db000
> [  638.066485] [00000000000001a0] pgd=0000000000000000, p4d=0000000000000000
> [  638.073277] Internal error: Oops: 96000004 [#1] SMP
> [  638.078145] Modules linked in: rfkill mtk_vcodec_dec mtk_vcodec_enc uvcvideo mtk_mdp mtk_vcodec_common videobuf2_dma_contig v4l2_h264 cdc_ether v4l2_mem2mem videobuf2_vmalloc usbnet videobuf2_memops videobuf2_v4l2 r8152 videobuf2_common videodev cros_ec_sensors cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf elan_i2c elants_i2c sbs_battery mc cros_usbpd_charger cros_ec_chardev cros_usbpd_logger crct10dif_ce mtk_vpu fuse ip_tables x_tables ipv6
> [  638.118583] CPU: 0 PID: 212 Comm: kworker/u8:5 Not tainted 5.15.0-06427-g58a1d4dcfc74-dirty #109
> [  638.127357] Hardware name: Google Elm (DT)
> [  638.131444] Workqueue: mtk-vcodec-enc mtk_venc_worker [mtk_vcodec_enc]
> [  638.137974] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  638.144925] pc : vp8_enc_encode+0x34/0x2b0 [mtk_vcodec_enc]
> [  638.150493] lr : venc_if_encode+0xac/0x1b0 [mtk_vcodec_enc]
> [  638.156060] sp : ffff8000124d3c40
> [  638.159364] x29: ffff8000124d3c40 x28: 0000000000000000 x27: 0000000000000000
> [  638.166493] x26: 0000000000000000 x25: ffff0000e7f252d0 x24: ffff8000124d3d58
> [  638.173621] x23: ffff8000124d3d58 x22: ffff8000124d3d60 x21: 0000000000000001
> [  638.180750] x20: ffff80001137e000 x19: 0000000000000000 x18: 0000000000000001
> [  638.187878] x17: 000000040044ffff x16: 00400032b5503510 x15: 0000000000000000
> [  638.195006] x14: ffff8000118536c0 x13: ffff8000ee1da000 x12: 0000000030d4d91d
> [  638.202134] x11: 0000000000000000 x10: 0000000000000980 x9 : ffff8000124d3b20
> [  638.209262] x8 : ffff0000c18d4ea0 x7 : ffff0000c18d44c0 x6 : ffff0000c18d44c0
> [  638.216391] x5 : ffff80000904a3b0 x4 : ffff8000124d3d58 x3 : ffff8000124d3d60
> [  638.223519] x2 : ffff8000124d3d78 x1 : 0000000000000001 x0 : ffff80001137efb8
> [  638.230648] Call trace:
> [  638.233084]  vp8_enc_encode+0x34/0x2b0 [mtk_vcodec_enc]
> [  638.238304]  venc_if_encode+0xac/0x1b0 [mtk_vcodec_enc]
> [  638.243525]  mtk_venc_worker+0x110/0x250 [mtk_vcodec_enc]
> [  638.248918]  process_one_work+0x1f8/0x498
> [  638.252923]  worker_thread+0x140/0x538
> [  638.256664]  kthread+0x148/0x158
> [  638.259884]  ret_from_fork+0x10/0x20
> [  638.263455] Code: f90023f9 2a0103f5 aa0303f6 aa0403f8 (f940d277)
> [  638.269538] ---[ end trace e374fc10f8e181f5 ]---
>
> Fixes: 4e855a6efa547 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

The order looks indeed safer this way.

Reviewed-by: Alexandre Courbot <acourbot@chromium.org>


> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index eed67394cf46..f898226fc53e 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -214,11 +214,11 @@ static int fops_vcodec_release(struct file *file)
>         mtk_v4l2_debug(1, "[%d] encoder", ctx->id);
>         mutex_lock(&dev->dev_mutex);
>
> +       v4l2_m2m_ctx_release(ctx->m2m_ctx);
>         mtk_vcodec_enc_release(ctx);
>         v4l2_fh_del(&ctx->fh);
>         v4l2_fh_exit(&ctx->fh);
>         v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> -       v4l2_m2m_ctx_release(ctx->m2m_ctx);
>
>         list_del_init(&ctx->list);
>         kfree(ctx);
> --
> 2.17.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
