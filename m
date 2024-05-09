Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8210BC10F1A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 May 2024 21:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Yo3NJl/+D3HjDzk2u86J+UDtYtrXvOHQjT1qCvhfSw=; b=mr+1TCHnqNfph7AflvVvU3CToF
	AQSTYK6MenRGe0UhIZkxyaI6JPDlQhsIZfftDruo7BvK2Z/yrKEMbA4sQ9F2cdc7IT79/+eYdSI7B
	QluSqsPJ1wN4fcaF9ofkxfiO/irrU8/9qxHxj6BdTgc6jEKpGMsK0v8Jze5W44OrhJHEgIsqOPM9i
	dSyF2b0Gf3QRInLbevi4FOPWvA7FUuscP3hUcm0MP+bOntmsWmQGZwodrGL9zrmk+KObIgeL/eeof
	P34vx0lx2+uMCQerqFiJk5dj25Ix2tYdiMx60OSSJL7uQ687pBCTfHOdfiTeTK0ffFrVdivW5O9iO
	zBHdqw8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5BQJ-00000002yTK-3Tj4;
	Thu, 09 May 2024 21:35:31 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5BQG-00000002yRr-0795;
	Thu, 09 May 2024 21:35:29 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7f82c932858so440806241.0;
        Thu, 09 May 2024 14:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715290524; x=1715895324; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Yo3NJl/+D3HjDzk2u86J+UDtYtrXvOHQjT1qCvhfSw=;
        b=mNsL8kb9/Z6xLrvW8+HWibUzs88K1FNdFpBRiNUagrItlzIWJhDEXxCygV2lqvTksQ
         XCAvxdJaquWL0l/Ujr2WoKLgFEUkEKkhiI3jD2rWma/wxx7EHg419EOwvpJUaB1i7BwX
         WaAmHfW2zxZUcds1G2upO3HXJMkkC4EmKXftJVNj07wY6/UqvWAe0hhumseJq+qrcpK+
         cFzpkJu9t7QSZUDdHMeYDl2uhtAZZsPbvJ27pEh5JfJDV92hVfdCJo4WX5GYzIblCyQa
         w8ZwZO9R2fbKfQhRGumS3b6aXr9FTK8ZAxAjR8T7BAn8vsxn3WDPHdhNmeua9u1xaIBB
         b28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715290524; x=1715895324;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Yo3NJl/+D3HjDzk2u86J+UDtYtrXvOHQjT1qCvhfSw=;
        b=jUX7RNJETJzNmyejzMNEKgsWDETy7HGT3wWuOcYx7tTQk+NX6Zm6/DhhcDsGmQDA3z
         9zDhYBkte0ZDEs95vHMvtoSlVzqUDb/yBnFKjOtzTog/mTWAmbx+Ibc1XTgFjeZqPlff
         TuJpV7Naayw399pW+gpZijh3kcTFGoVlUNSDlHtQAzDOBoLgC3wWB+7s23Rp4Jv2yst8
         WhMXq2k6w5TjDRWamiT78XX0Y0jqe3VtjVsdARU3xyY60WrEaT4Gem+8gi9gzaSPQjlt
         bpUPWY3vVi+m+svDM3VX6+WqZFJrP5Y9VLN7uBvrOmPBcxsvaKBDNlC+UMe+j4M4toMv
         8Y1w==
X-Forwarded-Encrypted: i=1; AJvYcCVWab52eueSf6E8kJmH97OoD7u4KZAXyLDsdFfJkOOSYD6mTIc2lWa/k2NmTsXcKqtvO1tYy1Zo4m+UTg/NhcoZccL71C4lywk8RGd66cNGO1Kcg3uSimDjmD4T6kuqIpJRxwmIDFbkNMyZn4BtYHjE7CErA8iBxY4=
X-Gm-Message-State: AOJu0YxZ0mu2i6X1GQWfp1H682Y1nzGcX6Dbhtzg1AB5CBSUJ3BNjjsT
	EuKupMoPEEXLAx4TUp7fMJICReZqT2u6Ach85nz9hfK6PDyAGze3/2UAz+In3SfPokuGFtyq6UH
	Vch475rMFwnzZ2aXcLXAa9BiFh8s=
