Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E413C87FD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 09:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwHawNcF/JQ8X+Uy0Ve0MFsO6tqiI9dn3acsx3kJnRQ=; b=CRitGvQ80RIZ3E4Gijpqnru15K
	J79s3U6C7LYwwnzRi+TZ9jwVxkpimgcB8Ei1/6JhI4t4czGTZm0goWy4KapbwmqqskPF6IsjBD6rU
	bNDiTYt8LW32N8TAMb/xaRqSIoxQmWNpAaH20odH1VuNnWL70PfG4eM0Mxt1eaTFIwTC/p2WS2Vj5
	M2CHmikNPiXzhwNOamOmPAt9B9pUNvCAxIWeU1HBW7kd+/RRdrhV94imDzp3D+Nh8a3I87i8/RT1g
	t9CVd/vRYbYE+b6w4UjZnQcmUkvP0I1v5F486Rz7vjqcKCCusk29dUYg0P/gCtyvkkx4Ep3i6qM6c
	6OdMFcaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOcn-000000072Wv-2r3y;
	Mon, 11 Aug 2025 09:15:25 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOWB-00000006zTI-3K5K
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Aug 2025 09:08:37 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-af949bdf36cso652876266b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Aug 2025 02:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754903314; x=1755508114; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwHawNcF/JQ8X+Uy0Ve0MFsO6tqiI9dn3acsx3kJnRQ=;
        b=gkEsY2uxofyqv9UjJ7arz71K80fluWmQsroxQN6BYxQykES2ZJOGaodswku6YVuBHN
         B0qraPhYxEf2h/17wiVTHgeICGlPkrlB5seT7BNrdJ6ulnkA+IPTV1RS4DF3lYhcplgy
         8xywKOxAaZeDIz6r0pbw5+5J/jBB3sLtnKfWm29qkVtOmpWV+ulh7zbENR62TUThjIQa
         sXriDXyhCPUKSQhIBs7/G3P1aZst6EHrStsEdiAljbpmLzUW8fKv9/Zk4NsjeYfpV/QX
         9IiJneM9xsgoll2l6Xx2d+b208FOpPMK1kCbfpZoTmF0rbro9/VHUlrtsjMQWBMWQtgW
         dPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754903314; x=1755508114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwHawNcF/JQ8X+Uy0Ve0MFsO6tqiI9dn3acsx3kJnRQ=;
        b=LlZ36aGmAfq38qAJQH0XhW5i0yNi/OcixEosBe1yZwu4/bjb596qmB41j8lgq0vjFa
         TWOf3blQ3fg8UJpispgn7rPhSADRpheRcl+7XtQIDdbWuOJI2wqGn5oppy+nhgla/39u
         ZQrTLxVVi31kocpvJSLRe2L4bHJcxtv/RVAZsudEHXQVk6LekV9D9xUAMSz/kRSJ95kn
         PhX2k1eA1U81Vi+qk5cr3AOad0hVsSEFKvxPuoa97wPhUXMvGSqTc8wXrXkdWpAa+WHO
         /RilGnz0jRUgaDop6LE/a6TBWZZNk3KvSwDIoDWAPxU3yoi9gbCHT0qs4SVv/T3XIJbN
         gPcA==
X-Forwarded-Encrypted: i=1; AJvYcCVngaA7nc0sy4jLxUCNav3BxuVBDoyecQ/hT3XUWJx0SSYpfCVpWKAbgArFEVrSSRzmeYrMlxtzpB24RqFcyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8K4bHJEwHHYUMFNsCJSXeJ1cVCRLBdwb0h4LnhzdcxtPQ5nQJ
	hvc0ojLXyoKvtEjtS6+Gcn6yFC/pIX4rp7Wde0yc1/GaWHU0JCWZ95XgVkp345gEmAY61/AW78U
	NlzocnYhKl/wu+PJqHfHUDEiGBg4RiDj9fw==
X-Gm-Gg: ASbGncsKRcJX0jB9n/hI5KXiVi0wfeWjpV0BWdebMBGz0OdKfx2MIdB+SBOWB2HPswN
	Ewz7/iBByVwuyW8V8Lfw6NWYDJ/jJ2IsHdQUmdGudppRLWUPzcXuluzHy6/7gl7n3bswe+1V5NB
	J4HaIs5nYkwaPnlfQmh4HfYOJHd/SI9mHTTq1X+nBj6jpDtG4Ge73MGJtZv8dLj2TJFjlaDM3rD
	Oo6BLPOjA==
