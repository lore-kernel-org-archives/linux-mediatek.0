Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6F9EEB56E
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 21:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+i6wwSf5PrmdMpv5R0q+XxOpMZWb1O1vbTh7W/T7iY=; b=UnBJJjluXbL19XCflS9Fd6/p6i
	i/GZnuWuCk9fc0GNlwicXP2ygZnm4fozixIELr+f2Ot9d28Y6WfCymBA3cVfO1Fi4meUYEh3CkehU
	zk1lBZYDoZYSMDAthYR91olREF30OCn0PrbQcDI6MP0SOi3c+uAbrtYM8rIgs9zb1M9+7WObxmtBO
	xfpZLYilLv4sfa1nytLiK/VWVeXGvfuyDr0tTD1x4/ZiLJHOxd9z34KBECN1czBdq+KEz0nXcm1mA
	PY2Rqh2m7DirO2l/Q/uBFHMheZO+ZOwQxFPZiqzz8RKviT2tNH/7RGFQ7n5/fqU+IWrax0asIcCn3
	Jv7gD/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qej5E-00EWAy-2x;
	Fri, 08 Sep 2023 21:32:08 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qej59-00EW7Q-0M;
	Fri, 08 Sep 2023 21:32:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 71B72CE1C9D;
	Fri,  8 Sep 2023 21:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F758C433C7;
	Fri,  8 Sep 2023 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694208718;
	bh=jnZW3kJ1q2GcV2pxAvLRxz+0IUuoJxM+MtHeCLvaV3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rL/hXl1JmyCN2+NX3XFRjO3IBjzj3gm/vyTf/yQM/ms1fYHZLLheiBdkAscyPD4ig
	 xEJBQ/sHZdVG/iM0p8OjYq7bcd79OWbtESi4cnpza8CsO0AlxstTVZg+crAliB0M+u
	 sMtzHFoNhDRydKXF6ghbQDeG3lQZH7cQseD/hGy4=
Date: Fri, 8 Sep 2023 22:31:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
	quic_jjohnson@quicinc.com, nbd@nbd.name, lorenzo@kernel.org,
	ryder.lee@mediatek.com, matthias.bgg@gmail.com, kuba@kernel.org,
	srini.raju@purelifi.com, stf_xl@wp.pl, helmut.schaa@googlemail.com,
	pkshih@realtek.com, corentin.chary@gmail.com, hdegoede@redhat.com,
	markgross@kernel.org, johannes.berg@intel.com,
	alexander@wetzel-home.de, error27@gmail.com,
	szymon.heidrich@gmail.com, gustavoars@kernel.org, lynxis@fe80.eu,
	daniel@makrotopia.org, arnd@arndb.de, shayne.chen@mediatek.com,
	keescook@chromium.org, tglx@linutronix.de, pabeni@redhat.com,
	rostedt@goodmis.org, jacob.e.keller@intel.com,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	acpi4asus-user@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 6.5 43/45] Fix nomenclature for USB and PCI
 wireless devices
Message-ID: <2023090838-slurp-tilt-c7c4@gregkh>
References: <20230908181327.3459042-1-sashal@kernel.org>
 <20230908181327.3459042-43-sashal@kernel.org>
 <0d2ddf90-2334-4d0c-9f63-018c150e06a9@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d2ddf90-2334-4d0c-9f63-018c150e06a9@rowland.harvard.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_143203_519861_1CF5A6F8 
X-CRM114-Status: GOOD (  18.60  )
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

On Fri, Sep 08, 2023 at 03:12:26PM -0400, Alan Stern wrote:
> On Fri, Sep 08, 2023 at 02:13:24PM -0400, Sasha Levin wrote:
> > From: Alan Stern <stern@rowland.harvard.edu>
> > 
> > [ Upstream commit 5d7cf67f72ae34d38e090bdfa673da4aefe4048e ]
> > 
> > A mouse that uses a USB connection is called a "USB mouse" device (or
> > "USB mouse" for short), not a "mouse USB" device.  By analogy, a WiFi
> > adapter that connects to the host computer via USB is a "USB wireless"
> > device, not a "wireless USB" device.  (The latter term more properly
> > refers to a defunct Wireless USB specification, which described a
> > technology for sending USB protocol messages over an ultra wideband
> > radio link.)
> > 
> > Similarly for a WiFi adapter card that plugs into a PCIe slot: It is a
> > "PCIe wireless" device, not a "wireless PCIe" device.
> > 
> > Rephrase the text in the kernel source where the word ordering is
> > wrong.
> > 
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Kalle Valo <kvalo@kernel.org>
> > Link: https://lore.kernel.org/r/57da7c80-0e48-41b5-8427-884a02648f55@rowland.harvard.edu
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> 
> Is there any real reason to apply this commit to the -stable kernels?
> I did not mark it that way when it was submitted, and it doesn't fix
> any bugs.  In fact, aside from updating some module and device
> description strings, all it does is change a bunch of comments.
> 
> Does that really fall under the -stable rules for acceptance?

Not really, this is just documentation, it should be dropped from the
autosel queues.

thanks,

greg k-h

