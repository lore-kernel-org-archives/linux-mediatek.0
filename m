Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE41C606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 04:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A7dIQpaL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nbybc6uY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hqzhedqVjs7AkXTxF1XLG+olsBlVNMfAb/HS/OJ7ybc=; b=A7dIQpaLs20Hp5+s0A5x7OoyNu
	pTDCFdQzsX6vdZ5XsjvViRcnAIyNglNkaa+lDkwHJTPtWRKKOLBwZ/0prbNyK2FtQ1pcBBnmcHhEc
	PC1WKlFZ6pSRomOOUngzqUGbOLLH1XGitcJ3P4mOt/88GAdYXwP//79j7Mdkyuz+9lU0bAltkwDip
	mCG9o/HSO6m1ByspYmQy+xk1gHvFRtM9Z9E2GnSbARCd6XXp1GYO7kcUZCbcysn9jbOydcEh1z+p1
	/cZmavTolQZAutZww3xG5rSBhjCkUDUyKYY8GrIkIBhmAW2iM5LbisTBpgvrjOwvwauq5SLtolUBM
	zRuqnGhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRIo-0000000C5E8-2atW;
	Thu, 26 Nov 2026 04:41:46 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRIm-0000000C5Do-12Gi
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 04:41:45 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so4288741f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 20:41:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795668102; cv=none;
        d=google.com; s=arc-20260327;
        b=UbpL2RskMiq8vxjUA7HQ7Bm0bQkk7MbUzWQIbGlBkWLlbOr27dO1/A3FtouED5BUv2
         MyldidBf0f5DWWcvIls8mX23UGdMe3KgWOILghgYXouDm7kRynKgbvf1zKzOAQms/hqN
         SRVWVzoNzxc1ByxrpYrTdQNj+/mUTg8IsRXAdRq2g3p385j58UGCH1jzsp83dlvuc4wu
         UUw9XAe71pHNLajs+7RGLZt1SpYcuZdfR50Ma7wsTWZLooZ/+5ibxNj1r5M0IOFabuQ2
         BwbJE+7Q9zw3YnQ2KIP4SKN1kmBwRHajZE98Og7ZCW0ZR5IQbfCkAFJpsIP2XJQ2o7/U
         tdHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=hqzhedqVjs7AkXTxF1XLG+olsBlVNMfAb/HS/OJ7ybc=;
        fh=PjrL3PbPjh61qFylFkX7nOO7NYE01zA9unZyECgcnHY=;
        b=d7WYM0Cr96JElXEOLYu3XjZz+hgC07ZgahCmMsa018ojAPtG+XcUuZ/YmOR/TEE5T4
         f08N5Dqg6r431O/q5iVMJd2i77ymC4QrDdFM/DIXyBWfTPfrqplL96jRvNZ44L5cHm+/
         UjStz4tuRdaK4GJDzrbKTqp3Yc8DqorasmmP2fD/syv0PmVb6sDdZ9cDoI3ks+12VF3M
         gtuAaTMYa7WObbeeYwhRkhZXZeVBVt6lvDULkjWBHaM0ILbpR/ax9Qii/jOl2qtRKV8Y
         H3AwOZ5vCPp9qcGsPHCx22wU2HweMafcqHmrLgtep0OlaaXjxwIkz6EtPkbZEverXylB
         h7+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795668102; x=1796272902; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hqzhedqVjs7AkXTxF1XLG+olsBlVNMfAb/HS/OJ7ybc=;
        b=Nbybc6uYaaU+9kcDl6H1TgCHOEglY1kJA45rjf1v078EbTmB+/ZvXMqCdU0cn+/JKk
         5bSwNTfVO7zfBtXp4GB0hkjks8I4onp5NVxoooN9EdU2HE966mD9h6IMLqUp+9tNdQyR
         Z6LNCi6hTG6JdUdi/aEVj8W3DkFLv/11yr74WnWg6VQV+1fXT4mxTtmF87fkLP/ylq1h
         VpfWdZXiT1QZXLnnVnh7eVdvTuGR+ndFSq8qe1GkdnpDIztfPsyV4zGDzawUr3YhW1c6
         +M7XlCzvMyrVzoUnksi/018QSDT5t3sB5CG7izq2gNyaUq3MaOz9/rwSHr09mKTFU6Yk
         JHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795668102; x=1796272902;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hqzhedqVjs7AkXTxF1XLG+olsBlVNMfAb/HS/OJ7ybc=;
        b=QfNXeJw+BxSVYThTpva+NYM0aeZN673XMaPEvHK4zyzJt0bAIrOtir7WfzKVCHlawy
         av/vwznMTUMFqgYwa56UacmIP/NiWGdcC3D+FEqlEIUdGV4qn8nw1pGMmNcraWSviJgr
         gqTB53scKw3kgPniEvKEyFPqEb4T+5H8csRtUYeCI/N0Qhwwmlv1YQNWoBzUu1E9mJxE
         fIBVAqD0V3DOnM4h71fsRwIJcjZ6Y6JfjAATXQiB1yNY9SQtcFnMrNqDJuKVcuYhuADv
         Ru+z+SpJsvf/cqJ7jYgB3jq6UKsPLmwRkbQBFlNRW5DN6Qf+i4clphLO69ZfAd90cTiu
         KO/A==
