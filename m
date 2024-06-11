Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C09C27C65
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 17:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qjfn/Os7UgfKHW17xTm6YSwP+QP5TzFsj58ih+oI6+c=; b=NceRhtfdTWV3QXULD0xLTfrGbq
	6dUgV0D2tDU04pzyQ1ckCw3dNJQxqO9Ts7XSKGUkkBlT72DepDJHZtiTHnSiPsm5h0gzLZcCwK51f
	K+QgTsayU/J9bduJt3RLd9pkZDicRt1p/0OmOqIZkUWb/4WMeprIFr566qScqfV6MUlG4eJOfqyVf
	LBYIkMXfHQm49NfpqOBKyZj2FD53Blx1DwdJzCS5sHR9xtBwEq9wD4XNfguQ7E2CJxURoHgfJyMvJ
	m6ThJFkfL6Elg9zX07BA/ZeNKU+1CufYjEpGnZwBl+ghlxgBrEHCu5E+R+s6rxf+AFdjYuFQ0ck/s
	6zbQkXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH5Nf-00000009gRQ-0l1O;
	Tue, 11 Jun 2024 17:33:59 +0000
Received: from mailrelay4-1.pub.mailoutpod3-cph3.one.com ([2a02:2350:5:423::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH5NX-00000009gPP-0aHq
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Jun 2024 17:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=Qjfn/Os7UgfKHW17xTm6YSwP+QP5TzFsj58ih+oI6+c=;
	b=dyqmxkNkGg9/QlJcKyB6ftUdEgNI3NWlhk+2DocnZ3HlO16lX02hdM0o9Ic3qiMAuEWNykvlo78wG
	 dJ3kp6NKQtH6ieukQdnObiZj3/RU2R7q06iu2xjjqPzhEem0hwSxn1WAEHVPd6mTo+6k7XbNagXFZy
	 lCVWpQtUMjt91IABy1h7angSzYG2/uk5Yr1ogsBPOKCGkxuksc48dZHnF5K4mIY3XnChNhzMjbSB7W
	 7n32TNan7Mn+FZ63kywhoh4bVDXsQzp0zrRZgsV4RFIPiw5hIfzJnmB9Kk0EuBtUm1hDyqhlSZTNUh
	 cgvYVy4QB45fGhPIcXB1DC4R4pKmCNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=Qjfn/Os7UgfKHW17xTm6YSwP+QP5TzFsj58ih+oI6+c=;
	b=Ml5lK8JlfWIKgZ/vEkSqxIxEckVoH7Ww7zv+SEaAuWiMxLa9yUTJ6PWo8tRE2gxUPPQnvPJryScdS
	 /spIuf8Bw==
X-HalOne-ID: bd6439f5-2818-11ef-bfeb-591fce59e039
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net [2.105.16.150])
	by mailrelay4.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id bd6439f5-2818-11ef-bfeb-591fce59e039;
	Tue, 11 Jun 2024 17:33:41 +0000 (UTC)
Date: Tue, 11 Jun 2024 19:33:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	dri-devel@lists.freedesktop.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
	David Airlie <airlied@linux.ie>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 0/2] drm bridge: drop drm_bridge_chain_mode_fixup.
Message-ID: <20240611173339.GA545417@ravnborg.org>
References: <20240531-bridge_chain_mode-v1-0-8b49e36c5dd3@ravnborg.org>
 <171802398950.436486.1468849081814066761.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171802398950.436486.1468849081814066761.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_103352_181246_1FDFB495 
X-CRM114-Status: GOOD (  13.02  )
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

Hi Robert, 
On Mon, Jun 10, 2024 at 02:53:09PM +0200, Robert Foss wrote:
> On Fri, 31 May 2024 22:37:44 +0200, Sam Ravnborg wrote:
> > I had a few bridge related patches in an old branch.
> > 
> > They were last posted here almost one year ago:
> > https://lore.kernel.org/dri-devel/20220717174454.46616-1-sam@ravnborg.org/
> > 
> > The following two patches gets rid of drm_bridge_chain_mode_fixup.
> > The patches was already rb / ab - but due to the age a repost is
> > due before applying the patches.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/2] drm/mediatek: Drop chain_mode_fixup call in mode_valid()
>       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ac4be1e50165
> [2/2] drm/bridge: Drop drm_bridge_chain_mode_fixup
>       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1f0204954583
> 
> 
> 
> Rob

Thanks!

Next step will be to address use of other deprecated operations
in drm_bridge_funcs.

	Sam

