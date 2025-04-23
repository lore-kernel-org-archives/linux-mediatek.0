Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2FEC369CB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 19:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gh3gRBy3ivQHjbEOXKNRnjUwr8qDBlOi2525SM98dvk=; b=NTCQKwNGWaCifFszeKJ7v5N9hN
	Wnp2CYj9y2txTHHuSoTqii0uBJ47Tu/VanCG+5bz4aUE8Sgku/49VOI8JpWbKNmm9SAWwsNxt6bkC
	m7Ob+9x6dmpLXmNmz+9lIfIwPIxG5aV7UKhXVQVnC46XlIsQySmGO4iVG7A4vSHOBgJkX6ueTWtNQ
	SQYWexHcH/eUTzMt357QXi/ttoSJukkvQnKxdnM2eDID45MpZqEbYAbXWRkcUP4bUaiEq1RWIiZH0
	8ui4FW4PwaA8BuiX5hpEE3p841i8xJ69H03KuMXp8c6lBIaSo6SBj0wl9w6T3yQpgd30XD0mGUEw4
	/Z270NRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fXV-0000000BhyS-01Hi;
	Wed, 23 Apr 2025 19:13:45 +0000
Received: from mx-out.tlen.pl ([193.222.135.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fVW-0000000BhlP-26Z3
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Apr 2025 19:11:44 +0000
Received: (wp-smtpd smtp.tlen.pl 4687 invoked from network); 23 Apr 2025 21:11:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1745435497; bh=gh3gRBy3ivQHjbEOXKNRnjUwr8qDBlOi2525SM98dvk=;
          h=To:Cc:From:Subject;
          b=B3av/kz0lE/lkj4n9/N71NupjwdPvyUCpeajhkY0c4gRPmW/lBXQx0+BPO9/5OKZZ
           w+QPb4Q+p9yOvmahlgkRWff1uBqWPK1TLIZytSvQjYbnTlkFl1+BULH5JaWk0nhRiG
           tpirFmKK6sq8SxTMZVjVALG5NYQv6X/hP3+1d7sVe/bpKc89wbFPZ2rMYdpwX+2dAV
           OVnqJYqf18/st8jVlHYLDGG9EpwWagofNHiViNZ3Rwhv8quMzr8u4/u8k5qfTt4R8E
           RpDIDkcug8p88cRaE10tMzALibycJZnuTrLJ3eIdRd5FPhCbzbhtNkkek2Cx+MlSWR
           PBmV1HsVfFhjA==
Received: from apn-78-30-75-233.dynamic.gprs.plus.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[78.30.75.233])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <dqfext@gmail.com>; 23 Apr 2025 21:11:37 +0200
Message-ID: <c0411979-bf71-4695-ab7e-9213c339603e@o2.pl>
Date: Wed, 23 Apr 2025 21:11:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, pl
To: DENG Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>
Cc: linux-mediatek@lists.infradead.org,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 openwrt-devel@lists.openwrt.org,
 Felix Baumann <felix.baumann@freifunk-aachen.de>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>
From: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Subject: Mediatek: EEE problems with the MT7530 PHYs on OpenWRT 24.10
Autocrypt: addr=mat.jonczyk@o2.pl; keydata=
 xsFNBFqMDyQBEAC2VYhOvwXdcGfmMs9amNUFjGFgLixeS2C1uYwaC3tYqjgDQNo/qDoPh52f
 ExoTMJRqx48qvvY/i6iwia7wOTBxbYCBDqGYxDudjtL41ko8AmbGOSkxJww5X/2ZAtFjUJxO
 QjNESFlRscMfDv5vcCvtH7PaJJob4TBZvKxdL4VCDCgEsmOadTy5hvwv0rjNjohau1y4XfxU
 DdvOcl6LpWMEezsHGc/PbSHNAKtVht4BZYg66kSEAhs2rOTN6pnWJVd7ErauehrET2xo2JbO
 4lAv0nbXmCpPj37ZvURswCeP8PcHoA1QQKWsCnHU2WeVw+XcvR/hmFMI2QnE6V/ObHAb9bzg
 jxSYVZRAWVsdNakfT7xhkaeHjEQMVRQYBL6bqrJMFFXyh9YDj+MALjyb5hDG3mUcB4Wg7yln
 DRrda+1EVObfszfBWm2pC9Vz1QUQ4CD88FcmrlC7n2witke3gr38xmiYBzDqi1hRmrSj2WnS
 RP/s9t+C8M8SweQ2WuoVBLWUvcULYMzwy6mte0aSA8XV6+02a3VuBjP/6Y8yZUd0aZfAHyPi
 Rf60WVjYNRSeg27lZ9DJmHjSfZNn1FrtZi3W9Ff6bry/SY9D136qXBQxPYxXQfaGDhVeLUVF
 Q+NIZ6NEjqrLQ07LEvUW2Qzk2q851/IaXZPtP6swx0gqrpjNrwARAQABzSRNYXRldXN6IEpv
 xYRjenlrIDxtYXQuam9uY3p5a0BvMi5wbD7CwX4EEwECACgFAlqMDyQCGwMFCRLMAwAGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEPvWWrhhCv7Gb0MQAJVIpJ1KAOH6WaT8e65xZulI
 1jkwGwNp+3bWWc5eLjKUnXtOYpa9oIsUUAqvh/L8MofGtM1V11kSX9dEloyqlqDyNSQk0h52
 hZxMsCQyzjGOcBAi0zmWGYB4xu6SXj4LpVpIPW0sogduEOfbC0i7uAIyotHgepQ8RPGmZoXU
 9bzFCyqZ8kAqwOoCCx+ccnXtbnlAXQmDb88cIprAU+Elk4k4t7Bpjn2ek4fv35PsvsBdRTq3
 ADg8sGuq4KQXhbY53n1tyiab3M88uv6Cv//Ncgx+AqMdXq2AJ7amFsYdvkTC98sx20qk6Cul
 oHggmCre4MBcDD4S0qDXo5Z9NxVR/e9yUHxGLc5BlNj+FJPO7zwvkmIaMMnMlbydWVke0FSR
 AzJaEV/NNZKYctw2wYThdXPiz/y7aKd6/sM1jgPlleQhs3tZAIdjPfFjGdeeggv668M7GmKl
 +SEzpeFQ4b0x64XfLfLXX8GP/ArTuxEfJX4L05/Y9w9AJwXCVEwW4q17v8gNsPyVUVEdIroK
 cve6cgNNSWoxTaYcATePmkKnrAPqfg+6qFM4TuOWmyzCLQ1YoUZMxH+ddivDQtlKCp6JgGCz
 c9YCESxVii0vo8TsHdIAjQ/px9KsuYBmOlKnHXKbj6BsE/pkMMKQg/L415dvKzhLm2qVih7I
 U16IAtK5b7RpzsFNBFqMDyQBEACclVvbzpor4XfU6WLUofqnO3QSTwDuNyoNQaE4GJKEXA+p
 Bw5/D2ruHhj1Bgs6Qx7G4XL3odzO1xT3Iz6w26ZrxH69hYjeTdT8VW4EoYFvliUvgye2cC01
 ltYrMYV1IBXwJqSEAImU0Xb+AItAnHA1NNUUb9wKHvOLrW4Y7Ntoy1tp7Vww2ecAWEIYjcO6
 AMoUX8Q6gfVPxVEQv1EpspSwww+x/VlDGEiiYO4Ewm4MMSP4bmxsTmPb/f/K3rv830ZCQ5Ds
 U0rzUMG2CkyF45qXVWZ974NqZIeVCTE+liCTU7ARX1bN8VlU/yRs/nP2ISO0OAAMBKea7slr
 mu93to9gXNt3LEt+5aVIQdwEwPcqR09vGvTWdRaEQPqgkOJFyiZ0vYAUTwtITyjYxZWJbKJh
 JFaHpMds9kZLF9bH45SGb64uZrrE2eXTyI3DSeUS1YvMlJwKGumRTPXIzmVQ5PHiGXr2/9S4
 16W9lBDJeHhmcVOsn+04x5KIxHtqAP3mkMjDBYa0A3ksqD84qUBNuEKkZKgibBbs4qT35oXf
 kgWJtW+JziZf6LYx4WvRa80VDIIYCcQM6TrpsXIJI+su5qpzON1XJQG2iswY8PJ40pkRI9Sm
 kfTFrHOgiTpwZnI9saWqJh2ABavtnKZ1CtAY2VA8gmEqQeqs2hjdiNHAmRxR2wARAQABwsFl
 BBgBAgAPBQJajA8kAhsMBQkSzAMAAAoJEPvWWrhhCv7GhpYP/1tH/Kc35OgWu2lsgJxR9Z49
 4q+yYAuu11p0aQidL5utMFiemYHvxh/sJ4vMq65uPQXoQ3vo8lu9YR/p8kEt8jbljJusw6xQ
 iKA1Cc68xtseiKcUrjmN/rk3csbT+Qj2rZwkgod8v9GlKo6BJXMcKGbHb1GJtLF5HyI1q4j/
 zfeu7G1gVjGTx8e2OLyuBJp0HlFXWs2vWSMesmZQIBVNyyL9mmDLEwO4ULK2quF6RYtbvg+2
 PMyomNAaQB4s1UbXAO87s75hM79iszIzak2am4dEjTx+uYCWpvcw3rRDz7aMs401CphrlMKr
 WndS5qYcdiS9fvAfu/Jp5KIawpM0tVrojnKWCKHG4UnJIn+RF26+E7bjzE/Q5/NpkMblKD/Y
 6LHzJWsnLnL1o7MUARU++ztOl2Upofyuj7BSath0N632+XCTXk9m5yeDCl/UzPbP9brIChuw
 gF7DbkdscM7fkYzkUVRJM45rKOupy5Z03EtAzuT5Z/If3qJPU0txAJsquDohppFsGHrzn/X2
 0nI2LedLnIMUWwLRT4EvdYzsbP6im/7FXps15jaBOreobCaWTWtKtwD2LNI0l9LU9/RF+4Ac
 gwYu1CerMmdFbSo8ZdnaXlbEHinySUPqKmLHmPgDfxKNhfRDm1jJcGATkHCP80Fww8Ihl8aS
 TANkZ3QqXNX2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: b9fb9519b3d0f0745f28ecd25db33e1c
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [EVNh]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_121142_984220_71B19958 
X-CRM114-Status: UNSURE (   5.38  )
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

Hello,

Multiple users have reported a regression [1] in OpenWRT 24.10
(Linux 6.6) with the ramips/mt7621 target and the MT7530 PHYs:
the Ethernet link is periodically going down for a brief period
of time. It was determined that:

1. The symptoms stop after disabling EEE.

2. EEE is enabled by default for these devices in OpenWRT 24.10
    whereas in the previous version (OpenWRT 23.05, Linux 5.15) it
    was not.

3. In Linux 6.6, the PHY driver tries to disable EEE in
    mtk_gephy_config_init() in drivers/net/phy/mediatek-ge.c:

         /* Disable EEE */
         phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);

    but this is later overridden by a subsequent execution of the
    genphy_c45_write_eee_adv() function, which enables every EEE mode
    supported.

In 2021, Landen Chao wrote [2]:

> EEE of the 10-year-old MT7530 internal gephy has many IOT problems, so
> it is recommended to disable its EEE.

I'd like to ask Mediatek to clarify whether it is possible to fine-tune
the EEE of this PHY in some way, or rather that it should be hard-disabled
by setting:

     phydev->eee_broken_modes = -1;

in the PHY driver, like it is in ksz9477_config_init() in
drivers/net/phy/micrel.c.

Greetings,

Mateusz

[1] https://github.com/openwrt/openwrt/issues/17351

[2] https://lore.kernel.org/all/0adde34f936a2dafca40b06b408d82afe0852327.camel@mediatek.com/


