Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EA8C04FFE
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 May 2024 20:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blx7G0yR3BpUKBgsvZxIJPfTNB/LIdR6xC+S6ZS9kQY=; b=Vb1jtwkMrud1juajr7dLz7SHQJ
	nRnZzhnR/7EOT3j2ZiD6zeMZt+7lG7LZfB1Rr8uYatp+c2anwtiogg940M/DGtqDRHsAlNfbd6HiM
	w57NFtaDy1KgdZhl1ZlzbiOaKYNAi/cgHMKw19YkLGeZOyub5IJlP0Zn8Uz0QN/LswB1eEYpjb5Yd
	8/9iPGkengdc+QjPh+pf+9Av98TrifN+Y8YPGawwSy0BoucZTiUNcT6SwGWevrQyokLxnTNGzwsoZ
	BDGQz/f37S7z3j8AxTXrMNXnBwboKR1sEtZ5nDqZjI87tlcwCqc3D3o41QOJq/Pjcc+mFw9au9SzX
	qlMA0PGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4niz-0000000GrRQ-1Htd;
	Wed, 08 May 2024 20:17:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4nit-0000000GrP0-1gtM;
	Wed, 08 May 2024 20:17:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 56189CE1A66;
	Wed,  8 May 2024 20:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13308C113CC;
	Wed,  8 May 2024 20:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715199424;
	bh=AeePNuL7SFwUOG4gPSg8rwAm8IPCSABF4FYA1EDT90I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OSZyA/tB5lOjpS4LC/9SY0EU+oSR2ADLqzy+2Oxxm/z6SO+lSeYqArptx9zIchIXk
	 UiNicWJF1t0rqW+/75aVsY9qju7Ua4/12VQZiJiUlaEiH4nP7dtm6m8nHPMJVkL/e7
	 dT4l7ucoWkMp4DEZQmkg02x4F/I3bajuOdqHxt96PxG7vcQGPSxmIVSWWk4UWM2Npy
	 5j8C7jHMtngGG50t8cy9/OfatYDYYOm8fCYKK5P4uKlv6Q2FcvJcfql94ojXTASiir
	 Unt1u5D51eAHSMTj76PGlYkMWXCG+OJIRRO2EgobbMJJ0WcJKSBDeElVhnooiXnVGX
	 evN2ku1af2CsA==
Date: Wed, 8 May 2024 21:16:54 +0100
From: Simon Horman <horms@kernel.org>
To: Allen <allen.lkml@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Allen Pais <apais@linux.microsoft.com>, netdev@vger.kernel.org,
	jes@trained-monkey.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, kda@linux-powerpc.org,
	cai.huoqing@linux.dev, dougmill@linux.ibm.com, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com, nnac123@linux.ibm.com,
	tlfalcon@linux.ibm.com, cooldavid@cooldavid.org,
	marcin.s.wojtas@gmail.com, mlindner@marvell.com,
	stephen@networkplumber.org, nbd@nbd.name, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, lorenzo@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	borisp@nvidia.com, bryan.whitehead@microchip.com,
	UNGLinuxDriver@microchip.com, louis.peens@corigine.com,
	richardcochran@gmail.com, linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acenic@sunsite.dk,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org, oss-drivers@corigine.com,
	linux-net-drivers@amd.com
Subject: Re: [PATCH 1/1] [RFC] ethernet: Convert from tasklet to BH workqueue
Message-ID: <20240508201654.GA2248333@kernel.org>
References: <20240507190111.16710-1-apais@linux.microsoft.com>
 <20240507190111.16710-2-apais@linux.microsoft.com>
 <Zjp/kgBE2ddjV044@shell.armlinux.org.uk>
 <CAOMdWSKfkT4K9MAOn-rL44pycHPhVDj4CtiYkru5y_s0S-sPeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMdWSKfkT4K9MAOn-rL44pycHPhVDj4CtiYkru5y_s0S-sPeQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_131707_870968_21411692 
X-CRM114-Status: GOOD (  29.20  )
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

On Tue, May 07, 2024 at 12:27:10PM -0700, Allen wrote:
> On Tue, May 7, 2024 at 12:23 PM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Tue, May 07, 2024 at 07:01:11PM +0000, Allen Pais wrote:
> > > The only generic interface to execute asynchronously in the BH context is
> > > tasklet; however, it's marked deprecated and has some design flaws. To
> > > replace tasklets, BH workqueue support was recently added. A BH workqueue
> > > behaves similarly to regular workqueues except that the queued work items
> > > are executed in the BH context.
> > >
> > > This patch converts drivers/ethernet/* from tasklet to BH workqueue.
> >
> > I doubt you're going to get many comments on this patch, being so large
> > and spread across all drivers. I'm not going to bother trying to edit
> > this down to something more sensible, I'll just plonk my comment here.
> >
> > For the mvpp2 driver, you're only updating a comment - and looking at
> > it, the comment no longer reflects the code. It doesn't make use of
> > tasklets at all. That makes the comment wrong whether or not it's
> > updated. So I suggest rather than doing a search and replace for
> > "tasklet" to "BH blahblah" (sorry, I don't remember what you replaced
> > it with) just get rid of that bit of the comment.
> >
> 
>  Thank you Russell.
> 
>  I will get rid of the comment. If it helps, I can create a patch for each
> driver. We did that in the past, with this series, I thought it would be
> easier to apply one patch.

Hi Allen and Russell,

My 2c worth:

* In general non bug-fix patches for networking code should be targeted at
  net-next. This means that they should include net-next in the subject,
  and be based on that tree.

  Subject: [PATCH net-next] ...

* This series does not appear to apply to net-next

* This series appears to depend on code which is not present in net-next.
  f.e. disable_work_sync

* The Infiniband patches should probably be submitted separately
  to the relevant maintainers

* As this patch seems to involve many non-trivial changes
  it seems to me that it would be best to break it up somehow.
  To allow proper review.

* Patch-sets for net-next should be limited to 15 patches,
  so perhaps multiple sequential batches would be a way forwards.

Link: https://docs.kernel.org/process/maintainer-netdev.html

