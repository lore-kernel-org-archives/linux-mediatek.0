Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58CCC5AD4E
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 19:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kK/baEY+iyHIx6N7/Yc/rss5G3sNOiQswNXX/D/jPWM=; b=tTrXD+OOYL9AAmSh4wx6OrMaQ5
	BxS6I+Nj9/JPRbT4KzIkPsSn3UPI+Sy9icwda+AOmSgTr+C/sTx6DpiejWNHtf/xxgjE1Z56Np3/b
	fcBxDXzMYzvViBfTffgUGokSAsdYa5cNI2NodjdO7PpIW5y74/hWhosRtg7TZodMb1KR0RCi2uRxa
	UMaUpUQTBpOPUFN3S8OFDPA5SqPgKFz0NovSd+/6wzRiiXAnSeH5PlAX3nwlDk8O4VyLUWxyVyeZf
	e1EM+KwalEfEbV9JK00hO4DmuOHN2Dcb74oYu6Rm9j5uRnL6vxxvhjR1sm2KC4zYVaX4BWXVEK20C
	AWoSWlHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt8nN-0000000AbSd-16lL;
	Sun, 09 Aug 2026 19:02:53 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt8nK-0000000AbRs-22Ou
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 19:02:52 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so837498e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 12:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786302166; cv=none;
        d=google.com; s=arc-20260327;
        b=AOtRFyCRW5RvV5u0a+3l8A+BcLNKG7Z+t2oLZkWO34Wvcsp068eGlGu9TNhgmwPtKY
         1yAj4rRnXcLxbDNWgJtaX5A1oZRcLE59CDJiCoMrEGudoFPlQMjHtfiVShLcpG17/sR2
         3VFs3ktE8ThKYeeVnQKagYQJmHXVtN2WSoNh9lxu2GDkTRLxdx7PUkesn6s5T2p0Q4Ng
         mDr0tg5x8CfAuk4ubnWxlCahD4ygHRjVB70uLb3/6tP5XWf72o9TXazfBRiY0IMkJPpO
         xpGYl0xlJ0uxCaN59i/FU5MQ19wh+0TfjsUlnjkSfmD2TTZ6R0//wYHjEd5viK9Z5mQy
         ZQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=kK/baEY+iyHIx6N7/Yc/rss5G3sNOiQswNXX/D/jPWM=;
        fh=wcqEt7zPcua2Bq9P/4Ly3atgsuA5Q5iQd6iQsVu78Kk=;
        b=VutxiSkupxa9p5nN6ELU2GafRNKsMtIY3m59Eb+mrHU+t668HEPo72vPNiy1vTo1nR
         HWJHURNAEDRKc0SYQybVGJptRBHcWXNJr+LwXk/wmUHgoehVWce70ASsUwsb/Yn/dEAY
         S36KZl1WAta4oJ9k7X8lnoL5pNU+IJQsnQNk/Ga9UP5bXvxaa+iJGucKa0t1yUGqqEmh
         YcJLS92H2lYx0njjbCLzbfPhxAo9CQQKuCrHQJpI3l1YOOuRFj0hhyANt2ZhNIQGmu8H
         hM3s07U5NDVnIRJXLdxsdgmFFcyAuYTM6+mBuho7mHGOuiYAnd6Egd8jXugnQqgBFYG0
         QX7g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786302166; x=1786906966; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kK/baEY+iyHIx6N7/Yc/rss5G3sNOiQswNXX/D/jPWM=;
        b=Sp4rFA51rM0L0+KPfUNAH794ahrVCPdfbmSzuRdXo18sn5B6t6JJ3qXtN0usfyLYjV
         JlE4aiPaItppAeGWaGG4BDwxlI+tdXtUDfeuXdL1XGnh8Iqh3SdFZE8rOMlzKfZktK2N
         UModt01/fum4iLeMXlkkjKwrfr+gS45xjai7R3VDHuSaa7gra0nHYxBb48QLQ/loOJcd
         74pDw2ZDxu3Y7KtFiYHPIbt0alPaMz6bUqHeCsLsuyRDCqkCuiqrE2CMRPyOnqr8l0JQ
         Xl2AhBD9YIZ7RpHpSt6PA+1w8RtR6eDPpLxVxET3W23J0O0imEcyI7+XK1KrsFtsShfG
         gxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786302166; x=1786906966;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kK/baEY+iyHIx6N7/Yc/rss5G3sNOiQswNXX/D/jPWM=;
        b=qDVDdxD7rZA0dfLAEjCZXtczIOrjgeEcqAEdbsWfMJtmG9Jq59FAW5dq+5+yd/ZhRL
         varGYVMWUylB61I7UWSKWEVpM0kpYzkJh6vfi2Hf9OkvzaSes9ki4SqXmTI0DbGydBXe
         1UuRdxCjt+/tUmC1Zj6ACUtTRiNvQ1Vtl7DrcRJITfH3BUog9NI6AKzWiBml39nxuMaM
         gnJJU+0wi5xnrPCmrl6UDbTOtcBakcDAWpTB1e66IQ2P/23hv2eN4mJbFLgvNZ8Lx8QR
         /czxPCVTArhpHrlIyf0IsoHh4Lh2QaUcYlIaM8LGNQCrO317CcFJHjlZS+t9LWUwongs
         yOFw==
