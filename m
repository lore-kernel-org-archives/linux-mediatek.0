Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB755606A323
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 16:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YtgWp+ah;
	dkim=pass (2048-bit key) header.d=vivaldi.net header.i=@vivaldi.net header.a=rsa-sha256 header.s=default header.b=n47Y1VXx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:Subject:Cc:To:From:Date:Reply-To:MIME-Version:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AQwsp/5IH5feaYxthFmLwwSod7DU5YkNOprXmU/SPgk=; b=YtgWp+ahaTDYXzlhmEHnHExutg
	AuttXboYIwR0PJ0zgaASeItgdUsn2UdsWRUojhCH9vuJo7ko5n4djtKXgyahIRW2s5Xu/1Jqjyr8n
	KpZpWYUxZTsAU8LX/JIZa5R28UWuJGDHmKgtDeEdipt23uG4nvXyIOoSoORLvcqHLhDEtxlWcTNRQ
	fobhnA8YtFKhS7ASMRgfZ+iTjYhse1l4CueSG+PehvcGjH5BCpiILjQqlBQcDZri/WwmhxxopirOL
	1pqWDh1qkF5UKcyvY+TxAP+PUnoLmY+T/akDcnhVc35xsC9fa23jFD9e4LsTY2asgPhiMM9XNDfNr
	GafjZRYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSGPj-0000000GRZ8-14Is;
	Sat, 14 Nov 2026 16:15:39 +0000
