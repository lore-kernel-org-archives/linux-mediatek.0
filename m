Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A172CAC59A
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Sep 2025 18:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3yFQ17OgzAFKbyGJCvcFoBIO/BzGLMi1egxNNv6NnY=; b=kbhG/WYBUJDw6XX1bytX7bTN2F
	GOiOWzCbDTU/gHEP38tyHVK03gxcZlU7a6u9EiHsfYU8dolPUswSeQmVk4RrKqMdUBp4Z8jtpLu2K
	8VWsNBCmdrMK7g6I1AIo1pACRsK79EiVI9cgvL5jFnX9T5ch64iPbT/043BCBxnoggus/1UlNNZJM
	gyOkgqB3tsfj0jZlThnJ7rO9BwObWQD7Uewu54yVNrwc9skEdI1553LtgYKyuTKNxelLniDEzwiMk
	aStnZWTkqQ3Zrc0YCF5sawW1DEJMLQBzsqsXCLtxpLpGTQsM8rGplCemNz9FXOr9knR133M8C7CtH
	2Va0gBxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0OUh-00000007zd4-19gV;
	Sun, 21 Sep 2025 18:09:03 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0OUf-00000007zcd-0FR9
	for linux-mediatek@lists.infradead.org;
	Sun, 21 Sep 2025 18:09:02 +0000
Received: from mop.sam.mop (2.8.3.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::382])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4AAE3340D1B;
	Sun, 21 Sep 2025 18:08:55 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: linux-mediatek@lists.infradead.org, allan.wang@mediatek.com
Cc: xiangzhedev@gmail.com,  linux-firmware@kernel.org
Subject: Re: Regression in linux-firmware-20250917 for mt7921e driver
In-Reply-To: <87bjn6fgr6.fsf@gentoo.org>
Organization: Gentoo
References: <87bjn6fgr6.fsf@gentoo.org>
User-Agent: mu4e 1.12.12; emacs 31.0.50
Date: Sun, 21 Sep 2025 19:08:52 +0100
Message-ID: <87a52n1xvv.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_110901_133731_DAECA416 
X-CRM114-Status: GOOD (  11.30  )
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

Sam James <sam@gentoo.org> writes:

> Hi,
>
> I'm forwarding a downstream report in Gentoo from
> https://bugs.gentoo.org/963106 which also came up in Arch at
> https://gitlab.archlinux.org/archlinux/packaging/packages/linux-firmware/=
-/issues/29
> and on the linux-firmware gitlab at
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/684.
>
> The user describes it on the Arch bug as:
> """
> core/linux-firmware-mediatek@20250917-1 causes network to fail startup
> and dramatically slows down basically every operation in the kernel.
>
> symptoms are a pegged kworker thread at 100% cpu util, shutdown being
> prevented, extremely slow commands like sudo, filesystem access. I
> suspect a interrupt storm of some sort.
> """
>
> And another mentions that removing the module w/ modprobe -r mt7921e hang=
s.

It turns out that I myself do have such a machine, and here's the splat
I got in dmesg:

[   29.647345] mt7921e 0000:04:00.0: Message 0004005c (seq 12) timeout
[   29.648029] ------------[ cut here ]------------
[   29.648033] WARNING: CPU: 8 PID: 149 at drivers/iommu/dma-iommu.c:823 __=
iommu_dma_unmap+0x13e/0x150
[   29.648046] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer snd_seq =
snd_seq_device des3_ede_x86_64 des_generic libdes md4 nft_fib_inet nft_fib_=
ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft=
_reject nft_ct nft_chain_nat ebtable_nat ebtable_broute ip6table_nat ip6tab=
le_mangle ip6table_raw ip6table_security iptable_nat nf_nat nf_conntrack nf=
_defrag_ipv6 nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security nf_=
tables ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter ip=
_tables bnep cuse uvcvideo uvc videobuf2_vmalloc videobuf2_memops videobuf2=
_v4l2 btusb videobuf2_common btrtl btintel videodev btbcm btmtk bluetooth m=
c amdgpu amd_atl intel_rapl_msr intel_rapl_common snd_soc_dmic snd_soc_ps_m=
ach snd_ps_pdm_dma snd_sof_amd_acp70 snd_sof_amd_acp63 snd_sof_amd_vangogh =
snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd_acp snd_sof_pci snd_so=
f_xtensa_dsp snd_sof snd_sof_utils edac_mce_amd snd_pci_ps snd_soc_acpi_amd=
_match vfat snd_amd_sdw_acpi soundwire_amd fat
[   29.648205]  soundwire_generic_allocation snd_hda_codec_realtek mt7921e =
kvm_amd soundwire_bus mt7921_common snd_hda_codec_generic snd_ctl_led snd_s=
oc_sdca snd_hda_scodec_component mt792x_lib snd_hda_codec_hdmi snd_hda_scod=
ec_cs35l41_spi kvm mt76_connac_lib regmap_spi snd_soc_core amdxcp drm_panel=
_backlight_quirks mt76 drm_ttm_helper snd_hda_intel ttm snd_intel_dspcfg sn=
d_compress ac97_bus i2c_algo_bit snd_pcm_dmaengine irqbypass snd_intel_sdw_=
acpi snd_rpl_pci_acp6x spd5118 mac80211 drm_suballoc_helper snd_hda_codec s=
nd_acp_pci snd_hda_scodec_cs35l41_i2c rapl snd_amd_acpi_mach snd_acp_legacy=
_common libarc4 drm_client_lib snd_hda_scodec_cs35l41 snd_hda_core drm_exec=
 snd_soc_cs_amp_lib amdxdna drm_buddy snd_pci_acp6x snd_soc_cs35l41_lib thi=
