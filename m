Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E101FA3740
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 18:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxFR/PbnbrlKwaIoMYaORO0/rBtrqt6GEEYlRdepuGk=; b=i401tEITRasP54mNhTbo8aKOwD
	J8qGP4N9+x3vwqtDAj+/9YbNxozV0/Syoboc3kXbXp1RPLOvXRU0mWesB1ZT9CLZg/FNJ8Dw1virN
	Qo1KgP+OmPRdObFYygAS3kxHaa1Mg46kC2tX/us5nkjLRXxEkQsDiV+3QZBQ8CcPs0paA7AO4j/J0
	ghu23WYHcD6wlKIueo4iV50MGtvJx+8/vsG4SkNYwmycb/HHMklboXJKOHF/dUt5kYqLHpgDGpT4n
	/NKkdsukb4DWs5sbPlD8DjaqrtjARsV5uAlLvdjicLLd2SX/cb61wqJol7RluYk0HAVLNzJyh/5xh
	KYlK2Bsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onP3s-006jqn-0C; Tue, 25 Oct 2022 18:54:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onP29-006io4-N4; Tue, 25 Oct 2022 18:52:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD8A861AFD;
	Tue, 25 Oct 2022 18:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B672AC433C1;
	Tue, 25 Oct 2022 18:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666723936;
	bh=TQdJlERfQEUABscmmDLT7Y2HrdNrXv8E1A8x0FSRGM0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HXDjtzO+UBdc1yePh5W/WLyMc2oBVDdqLtEyJlyYfQFURF57pFKrqXSW+UPaZgfDe
	 /J5qfQ34amGSi1DcyeqPwJ2zcr9+kab5xk5EakePQ60CKJJ69OixTqZQNqlbPCadn1
	 BbtqO81A0cfshr4hly4SDb4WourJsd9sJqFAxtDwMnD9KBRfC5PxIYZj1H7kY7XMlC
	 dk7WpufcgTIuHAKKuRaY+n7swd4MfCATpj4+zGaPDHY0VwMjhkd0G9/vxZNmy5sOYn
	 8eGQGzXCeqeaekcSMnjCybgm1iXyUZ+WKQjx73kKf6ePmFxUT+B3zDoLmPWmYdi2KT
	 vJRF+9c8CHYoQ==
Date: Tue, 25 Oct 2022 11:52:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: kernel test robot <lkp@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, ntfs3@lists.linux.dev, netdev@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org, Linux
 Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master] BUILD SUCCESS WITH WARNING
 76cf65d1377f733af1e2a55233e3353ffa577f54
Message-ID: <20221025115214.26a12211@kernel.org>
In-Reply-To: <Y1eccygLSjEoPdHV@shell.armlinux.org.uk>
References: <6356c451.pwLIF+9EvDUrDjTY%lkp@intel.com>
	<20221024145527.0eff7844@kernel.org>
	<Y1eccygLSjEoPdHV@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_115217_847057_DE48347E 
X-CRM114-Status: GOOD (  16.40  )
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

On Tue, 25 Oct 2022 09:21:07 +0100 Russell King (Oracle) wrote:
> Not me, Sean. My original implementation of phylink_validate_mask_caps()
> doesn't know anything about rate matching, so my version didn't have
> this issue.
> 
> Sean's version of my patch (which is what was submitted) added the
> dereference that causes this, so, it's up to Sean to figure out a fix -
> but he reading his follow up to the build bot's message, he seems to
> be passing it over to me to fix!
> 
> I've got other issues to be worked on right now, and have no time to
> spare to fix other people's mistakes. Sorry.
> 
> You can't always rely on the apparent author mentioned in the commit to
> be the actual person responsible for the changes in a patch.

Eh, confusing authorship trail, sorry.

I'll send a patch to drop the if (), if it's really needed we'll hear
about it sooner or later.

