Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45165C87FD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Aug 2025 14:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+62NHinCYSr5yR3g3c9qlbv0ulbIVmyUNIVnnN95vc=; b=RFmYEwPu+RDbbQ0X3D4iAB/zBm
	FEoBAtbJt1MT6pvXG/CUyihVL7dQ8fdfSzWzzZnVwxD6w2U2fYlJLEZhT2m2YsecE/LVx7gsZsgZu
	dX4R/kAjIleFPeQLpFIGj09V45ZwxIoacU3LJ3UPItJeP8zem78s9TrlMYPHEKtsItRryxrf8N/Ee
	CSkvTU+kf0T1yae8aEaQ8vF+V09lJH/G7u3/ahBjwDQJDy+gM0ZPmo5TDBnO+CVUVtwpJKACmVskz
	7ieNwuuub95OWunwrl6UsoSu8uPWKoeW/72Etn05Fld4TwzL2jATM+J95okSzQ7MbziNT9VKMQDbb
	Se1Z+yqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukODp-000000032QE-2J10;
	Fri, 08 Aug 2025 14:37:29 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukODn-000000032Pr-23FM
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Aug 2025 14:37:28 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-af8fd1b80e5so396120766b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 08 Aug 2025 07:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754663846; x=1755268646; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+62NHinCYSr5yR3g3c9qlbv0ulbIVmyUNIVnnN95vc=;
        b=Jb6ouWiphgCDrprR68UGRFHQHq0Yunx8/PjUsaZiA5x1xOqw44p13cUOCoxxkiuwPm
         7u7cs8AIyRTrXs7usdsmWLPCBHY3gvDCSGlUbjtvzYcxosUBwBUu5biGbrWO0d/OFHdj
         ZcPoe5eYMbw9kKxxvE1t6JO89wCOus4UiQYkdwa/UvSM7nCCCxJLYJQ5xHjHHWdu6BB/
         UGVP0CPiMq9JjkrLgpmXUCsxdCqON44WOCie6o1EPcEikzgbJd3AQ51RQQLLJPtY/agB
         D5jy5s6v+8EhJbsQf9sHQQLeHJEig4Ptc8l3L4J9nvkdUbhTyn0kL+432rZT2KJdEsTp
         1YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754663846; x=1755268646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+62NHinCYSr5yR3g3c9qlbv0ulbIVmyUNIVnnN95vc=;
        b=JH/Cm2kRuX74g37fufw0LtzTUOsuKfleEAjEBgIoH7k5f8cWYznfBEIhcRJqq6kQMw
         zT8eQI5I5d+JTX1ufQAYlreQ+7zTXsZGJnK7uWzApXMgMEP08TBMQ+wpiEoLkSAyTWL6
         fF3OrP6w2l9esAdsSTVn/QLZ0TaI+UPFHbEh26jEpT0yHZggmFVroDxBaADfwp4ssE9r
         NaCcqgP689HHmK5FWcNjZSTCYbM6Ce0CFLKyVFSPIrgYbq5r7GU4fLHY3NbEIEx91A2I
         S5xr0IJycVOrCCHNE4dTl/nt2r9REUqwO265v6ElpHHD3vJS9gT0fLPMxrQUOuds0VrH
         VhvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdyKlRV8o2i8pKiUwwN88NgOxwkYO3kXrt/9tW5CxAsPlS/08PAay8A6NmWUNe8INfymST20ou5/pQ/HcTQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoUnnwffxNZ76Tx2Cpl3YxDc967kpj2kFK1xYrdQQXJt4uCqtm
	Y+j7X6gow+YHxRfOAT+nk4+UdSFdiHSYQGDM22qRzdDehAjoYZ3KdevWVvwlQJJGMIRYkIx4Akt
	I1fxgmxuZfLMhJZryqFG2BFsXwe3Bdhw=
X-Gm-Gg: ASbGncuqB5nWKRfUK9ZKw6LCCLvycjWALvwHn7W9z+T2c77Df6f0lG5BpvnwHJj9Zo6
	micC0V1O75NjEWTLuBrFC5xir+YR/JyYT+WB6cR6uGJPdEBJxT6ENCRGTIoFBGJEXuzouM4pqoi
	fFZJFV0rk4eHFRZUJ7tQaaj1HVrWbvUG4v2Q5YVpdEwCey2nQaq8ihhH6bpTHSeBM6/bTHpviIO
	2vrX4hwXg==
X-Google-Smtp-Source: AGHT+IE5944foTaedZbw+uIpFDVvyakr3YwxS1vXU+mfC2DP0YLfxtT3BoUxO5Ojt29yvIAdwVWX4Xi0czt/+f25U7M=
X-Received: by 2002:a17:907:dab:b0:ae0:de30:8569 with SMTP id
 a640c23a62f3a-af9c6330895mr297978866b.1.1754663845623; Fri, 08 Aug 2025
 07:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAJmAMMyOk7AVqQRrtK4Oum2uVKreGeLJ943-kkRCTspoGApZ8w@mail.gmail.com>
