Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB30EB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 21:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IsWTxHedmoku42qDv7PVi9DEQQIzmo+NZkEk7SkyjQg=; b=ke1EYGM1hRVu+I+gIoWcsnDAj3
	Le0aeWCIgoLUAhgma7P4kO4Gdz8KEo5nfW9IA9BmC2hsvTH5TYid6pANHvQ0xObYtnzYo0snnbGVb
	geAair4VRKYReIymy95Hs7qiDAQoNtZK/cAbjImg1c7f9s8uu6aZV/oKXzgn+x2+LB/AsmuE00RTR
	DT9wIZt1mJdUVROwI91hpSxIF+SwZTkX38X3GIze2grdklYOhI0TXXOkdBOl8tsDMBh5pRB3rQOD3
	L/DbBFNfu8YHM2Uhp8MMmL2CnKMiscp5NXKPhSNHO1N+tWz9brbembaCpzKrrsRQj4CJ5YimSZe/N
	9YPtz5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEcLF-00GidT-2W;
	Wed, 28 Jun 2023 21:04:45 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEcLC-00Gibk-1f
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 21:04:44 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6b13e2af122so91928a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Jun 2023 14:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687986276; x=1690578276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsWTxHedmoku42qDv7PVi9DEQQIzmo+NZkEk7SkyjQg=;
        b=W6fNm4cBHxITfzUVWluefWRpKwsvOxuRKNKA8bwDoIEs2qUnsRgpXfySIuMDE7/D5H
         7gBcJvi1YC2hv7aJk0IZczBfb4lG0x9fs8jrmC2FuZRJJ6Gak0N4yeMobtuNaqXhleiZ
         vwwNx34KMuyn72W5EpUSJeXjEDARF+Bst568g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687986276; x=1690578276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IsWTxHedmoku42qDv7PVi9DEQQIzmo+NZkEk7SkyjQg=;
        b=I23qwuBsbTbTZJc5uEsoWPjPX1OWV2OAhKf7g7irOcdNQ/RNiwJ9wwGyq17thSF0Ju
         Q+cOiqBrQfw3gCVJsk8941jKaJWSKStddUPkboAaoL7Fx45/k+GNt6joMHvpXN90aw6j
         SYeBneMKUXZni/vK5A39UpCI+V7f/BpUH2FLFxZZNPJCWSaRL2IGJ+RgZ5XedZddzgkY
         wSpaeHK9YQM8e9YZPy1icPfFZaA43fR5nArODWnTo4JtCBCF+/vQ+mEklrCuD7ObtKAZ
         73OHx1y0ioeEeGlOBKI/yT/la/Ey0N819ziIjBUeME9J7IVTMuW+YyzpQ24UVarL4CtP
         a5gA==
X-Gm-Message-State: AC+VfDzCjUJcbc6MdFoAYTp31LCfVZDdgeLGOKIdB8kwon2MEBa0+jHl
	rzkhx+TrTbbnyne1dV0xa9b0h14ceOp6jfuZvqGqY44S
X-Google-Smtp-Source: ACHHUZ7T5xB94mj8IWHrCuRV3/adAIBR5bmveqqp+k3IfRSsuYzEgb26A4IK8cz8w4ABI4yvdKHoeQ==
X-Received: by 2002:a05:6870:4c1:b0:1b0:58e9:6521 with SMTP id u1-20020a05687004c100b001b058e96521mr5422544oam.46.1687986275916;
        Wed, 28 Jun 2023 14:04:35 -0700 (PDT)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id n16-20020a0cfbd0000000b00635f3cf3b5dsm2081942qvp.29.2023.06.28.14.04.34
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 14:04:35 -0700 (PDT)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-635de03a85bso612016d6.3
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Jun 2023 14:04:34 -0700 (PDT)
X-Received: by 2002:a05:6214:c8a:b0:632:c2e:57ae with SMTP id
 r10-20020a0562140c8a00b006320c2e57aemr23045114qvr.54.1687986274228; Wed, 28
 Jun 2023 14:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-mtk-usb-v1-1-3c5b2ea3d6b9@chromium.org>
