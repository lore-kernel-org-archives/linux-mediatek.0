Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C5EC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 19:29:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01A57224DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 19:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01A57224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gqKPvsOWikDsil9Ay1q1QV6uq0zLJQ8m1Ckui6Y4pLE=; b=FrHmYyfZO8GcqYVCFpgaaqstQ
	md6utJ1cV255fAJiK1a3LnIw0XP2EWvGAKEcuYrX0z3a9gKtSyUMZlO4uJEt7SFk4zja8GNV9vANk
	q8ObCPHUn7KpR8T5FxUjU/2r5aTiV1nYVWEZ0JXcQOVXwifvv8VoPKq5215SMc8JGPngdvLC8B0/E
	ADWsTgVGCZ4EnoZCgjFSKMvtSsDPrmIr81aEokCNZYSORq5jvgUJDKSPQkl4iWlRgGiXdyKOFXhZW
	v3sMl/OFB5mEUPI4R9rbfwHd+/8s2+o83CHGYD/TLeEBl4CRPx8wxkNtwPL2KQxIApq1P2teuz9ga
	QMebCZEFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l47Y8-0002w0-G9; Mon, 25 Jan 2021 19:29:20 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l47Vx-00022a-20; Mon, 25 Jan 2021 19:27:17 +0000
Received: by mail-ot1-f52.google.com with SMTP id e70so13850691ote.11;
 Mon, 25 Jan 2021 11:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rMSnythaK4LFQsW5PlS81Mrlcsyec/gXB8IqOq/hvBs=;
 b=e4xPUfh5daupmvbl2ko4/5yzpz06r06SHSMtYmTAI68KfSrIjbam4ZjjguGJI4J+x9
 AFL0b0p0GVKJ0BrM45/lGl9GgvgpD+D+EnKEXkJ+pRPo8op8JXgITV7V5rJi/at++S3O
 PQUcnaUqnICKKYlJ+85GLJ0iBbEtOjjVfgDd8gXsthU4BpWmoi0CwZzKoleuAaf5nFF7
 H1SB8AUX/wjmZf7NdZcp+fF07T3xeNiHk1wzp12UT/WzK6s30EH/dE2TAI4u2LBNH0Wk
 nI0OX+CDK4U05r36j10SCooHAnkEMQLhtJvzYNotSrMxfsUcNlhCVZ1Ox2tQunAG5XDO
 XOjg==
X-Gm-Message-State: AOAM530Jx0NcoaN/l8HeZ2MNl8Z+wenc/V0/u9DBFrUdTXNXoXQ+unA8
 uWUtAYn0WFpVzT3eiiUI/A==
X-Google-Smtp-Source: ABdhPJxcdD+A3ReVkIe5LdLjsOSjCXzIQzzE8Jiep2pdwq/Met5kvdKeWTxeat3Vqk6RR1S6MfLZCg==
X-Received: by 2002:a9d:1d43:: with SMTP id m61mr1562004otm.231.1611602822404; 
 Mon, 25 Jan 2021 11:27:02 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n203sm3726310oib.4.2021.01.25.11.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 11:26:59 -0800 (PST)
Received: (nullmailer pid 812719 invoked by uid 1000);
 Mon, 25 Jan 2021 19:26:58 -0000
Date: Mon, 25 Jan 2021 13:26:58 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v10 2/4] arm64: dts: mt8183: Add node for the Mali GPU
Message-ID: <20210125192658.GA806742@robh.at.kernel.org>
References: <20210113060703.3122661-1-drinkcat@chromium.org>
 <20210113140546.v10.2.I9f45f5c1f975422d58b5904d11546349e9ccdc94@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113140546.v10.2.I9f45f5c1f975422d58b5904d11546349e9ccdc94@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_142705_259695_68E5B448 
X-CRM114-Status: GOOD (  21.16  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 fshao@chromium.org, linux-kernel@vger.kernel.org,
 Steven Price <steven.price@arm.com>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hoegsberg@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 13, 2021 at 02:07:01PM +0800, Nicolas Boichat wrote:
> Add a basic GPU node for mt8183.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> The binding we use with out-of-tree Mali drivers includes more
> clocks, this is used for devfreq: the out-of-tree driver switches
> clk_mux to clk_sub_parent (26Mhz), adjusts clk_main_parent, then
> switches clk_mux back to clk_main_parent:
> (see https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#423)
> clocks =
>         <&topckgen CLK_TOP_MFGPLL_CK>,
>         <&topckgen CLK_TOP_MUX_MFG>,
>         <&clk26m>,
>         <&mfgcfg CLK_MFG_BG3D>;
> clock-names =
>         "clk_main_parent",
>         "clk_mux",
>         "clk_sub_parent",
>         "subsys_mfg_cg";
> (based on discussions, this probably belongs in the clock core)
> 
> This only matters for devfreq, that is disabled anyway as we don't
> have platform-specific code to handle >1 supplies.
> 
> (no changes since v6)
> 
> Changes in v6:
>  - Add gpu regulators to kukui dtsi as well.
>  - Power domains are now attached to spm, not scpsys
>  - Drop R-B.
> 
> Changes in v5:
>  - Rename "2d" power domain to "core2" (keep R-B again).
> 
> Changes in v4:
>  - Add power-domain-names to describe the 3 domains.
>    (kept Alyssa's reviewed-by as the change is minor)
> 
> Changes in v3:
>  - No changes
> 
> Changes in v2:
>  - Use sram instead of mali_sram as SRAM supply name.
>  - Rename mali@ to gpu@.
> 
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   6 +
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   6 +
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
>  3 files changed, 117 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index cba2d8933e79..0a8c2fad8e16 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -42,6 +42,12 @@ &auxadc {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	supply-names = "mali", "sram";

Not a documented property, nor should it be.

Did you run this against dtbs_check with your schema changes?

> +	mali-supply = <&mt6358_vgpu_reg>;
> +	sram-supply = <&mt6358_vsram_gpu_reg>;
> +};
> +
>  &i2c0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c_pins_0>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
