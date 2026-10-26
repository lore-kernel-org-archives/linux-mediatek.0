Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9AF606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fiXDRwfF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I++PtcrH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ygKVfMFF6pfWjNei1maHXSS98SoQihg9ncD5VKqI0fA=; b=fiXDRwfFd7nlUd
	TYXcdH1ej/02wGjlCNcTo4hAg7WcOMkq7SK+SMgKMDxY5sBF29dnDOyfLeTQe/rkGz6u3FsyWeDCt
	YvzEcA7aTWWj8rTdFSmlr8VJubBRNI5+NYG0aAxSqnd3dfo0oJd8ubtrVhGfJ3RsXOeEpIts4dmX8
	ubLW3TNjgAsfSJVNqa+I8RoK7bXpXi+Q/EQSzPb6cTBQDLAL2b3qJf1HyD+uavMljA0fRv6u0U96J
	Pz7rmi//bAM/8pBsAg3Fo4gNtfkdbzIqzskNl4vpYKUmgifOqcLhJ8uCph3dsMwkmIEhkj01+tPma
	ynx/RgiFqTW2cLGWR1CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKeO-00000002akH-1puU;
	Mon, 26 Oct 2026 13:22:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKeM-00000002ajc-2437
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 13:22:07 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ea138a3497so19428065ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 06:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793020925; cv=none;
        d=google.com; s=arc-20260327;
        b=cVhcakgVDNBltijEzar9dE5e6bpP2QgnkwYQiwzhKiCjRgOPaho9aigK1a/ifSLAvV
         hlXY66HwThFyVaVSGa1eLmxzU1Bfn+JKnZXGd8oe0NjoXFFywm7/3zUYWFp4y1aCcyx6
         wlX7ncLPcxpT0GtW4fcYuO0WqfkRSBWUMbXek4jxaKq2JmwaipNnZUmgZita/2nSKpmW
         pUSW/Doz1wFqgV/2iSnP/x9JKOB6T6ZDJqlsElGgrHsyCvpN6piPEM69jGUrv//R94zj
         /V+hojlztqfzvHanXsfeI+S2wBUD/Ns7ehewJDBX6geMrNMsud6yM2WhO/usSGW+Ern3
         gg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ygKVfMFF6pfWjNei1maHXSS98SoQihg9ncD5VKqI0fA=;
        fh=Iy6Gc73UzjSLX1F8Tx+4hHM3QcMjDugaVdNi//g0qvQ=;
        b=CqSsYpiZDv6uZc9cQppKUv0IX/gWoS9Bmz4B3pbh171JTWf3YB3XRqsFMAoEHHjqx4
         ZAb3aDdYM0ScgEVmbFRoOryTn8nVzrcrnpJMSH0X9uHbDKdv02sM1N95+XIXNoITvWrs
         n2Xb9HpM6fSY8yRkKk/mV87Bf90pbGPaH8epun5m440b1fwfrkw4D7d/AHWU6TiiqhP/
         yQzaJGI+bGnVWfgbDA+n6W4U4Ecu6MPCKHg4SAhIp7GYmY92hzhhFYmKvXI3ytnLWZP9
         ScAtfIfCfmxa64s/eRdtaG9xwBfuVGgvnzJCOnPD5VGeVkHfqAmoxoVzTfWYH6iZODYB
         OooA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793020925; x=1793625725; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ygKVfMFF6pfWjNei1maHXSS98SoQihg9ncD5VKqI0fA=;
        b=I++PtcrHF7QrGK6XleGqtGW22vefKt2OwbV2VoyQ7GQHj0UdN2wBMcwYHBu9RkPKXa
         f6HwhnJcwWo7IEtlThWqxY86D460Qj1d2feaBnNuypz6bhKrWMwOWE1zKea053Ex16Fs
         ufNXapgu3e95G5t/9KY67XHv9MGexsyDZID+AIEBQeey5rFRzkU0dvu89ZtAX1Gr+bR3
         QkYihfKmKMVGrTAPdB6w9n1YmZOyGyIvA/ph0eb8Zv/ZI6ycPB99ch3LZel/dsvTFmGb
         0nmMvgBbM6CytIiU0pFGKYnFXhdFxiQjzipwDW7VhdKhzoYGy8wOqWBAhcFfQAbVzGQU
         7NHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020925; x=1793625725;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygKVfMFF6pfWjNei1maHXSS98SoQihg9ncD5VKqI0fA=;
        b=mDs8cU8QoBN0yc69GWFAq3lbHBvoQE+kICW3RZN+OdCopM8Cp2Rv9Iq5IjBdIc7AcV
         TVlzVcWCPZ0pwQIl8kY6nJTBWCWv7wIbiPSTL+Qi9KJ7UmKKaJI66gYuNmBIccwhnOmT
         2FZgrgK5wcJT/H6+lwxCPBTej1srzc9GLHFRSH2gOjpaYw1NUya4N6zyNSCRzqdrGIBr
         9d3jNQeEAcpGLAucl5++v8JyqKtk52DotLDn1Cj0a7d+x54H1elNZ90TSqYug2gnKyZT
         HuaNDvNdiqep1wfDeg50HdxuLOp88OLaGAoVQtcO6+mvUzJRVLs6hjJupFdnAXj4dcr3
         OlOA==
X-Forwarded-Encrypted: i=1; AKwUvBz9qG5DB65EK4SEXAVt89dE8TQmZEfew0BNpJou1RRpqNqXsvaoG9ilMaZQLqra+fc3/RKKOS4bfOr3db883A==@lists.infradead.org
X-Gm-Message-State: AFq9FYLaeWwt9dKioUP32WDr3PobGpPfcKL2PG58vlyrIZ39eVLkmHuC
	ywb7xwRui4DJHFbyuJsNleMxdMGPhRWCmAcfjJs9DTPV0Jkm/niykHmJoGVACJ8Ecg9ViiS+hoP
	deb7A3B6yq/o4trCodJhLlzN/KmzJpg0=
