Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784EDC61DD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 02:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dug14hvQsvzMeLs0uApV/U5oLHS6a0LrtuhVRzKP7is=; b=i/Hfof9mQbA/omZXnyaJAkMVS7
	d/84ME81USbdQXCSdQKiBhwstuCXHfh1bI6JUWskGI3Ka1Bj1rsQ1jhMQ30aCVytT+hpxaTy7YB9u
	e8W/QzYRTymUsaOVzkmenXl+BSifworX3PSs0qOQwuq1B4/R2HfdVasTDwvWVn58C98dOMkR9VowM
	DSC2Ga7ReuAACJP6JBgKeaOymhKegiIdsbxAtUxAqP6gsZtDs0qMaMNJWUILjUuX1/GVN97/L2SLs
	6RjNnsE/ltmp59OzFDIMq1D0DO0VVHgAr/eRMbt6LP3zSvQVO9MzGWg8ArDcrzUE1aPoPA2Q1jvVY
	Xz4BqP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2JMp-00000000rhH-2t1Z;
	Fri, 04 Sep 2026 02:09:23 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2JMn-00000000rgt-1vS9
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 02:09:23 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-870502743a4so3189517b3.3
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Sep 2026 19:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788487758; cv=none;
        d=google.com; s=arc-20260327;
        b=TiFfTS9GLqx/rsyN9w4KpdKang5SRAWLXqNhaWRp9m5EF5lEr8Vk9IGl3nVb+A1wjO
         p1Rrfv3IrHPiKDPwhhp3ZKvaVqHiZFk806vlhP0pNRIsOMSIEvugpt3KnMsSeIH4o1eU
         GrA4Xhn9ytIiXraJnkZbTd1bbmED1Te151nFVkATm3+AwzozhOXuZh4h/jxNwAiL9p5N
         /S/QcpWqRYuW1FCaX3kb81LmHFedIXSyuV9ZufK8Xk95sA+BJdE028B529MV8kF8mEMg
         RGe//oXJD2Rz+Tbqa6lO1oblhUddnmzWscWgdXgLfFRW6Is/g5BxYJVQjRto9Q7Tq4nJ
         ClmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Dug14hvQsvzMeLs0uApV/U5oLHS6a0LrtuhVRzKP7is=;
        fh=SqFXMTfRQS8RVS0F2U89CyTuYSBD6AXMKbW2jVpvcVU=;
        b=cjubtBb62j0WAKduk1gTCetFw3unH2TuaMr/PEA3HgLgneh0q/r8A0O/6gCvtN4v9F
         T1ldS8h+cxPyTS8BheoaaDLlLiXhzwrRm3nQZ30YwPiuwtpk1hu+2TYBgU9ETEP3kfEe
         Rd+4T4QKp/zeY4a1qpYMAv9m5B0jl0dWs1+tE0zTsITxCPbY519Hj3r7h/bOlHX4t8GE
         nPT6xaLLcDgQmHkKuLWDJ11kdkFHnboQ55IlMmaTwpLqJmNr1ZH/MRMPOoAHPlw+Mb30
         WmUBwbTWJ7ZN99ljBhT2lURDVxxm+XKzXvRuQIfBTUoOL89OPcSatY8/9jAQM4LmUTOC
         L2EA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getscale-com-br.20251104.gappssmtp.com; s=20251104; t=1788487758; x=1789092558; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dug14hvQsvzMeLs0uApV/U5oLHS6a0LrtuhVRzKP7is=;
        b=vAbpmMaI+rp16Qpgw6wzBxN/jzEjpZgboCsNPTCHLZ5PzXSnx2oV46cqtWaEnzgU7X
         auChLCIW8xbnglXyBFNfLZYf42EP2XIIdpL/GZ3WtcmOhpuqMT50txB7VZ4mpjO3Uzri
         lN3GjfDbRChGV/d/+hbB+DixrArFnbFWedBaslLA5XdJBDqQ0MVHB3aNOG+K5D2WncGw
         WsqqB4jS/q9uwpLiSmaFaGl/zoGVdNB1AX4Fxtk5rC1fBTX5bRZK/V0h8g4VDFyeFJGh
         VlqdqQFpZ0VPBZDnW5SUNV331usidcWK2pu6OufGj5QbSzN9+f73o/jpkZYt9Ngi+RZz
         7O7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788487758; x=1789092558;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dug14hvQsvzMeLs0uApV/U5oLHS6a0LrtuhVRzKP7is=;
        b=DZZDDORh8RSckXEijg8beZVzWsqi4HoqudQqKnUcqnlHrXftJMR5ZYYTZAkh7pXw/d
         ddqoSbq/SDAMuXQAiiwu6WQzQ7gdSx16U+AaluslNTl+OQUYHnSwIy+96zWzs6IZqWYc
         AQ3ghFTiAKZl8WJhXlkFtrRIxQ7JDF6nQbKf4R4wJRttqmI+JHD/72gWPF1ypKOvROYf
         1v2ck1tDjTY1Fo6ufWC9u1OTZ1Ff2zbdnoZMdVzPc1HIELxvwG8GMG5OHiariloXuBlq
         bqquTI8OiwNuFPoSxLrxl8DlZxjrExg1iUXjBBHsQ9kMTuTFExe4I/rRCTU1NkHl+K94
         Krdg==
