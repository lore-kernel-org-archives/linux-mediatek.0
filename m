Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4B3CD4F3C
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 May 2026 23:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oQMlYsX+VgifZz5u10HC4ZEMVQVuCOrZ67vfrQ1RB6s=; b=tiuthUz2ZMF2AEIMpGYQ0Dpt2p
	YRRsM+3DFyCiOFMvNnGykLoNw55ZJf0XiYiamv6Z3bOWVpKogl3jVp5/vMSI/JvOO9PN6yK3Os4wN
	K1IQ0lI9UoF3ag07k8ou7M9V6ddvWS4VRp1RehMOpv1FlIRDc8KIPfgkWadx5pe3ikHQoU82ekijR
	bYuX/hkeFmM0ackDwCJrykk3cqUOj/tmwStpcfCyzL3aA38rhPRL3NvVVDx6WQw5TlmLP8W0B5VfG
	1R1w4kZD7gG1c07Eoeg03zZPA2Loj7q/NsXpR9QLNcnB/zc6+LRVdRuGj1nB/pwYSXOxIffJ8WlQ3
	DHH0g7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOkrV-0000000Detg-1nQr;
	Sun, 17 May 2026 23:25:33 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOkrS-0000000Det9-1kRe
	for linux-mediatek@lists.infradead.org;
	Sun, 17 May 2026 23:25:31 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2ee990e8597so5064845eec.1
        for <linux-mediatek@lists.infradead.org>; Sun, 17 May 2026 16:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779060329; cv=none;
        d=google.com; s=arc-20240605;
        b=g4ISV0alNIVqhzhm9XnlCGb6HpOrBxiWnXsOf6418jwUvXSEMfs/ia0psDYZDMvrIu
         /ufI5BVNNhpOPw5L9k3Z13lXTwJiueJXnuM3TwAaCZ4AZpB3K+/7CyHCNtJ2effmoZjO
         46HsXKO5ay2nz6ypP8/qk6tq/Z0mxSbjjdGzCRbPOPKdhQpm+7zI8TZPrPZmD7BOWhug
         aUpQjEym6HUb+v/5b1bl/GwvFQUBeBvo2JD/J1XNjmlgHqOqzcm7P9tkpC4blZCLBkQ6
         EA7Vaxd4G9dHpkSDzSRW41Is8C4lAoh77u8Hb9Zm0VpddlC9sek8tU7ocVOF7zCxl6B9
         j4hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=oQMlYsX+VgifZz5u10HC4ZEMVQVuCOrZ67vfrQ1RB6s=;
        fh=1Qp7oPrxMA/4RJrFo/yHTrxW+R6roj/u2mcJvvcQZFU=;
        b=FUPX4XFomfGxtVeYWBJ53DhM16KB2ksG0LOEcjBiPdcfrKJCsR54U27iMx0xBEEDAc
         M7wuT95XnYxFRrZb2/xnBIPtQmbK9pC35ymtvTQLh3027ozV4ne9nbWnVH9pCtmS2FDf
         0EsHbbnEE00p35DKdjA1Lm5ZaN2JDN7bI9lOK1LNbuZokUftKY+kjD1iA9zb/r+VvRyE
         2n7j1wnCQelY2sqOujurI/nmdH88JqdOHY6NpaHua9zjW3tRNRieeEri9HhxxMWVoybi
         lG28mj9yPgALlMP0X3YoIhqL7ALReqBxgxQFd2vM01DADTcg/H++hog9ogf2J/9RLC/Y
         d9Tg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779060329; x=1779665129; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oQMlYsX+VgifZz5u10HC4ZEMVQVuCOrZ67vfrQ1RB6s=;
        b=iTSnBHmyC16KcpnQm6xaWf0BA/+QfA/pMsqWiyPXQf7PnbnMRUJhcB8hboTn5k8Yo/
         jPu2GIeSpvEQVHj5I2m+lSZzJsgEr17SD4JmdryTCaqRydBp6nCb9/fbhJSVqpKl4+WG
         bhlrX7eT1/m7PDI2c8tlc/tSOI7YjYhXqB2O2AmBqhu6+aSfxvlIb25A7VieelXfH8NH
         9uiJLx0YRiCuwsOx4805TWM6Zu+1scvsiF+4HjgfCMBAT7/Bp9X6Xj98I7sR5iEBbzLv
         dmrHM9rzf2WyUeU4hJq8TCuH4bY8ad4jAI9LZrB3IDrNUTN7od6NnpMc+oIkFwYN5F8I
         gahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779060329; x=1779665129;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQMlYsX+VgifZz5u10HC4ZEMVQVuCOrZ67vfrQ1RB6s=;
        b=TIwcxyXwtFZW41c1vuqYLQmK8EjiEijAgBzyidI9C+BqC88QPpRCP0w2lYKuhKFKRL
         Y2G+ftpC9OPoMCcpXHRLO5s9wrVoQavDC7VbqZLOy/2SSobLX2kVXYBwuSqrP4NunHAi
         GYcQv/Cy7nxFUdj5ejFcGLvQSJtCTQF/6PRGOfvPWFNLK7RLg2aTQMh8l++yQpcclO9u
         +zTsW/7iT4n62pk33l9yKKHd+++KjjQauL4UVAGXJB+OVaQrl7nKR+seDB/J51xQEi8q
         p8Ol8jse9NdLC23R/N+zDGjx3jCSMtTHswyiSyeRInbH76yDtkVfQcV7mnGBWYewSGnU
         lFCg==
