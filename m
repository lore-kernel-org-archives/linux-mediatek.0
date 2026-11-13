Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABC4606A32A
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 04:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v1QCXU8Z;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OxtMcZ70
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DgtEYkuhX+8n+4ef8E0l2P/RizRsNWZml0oDyaB2Hkw=; b=v1QCXU8ZJpQXh5
	p0GIeTnryPs5ynWZ2GmCal4+hjzkxs6UNv/T6jntFRjAzGbJfAfCDni/FFIfMFZHMmvUMHH4kGG7u
	HDpb7n+wiIV3OIc+TZttg8WPwW9u6NvoFArLcvDxKQSVzF6F0+WeOVEytUpuhcw2DEK8Wxp/NiSJH
	BmyptITnh2Dkv7NbIxQ2y5hYoLewGuobQfpK4HMcRU57aE9zDDtZR7xzDyp6FxzctlD8/0Yl/dM1a
	K8TssK7k4/PO+Lrp3BPkyRYahminomgt37Emwm5HmlP7Wc7Qs9hc+OXOgjP7hKYZKy+EZpJfgyJ+j
	C3nhlYIQzwltCzbBUxHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRivs-0000000BdoZ-2195;
	Fri, 13 Nov 2026 04:30:36 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRivo-0000000Bdnt-33iz
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 04:30:34 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ed2b4348fcso1739505ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2026 20:30:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794544231; cv=none;
        d=google.com; s=arc-20260327;
        b=E1wdTAudSIDWX1Ppl3q+OeBf3ApcRItDeWeTrKk/fQXze2lVZcRzZKA/fkRKMZLz79
         8UOlsjLhVKtumaAFjGSta0phyWhJzQ33T40H3g4xIFz0ZYzCZVxEQX3+xwcSrMBH7WBG
         5+G9xG/3io08Nw6iOSPpNgqzlw9mR+hxHK1A7Ly+/j0RmdD0sJL5drxX/dFcK8hxn06S
         nMp5hZ07D6+WJIm5/vwXnE57auFaliRyaYq6adpgDhnIWKs+FJIamtumNcO1ojIdfduN
         bmKPkWgL3vJmCNABrQqxgHddI1BNaCT3qFSyQwPZd4/9yQqLkj0QQtMDDid/yluDR0ww
         5Oyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DgtEYkuhX+8n+4ef8E0l2P/RizRsNWZml0oDyaB2Hkw=;
        fh=8N5Cc9J2Hx3xK4EJMNI2cpoL4R/Ke2PW/5fSh7WoA0M=;
        b=o3ACu1XvSOPbN2UV1BHToyIf1VJXtuF5n7W2PVaKHtHyfbOHSm7Qv2ZbaKHTU0khTJ
         dHlY6wERrfR9xq+pSAadeB7FUMUSHi+fJYYke8l7XkmGJp0OEiBdtUyzykQGF3wRKTce
         e2lzOOdevMQIITDuw2rrzMR7CHVzafKCKuGRc/azVqJJ/a5dzfBzEbQTi4ADnE+oVspo
         FPnvqdBWpb51qczJE9iobw1oLeRtmo+tVJ+b8ITb7Wp2frpxFmauFGN8mGfNczMZsIQk
         DFuPaUWIJTPsYtG8Rp66TlEs7iVcIpdtYOFqdyJ/o0OzBRGBe81cNg/BLKi2LE7KlvvE
         lWrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794544231; x=1795149031; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DgtEYkuhX+8n+4ef8E0l2P/RizRsNWZml0oDyaB2Hkw=;
        b=OxtMcZ70y2lXpKIxOElh4aOPnieG6J9+DrIvZvx6GUSLlms100qcWfO8vNWDaBLGKE
         NX80OH37f1Gsl5cndseYBOfguVs22ZXRC51fqLJkKsdpQc+BMKQ+gTJPS2wNLSTYd37f
         b2/3Mbzv4+unDiFFSCGYgEwiF1DbxnKYw2uy1Hb4x05vsUvqsecRXZ/cltXWK2lipSc9
         SbLD0l08InVtNSIYE4XaqFLK6Xlmxt+bfVLQgzTDAFzGaDjHaroAZlpEI3KXQKOu7w7z
         R3E7Q8uB2mIvej5xyK49N2NaI3e/hzUn5cqaFBksBVyp4m7nrcZJExEe9FHx22g05g34
         vbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794544231; x=1795149031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgtEYkuhX+8n+4ef8E0l2P/RizRsNWZml0oDyaB2Hkw=;
        b=YVuGU5nKv+0K6gza2Y/8mTOFdwVWZhKYaoPpbP22Y/5I006QCpGBhd2BW57Pj8C71t
         h9aAEdFxiKzLd8n6/6fF68YZ+GXCVkIcQVmYh6ZlHzJU+SNhbR1eD2vyndhXZ/WLRvOY
         UkhKUO1NLo+xnPzjaBvuV/B0zD4x/6V/sM52YNIzXkSnJ6k6/B+TAX3HK+vngM/E4P/K
         Bo0tjXN297Ko8Fin9nPvCLCseNMsQCwqIyzX9ld9HPeFGlsIX9owSof9INSCkjxuCtXF
         ymMf95+cHydf2LWs1/ce40FqHumdFj4PNjU4hVOfnwWkj81ehQkpVNvJ+MxCgB3iXeBs
         B2Fw==
