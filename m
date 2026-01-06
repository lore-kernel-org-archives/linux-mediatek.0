Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A05CEFCE3
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jan 2026 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxLZ7cXYCqtefP/2kqs1Yn+FZp/lqC2bn6GLc6crZxE=; b=ggRn0qO/5ME1Hyl5v96A6+L/vr
	49iBd/PytiQA18PSWdYdi3VdD1cLq/wQlJDwKOTLDaryF/GXD+kYm6P2ZesFU8+6wFUIoGuPCxsdB
	nFJ6zaDQdFf8mC4Ccu+y3jvUr48Y0MdV31mnOyBbW4xINEnHctBK/YVfzGqkEnjmRpXOr6mDuDQ+Y
	q5ZSzJFLXSruQ+YYY/He/xrmQKZzjI3oV3aFzrOJiDuHTN6uj0zTqscdBB4Q56iU/H1KNDzl3kuyr
	SklvgGPHlfl7hjzxd1IjEdbLjWiDtbBf+sHgftl+qjEsIVz0JlpcINuR98/DAmQREYuOsNmL3Hk90
	cLN5mrOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAZl-0000000DY51-31CC;
	Tue, 06 Jan 2026 17:10:33 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAZj-0000000DY3p-2OTS
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jan 2026 17:10:32 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso986213b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jan 2026 09:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767719431; x=1768324231; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zxLZ7cXYCqtefP/2kqs1Yn+FZp/lqC2bn6GLc6crZxE=;
        b=aF1ZYeEEHcw7yF5Wqzng+90ucsACuX54U2G6kiQcsl19Z9MlzA8BhOxl37pJptWwsd
         uMYVBN1JPJjr7uQoTB33hvozdjDp5dzWXFXrcsztNdPrXtwG9R+qp4aL4ZNFHHKYXc9x
         NkF5WqzShhqGWhx5HOywKR5vZWd+TOX0IXf6rgvCgefFWkw5j4X+ts8OWEE8xgg0S72Z
         U7BTKrB7pDXm4tn3SpQjVTPWlGCuGedoRHDAzTsd+BzNoXv+wHVT5D+2ducQgKDeRFdd
         Z/046HU2eiKVJQtd501PvVgjAmCtDyrUqWSnDVMlS4q0IOraKPU2LkAQ15Bjh+W8Ft5/
         mO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767719431; x=1768324231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxLZ7cXYCqtefP/2kqs1Yn+FZp/lqC2bn6GLc6crZxE=;
        b=dF+Qc4ERfS+8q3PpWhJ7VhLV/GNHPyxVfVtejxPeGPsV/cr0Q++xMDv08vqSct0vZC
         MVV2SEV8y8JKxwSPem/ROmKtvbMz98FWIhANZyijadwBcYdwAC2C4QfIZIOMGJIp+M+e
         u200G4LFngwOqZ+kz812nv5OfEtHFgWyucqRqGvH3sAejPVybrBWJsYM3ryVprxT8VWW
         oCpmHvDB60BE0mBx+mw1JfF4HIEbNRG6EQeAnfuAjbvsxGJk/l16pFV1H2j24nkqhavG
         7YRGt6PX7HjDOAXR138EmxzjngRMA+K1bjPOXvPJjpEmC4cYTv4sKY14KgGW4c5VPHaM
         rPiA==
X-Forwarded-Encrypted: i=1; AJvYcCWP6tzmxT3DsF9gl+H+nQ7OmMCZPQRxlmQDnAFt937qBBhG1Ur7DVNlhP5H6w2daxDjJntiHOqCekVZZXe2DA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwH1BBDoblspzpvsdusP6DPflzJd16YaiASaxWvWTRgBdVgDPZ2
	y8UoZpN48lRb87p/i1PL3xJqn1RP7MSfyIw7iV8agwBSnUG70FAefkc8BTHBoPse/sS0PoH3BPP
	QuFj25Ug=
X-Gm-Gg: AY/fxX7iM6KgtUkABxkJpAmgVyIhAerAMbwdT1AkCWNBT/qlsNzaE6wucOS0VEUIAuc
	9G6vo6dDjS9gPpSm/o4GJhhvGIjhoN6nJh+1cjED04LzykBNfErJ8T8nsPiFZu9qfDprzBfaQhE
	3UHTJd63yxbToys4UL7hHlulSyjeK+U+eHb3FG1A6M2ZqqsqvyoyN1hTySK41S3QIHj3Kdp7dHY
	VNY+GHtpJ10+d4ml2cas3iB6Cjf7S2xepZU1Roj/ObeRvj9uv1fsQWKweG24nKx8Y6fUy7aMmhT
	OUPAe/iXcbOIFn4oz6C0Hi2SWaJI5waN/QImrQHBMZpXp7RVSlTMDAuh1USYi2/byTPLbtYf+ws
	CELVNNDfUk8Kb0r6ndWuNAzQ916u0jfaG3k1ca+icuRihpYIRKiKEd/qeOZc/3GZHCzNHepb5eo
	lT0aYDpbTfi5AMDw==