nkpad_acpi think_lmi snd_pci_acp5x drm_display_helper snd_hwdep cs_dsp gpu_=
sched cfg80211 pcspkr snd_pcm cec drm_shmem_helper sparse_keymap snd_timer =
snd_rn_pci_acp3x platform_profile snd_acp_config snd snd_soc_acpi rfkill dr=
m_kms_helper i2c_piix4 amd_pmc soundcore
[   29.648341]  serial_multi_instantiate firmware_attributes_class snd_pci_=
acp3x k10temp i2c_smbus joydev wmi_bmof fuse loop nfnetlink zstd zram lz4hc=
_compress lz4_compress dm_crypt typec_displayport ucsi_acpi typec_ucsi type=
c nvme rtsx_pci_sdmmc nvme_core polyval_clmulni mmc_core ghash_clmulni_inte=
l video sha512_ssse3 nvme_keyring wacom hid_multitouch thunderbolt sha1_sss=
e3 rtsx_pci nvme_auth sp5100_tco wmi i2c_hid_acpi i2c_hid serio_raw pkcs8_k=
ey_parser
[   29.648415] CPU: 8 UID: 0 PID: 149 Comm: kworker/8:1 Not tainted 6.16.7-=
gentoo-dist #1 PREEMPT(lazy)
[   29.648421] Hardware name: LENOVO 21JXCTO1WW/21JXCTO1WW, BIOS N41ET58W (=
1.35 ) 03/19/2025
[   29.648426] Workqueue: events mt7921_mac_init [mt7921_common]
[   29.648439] RIP: 0010:__iommu_dma_unmap+0x13e/0x150
[   29.648446] Code: 00 00 00 00 48 c7 44 24 10 00 00 00 00 48 c7 44 24 28 =
00 00 00 00 48 c7 04 24 ff ff ff ff 4c 89 74 24 18 4c 89 74 24 20 eb 87 <0f=
> 0b e9 79 ff ff ff e8 a6 9d 5e 00 66 0f 1f 44 00 00 90 90 90 90
[   29.648450] RSP: 0018:ffffcbc84091fc98 EFLAGS: 00010206
[   29.648455] RAX: 0000000000008000 RBX: 00000000ffa00000 RCX: fffffffffff=
fffff
[   29.648459] RDX: 00000000ffa07fff RSI: 0000000000008000 RDI: ffff8940da4=
7b040
[   29.648462] RBP: 0000000000003000 R08: fffffffffffffff8 R09: 00000000000=
02000
[   29.648465] R10: 0000000000040000 R11: 206531323937746d R12: ffff8940829=
76810
[   29.648467] R13: ffffcbc84091fc98 R14: ffffcbc84091fcb0 R15: 00000000000=
00000
[   29.648471] FS:  0000000000000000(0000) GS:ffff894ff58a4000(0000) knlGS:=
0000000000000000
[   29.648474] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   29.648478] CR2: 00007fbcc40e4010 CR3: 0000000e3202c000 CR4: 0000000000f=
50ef0
[   29.648481] PKRU: 55555554
[   29.648484] Call Trace:
[   29.648490]  <TASK>
[   29.648500]  iommu_dma_unmap_page+0x48/0x90
[   29.648509]  dma_unmap_page_attrs+0x23b/0x260
[   29.648518]  mt76_dma_queue_reset+0x304/0x4e0 [mt76]
[   29.648533]  ? mt76_dma_queue_reset+0x1a0/0x4e0 [mt76]
[   29.648541]  mt792x_wpdma_reset+0x85/0x2d0 [mt792x_lib]
[   29.648551]  mt7921_mac_init+0x248/0x400 [mt7921_common]
[   29.648558]  process_one_work+0x18a/0x340
[   29.648566]  worker_thread+0x256/0x3a0
[   29.648571]  ? __pfx_worker_thread+0x10/0x10
[   29.648576]  kthread+0xf9/0x240
[   29.648582]  ? __pfx_kthread+0x10/0x10
[   29.648587]  ? __pfx_kthread+0x10/0x10
[   29.648592]  ret_from_fork+0xf2/0x110
[   29.648600]  ? __pfx_kthread+0x10/0x10
[   29.648604]  ret_from_fork_asm+0x1a/0x30
[   29.648616]  </TASK>
[   29.648618] ---[ end trace 0000000000000000 ]---
[   32.847581] mt7921e 0000:04:00.0: Message 00000010 (seq 13) timeout
[   32.847600] mt7921e 0000:04:00.0: Failed to get patch semaphore
[   36.047344] mt7921e 0000:04:00.0: Message 00000010 (seq 14) timeout
[   36.047367] mt7921e 0000:04:00.0: Failed to get patch semaphore
[   39.247415] mt7921e 0000:04:00.0: Message 00000010 (seq 15) timeout
[   39.247433] mt7921e 0000:04:00.0: Failed to get patch semaphore
[   42.447428] mt7921e 0000:04:00.0: Message 00000010 (seq 1) timeout
[   42.447452] mt7921e 0000:04:00.0: Failed to get patch semaphore

sam

