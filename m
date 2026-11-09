Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1476606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 00:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pyiTXHA2;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=GHSUxRgr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yDs6CzCxqfEwo8tlX39U+fuPJCLt1HilrukTVUCd2bM=; b=pyiTXHA2L2q4Z7uBWzAAs9/IuP
	GXeGriAOlOHKGnBsUUb7aD6oJHwKVopehYIJdkcVMUTW6SucFTDYn14CZAYCgbxyCcMNkT57GK/eV
	N/D6lcVC9yjho7Z+/g7IsUqvHAgMWu90qGDlj5N8G9ObFQy5whhBOUjAuU3G0CpzD5VN7wwr7WH8M
	EQ9Am/DYO5n5dzuReNqH7P13IuhWr6sN5B9EMEznVa3uuVPQQyGoa6wuOQ7bN2rAFr1dKeQZIlx3g
	HjAAo1jtvbyVDuFKwN55pU10OWzSy7Xk3bnSnJWGceC7Ul/X2y7ZKlDnf1e1y3o8PYDpvULqJhWjU
	dsrVPQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDCR-0000000GxHG-2L6t;
	Mon, 09 Nov 2026 00:25:27 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQDCO-0000000GxGu-1W4t
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 00:25:26 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C5DAD801E8;
	Mon, 09 Nov 2026 01:25:20 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxHM6y1VbPO7; Mon,  9 Nov 2026 01:25:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1794183919; bh=SU7bV/bDV5LUHX/6F5LFMZQ2BNoa7NQsk7TZTWIaVro=;
	h=From:To:Cc:Subject:Date;
	b=GHSUxRgrG8DoqISUEqgZOyEpcj2N+JejXRL34M+uIVC/QGz9UgoiaAdrtwe9tow87
	 +s4wtVAxMQyicCpmH+M8HVqcjf9DrIYMgov6xnZIilKe/ZCKxmI8P6JZ0ttm8RiEyL
	 gJRR7Qh7iPGAuylEAyPAF4iuvtRZAs/6cK67laOHTDw6px4A9XHe/+Bc+jEses2jct
	 2G4w2cE3we7upBsqWTM5R+vDw49EJWy2PTJv/N9R+Q8zOftfhdGypG/HFuqXzGwwPv
	 J/t8T81yld41W1u/04WSLjAW6G5pisTA/CiA815M7tfgXlzXltTCr8zaj8t7pbvm9j
	 0EbxuHtXMuf6Q==
