Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6911CD342C
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2026 00:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNLigKdON3N83dexsL9iAr5dG4JmFlZysFA4uQx/JUg=; b=kbu2nChsb663wEX1qiaLYtZySt
	MyQpMD+3Qx6sS6X/9gli/AVz2PiXku3ry8rZj3aM6LoExyTgjQ1ZU40dqrXOrg2TjJfLl4yg3OaeZ
	HhVf7f9ngKqVB7i2Lp4WvWp7EFiC3rV9HxRnQi5JQzAXEjDutJ40o6DSZ5WBexiACjf7OdENMt8JJ
	ob2ywIxr9BrBZwWADDrhjaMf1IKi22PIwYvt+IiKFPNJTaJ6M08VlZeed2WoBZUaikJl+vlrTSHtS
	3UZNtZSowFJTB0471DxUMwUmG+lJxWlHhJwmKUYFC7V2M1WkYaLX3KaUawaiu93Xl0M0dUJJR/w0O
	I4M3qwWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKmaU-00000002Lvl-0NaD;
	Thu, 07 May 2026 00:27:34 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKmaS-00000002LvD-0HLe
	for linux-mediatek@lists.infradead.org;
	Thu, 07 May 2026 00:27:32 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-38e7d983f79so1958181fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 06 May 2026 17:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778113649; cv=none;
        d=google.com; s=arc-20240605;
        b=W9c8tENvLzRpQlzxlbKA9GZpxtG3tzpwXPxYPi4MFC7lneVfdVM4pYW9HANDwZ5r4U
         z1NK6buqCBE+P37+uOKbL5ae/FX1oCMRlkVj9TXvweSWKVYlUz3JIoBMjUEp6RswFx5U
         JROrpMh8ZvXc9WvHWGvQj6jv8g1IFDJ7UXh3RAKo6DXiF35kXWL9g5EIiXmhhLNBmmTj
         /E0f7kd49ydUscKmf9051AT+F1ifI0BXxzEykl0P7AAujSlKx9ZPTEiMrGU0gbpRIN+X
         XFenchQj7rg1DQziI7QQTLMJUuTQH7sWKP68IQbT0uyoQ7H0Ek/6Ecg/biOiVFKBDh/N
         1vUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JNLigKdON3N83dexsL9iAr5dG4JmFlZysFA4uQx/JUg=;
        fh=yvPN9UxSdMoc8i0ciPg4cjv1Dq074AvDv4Zy+lYHIAc=;
        b=bNvY5DdsnNfSdKTmheAo4ZIeRCnYTsPW19umv9mzdwrQ97O+aZymYPqNBgRzPCuM/j
         tnCfQsbV2xnV6T5VO4vBgTcCs2hOKpQqDUgk6/mdFv0k557QIBVBjbuwKlkW5s9Sa2dR
         E17JUtHFZD5aYr6DlxxXtzm7HBs1J8pJhyOYGVBFnifBiAsOsxLCL504Z9t4LVP5kpFx
         3qbEPG1ir7CnbwBvh02IyTii/H5gdYggKxVggETiwDYM0QvJax1MjXsvBUuBuOw1Dbfe
         6+zn44Ce9IxKz15a+fZ4FrQ5xG0MS5bo8D4TDZqPBYDMtMNSyGlSo9I/hnQdutz9sasQ
         Oimw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778113649; x=1778718449; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNLigKdON3N83dexsL9iAr5dG4JmFlZysFA4uQx/JUg=;
        b=N04P5pdSUKTXT1L/XrySOzsFaFHt4iEZ1h8YTWp12gyk8evkdyJpj66wJfQK8qs8AR
         OgQkMIhh+Q6PvU/BwxYQy7o8FNCHty/sNCHomhqmhV9OLHWlX5nt4/1Le/XWkQnecDwa
         M7qM24mF5R6psZGFBGHQetFtFzWRx2GNkso33YVboHCuueX+by3rzUQwXPkfFAUkLUZ6
         gYF45OR42jUyl1nQ5TQ8/i97PMHJ3UzPbkK+tqXRET6Cpmv/Qcxz3kF1ERokYTyzC5kF
         TCgfkZalIUtazWGntpaohpXkO06fDOHCUG9Mc+ybw7/1Zho4+bCx8eF8tyA1PrKzMr8j
         fy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778113649; x=1778718449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JNLigKdON3N83dexsL9iAr5dG4JmFlZysFA4uQx/JUg=;
        b=NHX+9fUCdmoaK20FzYfIrAiK4nIGKl8dxZE0jQf2wfDYvf5PmM7MTdpt5rFHpAu01p
         +Qyd3tLs+iey76D3SdqnYAm1asfQUVM3u1jYtvZtjrGxvhWIOvPWrJnMfEZL0NFc9kI6
         JQKd2NYeG2iQevqZfAwKONC6VUtkJH0o6/fJVlNy/oI/CFIwqTCjhyAOhsvbYI5ucWee
         WIKhoXanBeaxmH1ROJZxCCh3ZIIQfOgBww7uQtAQdSRwU9khDPqKAAKcQishuS/od8vm
         M4X1x8nWl8glVSxTgYBKPbL2tDZ59NI2Q9U1/LSdzcQeu9wD7Ya25zs0SSVdHsGRVF1+
         o/+A==
