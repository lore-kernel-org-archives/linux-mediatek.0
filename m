Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F863EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 04:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:Subject:
	Mime-Version:Content-Transfer-Encoding:Content-Type:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zxHRvKHlPZUnLRxeY6hYOhZ7r0H3DhpddiTleXw6kRI=; b=iCatawG8dv2dlovHjfJgpGBywl
	/6zy8/ojIbPjBGReF9M4KUy5EC7keRihk80WhInWWNuSXq9HFcpgZYSGm9eLsGJRBBw1H09tT2gzh
	xD2yjK4LeU/vTbStwpsm/2gp4Z0ELc8yn4o4Y42zi2ro2C6Pvxs6ER/O9IjJ+CgpZcvBF8uKapMoJ
	+10R++NXHHD2loOV1cKoY+5y2d/1W/B8il+wmZUn7jn85vmKWD6STGI+oPiXtAKG966/nLwegmcWW
	cPekD8b5sxTj2ebeZ8F2ns9+9B/W3qDEUvhSXrpFAFJSMRa3rPNCTG7D3g7cY5mEIaicqbZibezry
	S38XfDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzC6-00559a-0z;
	Wed, 19 Jul 2023 04:53:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzC2-005597-1T
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jul 2023 04:53:44 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b852785a65so2940305ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Jul 2023 21:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mikesilva.com; s=google; t=1689742421; x=1692334421;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zxHRvKHlPZUnLRxeY6hYOhZ7r0H3DhpddiTleXw6kRI=;
        b=fX6nziuRPy1pBvE/1prX03R2XYVoknKEb6Es5VHuDkNM7xbnXuiKNCMl9HXtRahFil
         8PPKLXACdDXyzrglagmyFShb1JoCxCRZdKxf5KQbL0gaT4/necl40S0C75uFPyAmBotI
         VBndq2cWuINb/n9awgP+mN8AzReNPeqw7x5/aEJByl5A7k0Ggm/fp/qu7GxVWoclIE4r
         Mblwpc5vQULQtOSIDDiqkaWU7tMc6r4FsmK0NsLzbdjYAe0a8fbTFERId7lihcDWl3j/
         04y0sbcUoUROQaC2rjw7f9vYxXUrid5BxGnYXPyJadyJIY3KU3QUINt2o7i+oaJo+g5+
         AybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689742421; x=1692334421;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zxHRvKHlPZUnLRxeY6hYOhZ7r0H3DhpddiTleXw6kRI=;
        b=bUlwYwe5KLVH7P3ET2GiJKqViY6FcxiCZm25WxkGquvZj10vLfbcrmhbAHdr5RW8sc
         niayBJ62K96NqLOlCrKdcDZRM/frOsZ6WNOcgw4J565EZ8SjYH6JZT0zh7bYv4QYzfeS
         ASZoLER0qeuhg8QprMMCGX43Ed8kDywvLU3bAs99FAFhdZDyrMYO/yjSQjJljOfdbLiF
         5NAuBy3ACmc0P0BY9pExT974g/agkoLFtdL1AVzeeKHlrm3jdugZHPEcqWqMd5HP/ge8
         1B1YOegHGK5/niRq3XQQE8brc0MLFq7swe+UzBnNRJFGsEc3mrb+tmFR0koYGOU/6fnv
         91Mw==
X-Gm-Message-State: ABy/qLbiw1RQLqZuZ0uuvvOhk8LzPwE0Z/3NBceMetAaUK48RyFrxhxs
	vO6QD6ZELLr/rk9GrkkQUywP97f/EM6vIy3JX1Mm0A==
X-Google-Smtp-Source: APBJJlFFOTvLD7ANsQ96MMv2QBi/bSwB3wCpRbM0xi3Bf+57MD3NGCf9eujT3tr5VjqcoestZEyWiA==
X-Received: by 2002:a17:902:ecc3:b0:1b8:5a42:5145 with SMTP id a3-20020a170902ecc300b001b85a425145mr1618266plh.31.1689742421154;
        Tue, 18 Jul 2023 21:53:41 -0700 (PDT)
