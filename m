Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5D4C02194
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Feb 2025 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:from:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ubwaL7oEStadrLkrpZmo0dMLzr7dWhUY7RZXXJTTuIo=; b=4wF7CN08wPOQqyHWo6dAwVTTXF
	VgxGKCoCxPn8jYGrBcmaHg6HTX+chCDGzMHZVZhYYAmXbrpu51iZlEStbHHtPsyf9PvMWNaclnlP1
	VweHTs22AtF9sI1ChnJjzYMJuvh36xPOGYyUEvwF2dpXU11TQAkSP3LEdA4Sbkkk74cR/AHmQ9mSI
	KFK3Y5jPACys/4pHbbsL43dP/2IeqI7oHb8/mQlFiHBImFrNXhVN9uglDnWUC3g1Ma0bbtfAR+tI6
	SKV85Zis0DltOzu1/zJMwdNeUJHVqNF7ETB05WDOH+Tm7EWwQsIH277PGMza20/fMI1FXsHGY7u6g
	2mJPFJwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGAv-000000009lj-2Pvf;
	Tue, 04 Feb 2025 10:29:01 +0000
Received: from mail-yw1-x1143.google.com ([2607:f8b0:4864:20::1143])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGAs-000000009ky-05HM
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Feb 2025 10:28:59 +0000
Received: by mail-yw1-x1143.google.com with SMTP id 00721157ae682-6f679788fd1so31581557b3.2
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Feb 2025 02:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1738664937; x=1739269737; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ubwaL7oEStadrLkrpZmo0dMLzr7dWhUY7RZXXJTTuIo=;
        b=blED4IP6/QnAg089Z6Z9rGjGuU/FWf77cUvL0l0FwfPdO3KtMbt5Msu0WAmOfMqN12
         2o6Ij19P/acukr77Mm2Xxcy9CnIEcxyk2vX1SBgwp5H1RuEs7GExOvoLeP4KOtuX95P7
         tezSlkWT+v3xduQfyGyZF3F+QRLqVFzX08MWFQ0zVi8iQ/YGio/vn0qIjT6eMPXw0gGr
         KywjXyAoGIgb3U9iTkrlR3GmBbcnp9fc+7D1BqCOGhtltjM9MoW1fqT9a68s9Zo2au4w
         mBSlQfFDlnU3Gb7s/g3jepN5EEIPzj5l3qUDFyp8s+D4AVP0FW0sgxVbFDzi0MUE4kCm
         bWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738664937; x=1739269737;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubwaL7oEStadrLkrpZmo0dMLzr7dWhUY7RZXXJTTuIo=;
        b=OIEZzDZuEc0PfL/tc8jPaUh/7DYHup0Vm0Vt1j5xNO5T4qYOJXUoNh+S2zh9rzCtML
         +GpYlMTRbmeAMv3X1lvS6AmF4fmIJnN2pcuk7WUJjOAru55xH/90VU5pf9EFSU5en8l4
         lv6xYGcLHZzfURgmsdElrXZIrqRPN9SMue6pz8SUhv+s2MDHd/KXYOX7RyzT5e69BP1+
         LyXKdSEj8/KBL61S4nHe5Jg/xp3n87CD7Hqt2swyPUsRwdP9mVLm+xvkC0xI0cCpnS24
         donlP5nO0Kf35HelAxcZpmPRTXffqtyRHONp1H4USsKWqgstRSyiJLUeK2AQ6BZ6cmux
         Ih+A==
X-Forwarded-Encrypted: i=1; AJvYcCWApxeNhQ8GzgNylT/qieu1KmYpeLBe8uornoRgTaHhN+QJav8rMH/0KViDD6YFQWhooT6Ud+bSuJGbs3vctw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxWVmOcWYqgP/5TAAKDf7wwI6hIFJ9t5yQvzXqNRBxdIkDB4R/
	Kr2ySeiKdm12I0OmoB/soxKNfsnjSayhbe4PyzGuXRyKL9RHMYEIT520X4rwinFjY+jIOXEstFX
	kVphgI7q6PzcnxVfs7mncNjhrEtuOgktEiYWihg==
X-Gm-Gg: ASbGnctD2bzB7zmEbmWWQIlM7Lj2273Lt3nU3VTY3iFd4zgeivXBS9Xm8NxqMu+Egx3
	7sFoH3dTXZWpGZNl/glB4VeySvV4osWpKXPlqGuIM+nsNQb1vHGDb+GoOjm8pf3GQpVOvBxmt1y
	ElS8z38EvMO1QHvMKBokjuD+/4QUF2Zw==
X-Google-Smtp-Source: AGHT+IE20YsJ9l/I/Vf8+tKL5GPZ0CVAw4b57aNyNHBd9D0mmp7ibwy2keBz/4GBYIQsaECG87U3ZvGIxrQ/H6g/3cA=
X-Received: by 2002:a05:690c:3581:b0:6f6:7b02:2568 with SMTP id
 00721157ae682-6f7a8423943mr197974977b3.32.1738664936641; Tue, 04 Feb 2025
 02:28:56 -0800 (PST)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Feb 2025 02:28:55 -0800
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Feb 2025 02:28:55 -0800
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Date: Tue, 4 Feb 2025 02:28:55 -0800
X-Gm-Features: AWEUYZlpyLHS3qo1FoXH1BvFz0_awCBmCa0lK_RPZeVVemzWUy05-RA8u8yPcD8
Message-ID: <CACo-S-1tnrMXPP4k=yKJe=nAFCEkd7-7jrUYV_s3nF3NRe92OA@mail.gmail.com>
Subject: stable-rc/linux-6.6.y: new boot regression: NULL pointer dereference
 at virtual address 000000000000...
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-mediatek@lists.infradead.org, 
	angelogioacchino.delregno@collabora.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_022858_249530_A6EBFAFE 
