Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B3FC021AD
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2025 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KZBDJtxcaW+EbK7xr8lVciQc5WFsH1M+cUzHurUjtms=; b=HXLQXeSDGEuz48VuCeg1Zy/M3n
	4Oo5rL3d1UYt/OAdgcLtMnWxLlXaICS8SduP3abDm6oKfWcyO/m+ZOGezsg2olrDis1usf9G5i3Rl
	c+RF9p8I6XZw8nHvSwMut1HQA4AIzIw2eJnI74bjU2PiBcvZc7wVw+fgDZ6za+1QyKIqJkZ8lS0lD
	Vh5OfSX1y/navBXq1O/zLO9O/bqFI35EhOA4q/ir45WdBvBKKblpktvhbdRT9KTe4V8uPxLheUQhZ
	ywhT++Zlez4jG4qxj6de77vx/3FhhSlsEpiNExUEevNPy8AsuGiw5bu+FH35jIbA3UIdAy+OqMJdb
	SbiSLwrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkPyj-00000008quX-0bZ5;
	Tue, 18 Feb 2025 15:57:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkPyK-00000008qsQ-2hiK;
	Tue, 18 Feb 2025 15:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KZBDJtxcaW+EbK7xr8lVciQc5WFsH1M+cUzHurUjtms=; b=TPgp3EXJIxknNdQRFhGKtjsSGD
	zh4oCSSNqtHdPQMgdkyQvRpsrKvYx+FfAcbjG1SEjN46nlQGNh1VzvYSPlgseTPRMjdLM/i9cpMj9
	fLr8mhI8SxYDvXtugtqKsWdgSXeq87xwkVhYvmajXXxibojsAq/8Wk39wKqtPz3T4beE9QXZafPNF
	soUyX6Y40/lic0qMOCa+I1W6Oi9kgpSzpKz0zAjPH5iiEZvMycxwI/2JnlVvGxZaUgUy6GfjlffP5
	GYZGJ2RSLoTewgKGctKEHMR4CVHcP5yxhFQXwUwiw1GhFZxNPyh87MOEhHyi/DyOlzN1euG+K476r
	oh59WZhw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37344)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tkPy8-0002Wi-1o;
	Tue, 18 Feb 2025 15:57:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tkPy4-0007NT-0f;
	Tue, 18 Feb 2025 15:57:04 +0000
Date: Tue, 18 Feb 2025 15:57:04 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 06/25] drm/armada: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <Z7St0O3A_mXEYK49@shell.armlinux.org.uk>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218142542.438557-7-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_075720_679148_1DFD266F 
X-CRM114-Status: UNSURE (   8.17  )
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

On Tue, Feb 18, 2025 at 03:23:29PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. No alignment required.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Russell King <linux@armlinux.org.uk>

armada_pitch() does have some special alignment (it aligns the pitch to
128 bytes). I've no idea what drm_mode_size_dumb() does. Can you check
whether it does the same please?

If it doesn't, then this patch is incorrect.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