X-Google-Smtp-Source: AGHT+IEDcACUSM80VSR45ArKgZiWP4c9kqdCth3bLU1kbXd1shP57oMwEOz/0YVPrQ6VzKWJJJR4QpRgtprtu6Wem7s=
X-Received: by 2002:a05:6102:3ece:b0:47e:5c2e:5695 with SMTP id
 ada2fe7eead31-48077e45cc6mr1030292137.23.1715290523779; Thu, 09 May 2024
 14:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240507190111.16710-1-apais@linux.microsoft.com>
 <20240507190111.16710-2-apais@linux.microsoft.com> <Zjp/kgBE2ddjV044@shell.armlinux.org.uk>
 <CAOMdWSKfkT4K9MAOn-rL44pycHPhVDj4CtiYkru5y_s0S-sPeQ@mail.gmail.com> <20240508201654.GA2248333@kernel.org>
In-Reply-To: <20240508201654.GA2248333@kernel.org>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 9 May 2024 14:35:12 -0700
Message-ID: <CAOMdWSJ2vV5gYpEQUCpAco3W9ZKKmmj1LXGzk7kTbAaBmsQknQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] [RFC] ethernet: Convert from tasklet to BH workqueue
To: Simon Horman <horms@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Allen Pais <apais@linux.microsoft.com>, 
	netdev@vger.kernel.org, jes@trained-monkey.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	kda@linux-powerpc.org, cai.huoqing@linux.dev, dougmill@linux.ibm.com, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, 
	naveen.n.rao@linux.ibm.com, nnac123@linux.ibm.com, tlfalcon@linux.ibm.com, 
	cooldavid@cooldavid.org, marcin.s.wojtas@gmail.com, mlindner@marvell.com, 
	stephen@networkplumber.org, nbd@nbd.name, sean.wang@mediatek.com, 
	Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, borisp@nvidia.com, 
	bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com, 
	louis.peens@corigine.com, richardcochran@gmail.com, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acenic@sunsite.dk, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	oss-drivers@corigine.com, linux-net-drivers@amd.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_143528_111047_6F532A75 
X-CRM114-Status: GOOD (  36.95  )
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

> > > On Tue, May 07, 2024 at 07:01:11PM +0000, Allen Pais wrote:
> > > > The only generic interface to execute asynchronously in the BH context is
> > > > tasklet; however, it's marked deprecated and has some design flaws. To
> > > > replace tasklets, BH workqueue support was recently added. A BH workqueue
> > > > behaves similarly to regular workqueues except that the queued work items
> > > > are executed in the BH context.
> > > >
> > > > This patch converts drivers/ethernet/* from tasklet to BH workqueue.
> > >
> > > I doubt you're going to get many comments on this patch, being so large
> > > and spread across all drivers. I'm not going to bother trying to edit
> > > this down to something more sensible, I'll just plonk my comment here.
> > >
> > > For the mvpp2 driver, you're only updating a comment - and looking at
> > > it, the comment no longer reflects the code. It doesn't make use of
> > > tasklets at all. That makes the comment wrong whether or not it's
> > > updated. So I suggest rather than doing a search and replace for
> > > "tasklet" to "BH blahblah" (sorry, I don't remember what you replaced
> > > it with) just get rid of that bit of the comment.
> > >
> >
> >  Thank you Russell.
> >
> >  I will get rid of the comment. If it helps, I can create a patch for each
> > driver. We did that in the past, with this series, I thought it would be
> > easier to apply one patch.
>
> Hi Allen and Russell,
>
> My 2c worth:
>
> * In general non bug-fix patches for networking code should be targeted at
>   net-next. This means that they should include net-next in the subject,
>   and be based on that tree.
>
>   Subject: [PATCH net-next] ...
>
> * This series does not appear to apply to net-next
>
> * This series appears to depend on code which is not present in net-next.
>   f.e. disable_work_sync
>
> * The Infiniband patches should probably be submitted separately
>   to the relevant maintainers
>
> * As this patch seems to involve many non-trivial changes
>   it seems to me that it would be best to break it up somehow.
>   To allow proper review.
>
> * Patch-sets for net-next should be limited to 15 patches,
>   so perhaps multiple sequential batches would be a way forwards.
>
> Link: https://docs.kernel.org/process/maintainer-netdev.html

 Thank you very much for taking the time to write back.
Since the patches that are necessary for this series are not in
net-next, I could not target net-next.

 I will wait for the patches to land in net-next, and the v2 will
be broken into multiple smaller sets(per driver).

Thanks.
 Allen

