Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7006F60A2613
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 19:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SadfRWUO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZHgYIYAM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EjJYvzFdvze5iPMTQvoCwzZHkwJLHlrVNoowatB6Euo=; b=SadfRWUOLP8Fd6V0kVJljlnPpR
	a3AgxDUNJj5tiOYfn2xQosS50sVhOaovcdLMWFs6CxqxxME7YyZt8tcytA+tjtiBsdIsLDHMEVRTF
	2ghpWp/jRSK/JWLihhpivtJGNAvrrGpJC9QzCDtfH1j97WlPwT1Zb20zOs0CZ8chMMVxyTwadsX3k
	FoUgZM1ckQpoOZB7+jwj5AkK42OTgGmHrgO5dpGUghlcAe5PNxb6+F+tW5mmfIFAlWyqCDefcQMqf
	BYW7vKf79YgdeYLrw19Nwk+bLuO8DhLkKunsGflJCtqJCeugXid+f/9Zy09vj0zOILJm15Xq/btLn
	8jwRm/+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlH8-0000000A68b-4Bqa;
	Wed, 18 Nov 2026 19:24:59 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlH5-0000000A67w-3lbK
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Nov 2026 19:24:57 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso707104a91.2
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Nov 2026 11:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795029894; cv=none;
        d=google.com; s=arc-20260327;
        b=qQbB1k4h+nIDeMgMhST6I668BldVGm7d/YZJV8KDI9gCOLn1NyYUE1YP5AkRxbhSNM
         9403AIr2jo+XjIpFqFMQ58tktJy2fkQg833u+womcwU/N+SL/2vwS8M7kR8LDu1upyWg
         omYjZLSEqVpqKlQS7ou2w0qtXl8roPMTO0gW8WRSHTPRoLRaU+rNf4sAAoiKfWBNNdZD
         epSDfyuxnVp8/l25cMLo8FPbDKDjCWrj+NLqhtr+R5/viHt4WLA66g70AVX+ZL8EW10E
         xE4yzvgSC+UPTWpLOZ3vW9t1RNyeUyv0NcxOV33LIdVbzMOrGM89Zfh3CT3hnJfnPgJz
         voLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=EjJYvzFdvze5iPMTQvoCwzZHkwJLHlrVNoowatB6Euo=;
        fh=H3IeUBJlrhksLLVcyJSdzlg/KTvRbBJBYaS4xFY2eUE=;
        b=Jtyy04l8Ipr9WLc1TJZhjsCoWf7ypzdJXuOt8a5LTJZi0zLi2U0rYXMrz0cFRedCYb
         ygTwHs1ZIn1w3YbPHjoug0eW51f7LTR6Flb8WTxBV42Vs2aj50Hl99T3vR/PGYbRvaKH
         9OQglfDTbks1pUa7J8o3fpGJYbEkeJ2uYxekGw+jJPOw72n7rhlBmgCxB61ro9LjstUp
         4kYM5dmoLcXWjxTvNmw4ve5+zdArHMSWOM8lonnNOHBOnYdq65LUoYLHeSV/J3NEmCsN
         FB04knqBBbps1K7Dl7dzX0A4ewnsTxIJSxry+VL2ObdiSwGqQ9Tj3bwc2ONlry5y96bB
         PEPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029894; x=1795634694; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjJYvzFdvze5iPMTQvoCwzZHkwJLHlrVNoowatB6Euo=;
        b=ZHgYIYAMO9uwXwnOk2JzGzP0BSP/igsTyYedlQuYqMEdbqnLBj8c9HqDQ0gES29T+2
         WpWjGK9yCJZ8MFsF3j2i5TK4zWjEsaRQhRk5rnIDsdzJSdUKNullzuxa88CcjcC+mAph
         upYtgdx370uDZH4kf3RzTUR7nU+RfBe35z6/n5QAxPXH5EBPcJrYdkUc2MMhuHnqWpxV
         Qz+BhNecbA4JX0Nv12msFHT1PR1VlsYBEQWCyXJ4N+7sHc7Zn1CfhqiQr4Rb3epfEsZN
         3kDGWjsiULfxuCYWfK/BK6rzAEQflmnlThsbmFINZqnmFdeqFtFu1Z5XQHOQO2yEjfIZ
         80tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029894; x=1795634694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EjJYvzFdvze5iPMTQvoCwzZHkwJLHlrVNoowatB6Euo=;
        b=YaTLpCg1uuysEPsRJaO6RvyLNciCWcuVFu2dtSw4mEqi6G2WebjXc4clGbO5U6jRAs
         TcvzWmsPZHxPBEhY/aXheV1hu4ygQR7IRPGkscZEPXEIdcCDsY7Uf6NgRhcG5bpd5pFe
         yWIwFL3P1/ICN76KBRAED1nqnrhJtsOodgUEMJuce9eSrd+7CGP6scHZb1byCRuPVASD
         mM45UtghArn299T9xOrjNS3pzf373nROC7e2wfW+sRwRuiPG2okuEw6rS+v2IrEpmDk/
         LPUfTsWehVOo1pra4efZ5TOxwyC9J5n8ma526PrfjzNK/kF/PtJ9v13MaV9dU2Eq3iFi
         GgeQ==
