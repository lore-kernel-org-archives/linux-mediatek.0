Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F74FC6171
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Jan 2026 07:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wzZZ+C4JvFtflL5rhHsxIm4twgDqMrso9vQp2h5iGI=; b=mm6fUke/TnrjFxQjuXsZq1vB5s
	KHJdkswjTcjkfGNyFkri3Zy0wjwLNVQ+abbQKr1glIYi0cLGnf3ckCyPotF2oOCxfeVjeF11lyEZo
	CAg4egPlMC2iN/9RNLd2peddj9Q9P4LNd8RxxK3lUjthkLIOpuEbmHKG5HjEsPTBhe3U1F2W+9T7+
	/wDMQLgGZRpqcJnjIkSiioe4ts0wV5ODPq5gscIa5K5WywcsnFj05MVpaBuxLQnq4PfNqB/YwT4Y9
	/oFp/O12X0kHbph2jJTUxgjd6rl4PgsCOTmOOcIox4PBz2kToK7l6EieCkLNpdYDQksxbS2CGuz5c
	bksZ3mEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbvmK-0000000934h-1wFx;
	Sat, 03 Jan 2026 07:10:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbvmI-0000000934b-3xPg
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Jan 2026 07:10:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA3DD6013D
	for <linux-mediatek@lists.infradead.org>; Sat,  3 Jan 2026 07:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517F2C113D0
	for <linux-mediatek@lists.infradead.org>; Sat,  3 Jan 2026 07:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767424221;
	bh=cqQ3Cp1O3S78fDBVt2ieQB0dIcnwI/x9ci0fd5b2ZIo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I726se6gb9jAe0Dk55FyYohwJuGhFs503/+HR8sPxUF0UEJXdh4Jda7gLfobEMqRe
	 FtajRwO6MDtgzj9NVW9Du+keQjdJbGmEuV3SzAAtki1Yl0R9cMWOiTU4hcT9ob/9th
	 Fvlqb44ucZAcpq3ANgvdYuhatbRAAWu8vvurv4lIU3UPpCScR36aMlV6EBQggMuoUJ
	 QI4a/tC2MHNWxhn6aLhEWqLx9eVAdbZx65H1V39OdJoGojNzYJH0EW/Zas44SQ/kJw
	 kMSUnjoeMhj9BHCZq1sKJspjdwwZoksjR7PFAeHzA94c6iRLA2n/v0hZ8pjzpZaqwk
	 KhrnrJYXjvjNA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37b999d0c81so107433881fa.2
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Jan 2026 23:10:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8RlhTZ7lq0rDbK31Ldu/xSVABqZ8FILyEHxvjuJMAPQ0g4XkCh6aBpzkBcn+x6JqcZfD2wX8EBJCPHG/uwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfySPTE7XHjCa2uQ+CyRa7H/pwu1qvi26Y76lRmvK6VbOyWGhP
	BKMRLgYCk6AJ582hut5Vva9Yv0C12q/oxZMy0MkzOxDU3o6gUCcSqyDTR0j5o85Ylp/sVk0FT8S
	0rddZgXQTAnxF29U22UA0ApTMh5DvSug=
X-Google-Smtp-Source: AGHT+IE0nGGSLOvtWi3wYMudd4eQi2SCOp37ehar+JWrgj4Bh8xrmqdXDfKKZoIc+upGr9gbToaLzXHY+TkEKQw3i7E=
X-Received: by 2002:a2e:a54b:0:b0:36b:9ecc:cb36 with SMTP id
 38308e7fff4ca-381216350d6mr154785091fa.23.1767424219578; Fri, 02 Jan 2026
 23:10:19 -0800 (PST)
MIME-Version: 1.0
References: <4870974.vXUDI8C0e8@fedora.fritz.box>
In-Reply-To: <4870974.vXUDI8C0e8@fedora.fritz.box>
From: Sean Wang <sean.wang@kernel.org>
Date: Sat, 3 Jan 2026 01:10:08 -0600
X-Gmail-Original-Message-ID: <CAGp9Lzp8NjVwkn2atNqT9x9-QTkWMLxK+Ntkb=3Z1fWcM6N=7A@mail.gmail.com>
X-Gm-Features: AQt7F2pG8y8xzlHaDwCnenEXUCXo0F5MNVqMpSOh_g6zCO_j7HeTk1xd1I8nsRs
Message-ID: <CAGp9Lzp8NjVwkn2atNqT9x9-QTkWMLxK+Ntkb=3Z1fWcM6N=7A@mail.gmail.com>
Subject: Re: mt7921e: repeated driver own failures cause hanging
To: moosager90 <moosager90@gmail.com>
Cc: linux-wireless@vger.kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi moosager90,

Could you please share more details on how this issue can be
reproduced? For example, does it occur after suspend/resume, under
heavy traffic, or during normal runtime? Also, please confirm which
firmware version you are using.

It would be helpful to test with the latest linux-firmware version:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git=
/commit/mediatek?id=3D5cf85776762a544ad27c4447b61eaabb0d4716e7

As a debugging step, could you also try disabling PCIe ASPM and check
whether the issue still occurs?

               Sean

On Fri, Jan 2, 2026 at 4:35=E2=80=AFAM moosager90 <moosager90@gmail.com> wr=
ote:
>
> Hello,
>
> There is an issue with mt7921e which causes repeated failures in chip res=
ets,
> bringing the network down and causing hanging on every command or action =
on the
> system; the only workaround is to reboot. This is what the kernel output =
looks
> like at those times:
>
> mt7921e 0000:62:00.0: driver own failed
> kernel: mt7921e 0000:62:00.0: Timeout for driver own
> kernel: mt7921e 0000:62:00.0: driver own failed
> kernel: mt7921e 0000:62:00.0: Timeout for driver own
> kernel: mt7921e 0000:62:00.0: driver own failed
> kernel: mt7921e 0000:62:00.0: Timeout for driver own
> kernel: mt7921e 0000:62:00.0: driver own failed
> kernel: mt7921e 0000:62:00.0: chip reset failed
> kernel: mt7921e 0000:62:00.0: Timeout for driver own
> kernel: Console: switching to colour frame buffer device 360x112
> kernel: fbcon: Taking over console
> kernel: mt7921e 0000:62:00.0: Message 00020001 (seq 1) timeout
>
> I have observed the issue on many untainted kernels, and I have had it ha=
ppen on
> vanilla kernels not provided by my distro as well.
>
> Mine and some other people's reports are available at [1]. More logs of t=
he
> issue on my system are in the attachments of my original report on the Re=
d Hat
> Bugzilla [2].
>
> In the past, the issue was reported at [3], which resulted in a patch [4]=
 that
> only keeps the system running instead of panicking. This means the driver=
 still
> causes system hangs.
>
> I still don't know the root cause of the issue and I would like to get to=
 the
> bottom of this; any help or guidance is appreciated. Crucially, I have no=
t found
> a way to reproduce the issue at will.
>
> Best regards.
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D220353
> [2] https://bugzilla.redhat.com/show_bug.cgi?id=3D2411854
> [3] https://lore.kernel.org/linux-wireless/VE1PR04MB64945C660A81D38F290E4=
A4BE59F9@VE1PR04MB6494.eurprd04.prod.outlook.com/T/#u
> [4] https://patchwork.kernel.org/project/linux-wireless/patch/727eb5ffd3c=
7c805245e512da150ecf0a7154020.1659452909.git.deren.wu@mediatek.com/
>
>
>
>

