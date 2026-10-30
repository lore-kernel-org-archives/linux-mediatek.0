Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24AD606B6F8
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2026 21:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HjZ2CE06;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pMBlVG2P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8cw2VznT115t7XvjisUuqdBWNpKN4PUjAu1fVe5hJRw=; b=HjZ2CE068a3LV7ZY2hqbQnXRGW
	+mO6dR51bhh1UEAb7CB63mmlHdCcE+qcJ6wjx+iGP1tFyR3HnxDGniLa12nCfuEv8RtKWUbUaIqnT
	c3+K2D43rjg46Yev7D4WNdPiAfaYrwhIllXzJbia9DEvX/pnmmAKgZZU0K9WW4O4A80tamP5gGTC4
	9F1yNssh8yOVedevn7VHbhSST/mw6DE6IMuWmsxV1988IdpQ1IcB6Wsl5EckaRTsmVHyti6U0QFTP
	+hKKrf9d4cysqWFa/EBtbWDsebjYglpH4woFy+nh4gDEzBM0GjKBI2djwBjs9QFgTVNKW2gfzhD2r
	p9j4+3uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtlZ-0000000Capw-3ngb;
	Fri, 30 Oct 2026 21:04:01 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtlW-0000000CapV-2hP8
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Oct 2026 21:04:00 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-5eabf243d05so468289e0c.2
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Oct 2026 14:03:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793394235; cv=none;
        d=google.com; s=arc-20260327;
        b=p+4yuGo4OgJmj90QyQMOfDLGsecN6LupQzrOV530rwFY/jnx8DQQy7gt8RFyifkip2
         6HZocqenNDVNxy0ahRVi0KwrXTxhrZt9Tzo///gA64fIQaBToWEaGZB0Ze0BwszVLP3u
         yG1nxeFZqIf3kGP8JrOSMTKuNOq6o3NxkaqNc+wprIp6qDjtTS0eEKmATXb08r8woEOj
         PhjO7IxxJiy6Hi0SZRwI0cTR24SVDJZ1JYUZwQx+d/mLN/FP90ZtuZsc5YuDVpu3d5nL
         4IAQwyQpRXBtFWbeMBrKby+ar9VQkappWayFFrErO6VqdAIwLD+yFdeBwuHxhFToZWcY
         ibag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8cw2VznT115t7XvjisUuqdBWNpKN4PUjAu1fVe5hJRw=;
        fh=3AHeD6OttLexNvzQKkANkq0FMkSQk824WVAh4x8Ola8=;
        b=jgtZU25gPUAnpBA/YRafM2DC8XY8EVhuWytHA4EGFWC3AnLiEFbVo1vF6PbtF6+bR6
         8f63mMmJRXmMkPCnYnqJN/V14c/vae3O1Ux4TgMHEPXqb6+2QXpZsgoPMzL0SJBnMttN
         RbXi9fJX56MpW39Oc/oPotXU+jjBzQHp3zNlsaEOK7tioIWfc21/E/eZAEFbORCpoOTL
         NzT86FHkOYv9AdGme5P9cIQtreiunID1N67Lwc8ZpustGyTSi5WAkVxE7MTsVUo9EZxg
         eZ6oCTX6/5+jefqWpwERpkD66aKXCnxzUOmf65cN/46Yxupydcwacq/Gf7iK3yiqL36y
         N8BQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793394235; x=1793999035; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8cw2VznT115t7XvjisUuqdBWNpKN4PUjAu1fVe5hJRw=;
        b=pMBlVG2PDnB+FdmVZhqPejfNTzhV8d/rSjmASIvP0+ReL4lM+13+rz99F8DH0B1YsZ
         1vtSWd9UXFcAnhWGkQR+CZDLCCMBD9xS/NMeaY6vT6mX4Vc4vf8z79ze4yvg6WqDI0Nd
         +Q86wdDqBOtenyoskvHOFYgVvt7ZY6p8vV3hVoOwb1Wa9Bwyn4bfAth8k4O+BdIM4RED
         LZirbhf9IzV+UOsxB/Z0K3eZarCtDlEzRw3c0I8+GhWfo36TolCsZi8ZaH5P+cMcK/2f
         /qDJcLVm6eg06pMATZM6bAm5KShgbb2C5Xj3828dgzD40zWJqArKr2gpHRoZZqXdMEhx
         joUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394235; x=1793999035;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8cw2VznT115t7XvjisUuqdBWNpKN4PUjAu1fVe5hJRw=;
        b=XV5TB6k4xvLIz7NG10iycskAuhV6a7RFyrcYM6Zrcg+ZE3wzkF6RSWSwkqEswOzWuU
         CKFF8bi5VZG4E2V1rlmqxTS/EKCd23+B1Bqr3lorjm3IySWNIkCeK1PbVHnH6lXH6Gr0
         79f01M/5/090/2GsQ7JBf7YI2TXYlY1O1YGo4eW9y3saPRQKWGRkZvPgqQTfYUtv/Zhg
         sEEoSCIk6+/s5WcYpBlh+CIe2DZNC9qPuf4nVcROaZQgD1i3bg7QcTpJRu3aPr0RKDJk
         oGZofliCclHi4infjrsAViNfnEsyyvmmB/x/ouk4j6q4RYRSOzum6iaAcpnF1mc5wrJq
         vmmQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0YcHRNdaxezkoBBq/r5iHMuguAIW378aY3/tpcv2xg2N0GOqM9I9wn927Cs2LQpA2Dg/jwx8IhhR/VGMd0g==@lists.infradead.org