X-CRM114-Status: UNSURE (   1.61  )
X-CRM114-Notice: Please train this message.
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

Hello,

New boot regression found on stable-rc/linux-6.6.y:

 NULL pointer dereference at virtual address 0000000000000030
[logspec:generic_linux_boot,linux.kernel.null_pointer_dereference]

- Dashboard: https://staging.dashboard.kernelci.org:9000/issue/maestro:295973ea60dd4385ec6b04faa6ddce9707f879a4
- Grafana: https://grafana.kernelci.org/d/issue/issue?var-id=maestro:295973ea60dd4385ec6b04faa6ddce9707f879a4


Log excerpt:
[    4.896353] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000030
[    4.896354] Mem abort info:
[    4.896355]   ESR = 0x0000000096000004
[    4.896356]   EC = 0x25: DABT (current EL), IL = 32 bits
[    4.896357]   SET = 0, FnV = 0
[    4.896358]   EA = 0, S1PTW = 0
[    4.896358]   FSC = 0x04: level 0 translation fault
[    4.896360] Data abort info:
[    4.896366]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    4.896367]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    4.896368]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    4.896369] user pgtable: 4k pages, 48-bit VAs, pgdp=00000001089d9000
[    4.896370] [0000000000000030] pgd=0000000000000000, p4d=0000000000000000
[    4.896374] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[    4.896376] Modules linked in: mtk_mdp3(+) v4l2_mem2mem joydev ecc
pcie_mediatek_gen3(+) videobuf2_dma_contig elan_i2c mtk_svs
lvts_thermal r8152(+) mii cros_ec_rpmsg snd_sof_mt8195 mtk_adsp_common
snd_sof_xtensa_dsp mtk_scp snd_sof_of cros_ec_sensorhub
cros_kbd_led_backlight mtk_rpmsg snd_sof rpmsg_core mt6359_auxadc
snd_soc_mt8195_afe mt6577_auxadc snd_sof_utils mtk_scp_ipi mtk_wdt
mt8195_mt6359 uvcvideo videobuf2_vmalloc uvc videobuf2_v4l2
videobuf2_memops videobuf2_common
[    4.896396] CPU: 7 UID: 0 PID: 207 Comm: (udev-worker) Not tainted
6.13.2-rc1 #1 8f7a24f5cbfa3d4f7c9dce5f7e52657669893a6c
[    4.896399] Hardware name: Acer Tomato (rev2) board (DT)
[    4.896400] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    4.896402] pc : klist_put+0x28/0xf0
[    4.896410] lr : klist_iter_exit+0x24/0x38
[    4.896412] sp : ffff800080cab810
[    4.896412] x29: ffff800080cab810 x28: ffffc4e77c077518 x27: 0000000000000001
[    4.896415] x26: ffff800080cabb10 x25: ffffc4e79fb98a50 x24: ffff1beb48832bb8
[    4.896417] x23: ffffc4e79dedd540 x22: 0000000000000000 x21: ffffc4e79d6f8f00
[    4.896418] x20: 0000000000000000 x19: ffff1beb41095178 x18: ffffffffffffffff
[    4.896420] x17: 656469762f766564 x16: ffffc4e79d6fb3f0 x15: 2d35393138746d2c
[    4.896422] x14: ffffc4e79fe0e750 x13: 616964656d43746f x12: 0000000000000000
[    4.896424] x11: 00353639333d4d55 x10: 0000a8fc3b570378 x9 : ffffc4e79dd32458
[    4.896426] x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : 5c175b1c0b544003
[    4.896427] x5 : 0340540b1c5b175c x4 : 0000000000000000 x3 : 0000000014f08001
[    4.896429] x2 : 00000000dead4ead x1 : 0000000000000000 x0 : 0000000000000000
[    4.896431] Call trace:
[    4.896432]  klist_put+0x28/0xf0 (P)
[    4.896435]  klist_iter_exit+0x24/0x38
[    4.896436]  bus_for_each_dev+0x90/0xe8
[    4.896440]  driver_attach+0x2c/0x40
[    4.896442]  bus_add_driver+0xec/0x218
[    4.896443]  driver_register+0x68/0x138
[    4.896445]  __platform_driver_register+0x2c/0x40
[    4.896447]  mdp_driver_init+0x28/0xff8 [mtk_mdp3
368282916f4a555c99cbc06147f8cea6ac3d5634]
[    4.896452]  do_one_initcall+0x60/0x320
[    4.896455]  do_init_module+0x60/0x238
[    4.896458]  load_module+0x1cf8/0x1de8
[    4.896460]  init_module_from_file+0x8c/0xd8
[    4.896461]  __arm64_sys_finit_module+0x150/0x338
[    4.896463]  invoke_syscall+0x70/0x100
[    4.896466]  el0_svc_common.constprop.0+0x48/0xf0
[    4.896469]  do_el0_svc+0x24/0x38
[    4.896471]  el0_svc+0x34/0xf0
[    4.896473]  el0t_64_sync_handler+0x10c/0x138
[    4.896474]  el0t_64_sync+0x1b0/0x1b8
[    4.896477] Code: 12001c36 f9400014 927ffa94 aa1403e0 (f9401a95)



# Hardware platforms affected:

## mt8195-cherry-tomato-r2
- Compatibles: google,tomato-rev2 | google,tomato | mediatek,mt8195
- Dashboard: https://staging.dashboard.kernelci.org:9000/test/maestro:67a12193661a7bc87489fa91


#kernelci issue maestro:295973ea60dd4385ec6b04faa6ddce9707f879a4

Reported-by: kernelci.org bot <bot@kernelci.org>


--
This is an experimental report format. Please send feedback in!
Talk to us at kerneci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

