Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B840C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jun 2023 18:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMce3Jy4xVvIgBoxTrKuWPOih2+aU/EBFPj3X3f8Uyo=; b=4Zxu3FfAvd9XpIEI1GZeGlEaDZ
	fIdkmemvTed6Vm+/pHOvrqZozHp4hG7/Ymq6p9Eg6gcbBlygO7k/GRRFWgUP8svlI3s1Eg+y7Cid3
	xip2Y8vpE6DLrVBydxumOKb4PRQKlP7LgeSoKmWjAFcVmKrgHd5ck7GKQE+VvcH1LKXpqaYFgiZ6M
	yJMfiiykLr8xks9eDUI/Rg5JpAQclXoVk6E+mW3Ih6+jqh8Rbakue0JGvEIRDMn8uiE9iPrYUhoBa
	b3VdFO8JYyRRgvtbSfZLU04Z4ea2yMkCjKE5y/KoAP5Y5f0MdNQI8MRu1ptwGit/gYINjHVBCaZRU
	YtSYsYDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEwP8-001lVF-2l;
	Thu, 29 Jun 2023 18:30:06 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEwP4-001lSf-2v
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jun 2023 18:30:05 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1b0138963ffso870305fac.0
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Jun 2023 11:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688063397; x=1690655397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMce3Jy4xVvIgBoxTrKuWPOih2+aU/EBFPj3X3f8Uyo=;
        b=fQmQ9jJilIF7fBOW5+q8Lx+VA5QmUQH9lXv9bAwKahNpl6VmSxqpHKYy5j7haKOfsB
         BkXNHcWbHAOUVbfKiTauDRFFtphnpJ0J8No2v75ZFCoxkOo/ytFKgMwXit2jXiWAv3dQ
         bQ/MUMhazkN+ou19hlMgtc4faYhLmBgq3H/TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688063397; x=1690655397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMce3Jy4xVvIgBoxTrKuWPOih2+aU/EBFPj3X3f8Uyo=;
        b=lAHtBLAsWO0f9lAt7LQcM5kAj5lJmAHz4GDbrKxS2EczVl0zRFeg7Qi6F/FzxNYoEh
         04/TUXYsWMkqsFlGD+5+1xgTwDK/ULzMwC8/uUAutNyOtokBOGMVS5SfJYVFOpgv+NoT
         qYEcL1y3lHvzb3fJpgMt1hgHXv2RhCRTydoLz2cbbmKRsz4m8lbWsw78bywinlcyeXy7
         ngRvAhWhMvWcrh48Uvlk0YoUnAI8IvF9yPIJ2oDEHCyw8Dlolv/M/z7ZEGM8ki1u6DL0
         pey8/gvsy2XdP+oTNkIDKwsx4uXSr4bDboozEvlo6q9p0uc+zLErlUJl6jF9UAJlw3UG
         sErA==
X-Gm-Message-State: ABy/qLZJTTjUOwQycOpO8gFaWuEuxiRMCb9WZCo5xwaLwmti4WVWoGFT
	xfai6YuneZbmofkb3PZo3UOCuQHm7r+LcuxTgcqe6Q==
X-Google-Smtp-Source: APBJJlEyflTavRKPQvsfHchpy2cYqQQQqwz00jniVmN27VH12QSE9xUvlnjcDsBs/GkjSws1HwHR9A==
X-Received: by 2002:a05:6870:96a0:b0:19f:9495:95ff with SMTP id o32-20020a05687096a000b0019f949595ffmr784022oaq.27.1688063397193;
        Thu, 29 Jun 2023 11:29:57 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com. [209.85.167.171])
        by smtp.gmail.com with ESMTPSA id gp4-20020a0568701fc400b001aa25cad017sm7944308oac.55.2023.06.29.11.29.55
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 11:29:56 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3a1c162cdfeso700550b6e.2
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Jun 2023 11:29:55 -0700 (PDT)
X-Received: by 2002:a05:6808:128f:b0:39c:59e2:dd79 with SMTP id
 a15-20020a056808128f00b0039c59e2dd79mr268860oiw.36.1688063395004; Thu, 29 Jun
 2023 11:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-mtk-usb-v1-1-3c5b2ea3d6b9@chromium.org> <0efd9388-4cbc-d27c-f82f-d14291580150@arm.com>
