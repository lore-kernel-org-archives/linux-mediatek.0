Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60706606A33A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2026 11:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d/lubZM8;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ROIf0Llv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5Atfc5zlyNXW6OtAyRigvyHRys7Tsw1F2mguudvujDk=; b=d/lubZM8UDyFgWCgP3BaJj7PPG
	HyospXTf5KlFzVcSuYYK7tMVw87IIBQhknoho09xYUrqs/AWG4Bkk/R+ZJNF5JDE/HH1G/M7AA5yX
	41lgzT4FXYnJ+u6JhChZzXkLxPE8uAGX5EFGUolWyQNBe+eVXNsM2Bk3lSKiftAt8tMVnQB0iV+en
	2L7hxZPCLGLEJJihPpEBgBxYiYN60OT5LSQmhF96UjuXhW/6NQydhLSszNCOGLXjr//WAZi1xgVaq
	7YShZkj1B6r7HIR44FZtgWvECzm67x3wswR7HS3PU712SFxhgYIGiHtkNiUGCZ7wLGWdZ3+mKOhFQ
	mqIYqakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq0z-0000000GHHZ-0PIS;
	Mon, 02 Nov 2026 11:15:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNq0x-0000000GHHK-0kKV;
	Mon, 02 Nov 2026 11:15:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A05C7407DC;
	Mon,  2 Nov 2026 11:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475CA1F00A1C;
	Mon,  2 Nov 2026 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793618146;
	bh=5Atfc5zlyNXW6OtAyRigvyHRys7Tsw1F2mguudvujDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ROIf0LlvIq/LO6HwVZ+PdFeCXRtoyOdDuqnvXVwKml9UfFYCJqB1aZrDN+rEo67DE
	 IV5df7y9wWDpKBf2UV/AZ2Q5Ew6T/8Pv/HjHjYKFbX/y9RSRrq39dA40XxyyAZu0Md
	 nEFc1UreMAxoIsc56gwuojOo9wbrkberwRRmXauE=
Date: Mon, 2 Nov 2026 12:15:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: Re: [PATCH RESEND] usb: mtu3: fix system suspend in gadget mode
 after soft disconnect
Message-ID: <2026110236-game-mandatory-2890@gregkh>
References: <20260929-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-a0ac3b6b2b62@gmail.com>
 <416aaa7a-aebb-4129-8af9-e2895ac9f78a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <416aaa7a-aebb-4129-8af9-e2895ac9f78a@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 09:43:20PM -0600, Ryan Brue wrote:
> Hi Greg,
> 
> Gentle ping on this one, there hasn't been any replies since the resend on
> Sept 29. It fixes system suspend on MT8173 in gadget mode after a soft
> disconnect. I've been running it on an Amazon Fire HD 10 (2017) since
> September.

Sorry, I see no context here :(

