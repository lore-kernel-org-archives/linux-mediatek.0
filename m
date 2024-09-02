Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC73CD13CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 06:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLT+ZXlJz8SWaaahByoLRZfSQKkmdiE+KQxWWpCGtXw=; b=BoXMClXV3mDPiTSFNToOiQeHvb
	osi2NeK9yCyg7QIdtBJG40XV6AOKK9EirewVDhXBDpPdzghvtuyalaerxxAGQQuSwrJcGRHWgzq+C
	bafUYyQReZneBAEhvoWeTuxnRidVEln2x1T+2OLIobe/ur+XTeF1r/mpNNa10mVf66ApBuENeCbLw
	8ogeU+3sxu1idEFaaGsScoNdzEbawb9QdnbG0SKTdUgfjSKzmCjyAL9E4okzm5RjpwH7VrGFEAeHL
	IClhl64L7fdB+HN4k0WjnxFBMKCfSM/5UFit4KVVLsxFkCV9XCVXGSubAmqvIYL29+rIVY2+zFU6r
	AygtXBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl08i-0000000D5O4-2YOF;
	Mon, 02 Sep 2024 06:02:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl07m-0000000D585-3fCc;
	Mon, 02 Sep 2024 06:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16153A416B6;
	Mon,  2 Sep 2024 06:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4953AC4CEC2;
	Mon,  2 Sep 2024 06:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725256873;
	bh=uFqYDAGst+R76BzrFXSqxQfFeaOgB/jwHSV/x4bw5xE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XcGT8ny+K7EZPFWj7plmSyaw+3DUmYHQrHQM/nEmQbnG+VvCxd3U3HDIZTeX7YiRL
	 1biMvmNuYBWWnQkGh0oHiWSUlCqiK7KZ7mv2ol4roKIvw1j5SP2yZJAPHRBUHL3qRF
	 ShEo26DaXuTOaDOPfo65oFbxkvB50L+QG9bfwOUg=
Date: Mon, 2 Sep 2024 08:01:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yenchia Chen <yenchia.chen@mediatek.com>
Cc: stable@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 5.15 0/1] pm, restore async device resume optimization
Message-ID: <2024090220-uncaring-pretext-4391@gregkh>
References: <20240902031047.9865-1-yenchia.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902031047.9865-1-yenchia.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_230115_000928_3126839F 
X-CRM114-Status: GOOD (  12.77  )
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

On Mon, Sep 02, 2024 at 11:10:44AM +0800, Yenchia Chen wrote:
> From: "yenchia.chen" <yenchia.chen@mediatek.com>
> 
> We have met a deadlock issue on our device when resuming.
> After applying this patch which is picked from mainline, issue solved.
> We'd like to backport to 5.15.y and could you help to review? thanks.
> 
> [ Upstream commit 3e999770ac1c7c31a70685dd5b88e89473509e9c ]

For obvious reasons (and as per the documentation), we can't take
commits that are not also in all newer kernel releases, otherwise you
would have a regression if you moved to a newer kernel, right?

Please submit a series for all affected releases if you wish for a patch
to be applied to the trees.

thanks,

greg k-h