In-Reply-To: <20230628-mtk-usb-v1-1-3c5b2ea3d6b9@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 28 Jun 2023 23:04:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCsAgD33gMk9-CTGHuUv_b4KfRnO02ETEt6jFtQvw+6cag@mail.gmail.com>
Message-ID: <CANiDSCsAgD33gMk9-CTGHuUv_b4KfRnO02ETEt6jFtQvw+6cag@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci-mtk: set the dma max_seg_size
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Zubin Mithra <zsm@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_140442_553632_7754444A 
X-CRM114-Status: GOOD (  17.59  )
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

On Wed, 28 Jun 2023 at 23:00, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Allow devices to have dma operations beyond 64K, and avoid warnings such
> as:
>
> DMA-API: xhci-mtk 11200000.usb: mapping sg segment longer than device cla=
ims to support [len=3D98304] [max=3D65536]
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Reported-by: Zubin Mithra <zsm@chromium.org>
> ---
> Fix warnings such as:
>
> [  451.089443] ------------[ cut here ]------------
> [  451.089498] DMA-API: xhci-mtk 11200000.usb: mapping sg segment longer =
than device claims to support [len=3D98304] [max=3D65536]
> [  451.089617] WARNING: CPU: 7 PID: 14227 at kernel/dma/debug.c:1163 debu=
g_dma_map_sg+0x5bc/0x950
> [  451.089674] Modules linked in: xfrm_interface tun hci_vhci bridge stp =
llc veth xt_cgroup xt_MASQUERADE uinput rfcomm ip6table_nat fuse 8021q algi=
f_hash algif_skcipher af_alg r8153_ecm cdc_ether usbnet r8152 mii mtk_vcode=
c_dec_hw mt7921s mt76_sdio mt7921_common mt76_connac_lib mt76 uvcvideo vide=
obuf2_vmalloc mtk_vcodec_dec v4l2_h264 mtk_vcodec_enc mtk_jpeg v4l2_vp9 vid=
eobuf2_dma_contig videobuf2_memops v4l2_mem2mem videobuf2_v4l2 btmtksdio vi=
deobuf2_common mtk_vcodec_common btmtk mac80211 snd_sof_mt8186 snd_sof_xten=
sa_dsp snd_sof_of snd_sof snd_sof_utils mtk_scp mtk_rpmsg rpmsg_core mtk_sc=
p_ipi hid_rmi rmi_core serio bluetooth ecdh_generic ecc cfg80211 lzo_rle lz=
o_compress zram joydev
> [  451.090285] CPU: 7 PID: 14227 Comm: syz-executor.0 Not tainted 5.15.11=
8-lockdep-19753-g1b0a8b16661d #1 cd3ddfc5e13dbbbea438d3161fcad4d98ec474f4
> [  451.090333] Hardware name: Google Rusty sku196608/196609/196610/196611=
 board (DT)
