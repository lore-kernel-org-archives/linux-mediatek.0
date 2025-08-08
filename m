Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAB9C87FD2
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Aug 2025 13:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1G84+v4zX75P6WqTk0EXQj0TqNSq6e+rkwRaOXJCVZ4=; b=vlG5olpxnVmqKnrWrl7+SMVCKD
	BM6TjRxWSVVffabX57cUyyMQhEJO0sZM8YU22Y1zppozHrVxjmJhR6vIKsA3ut/2jYLqUU8mxh10s
	Dsvz7HRCkh8+scx5sINQmBNV4M4MJyFaq/+bst821ipT4/ns0Ss6nD1WC/1MUo9ZB/TdYHmcjC5PJ
	gfrTbjmtTH4FtPresTiv4DCRC1GCuUpXBf4+pXx0OPIAFj7FN+ulsGnepZN2fgvXtK9egh5sL6CLd
	ROMsCYiVuEmGz5NVwP8qoP2OPtCI3ABB6+Z30B/bm3/aaJGwaeApYB86uPdfN5UZ1VDSXj4Z5ygC2
	mG0HCrMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMxK-00000002tvK-0jub;
	Fri, 08 Aug 2025 13:16:22 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMvz-00000002toX-3aOX
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Aug 2025 13:15:01 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so3502802a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 08 Aug 2025 06:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754658898; x=1755263698; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1G84+v4zX75P6WqTk0EXQj0TqNSq6e+rkwRaOXJCVZ4=;
        b=jpZYZ7GL1Kc/xQifKm3pZU5k9jCVZM/kxXeUiL96Kq/LqD7vPHIKU3Gkyk+BZdopOL
         JEtt8NwPiVq3Bhnq9t9xdV092+nc+w/ksI0VHqm2Gs3EFse1ERtqJBEbbD3JRcp8lqdU
         kIlllXWVGxayylEgPVpBtBeU6tia5dpohoI/8+HonMXFWs3O8AGJzae8+nDMFmBwIYDO
         b+6reJwFAljl1elmwr/lt7NPHpyZs9ycAbW43w1N0lqfN5OPs/tnPuxShDJVr82aWYoX
         7iliwRWNr441nE6A9a2HL0kkhoVTukldOJf97OqbUatYRBrFqev6r09ywkUELaxIK/UE
         IRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754658898; x=1755263698;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1G84+v4zX75P6WqTk0EXQj0TqNSq6e+rkwRaOXJCVZ4=;
        b=LwZ0J79Yf1qsLM0+m6xjeczpK8mk2Ikc3CR80QcYfWCvsvL+QeIXi702T1F3lk3wRA
         vmdsQT9d0EdgAIcfc4L+9MgKNc+YD7hbddEWsZFRjC210mhTotArqIql3zghM7KiTwcc
         TSPvkzE/fM0ooWjhe/l8BaxdJlwxH/lEEj9Z0QpXWBMOSGA6HI3ZtAsc6jnmdrycL8BK
         JqlyYi3q6n4r80zfHQv38gLHUGIC7LSV/1Tig4RW0kX5UwDIl2CYXTv3Dm51n0cIP7/4
         ihQVKpavpgAC+Ft7aoxYRq/nopBZHTAaAYr8JxpbpH2c7K+UHckpjk23cH5XsSxPTwpd
         6iTg==
X-Forwarded-Encrypted: i=1; AJvYcCUYpzFMlFBs/adCm6S6BGG2fOb9B/LXNljHzBujlix5gP+N3FmLwsFJ/b4+D1Gv691zyZwvXT9ncM/rq+eYIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl+ZvZDEMg21TAU/HnDocIT4oUS1FPL4FPfIYlhWm/qGfx5M4N
	1kVAs2xubKTZE8bZMGW0jR00od8gaASdTdkQVT6NzcZgSkDwp3JrEG/idK78wzx95rr66OfTkP+
	25zf2hTb1pEvir8wEeOdN1jF9VPHp3Vo=
X-Gm-Gg: ASbGncsaWRENAtMlfG7ciJ+ayykibiS9z3BjUIMGboTzcQIub/lsFC+lgx8KkGqUGmj
	MfKidkEQkFOC1Oyb4Dc4P2v/Xjys+73kDerAZ5kW4LLGdwUb4ah6FOhbKDJ9C6ml3XH6y0xYFcW
	bodOLgUkP8fdN9zeMsoQmBo9GNcULXKI1S3CFq7dm691sfPxSnwGQM/2qjAqlRvg7iJQcmnmdl3
	KSUwOtEsTqC0ZfJcBjh
X-Google-Smtp-Source: AGHT+IGevCoZbL9izzwy5cwLKx4/i/TmXKqJBSAQOcJkM9XKP6Ea/sJmVJxiOYQUmUx3N5L5pL8CK1+aI275dIXumZs=
X-Received: by 2002:a05:6402:2547:b0:602:1b8b:2925 with SMTP id
 4fb4d7f45d1cf-617e2e95eeamr1953333a12.29.1754658897651; Fri, 08 Aug 2025
 06:14:57 -0700 (PDT)