X-Google-Smtp-Source: AGHT+IGdt733GvWY5lAGoK+XbGYb2hLaYemZnckhDKBvkh4Fb3S8ppPlbLEYEw1YiRpusRegIQ+oXaTyXeg6ZsGhcWk=
X-Received: by 2002:a17:907:d89:b0:aec:6600:dbe3 with SMTP id
 a640c23a62f3a-af9c6544634mr1151954766b.56.1754903313414; Mon, 11 Aug 2025
 02:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAJmAMMyOk7AVqQRrtK4Oum2uVKreGeLJ943-kkRCTspoGApZ8w@mail.gmail.com>
 <CAJmAMMyt5QQQOavVy+Gytf00Y0F6G+GCLYhj0E9RZ8cV85gwCw@mail.gmail.com> <10850475be9302b5b397173c1d4554335c0df966.camel@mediatek.com>
In-Reply-To: <10850475be9302b5b397173c1d4554335c0df966.camel@mediatek.com>
From: Tal Inbar <inbartdev@gmail.com>
Date: Mon, 11 Aug 2025 12:08:22 +0300
X-Gm-Features: Ac12FXxpDyTwSrfAbNsg-NT2mwV9frv3BhLyjLgyjeTQ1rashWaHY-G52WOJkz4
Message-ID: <CAJmAMMxtH+WnJfU2tcHRxP472cnyM4cZ7vaTcZN0NSxQ6U5HCg@mail.gmail.com>
Subject: Re: [REGRESSION] [BISECTED] MT7925 wireless speed drops to zero since
 kernel 6.14.3 - wifi: mt76: mt7925: integrate *mlo_sta_cmd and *sta_cmd
To: =?UTF-8?B?TWluZ3llbiBIc2llaCAo6Kyd5piO6Ku6KQ==?= <Mingyen.Hsieh@mediatek.com>
Cc: Sean Wang <Sean.Wang@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, =?UTF-8?B?QWxsYW4gV2FuZyAo546L5a625YGJKQ==?= <Allan.Wang@mediatek.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, 
	=?UTF-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?= <Deren.Wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_020835_841660_38F2CE15 
X-CRM114-Status: GOOD (  43.70  )
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

Hi Mingyen,

I'll see what I can gather and I'll let you know.

Tal