In-Reply-To: <0efd9388-4cbc-d27c-f82f-d14291580150@arm.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 29 Jun 2023 20:29:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCvvtdtS2E1a5qyOERG=DKzcTX2oLGWSecRz2gCi-Oo1tw@mail.gmail.com>
Message-ID: <CANiDSCvvtdtS2E1a5qyOERG=DKzcTX2oLGWSecRz2gCi-Oo1tw@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci-mtk: set the dma max_seg_size
To: Robin Murphy <robin.murphy@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_113002_979243_08688762 
X-CRM114-Status: GOOD (  23.64  )
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

Hi Robin

On Thu, 29 Jun 2023 at 20:11, Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2023-06-28 22:00, Ricardo Ribalda wrote:
> > Allow devices to have dma operations beyond 64K, and avoid warnings suc=
h
> > as:
>
> Hang on, is this actually correct? I just had a vague memory of XHCI
> having some restrictions, and sure enough according to the spec it
> *does* require buffers to be split at 64KB boundaries, since that's the
> maximum length a single TRB can encode - that's exactly the kind of
> constraint that the max_seg_size abstraction is intended to represent,
> so it seems a bit odd to be explicitly claiming a very different value.
>
> Thanks,
> Robin.

I think we had a similar discussion for  93915a4170e9 ("xhci-pci: set
the dma max_seg_size")
on
https://lore.kernel.org/all/1fe8f8a7-c88f-0c91-e74f-4d3f2f885c89@linux.inte=
l.com/

```
Preferred max segment size of sg list would be 64k as xHC hardware has
64k TRB payload size
limit, but xhci driver will take care of larger segments, splitting
them into 64k chunks.
```

>
> > DMA-API: xhci-mtk 11200000.usb: mapping sg segment longer than device c=
laims to support [len=3D98304] [max=3D65536]
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Fix warnings such as:
> >
> > [  451.089443] ------------[ cut here ]------------
> > [  451.089498] DMA-API: xhci-mtk 11200000.usb: mapping sg segment longe=
r than device claims to support [len=3D98304] [max=3D65536]
> > [  451.089617] WARNING: CPU: 7 PID: 14227 at kernel/dma/debug.c:1163 de=
bug_dma_map_sg+0x5bc/0x950
> > [  451.089674] Modules linked in: xfrm_interface tun hci_vhci bridge st=
p llc veth xt_cgroup xt_MASQUERADE uinput rfcomm ip6table_nat fuse 8021q al=
gif_hash algif_skcipher af_alg r8153_ecm cdc_ether usbnet r8152 mii mtk_vco=
dec_dec_hw mt7921s mt76_sdio mt7921_common mt76_connac_lib mt76 uvcvideo vi=
deobuf2_vmalloc mtk_vcodec_dec v4l2_h264 mtk_vcodec_enc mtk_jpeg v4l2_vp9 v=
ideobuf2_dma_contig videobuf2_memops v4l2_mem2mem videobuf2_v4l2 btmtksdio =
videobuf2_common mtk_vcodec_common btmtk mac80211 snd_sof_mt8186 snd_sof_xt=
ensa_dsp snd_sof_of snd_sof snd_sof_utils mtk_scp mtk_rpmsg rpmsg_core mtk_=
scp_ipi hid_rmi rmi_core serio bluetooth ecdh_generic ecc cfg80211 lzo_rle =
lzo_compress zram joydev
> > [  451.090285] CPU: 7 PID: 14227 Comm: syz-executor.0 Not tainted 5.15.=
118-lockdep-19753-g1b0a8b16661d #1 cd3ddfc5e13dbbbea438d3161fcad4d98ec474f4
> > [  451.090333] Hardware name: Google Rusty sku196608/196609/196610/1966=
11 board (DT)
> > [  451.090356] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [  451.090401] pc : debug_dma_map_sg+0x5bc/0x950
> > [  451.090433] lr : debug_dma_map_sg+0x5bc/0x950
> > [  451.090462] sp : ffffffc01fdd75e0
> > [  451.090479] x29: ffffffc01fdd7640 x28: ffffff80c1280300 x27: 0000000=
000010000
> > [  451.090531] x26: ffffff80c1ec9600 x25: 1ffffff01a749501 x24: ffffff8=
0d3a4a800
> > [  451.090581] x23: dfffffc000000000 x22: ffffff80d3a4a80c x21: ffffffc=
00aae5740
> > [  451.090631] x20: ffffffffffffffff x19: ffffff80d3a4a810 x18: 0000000=
000000000
> > [  451.090680] x17: 64206e6168742072 x16: 65676e6f6c20746e x15: 656d676=
573206773
> > [  451.090731] x14: 20676e697070616d x13: 0000000000000001 x12: 0000000=
000000001
> > [  451.090779] x11: 0000000000000000 x10: 0000000000040000 x9 : 3c6fd66=
e79e32400
> > [  451.090828] x8 : 3c6fd66e79e32400 x7 : 0000000000000001 x6 : 0000000=
000000001
> > [  451.090877] x5 : ffffffc01fdd7158 x4 : ffffffc00b64e2a0 x3 : ffffffc=
008f92adc
> > [  451.090926] x2 : 0000000100000000 x1 : ffffff8057afd940 x0 : 0000000=
00000006f
> > [  451.090976] Call trace:
> > [  451.090994]  debug_dma_map_sg+0x5bc/0x950
> > [  451.091026]  dma_alloc_noncontiguous+0x2f4/0x404
> > [  451.091060]  uvc_alloc_urb_buffers+0x1e8/0x600 [uvcvideo 1a151fdc876=
854366480a9c6b7aaa4b7999fb493]
> > [  451.091150]  uvc_video_start_transfer+0xaf4/0x1628 [uvcvideo 1a151fd=
c876854366480a9c6b7aaa4b7999fb493]
> > [  451.091228]  uvc_video_start_streaming+0x154/0x2d8 [uvcvideo 1a151fd=
c876854366480a9c6b7aaa4b7999fb493]
> > [  451.091305]  uvc_start_streaming+0x20c/0x3d4 [uvcvideo 1a151fdc87685=
4366480a9c6b7aaa4b7999fb493]
> > [  451.091379]  vb2_start_streaming+0x118/0x400 [videobuf2_common 252dc=
8c49960dcb8e329e2787100c89e1899c17f]
> > [  451.091446]  vb2_core_streamon+0x258/0x360 [videobuf2_common 252dc8c=
49960dcb8e329e2787100c89e1899c17f]
> > [  451.091507]  vb2_streamon+0x88/0xbc [videobuf2_v4l2 f4acca89bfe3410c=
d8f3ca536255fc3877fe63db]
> > [  451.091555]  uvc_queue_streamon+0x44/0x68 [uvcvideo 1a151fdc87685436=
6480a9c6b7aaa4b7999fb493]
> > [  451.091631]  uvc_ioctl_streamon+0xd8/0x124 [uvcvideo 1a151fdc8768543=
66480a9c6b7aaa4b7999fb493]
> > [  451.091705]  v4l_streamon+0x74/0xa8
> > [  451.091738]  __video_do_ioctl+0x90c/0xa40
> > [  451.091769]  video_usercopy+0xa44/0x1ef8
> > [  451.091799]  video_ioctl2+0x44/0x58
> > [  451.091830]  v4l2_ioctl+0x138/0x164
> > [  451.091860]  __arm64_sys_ioctl+0x154/0x1d0
> > [  451.091892]  invoke_syscall+0x98/0x278
> > [  451.091923]  el0_svc_common+0x214/0x274
> > [  451.091953]  do_el0_svc+0x9c/0x19c
> > [  451.091982]  el0_svc+0x5c/0xc0
> > [  451.092013]  el0t_64_sync_handler+0x78/0x108
> > [  451.092045]  el0t_64_sync+0x1a4/0x1a8
> > [  451.092081] Kernel panic - not syncing: kernel: panic_on_warn set ..=
.
> > [  451.092103] CPU: 7 PID: 14227 Comm: syz-executor.0 Not tainted 5.15.=
118-lockdep-19753-g1b0a8b16661d #1 cd3ddfc5e13dbbbea438d3161fcad4d98ec474f4
> > [  451.092148] Hardware name: Google Rusty sku196608/196609/196610/1966=
11 board (DT)
> > [  451.092171] Call trace:
> > [  451.092186]  dump_backtrace+0x0/0x4e8
> > [  451.092219]  show_stack+0x34/0x44
> > [  451.092247]  dump_stack_lvl+0xdc/0x11c
> > [  451.092278]  dump_stack+0x1c/0x48
> > [  451.092307]  panic+0x2a4/0x7b8
> > [  451.092335]  check_panic_on_warn+0xb8/0x104
> > [  451.092369]  __warn+0x16c/0x230
> > [  451.092399]  report_bug+0x160/0x280
> > [  451.092432]  bug_handler+0x48/0xb8
> > [  451.092466]  call_break_hook+0x180/0x1b4
> > [  451.092498]  brk_handler+0x30/0xbc
> > [  451.092529]  do_debug_exception+0x16c/0x31c
> > [  451.092563]  el1_dbg+0x64/0x80
> > [  451.092592]  el1h_64_sync_handler+0x70/0xb4
> > [  451.092624]  el1h_64_sync+0x7c/0x80
> > [  451.092653]  debug_dma_map_sg+0x5bc/0x950
> > [  451.092685]  dma_alloc_noncontiguous+0x2f4/0x404
> > [  451.092717]  uvc_alloc_urb_buffers+0x1e8/0x600 [uvcvideo 1a151fdc876=
854366480a9c6b7aaa4b7999fb493]
> > [  451.092794]  uvc_video_start_transfer+0xaf4/0x1628 [uvcvideo 1a151fd=
c876854366480a9c6b7aaa4b7999fb493]
> > [  451.092868]  uvc_video_start_streaming+0x154/0x2d8 [uvcvideo 1a151fd=
c876854366480a9c6b7aaa4b7999fb493]
> > [  451.092942]  uvc_start_streaming+0x20c/0x3d4 [uvcvideo 1a151fdc87685=
4366480a9c6b7aaa4b7999fb493]
> > [  451.093015]  vb2_start_streaming+0x118/0x400 [videobuf2_common 252dc=
8c49960dcb8e329e2787100c89e1899c17f]
> > [  451.093079]  vb2_core_streamon+0x258/0x360 [videobuf2_common 252dc8c=
49960dcb8e329e2787100c89e1899c17f]
> > [  451.093139]  vb2_streamon+0x88/0xbc [videobuf2_v4l2 f4acca89bfe3410c=
d8f3ca536255fc3877fe63db]
> > [  451.093187]  uvc_queue_streamon+0x44/0x68 [uvcvideo 1a151fdc87685436=
6480a9c6b7aaa4b7999fb493]
> > [  451.093261]  uvc_ioctl_streamon+0xd8/0x124 [uvcvideo 1a151fdc8768543=
66480a9c6b7aaa4b7999fb493]
> > [  451.093334]  v4l_streamon+0x74/0xa8
> > [  451.093366]  __video_do_ioctl+0x90c/0xa40
> > [  451.093398]  video_usercopy+0xa44/0x1ef8
> > [  451.093428]  video_ioctl2+0x44/0x58
> > [  451.093457]  v4l2_ioctl+0x138/0x164
> > [  451.093487]  __arm64_sys_ioctl+0x154/0x1d0
> > [  451.093518]  invoke_syscall+0x98/0x278
> > [  451.093548]  el0_svc_common+0x214/0x274
> > [  451.093578]  do_el0_svc+0x9c/0x19c
> > [  451.093607]  el0_svc+0x5c/0xc0
> > [  451.093637]  el0t_64_sync_handler+0x78/0x108
> > [  451.093669]  el0t_64_sync+0x1a4/0x1a8
> > [  451.093701] SMP: stopping secondary CPUs
> > [  451.093777] Kernel Offset: disabled
> > [  451.093797] CPU features: 0xc00181c1,a3300e42
> > [  451.093822] Memory Limit: none
> >
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@chromium.org>
> > ---
> >   drivers/usb/host/xhci-mtk.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > index 90cf40d6d0c3..605b1e1a5098 100644
> > --- a/drivers/usb/host/xhci-mtk.c
> > +++ b/drivers/usb/host/xhci-mtk.c
> > @@ -643,6 +643,8 @@ static int xhci_mtk_probe(struct platform_device *p=
dev)
> >       pm_runtime_put_autosuspend(dev);
> >       pm_runtime_forbid(dev);
> >
> > +     dma_set_max_seg_size(dev, UINT_MAX);
> > +
> >       return 0;
> >
> >   dealloc_usb3_hcd:
> >
> > ---
> > base-commit: 1b2c92a1cb2469d8c0079dbf496ab86e22e1cb7c
> > change-id: 20230628-mtk-usb-bf0059f64bd7
> >
> > Best regards,



--=20
Ricardo Ribalda