X-Forwarded-Encrypted: i=1; AKwUvBzvN0d0YoYhEUEbTIWl9tiAAY0Zsw0G+zFrv51R3VVT7W9FRT7Y2pagQeaeqWFuKm+Ycd7uoLHNvH3gbeFlFQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kSaKzhwDaE689rSJlMP3ekLTB67lw51AToVgMsRyjR7FE7mdBv
	mc9Trs4xs3UAphzPbGUnRwiDqJrFkftEsD++RnovsILy4/CZoR9wsdzOtPMXdZW9uxWwTLB6cPV
	ky9bmb/RuPv1mLjRmt5G8RN7fSdQgXUNISncJNDFnsw==
X-Gm-Gg: AYBFou3LCktthoWb/PdLdw2kknjUZumLISz7foECVWmrgNJKtB0kaf1X7YhMMXgpmcU
	knTuMXiCOmbHdbeh+7xRpwn/SHbkw9M3L3mKwzY8cO7QVCKGJHeduYqwvEAzd2o2G7R/bBG7bCh
	3+2Jmg6qgzs1NUk9STx7REsI2Pe4lf5PXlJ0ZqtdI0jaE2eWrGziMb0oKsdY42sb1KPYo+anont
	ZbxPyyA2Ankpe9K3VJhnQNregmZqMYjw5xC3XytUvwpt6HBnO3knJoxkyF507tWbJOVSoYoFkjT
	7FwnC2O3Qeuo1+R5DNy1TXegPYhEWdwMY+iXpUvk+Sh39d//KGoct9iZbwC7nBLQnHULTKr40vJ
	Efu/XtfhQtJ21zXGcVyim7wTtQEI9s3ar8u4KfVXnOKZlJrr4X6yEdZY9rptos/n+9YIytgisRQ
	3Fis5mx2df8AhLchaalH23tp5T2WgNGt3UAPO4FddNHMBQGFTxhNgP+9dyoWTMpnA946HP0cet1
	3G1oUtiIHErJpORn/27KpBCkA2ZGBMzVBYEH5DBQBlBLA==
X-Received: by 2002:a05:690c:e3c1:b0:858:1661:a43e with SMTP id
 00721157ae682-8711b9aaa64mr18533427b3.0.1788487757996; Thu, 03 Sep 2026
 19:09:17 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 3 Sep 2026 22:09:16 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 3 Sep 2026 22:07:35 -0400
MIME-Version: 1.0
From: Mario Stanski Jr <mario@getscale.com.br>
Date: Thu, 3 Sep 2026 22:09:16 -0400
X-Gm-Features: AcwNN1XDaXtQz_DOP5De7wVOsTznIju6-tptNtJhslsZFFcD0SUEyHJNS-iMzqE
Message-ID: <CAJe=AAkCeK=-pVve0Ffw_k0UBp4_AiO5BwQ1d2yG-pVe8B0U4Q@mail.gmail.com>
Subject: [REGRESSION] mt7925e: firmware 20260813113118 causes severe low-RSSI
 5 GHz loss
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	regressions@lists.linux.dev, jb.tsai@mediatek.com, jwboyer@kernel.org, 
	nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_190921_783085_440D93C4 
X-CRM114-Status: UNSURE (   5.39  )
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

I am reporting a severe low-RSSI 5 GHz regression in the MT7925 Wi-Fi
firmware added by linux-firmware commit 3c11e660d3a8 (MR !1191).