X-Gm-Message-State: AFq9FYI9XB23eZFg23IWDcnWrDJbHVQf9q9cv2x+jng1OSegNr5nWmTe
	uEKhYDgOMN4GMkHAZ4ylI86ARfkrjGi9gzDRH2T1kFiMWiXw44t3AONX06sQXsCyk89SEAyF7Yx
	eDeOi4bNglneViaeFBJjK/Yt/+DG7wZE=
X-Gm-Gg: AYBFou1hSzv/f3MUaeHFZrrXnl8RFQQXVGMlCjNwej1BT7elZByQgO0ooXsde3Bq15x
	oNPIvyw24LY0tdRoflT0LSjiFERKlwcvDYjxw4C2elcWqhm/5RYiwWDUWJMHOI4CcmgZrD1c0yV
	pD2IkKBgwInDUUF2jbYgKhhTt6KFbqvjChdFqUCBCCbm8jSeAnelnprHdeLOt0BLynCjyRk+U1e
	PB9fdx1z1XWW0iSVoVmkQAaUp+e9lhmIlhwjdSkzofk6deov3O+ivWQXMtPE3HHqjPrNHJoeDvc
	4s7XYNBW9/JUQJg8qq8PNKaDDjVLJGj05eaC0t21f4bV+CKIvaT30vs9PsmUTgiBBTt5ajj7T+r
	z/+C2kVPaofufmYM0uUXbM6suHVb1wkbuH9bBPuP2c/wG5P+OiHIa604fJybi3Bb3fSgbDhU1ru
	0Jq3KTYYf9DRA7Jd3d
X-Received: by 2002:a05:6122:4b86:b0:5ea:f220:fd6e with SMTP id
 71dfb90a1353d-5ec6881fc37mr2433469e0c.11.1793394235358; Fri, 30 Oct 2026
 14:03:55 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Work Money <work62153@gmail.com>
Date: Fri, 30 Oct 2026 23:03:43 +0200
X-Gm-Features: AclHuK9R0WB1q7BU-kTmrsOlmQbI-jyrnFyfsmVGDjzJ7zODOf5dHRMCYPJhA7Y
Message-ID: <CAEVijA0t2UkokNOpKN-Uje4n-ub9CwZrZN0evhWnn2eL1CvzPQ@mail.gmail.com>
Subject: MT7925 (Netgear A9000 / MT7925U): UNI_CMD_CSI 0x4A acks but STA
 firmware emits no CSI reports
To: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, deren.wu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_140358_693636_7EA1997D 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

I'm trying to get CSI (Channel State Information) out of a Netgear
Nighthawk A9000, which is an MT7925U (USB, WiFi 7, connac3). My end
goal is WiFi-sensing research.

What I've found so far:

- Chip: MT7925U, mt76 driver, station (STA) mode.
- Firmware: stock WIFI_RAM_CODE_MT7925_1_1.bin, build
  t-neptune-main-mt7925-2249 (MT7925_E1_ASIC_ROM_RAM_CE_2249,
  dated 2026-10-16). All code regions are encrypted (ENCRYPT
  feature flag, ~8.0 bits/byte entropy), so static RE of the
  blob isn't an option.
- Command path: I'm using the connac3 UNI_CMD_CSI_CTRL /
  UNI_EVENT_CSI_REPORT (both 0x4A) from the mt7996 SDK CSI patch.
- Behavior: sending CSI_START (tag 1) returns a success ack, but
  the firmware never emits any UNI_EVENT_CSI_REPORT events. This
  matches an earlier linux-wireless report [1].
- Kernel side is already built and tested: vendor netlink
  interface, ring buffer, debugfs, and event handlers. The only
  missing piece is the firmware actually emitting reports.

Questions:

1. Does the MT7925 STA firmware include a reachable CSI emission
   path, or is CSI reporting only wired up in AP builds
   (mt7996 / mt7981)?
2. If a handler exists behind the ack, is there a specific TLV
   parameter, sub-command, or precondition (monitor mode,
   bandwidth, sounding/beamforming enabled) that triggers it?
3. Is there an MT7925 firmware build or roadmap that enables CSI
   control in STA mode? Since the mt7996 SDK already implements
   0x4A, is a port to the MT7925 STA firmware feasible?
4. Any alternative route to per-subcarrier channel estimates on
   this chip -- ICAP / spectrum-scan mode, or RX descriptor
   fields -- that doesn't depend on the CSI command?

I'm happy to run tests, share full dmesg/mt76 debug logs, capture
traces, or try patches on real A9000 hardware. Thanks for any
pointers.

[1] https://ratatoskr.run/linux-wireless/2026/04/15794137