X-Forwarded-Encrypted: i=1; AL+hErFZ9fLsKEGhSq0GMPXdRPWCErERSy3ZycePS6dhzuQ5vdPOJM9nYZ/7Rgfon5SCjhz+ajNdfrb/JEx9c9o45A==@lists.infradead.org
X-Gm-Message-State: APuU4Z8s4AbC0EkJfbFbOCmXZ4nkXW37yj03PwlypM33ZBtytIPA59PO
	xQpy3/AbSPXHcFEtacOF1zt6aT3QyvrprraMMP3Xe7l4ztLnH3HmOEs0i346jgAdCYyZI6fG5Ko
	TJqtGK6IURHKA2Sq6CLlL5jvssNYlSCM=
X-Gm-Gg: AZFdTZdYQuxyxtO9cqWTJbfBUljvU+gRGcOSNehO1nVydvcaI0UZKByt65DO4BXZ78M
	4dlSOaeiBcfTHH1E9V1vSo6CY4XilK5mL6fqZdl5qTBMrZuQlvcUObXmggA6rwqO57DjLMzTjND
	KoIGHoEdFX624SJKliPnMtalP/xjzeRcNRRmEhG43S7QmhLqDH/qHl6233qvjugOCgiCyMwJD1U
	grPacwAh4wBn3iFjIPTHBMPL7Ctw6Xenh5SPfsaHuHF9ZO2Lr6BjqJcHq634/gyeOwp+QNvabiE
	dXTuRywsX6spHbRSEBbg7dAcUz4bYkBpOv9CRNnFTePmDb8NtfIY+DGpLx137hlwlOGNW4VKxlO
	URBfczB9QpHtZd+vUXXEaPCqlqatAIRqiiOBSPEHcI9UQ/qo4OPky31gnkGtjXW1qSSMuBVL1E/
	G3yrIwL2eHXsMSXPWfqA==
X-Received: by 2002:a05:600c:1c28:b0:4bb:867b:f0f0 with SMTP id
 5b1f17b1804b1-4bb88810708mr459749095e9.15.1795668101526; Wed, 25 Nov 2026
 20:41:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Karol Adamiak <karol.kosciany@gmail.com>
Date: Thu, 26 Nov 2026 05:41:27 +0100
X-Gm-Features: Aa3M54qtYOoLCQuxFLQghM_P3dcTq6Jbq3OUf1u0grHn0z5sS4QOAoicBrRfwgs
Message-ID: <CAOUCBqp44oaRa5bBv6XOPs8+Uf0xvQJ4nfdsF9YeX19FHevphg@mail.gmail.com>
Subject: mt7921e (MT7921K/RZ608): since linux-firmware a80dabbc, Wi-Fi RX
 loses ~40% of packets after a scan while A2DP is streaming
