Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC56CAC5B0
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Oct 2025 12:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHkiLXEy5xVbZQ8IPUobZ9jjChqRCqjNJIiFqOqmUik=; b=Ma1YTgYKd/jABUE8A+CODOsDuF
	T+ASQ2gKkR/l2uRwBKHuXXnkt0ICjiYXkJROW05CeGdJ9ivsHFImVsvMRZ6mgWs2pM0584seSqrGM
	vcfNNLL6ySaFU1TtMBdE87WuaNan6QyM5qyNYOb1INVvn3rBnAI1La4/07vTac/tMvSxmoFC3N1dz
	QEjolsscsgSeNyZ6ny1POjTts/TwXP7WMMFUDsQyuTNwbU4/qEzDq8M9aTZ4iZs7DhE8sRagiSpLm
	JJYznsXqh7AXUwzqsNoxv4UNUHjrLOc63Ay7EzDsm6/ADm7H4P+7d4kRVwF3KIVmtteAdoL58gs5/
	Z/muFTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ezL-0000000CHuy-2J3x;
	Fri, 03 Oct 2025 12:34:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ezI-0000000CHuM-1dtq
	for linux-mediatek@lists.infradead.org;
	Fri, 03 Oct 2025 12:34:17 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-46e4473d7f6so13403585e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Oct 2025 05:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759494854; x=1760099654; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lHkiLXEy5xVbZQ8IPUobZ9jjChqRCqjNJIiFqOqmUik=;
        b=VucI5931PxFTWSpDxUArquWcz+cjDPC/XAonnLXFo9lDOUzkXAeeZc+Tj8mos2uY1K
         UpiLzlz0406hIjA3r5FI/+hPBaqBYaa+WEUhNlSzkAPhZuJN7JSml1xmJ8WM8EUw4jNO
         jQmt5M7wJMCsB9Z4pCm8HkIsr4zKnbWe+0Q5zzdODWN0GXD20pFji8RxIlLDUO7Q49ZE
         Wg267Na7b1/xquTHSB0udrUhKAv6inhNesRga+gP+Tjv9mFSK7tCitLy77cYWGXX+Ba6
         23TvYQZ4G2/c8W3b9Iflu3UOvi8NgTcl2afSWNHJ+yy0TgiR82Zspkz2bgPgLQi2fvoq
         jEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759494854; x=1760099654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lHkiLXEy5xVbZQ8IPUobZ9jjChqRCqjNJIiFqOqmUik=;
        b=Laim/0JwCNydgOuhF1++m2ZAjCkmJ5Lb0r5WSAIKfcCum8j3Nckf9mWe0RT/euZVe3
         Gf18VxkIixuL5aWMJ4EcT1QF0Fwp80vWAn5I08DDeDTpo7FsJUZlYvkumwT+0Rol3HCk
         p+Nj7RuGl5o+YVqzdavtrgUqL0SEoiAZvrRyoXx8pt0335FgvjHdisoo5VZqN62HFrDG
         slZ+YaPbg5V0MPp4P/RhxjPWf0LQgbYXXS5mU7tXrPW+17F753je3ihkpd9L50JdDwUA
         SHMAUy4Ii0NbasYrYoRjh9iBO6knME4mDiV1iSHBulS8oX4ysK1P3rY8pYAwZ8bkDkBZ
         ME4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKQmu4qBiKMr9CYLg1qqn4uRnTQNjTYIZZuMLpyISQQxMIcmp5Eggm4ugwt0wL+lw3ZFiN2y4NUuXCfWdtKA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHoVamxHnnX6zLim74wVxwq6aPzGVBqz7gwG12za6LMVAIQ2AG
	cZpNdljuQwXM1TtmJV59b8egI7DAic82wBbm2ZaIiTt9jl/0tCxjn6IV
X-Gm-Gg: ASbGncswTc8SpG3Mn2wpaI6fybhwpP4xOmli0SHH1lSa6k412vOvjg7AeeUo1kpc0+b
	WYvpnkWNlQWddPhJ4pQhgr3MGLwxJ3cicZblBgGpmsgP5JuolHma3e3vLEdhGhBel+GLjVDh0HB
	sqp0wvcA+JatapxwQbC9jVGYBcQ4A0+vdqwUIxVwRmeueFXR7P5ZFyai8itbjM36qiu9bC6YmKp
	Enw36KyL56M2JT46qYk4XSa4eiam/oMCsc8YyqIOVR91Nmm3D9WTPnsersTCXRSb2TQV6BjPaHI
	ufcvTOTsQt66a50sLn7ZWao1iDuUuUyqHKyu6GtAlOsxUtoArE9NusSuTPhWfc8jUQy0tpCVsre
	WavO2fTIqrUEhuDMhFVjJnUvaETEDtXw1TxG9QS8RQMlhzCRV+ZSzNuanndZrnC5fIgvQKQ==