> [  451.090356] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYP=
E=3D--)
> [  451.090401] pc : debug_dma_map_sg+0x5bc/0x950
> [  451.090433] lr : debug_dma_map_sg+0x5bc/0x950
> [  451.090462] sp : ffffffc01fdd75e0
> [  451.090479] x29: ffffffc01fdd7640 x28: ffffff80c1280300 x27: 000000000=
0010000
> [  451.090531] x26: ffffff80c1ec9600 x25: 1ffffff01a749501 x24: ffffff80d=
3a4a800
> [  451.090581] x23: dfffffc000000000 x22: ffffff80d3a4a80c x21: ffffffc00=
aae5740
> [  451.090631] x20: ffffffffffffffff x19: ffffff80d3a4a810 x18: 000000000=
0000000
> [  451.090680] x17: 64206e6168742072 x16: 65676e6f6c20746e x15: 656d67657=
3206773
> [  451.090731] x14: 20676e697070616d x13: 0000000000000001 x12: 000000000=
0000001
> [  451.090779] x11: 0000000000000000 x10: 0000000000040000 x9 : 3c6fd66e7=
9e32400
> [  451.090828] x8 : 3c6fd66e79e32400 x7 : 0000000000000001 x6 : 000000000=
0000001
> [  451.090877] x5 : ffffffc01fdd7158 x4 : ffffffc00b64e2a0 x3 : ffffffc00=
8f92adc
> [  451.090926] x2 : 0000000100000000 x1 : ffffff8057afd940 x0 : 000000000=
000006f
> [  451.090976] Call trace:
> [  451.090994]  debug_dma_map_sg+0x5bc/0x950
> [  451.091026]  dma_alloc_noncontiguous+0x2f4/0x404
> [  451.091060]  uvc_alloc_urb_buffers+0x1e8/0x600 [uvcvideo 1a151fdc87685=
4366480a9c6b7aaa4b7999fb493]
> [  451.091150]  uvc_video_start_transfer+0xaf4/0x1628 [uvcvideo 1a151fdc8=
76854366480a9c6b7aaa4b7999fb493]
> [  451.091228]  uvc_video_start_streaming+0x154/0x2d8 [uvcvideo 1a151fdc8=
76854366480a9c6b7aaa4b7999fb493]
> [  451.091305]  uvc_start_streaming+0x20c/0x3d4 [uvcvideo 1a151fdc8768543=
66480a9c6b7aaa4b7999fb493]
> [  451.091379]  vb2_start_streaming+0x118/0x400 [videobuf2_common 252dc8c=
49960dcb8e329e2787100c89e1899c17f]
> [  451.091446]  vb2_core_streamon+0x258/0x360 [videobuf2_common 252dc8c49=
960dcb8e329e2787100c89e1899c17f]
> [  451.091507]  vb2_streamon+0x88/0xbc [videobuf2_v4l2 f4acca89bfe3410cd8=
f3ca536255fc3877fe63db]
> [  451.091555]  uvc_queue_streamon+0x44/0x68 [uvcvideo 1a151fdc8768543664=
80a9c6b7aaa4b7999fb493]
> [  451.091631]  uvc_ioctl_streamon+0xd8/0x124 [uvcvideo 1a151fdc876854366=
480a9c6b7aaa4b7999fb493]
> [  451.091705]  v4l_streamon+0x74/0xa8
> [  451.091738]  __video_do_ioctl+0x90c/0xa40
> [  451.091769]  video_usercopy+0xa44/0x1ef8
> [  451.091799]  video_ioctl2+0x44/0x58
> [  451.091830]  v4l2_ioctl+0x138/0x164
> [  451.091860]  __arm64_sys_ioctl+0x154/0x1d0
> [  451.091892]  invoke_syscall+0x98/0x278
> [  451.091923]  el0_svc_common+0x214/0x274
> [  451.091953]  do_el0_svc+0x9c/0x19c
> [  451.091982]  el0_svc+0x5c/0xc0
> [  451.092013]  el0t_64_sync_handler+0x78/0x108
> [  451.092045]  el0t_64_sync+0x1a4/0x1a8
> [  451.092081] Kernel panic - not syncing: kernel: panic_on_warn set ...
> [  451.092103] CPU: 7 PID: 14227 Comm: syz-executor.0 Not tainted 5.15.11=
8-lockdep-19753-g1b0a8b16661d #1 cd3ddfc5e13dbbbea438d3161fcad4d98ec474f4
> [  451.092148] Hardware name: Google Rusty sku196608/196609/196610/196611=
 board (DT)
