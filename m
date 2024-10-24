Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECA1D0BB6B
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2024 07:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4aJMYOV4mQD7ik/qBlN1zo6hGHoaOy1n10tn397mrY=; b=WUQKFVCuO9MlMxUxiMmE1DyNmc
	0XfT8JXpXpEfVXj8KsUE/gHArs2+MDKNFtyrb9ce5iZ0tPo+NHpdOgf3H3abA586iika5MvNojfGn
	6zvWxo5++4eO8HoM40UlGTXC5sN6bw+N+W7Tpl2bWFScgc711Q63pFBH7Ftk2A/BgnIUrk+BBtEuh
	DjyBL9xX+XSZTRf0eclKscwRv7i5xdfaSvNtK5/BTwb8WuwOrxbd32b8uDEyaO1CXJO/f4m9oorhA
	X1BLv8WnAHbGPZKWsYT6MVxEutXTS6X85OgjlRXjzQex2fkxgnO2QY3XgpPwYel63ziZQTsj0LwI4
	nLiJjryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3s4K-0000000H3fN-2per;
	Thu, 24 Oct 2024 07:15:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rw1-0000000H1c4-3F49;
	Thu, 24 Oct 2024 07:07:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C978A450D4;
	Thu, 24 Oct 2024 07:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AE1C4CEC7;
	Thu, 24 Oct 2024 07:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729753624;
	bh=C569kiRrg8EBzvrVBxsDovVURiA3bvbD+xQMy8MTaO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vcR+ON1zIdm5O0maAVHBiW/e9Z+mDFWtdnlURA7545m/v7ld0MzrrHrbftr60A8UM
	 cjD/QBovrRyxNdG8dH117G4LKWY5cxmnP2FbDJKxlXLsajOk3QcxaeixwRbG3SlP5N
	 Cj8fmrhLFnefYYpBpd1lf0IK3VV6qe4wobNUPqdU=
Date: Thu, 24 Oct 2024 09:06:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Saravana Kannan <saravanak@google.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] drivers: core: fw_devlink: Make the error message a
 bit more useful
Message-ID: <2024102446-robin-outcast-841b@gregkh>
References: <20241024061347.1771063-1-saravanak@google.com>
 <20241024061347.1771063-4-saravanak@google.com>
 <CAGETcx_0gqbo5Xf9mZGrBZszZsmKBdqRreb-=O_PvOR_2Yc5Cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx_0gqbo5Xf9mZGrBZszZsmKBdqRreb-=O_PvOR_2Yc5Cw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_000705_924830_72883926 
X-CRM114-Status: UNSURE (   7.50  )
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

On Wed, Oct 23, 2024 at 11:16:26PM -0700, Saravana Kannan wrote:
> Greg,
> 
> Can you fix up the commit subject prefix to "driver core: fw_devlink:"
> please? Don't want to send v2 just for that.

Will do, thanks!

