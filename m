Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019FFCD3439
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2026 23:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xUu/T2ghLNEjslGMq1SHR6tUY57TBC3vo5/ckBQOZ+w=; b=PK2Z2D3xjdpWNermpHzC5EMdCb
	CJhAG9lL3rrmg7+cFHnymAere15Ic0Ean2125yUNDz9TP624rsQbuUszk2lLRAxXTGykFdbs8la9f
	3QZ/WQ4Phjn8eQY9aCOsuvIO0ADiVSgQst7+lfjSjnDWe8V8R2rIfXrcrw++NNgdowlQ03Ir+yQYd
	gxBigskPfEj+caJFqUA7IhFpc5LpJX3uBtxAu6C2PyVO34KwVe79CPXGWZht846zTUlvmrn2tNOhw
	ry8IYpXPJFgBL+/M/QiD+w3iy0BchLv4tQhI0RboiMT8aUk7UuavpFCD7N39+NqrQGzrb3rP2fHIs
	Rq+d6dXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKm1C-00000002JEb-149e;
	Wed, 06 May 2026 23:51:06 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKm1A-00000002JE4-39P4
	for linux-mediatek@lists.infradead.org;
	Wed, 06 May 2026 23:51:04 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5a8891febd2so193799e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 06 May 2026 16:51:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778111462; cv=none;
        d=google.com; s=arc-20240605;
        b=Xfsj3ZHvP5grrK4D56zvJf5Jonangm10nxfGSmz8UbKbCPh4SpgW2IiAejCSQ03+TU
         PBIsj/UrJWGqJKFThxQwE82PVjWJ8xp2m0hOGpjCT9NRf6PZePGJ4o9VAQT3qaJrxsE6
         2yuLkX57FLedN/vKOTo8I9ratUqIK8m/Q1v6A47j00Zj7R6dvRmOZ2cntzNeUffLsVC8
         T/UkDK0GOs21C6Az6Hoy/4dM000XPAOjwLbEADGQvk5DySdbCMp/PRysiYKypqt7lSky
         LKRWqn/Q/lTZNd7+ek+pO7/KmBAN5isl9NjLJQJtIoJ4IMqvQFdES+OuaZqdbIFwpajC
         MyXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xUu/T2ghLNEjslGMq1SHR6tUY57TBC3vo5/ckBQOZ+w=;
        fh=VNaEs4UO1k1hXjJiaHgDIiqI/Ol+NWuuwGcE5/rgCNA=;
        b=LZRSFImILR8cn6GUzllaKd6Ya8lLBDHW23Dyn8KBTTg/Ymo4daw9z2S43sJUfLpl+N
         pClhSjtfktKNJzQOhjm+WvjbXXsYokTKqKvY+9fCR8+Vs4jQDHFNLKtBe+kAaTksScB0
         JcTA5+on184GsAHklu7l7Tt3amJbJAdXsHqWQljG3puVL2Xo55RoTL5tRMrU9SS2FLir
         UU23DrJFkB9g/fGkNJNFJZ1SAKFzOeDXgXt5r9DgTBIaFrIkYG9aHRUA6ibVXTk3qTuN
         o14HaJ3oYv9VozTfnJB6ybM9VLnK9tD3xNbGtD/XfYT03h8lWn6XnE/SjR+rADjZR4nT
         wQ9Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778111462; x=1778716262; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xUu/T2ghLNEjslGMq1SHR6tUY57TBC3vo5/ckBQOZ+w=;
        b=AGAZvJ608KjXGCXcoCDpRmAh1K6qSyaHuc/qRJXuAQDgCoEJ6kjQK7ExCA7cNqu3cZ
         14MNMesfdPS3ErIvW/fYh1qU+lJDVeBqhznnMZygVSatg/u3lzO5ouWy/l+VAeJvH/Kk
         bvj0prIlFmhb1sCizJMSf9fM+2C27I1rrfajcvlCW/vNWcAfsWVeUVHGgzgxTiZqxXuS
         dApsXEbrgdfnwUhx/SlMM6USYk87eItoDz201iTSce3TzkZ3D3p0yO9wKfPYnBJneUZ3
         LgG7OvPwjFdCKct2fh+//Dc9vWQbOw+9MyR20IQ4YR5CqOw2gkyQ+XVx0jc0TfI0wGkT
         Zamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778111462; x=1778716262;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUu/T2ghLNEjslGMq1SHR6tUY57TBC3vo5/ckBQOZ+w=;
        b=QlxifHpO+Q1W0TAiF2KEpsjVPPPy9l0RPk9gaAsiT///f+W0Uh2mL2e5P9lKdF1R0Z
         2sn/VRdwVydhDxsCKeuTPnKw+EjZ1nCnCGNCd8to2w4H+zWpq3cd8dvkIHYUY+5ul1Bw
         8c7XVWvYsUmPgC4tUKGEjaNeARIxOdnvcyig6zdDEiXcN+NlhnOPZUZNDGSv2+2reO8o
         y5UChwM5N46phbI9am29or3+FBv7Llk8am3hILDBZF1Ehv68CBJgRC+uitTdJZ7BTCPY
         cEImFEIzF06e48m2dH3JSDtkeA0i4syqB2I8ExnU2vXYlRIwmU7iQ0In6sACrWvljUdL
         vYUw==
