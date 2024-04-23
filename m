Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D519EC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PoZeq6WcMiA51J+rv15DHhi85i73xIx4cQAhZD3lUPo=; b=Tg+PIsoVRN/Axra7a2N2wCMFVB
	9Cq1X1yvwZ0AhwHaV506kb2EYv/ntfilxBRS5xf5vuS6EB7lnCqc+Yk57Fqqd0n/iUPBFvOb24Tn+
	MIWh808O6Zc3J4w/KcmMRII6h3xV1aM7Lf0aG7Nv8LhrQM51AGAOEqGv9xSStDqzVujgWEXt/52T+
	Kc8QtSFLf2tcg73XD/iVKYwb5vERSI0iNbI9p+LVcyNU1I5EjrOpK9JWKQ0gk+2UU3wcXPFRPpmTp
	2Y6fuxRRia4lFm9PWRNA01Y21NjE0zOgPhdu06vQZo1XHKNerQXUPk6xrWztbnjZVto9VenZuD+Br
	DZaPlrlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCsD-0000000GkKP-1Lvz;
	Tue, 23 Apr 2024 09:55:37 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzCs9-0000000GkIx-2VMl
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 09:55:35 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-516d2b9cd69so6619505e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Apr 2024 02:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713866130; x=1714470930; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PoZeq6WcMiA51J+rv15DHhi85i73xIx4cQAhZD3lUPo=;
        b=w0lcO7GfGO7MafgyR5UwuNc9H28X9nyotKLAcOnBiNCQE6DWNquAoepiY3XSnRyYua
         DFRnS6AwyfxfUtoBrFyouS8gU3XpODO0Y5T+FubhpJfOO9VnWbbBOeXb7o1r/vR/KLR/
         mRol/iCUSjeqvBK8br9tEzJx5JF9QGHaQJeFKrVukaIE5RLqdGyVYqiQqtjIN8Lk9jbT
         26TWKqfUXyGjPn6brgbKLmOPVXN60ISX/rXswvhJNvBYRDZYIVYOyMzYmd8ur6+owKR2
         xPUU2zTJH2wWFCalgsFUygweaMPxxAgHWve3zVEOaxxj/0SdJGprQ94jl4PVAqomPqAG
         nUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713866130; x=1714470930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PoZeq6WcMiA51J+rv15DHhi85i73xIx4cQAhZD3lUPo=;
        b=OfAjzhS7PXKpaUGUGAhqvVbv2RXgpIH/0YyPE+ClRZRd1jvPFUG8rga2/tUQeprXRL
         lTBPbQjgdLBJkPffE3DDyOHif02so31/0vo+ipCLgx/O9AetL6pEa216KtHBi6Aub046
         h6DQTIHXefXzOPxBbwKhRM/7ZQPeJpbqm9u4X418kKwjGADBcLjzqcBdd8P0PyvCqphJ
         4h9dveoeddK+YFk4DC+2AP1Q4ggfHtKnjcJtjLi/RoQqQTxwfnbqhxR6ktvqf54t2Osd
         P+jxzAQZtU0g5+VzxjJfdEDui/oIUJTh9QGe0w3mkLVr4InHEySR8V3NLAGzaTohc73X
         mFvw==
X-Forwarded-Encrypted: i=1; AJvYcCWoQYro3RmVPIOCrPSndBSXrBwAqOsgEfWChRNZXN1lxES2CSG08nIginSEpxF7lzXSlokvuiv4mTNiC8FE8vKihjUWac665l+s9nUvxs6PM9Z0
X-Gm-Message-State: AOJu0YwJKo87e6NVpi6ok9K8NcZFrLz+UdMMoq0/+KaZ7KLXJyb0BJ+r
	nZTImeyAQyxsJGIKioCsVPkxkuele6RIUohIs5+hYDdgNT8x5zPlZ8/iXPzLC2s=
X-Google-Smtp-Source: AGHT+IE2be/A2B9Zfosf92aNBL2ISTmwauZ9dpIkfUZzfkmeDva07wFk+gPwquGCL+lgiJ80Cvxjig==
X-Received: by 2002:ac2:5e75:0:b0:519:5df9:d945 with SMTP id a21-20020ac25e75000000b005195df9d945mr7080951lfr.4.1713866129675;
        Tue, 23 Apr 2024 02:55:29 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id i9-20020a170906090900b00a55b05c4598sm2829865ejd.133.2024.04.23.02.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 02:55:28 -0700 (PDT)