X-Gm-Gg: AYBFou1vedxEXSVv7JJr5WrBY2muDpf5/lSpTLYIjxCMk1jYNRRCdyXGi5Igw8y+rJk
	pETwg+4bA0Yy3VSaKOGJNkmL0HWfkQOYUhtO98cL/1WtUbGRmL6kETf31ANfz3j7cNeWOzJD0QQ
	NiNs8g42L1QUPGzPHIfMbpFD00rKGIetK+0n8CofPqm5KNVB5xCNqCowsO23OfehmuDesHDT4Bz
	MFmEA/KVfxCAhmQ5HhVluBTFfTtii89HbH6cVzmSHwqtd0WK3aGoxiPsjrBkRFFkijJcrntLxM/
	XkLq3/7mHIuBgpsnpo+9Lz/8tmQZGM340hyarO+MSyKGHgt8i0I57FD6o+BhTyN4md41qoQ10lk
	fnEo2WkC5a/bMBHnBad7ztmuCxg1KW/+SkaF46A==
X-Received: by 2002:a17:902:d58a:b0:2e8:18ca:5f46 with SMTP id
 d9443c01a7336-2ea9c6c8307mr61563325ad.14.1793020925006; Mon, 26 Oct 2026
 06:22:05 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAHaeJsQLvC-KBEpy5qu8iYxSB51mbHohrPvN4PJushF_Tk3foA@mail.gmail.com>
 <20261023180554.7266-1-lucid_duck@justthetip.ca> <CAHaeJsSfoTxJhWVCrELCiLZr1zD42LGJUvrmf7oSzRQpwh6-jw@mail.gmail.com>
 <20261024173414.10559-1-lucid_duck@justthetip.ca> <CAHaeJsTHykkk8Cm+FUZW2RmzzmT47aJNxRR1kpymhDvknnhKuQ@mail.gmail.com>
In-Reply-To: <CAHaeJsTHykkk8Cm+FUZW2RmzzmT47aJNxRR1kpymhDvknnhKuQ@mail.gmail.com>
From: Chris <hoopyfrood42@gmail.com>
Date: Mon, 26 Oct 2026 09:21:52 -0400
X-Gm-Features: AclHuK9WB8vBfhKMX3Q1TrHTS-1eG0jMt6qxG97MzBlpwE7ruuhiuAsEwZx9bHs
Message-ID: <CAHaeJsRROtH4CLVR8mhWznWq6c5mLqLsn9j=6EXPgFUOW8t26w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261026_062206_542545_9514787C 
X-CRM114-Status: GOOD (  24.05  )
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

On Sat, Oct 24, 2026 at 6:29=E2=80=AFPM Chris <hoopyfrood42@gmail.com> wrot=
e:
>
> On Sat, Oct 24, 2026 at 1:34=E2=80=AFPM Devin Wittmayer
> <lucid_duck@justthetip.ca> wrote:
> >
> > Chris wrote:
> > > One thing on offset 20: in monitor mode it doesn't look like all of
> > > rx.
> >
> > You're right, it isn't all of rx. Your numbers made me curious, so I
> > tried it here with an A9000 as a 20 MHz monitor next to an Alfa. It
> > seems to come down to how strong the signal is. Share of the time:
> >
> >                                          offset 20   decoded frames
> >   one strong neighbour (-22 dBm)            2.3%          2.0%
> >   only weak neighbours (-73 dBm or less)    0.0%          3.6%
> >   my upload, monitor on a side channel     54.6%          7.5%
> >
> > Strong signals land in 20 even when the monitor can't decode them,
> > including spill from the next channel, and weak ones are left out.
> > That would fit what you saw on 5 GHz and on channels 2 to 4.
> >
> > As a station the A9000's own downlink does show up in 20, so I'd keep
> > it as the receive time.
> >
> > Thanks for the long run against the Wi-Spy, and for the Tested-by.
> >
> > Devin
>
>
> Devin Wittmayer wrote:
> > As a station the A9000's own downlink does show up in 20, so I'd keep
> > it as the receive time.
>
> Makes sense, thanks for running that down. Strong signals counting and
> weak ones not explains both of the oddities I saw. For my use, a monitor
> hopping channels, busy time is the figure that matters, and that one
> held up on every channel.
>
> Happy to test a v2 on the A9000 if one comes.
>
> Chris


Hi Devin,
One more from the long run, which you'll want before a v2: the busy
counter (offset 19) looks to be 32 bits wide, and it wraps.

Since fix 5 went in, about 2.5 days of channel hopping, my scanner's
sanity check threw out four survey readings where a channel's busy time
jumped by close to 2^64 us. Each one is a normal reading less exactly
2^32 us, e.g. 264 ms busy in 645 ms active, minus 2^32. So the firmware
counter wrapped (every ~71.6 minutes of busy time), and in

    state->cc_busy +=3D __res_u64(IDX_BUSY_TIME) - state_ts->cc_busy;

the new value is smaller than the old, the difference goes negative,
and cc_busy wraps. It happens once per wrap; the readings after it are
fine.

Taking the difference in 32 bits would cover it, e.g.

    state->cc_busy +=3D (u32)(__res_u64(IDX_BUSY_TIME) - state_ts->cc_busy)=
;

and the same for tx and rx, if those are 32-bit too. I only see busy
directly, so I can't confirm the other two.

Happy to run a v2 against the same setup.

Chris