Received: from smtpclient.apple ([2001:5a8:4322:b800:485:1be:7d86:53bd])
        by smtp.gmail.com with ESMTPSA id jk14-20020a170903330e00b001b9cd9d7ce4sm2754680plb.219.2023.07.18.21.53.40
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jul 2023 21:53:40 -0700 (PDT)
From: Mike Silva <mike.silva@mikesilva.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: mt7921 & mt7922 Losing Carrier After DFS Strike
Message-Id: <2A80A9E9-CBCB-4F5F-AF11-4628CCFBB78F@mikesilva.com>
Date: Tue, 18 Jul 2023 21:53:40 -0700
To: linux-mediatek@lists.infradead.org
X-Mailer: Apple Mail (2.3696.120.41.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_215342_512648_B38DAD7C 
X-CRM114-Status: GOOD (  12.26  )
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

I and other users are having with the following error on the mt7921 & =
mt7921 after a DFS strike. This has seemed to be an issue since the =
chipsets were released.

I am experiencing this on:
uname -a
Linux Vancouver 6.2.0-1008-raspi #10-Ubuntu SMP PREEMPT Fri Jun 30 =
12:20:13 UTC 2023 aarch64 aarch64 aarch64 GNU/Linux

However, you can see that this is a common issue for people running on =
other linux OSes and architectures, here:
https://github.com/morrownr/USB-WiFi/issues/283

I am running the latest driver in the git.kernel.org repository.
kernel: mt7921u 2-2.4:1.3: WM Firmware Version: ____010000, Build Time: =
20230526130958
kernel: mt7921u 2-2.4:1.3: HW/SW Version: 0x8a108a10, Build Time: =
20230526130917a

However, as I said this has been an issue for months, so it=E2=80=99s =
also effected previous kernel and mt76 driver versions. It also is an =
issue whether I use wpa_supplicant or iwd to manage my WiFi connection.

Where I live, DFS strikes seem fairly common, so I see this on at least =
a daily basis. And, not infrequently multiple times in a day. Typical =
log output is here:
Jul 18 06:58:23 Vancouver kernel: wlxe0e1a9368b21: driver doesn't =
support chan-switch with channel contexts
Jul 18 06:58:23 Vancouver systemd-networkd[1033]: wlxe0e1a9368b21: Lost =
carrier
Jul 18 07:02:40 Vancouver systemd-resolved[1058]: wlxe0e1a9368b21: Bus =
client set DNS server list to: 50.0.1.1, 50.0.2.2
Jul 18 09:21:20 Vancouver NetworkManager[1229]: <info>  =
[1689697280.5776] dhcp4 (wlxe0e1a9368b21): activation: beginning =
transaction (timeout in 45 seconds)
Jul 18 09:21:20 Vancouver NetworkManager[1229]: <info>  =
[1689697280.5779] dhcp4 (wlxe0e1a9368b21): state changed no lease
Jul 18 09:21:21 Vancouver avahi-daemon[1183]: Withdrawing address record =
for 192.168.4.26 on wlxe0e1a9368b21.
Jul 18 09:21:21 Vancouver avahi-daemon[1183]: Leaving mDNS multicast =
group on interface wlxe0e1a9368b21.IPv4 with address 192.168.4.26.
Jul 18 09:21:21 Vancouver avahi-daemon[1183]: Interface =
wlxe0e1a9368b21.IPv4 no longer relevant for mDNS.
Jul 18 09:22:05 Vancouver systemd-resolved[1058]: wlxe0e1a9368b21: Bus =
client set default route setting: no
Jul 18 09:22:05 Vancouver systemd-resolved[1058]: wlxe0e1a9368b21: Bus =
client reset DNS server list.

In short, DFS strike, AP changes channel, then the mt7921 loses carrier, =
and my headless machine becomes unresponsive.

I=E2=80=99m happy to provide more detailed logging, if you can suggest a =
debug mode to run in and how to activate it. This is quite repeatable.


