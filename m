Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97496C5518F
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=13TTvH1EeGqMs0mz6hnT5sV4Dz8BUjbRnK70xfNiQaM=; b=kD6AsL0M3jZNCzLFIvGiNNOphx
	IMWekNR7TbceBgExe1pzNgXxYdapd+Y1FuammOZwCRnE6RBm+4OOGZfKhp8gAbzF+jkYn2DgZlRtR
	JyyYXt9ExwCdQ01bnItJV/EMSY4rk7H2QxM81VK/INUMRm5c2uGSD31DdWyr4c4CTSPZUNLFxbD4K
	4BKuI/3Xju+oCMHbXdwnxrOvO8P9GgJqWUzzq5zmOy/4SAAl/XHGsMAA+LmvBJwS4LSZyQPIDYTEA
	fw08g4EiQpZE/f5qaEM28G/nU494yluMB5t+pGajRWiT2HmHF9nVnN2QjP3u7YDM66C01P3yLoEA2
	HyAUuBBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCFR-00000001XGa-0G9m;
	Tue, 04 Aug 2026 10:19:49 +0000
Received: from mail-wm2-x07.google.com ([2a00:1450:4864:31::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCFN-00000001XGE-3M66
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 10:19:47 +0000
Received: by mail-wm2-x07.google.com with SMTP id 5b1f17b1804b1-49557073245so11348725e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Aug 2026 03:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785838783; x=1786443583; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13TTvH1EeGqMs0mz6hnT5sV4Dz8BUjbRnK70xfNiQaM=;
        b=ZCt9MCb/ySb1YUsB6J8g53ze4OGVgRcAHFidJUEKsMa0dzrY1SMqsv1LQDrqZXaRMy
         05GZnpa4d2DEQ3tArNXaqM+jnZPXWo702NZvobb1dRBej2H5j4TCoaCt7pP49vuRSMyp
         92R8AWIi8lybmKZTx0Mlw9AwLDmoYeAZra+57kBffJEqu9mMi4DtzJvA7qGaSWSzP4YO
         3KIBwMbki8TVdwosdgXNleI3PvagPCdwizgbzrWSC6JPqDeUbbxxvxKpw62snFlR5s9h
         50qNBRbJ8NrMYod17E4qWy/Y/mawKfdUvBjlzYj1MzPtBXJjhue+SS51Prtl96Mc3iDE
         0aIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785838783; x=1786443583;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=13TTvH1EeGqMs0mz6hnT5sV4Dz8BUjbRnK70xfNiQaM=;
        b=K5egmCfHWqaR9755lPVBslx6miS7wvcyNnADamAieZMOr4+32kVNu5txy1h/J354mX
         Ip4G0b66KxbCj2JJ+GMf9YzeLSJ0Tc0ON4jvOSJkjzHd4Fd2+zowRcoqGkJww1zTjUMp
         qMxONDQIlicSKYn2o7TvVXhG4x6GJJS8zK9wNrQsAyOMCmhJbdd72f3h9WRILXMwCRH4
         l31iX6aIC/4awB+SFnRGahUWdPBJUJe2PVtVtUAtVcjpf6eOQGfO+M44PLe5SL8MLGHQ
         KBLeDptY0Z4yM5c7hEkJXxrmkINx/SBncsRewLrF3Ioy56ESbJyz9dcgVUxY04/8iyBD
         o2Lw==
X-Gm-Message-State: AOJu0YylCtPHqfTsMO/NNt2va9FzqGUvRectP9r1fAkkm/F4GdieOaPX
	e2VqCKp/m6eiXj1yw+iN/3iNZxNVNWw563P0gVR6dFSUIq9lFMnSK3hKCHzRT5aG0ixP9k+g
X-Gm-Gg: AR+sD10TugPiDryO2I0zZtE+DgHLG2FVNpPs86j2nIc1m/f3rX/K+3opcEcWXKnIXca
	oxwoRaM9zTOPF9nfNxJVWyKg2nm294GuIvBnZlyZ62Knc75J9h2zODGV11Mi5rJSaSHvdtj3Iol
	TvJMBcm4uZ7aNE1VQhDtfaNGJsG8MrzFGlPQWNkwJvRTPhxcFet8efqr2n80e4CJZZBpMEQWTtd
	/x3JY/sWMVNmznl3UqIzfPccx9cQC/gB0Qku2PS9CPG0IFLtJJobQDXyFtRrE3a5PQa4UWYKz3m
	dBT0RsLFSjkszUl3G+xdqzdnoIMp3LLums6j99UUmZE7/4JUqs0v0Zj/M1dKefyxGMP2/EttoqE
	aRkvAF20O5YI98oRt1FxHbbldttZDF+RvgIaLHQZkyjY3ZqZS9fsDbxUdPbBvrboabDCMlA9iNw
	mcDW3FUiIwO2BhZTGZPvKU6V3dnJViBkX+JzFb+rEDZ+jdp/2n6PVned4IsrmJPKVdkgTxxmflB
	mQjjrY8241ZDe4NnFZIVroNnWISPVaDFA7h/TlrmuLxi+Y=
X-Received: by 2002:a05:600c:840f:b0:496:c379:b2a1 with SMTP id 5b1f17b1804b1-4980c66d7bbmr269011845e9.2.1785838783093;
        Tue, 04 Aug 2026 03:19:43 -0700 (PDT)
Received: from fedora.fritz.box (dynamic-adsl-84-220-246-20.clienti.tiscali.it. [84.220.246.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b5b4a2sm381950585e9.1.2026.08.04.03.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 03:19:42 -0700 (PDT)
Date: Tue, 4 Aug 2026 12:19:31 +0200
From: moosager <moosager90@gmail.com>
To: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: mt7921e: failure to reset causes network drop
Message-ID: <anG46qbvCqCHGF-f@fedora.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_031946_767173_4F1A3A9E 
X-CRM114-Status: GOOD (  14.42  )
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
there is an issue with the mt7291e that causes the network to drop at random, 
with dmesg outputting repeatedly:
kernel: mt7921e 0000:62:00.0: Timeout for driver own
kernel: mt7921e 0000:62:00.0: driver own failed

Other effects are the system becoming generally unresponsive, kernel panics 
(reporting "Fatal exception in interrupt"), and the system instantly rebooting. 
It also has a tendency to happen again on every subsequent reboot.
More reports of users' experiences are available at [1].

This script lets you reproduce the issue:
#!/bin/sh
echo 0x7c060010 > /sys/kernel/debug/ieee80211/phy0/mt76/regidx
while true; do echo 0xffffffff > /sys/kernel/debug/ieee80211/phy0/mt76/regval ; done

I had previously investigated the code and have some potential insight: during 
normal usage, the function __mt792xe_mcu_drv_pmctrl writes to a register 
like this:
mt76_wr(dev, MT_CONN_ON_LPCTL, PCIE_LPCR_HOST_CLR_OWN);

and it expects to find 0x00000004 (which is PCIE_LPCR_HOST_OWN_SYNC). Instead, 
when the issue happens, it finds 0xffffffff, which does not change even after 
the driver attempts to write to it.

In addition, the failure of __mt792xe_mcu_drv_pmctrl returns -5 as an error 
code; this is not checked by the caller, mt7921e_mac_reset, which calls 
mt792xe_mcu_drv_pmctrl without checking its return value.
 
I have also found some potentially helpful patches at [2]; however, applying 
them did not fix it, and my best attempts at adapting the proposed code paths to 
be triggered in mt7921e_mac_reset have not fixed it either.

Here is my firmware version reported in dmesg:

[   15.848101] mt7921e 0000:62:00.0: enabling device (0000 -> 0002)
[   15.849369] mt7921e 0000:62:00.0: disabling ASPM  L1
[   15.865381] mt7921e 0000:62:00.0: ASIC revision: 79220010
[   15.958433] mt7921e 0000:62:00.0: HW/SW Version: 0x8a108a10, Build Time: 20260605203307a
[   16.352504] mt7921e 0000:62:00.0: WM Firmware Version: ____000000, Build Time: 20260605203411

It has also been happening at least since the firmware with HW/SW build time 
20251118163143a and WM firmware build time 20251118163234, which is when I got 
my laptop with this Wi-Fi chip.

Note: the issue happens whether ASPM is on or off.
The issue happens on my build of the vanilla 7.2.0-rc4 kernel, as it has 
been happening on every past kernel version.

I would like some guidance as to how I could debug the issue further, though 
ultimately the problem is likely in the firmware. It would be very helpful to 
have this fixed, as it currently makes my laptop almost unusable, and I know I'm 
not the only user having this issue.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=220353
[2] https://lore.kernel.org/linux-mediatek/20260506070458.3096180-1-jb.tsai@mediatek.com/

