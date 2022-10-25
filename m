Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73812ECDFA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 23:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bD5GABpHa9zczDjL/GJ7Nsm2ui5w4kCCUNvaFDGN2co=; b=nk1tzuXjgZ/PML9m58buthP/GF
	xs9rBNifUj1x51TpYni6deuMPcQ3/jELM8E07x3s9Zo/oxKb5xzGH8Qcvz38om0AmaM7mXqOJRKmB
	8cxJTgmuMQu2namtSOgLD+ENmf9T+mtndS89WVrD1++WZIJqqWrcYBOQZ/OFyBNyfHRgb5C+FOhzY
	OFmgIINrgSokILmHrp8Ho5QSXnub0RMgwa+uznT3w9ZWQCCUgjkRjDJJgdGS/evPBe/v+CtvxnAcy
	aztLZaEUA8IN230aaDyyTb+q2xqml0KR/4snzN6SAXQXiFICAbM4Eo0MLpaKqYMKO0K1c3aGpyjmk
	xPK5KWVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onTAt-007XQK-2H; Tue, 25 Oct 2022 23:17:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onTAd-007XKc-Nq; Tue, 25 Oct 2022 23:17:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 18C1161AAD;
	Tue, 25 Oct 2022 23:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CB3C433D6;
	Tue, 25 Oct 2022 23:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666739838;
	bh=nV7OVDrwGLapIVrA2MkHe7ePYFXFsBK++LsqBN3LGxk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jgmD4R4nRxyvZqQf+RFkpy8OzZlwZWaN3uMpSb/mKDFK4G0lCt3Ub6SDpdtaf3acw
	 RZVWqtWUdVWFpdnLdaoRDbX+u2XI7TUZeUGvvX6eMRqfThv4W+1QhoXi6FhA0uiu3U
	 PNjHDugBCqcOWYunfi/Rxn2nqZEUG6HpBB5lfDfbMkst0/sSI7ZTmhUxaSyxO3Dp5g
	 X0HKBuHzTUAQJMZ+v2mw/xPvuoxoT7NR1OW7a7axArGENNfisA0CnRHJWsile+/6Db
	 VyiNFed0Lk2ahgi29Z9TjFLF2VANpmwGA00vmUK5eYV1xioMDnC9uB8Re4MJZgl8vv
	 jUNx3NlKFq+vw==
Date: Tue, 25 Oct 2022 16:17:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Doug Berger <opendmb@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, ntfs3@lists.linux.dev, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-scsi@vger.kernel.org,
 linux-mm@kvack.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Florian Fainelli
 <f.fainelli@gmail.com>, Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [linux-next:master] BUILD REGRESSION
 89bf6e28373beef9577fa71f996a5f73a569617c
Message-ID: <20221025161716.1b92a033@kernel.org>
In-Reply-To: <8fbc9d02-3c73-5990-85af-82eecb6d64e3@gmail.com>
References: <63581a3c.U6bx8B6mFoRe2pWN%lkp@intel.com>
	<20221025154150.729bbbd0@kernel.org>
	<8fbc9d02-3c73-5990-85af-82eecb6d64e3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_161719_852693_ED77F411 
X-CRM114-Status: GOOD (  16.51  )
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

On Tue, 25 Oct 2022 16:04:15 -0700 Doug Berger wrote:
> > On Wed, 26 Oct 2022 01:17:48 +0800 kernel test robot wrote:  
> >> drivers/net/ethernet/broadcom/genet/bcmgenet.c:1497:5-13: ERROR: invalid reference to the index variable of the iterator on line 1475  
> > 
> > CC Doug  
> Thanks for highlighting this for me, but I happened to catch it from the 
> linux-mm list and was just looking into it.
> 
> It looks to me like a false positive since I am initializing the 
> loc_rule variable in all paths outside of the list_for_each_entry() loop 
> prior to its use on line 1497.

Ack, indeed the code looks right. Thanks for investigating.

> If desired I can submit a new patch to make coccinelle happy.

I wonder if Cocci can detect writes. Let me add Julia for visibility.

If not we can use a different variable for the "check if already
exists" iteration? It could make the code easier to follow, IMHO.
Or leave it be.