X-Forwarded-Encrypted: i=1; AL+hErHbJThWKAp3/nt8wFblqW8IiarM2ksezQ2p5A+I1UVtqg+ByGCcyGg7H4Nbk2CTgtclCEp84lUCYIV7sJ0kqg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8KivpTNo8McTcIWy5cNo2EAD561BxRRKieriy4RRwe2C9k4Mm5
	+NWsllRa8d4o0yvr0IMU3UNh1BwWLqLtzJI9PD56825zbwMZjYtN6UJgL1tferhKVeINj8scRMH
	6CtbghhYKgM5XNpwJvOCo/2fjCs8AA24=
X-Gm-Gg: AZFdTZfDq2buhA7OAXbB2r6qkeFVc8eLKj2eSdLYqgQYpyZNppXoVlamDZIy7Oli49t
	sWnhHw0xqh1kNTYJugmr39/73Y85jH6qMorc8xVfE0EMjkgmF2Ar1hqsxlCRAMPc85nEDzHMX4e
	9JgLmIcZlqKiyp+/K70vyDMNL5LQ7GwCXqJrCC69tf5tWHHUDax602OyYcjSF0vrHKp/Or8xh6o
	iulwY4ohPnQAS1jY9is/jZqovC2dHP4I+GVz3zr6rnFO5gaGCgp1CDZibLqKsaXkr4gPb0bwW8t
	ej85aqHp1JUZdLlaUOY6lIJQeEVmXg/ZXhIHVNILoiRRcOZZs//5y5g27Ad4rs1xgtYO9iN43pv
	/Jlmbm233N+s+Ef9uyv3YQo0et3o8fJWWxrxlBQ==
X-Received: by 2002:a17:90b:3890:b0:3ae:9944:3bf0 with SMTP id
 98e67ed59e1d1-3b3d07bec9fmr3738908a91.34.1795029894222; Wed, 18 Nov 2026
 11:24:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Chris <hoopyfrood42@gmail.com>
Date: Wed, 18 Nov 2026 14:24:42 -0500
X-Gm-Features: AclHuK_3EOv6FHAHbDp6-ErJ25zBqiU1yu-YUlfjEHlibePkPM2zLKcLWHf-JWM
Message-ID: <CAHaeJsT7vfKnjwDhFicMUVraf7EeSVXSZVdt40ri3u-accUsFw@mail.gmail.com>
Subject: =?UTF-8?Q?MT7925_=28USB=29_as_a_roaming_client=3A_130=E2=80=93350_ms_befor?=
	=?UTF-8?Q?e_its_first_frame_on_the_new_channel_=28MT7921=3A_9_ms=29?=
