Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DD6CD8C9D
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 05:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cd7r9tX81f5e4GevObYRIvKFKIjgJsqAqNi2akdw1D8=; b=Ia+1vQbQqahnef7WGesZ9mjyBY
	ClxnTJpC2Vn9K2+mHDsnt9R0p98w59NEyldmuandU7JhiOUS3nWuW8Z3eJaewQVLS6dVlrwuxjq6j
	G6J8u94EuON4uk8d3X39n1jLk/B7qR9VpobZSrszkra0+51xN1PmmwfEByJfawU+DryIblliXd0Ol
	VwHfwr47VCr1SqW7F8yYvPk0/s6hVjR23WhqRX1opD5ZwMG6V7cjaHrsN3djwJlM3HDehQy3hOwkJ
	ZeJey1Q0D3TtEk6I/bBxX1zCQx2GH5WkM4Ji0l/fgB80Om9eM0ax6j7Uw+tpgl2vR6fx7d2T9efIZ
	rGObrnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSXC-00000002qBn-2xAa;
	Mon, 08 Jun 2026 05:28:27 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSXA-00000002qBQ-2LkB
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 05:28:25 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-43ca73487d2so2632756fac.1
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Jun 2026 22:28:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780896503; cv=none;
        d=google.com; s=arc-20240605;
        b=VVjUR5fOa0esgsFwNmQVefS75M0yf/psRC1v+3QvxO0tfZaghfOLHOlEBznpXgUTak
         lTG9xkM31TVO0u6ib4YA+o1nsALwEk5UUkhx3IzArmg4xeyvJs0qmA95FyImK5WD0H5I
         9TqeJEecjgMsjXNTWvVRa9omPPx/VKHAo34Ax/CZsZx2brgJ5vlcI1e26esH4pGlKVmm
         qKP4pB0scBLMrqW6gwEzh15Im+q0HbkWtLulVKj3f/18thgI/pfo2QIBCWWRlIfBNZRn
         EAfuxQ5QjsOfWe+a9sgtVrHlIUUwh2a8eHQofnsYUzFxJtcS/I8NCggLl1W/ri6ipOUb
         PN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Cd7r9tX81f5e4GevObYRIvKFKIjgJsqAqNi2akdw1D8=;
        fh=Q7QZYtqt4eGGjFgxHTeeLsVTa365AQ5efja1N862/yU=;
        b=ecog5zq4eUKN1irnSpT/JuHy2vuUkv12PHKgRZwxAfwiHzcGBbABBMS/0rDXbHZjiV
         6CqrajNhAbbbTiMZUHiwV4l3LxDQzx/89Wis2MwM5qZyPe/tlUF8z/oF/ZFrzg/fxoQ+
         7R+YxkfiGJRY9OudhlMGBbYGGTsET/Hzf1A1BL0ShZEharWSTBgvsJuVZcd+xFIT2vLL
         aaD17liFfM8oTo/OrQXcZMTMsmbQF07grYhkf62W3VHoPUyJdrZxrizbdj8PgNc40LO9
         NEl494RdYwTB8zbgbzDpGkg0z98NIimXRC+fSJK2dlnsR7GVlDElPkoMN4uQFwqBasX1
         b9zQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780896503; x=1781501303; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cd7r9tX81f5e4GevObYRIvKFKIjgJsqAqNi2akdw1D8=;
        b=AlzQXJ7cTYi1J/nncIKElRGufKFmM6Mkfwtn7QUud5Gu89f+v7caRAxgzPNVmSIp5j
         GjdXn3ak8Fy+955pla5hMBxemB2NegRf5xLFscvK6D/3R5NS8bb+NRtJolf5W7xHRuSt
         HsPA9jEXgYvaVLIu8/Qy3feJdOfgb8+XARCvn+U5xZe6tTXZIWXMAcUvAAutOgZHu2If
         Vtxg1ClD+FGXu9VlqhjrUuUUTa4Y99LLW4xQYnP4Xfx/s2xv4u5YPdCbNvItQ9xp8+py
         x3dEuwyp7HMBeGUAKsGi40axL+XLxbmOiigDKMmixZJkuIV4bqL1I+YFCgYFQWCpaGl6
         jUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780896503; x=1781501303;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cd7r9tX81f5e4GevObYRIvKFKIjgJsqAqNi2akdw1D8=;
        b=HKoOQ9KM8AxoRka+5wSLAIBCUc0ZRN5+a5s/gKSbpjnw2xydABcgzSwcu/CVa0usJ+
         osQw0JCn70DGZkMsWsY3p+NpA0tHjcL0bVj/mf4elvCQxpNliPP4PPzt+kIDi0PXx9Ft
         82gmbTQkUhZtS1YOVsdMRu5F7VE4IUdu6Bz3o5PxsRAZwkuTIOcv4BeYTcUDqWMmlSdZ
         fbt6XkEdXSO+FHwRItkSP5NA2mPRTROpUNWrlQXpQqmeBf9RyxnwRz4d4zRxvPf5FuMD
         2RgblaIX1nkv6s/Wv5g8bwInpGwqQ/qST9nel/iikAoU1F8btez6x608swkYowgRiLKo
         yyUg==