X-Forwarded-Encrypted: i=1; AHgh+RomT67B8qr2sy1dcOwFJ6tCHqduyar3stjEAPRthJBnT68vSF3Rurp9CBedg3u0JyJNqPKnTMIVOdamr4jrLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzH577dDsOYmI/tFyRoJmtvdOivrKrwLkxxofO8T/DK7k1njeun
	RPwyfxJq/V7hPXAbHDtOlWhwqmxbFVoeqDy2mwyYTiRU7tvnpvGA4TRUGb8rb+pXXpFLYv3rmrS
	1i+kHtbRPi8+tLXC4xEU839VfUjzjzCQ=
X-Gm-Gg: AR+sD11XIfUzN7/aIK59i4aiE3tqGnfSVqFZedvisT36kf+NgMKoOFzg6w2lFrWxKyg
	vZ07PJY3nBcVKn2eCzxXf0+SZ1l7keXuxe68ecKOyf7GvFtkpRyelHD87ObTEMr8wFuZTZx7tas
	i3DRjE4KUZCZPOTQeuvYzD87CTBD17xRUGGAEW0R/aXHE2y9HkU45MxFTPa0bL7ygUN76FoCrgn
	Iy+7AMgfWVWLqN5JqbrpRJZHx9+DP2/B6IB8ffCsa1AGmbtG01udeMUOPnaTBPzH5nv0Gl2rpmP
	J9+y6iTvLsD4Sa+Wjx/6UTMZZrREIEGROvZEoPXiy9uFSOPtkI1TygzlpVHEtAwfnabqjZhkJ8p
	cQJiBSLgGE6pHIks=
X-Received: by 2002:a05:6512:39ce:b0:5b3:e02:b398 with SMTP id
 2adb3069b0e04-5b30e02b54dmr1231733e87.44.1786302165841; Sun, 09 Aug 2026
 12:02:45 -0700 (PDT)
MIME-Version: 1.0
From: Jason Zeng <jasonzeng2009@gmail.com>
Date: Sun, 9 Aug 2026 12:02:34 -0700
X-Gm-Features: AUfX_mw0GrRobnvOBwc7j3_1MvOf25PTcnqEU1bZx91zZ2QtvD_WMJ9uPQSXbOk
Message-ID: <CAMe_HMpLsGEgW=1i6W6od_ADpEEDoMVgfNQ-4rWW==J=QNNPtQ@mail.gmail.com>
Subject: wifi: mt76: mt7925: false-positive hard rfkill on MSI Vector A16 HX (MS-15MM)
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>
Cc: Allan Wang <allan.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_120250_576791_6B706EE7 
X-CRM114-Status: GOOD (  11.95  )
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

Since v6.16, mt7925 Wi-Fi is unusable on the MSI Vector A16 HX A8WHG
laptop (board MS-15MM): the interface is reported as rfkill
"Hard blocked: yes" on every boot, and the block cannot be lifted from
software. Windows on the same machine works normally. I have traced
this to a false-positive hardware-rfkill report on this platform and
verified experimentally that the radio is actually functional.

Hardware
--------
- Laptop: MSI Vector A16 HX A8WHG (DMI: sys_vendor "Micro-Star
  International Co., Ltd.", product "Vector A16 HX A8WHG", board
  "MS-15MM"), BIOS E15MMAMS.104 (07/28/2025), EC 15MMIMS1.101
- WLAN: MEDIATEK MT7925 [14c3:7925], subsystem Foxconn [105b:e138]
- Kernel: 6.18.42 (also reproduced by other users on Arch/Fedora/Mint
  kernels >=3D 6.16; kernels of the 6.12 LTS era are NOT affected)
- Firmware: linux-firmware 20260622, WM firmware build 20260605184805,
  HW/SW version 0x8a108a10

Symptom
-------
- mt7925e probes fine, firmware loads fine.
- As soon as the interface is brought up, rfkill flips to
  "Hard blocked: yes" and the interface is taken down. The block
  persists for the rest of the session.
- NetworkManager logs "Wi-Fi now disabled by radio killswitch" ~1 s
  after activating the device.

