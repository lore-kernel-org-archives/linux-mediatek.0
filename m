Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC323C02192
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Feb 2025 17:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:from:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lej/HjnRoGIiHgGyLejhy9XNlZOqOHJpylIZ8d4evSY=; b=c120JnquZf0smUa/aEFq4iDMGl
	j3rfaxc4fkWeOpbSl/iA7/V5BYNX1zJMlnH9bHHD9fXdWI3VCFJHXRv7pvpvDPqiAV7BmsqKHpjIA
	xVSvZ5YErc7fJIin7StNhd1y2vVkQvTXb+njNJS2bO9psFId9fMlqawTb9SzNCtbEsnn9KVyiF3p2
	nog7+ZtvQ5Io6B63Y4SpyyUbjN5pjAUliXYcT+rjA49+jm7DJt95xuLOAc+CLf91xmDzrilt9U+L5
	wEYjKVkrvrb3cHbvLqB4j6huojXmveGHekLXi3Mu7SDAbEmAR37YBvwA8BXC/y0kr1qo+6D465EPg
	xXOTBfPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0fV-0000000GBab-2Rcj;
	Mon, 03 Feb 2025 17:55:33 +0000
Received: from mail-yw1-x1141.google.com ([2607:f8b0:4864:20::1141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0fS-0000000GBaE-0gpx
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Feb 2025 17:55:31 +0000
Received: by mail-yw1-x1141.google.com with SMTP id 00721157ae682-6f47ed1f40dso28090257b3.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Feb 2025 09:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1738605328; x=1739210128; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lej/HjnRoGIiHgGyLejhy9XNlZOqOHJpylIZ8d4evSY=;
        b=DpFxPGXzjioRyTpdlV1xTEAM8wXpVbw7JotV0uXdEdbHudXQk/aDuBHDBu2635TrJY
         6H5g9zLbsl4Cp9zZBmwhZaEaLn5YGjPiNNbdvarQEkuJw/u4qo3NcPy+5WBOywk//Sxf
         ktlw/OQ5h12EXmK7VCAvG6QfhlKdIlKnjqNfhxstuSfDfyPGhwKsMFpIvZ5OIePSOQaJ
         bJw5mZPZfhTZJl3Q8XCYFetU0ov2phOvtmHyBRksfVUxxJM8dxPD8TKtEExuCMd19jDi
         eC/Qq4TNXQXm2fkaXlugJcpR++0Bq1LwISKU71G9qYjnjCNvwZyyV3oKZW5h9pDXJSoB
         F15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738605328; x=1739210128;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lej/HjnRoGIiHgGyLejhy9XNlZOqOHJpylIZ8d4evSY=;
        b=APSMFssdAV6pYFFTkdRW548dBakBGih3qhfGCQ6Dv5d2BHCFcxMUgK+nWMgXSLTYx1
         gquLmFFU05iO50b0Nj4PjOHXRRW5+J4kC6STs7xKdpX8+kIYb7dM1AUze/L8vxTKs9vJ
         nSRiGnXTGPoKvEKK/4/dIDX49u3wO0pUJdNFFljs1stWnq8sIrE+C3mDtRMcF7ArV2o6
         3NskEp5LGei65rTfFnyXfqGtbnP1mrAX0c8mwhYFcCGkN/RP3axWN4AxVVAWgFfAy8V4
         vSCH8j+y9ynDgL1B2mdrYLnYKYu8pitVqGRnXPHvrz2KEfpjy2BZr0IAPkZ9i7LrfaHv
         cI1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuHi3ICqPPFX1sNk5GRRxcF6PednR4ARhIkldFwLCTMhozMpCwmZZ5DtnaKxS59/kNF3OAZyEcb0gm7tHnRw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0A6ACnvVAVFfjgl/VFz/HX2o+uaBp86UQjJee9ryvyHzJHwR1
	K8SHiLWuWHibzf32j4ln/HAl1B1+hVBy5BtObMEqlt9mBk1R1YGbLoyNOLYDdqObklKokILZAib
	35AzmBayQMdZb1/TKrPXBwwyfX7yEOIIxgZQA0A==
X-Gm-Gg: ASbGnctYeaoEXTsqAsDDfL7PjZxEU1/XGp4fMbK3emxkia/5K4ypDH0huqdLjP1b/g7
	MiUOheJGhWp4pcM1COoTxNOHfVYK0TSdvnpUbu0uxbisV1rDAx6ymloYkKhUcPCwRUP7CR6karE
	I6yST6l2QAtf/If9vTndhepZ/LArgzGw==
X-Google-Smtp-Source: AGHT+IFn2rDWVryLxBS9cPZKfPHcC5cHN/DsbioActnxO0XAGsRzt8U7fOaetI1I/VSC20sv5CGcxZc3ITTc/xVzH/c=
X-Received: by 2002:a05:690c:6d07:b0:6ef:4a1f:36b7 with SMTP id
 00721157ae682-6f7a84246a8mr177591927b3.25.1738605328578; Mon, 03 Feb 2025
 09:55:28 -0800 (PST)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 Feb 2025 09:55:27 -0800
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 3 Feb 2025 09:55:27 -0800
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Date: Mon, 3 Feb 2025 09:55:27 -0800
X-Gm-Features: AWEUYZly_aGAiwPXWtNkVzky8FF79JfpTHOSFjCzWR4ySuCU8vg1xL5m3eedcHk
Message-ID: <CACo-S-3ne3ECDg5fTacS8ZfcpJ=WnhDF-gHTo6hUUgN4AeP6hg@mail.gmail.com>
Subject: stable/linux-6.13.y: new boot regression: WARNING at
 lib/refcount.c:25 refcount_warn_saturate+0xc8...
To: kernelci-results@groups.io
Cc: gus@padovan.org, linux-mediatek@lists.infradead.org, 
	angelogioacchino.delregno@collabora.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_095530_473789_7554308B 
X-CRM114-Status: UNSURE (   1.14  )
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

New boot regression found on stable/linux-6.13.y:

 WARNING at lib/refcount.c:25 refcount_warn_saturate+0xc8/0x148
[logspec:generic_linux_boot,linux.kernel.warning]

- Dashboard: https://staging.dashboard.kernelci.org:9000/issue/maestro:9027cb3b2181d813ac566c16982a6748748d7ae7
- Grafana: https://grafana.kernelci.org/d/issue/issue?var-id=maestro:9027cb3b2181d813ac566c16982a6748748d7ae7


Log excerpt:
[    4.653252] refcount_t: addition on 0; use-after-free.
[    4.653261] WARNING: CPU: 5 PID: 187 at lib/refcount.c:25
refcount_warn_saturate+0xc8/0x148
[    4.653271] Modules linked in: v4l2_mem2mem pcie_mediatek_gen3(+)
mt6359_auxadc mtk_rpmsg joydev videobuf2_dma_contig rpmsg_core
elan_i2c lvts_thermal(+) mt6577_auxadc snd_soc_mt8195_afe(+) mtk_svs
mtk_scp_ipi snd_sof_utils mtk_wdt btusb btintel btbcm btmtk btrtl
uvcvideo videobuf2_vmalloc uvc videobuf2_v4l2 mt8195_mt6359 bluetooth
ecdh_generic videobuf2_memops ecc videobuf2_common
[    4.653293] CPU: 5 UID: 0 PID: 187 Comm: (udev-worker) Not tainted
6.13.0 #1 c0bd9fe43a50105c5d4fe2d8da4d493a3771f650
[    4.653296] Hardware name: Acer Tomato (rev2) board (DT)
[    4.653297] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    4.653298] pc : refcount_warn_saturate+0xc8/0x148
[    4.653301] lr : refcount_warn_saturate+0xc8/0x148
[    4.653303] sp : ffff800080c23620
[    4.653304] x29: ffff800080c23620 x28: ffffda629c274b18 x27: 0000000000000001
[    4.653306] x26: ffff800080c23930 x25: ffffda62d3588f10 x24: ffff07808558e7f8
[    4.653308] x23: 0000000000000000 x22: ffff078081075478 x21: ffff800080c236a8
[    4.653309] x20: 0000000000000000 x19: ffff078081074078 x18: 00000000ffffffff
[    4.653311] x17: 00000000ffffb060 x16: ffffda62d111f5f8 x15: 612d35393138746d
[    4.653313] x14: ffffda62d37fd750 x13: 0a2e656572662d72 x12: ffffda62d3551950
[    4.653315] x11: 0000000000000001 x10: 0000000000000001 x9 : ffffda62d0943280
[    4.653316] x8 : c0000000ffffdfff x7 : ffffda62d34a18b0 x6 : 00000000000affa8
[    4.653318] x5 : ffffda62d35518f8 x4 : 0000000000000000 x3 : 00000000ffffffff
[    4.653320] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff078088140000
[    4.653322] Call trace:
[    4.653323]  refcount_warn_saturate+0xc8/0x148 (P)
[    4.653326]  klist_next+0x180/0x1a8
[    4.653329]  bus_for_each_dev+0x6c/0xe8
[    4.653334]  driver_attach+0x2c/0x40
[    4.653336]  bus_add_driver+0xec/0x218
[    4.653337]  driver_register+0x68/0x138
[    4.653339]  __platform_driver_register+0x2c/0x40
[    4.653341]  mt8195_afe_pcm_driver_init+0x28/0xff8
[snd_soc_mt8195_afe 41f903257dcc6a1560bfbd0ddb4cf7a5b6deb9f1]
[    4.653350]  do_one_initcall+0x60/0x320
[    4.653354]  do_init_module+0x68/0x258
[    4.653357]  load_module+0x1cf8/0x1de8
[    4.653359]  init_module_from_file+0x8c/0xd8
[    4.653361]  __arm64_sys_finit_module+0x150/0x338
[    4.653363]  invoke_syscall+0x70/0x100
[    4.653367]  el0_svc_common.constprop.0+0x48/0xf0
[    4.653370]  do_el0_svc+0x24/0x38
[    4.653372]  el0_svc+0x34/0xf0
[    4.653375]  el0t_64_sync_handler+0x10c/0x138
[    4.653377]  el0t_64_sync+0x1b0/0x1b8



# Hardware platforms affected:

## mt8195-cherry-tomato-r2
- Compatibles: google,tomato-rev2 | google,tomato | mediatek,mt8195
- Dashboard: https://staging.dashboard.kernelci.org:9000/test/maestro:67a0b86a661a7bc874890490

#kernelci issue maestro:9027cb3b2181d813ac566c16982a6748748d7ae7


--
This is an experimental report format. Please send feedback in!
Talk to us at kerneci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

