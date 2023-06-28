Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DEEEB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 21:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMCDZr6HetNRAiK1pgK7g/hOwujWXpvO6fjIUPit99g=; b=YI+PvSU5WemgVxzp2CvzW34jhP
	0YjMEC0JEEfCGZK+wgeh4YWW7rK4vbKnZBPcAYlmSxJAbp0lyEA0iOoosVBQJUX96aC8BInCPa2Ae
	PSCzCHMF0987Rsq+U/ocBtG1BVKVOaEFXHeQzldKSELtCxZKiV0jLo3WdotfcS5yECpqRbxQceT0m
	30Bd94mmarZFJ1VC67KLI/gyPxTy5w5awz/Wd6ix+x8VmR9RZJtgCnePZHAzxxHacquGy2UAHxULq
	mnw+kWJSXTaEtVHpKDOavjhaYvqqZfKkFU8o0vWWd25hGIuB+xzCOp1w8YHi3OgaOD17vKUON3Xjc
	+uyXfAdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEdAN-00GqDx-2H;
	Wed, 28 Jun 2023 21:57:35 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEdAJ-00GqCh-06
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 21:57:32 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b80ba9326bso226875ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Jun 2023 14:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687989446; x=1690581446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rMCDZr6HetNRAiK1pgK7g/hOwujWXpvO6fjIUPit99g=;
        b=HJJDeEq20AhXZ40y/OOutRmvibWYtoceCT0+y2flySd1LH9GIcPrAAz3HxwwHgNP+/
         OqTAAY0rsdBeJRvTdCcpeVAR6ImjWCrWCcZfMzKKaM7HWfkz02XUH8wAS4JRaw9+5DP7
         IygD6WJDUst/ZN1beRlk/OiDHDXfRpOK/vm5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687989446; x=1690581446;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMCDZr6HetNRAiK1pgK7g/hOwujWXpvO6fjIUPit99g=;
        b=GqeL7iI6nYV2X2tphVj4BNGH+p3+udLtH9T+RvIoCWjSu7EeBX7RUzZ0keE+gV0UVL
         +nU3MlQxXsCwD4ym236GmTt4TzVXdR/1HCwS6AAnNtWIC8uT4LN9TffgMADvWl0GYTdM
         CULkSW3to+LkGS1N1QBpA0KoM/hdh8RffkqcICWa/Yh/lO4ENRrTeCNAKtkURYs0YwfL
         AP80NU1zMsEnOfaOXitLPo/wCjr1GCVoYJmIhsJnOhzgR0xGPvRosjBxgOkwMSCM3Ztc
         Jn4J2/jWgl5rc9VN7PmG8Uwf4/lhK8J5t6nfV8MlbQeEpM/1ZolbwI90GOLYVfWTsNZZ
         GCJA==
X-Gm-Message-State: AC+VfDz4MAjpKH0FG+MNkszBIuiSMVrZf6gtEKIUdu5hHI8hxLt/xfiz
	U91+I6hqW9ZFgKRTRyDhnyUV4A==
X-Google-Smtp-Source: ACHHUZ5EEoJwdDJ4fzQ0s1sCxwlLY3/INeVGhx6FlYcL5ukUjVu9cyhlRpdqThOkv8NC1NlMrkvYAg==
X-Received: by 2002:a17:902:a98c:b0:1b7:fe1b:862c with SMTP id bh12-20020a170902a98c00b001b7fe1b862cmr9910814plb.62.1687989445820;
        Wed, 28 Jun 2023 14:57:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:427c:5f70:c590:6af])
        by smtp.googlemail.com with ESMTPSA id q9-20020a17090311c900b001ae59169f05sm8124856plh.182.2023.06.28.14.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 14:57:25 -0700 (PDT)
Date: Wed, 28 Jun 2023 14:57:11 -0700
From: Zubin Mithra <zsm@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci-mtk: set the dma max_seg_size
Message-ID: <ZJystxdl0jVoe5b6@google.com>
References: <20230628-mtk-usb-v1-1-3c5b2ea3d6b9@chromium.org>
 <CANiDSCsAgD33gMk9-CTGHuUv_b4KfRnO02ETEt6jFtQvw+6cag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCsAgD33gMk9-CTGHuUv_b4KfRnO02ETEt6jFtQvw+6cag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_145731_072642_1A0799DE 