On Mon, Aug 11, 2025 at 4:47=E2=80=AFAM Mingyen Hsieh (=E8=AC=9D=E6=98=8E=
=E8=AB=BA)
<Mingyen.Hsieh@mediatek.com> wrote:
>
> On Fri, 2025-08-08 at 17:37 +0300, Tal Inbar wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > typo, laptop model is:
> > Lenovo IdeaPad Slim 5 16AKP10
> >
> > On Fri, Aug 8, 2025 at 4:14=E2=80=AFPM Tal Inbar <inbartdev@gmail.com> =
wrote:
> > >
> > > Hi,
> > >
> > > Since kernel v6.14.3, when using wireless to connect to my home
> > > router
> > > on my laptop, my wireless connection slows down to unusable speeds.
> > >
> > >
> > > More specifically, since kernel 6.14.3, when connecting to the
> > > wireless networks of my OpenWRT Router on my Lenovo IdeaPad Slim 15
> > > 16AKP10 laptop,
> > > either a 2.4ghz or a 5ghz network, the connection speed drops down
> > > to
> > > 0.1-0.2 Mbps download and 0 Mbps upload when measured using
> > > speedtest-cli.
> > > My laptop uses an mt7925 chip according to the loaded driver and
> > > firmware.
> > >
> > >
> > > Detailed Description:
> > >
> > > As mentioned above, my wireless connection becomes unusable when
> > > using
> > > linux 6.14.3 and above, dropping speeds to almost 0 Mbps,
> > > even when standing next to my router. Further, pinging
> > > archlinux.org
> > > results in "Temporary failure in name resolution".
> > > Any other wireless device in my house can successfully connect to
> > > my
> > > router and properly use the internet with good speeds, eg. iphones,
> > > ipads, raspberry pi and a windows laptop.
> > > When using my Lenovo laptop on a kernel 6.14.3 or higher to connect
> > > to
> > > other access points, such as my iPhone's hotspot and some TPLink
> > > and
> > > Zyxel routers - the connection speed is good, and there are no
> > > issues,
> > > which makes me believe there's something going on with my OpenWRT
> > > configuration in conjunction with a commit introduced on kernel
> > > 6.14.3
> > > for the mt7925e module as detailed below.
> > >
> > > I have followed a related issue previously reported on the mailing
> > > list regarding a problem with the same wifi chip on kernel 6.14.3,
> > > but
> > > the merged fix doesn't seem to fix my problem:
> > > https://lore.kernel.org/linux-mediatek/EmWnO5b-acRH1TXbGnkx41eJw654vm=
CR-8_xMBaPMwexCnfkvKCdlU5u19CGbaapJ3KRu-l3B-tSUhf8CCQwL0odjo6Cd5YG5lvNeB-vf=
dg=3D@pm.me/
> > >
> > > I've tested stable builds of 6.15 as well up to 6.15.9 in the last
> > > month, which also do not fix the problem.
> > > I've also built and bisected v6.14 on june using guides on the Arch
> > > Linux wiki, for the following bad commit, same as the previously
> > > mentioned reported issue:
> > >
> > > [80007d3f92fd018d0a052a706400e976b36e3c87] wifi: mt76: mt7925:
> > > integrate *mlo_sta_cmd and *sta_cmd
> > >
> > > Testing further this week, I cloned mainline after 6.16 was
> > > released,
> > > built and tested it, and the issue still persists.
> > > I reverted the following commits on mainline and retested, to
> > > successfully see good wireless speeds:
> > >
> > > [0aa8496adda570c2005410a30df963a16643a3dc] wifi: mt76: mt7925: fix
> > > missing hdr_trans_tlv command for broadcast wtbl
> > > [cb1353ef34735ec1e5d9efa1fe966f05ff1dc1e1] wifi: mt76: mt7925:
> > > integrate *mlo_sta_cmd and *sta_cmd
> > >
> > > Then, reverting *only* 0aa8496adda570c2005410a30df963a16643a3dc
> > > causes
> > > the issue to reproduce, which confirms the issue is caused by
> > > commit
> > > cb1353ef34735ec1e5d9efa1fe966f05ff1dc1e1 on mainline.
> > >
> > > I've attached the following files to a bugzilla ticket:
> > >
> > > - lspci -nnk output:
> > > https://urldefense.com/v3/__https://bugzilla.kernel.org/attachment.cg=
i?id=3D308466__;!!CTRNKA9wMg0ARbw!gTAaJeIN6s3eF_Kp6U3iwfv0wCCO_BVcRkNVpJYnw=
R8qeqIIh134mEJ5dxdeNqzuWSPF2ocLAt43LxaBTIY-7w$
> > >
> > > - dmesg output:
> > > https://urldefense.com/v3/__https://bugzilla.kernel.org/attachment.cg=
i?id=3D308465__;!!CTRNKA9wMg0ARbw!gTAaJeIN6s3eF_Kp6U3iwfv0wCCO_BVcRkNVpJYnw=
R8qeqIIh134mEJ5dxdeNqzuWSPF2ocLAt43LxY1pkjZCA$
> > >
> > > - .config for the built mainline kernel:
> > > https://urldefense.com/v3/__https://bugzilla.kernel.org/attachment.cg=
i?id=3D308467__;!!CTRNKA9wMg0ARbw!gTAaJeIN6s3eF_Kp6U3iwfv0wCCO_BVcRkNVpJYnw=
R8qeqIIh134mEJ5dxdeNqzuWSPF2ocLAt43LxYcu-Db2g$
> > >
> > >
> > > More information:
> > >
> > > OS Distribution: Arch Linux
> > >
> > > Linux build information from /proc/version:
> > > Linux version 6.16.0linux-mainline-11853-g21be711c0235
> > > (tal@arch-debug) (gcc (GCC) 15.1.1 20250729, GNU ld (GNU Binutils)
> > > 2.45.0) #3 SMP PREEMPT_DYNAMIC
> > >
> > > OpenWRT Version on my Router: 24.10.2
> > >
> > > Laptop Hardware:
> > > - Lenovo IdeaPad Slim 15 16AKP10 laptop (x86_64 Ryzen AI 350 CPU)
> > > - Network device as reported by lscpi: 14c3:7925
> > > - Network modules and driver in use: mt7925e
> > > - mediatek chip firmware as of dmesg:
> > >   HW/SW Version: 0x8a108a10, Build Time: 20250526152947a
> > >   WM Firmware Version: ____000000, Build Time: 20250526153043
> > >
> > >
> > > Referencing regzbot:
> > >
> > > #regzbot introduced: 80007d3f92fd018d0a052a706400e976b36e3c87
> > >
> > >
> > > Please let me know if any other information is needed, or if there
> > > is
> > > anything else that I can test on my end.
> > >
> > > Thanks,
> > > Tal Inbar
>
> Hi,
>
> Can you capture a sniffer log? There should be some configuration
> differences that we can identify from the packet frames during the
> connection process. So please provide the sniffer logs when connecting
> to your OpenWRT, TPLink, and Zyxel.
>
> Or you can check for any configuration differences between OpenWRT and
> the other routers, which might also help with debugging.
>
> Thanks~
>
> Yen.
>
>
> *********** MEDIATEK Confidentiality Notice
>  ***********
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or
> otherwise exempt from disclosure under applicable laws. It is
> intended to be conveyed only to the designated recipient(s). Any
> use, dissemination, distribution, printing, retaining or copying
> of this e-mail (including its attachments) by unintended recipient(s)
> is strictly prohibited and may be unlawful. If you are not an
> intended recipient of this e-mail, or believe that you have received
> this e-mail in error, please notify the sender immediately
> (by replying to this e-mail), delete any and all copies of this
> e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