Date: Tue, 23 Apr 2024 12:55:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 23/35] media: dvb-frontends: tda10048: Use the right div
Message-ID: <9ba7f4e6-2b8b-44a3-9cac-9ed6e50f1700@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org>
 <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
 <7a8d403b-8baf-4eff-8f9c-69cdcb8b2180@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a8d403b-8baf-4eff-8f9c-69cdcb8b2180@moroto.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_025533_654446_5EA6898D 
X-CRM114-Status: UNSURE (   7.31  )
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

Btw, here is the output from my check (based on linux next from a few
days ago).  There are some false positives because Smatch parses
__pow10() incorrectly etc but it's mostly correct.

regards,
dan carpenter

drivers/mtd/spi-nor/core.c:2896 spi_nor_late_init_params() warn: unnecessary div64_u64(): divisor = '2-255'
drivers/mtd/spi-nor/core.c:3409 spi_nor_set_mtd_eraseregions() warn: unnecessary div64_u64(): divisor = '1-u32max'
drivers/hwmon/occ/common.c:467 occ_get_powr_avg() warn: unnecessary div64_u64(): divisor = '1-u32max'
drivers/hwmon/occ/common.c:702 occ_store_caps_user() warn: unnecessary div64_u64(): divisor = '1000000'
drivers/hwmon/scmi-hwmon.c:67 scmi_hwmon_scale() warn: unnecessary div64_u64(): divisor = '1,10'
drivers/infiniband/hw/cxgb4/device.c:160 wr_log_show() warn: unnecessary div64_u64(): divisor = '1000'
drivers/infiniband/hw/cxgb4/device.c:161 wr_log_show() warn: unnecessary div64_u64(): divisor = '1000'
drivers/clk/clk-versaclock7.c:743 vc7_get_apll_rate() warn: unnecessary div64_u64(): divisor = '2-31'
drivers/clk/clk-versaclock7.c:794 vc7_calc_fod_1st_stage_rate() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/clk/clk-versaclock7.c:812 vc7_calc_fod_2nd_stage_rate() warn: unnecessary div64_u64(): divisor = '2-u32max'
drivers/clk/clk-versaclock7.c:973 vc7_iod_recalc_rate() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/clk/clk-versaclock7.c:990 vc7_iod_round_rate() warn: unnecessary div64_u64(): divisor = '14-33554431'
drivers/clk/clk-versaclock7.c:1016 vc7_iod_set_rate() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/clk/clk-si570.c:263 si570_round_rate() warn: unnecessary div64_u64(): divisor = '2'
drivers/pci/setup-bus.c:1909 pci_bus_distribute_available_resources() warn: unnecessary div64_u64(): divisor = '1-u32max'
drivers/pci/setup-bus.c:1910 pci_bus_distribute_available_resources() warn: unnecessary div64_u64(): divisor = '1-u32max'
drivers/pci/setup-bus.c:1911 pci_bus_distribute_available_resources() warn: unnecessary div64_u64(): divisor = '1-u32max'
drivers/pci/setup-bus.c:1914 pci_bus_distribute_available_resources() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/pci/setup-bus.c:1915 pci_bus_distribute_available_resources() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/pci/setup-bus.c:1916 pci_bus_distribute_available_resources() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/tty/serial/serial_core.c:431 uart_update_timeout() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/ptp/ptp_qoriq.c:224 ptp_qoriq_adjfine() warn: unnecessary div64_u64(): divisor = '2'
drivers/ptp/ptp_dte.c:150 ptp_dte_adjfine() warn: unnecessary div64_u64(): divisor = '125000000'
drivers/ptp/ptp_dte.c:152 ptp_dte_adjfine() warn: unnecessary div64_u64(): divisor = '125000000'
drivers/gpu/drm/radeon/si_dpm.c:2200 si_calculate_power_efficiency_ratio() warn: unnecessary div64_u64(): divisor = '1000'
drivers/gpu/drm/radeon/si_dpm.c:2202 si_calculate_power_efficiency_ratio() warn: unnecessary div64_u64(): divisor = '1-4294836225'
drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c:356 rcar_mipi_dsi_pll_calc() warn: unnecessary div64_u64(): divisor = '0-255'
drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c:361 rcar_mipi_dsi_pll_calc() warn: unnecessary div64_u64(): divisor = '0-u16max'
drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2351 si_calculate_power_efficiency_ratio() warn: unnecessary div64_u64(): divisor = '1000'
drivers/gpu/drm/amd/amdgpu/../pm/legacy-dpm/si_dpm.c:2353 si_calculate_power_efficiency_ratio() warn: unnecessary div64_u64(): divisor = '1-4294836225'
drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1673 amdgpu_ras_sysfs_badpages_read() warn: unnecessary div64_u64(): divisor = '28'
drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1674 amdgpu_ras_sysfs_badpages_read() warn: unnecessary div64_u64(): divisor = '28'
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_dmub_srv.c:592 populate_subvp_cmd_drr_info() warn: unnecessary div64_u64(): divisor = '2'
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:807 dce110_edp_power_control() warn: unnecessary div64_u64(): divisor = '1000000'
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:812 dce110_edp_power_control() warn: unnecessary div64_u64(): divisor = '1000000'
drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dce110/dce110_hwseq.c:935 dce110_edp_wait_for_T12() warn: unnecessary div64_u64(): divisor = '1000000'
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_edp_panel_control.c:765 edp_setup_psr() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_edp_panel_control.c:765 edp_setup_psr() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:800 kbps_to_peak_pbn() warn: unnecessary div64_u64(): divisor = '432000'
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_psr.c:160 amdgpu_dm_psr_enable() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_psr.c:160 amdgpu_dm_psr_enable() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:106 calc_duration_in_us_from_refresh_in_uhz() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:117 calc_duration_in_us_from_v_total() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:132 mod_freesync_calc_v_total_from_refresh() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:135 mod_freesync_calc_v_total_from_refresh() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:135 mod_freesync_calc_v_total_from_refresh() warn: unnecessary div64_u64(): divisor = '1000000'
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:169 calc_v_total_from_duration() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:169 calc_v_total_from_duration() warn: unnecessary div64_u64(): divisor = '1000'
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:201 update_v_total_for_static_ramp() warn: unnecessary div64_u64(): divisor = '1000000'
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:200 update_v_total_for_static_ramp() warn: unnecessary div64_u64(): divisor = '1000-4467765'
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:207 update_v_total_for_static_ramp() warn: unnecessary div64_u64(): divisor = '1000'
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:214 update_v_total_for_static_ramp() warn: unnecessary div64_u64(): divisor = '16666'
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:245 update_v_total_for_static_ramp() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:245 update_v_total_for_static_ramp() warn: unnecessary div64_u64(): divisor = '1000'
drivers/gpu/drm/amd/amdgpu/../display/modules/freesync/freesync.c:1004 mod_freesync_build_vrr_params() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/acpi/cppc_acpi.c:1855 cppc_perf_to_khz() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/acpi/cppc_acpi.c:1863 cppc_perf_to_khz() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/acpi/cppc_acpi.c:1885 cppc_khz_to_perf() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/leds/rgb/leds-qcom-lpg.c:458 lpg_calc_freq() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/leds/rgb/leds-qcom-lpg.c:464 lpg_calc_freq() warn: unnecessary div64_u64(): divisor = '1024'
drivers/md/dm-cache-policy-smq.c:1750 __smq_create() warn: unnecessary div64_u64(): divisor = '64-2097152'
drivers/md/dm-verity-fec.c:764 verity_fec_ctr() warn: unnecessary div64_u64(): divisor = '512-130560'
drivers/pwm/pwm-lpc32xx.c:48 lpc32xx_pwm_config() warn: unnecessary div64_u64(): divisor = 's32min-s32max'
drivers/pwm/pwm-bcm-iproc.c:138 iproc_pwmc_apply() warn: unnecessary div64_u64(): divisor = '1000000000'
drivers/pwm/pwm-bcm-iproc.c:140 iproc_pwmc_apply() warn: unnecessary div64_u64(): divisor = '1000000000'
drivers/pwm/pwm-sifive.c:95 pwm_sifive_update_clock() warn: unnecessary div64_u64(): divisor = '1000000000'
drivers/pwm/pwm-spear.c:98 spear_pwm_config() warn: unnecessary div64_u64(): divisor = '1000000000'
drivers/pwm/pwm-spear.c:100 spear_pwm_config() warn: unnecessary div64_u64(): divisor = '1000000000'
drivers/media/i2c/st-vgxy61.c:482 get_pixel_rate() warn: unnecessary div64_u64(): divisor = '0-255'
drivers/media/i2c/st-vgxy61.c:569 vgxy61_check_bw() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/media/i2c/ds90ub913.c:642 ub913_i2c_master_init() warn: unnecessary div64_u64(): divisor = '1000000000'
drivers/media/i2c/ds90ub913.c:643 ub913_i2c_master_init() warn: unnecessary div64_u64(): divisor = '1000000000'
drivers/media/i2c/ds90ub953.c:832 ub953_i2c_master_init() warn: unnecessary div64_u64(): divisor = '1000000000'
drivers/media/i2c/ds90ub953.c:833 ub953_i2c_master_init() warn: unnecessary div64_u64(): divisor = '1000000000'
drivers/media/platform/ti/vpe/sc.c:202 sc_config_scaler() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/media/dvb-core/dvb_demux.c:425 dvb_dmx_swfilter_packet() warn: unnecessary div64_u64(): divisor = '1024'
drivers/scsi/sym53c8xx_2/sym_hipd.c:749 sym_prepare_setting() warn: unnecessary div64_u64(): divisor = '40000-2560000'
drivers/video/fbdev/omap2/omapfb/dss/dsi.c:4773 dsi_vm_calc() warn: unnecessary div64_u64(): divisor = 's32min-s32max'
drivers/video/fbdev/omap2/omapfb/dss/dsi.c:4780 dsi_vm_calc() warn: unnecessary div64_u64(): divisor = 's32min-s32max'
drivers/cpufreq/cppc_cpufreq.c:124 cppc_scale_freq_workfn() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/pinctrl/ti/pinctrl-ti-iodelay.c:192 ti_iodelay_compute_dpe() warn: unnecessary div64_u64(): divisor = '176-34602480'
drivers/net/wireless/intel/iwlwifi/mvm/ptp.c:55 iwl_mvm_ptp_get_adj_time() warn: unnecessary div64_u64(): divisor = '1000'
drivers/net/ethernet/xilinx/xilinx_axienet_main.c:240 axienet_usec_to_timer() warn: unnecessary div64_u64(): divisor = '125000000'
drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:407 bnxt_get_target_cycles() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_b0.c:1262 hw_atl_b0_adj_params_get() warn: unnecessary div64_u64(): divisor = '1000000000'
drivers/net/ethernet/engleder/tsnep_selftests.c:164 delay_base_time() warn: unnecessary div64_u64(): divisor = '62500,100000,200000,333333,400000,411854,500000,1000000,1500000,1700000,2000000,6000000'
drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c:301 mlxsw_sp1_ptp_clock_init() warn: unnecessary div64_u64(): divisor = '3435819912'
drivers/net/ethernet/mellanox/mlx5/core/en/htb.c:263 mlx5e_htb_convert_rate() warn: unnecessary div64_u64(): divisor = '1-u32max'
drivers/net/ethernet/mellanox/mlx5/core/lib/clock.c:519 find_target_cycles() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/net/ethernet/mellanox/mlx5/core/lib/clock.c:966 mlx5_init_overflow_period() warn: unnecessary div64_u64(): divisor = '0-u32max'
drivers/net/ethernet/intel/ice/ice_ptp.c:1717 ice_ptp_cfg_clkout() warn: unnecessary div64_u64(): divisor = '1000000000'
drivers/base/arch_topology.c:406 topology_init_cpu_capacity_cppc() warn: unnecessary div64_u64(): divisor = '0-u32max'
block/blk-iolatency.c:441 check_scale_change() warn: unnecessary div64_u64(): divisor = '100'
block/blk-iolatency.c:266 iolat_update_total_lat_avg() warn: unnecessary div64_u64(): divisor = '250000000'
block/blk-iolatency.c:236 latency_sum_ok() warn: unnecessary div64_u64(): divisor = '10'
block/blk-iolatency.c:955 iolatency_pd_stat() warn: unnecessary div64_u64(): divisor = '1000'
block/blk-iolatency.c:956 iolatency_pd_stat() warn: unnecessary div64_u64(): divisor = '1000000'
block/blk-iocost.c:706 abs_cost_to_cost() warn: unnecessary div64_u64(): divisor = '0-u32max'
block/blk-iocost.c:714 cost_to_abs_cost() warn: unnecessary div64_u64(): divisor = '65536'
block/blk-iocost.c:797 ioc_refresh_period_us() warn: unnecessary div64_u64(): divisor = '100'
block/blk-iocost.c:831 ioc_autop_idx() warn: unnecessary div64_u64(): divisor = '137438'
block/blk-iocost.c:943 ioc_refresh_params_disk() warn: unnecessary div64_u64(): divisor = '1000000'
block/blk-iocost.c:945 ioc_refresh_params_disk() warn: unnecessary div64_u64(): divisor = '1000000'
block/blk-iocost.c:1015 ioc_adjust_base_vrate() warn: unnecessary div64_u64(): divisor = '100'
block/blk-iocost.c:1018 ioc_adjust_base_vrate() warn: unnecessary div64_u64(): divisor = '100'
block/blk-iocost.c:1030 ioc_adjust_base_vrate() warn: unnecessary div64_u64(): divisor = '100'
block/blk-iocost.c:1365 iocg_kick_delay() warn: unnecessary div64_u64(): divisor = '1000000'
block/blk-iocost.c:1618 ioc_lat_stat() warn: unnecessary div64_u64(): divisor = '0-u32max'
block/blk-iocost.c:1762 hweight_after_donation() warn: unnecessary div64_u64(): divisor = '65536'
block/blk-iocost.c:1990 transfer_surpluses() warn: unnecessary div64_u64(): divisor = '0-65536'
block/blk-iocost.c:1999 transfer_surpluses() warn: unnecessary div64_u64(): divisor = '65536'
block/blk-iocost.c:2004 transfer_surpluses() warn: unnecessary div64_u64(): divisor = '0-u32max'
block/blk-iocost.c:2009 transfer_surpluses() warn: unnecessary div64_u64(): divisor = '0-u32max'
block/blk-iocost.c:2013 transfer_surpluses() warn: unnecessary div64_u64(): divisor = '0-u32max'
block/blk-iocost.c:2016 transfer_surpluses() warn: unnecessary div64_u64(): divisor = '0-u32max'
block/blk-iocost.c:2020 transfer_surpluses() warn: unnecessary div64_u64(): divisor = '0-u32max'
block/blk-iocost.c:2044 transfer_surpluses() warn: unnecessary div64_u64(): divisor = '0-u32max'
block/blk-iocost.c:2213 ioc_check_iocgs() warn: unnecessary div64_u64(): divisor = '65536'
block/blk-iocost.c:2823 ioc_rqos_done() warn: unnecessary div64_u64(): divisor = '137'
block/blk-iocost.c:3047 ioc_pd_stat() warn: unnecessary div64_u64(): divisor = '137438'
fs/bcachefs/tests.c:788 btree_perf_test_thread() warn: unnecessary div64_u64(): divisor = '0-u32max'
fs/bcachefs/alloc_background.c:2261 bch2_recalc_capacity() warn: unnecessary div64_u64(): divisor = '100'
fs/btrfs/block-group.c:2793 calculate_global_root_id() warn: unnecessary div64_u64(): divisor = '134217728,1073741824'
fs/nilfs2/the_nilfs.c:416 nilfs_max_segment_count() warn: unnecessary div64_u64(): divisor = '16-u32max'
fs/f2fs/gc.c:568 atgc_lookup_victim() warn: unnecessary div64_u64(): divisor = '0-u32max'
fs/f2fs/iostat.c:23 iostat_get_avg_bytes() warn: unnecessary div64_u64(): divisor = '0'
kernel/trace/trace_benchmark.c:107 trace_do_benchmark() warn: unnecessary div64_u64(): divisor = '0,2-u32max'
kernel/trace/trace_benchmark.c:129 trace_do_benchmark() warn: unnecessary div64_u64(): divisor = '1-u32max'
kernel/trace/trace_events_hist.c:701 hist_field_get_div_fn() warn: unnecessary div64_u64(): divisor = '1-1048576'
kernel/trace/trace_events_hist.c:5430 __get_percentage() warn: unnecessary div64_u64(): divisor = '10000'
kernel/dma/map_benchmark.c:82 map_benchmark_thread() warn: unnecessary div64_u64(): divisor = '100'
kernel/dma/map_benchmark.c:83 map_benchmark_thread() warn: unnecessary div64_u64(): divisor = '100'
kernel/fork.c:1011 set_max_threads() warn: unnecessary div64_u64(): divisor = '131072'
sound/usb/mixer_quirks.c:2353 snd_rme_current_freq_get() warn: unnecessary div64_u64(): divisor = '1-u32max'
sound/soc/sof/ipc4-mtrace.c:432 ipc4_mtrace_enable() warn: unnecessary div64_u64(): divisor = '1000'
sound/soc/sti/uniperif_player.c:182 uni_player_clk_set_rate() warn: unnecessary div64_u64(): divisor = '1000000'
net/netfilter/xt_hashlimit.c:498 user2credits() warn: unnecessary div64_u64(): divisor = '32000'
net/netfilter/xt_hashlimit.c:498 user2credits() warn: unnecessary div64_u64(): divisor = '31'
net/netfilter/xt_hashlimit.c:500 user2credits() warn: unnecessary div64_u64(): divisor = '10000,1000000'
net/ipv4/inetpeer.c:79 inet_initpeers() warn: unnecessary div64_u64(): divisor = '19200'