X-Forwarded-Encrypted: i=1; AFNElJ/n8bFTDIEG895gvSC0n7Qq3QX2FYkmKaX0Zjp7jj9vokY3e2i+WH+Jp7LC+tvygjrTpuE/rzANVF0aMVbyTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwY4ihU1LfxXad/HX1HVQbSlNCPRiLJanmg69ZRsSMsSvVFsKKP
	bEm0QxRIHdp5Nyt8JwQCqCu9rL5DwjnKxGbMXcf/Yr8p4q8+vPrX0fhWK1fT61waoylp5iChVBt
	KJ+6bwjq8VAM8cX6vL+77XTvBb/iCV4E=
X-Gm-Gg: Acq92OEbuBqxKqgzEQnCvhcpRyaHIbpaBmzOiuWagVGrWzwnxVhv3JCsJHNLGszghic
	uXpRleC2Fg1DBezfmFkRb1O4+KkxJWhQhd0kIMgBAGNBTk3z6AOvQJxZXHXxT+Fa5OmTzAUA8ar
	HWwA1mI+NQwgqW3OHaW+Y0S4bCXJl0G9ZS4za1DDkQUpPVAIaNJrk9AX+Lvy9TvjswmqW2GbvsP
	4PlLudrHgaP9d7ttQu34l6vvJNi6H0Xb0aAIFidnsEKePCPWYusyj3YnrvhtZz0c2XjILR5yrEs
	IedUvVoHPya9nVRf+UlGOdLW+9ZW+BVhRJKAIkhM
X-Received: by 2002:a05:7300:e125:b0:2f5:6d9c:7156 with SMTP id
 5a478bee46e88-303986814f8mr6045988eec.17.1779060329249; Sun, 17 May 2026
 16:25:29 -0700 (PDT)
MIME-Version: 1.0
From: Brandon Arnold <brandon.arnold@gmail.com>
Date: Sun, 17 May 2026 16:25:17 -0700
X-Gm-Features: AVHnY4InOi6pS-JhDeB7XWvzVJUHUwJqjaT6X2kyEDvJ9oU5Qy6fDU_IKgrEFzo
Message-ID: <CAM07e=vYJE8khJmbsn75SOYye44o8YV8TZsRyF1mFRuUTMCgUw@mail.gmail.com>
Subject: [REGRESSION] Bluetooth: btmtk: MT7922 "Failed to send wmt func ctrl
 (-22)" after 634a4408c0615c ("validate WMT event SKB length before struct access")
To: linux-bluetooth@vger.kernel.org
Cc: luiz.von.dentz@intel.com, tristan@talencesecurity.com, 
	chris.lu@mediatek.com, linux-mediatek@lists.infradead.org, 
	gregkh@linuxfoundation.org, stable@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_162530_464680_A7EB1506 
X-CRM114-Status: GOOD (  12.39  )
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

#regzbot introduced: 634a4408c0615c206885e60ea05f489c426f64b6
#regzbot title: MT7922 BT controller never registers (wmt func ctrl
-22) after btmtk WMT SKB-length validation

Hello there.

I wanted to report the below information about a commit that I
confirmed broke my MediaTek MT7922 adapter. The commit is also built
into the main Arch Linux package, so it affected me during a routine
update (see the BBS link in the report below). This adapter is the one
that came with my Framework Laptop 16 system.

Apologies for Claude's verbosity and language but I can confirm I
attended the bisect and revert of the offending diff. Thank you!

Workaround in use: pinned to the Arch Linux pre-7.0.7 kernel.

Thanks,
Brandon Arnold