X-Forwarded-Encrypted: i=1; AFNElJ+xuTOcARhP6+KDOKMF65GGNr54s/rfLdCg+p1eWhJKEYjG2x+chpbPva1TQ1GIcXZXbtBmOciGoFxngBwgqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHDoasOCwpUmpQI2bNFmexmg4YglYupbvachRlFl4fNg7YghIn
	Mh1rLgATXwKa7OcS2z1tX1Qn37Q8tDWTEC7y7F0xxMGVoR2VQ/KalV1D3Vba/q8/6ohJ3u0q2fD
	ZMvHdixQlnyjtHvGIt4WeCra5ml+TkZc=
X-Gm-Gg: AeBDiesHzAN12md5FXp1iKrOKnPQZSF9njXtHjdvvvDNMprn10CWCnsdrXIs7xwAyPb
	E/ikBEyrs3iek0wUHx/fIvbaSxTMYhVH1yu5WCjvCCXW59AGiI+MDnBHVWWvzXPu8hSBZauKfdd
	RJ3LbhLVJfs7syQLpxfeVKoeJeWQ4w8244wDN0NIValCspBJVEnLoDeW20bT8BSzx3la4EhlgDn
	2O6pklHWgu7Sup46KNZYmiRYTZKVH6n8OXqbPEwB5rSmNQkUJgW/52eV7Dk0o8EDxYqm0S2rIF5
	T88v4MWn47J3l2Dtkc4d6Wzu8/zs
X-Received: by 2002:a05:6512:3d03:b0:5a8:99bd:12dd with SMTP id
 2adb3069b0e04-5a899bd13aamr190899e87.31.1778113649155; Wed, 06 May 2026
 17:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <CACjnFagN9zeSkwEv3-CSPJDUENPcEcOLjKyQoLQ91Yjn=rq5ww@mail.gmail.com>
 <20260506200918.D68321EA006C@mailuser.phl.internal> <CAGp9LzqkJ8QoOnBAiGu=uum3-LmCB3yHr91sw1HoLw+7ewNx6A@mail.gmail.com>
In-Reply-To: <CAGp9LzqkJ8QoOnBAiGu=uum3-LmCB3yHr91sw1HoLw+7ewNx6A@mail.gmail.com>
From: John Henry <jshenry1963@gmail.com>
Date: Wed, 6 May 2026 20:27:13 -0400
X-Gm-Features: AVHnY4LUug30DwDnNEf_34lgWqQd9BfnsaygUSMtcheO-lYYpws24QzLgvDGg5c
Message-ID: <CAN6xzWfOLLjA1dcLZ=eugjh7iM7KK30iG8U9QOPAY0GoqxP8ug@mail.gmail.com>
Subject: Re: [bug report] wifi: mt76: mt7925: iw set txpower fixed accepted
 but ignored
To: Sean Wang <sean.wang@kernel.org>
Cc: Javier Tia <floss@jetm.me>, Bradley Pizzimenti <brad.pizzimenti@gmail.com>, 
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, nbd@nbd.name, 
	lorenzo@kernel.org, ryder.lee@mediatek.com, shayne.chen@mediatek.com, 
	sean.wang@mediatek.com, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_172732_137807_56B68BDF 
X-CRM114-Status: GOOD (  11.22  )
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

Hi Sean,

Thanks for the pointer. I read through the patch =E2=80=94 it addresses the
txpower reporting / display value (iw dev info showing the correct
dBm), which I think is a separate concern from the issue I reported.
Please forgive me if I am being presumptuous on this issue.

This issue is related to monitor mode retune's of >=3D 5 channels.
retunes of lists of 4 channels or less does not exhibit this issue.
Neither do I see these strong "RF Ticks" in managed mode.

Maybe a bit more clarification or other....
The behavior I'm seeing is a real very strong RF emission at channel
frequency on each retune, observable on a fast spectrum analyzer. It
only occurs in monitor mode and only when the per-channel-set sequence
touches >=3D 5 distinct frequencies. The same chip in managed mode being
driven through the offloaded scan path (NL80211_CMD_TRIGGER_SCAN) does
not exhibit it, even when sweeping the same set of 5+ frequencies.

Reproduction with stock iw commands (no custom code):

IFACE=3D$(iw dev | awk '/Interface wl/ {print $2; exit}')
iw reg set US ; sleep 1
ip link set "$IFACE" down
iw dev "$IFACE" set type monitor
ip link set "$IFACE" up

# This triggers narrowband bursts at channel center on each retune:
while true; do
  for f in 2412 2417 2422 2427 2432; do
    iw dev "$IFACE" set freq "$f" HT20
  done
done

# This does NOT (only 4 frequencies):
while true; do
  for f in 2412 2422 2462 2484; do
    iw dev "$IFACE" set freq "$f" HT20
  done
done

Bursts are ~800 kHz wide at the base, -30 to -50 dBm OTA at close
range, brief (estimated few hundred microseconds), at channel
frequency. tx_stats counters remain zero throughout. Behavior is
identical on a custom mt7921au board and a retail ALFA AWUS036AXML, in
an RF-quiet environment with no other 802.11 / Bluetooth devices
present.

The strong mode dependence (monitor per-tune yes, scan path no,
identical frequencies and counts) suggests the firmware is doing
something on the per-channel-set path that the offloaded scan path
skips =E2=80=94 possibly per-channel TX calibration. Is there a known firmw=
are
operation triggered by the monitor-mode channel-set MCU command that
could produce this, and is it suppressible for passive sniffer use
cases?

Thanks,
John Henry