X-Gm-Message-State: AOJu0Yyeobr6UeaIe1H5NgHSiR6WXuWsMg1+zd99lBtYY3nSyFv4xP8z
	JZXzOgGcoO9Zxr4Yq47p5KVnLn2MjKZPkD95ynXsBXQjNfhaPH424ptDaz5VpVlD3uNufPR0wjF
	4J7jFzBcrjnAicacBANT1fAMEQGwdw8M0ceGt
X-Gm-Gg: AeBDievwAmaD5wjpJHN2RuhnQPNJva0A2dDnnCte9Gm9qewX2fSD28l2oLOlNrmWU9e
	VmQ9WGZdMBWHP80qU1wswd4u8eBNMuNKVqxXHk+Yz45dtFuKLNJXtAFWjvL8RNw0hakvQB3mQiE
	k8KT8ufEbH3M8qZps0Oj7KLPbN6ptmv7Lh/z8B094lUOr3ySEbgb/zZ2zeh9rBT6fElZynUW5+S
	BjXmPWxY6mHRX1sPVWZoth367ktyIt+UtqxwWpD1+4zD+7JdtzRLfLd+xeH8F4xhhiD1s/dzMkJ
	BgCYVgaN3zSvOF2TWA==
X-Received: by 2002:a05:6512:1389:b0:5a8:7f52:62d1 with SMTP id
 2adb3069b0e04-5a887ada968mr2423489e87.1.1778111462091; Wed, 06 May 2026
 16:51:02 -0700 (PDT)
MIME-Version: 1.0
From: John Henry <jshenry1963@gmail.com>
Date: Wed, 6 May 2026 19:50:50 -0400
X-Gm-Features: AVHnY4LSJ6brkES7aR5l3ozN1EAWR3kAPHuDmDuS8GZ74Jd143xkxDa32vQTY2Y
Message-ID: <CAN6xzWeKNrQ_WfCQnM7C2ggy86uAwpp7nDEPatdfOEKN_8+reQ@mail.gmail.com>
Subject: mt7921u: monitor-mode per-channel retune emits narrowband RF burst
To: linux-mediatek@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_165104_842711_C8AC84AD 
X-CRM114-Status: GOOD (  16.34  )
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

We have isolated a reproducible RF emission from MT7921U (MT7961
silicon) that occurs only when the device is in monitor mode and
being retuned across >= 5 distinct frequencies. The same chip in
managed mode, retuned across the same frequencies via the kernel's
scan API, produces no such emission. The behavior is reproducible
using only stock iw commands - no custom code is required.


Environment
-----------

- Adapter: multiple mt7921au-based adapters tested (custom in-house
  board and retail ALFA AWUS036AXML); identical behavior on both
- Chipset: MT7921AU, ASIC revision 0x79610010
- Kernel: 6.1.0-40-amd64 (Debian)
- Driver: in-tree mt76 (mt7921u.ko), module timestamp 2025-09-20
- Firmware:
    WIFI_MT7961_patch_mcu_1_2_hdr.bin
    WIFI_RAM_CODE_MT7961_1.bin
  HW/SW Version: 0x8a108a10, Build Time: 20241106151007a
  WM Firmware Version: ____010000, Build Time: 20241106151045
- Regulatory domain: US
- runtime-pm = 0, deep-sleep = 0


Reproduction
------------

Setup (monitor mode):

    IFACE=$(iw dev | awk '/Interface wl/ {print $2; exit}')
    iw reg set US ; sleep 1
    ip link set "$IFACE" down
    iw dev "$IFACE" set type monitor
    ip link set "$IFACE" up

Reproduction loop (this triggers the emission):

    FREQS=(2412 2417 2422 2427 2432)   # five 2.4 GHz frequencies
    while true; do
        for f in "${FREQS[@]}"; do
            iw dev "$IFACE" set freq "$f" HT20
        done
    done

