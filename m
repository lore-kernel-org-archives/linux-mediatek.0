Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0599CC88E7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 14:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=254R1arFeoToj39V4xt3wD6Cd/e86zUvnv4vHFoNiO8=; b=gU7mt9h69/b2wyEKSXynQ6M9Hb
	2sDcGmuaZC4/cZkWDhKH/c09v0GfSd3pFMgdf9zY+dA7FRuqBRQBhvv0B2kLNkhTtk7cmqVwAJAKz
	luRvp0SK9S4Kf+5BEWJebelJ+1GrO16Otb3tPxztVVCSXw/fUweuSkncGf4la1I0GKwxnvIAs7Qa8
	2kt/Iw6wjTj9w+AbLFbfIqozbvBT6jVXCUrANRsJ3ZbO5B8mTbvtB+GhaZFqyLwzzHX5v6ZJex64g
	vlbGrq+lXVkWLk9hU0fyH12ncLLhBG9hqSUIR0RXg3suq8yorg3T2V4Of0Kjf0pxpNtvQBXhcFaK8
	/NyM2cdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ub9-000000072dH-2SAV;
	Tue, 15 Sep 2026 14:57:27 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ub3-000000072ac-32Ur;
	Tue, 15 Sep 2026 14:57:25 +0000
Date: Tue, 15 Sep 2026 16:57:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789484239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=254R1arFeoToj39V4xt3wD6Cd/e86zUvnv4vHFoNiO8=;
	b=CMxRiALKRyq1V0anX/6ckGE1/BYVlY9fL1HrNqPxF+rhX83P1p/qFKV4bWiUlU9UTMePxr
	HzlLa9dzLTZcH25PTP5dqzuDisqVgjoTO/HivOoWmBbN/i+78iVHckmaa3Zg/MNXIrYKxM
	TDTopVi1FbxNwr7k3Z1/KmX/58vPQC5SLzDhW1V3Q53a5Z176YzBvHkmZE9oH5tuM8RoPu
	2re8k0NPE8tC3mOO/wVwfwx+0RcS2aX0OkNunxeVH9EIp/kAb/ZHlU/I1GyqZh3NmysbTg
	vsw0bDc6EkpveHAS/raUcFqg6Ww2kHMnqGKir0+stdZKgWh/NNrgm4lCqPNSaw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789484239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=254R1arFeoToj39V4xt3wD6Cd/e86zUvnv4vHFoNiO8=;
	b=HWvLdMTcF+Vhh5bpLeoxnfSNe/H03Ev2y7ULP+pZoyAwB/q2HdfOaRc3o3cfsSOIIJg3e4
	RkAgiAkQLZ7EddAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Johan Hovold <johan@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>
Subject: [BUG] mtk-mdp3: Crash during probe in mtk-mdp3
Message-ID: <20260915145718.5D7Dsuwc@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_075721_909798_E86261CB 
X-CRM114-Status: UNSURE (   6.05  )
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

Hi,

On next-20260914 I saw:

| mtk-mdp3 14001000.dma-controller: deferred probe timeout, ignoring depend=
ency
| Unable to handle kernel NULL pointer dereference at virtual address 00000=
00000000019
| Mem abort info:
|   ESR =3D 0x0000000096000004
|   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
|   SET =3D 0, FnV =3D 0
|   EA =3D 0, S1PTW =3D 0
|   FSC =3D 0x04: level 0 translation fault
| Data abort info:
|   ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
|   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
|   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0
| user pgtable: 4k pages, 48-bit VAs, pgdp=3D0000000110d36000
| [0000000000000019] pgd=3D0000000000000000, p4d=3D0000000000000000
| Internal error: Oops: 0000000096000004 [#1]  SMP
| dwmac-mediatek 11021000.ethernet end0: renamed from eth0
| Modules linked in: mtk_vcodec_dec_hw =E2=80=A6
| CPU: 6 UID: 0 PID: 90 Comm: kworker/u32:1 Tainted: G        W           7=
=2E3.0-rc3-next-20260914 #1 PREEMPT_{RT,(full)}
| Tainted: [W]=3DWARN
| Hardware name: MediaTek Genio 1200 EVK-P1V2-EMMC (DT)
| Workqueue: events_unbound deferred_probe_work_func
| pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
| pc : mtk_mutex_get+0xc/0x44 [mtk_mutex]
| lr : mdp_probe+0x150/0x438 [mtk_mdp3]
| sp : ffff8000837ebb30
| x29: ffff8000837ebb30 x28: 0000000000000000 x27: 0000000000000000
| x26: 000000000000000c x25: 000000000000000d x24: ffff0000c0de3410
| x23: 0000000000000000 x22: ffff0000c0de3400 x21: 0000000000000000
| x20: ffff0000d1e56800 x19: ffff0000d1e56800 x18: ffff8000826bfd18
| x17: 3030303030303431 x16: 3a6d726f6674616c x15: 0000000000000058
| x14: ffffffffffffffff x13: 0000000000000028 x12: 0101010101010101
| x11: 7f7f7f7f7f7f7f7f x10: fefeff776473746c x9 : 0000000000000008
| x8 : ffff0000c0864500 x7 : 0000000000000000 x6 : 0000000000000020
| x5 : 0000000000000020 x4 : 0000000000000040 x3 : 0000000000000000
| x2 : ffff80007b37d040 x1 : 0000000000000000 x0 : 0000000000000019
| Call trace:
|  mtk_mutex_get+0xc/0x44 [mtk_mutex] (P)
|  platform_probe+0x5c/0xa4
|  really_probe+0xbc/0x2c0
|  __driver_probe_device+0x11c/0x184
|  driver_probe_device+0x3c/0x114
|  __device_attach_driver+0xb8/0x11c
|  bus_for_each_drv+0x88/0xe8
|  __device_attach+0xa0/0x190
|  device_initial_probe+0x50/0x54
|  bus_probe_device+0x38/0xac
|  deferred_probe_work_func+0x90/0xc8
|  process_one_work+0x188/0x4f8
|  worker_thread+0x18c/0x308
|  kthread+0x130/0x140
|  ret_from_fork+0x10/0x20
| Code: ???????? f9403c03 52800001 91006460 (39400002)
| ---[ end trace 0000000000000000 ]---

That report ist from
	https://dashboard.kernelci.org/test/maestro%3A6aa88a0d20239ade9037b72f
	https://files.kernelci.org/rt-tests-cyclictest-6aa88a0d20239ade9037b72f/lo=
g.txt.gz

This is also visible on 7.3.0-rc3:
	https://files.kernelci.org/rt-tests-cyclictest-6aa84e3720239ade90364e29/lo=
g.txt.gz

Could someone please take a look, I don't have the hardware myself.

Sebastian

