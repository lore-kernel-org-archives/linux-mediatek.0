Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586F7C67871
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 21:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eg6GOQtZACSfOLvqsH9Jzam7dUz/enYxqCAOwD3ZXfA=; b=QSlpWl72FB/h7+1iGNDY610QCs
	4pSnhEj83dFxADtr9say7uYEn+4ekomryZJryw0FB74/PW3zupwA6xr6YbgvtveOJBx6UESCyPK8S
	ZqgSR5WWY8pguvqIJEKq6UiGvRP6ZCdKBgKdGcS4GafMg0MiX9vXSu0YCHPBOD9WWlT/o4HNSGcch
	/JI+YWCseSYs8NumTxKBveq4Xp/INRsrumSh/uD6/AVj6Q8/ofYe1WIoGk2nskms8qXaIeIADX4Ym
	XcBHrAKVq6xRqzKiUv6iUAn23oVoL2fxF4wkm2+c+1s8dXxcZJsZGG2oQwa93Dqezkha/M1eOCI/q
	5qZkbfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5Q6-003ADb-4x; Mon, 24 Oct 2022 21:55:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5Pv-003ACY-NP; Mon, 24 Oct 2022 21:55:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3D43CB80D69;
	Mon, 24 Oct 2022 21:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866F9C433D6;
	Mon, 24 Oct 2022 21:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666648529;
	bh=oQ9KNEH5p9KGrsnEcH5S1RduBGb6wJ0EGUHoylNIUA0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=owCi5MX6mT/TF8uDWZXk/zB9Mvqn4fHQ+Z09FxiZbMlhfGo/km40JdiQRn+Th/D/h
	 qo2T9XR3Wqhn+6FfAQv3Flhg/LYkRHu+Tjjd3RsVi4/9bgOiUYS9dedx1JEPH8K7+W
	 7Oqu6Et9S70kCC+V2cR/eHwe69kMssr3xbUFZ6432fsDgrk9FfPjyYkdZicN0BVUMa
	 EXfZY9NRnItX/1zYXfzyj8nC4kYB0LXrXC377Av1LnRfYDokrgTNOqRpe3I9SEBsEf
	 2QkV1CUUnJ3GnbpWNXWNhSaMDF401o5mxDxG/xI20wA0k0iS4d3qwTHoq6Q8kukfZt
	 lLoBNP6hs8E0g==
Date: Mon, 24 Oct 2022 14:55:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: kernel test robot <lkp@intel.com>, Russell King
 <rmk+kernel@armlinux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master] BUILD SUCCESS WITH WARNING
 76cf65d1377f733af1e2a55233e3353ffa577f54
Message-ID: <20221024145527.0eff7844@kernel.org>
In-Reply-To: <6356c451.pwLIF+9EvDUrDjTY%lkp@intel.com>
References: <6356c451.pwLIF+9EvDUrDjTY%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_145531_932547_7B734577 
X-CRM114-Status: UNSURE (   7.60  )
X-CRM114-Notice: Please train this message.
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

On Tue, 25 Oct 2022 00:58:57 +0800 kernel test robot wrote:
> drivers/net/phy/phylink.c:588 phylink_validate_mask_caps() warn: variable dereferenced before check 'state' (see line 583)

Hi Russell, I think the warning is semi-legit. Your commit f392a1846489
("net: phylink: provide phylink_validate_mask_caps() helper") added an 
if (state) before defer'ing state but it's already deref'ed higher up
so can't be null.