With a fast spectrum analyzer (real-time / FFT-based), a narrowband
RF burst appears at the tuned channel on each retune. There appear
to be several bursts around the channel of varying strength.

The same loop with four frequencies (any subset) produces NO emission:

    FREQS=(2412 2422 2462 2484)        # four frequencies
    # ... same loop ...                 # no emission observed


Emission characteristics
------------------------

- Narrowband peak, ~800 kHz wide at the base, with skirts that
  fall off toward the noise floor and reach approximately the
  full 20 MHz channel width.
- Amplitude: -30 to -50 dBm measured over-the-air at close range
  with a fast real-time spectrum analyzer. Most around -40 dBm.
  Sometimes stronger. Usually stronger than normal WiFi signals
  from other standard WiFi connected devices within feet.
- Brief, on the order of hundreds of microseconds (not precisely
  measured). Too short for full OFDM spectral shape to resolve
  on our analyzer.
- Appears in 2.4 / 5 / 6 GHz, with band-dependent amplitude
  consistent with per-band PA characteristics.
- One or more burst per retune. Tick rate scales with retune rate;
  presence/absence is independent of dwell time (50 ms to 5 s
  tested).
- Independent of which specific frequencies are chosen: any 5
  distinct frequencies reproduce the behavior; any 4 do not.
- Reproduced in an RF-quiet shielded environment with no other
  802.11 / Bluetooth devices present.
- Identical behavior on multiple adapters (custom board and several
  retail ALFA AWUS036AXML), ruling out board-specific layout effects.


Mode dependence
---------------

The emission is monitor-mode-specific. We tested multiple paths:

  monitor mode + per-channel "iw set freq"  -> emission present
  monitor mode + SIOCSIWFREQ ioctl          -> emission present (same)
  managed mode + "iw dev scan freq ..."     -> emission absent
  managed mode + "iw dev scan ... passive"  -> emission absent

The kernel-driven offloaded scan path (NL80211_CMD_TRIGGER_SCAN)
on a managed interface does NOT exhibit the emission, even when
sweeping the same set of >= 5 frequencies repeatedly. This
strongly suggests that the firmware's scan path is using
different RF logic than the per-channel-set path used in
monitor mode.


What we have ruled out
----------------------

- Not transmitted as a 802.11 frame: a second mt7921u in monitor
  mode placed nearby does not capture any frame from the test
  adapter's MAC during the emission.
- /sys/kernel/debug/ieee80211/phy0/mt76/tx_stats counters all
  remain zero during both 4-frequency and 5-frequency monitor
  mode sweeps.
- fw_debug=1 produces no mt76-related dmesg output on our build;
  the firmware does not log this event via the standard debug
  path.
- Not active monitor / ACK behavior: explicit "iw dev set monitor
  none" does not suppress the emission.
- Not a USB transport issue: the only USB-related dmesg activity
  during testing is unrelated xhci_hcd HCI errors that are
  present whether or not the test is running.
- Not active scan probe TX: "iw scan ... passive" with managed-
  mode interface produces no emission, confirming the absence of
  managed-mode scan emission is not just probe-request elision.


Hypothesis
----------

Given that the emission is real PA output (visible amplitude on
external instruments, not visible to driver counters or peer
captures), is monitor-mode-specific, scales with retune count
rather than dwell, and triggers only above a small fixed
threshold of distinct frequencies, our best guess is that the
monitor-mode per-channel retune path triggers a per-channel
firmware operation - possibly a TX or PA calibration/trim
sequence - which is suppressed or differently scheduled in the
offloaded scan path.

The threshold of exactly 5 (any 4 channels are silent, any 5+
emit) suggests a firmware-internal cache of size 4 with cache
miss triggering recalibration on revisit. We have no direct
evidence of this; it is an inference from external behavior.


Questions
---------

1. Can anyone confirm what firmware operation is triggered by
   the monitor-mode per-channel retune path that the offloaded
   scan path avoids?

2. Is there an MCU command, debugfs knob, or driver flag that
   can suppress this firmware operation when the chip is being
   used as a passive sniffer?

3. Could the monitor-mode channel-set path be modified in mt76
   to use whatever optimized firmware operation the scan path
   uses?


Why this matters
----------------

For passive RF survey and security-assessment use cases, a
sweeper that emits anything during a sweep contaminates the
environment it is supposed to be measuring. At present this
limits practical mt7921u-based sweepers to <= 4 channels per
list, which is impractical for full-spectrum work and is a
significant usability problem we'd like to address in a clean
way.

We are happy to provide further diagnostics, additional test
results, or test any patches that might help isolate or
suppress the behavior.

Thanks,
John Henry