X-CRM114-Status: GOOD (  20.92  )
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

On Wed, Jun 28, 2023 at 11:04:20PM +0200, Ricardo Ribalda wrote:
> On Wed, 28 Jun 2023 at 23:00, Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > Allow devices to have dma operations beyond 64K, and avoid warnings such
> > as:
> >
> > DMA-API: xhci-mtk 11200000.usb: mapping sg segment longer than device claims to support [len=98304] [max=65536]
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> Reported-by: Zubin Mithra <zsm@chromium.org>

Should this be cc'd to stable@ as well?

Tested-by: Zubin Mithra <zsm@chromium.org>

> > ---
> > Fix warnings such as:
> >
> > [  451.089443] ------------[ cut here ]------------
> > [  451.089498] DMA-API: xhci-mtk 11200000.usb: mapping sg segment longer than device claims to support [len=98304] [max=65536]
> > [  451.089617] WARNING: CPU: 7 PID: 14227 at kernel/dma/debug.c:1163 debug_dma_map_sg+0x5bc/0x950
> > [  451.089674] Modules linked in: xfrm_interface tun hci_vhci bridge stp llc veth xt_cgroup xt_MASQUERADE uinput rfcomm ip6table_nat fuse 8021q algif_hash algif_skcipher af_alg r8153_ecm cdc_ether usbnet r8152 mii mtk_vcodec_dec_hw mt7921s mt76_sdio mt7921_common mt76_connac_lib mt76 uvcvideo videobuf2_vmalloc mtk_vcodec_dec v4l2_h264 mtk_vcodec_enc mtk_jpeg v4l2_vp9 videobuf2_dma_contig videobuf2_memops v4l2_mem2mem videobuf2_v4l2 btmtksdio videobuf2_common mtk_vcodec_common btmtk mac80211 snd_sof_mt8186 snd_sof_xtensa_dsp snd_sof_of snd_sof snd_sof_utils mtk_scp mtk_rpmsg rpmsg_core mtk_scp_ipi hid_rmi rmi_core serio bluetooth ecdh_generic ecc cfg80211 lzo_rle lzo_compress zram joydev
> > [  451.090285] CPU: 7 PID: 14227 Comm: syz-executor.0 Not tainted 5.15.118-lockdep-19753-g1b0a8b16661d #1 cd3ddfc5e13dbbbea438d3161fcad4d98ec474f4
> > [  451.090333] Hardware name: Google Rusty sku196608/196609/196610/196611 board (DT)
> > [  451.090356] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [  451.090401] pc : debug_dma_map_sg+0x5bc/0x950
> > [  451.090433] lr : debug_dma_map_sg+0x5bc/0x950
> > [  451.090462] sp : ffffffc01fdd75e0
> > [  451.090479] x29: ffffffc01fdd7640 x28: ffffff80c1280300 x27: 0000000000010000
> > [  451.090531] x26: ffffff80c1ec9600 x25: 1ffffff01a749501 x24: ffffff80d3a4a800
> > [  451.090581] x23: dfffffc000000000 x22: ffffff80d3a4a80c x21: ffffffc00aae5740
> > [  451.090631] x20: ffffffffffffffff x19: ffffff80d3a4a810 x18: 0000000000000000
> > [  451.090680] x17: 64206e6168742072 x16: 65676e6f6c20746e x15: 656d676573206773
> > [  451.090731] x14: 20676e697070616d x13: 0000000000000001 x12: 0000000000000001
> > [  451.090779] x11: 0000000000000000 x10: 0000000000040000 x9 : 3c6fd66e79e32400
> > [  451.090828] x8 : 3c6fd66e79e32400 x7 : 0000000000000001 x6 : 0000000000000001
> > [  451.090877] x5 : ffffffc01fdd7158 x4 : ffffffc00b64e2a0 x3 : ffffffc008f92adc
> > [  451.090926] x2 : 0000000100000000 x1 : ffffff8057afd940 x0 : 000000000000006f
> > [  451.090976] Call trace:
> > [  451.090994]  debug_dma_map_sg+0x5bc/0x950
> > [  451.091026]  dma_alloc_noncontiguous+0x2f4/0x404
> > [  451.091060]  uvc_alloc_urb_buffers+0x1e8/0x600 [uvcvideo 1a151fdc876854366480a9c6b7aaa4b7999fb493]
> > [  451.091150]  uvc_video_start_transfer+0xaf4/0x1628 [uvcvideo 1a151fdc876854366480a9c6b7aaa4b7999fb493]
> > [  451.091228]  uvc_video_start_streaming+0x154/0x2d8 [uvcvideo 1a151fdc876854366480a9c6b7aaa4b7999fb493]
> > [  451.091305]  uvc_start_streaming+0x20c/0x3d4 [uvcvideo 1a151fdc876854366480a9c6b7aaa4b7999fb493]
> > [  451.091379]  vb2_start_streaming+0x118/0x400 [videobuf2_common 252dc8c49960dcb8e329e2787100c89e1899c17f]
> > [  451.091446]  vb2_core_streamon+0x258/0x360 [videobuf2_common 252dc8c49960dcb8e329e2787100c89e1899c17f]
> > [  451.091507]  vb2_streamon+0x88/0xbc [videobuf2_v4l2 f4acca89bfe3410cd8f3ca536255fc3877fe63db]
> > [  451.091555]  uvc_queue_streamon+0x44/0x68 [uvcvideo 1a151fdc876854366480a9c6b7aaa4b7999fb493]
> > [  451.091631]  uvc_ioctl_streamon+0xd8/0x124 [uvcvideo 1a151fdc876854366480a9c6b7aaa4b7999fb493]
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
> > [  451.092081] Kernel panic - not syncing: kernel: panic_on_warn set ...
> > [  451.092103] CPU: 7 PID: 14227 Comm: syz-executor.0 Not tainted 5.15.118-lockdep-19753-g1b0a8b16661d #1 cd3ddfc5e13dbbbea438d3161fcad4d98ec474f4
> > [  451.092148] Hardware name: Google Rusty sku196608/196609/196610/196611 board (DT)
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
> > [  451.092717]  uvc_alloc_urb_buffers+0x1e8/0x600 [uvcvideo 1a151fdc876854366480a9c6b7aaa4b7999fb493]
> > [  451.092794]  uvc_video_start_transfer+0xaf4/0x1628 [uvcvideo 1a151fdc876854366480a9c6b7aaa4b7999fb493]
> > [  451.092868]  uvc_video_start_streaming+0x154/0x2d8 [uvcvideo 1a151fdc876854366480a9c6b7aaa4b7999fb493]
> > [  451.092942]  uvc_start_streaming+0x20c/0x3d4 [uvcvideo 1a151fdc876854366480a9c6b7aaa4b7999fb493]
> > [  451.093015]  vb2_start_streaming+0x118/0x400 [videobuf2_common 252dc8c49960dcb8e329e2787100c89e1899c17f]
> > [  451.093079]  vb2_core_streamon+0x258/0x360 [videobuf2_common 252dc8c49960dcb8e329e2787100c89e1899c17f]
> > [  451.093139]  vb2_streamon+0x88/0xbc [videobuf2_v4l2 f4acca89bfe3410cd8f3ca536255fc3877fe63db]
> > [  451.093187]  uvc_queue_streamon+0x44/0x68 [uvcvideo 1a151fdc876854366480a9c6b7aaa4b7999fb493]
> > [  451.093261]  uvc_ioctl_streamon+0xd8/0x124 [uvcvideo 1a151fdc876854366480a9c6b7aaa4b7999fb493]
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
> >  drivers/usb/host/xhci-mtk.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > index 90cf40d6d0c3..605b1e1a5098 100644
> > --- a/drivers/usb/host/xhci-mtk.c
> > +++ b/drivers/usb/host/xhci-mtk.c
> > @@ -643,6 +643,8 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> >         pm_runtime_put_autosuspend(dev);
> >         pm_runtime_forbid(dev);
> >
> > +       dma_set_max_seg_size(dev, UINT_MAX);
> > +
> >         return 0;
> >
> >  dealloc_usb3_hcd:
> >
> > ---
> > base-commit: 1b2c92a1cb2469d8c0079dbf496ab86e22e1cb7c
> > change-id: 20230628-mtk-usb-bf0059f64bd7
> >
> > Best regards,
> > --
> > Ricardo Ribalda Delgado <ribalda@chromium.org>
> >
> 
> 
> -- 
> Ricardo Ribalda

