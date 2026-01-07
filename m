Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46B1CFD647
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jan 2026 15:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7ti2ZsSBs6BaW10SxBm3tdhBa1xYNo4bRZH+Kb0/2k=; b=AddWowagrS7GfsZnd56TX7o1PZ
	LtVA3DboC4Yum+H1L74d/qmiScTTQXQhVhNqAAqKrjaaEv9Jb/C4je9A/LHHVCAjzoMnzR5pwcs+f
	2nJhwAllz1DRzgbIsbvm5uOeTmR1yAmrdFaF1kQErNYD7uglVy3tMj8BkagRG7LLte+AwMqvx+xYD
	uAW9VZBKJtS8Y3J3JsBEtKnB5mOyw6Hch46sxeloM2uypaLCFp/JEgPoOrrJcTjGc1wIHycyzKsl1
	w136OsEjTV9t802/eZWu/Oa12RKKzzX5DdXj+w4UXr2D8JOkRYeGY7RvPG716IFAuZfLd4sBFM0sN
	gN1QC0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVTi-0000000FAvK-1sC5;
	Wed, 07 Jan 2026 15:29:42 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVTf-0000000FAuP-3Yny
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jan 2026 15:29:41 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7b75e366866so685941b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 07:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767799778; x=1768404578; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M7ti2ZsSBs6BaW10SxBm3tdhBa1xYNo4bRZH+Kb0/2k=;
        b=WexyBAjcuOCK1JyI7S/v7cJpPZn8djmXTKNeBbpt25wlwsKwerk+VKJMNTXWIq7ZpK
         DxhLKTfcjntGlGGqpwh0Wp8ub7tMQSP/mH/nRIpOKNL3gGI74fwYWBlrw+VeIAVMaIOB
         U+0DVOwVvbkwrOB3rihiwVsOCmctvfRIQPxyyhW20JHQYddyaM3GNlq2P3ja1UIk6+XG
         qk4E5LQAF333+IdLya3PGnf7SIbMNG2iG0rE1DtXFp2TFKSHGAXd/+jxkQchEFZwc8zy
         BjrzBHml1nEiwlXYjNQextz4PF8Fu39RXsXUJ1MwtV87Ye4vd+Xlx0+TLdOqJPDZqq8Z
         or+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799778; x=1768404578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7ti2ZsSBs6BaW10SxBm3tdhBa1xYNo4bRZH+Kb0/2k=;
        b=mlz5hAgVLAkM90ErGaFa/2nEQcLUaqQ9LWX5CADTMZGcqThSjEQlGZvfoWWz8Ap1mh
         mcHgep81kZl2KxJPDhJS1+XF6Ewdhl2j/mt3Vc894u1IBC80jaqgzgqqHOCSn5z6Kt30
         EfxvV56B0w36cpM9a6F+ORyfl/ITOcieRyIezpF9bBrjeV0tgJ+hfXbRHGweJAyi0BrI
         N8tiRqyNXCOchhx02sfhQor6AG8q1hJgaKYMuRimAf283/jDF5S+0NXf0l9lff+NKLb/
         7plZZ/rY2BB5acjcWxbnTYRMmuIwgG5gt2pM8eBRualGs71yiImk1WDsFOIfLyOqL+ki
         cIjg==
X-Forwarded-Encrypted: i=1; AJvYcCULw6LTHjpBV+MPhbMcLcM+pqEcx6mF2Qg8zHfTX1wVJouJ0aiQrsnD1p5eT4Vhj+cK1MEAKx0yogJRb/REKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmWLPPw2036mRcjLbS5lK85VnAK1U+dHkzc2QRaLszyXQG0A1u
	AOUZ0bAuKVfY5zXHxL0vAi2S5UjwCPrA2RkKTWh8BnWlJJIn/sof7vGYxw4C6SfzlRI=
X-Gm-Gg: AY/fxX6slxCRGoeW5Enr8drTTUtwzrYLMkmf2r8gHanrhGgU14JuL09y7ca9GknuQQS
	9vLiyugj4p2x4wrgc6V+Id/HeSKowTzZaxxRPeXXX+td/cRUDQGAqR/zhE+KkwrTRpulPommWM4
	9GSFIO+qhWvnydgdq7OU8TuPruqPuJMoXlhnj5jsYD5kCQSkYrip1gvtzPPOHYXGeVL1H3gAQdi
	Sk4N5E2uotm1Smd8bZA9US4PlUL8p+Ls9xyxDtvcBGEeacdI5RGGup4tRWD4AhfrrdFhM3M4ILa
	I7+YavLZEq3iUvAG/vpmq9ba4udSFiBDy2oRCSWe1oXGgicQ4633Tak+FE+I+K50h71AtPAeA29
	oAB4+UJCoMu79ggxiof7cBrKhBSZveV3lgj4e3EQQGQMT1fdBA1MtcknO+BdzzV5+nyoPTxQn5s
	+8BcdDUJ5FeoxppA==
X-Google-Smtp-Source: AGHT+IElKLdFn879OtAvmFvwXJ1ZamVYHpzEPzVJ1OffNR29Z6BAVmJm3WV6d7OfkFXx84SFGEf1aQ==
X-Received: by 2002:a05:6a00:6c82:b0:7e8:43f5:bd4b with SMTP id d2e1a72fcca58-81b7fbcbd0amr2490638b3a.55.1767799778184;
        Wed, 07 Jan 2026 07:29:38 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9510:cc09:7589:5527])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52fc9bdsm5313254b3a.32.2026.01.07.07.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:29:37 -0800 (PST)