Analysis
--------
Commit e54b870212c0 ("wifi: mt76: mt7925: add rfkill_poll for hardware
rfkill", first in v6.16) added:

  __mt7925_start():
      if (phy->chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN)
          wiphy_rfkill_start_polling(mphy->hw->wiphy);

  mt7925_rfkill_poll():
      ret =3D mt7925_mcu_wf_rf_pin_ctrl(phy);   /* MCU_UNI_CMD(RADIO_STATUS=
) */
      wiphy_rfkill_set_hw_state(hw->wiphy, ret =3D=3D 0);

On this platform the firmware advertises
MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN, and the RADIO_STATUS query
always returns 0 ("RF pin asserted"), so the wiphy is hard-blocked as
soon as polling starts. However, the pin state appears to be a board
wiring/EC defect on this MSI model, not a real kill switch: the radio
demonstrably works, and there is no airplane-mode state that can clear
it (toggling the airplane key, BIOS reset, EC reset, cold boot, and a
Windows full shutdown were all tried by various users without effect).

Experimental verification (on 6.18.42)
--------------------------------------
1. Fresh "modprobe mt7925e" with the interface left down:
   rfkill shows "Hard blocked: no".
2. "ip link set wlan0 up": rfkill flips to "Hard blocked: yes" the
   moment polling starts. Scans return nothing because mac80211
   immediately downs the interface.
3. With a one-line test patch disabling the poll registration in
   __mt7925_start() (rebuilt mt7925-common only, same kernel, same
   firmware): the interface comes up, "iw dev wlan0 scan" returns 19
   BSSs, and NetworkManager can connect normally. The radio is fully
   functional despite the firmware reporting the RF pin as asserted.

So on this platform the new hardware-rfkill support faithfully reports
a bogus pin state and disables a working radio. The Windows MediaTek
driver evidently ignores this pin on this machine, and kernels < 6.16
worked for the same reason.

Community reports of what appears to be the same issue (multiple users,
multiple distros, since around Dec 2025):
- https://discuss.cachyos.org/t/new-laptop-with-mt7925-wifi-adapter-being-h=
ard-blocked-rfkill/23872
- https://discuss.cachyos.org/t/getting-wifi-to-work-on-msi-vector-a16-hx-a=
8whg/27772
- https://forum-en.msi.com/index.php?threads/wifi-hard-blocked-on-msi-vecto=
r-a16-hx-a8whg-linux-ubuntu-24-04-acpi-bios-bug.418090/

(One user in the second thread reported to linux-mediatek earlier this
year; I'm adding the root-cause analysis above.)

Possible fixes
--------------
Would a DMI-based quirk (or a PCI subsystem-vendor/-device based one,
[105b:e138] on this board) that skips wiphy_rfkill_start_polling() on
affected platforms be acceptable? Alternatively the poll result could
be cross-checked before hard-blocking (e.g. ignore a pin that is
asserted from cold boot and never changes state), or a module parameter
could allow affected users to opt out.

I'm happy to test patches on this hardware and to provide any further
debugging output (full dmesg, MCU traces, ACPI tables =E2=80=94 note this
BIOS also has duplicate \_SB.PCI0.GPPA/WLAN power objects that ACPICA
rejects with AE_ALREADY_EXISTS at table load; that turned out to be
unrelated to the rfkill issue, but I can share the tables if useful).

Raw data
--------

lspci -nnk:

  05:00.0 Network controller [0280]: MEDIATEK Corp. MT7925 802.11be
          160MHz 2x2 PCIe Wireless Network Adapter [Filogic 360] [14c3:7925=
]
          Subsystem: Foxconn International, Inc. Device [105b:e138]
          Kernel driver in use: mt7925e

Driver probe (dmesg):

  mt7925e 0000:05:00.0: ASIC revision: 79250000
  mt7925e 0000:05:00.0: HW/SW Version: 0x8a108a10, Build Time: 202606051846=
51a
  mt7925e 0000:05:00.0: WM Firmware Version: ____000000, Build Time:
20260605184805

Typical boot (journal):

  NetworkManager: rfkill1: found Wi-Fi radio killswitch
    (at /sys/devices/pci0000:00/0000:00:03.2/0000:05:00.0/ieee80211/phy0/rf=
kill1)
    (driver mt7925e)
  NetworkManager: manager: rfkill: Wi-Fi now disabled by radio killswitch
  wpa_supplicant: rfkill: WLAN hard blocked

Experiment, unpatched 6.18.42 (phy index varies across module reloads):

  # modprobe -r mt7925e && modprobe mt7925e     # interface left down
  # rfkill list
  2: phy1: Wireless LAN
          Soft blocked: no
          Hard blocked: no
  # ip link set wlan0 up && iw dev wlan0 scan   # scan returns nothing
  # rfkill list
  2: phy1: Wireless LAN
          Soft blocked: no
          Hard blocked: yes

Experiment, same kernel/firmware with the test change below:

  # ip link set wlan0 up && iw dev wlan0 scan | grep -c '^BSS'
  19
  # rfkill list
  3: phy2: Wireless LAN
          Soft blocked: no
          Hard blocked: no                      # stays unblocked; NM
connects fine

Test change used for step 3 (diagnostic only, not proposed as the fix):

  --- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
  +++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
  @@ __mt7925_start()
  - if (phy->chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN)
  + if (0 && (phy->chip_cap & MT792x_CHIP_CAP_WF_RF_PIN_CTRL_EVT_EN))
    wiphy_rfkill_start_polling(mphy->hw->wiphy);

Thanks,
Jason Zeng