X-Forwarded-Encrypted: i=1; AFNElJ/5/L+isnktzjfKrJFOC+iO4vTTYCZmBlm2jEOzXXcLufWrHhUiPu/dDCSxaAFmfQ/1gRTG+2rsvDewzC84xw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3T487U3p11II4hUkmUviYyolxv74fR+LtI/BbOp+4SANOnuze
	w8OKBi8+mvm6g/0AA30ZPjSen3TD2n169t8FeqRIu5rBBGBQQRNIDUT/vaa5EBfJCuqA7fkwu8X
	5h23K3SUjEg/nE4OBSo9Gz55Aw8lHlQY=
X-Gm-Gg: Acq92OFHihGvbbwMhrkzubk9PEtG1FSu8mXbEND47LpChxEgGp550/MXd5bh0D3N5X7
	RUZ5vv0fetG0hypG7KdFyvLIgRyecDBkCG53MpGuPgiw3w2NKc148i94iMewz7x8u3+iSS0XPNl
	j35jwOm4XDlWt11etbiq+CcHtiE2LeahToG5moAr3OjmWa8xekMssM1KCDt2IfJIowyrnOK09Yk
	Yvj1tC2SFI8nr9Yra6LWAMg/ZwsAJs4faS0RYBxB4BkgOz44LgWd6gc9HXm5Ci1D+G26tBKzInx
	Ctws0eEoABn3XsiGQ8JBOBCR69TCVg==
X-Received: by 2002:a05:6820:16a1:b0:69d:9132:566c with SMTP id
 006d021491bc7-69e6d3850b5mr5320851eaf.13.1780896503164; Sun, 07 Jun 2026
 22:28:23 -0700 (PDT)
MIME-Version: 1.0
From: Zitong Zhao <zitongzhaooo@gmail.com>
Date: Mon, 8 Jun 2026 13:28:17 +0800
X-Gm-Features: AVVi8CeTdh9nKNC9Rjxo42hkd8Bz9am3PVHARf_PYwqxQQB7SsQc7Gte861HNjw
Message-ID: <CALaig7Pf++Hqn_c4hEa8zXHKkJpbmfSk=Bet_W574o7eBKF6Rw@mail.gmail.com>
Subject: [mt76][mt7921] Question about host-visible deterministic TX
 scheduling / TX completion timestamps
To: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, deren.wu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_222824_629681_149021BA 
X-CRM114-Status: UNSURE (   9.92  )
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

Hi mt76 maintainers,

Resending as plain text because the previous HTML mail was rejected by
linux-mediatek.

We are working on a deterministic Wi-Fi TDMA research prototype using
MT7921/MT7922 with the mt76/mt7921e driver.

We would like to understand whether the MT7921/MT7922
hardware/firmware exposes any supported host-visible primitive for:

1. TSF-scheduled TX or hardware-timed queue release
2. firmware TX queue admission / queue pause-resume
3. reliable per-packet firmware/PHY TX completion timestamps
4. TWT service-period control usable for deterministic UL/DL scheduling

From the public mt76 driver and our local diagnostics, we currently observe:

- RX MACTIME is available and useful for RX-side timestamping.
- TXS can be forced for diagnostics, but coverage is partial/asymmetric.
- WTBL_QUERY returns only a short status-like response in our setup.
- TWT_AGRT_UPDATE returns ACK/status, but we have not found evidence
that it provides host-controllable deterministic queue admission.
- We did not find an exposed TSF-scheduled TX path in mt7921e.

Could you confirm whether this hardware/firmware stack supports any
host-visible deterministic TX scheduling or reliable per-packet TX
completion timestamp interface?

If this is not available in the public mt76 driver, is it a firmware
limitation, or is there a documented MediaTek interface available
through another channel?

Hardware/firmware in our setup:
- AP side: MT7961/MT7921e path
- STA side: MT7922/RZ616-family, mt7921e path
- Driver base: mt76/mt7921e with local research diagnostics

We do not need confidential details on the public mailing list. A
yes/no answer about whether such primitives exist would already be
very helpful. If this requires MediaTek confidential documentation or
an NDA channel, could you point us to the right contact/process?

Thanks,
Zitong Zhao
Cyber Physical System Lab from Shanghai Jiao Tong University