To: allan.wang@mediatek.com
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-firmware@kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	sean.wang@mediatek.com, ryder.lee@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_204144_383879_0121B594 
X-CRM114-Status: GOOD (  11.11  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

I am seeing a regression after a Wi-Fi firmware update on a MediaTek
MT7921K (RZ608, ASIC revision 79610010). Wi-Fi is on PCIe (mt7921e),
Bluetooth on USB (0e8d:0608, btusb), so both share the same chip.

Symptom:
With a BT headset connected and A2DP streaming (aptX HD; the same
happens when streaming silence), every Wi-Fi scan leaves the link
degraded. The scan can be the periodic NetworkManager background scan
(every 300 s) or a manual "nmcli device wifi rescan". For as long as
the stream runs, downlink (AP to client) loses a steady ~40% of UDP
packets at 100 Mb/s. TCP drops from ~600 to ~100 Mb/s with thousands
of retransmissions. About 2 s after the A2DP stream stops, the loss
disappears, with no reassociation. Without A2DP streaming, a scan
causes only 4-5 s of loss and then 0% again. Uplink is almost
unaffected. Ping shows 0% loss during the same window, so the problem
is invisible to ping and shows up only under sustained UDP/TCP load
(in practice: a brief lag in online games every few minutes).

Bisection:
Same kernel (7.0.0-44-generic, Ubuntu 26.04.1) throughout. Wi-Fi and
BT firmware were swapped independently via /lib/firmware/updates/.

Wi-Fi firmware (linux-firmware commit, build) Result (3 scans while streaming)
------------------------------------------------------------------------------------------------
3b128b60 (2024-03, patch 20240219110958a) good (4-10 s loss)
1d4c88ee (patch 20241106151007a) good
5cf85776 (2025-07-03, patch 20250625153620a) good (5-9 s)
a80dabbc (2026-01-19, patch 20251223091050a, WM 20251223091148) bad:
99-100 s of loss after every scan
ced02591 (2026-03-13, patch 20260224110909a) bad (bit-identical to
Ubuntu's linux-firmware 20260319)

Between 5cf85776 and a80dabbc the only changes to
WIFI_RAM_CODE_MT7961_1.bin and WIFI_MT7961_patch_mcu_1_2_hdr.bin are
in that one commit, so a80dabbc is the first bad commit. BT firmware
is irrelevant: new Wi-Fi + old BT (20240219111427) is bad, old Wi-Fi +
new BT (20260224111243) is good. An external USB BT adapter (Realtek
RTL8761B) under the same conditions does not trigger the problem.

Where the packets are lost:
Measured on the new firmware (ced02591), 5 GHz, A2DP streaming, UDP
100 Mb/s downlink, scan at 10:40:37. Counters from the AP (OpenWrt,
MT7915, client station entry) and from the card, sampled about every 3
s:

Phase AP sent AP retries / failed Card received
------------------------------------------------------------------------------------------
before BT streaming 8913 pkt/s 250/s 8913 pkt/s
streaming ON, before scan 8599 pkt/s 53/s 8600 pkt/s
after scan, streaming ON (205 s) 8687 pkt/s 125/s 5161 pkt/s (-40%)
after stopping the stream 8580 pkt/s 295/s 8581 pkt/s

The AP keeps sending the same rate and sees no extra failures (so the
frames are being ACKed by the card), yet the card hands ~40% fewer
packets to the host. On the host side nothing is dropped: "ip -s link"
RX dropped 0 / missed 0, "iw station" rx drop misc 0, beacon loss 0,
rates unchanged (rx 1200.9 / tx 960.7 Mb/s). In debugfs mt76, BA miss
count climbs 0 -> 29 -> 36 -> 56 during the bad window and stops when
the stream stops. My working interpretation: after a scan the firmware
receives and acknowledges frames but does not deliver them to the host
while A2DP is active (RX reorder / BA scoreboard, or coex gating).
This points inside the card firmware, not at the host driver or the
radio link.

Band pinning does not help:
Pinned to 5 GHz (band=a), the new firmware fails identically (365 s
and 205 s of ~41% loss in two independent runs, ended only by stopping
the stream). The nl80211 scan still covers all 2.4 GHz channels
(2412-2472) and all 5 GHz including DFS, so pinning does not shorten
the scan.

Reproducibility:
3 of 3 scans bad with a80dabbc and newer, 0 of 3 with 5cf85776 and
older; repeated many times. AP: OpenWrt (MT7915), channel 36, 80 MHz,
HE; client on 5 GHz, signal about -55 dBm.

Environment:
Kernel 7.0.0-44-generic, bluez 5.85, PipeWire 1.6.2, WirePlumber
0.5.13, in-kernel mt7921e with default parameters.

Separate observation (may be known coex behavior):
On 2.4 GHz with the older firmware, A2DP streaming alone cuts Wi-Fi
capacity heavily: UDP downlink loss without streaming at 10/20/50/100
Mb/s is 0%/0%/0.13%/0.02%, with streaming 0.17%/11%/31%/38%
(throughput 10/17.7/34.7/62 Mb/s). A 20 min run at 50 Mb/s shows a
flat 31% loss from the first second. On 5 GHz this does not occur.

Workaround in use:
Staying on the 5cf85776 Wi-Fi blobs (placed in
/lib/firmware/updates/mediatek/). With them, a 25 min test (A2DP on, 5
forced + 5 natural scans) gave 1.61% total loss, longest burst 5 s,
each returning to 0%.

I can provide raw iperf3 logs (per-second loss), mt76 debugfs dumps, a
btmon capture, and a self-contained reproduction script (bash, iperf3,
nmcli, PipeWire, python3). Could you tell me what changed in
20251223... in the scan handling or BT coexistence path? I am happy to
test patched firmware.

Thanks,
Karol Adamiak

