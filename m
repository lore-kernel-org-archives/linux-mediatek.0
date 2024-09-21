Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DE3CF9C5C
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Sep 2024 00:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcrw/urvHboN+ojXnHKkeqHrxa41BI3Q3cVQ1Lz1j/4=; b=4fvpbUDP8khAQofnphFOyIkRXd
	yNxOOPr0p7DAgU+aeOZJRSwQwTUniYsfthsPTfI9ylToKgT1dX0QJoK1v9rSJUTFqoUmG7ZSkVSh+
	ATgamPQ2C7AcGeaDfGd6Jng95JUi5V2NSaZrfSS/mAv6XRoejagVLOX6ewD8/rRpAm3/GY9RC8Tit
	0DqbAe3O0wnOCB4tbCmU5FMaELsWKhTquhbfmD1pA09ExUIxeOKolWmSLZg54XgcFrYzBWQaQ92xC
	8UPtSpbToBjBd/a/n9S7gGwLsrar800/z/4yZafq+g4KaW0Hj1pji4dBe1Szywz1KrXIjeyMrTUZ1
	SBmT33Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srnde-0000000D5sL-47DQ;
	Sat, 21 Sep 2024 00:06:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srncW-0000000D5id-2roA
	for linux-mediatek@lists.infradead.org;
	Sat, 21 Sep 2024 00:05:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 40295A43E07
	for <linux-mediatek@lists.infradead.org>; Sat, 21 Sep 2024 00:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D924EC4CEC3
	for <linux-mediatek@lists.infradead.org>; Sat, 21 Sep 2024 00:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726877102;
	bh=INlKS5tNGyAIUwftuVV4YHTl+jDewLLG5i9G1VOSdhM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u5+LehS58NQuczqxX0Rx8/hXqC32CxQTiOKtwz84OVGuwoZtTdrP/4+BeI3xuTtN6
	 z/OOcgiiXo8X/PQ0cyuFBsASo82ztW65Nr5xbC28JeldGKsyiaNvgsFVlxZnuhxuhr
	 SG5zlrs00CWe9FpQ+zjew4WTCAUrMOjUz1WcKxzSQ7ioPjy02wNQymiWwXDmKBqNkA
	 YdJqhMCzHaubASX6Hi1qCKrKyGVos9spL+Xk3LN2wl+He3ovOmtvTB95OBF4y9jTio
	 EjA9WuYfBhZvFxQrchJ62kYgPaPLN05ZY5/pCoA6czn3XdRouyaYIuC4YTTthdyg4w
	 iC3iThbr0J8vA==
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e0b7efa1c1bso2597978276.3
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Sep 2024 17:05:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVacUj4cz4e+9DX2TB8WkryqJ4KuDI8eVLHrh95P3Iewp2xi0pye7xHasBhRNr/zQBfZOtPQV2Iq0FnLn+Jsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQV+ZuXt7QyFtcl7iD6pEu35iXk5q5a6YBLp7uMG0qhWy34cFx
	UraoF6AvQdeNveifYCXS9ezzamVQ2Z8uZ9RpJiuahavJ3MO7+f2e0/gif1MpMnz/FYvwD5y9vRs
	5X1JDYiXocx15hWorNJDGwjLFRPVfzaGsIIIRkw==
X-Google-Smtp-Source: AGHT+IFTgD18lT/k5y3/uFsZmumRkstI4L4Woj+Ow1MTZJ00Q7iFIujz/YsqJe0xXL7E4JJ1Hut1lEDJr9Sp5F5cVxQ=
X-Received: by 2002:a05:690c:6506:b0:6dd:bc2b:2aa4 with SMTP id
 00721157ae682-6dfeeff826dmr53781547b3.39.1726877101859; Fri, 20 Sep 2024
 17:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240919112952.981-1-qun-wei.lin@mediatek.com> <ZuwM-aEEo7DE-qXw@infradead.org>
In-Reply-To: <ZuwM-aEEo7DE-qXw@infradead.org>
From: Chris Li <chrisl@kernel.org>
Date: Fri, 20 Sep 2024 17:04:51 -0700
X-Gmail-Original-Message-ID: <CACePvbUCNxy3sf6+7hk9HPGTNtTMbA2=Entu0xbV7TbwX4M2WQ@mail.gmail.com>
Message-ID: <CACePvbUCNxy3sf6+7hk9HPGTNtTMbA2=Entu0xbV7TbwX4M2WQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add BLK_FEAT_READ_SYNCHRONOUS and SWP_READ_SYNCHRONOUS_IO
To: Christoph Hellwig <hch@infradead.org>
Cc: Qun-Wei Lin <qun-wei.lin@mediatek.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, "Huang, Ying" <ying.huang@intel.com>, 
	David Hildenbrand <david@redhat.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Dan Schatzberg <schatzberg.dan@gmail.com>, 
	Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-block@vger.kernel.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	John Hsu <john.hsu@mediatek.com>, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_170504_863361_8697C8ED 
X-CRM114-Status: GOOD (  16.37  )
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

Hi Qun-Wei,

Agree with Christoph that BLK_FEAT_READ_SYNCHRONOUS is not set
anywhere. That needs to be fixed.

Having a flag for BLK_FEAT_READ_SYNCHRONOUS and another flag for
BLK_FEAT_SYNCHRONOUS is just confusing.
for example, read path need to test two bits: "sis->flags &
(SWP_SYNCHRONOUS_IO | SWP_READ_SYNCHRONOUS_IO)"

There is only one caller of the bdev_synchronous(), which is in swapfile.c.

I suggest if you have  BLK_FEAT_READ_SYNCHRONOUS, you should have a
BLK_FEAT_WRITE_SYNCHRONOUS for writing.
The previous path that test the SWP_SYNCHRONOUS_IO should convert into
one of tests of SWP_READ_SYNCHRONOUS_IO or  SWP_WRITE_SYNCHRONOUS_IO
depend on the read or write path (never both).

"sis->flags & (SWP_SYNCHRONOUS_IO | SWP_READ_SYNCHRONOUS_IO)" will
change into "sis->flags & SWP_READ_SYNCHRONOUS_IO"

Then you can have  bdev_synchronous() just return the
SWP_READ_SYNCHRONOUS_IO | SWP_WRITE_SYNCHRONOUS_IO if both are set.
You don't need to have just bdev_synchronous() and
bdev_read_synchronous(). That is more boilerplate code which is
unnecessary.

I also suggest you squish your two patches into one because there is
no user of bdev_read_synchronous() in the first patch.
You should introduce the function with the code that uses it. Yes,
yes, I know you want to have a seperate patch for define vs another
patch for using it. In this case there is no good reason for that.

Best regards,

Chris


On Thu, Sep 19, 2024 at 4:37=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> Well, you're not actually setting your new flags anywhere, which -
> as you might know - is an reson for an insta-NAK.
>

