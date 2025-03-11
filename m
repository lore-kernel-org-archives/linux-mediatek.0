Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BAAC2BA1B
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Mar 2025 05:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsL06UvFaIQXEiahdE6DhBRWjwB8pb861e5j/ftXC1c=; b=FtryKW2hXfHi5R2WNC8kwH4kWt
	Fa286tK3YsgG4qQNqaMAjhuXueXlHhtbBxiWcwfjFl5cN9/d3gX49ALMKa/e2x1imtCbc5gTmxi3D
	uM/U60CqRlqbO/DRasmJZf57jabvR4RDXhLbK+VDTUmTSx/K52YNDkP3FTEeXeAgFCa+zD1qbuJdk
	ttrG6GPwjomtpdzHkXsKnkj5K0IjeNOObCsuE4WPtT0D/JEVOJJA1Cjam0tlRsQIHYMYcCig6nRPx
	mpblq6yPa+DVnCF5wM0WWSAXqhkEfJ/pBPiGOxZ38KAQmx7Z+mQ5HHksMCIaYTiYzQHpc/0Vx8oAy
	oToHGCzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trrlW-00000004ccg-24sj;
	Tue, 11 Mar 2025 05:02:54 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trrlT-00000004cbz-2L3W
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Mar 2025 05:02:53 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22113560c57so92958745ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Mar 2025 22:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741669371; x=1742274171; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YsL06UvFaIQXEiahdE6DhBRWjwB8pb861e5j/ftXC1c=;
        b=S8J1D8P3jVPGe+JMNkOS5NrHK/AK1sUFvNlO3lqUG7hIj/oyqyqsD45ZinC3mCRQOL
         Y2dDvTqGvkiPrs4pCmkC8p4w25nJJMOxsKFvUrIYfX+e8kxTirCogMQ09JUQBrHW5Iy9
         OmnQmJfzLehaTtel1Y0k2h27c1MU0NoIrMtXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741669371; x=1742274171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsL06UvFaIQXEiahdE6DhBRWjwB8pb861e5j/ftXC1c=;
        b=kiDH0TuvfrVz/sy9JH17AihH7hrU2lHxRahMFgJ51kAeBNp78bUWsjlKgdufRwxdV+
         HV3j0EqAHTNlJWdIyU3K7PWEQTjESXn5G/0K5H2Fv+SN/BlN8jxnwDkCbgLFMUjuvCqP
         d1wUaYJPZwdzpM78aKsJajACqu5wZdJ3VS7d9Lxc23KHxW0M5nkReyrTlbw8dPBGkfQv
         1PsHl6yGyKTxGqcqpM8C4faRRy8m7tNfnqHD43J5Go5iBms0KgtBswFvZigrHm9YGR+A
         lV1NNYYhOFfUj9W14Mc/8aMZCMtqYA/FFpKlZNmi3T4YOzI+mHAR1j7csXzUfqYmIgsi
         2NSg==
X-Forwarded-Encrypted: i=1; AJvYcCVKHMDyeSaSH3ucOMZkLbyWBBX81PnqDiAYqf21QgmPAmmUBloLcRIAk7Y6Mn4aGbJo0isQYO+mE9b09Yls0g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7t8fKS7tQpkqL2MZXLZk2DoeWlrmak86mp3mVRZVo5twKPr9T
	sz4r3w2x+rUAHtuZtIGTd3ECB+zaW88j6O5EsUT1HFhAXSqMklTqdcaLpoebVQ==
X-Gm-Gg: ASbGncuafZlQZfFRfXPdCNSh3Ka5Mh1kc3ZocXYOoG6lbDybS4lEmmCRQjARM9AJOnY
	as7nS54baJYaLU9OC7uzRAEos+vy3AdS1OyLtpbwJi3tV7+HmYRjdIqnlY3MPpFviyrHKlGK7Ew
	aFxTHVvdhcLu+xCcc3dkSCiPP+ChX2s0WJwX2n/C++WHFGawpJkS6fY9ww9vZz/iTJdxFjBFf2w
	F9+JR50DIMDLeqIfVhYs5kVhS+yFT4uaPwL8uGuMMBRJdxN4Hd7sOQgxcEwiKL0IYOJRdpjbjZS
	cQesHE9kNIWhJ5b1nfod8X6uYu6wT1TA4XlaDEaZZyxgwZnr
X-Google-Smtp-Source: AGHT+IFKfiFQm8ms/qPRi+wcBaiWNYQfbAZZRcHY4n0zNhnBnJ9IpLaSuc9kTChF2fwrDmR2pqJfNQ==
X-Received: by 2002:a17:903:40cb:b0:223:6744:bfb9 with SMTP id d9443c01a7336-22428ab7691mr283789275ad.41.1741669370601;
        Mon, 10 Mar 2025 22:02:50 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:cce8:82e2:587d:db6a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddca2sm87480825ad.13.2025.03.10.22.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 22:02:50 -0700 (PDT)
Date: Tue, 11 Mar 2025 14:02:42 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Barry Song <21cnbao@gmail.com>, Qun-Wei Lin <qun-wei.lin@mediatek.com>, 
	Jens Axboe <axboe@kernel.dk>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chris Li <chrisl@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, "Huang, Ying" <ying.huang@intel.com>, 
	Kairui Song <kasong@tencent.com>, Dan Schatzberg <schatzberg.dan@gmail.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	nvdimm@lists.linux.dev, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>
Subject: Re: [PATCH 2/2] kcompressd: Add Kcompressd for accelerated zram
 compression
Message-ID: <mzythwqmi22gmuunmqcyyn7eiggevvrzkpqmjkoxsj4q4jc46s@64jdco5s6spa>
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <20250307120141.1566673-3-qun-wei.lin@mediatek.com>
 <CAGsJ_4xtp9iGPQinu5DOi3R2B47X9o=wS94GdhdY-0JUATf5hw@mail.gmail.com>
 <CAKEwX=OP9PJ9YeUvy3ZMQPByH7ELHLDfeLuuYKvPy3aCQCAJwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKEwX=OP9PJ9YeUvy3ZMQPByH7ELHLDfeLuuYKvPy3aCQCAJwQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_220251_593942_DF79B482 
X-CRM114-Status: GOOD (  19.77  )
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

On (25/03/07 15:13), Nhat Pham wrote:
> > > +config KCOMPRESSD
> > > +       tristate "Kcompressd: Accelerated zram compression"
> > > +       depends on ZRAM
> > > +       help
> > > +         Kcompressd creates multiple daemons to accelerate the compression of pages
> > > +         in zram, offloading this time-consuming task from the zram driver.
> > > +
> > > +         This approach improves system efficiency by handling page compression separately,
> > > +         which was originally done by kswapd or direct reclaim.
> >
> > For direct reclaim, we were previously able to compress using multiple CPUs
> > with multi-threading.
> > After your patch, it seems that only a single thread/CPU is used for compression
> > so it won't necessarily improve direct reclaim performance?
> >
> > Even for kswapd, we used to have multiple threads like [kswapd0], [kswapd1],
> > and [kswapd2] for different nodes. Now, are we also limited to just one thread?
> > I also wonder if this could be handled at the vmscan level instead of the zram
> > level. then it might potentially help other sync devices or even zswap later.
> 
> Agree. A shared solution would be much appreciated. We can keep the
> kcompressd idea, but have it accept IO work from multiple sources
> (zram, zswap, whatever) through a shared API.

I guess it also need to take swapoff into consideration (especially
if it takes I/O from multiple sources)?