To: "michael.shih@mediatek.com" <michael.shih@mediatek.com>
Cc: linux-wireless@vger.kernel.org, nbd@nbd.name, lorenzo@kernel.org, 
	linux-mediatek@lists.infradead.org, 
	"ryder.lee@mediatek.com" <ryder.lee@mediatek.com>, 
	"shayne.chen@mediatek.com" <shayne.chen@mediatek.com>, 
	"sean.wang@mediatek.com" <sean.wang@mediatek.com>, "deren.wu@mediatek.com" <deren.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_112455_965961_B99C57DD 
X-CRM114-Status: GOOD (  11.06  )
X-Spam-Score: -1.9 (-)
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

Hi Michael,

One more observation from our MT7925 testing, this time with the chip
as a client roaming between two APs (802.11r).

Setup

Netgear A9000: MT7925, USB 0846:9072, mt7925u. Firmware: WM build
20260605184805, HW/SW 0x8a108a10 (20260605184651a), from
linux-firmware 20260319.
Kernel 7.0.0-43-generic (Ubuntu). The mt76 modules are built from that
kernel's tree with our local patches: the survey busy-time change from
the earlier thread, plus two crash fixes. None of them touch
association or channel handling.
The roam is wpa_supplicant's SME (ROAM <bssid>): FT-PSK over the air,
between two APs on one SSID and mobility domain, from ch 149 (5745
MHz, 40 MHz) to ch 44 (5220 MHz, 40 MHz).
For comparison, the same roam with an MT7921 (Comfast, USB 0e8d:7961,
mt7921u, the same kernel and mt76 tree) and with the laptop's Intel
Centrino 6200 (iwlwifi).
Measured (mac80211's own log lines, times from the ROAM command):

Step MT7925 (A9000) MT7921 (USB) Intel 6200
disconnect from AP =E2=86=92 authenticate with 145=E2=80=93176 ms 51 ms 77 =
ms
authenticate with =E2=86=92 send auth 126=E2=80=93136 ms or 345=E2=80=93354=
 ms 9 ms 0 ms
associated, from the ROAM command 382=E2=80=93635 ms 120 ms 115 ms
The AP's answers (Authentication + Reassociation) 15=E2=80=9320 ms 6 ms 7 m=
s
The MT7925 figures come from 6 roams and 22 joins. The authenticate
with =E2=86=92 send auth step was bimodal: about 130 ms or about 350 ms, ne=
ver
in between, and slow in 7 of the 22. The MT7921 and Intel figures come
from one roam each.

The step that stands out is authenticate with =E2=86=92 send auth: the time
before the station can transmit its first frame on the new channel. On
the MT7925 it is ~130 or ~350 ms. On the MT7921, over USB with the
same driver family, it is 9 ms. So USB alone doesn't seem to explain
it. Our guess is the driver's mgd_prepare_tx / remain-on-channel
request, or the firmware's channel-context switch, but we haven't
traced it.

For a voice client this decides the result. The AP's part of the roam
is 6=E2=80=9320 ms, but the MT7925 is not ready to transmit on the new chan=
nel
until ~400=E2=80=93600 ms after the roam starts, against ~120 ms for the
MT7921.

Questions

Before granting the new channel to a station connecting to a BSS on
another channel, does the MT7925 firmware wait for a scheduling slot,
or run a calibration? Is the 130 / 350 ms split expected?
Is there a faster path for a station reassociating to a known BSS,
such as FT reassociation? For example, a firmware command or driver
setting that avoids the full channel-context teardown and setup.
Is ~150 ms for the teardown and setup (disconnect =E2=86=92 authenticate wi=
th)
expected for the MT7925 over USB, when the MT7921 takes ~50 ms?
I'm happy to test firmware or driver changes, as with the earlier
thread, and can send the full kernel timelines.

Thanks,
Chris