In-Reply-To: <CAJmAMMyOk7AVqQRrtK4Oum2uVKreGeLJ943-kkRCTspoGApZ8w@mail.gmail.com>
From: Tal Inbar <inbartdev@gmail.com>
Date: Fri, 8 Aug 2025 17:37:13 +0300
X-Gm-Features: Ac12FXy5Ql8C0LL-N-OOd5L6QA2Q0V2HShdd45ZpaOEir98zODdte42A2TcV_LU
Message-ID: <CAJmAMMyt5QQQOavVy+Gytf00Y0F6G+GCLYhj0E9RZ8cV85gwCw@mail.gmail.com>
Subject: Re: [REGRESSION] [BISECTED] MT7925 wireless speed drops to zero since
 kernel 6.14.3 - wifi: mt76: mt7925: integrate *mlo_sta_cmd and *sta_cmd
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Sean Wang <sean.wang@mediatek.com>, regressions@lists.linux.dev, 
	stable@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_073727_530358_8954BC13 
X-CRM114-Status: GOOD (  29.49  )
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

typo, laptop model is:
Lenovo IdeaPad Slim 5 16AKP10

On Fri, Aug 8, 2025 at 4:14=E2=80=AFPM Tal Inbar <inbartdev@gmail.com> wrot=
e:
>
> Hi,
>
> Since kernel v6.14.3, when using wireless to connect to my home router
> on my laptop, my wireless connection slows down to unusable speeds.
>
>
> More specifically, since kernel 6.14.3, when connecting to the
> wireless networks of my OpenWRT Router on my Lenovo IdeaPad Slim 15
> 16AKP10 laptop,
> either a 2.4ghz or a 5ghz network, the connection speed drops down to
> 0.1-0.2 Mbps download and 0 Mbps upload when measured using
> speedtest-cli.
> My laptop uses an mt7925 chip according to the loaded driver and firmware=
.
>
>
> Detailed Description:
>
> As mentioned above, my wireless connection becomes unusable when using
> linux 6.14.3 and above, dropping speeds to almost 0 Mbps,
> even when standing next to my router. Further, pinging archlinux.org
> results in "Temporary failure in name resolution".
> Any other wireless device in my house can successfully connect to my
> router and properly use the internet with good speeds, eg. iphones,
> ipads, raspberry pi and a windows laptop.
> When using my Lenovo laptop on a kernel 6.14.3 or higher to connect to
> other access points, such as my iPhone's hotspot and some TPLink and
> Zyxel routers - the connection speed is good, and there are no issues,
> which makes me believe there's something going on with my OpenWRT
> configuration in conjunction with a commit introduced on kernel 6.14.3
> for the mt7925e module as detailed below.
>
> I have followed a related issue previously reported on the mailing
> list regarding a problem with the same wifi chip on kernel 6.14.3, but
> the merged fix doesn't seem to fix my problem:
> https://lore.kernel.org/linux-mediatek/EmWnO5b-acRH1TXbGnkx41eJw654vmCR-8=
_xMBaPMwexCnfkvKCdlU5u19CGbaapJ3KRu-l3B-tSUhf8CCQwL0odjo6Cd5YG5lvNeB-vfdg=
=3D@pm.me/
>
> I've tested stable builds of 6.15 as well up to 6.15.9 in the last
> month, which also do not fix the problem.
> I've also built and bisected v6.14 on june using guides on the Arch
> Linux wiki, for the following bad commit, same as the previously
> mentioned reported issue:
>
> [80007d3f92fd018d0a052a706400e976b36e3c87] wifi: mt76: mt7925:
> integrate *mlo_sta_cmd and *sta_cmd
>
> Testing further this week, I cloned mainline after 6.16 was released,
> built and tested it, and the issue still persists.
> I reverted the following commits on mainline and retested, to
> successfully see good wireless speeds:
>
> [0aa8496adda570c2005410a30df963a16643a3dc] wifi: mt76: mt7925: fix
> missing hdr_trans_tlv command for broadcast wtbl
> [cb1353ef34735ec1e5d9efa1fe966f05ff1dc1e1] wifi: mt76: mt7925:
> integrate *mlo_sta_cmd and *sta_cmd
>
> Then, reverting *only* 0aa8496adda570c2005410a30df963a16643a3dc causes
> the issue to reproduce, which confirms the issue is caused by commit
> cb1353ef34735ec1e5d9efa1fe966f05ff1dc1e1 on mainline.
>
> I've attached the following files to a bugzilla ticket:
>
> - lspci -nnk output:
> https://bugzilla.kernel.org/attachment.cgi?id=3D308466
>
> - dmesg output:
> https://bugzilla.kernel.org/attachment.cgi?id=3D308465
>
> - .config for the built mainline kernel:
> https://bugzilla.kernel.org/attachment.cgi?id=3D308467
>
>
> More information:
>
> OS Distribution: Arch Linux
>
> Linux build information from /proc/version:
> Linux version 6.16.0linux-mainline-11853-g21be711c0235
> (tal@arch-debug) (gcc (GCC) 15.1.1 20250729, GNU ld (GNU Binutils)
> 2.45.0) #3 SMP PREEMPT_DYNAMIC
>
> OpenWRT Version on my Router: 24.10.2
>
> Laptop Hardware:
> - Lenovo IdeaPad Slim 15 16AKP10 laptop (x86_64 Ryzen AI 350 CPU)
> - Network device as reported by lscpi: 14c3:7925
> - Network modules and driver in use: mt7925e
> - mediatek chip firmware as of dmesg:
>   HW/SW Version: 0x8a108a10, Build Time: 20250526152947a
>   WM Firmware Version: ____000000, Build Time: 20250526153043
>
>
> Referencing regzbot:
>
> #regzbot introduced: 80007d3f92fd018d0a052a706400e976b36e3c87
>
>
> Please let me know if any other information is needed, or if there is
> anything else that I can test on my end.
>
> Thanks,
> Tal Inbar