Received: from smtp.vivaldi.net ([31.209.137.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSGPg-0000000GRYM-0fpJ
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Nov 2026 16:15:37 +0000
Received: from localhost (localhost [127.0.0.1])
	by smtp.vivaldi.net (Postfix) with ESMTP id 3DDD2FC446;
	Sat, 14 Nov 2026 16:15:25 +0000 (UTC)
X-Virus-Scanned: Debian amavis at smtp.vivaldi.net
Received: from smtp.vivaldi.net ([127.0.0.1])
 by localhost (mxo-1.viv.dc01 [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XuOZdbRINRPN; Sat, 14 Nov 2026 16:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.vivaldi.net D36F6FC4F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivaldi.net;
	s=default; t=1794672922;
	bh=AQwsp/5IH5feaYxthFmLwwSod7DU5YkNOprXmU/SPgk=;
	h=Date:From:To:Cc:Subject:From;
	b=n47Y1VXxyfIznn+R7exjhk4ZMWJWLMFdkKvbWe2L6rHajyuiYcwBU9Y5L2HPcOTvL
	 WWrVcauaLe5GLigP26H5pL7H/UtPtawXhVqH92vIxNZ3qVrcAVUfcza8bolC8y91YZ
	 IhxyA1AWyJfZ0tasmVY8cKSqRmC8BDUinW1IwUHXajvjxjJefEdK6jFxewOSk82ejY
	 GJZ2TK0EQs0RhqeV3ihDuDg+0YAj1KIysg9tL8m1ZmmQycTJUSKVEvoX142yGJjygp
	 Enbl3Pk8PsiYCI7cDWxjicxvljawgkl13WAXTl6+rdlCpntYi5NatAfJaQ82cChKkG
	 pfZf4IdimIyMg==
Date: Sat, 14 Nov 2026 16:15:22 +0000
From: Martin Moosbauer <martinmoosbauer@vivaldi.net>
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: =?UTF-8?Q?=E2=80=A2_=5BREGRESSION_6=2E18=2E54_-=3E_6=2E18=2E63?=
 =?UTF-8?Q?=5D_cfg80211_/_mt7925e=3A_Invalid_=22Country=3A_EU=22_beacon_fo?=
 =?UTF-8?Q?rces_regdom_to_98_and_breaks_AP/5GHz?=
Message-ID: <8db36875c56cd9703dee42c7a00b81c9@vivaldi.net>
X-Sender: martinmoosbauer@vivaldi.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_081536_417011_17383EFD 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi all,

I am reporting a regulatory regression on a MediaTek MT7925 (mt7925e) 
wireless card caused by neighboring ISP routers (Vodafone Germany / 
CommScope-Arris RDK-B) broadcasting an invalid 802.11d Country IE set to 
"EU".

This worked cleanly on Arch Linux kernel `6.18.54-2-lts`, where the 
system stayed on `DE` even after scanning the neighboring `EU` beacons. 
After updating to `6.18.63-2-lts` (and also reproducible on 
`7.2.8.zen1-2` and `7.3.4-zen2-1-zen`), the regulatory domain 
immediately falls back to `98` (`DFS-UNSET`), enforcing `PASSIVE-SCAN` 
across all 5 GHz channels and breaking AP/hotspot startup as well as 
manual scans.

### Problem Description
1. Neighboring Vodafone Station routers (OUI 4c:12:65, CommScope/Arris) 
broadcast `Country: EU` in their beacons (both on private SSIDs and 
public "Vodafone Hotspot" / "Vodafone Homespot" virtual BSSs). Note: 
Neighboring Vantiva/Technicolor Vodafone Stations (OUI 98:9d:5d) omit 
the Country IE and do not trigger this issue.
2. On kernel `6.18.54-2-lts`, `cfg80211` / `mt7925e` stayed on `DE` when 
seeing these beacons alongside valid `DE` routers. Both AP/hotspot and 5 
GHz STA modes worked without issues, and manual scans (`iw dev wlp8s0 
scan`) succeeded.
3. On kernel `6.18.63-2-lts` (as well as `7.2.8` and `7.3.4`), as soon 
as background scans pick up the `Country: EU` beacon, the active 
regulatory domain is overwritten with `98` (`DFS-UNSET`). All 5 GHz 
channels are restricted to `PASSIVE-SCAN`, preventing AP startup and 
causing manual scans (`iw dev ... scan`) to fail with `command failed: 
Device or resource busy (-16)`. Manually running `iw reg set DE` is 
immediately reverted on the next background scan.

### Expected Behavior
An invalid or non-ISO country code like "EU" received from an 
unassociated/neighboring AP beacon should be ignored/discarded by 
`cfg80211` (matching the `6.18.54-2-lts` behavior) rather than 
overriding a valid active regulatory domain (`DE`) with `98`.

### System Information
- Distribution: Arch Linux
- Last known working kernel: `6.18.54-2-lts`
- Affected kernels: `6.18.63-2-lts`, `7.2.8.zen1-2`, `7.3.4-zen2-1-zen`
- Hardware / Driver: MediaTek MT7925 (`mt7925e`, ASIC revision 
`79250000`)
- Firmware version: `HW/SW Version: 0x8a108a10, Build Time: 
20260813113015a` / `WM Firmware Version: ____000000, Build Time: 
20260813113118` (`linux-firmware 20261019-1`)
- `wireless-regdb` version: `2026.09.03-1`
- `iw` version: `6.17-1`

### Regulatory Output (`iw reg get` after boot on 6.18.63-2-lts)
global
country 98: DFS-UNSET
	(2402 - 2472 @ 40), (N/A, 20), (N/A)
	(2457 - 2482 @ 25), (N/A, 20), (N/A), PASSIVE-SCAN
	(2474 - 2483 @ 9), (N/A, 20), (N/A), NO-OFDM, PASSIVE-SCAN
	(5170 - 5250 @ 80), (N/A, 20), (N/A), NO-OUTDOOR, AUTO-BW, PASSIVE-SCAN
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW, 
PASSIVE-SCAN
	(5490 - 5725 @ 160), (N/A, 20), (0 ms), DFS, PASSIVE-SCAN
	(5725 - 5730 @ 5), (N/A, 13), (0 ms), DFS, PASSIVE-SCAN
	(5735 - 5835 @ 80), (N/A, 13), (N/A), PASSIVE-SCAN
	(57240 - 63720 @ 2160), (N/A, 0), (N/A)

### Relevant Scan Dump Output
BSS 4c:12:65:ba:9b:8c(on wlp8s0_2)
	SSID: *SSID Deleted for Privacy reasons*
	Country: EU	Environment: Indoor/Outdoor
		 * OBSS non-GF present: 0
		 * BSS Transition
BSS 4e:12:65:ba:9b:9c(on wlp8s0_2)
	SSID: Vodafone Hotspot
	Country: EU	Environment: Indoor/Outdoor
		 * OBSS non-GF present: 0
BSS 4e:12:65:ba:9b:bc(on wlp8s0_2)
	SSID: Vodafone Homespot
	Country: EU	Environment: Indoor/Outdoor
		 * OBSS non-GF present: 0

Any guidance or patch to restore the `6.18.54` behavior and prevent 
unassociated invalid "EU" beacons from poisoning the active regulatory 
domain would be greatly appreciated.

Best regards,
Martin Moosbauer