X-Google-Smtp-Source: AGHT+IEdipTkUCIxnS1Bbq+IOp8ao5Nso3cbUVg9+zVhDOJBQ9Eh0Txq53A/Fg3j7H+EdDYyooTgJQ==
X-Received: by 2002:a05:6a20:12d2:b0:366:14af:9bc8 with SMTP id adf61e73a8af0-389823f0d2cmr3089203637.62.1767719430496;
        Tue, 06 Jan 2026 09:10:30 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:da23:dd36:3f11:b647])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cb5352268sm2839268a12.0.2026.01.06.09.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:10:30 -0800 (PST)
Date: Tue, 6 Jan 2026 10:10:27 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <aV1CA1Kf0D6HNVli@p14s>
References: <20251229043146.4102967-1-tzungbi@kernel.org>
 <aVw4QUp6j4vBOrOF@p14s>
 <aVx90sSLgRzSPazF@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVx90sSLgRzSPazF@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_091031_626447_2B52DB5A 
X-CRM114-Status: GOOD (  16.56  )
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

On Tue, Jan 06, 2026 at 03:13:22AM +0000, Tzung-Bi Shih wrote:
> On Mon, Jan 05, 2026 at 03:16:33PM -0700, Mathieu Poirier wrote:
> > On Mon, Dec 29, 2025 at 04:31:46AM +0000, Tzung-Bi Shih wrote:
> > > `scp_ipi_send` acquires `prepare_lock` via `clk_prepare_enable` while
> > > the caller often holds `ec_dev->lock` (e.g., `cros_ec_cmd_xfer`).  The
> > > reverse dependency exists where `clk_prepare` can trigger operations
> > > that eventually take `ec_dev->lock` (e.g., via sysfs/regulator/genpd).
> > 
> > What operation would that be?  Please be specific so that I can trace the code.
> 
> The chain is discovered by lockdep: &ec_dev->lock -> prepare_lock ->
> &genpd->mlock -> ... -> kn->active#2 -> &ec_dev->lock.
> 
> -> #6 (&ec_dev->lock){+.+.}-{3:3}:
>        __mutex_lock_common
>        mutex_lock_nested
>        cros_ec_cmd_xfer
>        cros_ec_cmd_xfer_status
>        cros_usbpd_charger_get_port_status
>        cros_usbpd_charger_get_prop
>        power_supply_get_property
>        power_supply_show_property
>        power_supply_uevent
>        dev_uevent
>        uevent_show
>        dev_attr_show
>        sysfs_kf_seq_show
>        kernfs_seq_show
>        seq_read_iter
>        kernfs_fop_read_iter
>        vfs_read
> -> #5 (kn->active#2){++++}-{0:0}:
>        kernfs_drain
>        __kernfs_remove
>        kernfs_remove_by_name_ns
>        sysfs_remove_file_ns
>        device_del
>        __device_link_del
>        device_links_driver_bound
>        driver_bound
> -> #4 (device_links_lock){+.+.}-{3:3}:
>        __mutex_lock_common
>        mutex_lock_nested
>        device_link_remove
>        _regulator_put
>        regulator_put
>        devm_regulator_release
> ...
> -> #1 (&genpd->mlock){+.+.}-{3:3}:
>        __mutex_lock_common
>        mutex_lock_nested
>        genpd_lock_mtx
>        genpd_runtime_resume
>        __rpm_callback
>        rpm_callback
>        rpm_resume
>        __pm_runtime_resume
>        clk_core_prepare
>        clk_prepare
> -> #0 (prepare_lock){+.+.}-{3:3}:
>        __lock_acquire
>        lock_acquire
>        __mutex_lock_common
>        mutex_lock_nested
>        clk_prepare
>        scp_ipi_send
>        scp_send_ipi
>        mtk_rpmsg_send
>        rpmsg_send
>        cros_ec_pkt_xfer_rpmsg
>

From what I understand, cros_ec_cmd_xfer() gets called and takes @ec_dev->lock.
From there scp_ipi_send() and clk_prepare_enable() are eventually called.  The
latter takes @prepare_lock and proceeds to enable the mechanic that will get the
clock prepared.  The process to enable the clock mechanic, which may happen on
a different CPU, involves calling cros_ec_cmd_xfer() and lockdep complains
because @ec_dev->lock is already held. 
 
> > > Move clock prepare / unprepare operations to remoteproc prepare() /
> > > unprepare() callbacks to break the lock dependency from `ec_dev->lock`
> > > to `prepare_lock`.
> > 
> > With the information presented to me, I don't see how doing that changes
> > anything.  @prepare_lock is simply held for a longer period of time.  
> 
> In prepare() callback, the clock becomes prepared and prepare_lock won't be
> held after that.

If my theory (above) is correct, you are proposing to avoid the condition by
preparing the clock ahead of time before any IPI can take place.  Is this
correct?