Commit 634a4408c0615c ("Bluetooth: btmtk: validate WMT event SKB
length before struct access"), backported to 7.0.x stable and shipped
in v7.0.7, breaks Bluetooth on the MediaTek MT7922: the WMT function
control step fails with -EINVAL and the HCI controller never
registers. WiFi on the same chip (mt7921e) is unaffected.

This is NOT a v6.19->v7.0 mainline regression -- mainline v7.0 is
GOOD. The regression is the above commit specifically; it is absent
from v7.0 and v7.0.6 and present in v7.0.7.

Scope / affected versions
-------------------------
- GOOD: mainline v7.0, linux-stable v7.0.6 (commit absent)
- BAD: linux-stable v7.0.7 (commit present)
- Independently reported on Arch (different machine -- Lenovo
IdeaPad, MT7922 USB [0489:e0d8]): BROKEN on linux 7.0.7.arch2-1,
WORKING on 7.0.6.arch1-1, identical symptom.
https://bbs.archlinux.org/viewtopic.php?id=313561

Hardware / firmware (primary reporter)
--------------------------------------
- Framework Laptop 16 (AMD Ryzen AI 300 Series), board FRANMHCP09 A9
- BIOS: INSYDE/Framework 03.04, 2025-11-06
- MT7922, PCI [14c3:0616] subsys [14c3:e616]; BT side USB, driver
btusb/btmtk; WiFi side mt7921e (works)
- linux-firmware 20260410; BT firmware BT_RAM_CODE_MT7922_1_1,
HW/SW Version 0x008a008a, Build Time 20260224103448
- bluez 5.86

Symptom
-------
The firmware download and version handshake still succeed (identical
HW/SW version line before and after), then:

Bluetooth: hci0: HW/SW Version: 0x008a008a, Build Time: 20260224103448
Bluetooth: hci0: Failed to send wmt func ctrl (-22)

No "Device setup in N usecs" follows; BlueZ reports "No default
controller available". hci0 exists in /sys/class/bluetooth and is not
rfkill-blocked. Reproducible deterministically on cold boot,
`modprobe -r btusb; modprobe btusb`, and full USB unbind/rebind. It
fails even with btusb enable_autosuspend=0, so this is distinct from
the known func-ctrl/autosuspend race.

Analysis
--------
634a4408c0615c reworks btmtk_usb_hci_wmt_sync() to validate length
with skb_pull_data() before casting the WMT event:

- wmt_evt = (struct btmtk_hci_wmt_evt *)data->evt_skb->data;
+ wmt_evt = skb_pull_data(data->evt_skb, sizeof(*wmt_evt));
+ if (!wmt_evt) { ... err = -EINVAL; goto err_free_skb; }
...
case BTMTK_WMT_FUNC_CTRL:
+ if (!skb_pull_data(data->evt_skb,
+ sizeof(wmt_evt_funcc->status))) {
+ err = -EINVAL; goto err_free_skb;
+ }
wmt_evt_funcc = (struct btmtk_hci_wmt_evt_funcc *)wmt_evt;

For the FUNC_CTRL response from the MT7922, one of these
skb_pull_data() calls returns NULL and the function returns -EINVAL
(surfaced as "Failed to send wmt func ctrl (-22)"). In effect the
length the driver now requires
(sizeof(struct btmtk_hci_wmt_evt) + sizeof(status)) exceeds what this
controller actually sends for FUNC_CTRL, so a valid handshake is now
rejected. The pre-patch code cast and read the same bytes without the
strict length gate and worked on this hardware.

Empirical confirmation (mainline, no distro patches)
----------------------------------------------------
Built faithfully from the running Arch config (only LOCALVERSION
added); no out-of-tree changes.

- mainline v7.0 : GOOD (commit absent)
- linux-stable v7.0.7 : BAD (kernel 7.0.7-bisect; WMT func ctrl -22
count = 1; hci0 device setup never completes; bluetoothctl shows 0
controllers)
- v7.0.7 + revert of
70d37a8b9229 (the 7.0.7
backport of 634a4408c0615c): GOOD (kernel
7.0.7-bisect-00001-ge33bfb5d7480; WMT func ctrl -22 count = 0; hci0
device setup OK; bluetoothctl shows 1 controller)

The reverted tree's drivers/bluetooth/btmtk.c is byte-identical to
v7.0.6 (git diff v7.0.6 -- drivers/bluetooth/btmtk.c is empty), so the
v7.0.7-vs-revert pair isolates exactly this one commit.

Reproduction
------------
1. Boot a kernel >= v7.0.7-equivalent on MT7922 hardware.
2. `bluetoothctl list` -> no controller.
3. `journalctl -k -b | grep 'wmt func ctrl'` -> -22.
4. Revert 634a4408c0615c (or boot v7.0.6) -> controller registers.

A straight revert restores operation and is offered as the candidate
fix; alternatively the length checks should be relaxed to match the
MT7922's actual FUNC_CTRL WMT event length. I can test patches, or
provide full bad/good kernel logs, btmon/hci traces, and the exact
short SKB length on request.