X-Forwarded-Encrypted: i=1; AL+hErHfRF2kCuf7RYPzyHeqJZRVTLHCLQgx7Qhtpz+QKJYpRa1VX+oFC5HiMSxSGGS0X2xEW2XIxPfGatXINazUCQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8zRno+84b3OuybYobIZI67TcQkgdh+fKfqcZ8HrUp7O0hbD1iI
	Nj0OhhAMdQHltjHuu0N7SD0AJJL5Eit5sTC2oGOdmIqTVGKeyXZfb1UqQy6m9GF0TBZm/XgvkaL
	pDva25OvWpj0H6hoPGkJKZyoKd5ttSf8=
X-Gm-Gg: AYBFou18r8ecNV7Yh/4eGeXUizPwhO6zlVFVW1FaF2EUvnF+Zo8mjZ+1F6Yq43SPjqj
	ugiOEuqlfEdW7YX56Swco79mThaQ/r8uqeq0Zzn7to9/0ujTllvh8n4RcY4TEL8L/68sqymi+7Q
	bGYO7yc5VLRdvEUdlFYof+wzFYgDNst8Tfh1fhQyPa6BOKJiAgoqlMQzneYN4jIldICmPOmjpSL
	ZFIIcgx+a4s4ebcgX3Ipcxx5+v5MBY5US0qhtUVviSb4VkI97v2jA84KqPRaLcbxEXfU0OIdVZb
	RzjeZ6laThimnIYhqWHo4G5Wfoslg+jtykr6/htJmUuTDYC34izyp2xQFJc1bnxpyHS2j/tNN9/
	ZUqMbtX8a79SS8E5Skihu8UTUgTvQcLNm1yvmIA==
X-Received: by 2002:a17:903:182:b0:2ed:e93:71af with SMTP id
 d9443c01a7336-2ee0dc308c5mr15517075ad.41.1794544231297; Thu, 12 Nov 2026
 20:30:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAHaeJsQLvC-KBEpy5qu8iYxSB51mbHohrPvN4PJushF_Tk3foA@mail.gmail.com>
 <20261023180554.7266-1-lucid_duck@justthetip.ca> <CAHaeJsSfoTxJhWVCrELCiLZr1zD42LGJUvrmf7oSzRQpwh6-jw@mail.gmail.com>
 <20261024173414.10559-1-lucid_duck@justthetip.ca> <CAHaeJsTHykkk8Cm+FUZW2RmzzmT47aJNxRR1kpymhDvknnhKuQ@mail.gmail.com>
 <CAHaeJsRROtH4CLVR8mhWznWq6c5mLqLsn9j=6EXPgFUOW8t26w@mail.gmail.com>
In-Reply-To: <CAHaeJsRROtH4CLVR8mhWznWq6c5mLqLsn9j=6EXPgFUOW8t26w@mail.gmail.com>
From: Chris <hoopyfrood42@gmail.com>
Date: Thu, 12 Nov 2026 23:30:19 -0500
X-Gm-Features: AclHuK-CD9AhS9wuiw7FzrTpd5YfPUmDM3UamdoqNBrWohFtQOjQtGgfwx-_tK0
Message-ID: <CAHaeJsSSYkJTiXAh3PJtfxmXYdPf_-u3OPbunB=GsYXbVAUVrg@mail.gmail.com>
Subject: Re: [RFC PATCH wireless] wifi: mt76: mt7925: get the survey airtime
 from the firmware
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Deren Wu <deren.wu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Javier Tia <floss@jetm.me>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_203032_782005_9782F6D6 
X-CRM114-Status: GOOD (  30.68  )
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