Date: Wed, 7 Jan 2026 08:29:35 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Break lock dependency to
 `prepare_lock`
Message-ID: <aV57397Ie41nww9W@p14s>
References: <20251229043146.4102967-1-tzungbi@kernel.org>
 <aVw4QUp6j4vBOrOF@p14s>
 <aVx90sSLgRzSPazF@google.com>
 <aV1CA1Kf0D6HNVli@p14s>
 <aV3DOTpoTr5RoDL2@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV3DOTpoTr5RoDL2@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_072939_894858_E704435A 
X-CRM114-Status: GOOD (  22.25  )
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

On Wed, Jan 07, 2026 at 02:21:45AM +0000, Tzung-Bi Shih wrote:
> On Tue, Jan 06, 2026 at 10:10:27AM -0700, Mathieu Poirier wrote:
> > On Tue, Jan 06, 2026 at 03:13:22AM +0000, Tzung-Bi Shih wrote:
> > > On Mon, Jan 05, 2026 at 03:16:33PM -0700, Mathieu Poirier wrote:
> > > > On Mon, Dec 29, 2025 at 04:31:46AM +0000, Tzung-Bi Shih wrote:
> > > > > `scp_ipi_send` acquires `prepare_lock` via `clk_prepare_enable` while
> > > > > the caller often holds `ec_dev->lock` (e.g., `cros_ec_cmd_xfer`).  The
> > > > > reverse dependency exists where `clk_prepare` can trigger operations
> > > > > that eventually take `ec_dev->lock` (e.g., via sysfs/regulator/genpd).
> > > > 
> > > > What operation would that be?  Please be specific so that I can trace the code.
> > > 
> > > The chain is discovered by lockdep: &ec_dev->lock -> prepare_lock ->
> > > &genpd->mlock -> ... -> kn->active#2 -> &ec_dev->lock.
> > > 
> > > -> #6 (&ec_dev->lock){+.+.}-{3:3}:
> > >        __mutex_lock_common
> > >        mutex_lock_nested
> > >        cros_ec_cmd_xfer
> > >        cros_ec_cmd_xfer_status
> > >        cros_usbpd_charger_get_port_status
> > >        cros_usbpd_charger_get_prop
> > >        power_supply_get_property
> > >        power_supply_show_property
> > >        power_supply_uevent
> > >        dev_uevent
> > >        uevent_show
> > >        dev_attr_show
> > >        sysfs_kf_seq_show
> > >        kernfs_seq_show
> > >        seq_read_iter
> > >        kernfs_fop_read_iter
> > >        vfs_read
> > > -> #5 (kn->active#2){++++}-{0:0}:
> > >        kernfs_drain
> > >        __kernfs_remove
> > >        kernfs_remove_by_name_ns
> > >        sysfs_remove_file_ns
> > >        device_del
> > >        __device_link_del
> > >        device_links_driver_bound
> > >        driver_bound
> > > -> #4 (device_links_lock){+.+.}-{3:3}:
> > >        __mutex_lock_common
> > >        mutex_lock_nested
> > >        device_link_remove
> > >        _regulator_put
> > >        regulator_put
> > >        devm_regulator_release
> > > ...
> > > -> #1 (&genpd->mlock){+.+.}-{3:3}:
> > >        __mutex_lock_common
> > >        mutex_lock_nested
> > >        genpd_lock_mtx
> > >        genpd_runtime_resume
> > >        __rpm_callback
> > >        rpm_callback
> > >        rpm_resume
> > >        __pm_runtime_resume
> > >        clk_core_prepare
> > >        clk_prepare
> > > -> #0 (prepare_lock){+.+.}-{3:3}:
> > >        __lock_acquire
> > >        lock_acquire
> > >        __mutex_lock_common
> > >        mutex_lock_nested
> > >        clk_prepare
> > >        scp_ipi_send
> > >        scp_send_ipi
> > >        mtk_rpmsg_send
> > >        rpmsg_send
> > >        cros_ec_pkt_xfer_rpmsg
> > >
> > 
> > From what I understand, cros_ec_cmd_xfer() gets called and takes @ec_dev->lock.
> > From there scp_ipi_send() and clk_prepare_enable() are eventually called.  The
> > latter takes @prepare_lock and proceeds to enable the mechanic that will get the
> > clock prepared.  The process to enable the clock mechanic, which may happen on
> > a different CPU, involves calling cros_ec_cmd_xfer() and lockdep complains
> > because @ec_dev->lock is already held. 
> >  
> > > > > Move clock prepare / unprepare operations to remoteproc prepare() /
> > > > > unprepare() callbacks to break the lock dependency from `ec_dev->lock`
> > > > > to `prepare_lock`.
> > > > 
> > > > With the information presented to me, I don't see how doing that changes
> > > > anything.  @prepare_lock is simply held for a longer period of time.  
> > > 
> > > In prepare() callback, the clock becomes prepared and prepare_lock won't be
> > > held after that.
> > 
> > If my theory (above) is correct, you are proposing to avoid the condition by
> > preparing the clock ahead of time before any IPI can take place.  Is this
> > correct?
> 
> Correct, so that it doesn't need to prepare the clock (i.e., acquire the
> @prepare_lock) when @ec_dev->lock is held.

Is there anyone else that can review and test this patch?


