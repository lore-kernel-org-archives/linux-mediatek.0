Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327A3C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 14:22:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E619C22BEA
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 14:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E619C22BEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bQWn0LeFWsdW724+GB3zim6sqcUCl6z7velCm9P005c=; b=s34uTUFwjid9NbbrV6PKAW3wE
	2KvmJLCdjqYOg1e3hoOhNd4NQgq9h+W8DZcybAYDmSUmwnUf7gSklrDVArLO/TpAa8uVc4/5zWrSt
	oUXUyDtzdflFViTq9SG9v56vCdVYtkkkEeL9kqFS99gnPOs+USUZ1SRZ0A3t92L/reWcNXURcRy8L
	428RWzSxv806fHnjwHBUjHl8OuAEBVnWAhIwa9n5bCpn0NfTlkYVI8m8oVGqlknwgjSFvBgrC7XK9
	GUZO3tEN8jojaSJ4BXyoIkOW4+cGEYYp3tgG0TZ3hISbW5iWRnR+8sgpHZtzQ0ydZVBtrB/DLSU4E
	jrwlGPXjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krM5C-0003l2-6m; Mon, 21 Dec 2020 14:22:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krM57-0003ji-2g; Mon, 21 Dec 2020 14:22:37 +0000
Date: Mon, 21 Dec 2020 19:52:30 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608560554;
 bh=SqtEboAk0qd7ZTX5Jqa9whnweGmlKEOCqrijvdgNhqg=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=UeSf5XtXJsUe6a0O/9Pc20cEAMFQh/AENbDrRZEt7yhefwRNcHz4B53zaW0Pb1Oho
 x0mx6d3Tnrw26tM710ugH6Zne6wSANiIEZF467nXzbxw/gn9UvcrmXIUO1t6ttzFjp
 9TA+v1gWDavb8j4T71V445APgxIGJRPZ5QhExleuk1qIKqXYRAF0OF8FXD0gVAcd/m
 LR1bsaJ7/Cc6njwaDq7lDvbUf9V3Hr4ttunit0blYL/YQlnle/n6ocJw0UeIAPyMmy
 9QnJ58xuT9gIQ3qxQjN1jp1zSo6FbUTlICnFw+bE44cG4/3/KzS7DJcRKAyzlfgnDE
 BIAF9EFuEhX7Q==
From: Vinod Koul <vkoul@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] dmaengine: mediatek: mtk-hsdma: Fix a resource leak in
 the error handling path of the probe function
Message-ID: <20201221142230.GD3323@vkoul-mobl>
References: <20201219124718.182664-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201219124718.182664-1-christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_092237_246024_CBC2120D 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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
Cc: sean.wang@mediatek.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 19-12-20, 13:47, Christophe JAILLET wrote:
> 'mtk_hsdma_hw_deinit()' should be called in the error handling path of the
> probe function to undo a previous 'mtk_hsdma_hw_init()' call, as already
> done in the remove function.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