Hi Devin,

Just checking in on this one. Is a v2 still planned? I=E2=80=99ve been runn=
ing
the RFC on a Netgear A9000 (MT7925U) since late October. Busy time now
follows the channel, and the readings look right.

As I mentioned in my last reply, I take the busy, rx and tx deltas in
32 bits, since offset 19 wraps about every 72 minutes. Since then,
about one reading a day still comes out near 2^64, so roughly 2^32 =C2=B5s
below the previous one, as if the counter stepped back. All but one
were on 2412 MHz. I haven=E2=80=99t dug into it, but it may be worth a look
before v2.

Happy to test a v2 on the A9000 whenever it=E2=80=99s ready. Thanks as well
for getting the channel fix through to stable.

Chris

On Mon, Oct 26, 2026 at 9:21=E2=80=AFAM Chris <hoopyfrood42@gmail.com> wrot=
e:
>
> On Sat, Oct 24, 2026 at 6:29=E2=80=AFPM Chris <hoopyfrood42@gmail.com> wr=
ote:
> >
> > On Sat, Oct 24, 2026 at 1:34=E2=80=AFPM Devin Wittmayer
> > <lucid_duck@justthetip.ca> wrote:
> > >
> > > Chris wrote:
> > > > One thing on offset 20: in monitor mode it doesn't look like all of
> > > > rx.
> > >
> > > You're right, it isn't all of rx. Your numbers made me curious, so I
> > > tried it here with an A9000 as a 20 MHz monitor next to an Alfa. It
> > > seems to come down to how strong the signal is. Share of the time:
> > >
> > >                                          offset 20   decoded frames
> > >   one strong neighbour (-22 dBm)            2.3%          2.0%
> > >   only weak neighbours (-73 dBm or less)    0.0%          3.6%
> > >   my upload, monitor on a side channel     54.6%          7.5%
> > >
> > > Strong signals land in 20 even when the monitor can't decode them,
> > > including spill from the next channel, and weak ones are left out.
> > > That would fit what you saw on 5 GHz and on channels 2 to 4.
> > >
> > > As a station the A9000's own downlink does show up in 20, so I'd keep
> > > it as the receive time.
> > >
> > > Thanks for the long run against the Wi-Spy, and for the Tested-by.
> > >
> > > Devin
> >
> >
> > Devin Wittmayer wrote:
> > > As a station the A9000's own downlink does show up in 20, so I'd keep
> > > it as the receive time.
> >
> > Makes sense, thanks for running that down. Strong signals counting and
> > weak ones not explains both of the oddities I saw. For my use, a monito=
r
> > hopping channels, busy time is the figure that matters, and that one
> > held up on every channel.
> >
> > Happy to test a v2 on the A9000 if one comes.
> >
> > Chris
>
>
> Hi Devin,
> One more from the long run, which you'll want before a v2: the busy
> counter (offset 19) looks to be 32 bits wide, and it wraps.
>
> Since fix 5 went in, about 2.5 days of channel hopping, my scanner's
> sanity check threw out four survey readings where a channel's busy time
> jumped by close to 2^64 us. Each one is a normal reading less exactly
> 2^32 us, e.g. 264 ms busy in 645 ms active, minus 2^32. So the firmware
> counter wrapped (every ~71.6 minutes of busy time), and in
>
>     state->cc_busy +=3D __res_u64(IDX_BUSY_TIME) - state_ts->cc_busy;
>
> the new value is smaller than the old, the difference goes negative,
> and cc_busy wraps. It happens once per wrap; the readings after it are
> fine.
>
> Taking the difference in 32 bits would cover it, e.g.
>
>     state->cc_busy +=3D (u32)(__res_u64(IDX_BUSY_TIME) - state_ts->cc_bus=
y);
>
> and the same for tx and rx, if those are 32-bit too. I only see busy
> directly, so I can't confirm the other two.
>
> Happy to run a v2 against the same setup.
>
> Chris

