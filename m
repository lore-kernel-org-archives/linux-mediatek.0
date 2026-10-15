Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99B2CC6B34
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2026 14:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wsNMQzzgvlWtCoxTSYtt92+3Z52KFEZCq2UStG5/12g=; b=Ua4KTDqLCyC33v0wTnnlNanWG5
	C7mKV0YxBsy+lnP72M25KSGsU9pFSZUVCHpLj52aFH8etlS49NltUUl5BMGGInJdpGBOlk7rjU3c5
	2sqW/++GqLHKQm6Qnq0c6FDXxmfT5pJBbJpBGXKGALldLvO6ZY02zEpOtPLhb7d8cw7SI2XwEsn7J
	fnqbMCUZJhAIOx+b246hqosjpECSDUhK/7z2joq0R0cOR99ewOWdU/CnvYo7pwmRiB+i6uQyx+cDA
	vx2jB3tpWeh3MdU7loVZ5jq8yZGOu3Q/9LnZUOc6rFpcIIVBeNL421Hw8RnOPFbWQhLqYYvc0DWWG
	xfPbxtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMHK-00000000LVg-2jru;
	Thu, 15 Oct 2026 14:17:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMHI-00000000LVX-1n4d
	for linux-mediatek@bombadil.infradead.org;
	Thu, 15 Oct 2026 14:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=wsNMQzzgvlWtCoxTSYtt92+3Z52KFEZCq2UStG5/12g=; b=Vsv1jryEFvdUVOvbXZIG9WpVCV
	szeu135rOhSqbMfNP65CGTBY5vqYfcpMGARA4kAUTWwwGd0oD8ThBTg6glPT18Jemi91siFaFZH9M
	1f6kMON18NvmzfqGke43VkjbheAN8rzfWd8NCcMjAo6rwxdm7f/1vz/iwxVCFo4Hs8DLUPTsyErQn
	3WrBzYg3VoB+dKzOux+kRvJ+3qNcKeiyuLAmT/E6c76NxxKbkNVjfkeUiiP0WYHUW/QZczDFENmbY
	c3lK+87ZW9atYc4/pQPwqXnHbs5GA+8uzhS1XbTd6qF/3727JKdhqVA/3z29RHEbZ1+ypLk1h4p+m
	snMafckw==;
Received: from mail-4319.protonmail.ch ([185.70.43.19])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHMHF-00000000Sdu-0ich
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Oct 2026 14:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1792073858; x=1792333058;
	bh=wsNMQzzgvlWtCoxTSYtt92+3Z52KFEZCq2UStG5/12g=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=unDSlsRoK4loq+SmgwC6Barc2X8GzYt2NMnfqJz5kE+cT74DQ50crF7nKrJkeQXQC
	 Ka8IvhJZbDeDGQEIsNmiDEYJaT9S78bDF+bm+rNSGCreyyOjWpeF3m+zCLBTtgta2N
	 AKZNQx5gCAtREBpBeOuIyk3ISZBW3hParige9oZ/2HGHjcBy1mW4kRoYhv9xEWbR3D
	 4/qgFNUehXPnu146PAKGRVcS3N7WbqaqlXx0FhA5iGj6BWxa24ksCnkbS5U3TKgomg
	 8VrEaumZAlhV/NCXpTplaFpznj/nBsvwxPTunDJh9D7l0ARBFC88tPNN/bePFfYUaP
	 5aysCwnFCVjnQ==
Date: Thu, 15 Oct 2026 14:17:35 +0000
To: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
From: overfion <overfion@proton.me>
Cc: Sean Wang <sean.wang@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: [BUG] btmtk: MT7925 (0e8d:e025) firmware ASSERT in sys_log_interface_emi.c #1185 during A2DP streaming, regression since fw 20260605184935
Message-ID: <aIInPl7g7dGa1ySgQwHytJmvMjs9REEFRg37v2cHI_wVJB7-yXeJyH6OHIGGkvJVxlmNBdBLmu5mh15kd16JgHUVeBktDvoaSBPelTrpXLU=@proton.me>
Feedback-ID: 45576258:user:proton
X-Pm-Message-ID: 0504454dd0ae47e7df29a6c9e60ef3e9e0b502df
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_151749_508871_B5522BB0 
X-CRM114-Status: UNSURE (   4.75  )
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

The MT7925 Bluetooth firmware on my laptop asserts several times per day
while streaming A2DP to a headset. btmtk collects a coredump, btusb
resets the USB device and the controller re-enumerates as a new hciN,
dropping the headset.

Hardware:  Lenovo ThinkPad P14s Gen 6 AMD (21QMS1HT00), BIOS R2XET42W (1.22=
) 2026-09-07
Chip:      MT7925, BT over USB 0e8d:e025 (WiFi on PCIe 14c3:7925, mt7925e)
BT fw:     BT_RAM_CODE_MT7925_1_1_hdr.bin, Build Time 20260813113236
           (t-neptune-main-mt7925-2249-MT7925_E1_ASIC_ROM_RAM_CE_2249_CCN16=
-20260813112803)
Kernels:   reproduced on Arch linux, linux-lts, linux-zen and CachyOS linux
           kernels, 7.0.12 through 7.2.9
Userspace: bluez 5.87, pipewire + wireplumber
Headset:   Logitech G435, A2DP sink, AAC codec
WiFi:      connected on 5 GHz (channel 48)

Firmware assert (identical in every dump I collected):

  <ASSERT> ../bluetooth/system/debug/sys_log_interface_emi.c #1185 - 0, 0x6=
454,
  0x1010707, 0xFF150001, BTSYS, id=3D0x0 idle, isr=3D0x943CA8, irq=3D0x3,
  lr=3D0x960AC8, asr_t=3D103074398
  ;etype:ASSERT, sp=3D0x2215A30, lp=3D0x960AC8
  ;exp_main: jump from cos_assert

A btmon capture shows no HCI commands from the host in the 316 seconds
before the assert, only A2DP ACL data (dlen ~530-555, every ~21 ms) and
Number of Completed Packets events. The assert fires in ISR context in
the firmware's log/EMI path, not in response to a host command.

Kernel side:

  Bluetooth: hci0: Mediatek coredump end
  usb 3-5.1: reset high-speed USB device number 5 using xhci_hcd
  Bluetooth: hci1: HW/SW Version: 0x00000000, Build Time: 20260813113236
  Bluetooth: hci1: Device setup in 1750899 usecs

Sometimes it asserts again seconds after recovery, followed by a
command timeout and another reset:

  Bluetooth: hci1: Mediatek coredump end
  Bluetooth: hci1: Opcode 0x2039 failed: -110
  usb 3-5.1: reset high-speed USB device number 5 using xhci_hcd

Regression: no failures on fw 20260414153243 (5 weeks, same headset and
usage). Failures started the day 20260605184935 was installed and
continue on 20260813113236.

Already tried, no effect: btusb.enable_autosuspend=3D0, mt7925e
disable_aspm=3D1, WiFi power save off.

I have 2 devcoredumps (~1 MB each) and the btmon capture (12 MB). I can
send them off-list, test firmware builds or patches, or collect more
traces.

Thanks,
fion


