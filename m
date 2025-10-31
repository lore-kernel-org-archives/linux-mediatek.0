Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB18ECCFA00
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Oct 2025 08:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v892dTu1HshjcxKFmcHsl+fK4b8Rkvxt1T/VvCW6D8Y=; b=0gkvkQmoNReYljsFjoYuX7J3ky
	GVePUHHK4o+5d8LQ1X04HCD8gbsMqynzUVE2zY9kB59ugSzuMruz31ja/0OcOYGVZaCJHPSPAzD9/
	SUfA0MyadTi5NTMz/19blNfDDTOaSD1y+lsAZOug2pRUvka0qPfNZtWh017cOd/7eONZeoUgQ+Xjw
	UV8rRHf3XJ618Dc56ItV58nuTheR9CAI7LSxb6teIprPv8ZBPytJdL2adi9oImq7Rf5K1wrcXwNlG
	JXSuNQfNNjB1bRpH/TAX849sC3scu4XTEYdASYmynjaMw+U+kK7QKoXHJOqJF4WZ8EZ3R/NLmxj9M
	aZXBWBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkh4-00000005foL-2Agi;
	Fri, 31 Oct 2025 08:41:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkh1-00000005fnn-2vyg
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Oct 2025 08:41:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25D1E4067C;
	Fri, 31 Oct 2025 08:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECEE5C4CEF1;
	Fri, 31 Oct 2025 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761900064;
	bh=F3j39oJbXU3umTSW8/NwYKbpJJNxA+bQF8oyIAUEz/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AhcosB6COhNN71rH1zooDoygyNOurkc49J6U77+07gpGpjrrBErHTw+iNba8ywD8n
	 P3mu8WVGRCqmzKJz5EUgXgBABMlHgdpNtE2OjFz7XQpmLi+/dDAZbrKyYvyXUSbktg
	 xxkYABNhsJ+t4fpabd2N6XB1wAQmpDnxEZwd3MaBUaDpO+f3Pv06FDhVoKZd3Q9a3a
	 VgFouAPQSiUEKOS85otyAEKgzHlg/piLMAb5C4zcfKyyA5l8MBHsJxr/g5mZaexgp4
	 56+I50xYBtWbXjOfFtlt2aoGHcXjPKxAD7lHE3ZnmCTjN6OJ3sDxhkVRl/MDA1gx3r
	 xUZYg6zVvMNWw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vEkh6-00000000330-2YFH;
	Fri, 31 Oct 2025 09:41:12 +0100
Date: Fri, 31 Oct 2025 09:41:12 +0100
From: Johan Hovold <johan@kernel.org>
To: David Airlie <airlied@linux.ie>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [GIT PULL] mediatek drm fixes - 20251028
Message-ID: <aQR2KOvMxghFgQXl@hovoldconsulting.com>
References: <20251028151548.3944-1-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028151548.3944-1-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_014107_891383_B65E5022 
X-CRM114-Status: UNSURE (   8.44  )
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

On Tue, Oct 28, 2025 at 03:15:48PM +0000, Chun-Kuang Hu wrote:

> ----------------------------------------------------------------
> Mediatek DRM Fixes - 20251028
> 
> 1. Fix device use-after-free on unbind
> 
> ----------------------------------------------------------------
> Johan Hovold (1):
>       drm/mediatek: Fix device use-after-free on unbind

Note that this fixes a regression in 6.17-rc4 which have since been
reported to cause boot failures. The offending commit has also been
backported to the stable trees so it would be good to get this one into
6.18-rc4.

Johan

