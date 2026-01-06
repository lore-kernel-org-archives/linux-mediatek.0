Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EC3CD0431
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jan 2026 03:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ITJJ/sgZE8zrLfn2A81wkRGjUFexK1uoGH/DO3330k=; b=3UFmp+TyxGbql/rA7hsL97fH9j
	uWx7F3/WY8yrQIqHeYyhZR9W0WPUhW/eCariDMF6CuG8f8Vfkkyxgsa1JI7JuD421cMwFbmX2kP8D
	NTDgMkT3NKETghqCQLBevEvOahQv/t3yyfsuHFNTpZAr91zq7ddJxNDY/plpsQhuoIB+LUvglkc/J
	CSVgx1/0Gj6oWEWJ/NG124ogonkJuGG3GEPSkXQ2vsLKsivxWa1P0ucjAnHZRJCeECylAM7AC9rT6
	HTqIXGJl/jsJUJd/SalIJ9erwcDRq4dGq4p1G8QQIC16U0t31EVeI0ZLXmdNXxbe8fRCCO10nHHvy
	Q7vMO0Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxVh-0000000CN39-2JKC;
	Tue, 06 Jan 2026 03:13:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxVf-0000000CN33-15OG
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jan 2026 03:13:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 549B060142;
	Tue,  6 Jan 2026 03:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E48C116D0;
	Tue,  6 Jan 2026 03:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767669206;
	bh=dUFC7s03oGrbD46I+PtuWnS7TaJlTp9a/zaeUuuNCV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=teBxi27/aDx6Fys+e2xyg0RkK5bQ/M02t610JSDZ3s1VGzarl6p7aIn9bCXPGIfFg
	 uktt4F1DlUVWXBgO+G5oReuTez0TNBmP479R+x+wv/mO8Oy8GNLckCrj/fCyQhjGy2
	 FHw+LVMatp48339kNmoSkKScaBxc/cPaeZ1zHujhXCn3jxhO/UNNKqk/L58ACSbolK
	 qlT9WA2AjYgbnixNApQ46Dvtle05gNxKRkfcdQoDgp89Dif/nf6UhaRE3ypvcut5eq
	 XZRD2JkIQgZMXKr4qyVAziE0e5NBaewuZpcdTFWJqj5zlvZZ6unIPbd8N+QJmQLKGn
	 +7iJBe6vmjHcw==
Date: Tue, 6 Jan 2026 03:13:22 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <aVx90sSLgRzSPazF@google.com>
References: <20251229043146.4102967-1-tzungbi@kernel.org>
 <aVw4QUp6j4vBOrOF@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVw4QUp6j4vBOrOF@p14s>
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

On Mon, Jan 05, 2026 at 03:16:33PM -0700, Mathieu Poirier wrote:
> On Mon, Dec 29, 2025 at 04:31:46AM +0000, Tzung-Bi Shih wrote:
> > `scp_ipi_send` acquires `prepare_lock` via `clk_prepare_enable` while
> > the caller often holds `ec_dev->lock` (e.g., `cros_ec_cmd_xfer`).  The
> > reverse dependency exists where `clk_prepare` can trigger operations
> > that eventually take `ec_dev->lock` (e.g., via sysfs/regulator/genpd).
> 
> What operation would that be?  Please be specific so that I can trace the code.

The chain is discovered by lockdep: &ec_dev->lock -> prepare_lock ->
&genpd->mlock -> ... -> kn->active#2 -> &ec_dev->lock.

-> #6 (&ec_dev->lock){+.+.}-{3:3}:
       __mutex_lock_common
       mutex_lock_nested
       cros_ec_cmd_xfer
       cros_ec_cmd_xfer_status
       cros_usbpd_charger_get_port_status
       cros_usbpd_charger_get_prop
       power_supply_get_property
       power_supply_show_property
       power_supply_uevent
       dev_uevent
       uevent_show
       dev_attr_show
       sysfs_kf_seq_show
       kernfs_seq_show
       seq_read_iter
       kernfs_fop_read_iter
       vfs_read
-> #5 (kn->active#2){++++}-{0:0}:
       kernfs_drain
       __kernfs_remove
       kernfs_remove_by_name_ns
       sysfs_remove_file_ns
       device_del
       __device_link_del
       device_links_driver_bound
       driver_bound
-> #4 (device_links_lock){+.+.}-{3:3}:
       __mutex_lock_common
       mutex_lock_nested
       device_link_remove
       _regulator_put
       regulator_put
       devm_regulator_release
...
-> #1 (&genpd->mlock){+.+.}-{3:3}:
       __mutex_lock_common
       mutex_lock_nested
       genpd_lock_mtx
       genpd_runtime_resume
       __rpm_callback
       rpm_callback
       rpm_resume
       __pm_runtime_resume
       clk_core_prepare
       clk_prepare
-> #0 (prepare_lock){+.+.}-{3:3}:
       __lock_acquire
       lock_acquire
       __mutex_lock_common
       mutex_lock_nested
       clk_prepare
       scp_ipi_send
       scp_send_ipi
       mtk_rpmsg_send
       rpmsg_send
       cros_ec_pkt_xfer_rpmsg

> > Move clock prepare / unprepare operations to remoteproc prepare() /
> > unprepare() callbacks to break the lock dependency from `ec_dev->lock`
> > to `prepare_lock`.
> 
> With the information presented to me, I don't see how doing that changes
> anything.  @prepare_lock is simply held for a longer period of time.  

In prepare() callback, the clock becomes prepared and prepare_lock won't be
held after that.