From: Florian Maurer <fmaurer@disroot.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Florian Maurer <fmaurer@disroot.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matteo Croce <technoboy85@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [BUG] wifi: mt76: mt7996: full chip reset never recovers with NPU offload (AN7581)
Date: Mon,  9 Nov 2026 00:24:49 +0000
Message-ID: <20261109002500.3564358-1-fmaurer@disroot.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_162524_985185_D0EB8D32 
X-CRM114-Status: GOOD (  14.88  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Felix, Lorenzo,

on a Gemtek W1700K (Airoha AN7581, MT7996 with hif2), a full chip
reset does not recover when the NPU offload is enabled. The firmware
does not load again, and the driver keeps resetting until the board is
power cycled. This also happens after a real firmware assert. With the
NPU offload disabled, the same reset recovers. This is the recovery
problem from the cover letter of the NPU rx fixes [1].

Triggers, both via /sys/kernel/debug/ieee80211/phyN/mt76/sys_recovery:

  0,8  sets the WM/WA watchdog state and runs the full reset
  0,9  makes the WM firmware assert; the next MCU command times out,
       and the timeout starts the full reset

Results:

  trigger  mt76 build                       runs  result
  0,8      NPU on, npu.c as in 467ae2e3     1     no recovery (idle)
  0,8      NPU on, with the fixes from [1]  3     no recovery (idle and rx load)
  0,8      NPU off                          3     recovered (2 idle, 1 rx load)
  0,9      NPU on, with the fixes from [1]  1     no recovery (idle)
  0,9      NPU off                          1     recovered (idle)

Setup: OpenWrt main, kernel 6.18.55, openwrt/mt76 467ae2e3, MT7996
firmware from linux-firmware (WM build time 20260311120504). All
builds also carry two local mt7996 mesh patches [2][3]. The runs with
the fixes from [1] used the flashed image. For the other two rows I
rebuilt mt76 from the same tree, once without the patches from [1] and
once without CONFIG_MT76_NPU/CONFIG_MT7996_NPU, and swapped the three
modules at runtime, so the phy number changes between runs. rx load
was iperf3 over 5 GHz mesh at about 27 Mbit/s. The run without the
fixes from [1] was idle only, because without them the NPU rx path
crashes the board under load.

NPU on, npu.c as in 467ae2e3 (console from ramoops):

  [212226.959322] mt7996e 0000:01:00.0: phy2 indicated firmware crash, attempting recovery
  [212227.465594] pcieport 0000:00:00.0: AER: Multiple Uncorrectable (Non-Fatal) error message received from 0000:00:00.0
  [212227.476337] pcieport 0000:00:00.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=Transaction Layer, (Requester ID)
  [212227.487867] pcieport 0000:00:00.0:   device [14c3:6899] error status/mask=00004000/00400000
  [212227.496358] pcieport 0000:00:00.0:    [14] CmpltTO                (First)
  [212227.503353] mt7996e 0000:01:00.0: AER: can't recover (no error_detected callback)
  [212227.511125] pcieport 0000:00:00.0: AER: device recovery failed
  (the same AER block 5 more times within 0.3 s)
  [212229.496692] mt7996e 0000:01:00.0: Timeout for initializing firmware
  [212231.486662] mt7996e 0000:01:00.0: Timeout for initializing firmware
  [212231.493143] mt7996e 0000:01:00.0: Firmware is not ready for download
  (the same for each of the 10 attempts, with more CmpltTO in between)
  [212268.609326] mt7996e 0000:01:00.0: chip full reset failed
  [212268.614878] ieee80211 phy2: Hardware restart was requested
  [212270.656294] mt7996e 0000:01:00.0: Message 00130022 (seq 1) timeout

The MCU timeout queues the next full reset. This cycle repeated every
43 s until I cut the power after 7 minutes (9 times "chip full reset
failed"). The kernel kept running, but wifi never came back. The 0,8
runs with the fixes from [1] showed the same AER errors and firmware
timeouts; I have no complete log of those.

The 0,9 run with NPU on starts with the MCU timeout and then follows
the same cycle, 22 times in 16 minutes:

  [  404.163489] mt7996e 0000:01:00.0: Message 00130022 (seq 2) timeout
  [  404.731864] pcieport 0000:00:00.0:    [14] CmpltTO                (First)
  [  404.738781] mt7996e 0000:01:00.0: AER: can't recover (no error_detected callback)
  ...
  [  445.955921] mt7996e 0000:01:00.0: chip full reset failed

NPU off, one of the idle runs:

  [206493.052470] mt7996e 0000:01:00.0: phy1 indicated firmware crash, attempting recovery
  [206493.154220] pcieport 0000:00:00.0:    [14] CmpltTO                (First)
  [206493.161225] mt7996e 0000:01:00.0: AER: can't recover (no error_detected callback)
  [206493.168957] pcieport 0000:00:00.0: AER: device recovery failed
  [206493.175076] mt7996e 0000:01:00.0: HW/SW Version: 0x8a108a10, Build Time: 20260311120419a
  [206493.198727] mt7996e 0000:01:00.0: WM Firmware Version: ____000000, Build Time: 20260311120504
  [206493.237451] mt7996e 0000:01:00.0: DSP Firmware Version: ____000000, Build Time: 20260311120415
  [206493.256034] mt7996e 0000:01:00.0: WA Firmware Version: ____000000, Build Time: 20260311120325
  [206512.810444] ieee80211 phy1: Hardware restart was requested

The other two NPU-off 0,8 runs had no CmpltTO; the NPU-off 0,9 run had
one and recovered the same way. In all four the mesh peers stayed up;
under load, iperf3 stopped for about 15 s. So a completion
timeout during the reset also happens without the NPU and is harmless
there. With the NPU on, the firmware does not load after it.

From the code (467ae2e3), not tested: the L1 path in
mt7996_mac_reset_work() calls mt7996_npu_hw_stop() before the reset
and __mt7996_npu_hw_init() after it. The full reset path does neither.
mt7996_mac_restart() calls mt7996_dma_reset(dev, true), which runs
mt7996_wfsys_reset() while the NPU is still active and calls
mt76_npu_disable_irqs() only afterwards. WED gets
mtk_wed_device_dma_reset() at that point. Does the full reset need to
stop the NPU before the wfsys reset, like the L1 path?

Matteo Croce reported the same CmpltTO and "can't recover" lines from
mt7996_mac_reset_work on a BPI-R4, with WED instead of the NPU.
wed_enable=0 made it go away for him [4].

Side note: `echo 0,1` (L1) never printed "L1 SER recovery start" on
this board, with or without the NPU, so the firmware does not seem to
start an L1 recovery from that trigger alone.

Not tested: MT7992, a kernel.org tree. I can run more tests or debug
patches on this board.

[1] https://lore.kernel.org/linux-wireless/cover.1793927986.git.fmaurer@disroot.org/
[2] https://github.com/openwrt/mt76/pull/1132
    ("wifi: mt76: mt7996: use own MAC as BSS BSSID for mesh interfaces")
[3] https://github.com/openwrt/mt76/pull/1170
    ("wifi: mt76: mt7996: let mac80211 de-aggregate mesh A-MSDUs")
[4] https://lore.kernel.org/linux-wireless/afefde93-1f6a-4b3b-976b-87105615f931@gmail.com/

Thanks,
Florian