> [  451.092171] Call trace:
> [  451.092186]  dump_backtrace+0x0/0x4e8
> [  451.092219]  show_stack+0x34/0x44
> [  451.092247]  dump_stack_lvl+0xdc/0x11c
> [  451.092278]  dump_stack+0x1c/0x48
> [  451.092307]  panic+0x2a4/0x7b8
> [  451.092335]  check_panic_on_warn+0xb8/0x104
> [  451.092369]  __warn+0x16c/0x230
> [  451.092399]  report_bug+0x160/0x280
> [  451.092432]  bug_handler+0x48/0xb8
> [  451.092466]  call_break_hook+0x180/0x1b4
> [  451.092498]  brk_handler+0x30/0xbc
> [  451.092529]  do_debug_exception+0x16c/0x31c
> [  451.092563]  el1_dbg+0x64/0x80
> [  451.092592]  el1h_64_sync_handler+0x70/0xb4
> [  451.092624]  el1h_64_sync+0x7c/0x80
> [  451.092653]  debug_dma_map_sg+0x5bc/0x950
> [  451.092685]  dma_alloc_noncontiguous+0x2f4/0x404
> [  451.092717]  uvc_alloc_urb_buffers+0x1e8/0x600 [uvcvideo 1a151fdc87685=
4366480a9c6b7aaa4b7999fb493]
> [  451.092794]  uvc_video_start_transfer+0xaf4/0x1628 [uvcvideo 1a151fdc8=
76854366480a9c6b7aaa4b7999fb493]
> [  451.092868]  uvc_video_start_streaming+0x154/0x2d8 [uvcvideo 1a151fdc8=
76854366480a9c6b7aaa4b7999fb493]
> [  451.092942]  uvc_start_streaming+0x20c/0x3d4 [uvcvideo 1a151fdc8768543=
66480a9c6b7aaa4b7999fb493]
> [  451.093015]  vb2_start_streaming+0x118/0x400 [videobuf2_common 252dc8c=
49960dcb8e329e2787100c89e1899c17f]
> [  451.093079]  vb2_core_streamon+0x258/0x360 [videobuf2_common 252dc8c49=
960dcb8e329e2787100c89e1899c17f]
> [  451.093139]  vb2_streamon+0x88/0xbc [videobuf2_v4l2 f4acca89bfe3410cd8=
f3ca536255fc3877fe63db]
> [  451.093187]  uvc_queue_streamon+0x44/0x68 [uvcvideo 1a151fdc8768543664=
80a9c6b7aaa4b7999fb493]
> [  451.093261]  uvc_ioctl_streamon+0xd8/0x124 [uvcvideo 1a151fdc876854366=
480a9c6b7aaa4b7999fb493]
> [  451.093334]  v4l_streamon+0x74/0xa8
> [  451.093366]  __video_do_ioctl+0x90c/0xa40
> [  451.093398]  video_usercopy+0xa44/0x1ef8
> [  451.093428]  video_ioctl2+0x44/0x58
> [  451.093457]  v4l2_ioctl+0x138/0x164
> [  451.093487]  __arm64_sys_ioctl+0x154/0x1d0
> [  451.093518]  invoke_syscall+0x98/0x278
> [  451.093548]  el0_svc_common+0x214/0x274
> [  451.093578]  do_el0_svc+0x9c/0x19c
> [  451.093607]  el0_svc+0x5c/0xc0
> [  451.093637]  el0t_64_sync_handler+0x78/0x108
> [  451.093669]  el0t_64_sync+0x1a4/0x1a8
> [  451.093701] SMP: stopping secondary CPUs
> [  451.093777] Kernel Offset: disabled
> [  451.093797] CPU features: 0xc00181c1,a3300e42
> [  451.093822] Memory Limit: none
>
> Signed-off-by: Ricardo Ribalda Delgado <ribalda@chromium.org>
> ---
>  drivers/usb/host/xhci-mtk.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 90cf40d6d0c3..605b1e1a5098 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -643,6 +643,8 @@ static int xhci_mtk_probe(struct platform_device *pde=
v)
>         pm_runtime_put_autosuspend(dev);
>         pm_runtime_forbid(dev);
>
> +       dma_set_max_seg_size(dev, UINT_MAX);
> +
>         return 0;
>
>  dealloc_usb3_hcd:
>
> ---
> base-commit: 1b2c92a1cb2469d8c0079dbf496ab86e22e1cb7c
> change-id: 20230628-mtk-usb-bf0059f64bd7
>
> Best regards,
> --
> Ricardo Ribalda Delgado <ribalda@chromium.org>
>


--=20
Ricardo Ribalda

