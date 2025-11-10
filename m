Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB679CCFA13
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Nov 2025 10:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3hjjQw506YKhgHdFR2a57hcN/smdx/JNOkEsmfHHZk=; b=hmSJ+oF1kZQ8HXDeTnztDGczMx
	5Ongrma93OVSQKZLE0HzrE6OLl4JTDZ4hRnJJf13cZcy1IHpNefjxmlPiCQUsstRVaZjo+3uep6BY
	2NpFuWWCE2Y9L284VZSFclaZ02Kx9ppFR/xe1Corq7QYLRzAIaB52nhd+3QRCLQRjaH6e/HQNil3W
	RMz2MFLq9G7+G3O6wAz7KLsaXxdOMtBl0FXHJ20BhlmEfgFtFR41hoSeDFQO3xhYi1tmLURQQRRqg
	ezuMoLAnjSCa75foyIFWyuVHBv8FXN9LFVT1Pw4wVC/5m7/70d+Z8BOOi86DBDCpicO3qBzF6swUZ
	opiOL1Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPSs-00000005F33-3WtL;
	Mon, 10 Nov 2025 10:49:38 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPSp-00000005F1y-3X8n;
	Mon, 10 Nov 2025 10:49:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1762771764; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NxkxrJemZezmKrnWKU50oEyuQ0oCj/UUy1xO5JA0Gxn9hFcL8TKfLyZ9KjZK0Oj0JuaQfXVLrz/fLTRYpOpa1ehrccY4PZYSvu95xVpyoEGqHKNJIZKqZ7noyjFhJlISRGOCeVfVMTkvYNqRmBdvc90If/92GDVfoy+n2dsECTE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762771764; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M3hjjQw506YKhgHdFR2a57hcN/smdx/JNOkEsmfHHZk=; 
	b=aCxRLagrCIk8Z4COBk6g3josoNmO+MGUHDltmbPTzTdDmTTOuLRTxMiCLvRy08HwLsFgO/iVdI8mbNOub7r8jKGDGkaiAXxIMppwWE+6LP5tU/US9jl2dpE1vhWqavByHylZXFprTtLYSFIOsvHnZ0zslYFLvQvBllhzpcZcTJw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762771764;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=M3hjjQw506YKhgHdFR2a57hcN/smdx/JNOkEsmfHHZk=;
	b=VBd3EL5UPfRGd3kOCmotU8adSTTmnNAgPJhL85RfMUAYwnFFqt1sQGScQeXfHtnq
	5MtVhSlfd1As0In11QZQr2rKRZoGz7fe2XwrKIIJHeGcFyT8+8fXOywCIdVrBqO0CSh
	qjJGAlCu1mMEDhsVV8VXSqvTB6HnfBOAwkRMWe/A=
Received: by mx.zohomail.com with SMTPS id 1762771762436795.5055126772169;
	Mon, 10 Nov 2025 02:49:22 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] pmdomain: mediatek: convert from clk round_rate() to
 determine_rate()
Date: Mon, 10 Nov 2025 11:49:17 +0100
Message-ID: <9531607.CDJkKcVGEf@workhorse>
In-Reply-To: <20251106-clk-pmdomain-mediatek-round-rate-v1-1-49441ea27f84@redhat.com>
References: <20251106-clk-pmdomain-mediatek-round-rate-v1-1-49441ea27f84@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_024935_951838_292BCA43 
X-CRM114-Status: GOOD (  21.60  )
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

On Friday, 7 November 2025 00:40:43 Central European Standard Time Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's convert this driver so that
> round_rate() can be removed from the clk core.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> index af20111067c02a5f9a0d6d751e9e0dc32c1a4d90..9bad577b3ae4bf1b83d4f782bb52f56f779a8974 100644
> --- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -309,11 +309,11 @@ static unsigned long mtk_mfg_recalc_rate_gpu(struct clk_hw *hw,
>  	return readl(mfg->shared_mem + GF_REG_FREQ_OUT_GPU) * HZ_PER_KHZ;
>  }
>  
> -static long mtk_mfg_round_rate(struct clk_hw *hw, unsigned long rate,
> -			       unsigned long *parent_rate)
> +static int mtk_mfg_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
>  {
>  	/*
> -	 * The round_rate callback needs to be implemented to avoid returning
> +	 * The determine_rate callback needs to be implemented to avoid returning
>  	 * the current clock frequency, rather than something even remotely
>  	 * close to the frequency that was asked for.
>  	 *
> @@ -325,7 +325,7 @@ static long mtk_mfg_round_rate(struct clk_hw *hw, unsigned long rate,
>  	 * high current frequency, breaking the powersave governor in the process.
>  	 */
>  
> -	return rate;
> +	return 0;
>  }
>  
>  static unsigned long mtk_mfg_recalc_rate_stack(struct clk_hw *hw,
> @@ -338,12 +338,12 @@ static unsigned long mtk_mfg_recalc_rate_stack(struct clk_hw *hw,
>  
>  static const struct clk_ops mtk_mfg_clk_gpu_ops = {
>  	.recalc_rate = mtk_mfg_recalc_rate_gpu,
> -	.round_rate = mtk_mfg_round_rate,
> +	.determine_rate = mtk_mfg_determine_rate,
>  };
>  
>  static const struct clk_ops mtk_mfg_clk_stack_ops = {
>  	.recalc_rate = mtk_mfg_recalc_rate_stack,
> -	.round_rate = mtk_mfg_round_rate,
> +	.determine_rate = mtk_mfg_determine_rate,
>  };
>  
>  static const struct clk_init_data mtk_mfg_clk_gpu_init = {
> 
> ---
> base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
> change-id: 20251106-clk-pmdomain-mediatek-round-rate-649a9bf7d30a
> 
> Best regards,
> 

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

I didn't test boot this, but it should be fine, as I've checked
and all the places where the clk core checks for round_rate, it
also checks for determine_rate. So this is likely correct.

I've also made sure the adjusted op implementation is correct,
in that simply returning 0 leaves the requested rate as-is and
preserves the existing behaviour.

Kind regards,
Nicolas Frattaroli