X-Google-Smtp-Source: AGHT+IGMl4nT9eitU/CcjfZYzxj4Xo2+0xZwQ28ITzRpt3U0GpH014UWT0/oQvXnQPy76IbNgKh7vQ==
X-Received: by 2002:a05:600c:6208:b0:45b:7b00:c129 with SMTP id 5b1f17b1804b1-46e71154995mr18981095e9.35.1759494853656;
        Fri, 03 Oct 2025 05:34:13 -0700 (PDT)
Received: from [10.211.217.169] ([167.222.127.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723614c9sm28749305e9.14.2025.10.03.05.34.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 05:34:13 -0700 (PDT)
Message-ID: <7b1c68e9-7b27-4d14-9d44-143b9b70cdd8@gmail.com>
Date: Fri, 3 Oct 2025 14:34:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in linux-firmware-20250917 for mt7921e driver
To: =?UTF-8?B?QWxsYW4gV2FuZyAo546L5a625YGJKQ==?= <Allan.Wang@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "sam@gentoo.org" <sam@gentoo.org>,
 =?UTF-8?B?TWluZ3llbiBIc2llaCAo6Kyd5piO6Ku6KQ==?= <Mingyen.Hsieh@mediatek.com>
Cc: "xiangzhedev@gmail.com" <xiangzhedev@gmail.com>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>
References: <87bjn6fgr6.fsf@gentoo.org> <87a52n1xvv.fsf@gentoo.org>
 <dda63a6b723d31f41e6e275ac7f38d31c6715fc8.camel@mediatek.com>
Content-Language: en-US, pl
From: =?UTF-8?Q?Jacek_=C5=81uczak?= <luczak.jacek@gmail.com>
In-Reply-To: <dda63a6b723d31f41e6e275ac7f38d31c6715fc8.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_053416_476116_744CFAC7 
X-CRM114-Status: GOOD (  14.93  )
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

Hi Allan,

I can confirm same issue with latest firmware my Asus[1] running Arch 
Linux[2]. I've downgraded to the previous version. Can you ping some 
details/docs on what exactly is that parameter disabling?

Cheers,

-Jacek

[1]ASUS Vivobook S 16 Type ASUS Vivobook S 16 M5606WA_M5606WA

[2] 
https://gitlab.archlinux.org/archlinux/packaging/packages/linux-firmware/-/issues/29

On 9/22/25 10:24 AM, Allan Wang (王家偉) wrote:
> Hi Sam,
>
> Would you please try "insmod mt7921_common disable_clc=1"
> to help us clarifying this issue ?
>
>
> On Sun, 2025-09-21 at 19:08 +0100, Sam James wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Sam James <sam@gentoo.org> writes:
>>
>>> Hi,
>>>
>>> I'm forwarding a downstream report in Gentoo from
>>> https://urldefense.com/v3/__https://bugs.gentoo.org/963106__;!!CTRNKA9wMg0ARbw!hhyPN8KRVREOUZaTnwDUr6LRxdeYtp4Gnf4XjwU7iMWkTa68kDJhqn79Hwc7wVLveusZX55jiMSgSw$
>>>    which also came up in Arch at
>>> https://urldefense.com/v3/__https://gitlab.archlinux.org/archlinux/packaging/packages/linux-firmware/-/issues/29__;!!CTRNKA9wMg0ARbw!hhyPN8KRVREOUZaTnwDUr6LRxdeYtp4Gnf4XjwU7iMWkTa68kDJhqn79Hwc7wVLveusZX55kCCRjXw$
>>> and on the linux-firmware gitlab at
>>> https://urldefense.com/v3/__https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/684__;!!CTRNKA9wMg0ARbw!hhyPN8KRVREOUZaTnwDUr6LRxdeYtp4Gnf4XjwU7iMWkTa68kDJhqn79Hwc7wVLveusZX5770ZdvXg$
>>>   .
>>>
>>> The user describes it on the Arch bug as:
>>> """
>>> core/linux-firmware-mediatek@20250917-1 causes network to fail
>>> startup
>>> and dramatically slows down basically every operation in the
>>> kernel.
>>>
>>> symptoms are a pegged kworker thread at 100% cpu util, shutdown
>>> being
>>> prevented, extremely slow commands like sudo, filesystem access. I
>>> suspect a interrupt storm of some sort.
>>> """
>>>
>>> And another mentions that removing the module w/ modprobe -r
>>> mt7921e hangs.
>> It turns out that I myself do have such a machine, and here's the
>> splat
>> I got in dmesg:
>>
>> [   29.647345] mt7921e 0000:04:00.0: Message 0004005c (seq 12)
>> timeout
>> [   29.648029] ------------[ cut here ]------------
>> [   29.648033] WARNING: CPU: 8 PID: 149 at drivers/iommu/dma-
>> iommu.c:823 __iommu_dma_unmap+0x13e/0x150
>> [   29.648046] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer
>> snd_seq snd_seq_device des3_ede_x86_64 des_generic libdes md4
>> nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet
>> nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat
>> ebtable_nat ebtable_broute ip6table_nat ip6table_mangle ip6table_raw
>> ip6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6
>> nf_defrag_ipv4 iptable_mangle iptable_raw iptable_security nf_tables
>> ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter
>> ip_tables bnep cuse uvcvideo uvc videobuf2_vmalloc videobuf2_memops
>> videobuf2_v4l2 btusb videobuf2_common btrtl btintel videodev btbcm
>> btmtk bluetooth mc amdgpu amd_atl intel_rapl_msr intel_rapl_common
>> snd_soc_dmic snd_soc_ps_mach snd_ps_pdm_dma snd_sof_amd_acp70
>> snd_sof_amd_acp63 snd_sof_amd_vangogh snd_sof_amd_rembrandt
>> snd_sof_amd_renoir snd_sof_amd_acp snd_sof_pci snd_sof_xtensa_dsp
>> snd_sof snd_sof_utils edac_mce_amd snd_pci_ps snd_soc_acpi_amd_match
>> vfat snd_amd_sdw_acpi soundwire_amd fat
>> [   29.648205]  soundwire_generic_allocation snd_hda_codec_realtek
>> mt7921e kvm_amd soundwire_bus mt7921_common snd_hda_codec_generic
>> snd_ctl_led snd_soc_sdca snd_hda_scodec_component mt792x_lib
>> snd_hda_codec_hdmi snd_hda_scodec_cs35l41_spi kvm mt76_connac_lib
>> regmap_spi snd_soc_core amdxcp drm_panel_backlight_quirks mt76
>> drm_ttm_helper snd_hda_intel ttm snd_intel_dspcfg snd_compress
>> ac97_bus i2c_algo_bit snd_pcm_dmaengine irqbypass snd_intel_sdw_acpi
>> snd_rpl_pci_acp6x spd5118 mac80211 drm_suballoc_helper snd_hda_codec
>> snd_acp_pci snd_hda_scodec_cs35l41_i2c rapl snd_amd_acpi_mach
>> snd_acp_legacy_common libarc4 drm_client_lib snd_hda_scodec_cs35l41
>> snd_hda_core drm_exec snd_soc_cs_amp_lib amdxdna drm_buddy
>> snd_pci_acp6x snd_soc_cs35l41_lib thinkpad_acpi think_lmi
>> snd_pci_acp5x drm_display_helper snd_hwdep cs_dsp gpu_sched cfg80211
>> pcspkr snd_pcm cec drm_shmem_helper sparse_keymap snd_timer
>> snd_rn_pci_acp3x platform_profile snd_acp_config snd snd_soc_acpi
>> rfkill drm_kms_helper i2c_piix4 amd_pmc soundcore
>> [   29.648341]  serial_multi_instantiate firmware_attributes_class
>> snd_pci_acp3x k10temp i2c_smbus joydev wmi_bmof fuse loop nfnetlink
>> zstd zram lz4hc_compress lz4_compress dm_crypt typec_displayport
>> ucsi_acpi typec_ucsi typec nvme rtsx_pci_sdmmc nvme_core
>> polyval_clmulni mmc_core ghash_clmulni_intel video sha512_ssse3
>> nvme_keyring wacom hid_multitouch thunderbolt sha1_ssse3 rtsx_pci
>> nvme_auth sp5100_tco wmi i2c_hid_acpi i2c_hid serio_raw
>> pkcs8_key_parser
>> [   29.648415] CPU: 8 UID: 0 PID: 149 Comm: kworker/8:1 Not tainted
>> 6.16.7-gentoo-dist #1 PREEMPT(lazy)
>> [   29.648421] Hardware name: LENOVO 21JXCTO1WW/21JXCTO1WW, BIOS
>> N41ET58W (1.35 ) 03/19/2025
>> [   29.648426] Workqueue: events mt7921_mac_init [mt7921_common]
>> [   29.648439] RIP: 0010:__iommu_dma_unmap+0x13e/0x150
>> [   29.648446] Code: 00 00 00 00 48 c7 44 24 10 00 00 00 00 48 c7 44
>> 24 28 00 00 00 00 48 c7 04 24 ff ff ff ff 4c 89 74 24 18 4c 89 74 24
>> 20 eb 87 <0f> 0b e9 79 ff ff ff e8 a6 9d 5e 00 66 0f 1f 44 00 00 90
>> 90 90 90
>> [   29.648450] RSP: 0018:ffffcbc84091fc98 EFLAGS: 00010206
>> [   29.648455] RAX: 0000000000008000 RBX: 00000000ffa00000 RCX:
>> ffffffffffffffff
>> [   29.648459] RDX: 00000000ffa07fff RSI: 0000000000008000 RDI:
>> ffff8940da47b040
>> [   29.648462] RBP: 0000000000003000 R08: fffffffffffffff8 R09:
>> 0000000000002000
>> [   29.648465] R10: 0000000000040000 R11: 206531323937746d R12:
>> ffff894082976810
>> [   29.648467] R13: ffffcbc84091fc98 R14: ffffcbc84091fcb0 R15:
>> 0000000000000000
>> [   29.648471] FS:  0000000000000000(0000) GS:ffff894ff58a4000(0000)
>> knlGS:0000000000000000
>> [   29.648474] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   29.648478] CR2: 00007fbcc40e4010 CR3: 0000000e3202c000 CR4:
>> 0000000000f50ef0
>> [   29.648481] PKRU: 55555554
>> [   29.648484] Call Trace:
>> [   29.648490]  <TASK>
>> [   29.648500]  iommu_dma_unmap_page+0x48/0x90
>> [   29.648509]  dma_unmap_page_attrs+0x23b/0x260
>> [   29.648518]  mt76_dma_queue_reset+0x304/0x4e0 [mt76]
>> [   29.648533]  ? mt76_dma_queue_reset+0x1a0/0x4e0 [mt76]
>> [   29.648541]  mt792x_wpdma_reset+0x85/0x2d0 [mt792x_lib]
>> [   29.648551]  mt7921_mac_init+0x248/0x400 [mt7921_common]
>> [   29.648558]  process_one_work+0x18a/0x340
>> [   29.648566]  worker_thread+0x256/0x3a0
>> [   29.648571]  ? __pfx_worker_thread+0x10/0x10
>> [   29.648576]  kthread+0xf9/0x240
>> [   29.648582]  ? __pfx_kthread+0x10/0x10
>> [   29.648587]  ? __pfx_kthread+0x10/0x10
>> [   29.648592]  ret_from_fork+0xf2/0x110
>> [   29.648600]  ? __pfx_kthread+0x10/0x10
>> [   29.648604]  ret_from_fork_asm+0x1a/0x30
>> [   29.648616]  </TASK>
>> [   29.648618] ---[ end trace 0000000000000000 ]---
>> [   32.847581] mt7921e 0000:04:00.0: Message 00000010 (seq 13)
>> timeout
>> [   32.847600] mt7921e 0000:04:00.0: Failed to get patch semaphore
>> [   36.047344] mt7921e 0000:04:00.0: Message 00000010 (seq 14)
>> timeout
>> [   36.047367] mt7921e 0000:04:00.0: Failed to get patch semaphore
>> [   39.247415] mt7921e 0000:04:00.0: Message 00000010 (seq 15)
>> timeout
>> [   39.247433] mt7921e 0000:04:00.0: Failed to get patch semaphore
>> [   42.447428] mt7921e 0000:04:00.0: Message 00000010 (seq 1) timeout
>> [   42.447452] mt7921e 0000:04:00.0: Failed to get patch semaphore
>>
>> sam