On an MT7925/RZ717 PCIe adapter [14c3:0717], WM build
20260813113118 remains associated at about -70 dBm, but traffic suffers
23-29% packet loss, 1.2-1.8 s average RTT to the gateway, and HTTPS
timeouts. Replacing only the two Wi-Fi blobs with the previous pair and
reloading the same in-tree mt7925e driver loads WM build 20260605184805.
On the same AP/BSSID, machine position, kernel, profile and RSSI, gateway
loss becomes 0% and average RTT becomes 4.237 ms.

Firmware-only A/B results:

                         20260813113118       20260605184805
Gateway packet loss      23-29%               0/20 (0%)
Gateway average RTT      1.2-1.8 s            4.237 ms
Internet packet loss     about 29%            0/10 (0%)
Internet average RTT     about 3.7 s          15.109 ms
Three 1 MB HTTPS probes  2 connect timeouts;  3/3 complete,
                         1 partial timeout    4.18-5.25 MB/s

The partial newer-firmware probe received 293689/1000000 bytes in 8 s
(36702 B/s). After pinning the previous blobs, a longer confirmation at
-70 to -72 dBm returned 50/50 gateway replies (4.236 ms average), 20/20
Internet replies (15.548 ms average), and three further complete 1 MB
downloads at 3.91-4.60 MB/s. A separate acceptance run at -74 dBm also
had 0% gateway loss.

Environment:

  Device:          MediaTek MT7925 / AMD RZ717 Wi-Fi 7 PCIe
  PCI ID:          14c3:0717
  ASIC / HW-SW:    79250000 / 0x8a108a10
  Driver:          in-tree mt7925e
  Kernel:          7.3.0-rc1, x86_64, PREEMPT_DYNAMIC
  Distribution:    Arch-derived (CachyOS)
  NetworkManager:  1.58.1
  wpa_supplicant:  2.12
  Link:            WPA2-PSK, 5805 MHz/channel 161, VHT40, non-MLO
  Regulatory:      BR
  Power saving:    off in both runs
  Module params:   defaults; no experimental ASPM/CLC parameters

Firmware identities and uncompressed SHA-256:

  Regressed WM/Patch: 20260813113118 / 20260813113015a
  WIFI_RAM_CODE_MT7925_1_1.bin:
    23ff53b4bb639b30481e2e06bb1688569ad1ba971b897936db539882abfbd120
  WIFI_MT7925_PATCH_MCU_1_1_hdr.bin:
    8eb46014d2a6b4124472eee7476d995008a6f40b1daffef87eb42f30d98699e1

  Good WM/Patch: 20260605184805 / 20260605184651a
  WIFI_RAM_CODE_MT7925_1_1.bin:
    7e4ed27d1e9fe21cdefda35a22da32137b2473fada350617fb603489af19346a
  WIFI_MT7925_PATCH_MCU_1_1_hdr.bin:
    089dd0252a7eb95feed55950ad0fd9e6f751a07b4cf22273de722b73fa50d49e

The regressed firmware stays associated and no driver timeout/reset/AER
accompanied the failure. RSSI was effectively unchanged across the A/B.
Bluetooth firmware was not reloaded during the test.

The workaround is to pin the two Wi-Fi blobs from linux-firmware commit
bd1c66cfef5fb9cba15f1838a3fd222fb88a832b, then reboot or safely reload
mt7925e. No kernel parameters are required on this system.

References:

  Regression commit / MR:
  https://gitlab.com/kernel-firmware/linux-firmware/-/commit/3c11e660d3a8f8b35e12809b4b721a722b597148
  https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1191

  Previous known-good commit:
  https://gitlab.com/kernel-firmware/linux-firmware/-/commit/bd1c66cfef5fb9cba15f1838a3fd222fb88a832b

  Original submission thread (Message-ID
  <20260818010915.445782-1-jb.tsai@mediatek.com>):
  https://lists.openwall.net/linux-kernel/2026/08/18/60

  Full sanitized report and reproduction commands:
  https://github.com/openwrt/mt76/issues/1128

  Related low-signal report:
  https://bugzilla.kernel.org/show_bug.cgi?id=219429

Could you please confirm whether 20260813113118 is known to regress
low-signal 5 GHz transport, and whether the blobs should be reverted
while a fixed build is prepared? I can provide the recovery-safe A/B
script, full sanitized output, mt76 debugfs state or traces, and can test
a replacement firmware with the same procedure.

Regards,
MJr

