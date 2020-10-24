Return-Path: <SRS0=L9pZ=D7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135D6C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 08:26:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A02332177B
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 08:26:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SnZxLvRI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="od7s9IcH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A02332177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g+sv3fJUDiBq0cKfvisIcWP1hss4QGlZq0rY9XTa5gw=; b=SnZxLvRI8fpHl3lTBorW+Xr11
	/vWiu6kRbF+Qvz87hH5SIOry9/M5K+1eoeBxJRmBXALfuw7pSs7Hi/2+PO3EO0/ukWFhsdE5/1wai
	M1noLzYE1BW3gXPa7wJIZhAGDjAFiNSq53z6mpc+2S1jHyrnpXgCOUxU7QlfkiqKmcZwUSPFT/n0Q
	oAkAkXa8ycNuizH7wG2qHZ6OeO7lnqPAs1uZqd0M4xeppyNyZYCrkbZqJVImTuojSIWoltjqCGGpB
	SWl+hqtJRxxv3LnXG+aRYcVRXewAdX1Y341EWorpSYDl2IXULTIx5LLN5+34GASBa3kfCKUDlfkJh
	LoDNAgtZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWEsc-00039W-6e; Sat, 24 Oct 2020 08:26:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWEsb-00039M-7W; Sat, 24 Oct 2020 08:26:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7WW5OjIy5DyHhu4sd+/BFehn7zhBtJPdgdSvBW+0nug=; b=od7s9IcHsTFcQ60ryu18jthu4I
 tb2R2rJxn3zQfbHPnVVKSnxt2ZAPoC2wcS8OcyYayPjWJ6Wmgb37qXN8hvJ1rOoUPe3XJMzJpg5s+
 kwmAWmOfSggXZaqgigIHK2sVs9ZoKzHvSUaPhBDeH1nzRObTzMEGFhxhZJJ030Q5RBau+Y9QPerqq
 DQs31HF9msjTKWVMYSQzeOoAnTNru1QN+nA9aIs3LEgFBn/fkMNw87uNWF7cBD66lsU8Vjiee3H8Q
 EYuvrzHBEfGoPK2QCqcnsfAO67lXimVaecmmG4sZTjnBESEZYL6SRLDl7I5dlLXA8F1pxnVc3s+9J
 u21gzJUg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kWEsU-00037d-Od; Sat, 24 Oct 2020 08:26:18 +0000
Date: Sat, 24 Oct 2020 09:26:18 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Claude Yen <claude.yen@mediatek.com>
Subject: Re: [PATCH] PM / s2idle: Export s2idle_set_ops
Message-ID: <20201024082618.GA10844@infradead.org>
References: <20201022061748.13730-1-claude.yen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201022061748.13730-1-claude.yen@mediatek.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Len Brown <len.brown@intel.com>, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Oct 22, 2020 at 02:17:47PM +0800, Claude Yen wrote:
> This series based on 5.9-rc1
> 
> As suspend_set_ops is exported in commit a5e4fd8783a2
> ("PM / Suspend: Export suspend_set_ops, suspend_valid_only_mem"),
> exporting s2idle_set_ops to make kernel module setup s2idle ops too.
> 
> In this way, kernel module can hook platform suspend functions
> regardless of Suspend-to-Ram(S2R) or Suspend-to-Idle(S2I)

Where is the actual users of the export?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