MIME-Version: 1.0
From: Tal Inbar <inbartdev@gmail.com>
Date: Fri, 8 Aug 2025 16:14:46 +0300
X-Gm-Features: Ac12FXzGwyXXWIsqoqW4GYVdq-yIoDbSx7m80eMIrFIy-Ylc2aYJJ2tFHDO8ZrQ
Message-ID: <CAJmAMMyOk7AVqQRrtK4Oum2uVKreGeLJ943-kkRCTspoGApZ8w@mail.gmail.com>
Subject: [REGRESSION] [BISECTED] MT7925 wireless speed drops to zero since
 kernel 6.14.3 - wifi: mt76: mt7925: integrate *mlo_sta_cmd and *sta_cmd
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Sean Wang <sean.wang@mediatek.com>, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_061459_893112_D494F037 
X-CRM114-Status: GOOD (  15.56  )
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

Since kernel v6.14.3, when using wireless to connect to my home router
on my laptop, my wireless connection slows down to unusable speeds.


More specifically, since kernel 6.14.3, when connecting to the
wireless networks of my OpenWRT Router on my Lenovo IdeaPad Slim 15
16AKP10 laptop,
either a 2.4ghz or a 5ghz network, the connection speed drops down to
0.1-0.2 Mbps download and 0 Mbps upload when measured using
speedtest-cli.
My laptop uses an mt7925 chip according to the loaded driver and firmware.


Detailed Description:

As mentioned above, my wireless connection becomes unusable when using
linux 6.14.3 and above, dropping speeds to almost 0 Mbps,
even when standing next to my router. Further, pinging archlinux.org
results in "Temporary failure in name resolution".
Any other wireless device in my house can successfully connect to my
router and properly use the internet with good speeds, eg. iphones,
ipads, raspberry pi and a windows laptop.
When using my Lenovo laptop on a kernel 6.14.3 or higher to connect to
other access points, such as my iPhone's hotspot and some TPLink and
Zyxel routers - the connection speed is good, and there are no issues,
which makes me believe there's something going on with my OpenWRT
configuration in conjunction with a commit introduced on kernel 6.14.3
for the mt7925e module as detailed below.

I have followed a related issue previously reported on the mailing
list regarding a problem with the same wifi chip on kernel 6.14.3, but
the merged fix doesn't seem to fix my problem:
https://lore.kernel.org/linux-mediatek/EmWnO5b-acRH1TXbGnkx41eJw654vmCR-8_xMBaPMwexCnfkvKCdlU5u19CGbaapJ3KRu-l3B-tSUhf8CCQwL0odjo6Cd5YG5lvNeB-vfdg=@pm.me/

I've tested stable builds of 6.15 as well up to 6.15.9 in the last
month, which also do not fix the problem.
I've also built and bisected v6.14 on june using guides on the Arch
Linux wiki, for the following bad commit, same as the previously
mentioned reported issue:

[80007d3f92fd018d0a052a706400e976b36e3c87] wifi: mt76: mt7925:
integrate *mlo_sta_cmd and *sta_cmd

Testing further this week, I cloned mainline after 6.16 was released,
built and tested it, and the issue still persists.
I reverted the following commits on mainline and retested, to
successfully see good wireless speeds:

[0aa8496adda570c2005410a30df963a16643a3dc] wifi: mt76: mt7925: fix
missing hdr_trans_tlv command for broadcast wtbl
[cb1353ef34735ec1e5d9efa1fe966f05ff1dc1e1] wifi: mt76: mt7925:
integrate *mlo_sta_cmd and *sta_cmd

Then, reverting *only* 0aa8496adda570c2005410a30df963a16643a3dc causes
the issue to reproduce, which confirms the issue is caused by commit
cb1353ef34735ec1e5d9efa1fe966f05ff1dc1e1 on mainline.

I've attached the following files to a bugzilla ticket:

- lspci -nnk output:
https://bugzilla.kernel.org/attachment.cgi?id=308466

- dmesg output:
https://bugzilla.kernel.org/attachment.cgi?id=308465

- .config for the built mainline kernel:
https://bugzilla.kernel.org/attachment.cgi?id=308467


More information:

OS Distribution: Arch Linux

Linux build information from /proc/version:
Linux version 6.16.0linux-mainline-11853-g21be711c0235
(tal@arch-debug) (gcc (GCC) 15.1.1 20250729, GNU ld (GNU Binutils)
2.45.0) #3 SMP PREEMPT_DYNAMIC

OpenWRT Version on my Router: 24.10.2

Laptop Hardware:
- Lenovo IdeaPad Slim 15 16AKP10 laptop (x86_64 Ryzen AI 350 CPU)
- Network device as reported by lscpi: 14c3:7925
- Network modules and driver in use: mt7925e
- mediatek chip firmware as of dmesg:
  HW/SW Version: 0x8a108a10, Build Time: 20250526152947a
  WM Firmware Version: ____000000, Build Time: 20250526153043


Referencing regzbot:

#regzbot introduced: 80007d3f92fd018d0a052a706400e976b36e3c87


Please let me know if any other information is needed, or if there is
anything else that I can test on my end.

Thanks,
Tal Inbar

