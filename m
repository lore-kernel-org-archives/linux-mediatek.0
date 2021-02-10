Return-Path: <SRS0=P5Ae=HM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FEAC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 12:46:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8514661481
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 12:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8514661481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=obfzyw9+uLBDGJh+atwUO5h2dmteRhIlWAxa2r0rEIM=; b=W/mrOdFzEL7FGPf7w70GjMRIa
	7efjXemzemO4p5PU9KYBXTSFuzuU1Q2tBE0aARAHHc+rWC+TkAtL+jIo6sR6lkXx0QtrtlnFobLOQ
	NALYTJy2NOiVr7mttwqPo/LfdD0Pi10NCYjuv0NHG2JYfpvqpfghTGi0bF0/THljFVFf23Etk1g6x
	H5RPBv/8PhJ3IxGzn5guVfUpcx5aRGomigv27yC8UjgghzWWnRVAtJfyamQNWOKT8ipgWB5Lj+Npn
	53x+HoI+uM0gt8uBnX36bQMXHtcy/8rReX3RjWdMpQy3i9jQiT2tzWMzlR/GErEX/KTpKitDK86Y2
	+4ytq37bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9osf-0000xH-HS; Wed, 10 Feb 2021 12:46:05 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9osc-0000wc-UE; Wed, 10 Feb 2021 12:46:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id n6so2353653wrv.8;
 Wed, 10 Feb 2021 04:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rjLWgX3Eg/gC3RV2khv5c8f9NWNyEch31NnXlurt3Ss=;
 b=GSU8nJJHRxGKxEYvAVHgEZ99IaPo0P82K2x/ng7rcD0jt+NV3L03A27i1H57yxSIxh
 /ix5ODPDpCQiJftDGoj9wOWsLSy5xcMrn+tClntvA+wmxdJmfrzx/MUqJJiXEwHDeC0I
 dtbDh2tJORkIrYHkE0g9fUS4N7old4ebGv+D75QpkkmjRxu5mBL4hkboAi4chmFY1GCe
 Y2dfPmWdzLtFxoNTJ9JD7aJkXPQY2iwoVdYi1dtnv87ZxOfDg2VxkIe6rfQj0mrAKf3Z
 HpJwhtERMHvMhNT7nvtQiVT7CsRyqedvV18w1GxtWP3xZNK7/ghrnLa+gxewO8yaMSeU
 lzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rjLWgX3Eg/gC3RV2khv5c8f9NWNyEch31NnXlurt3Ss=;
 b=LigRtGcB42GYp9rosHu1NWo/i9qJeaPMckGoQ6+0VfkTe/9YKvRF+iUbsIf05qLloV
 +qcldJD/81osQT+1eF4FSzcfp/xC0qzCU8FR2kSdafiHusy7KHAtRpW0vdzEDX/7xeVY
 ChAgnX1GNJ4PH7+GgAEUlrKYGiGKkmq+1OBUt6axgIcle0s1K9+K3TLJTVV3TOLO17Gd
 yytHrvewnbri+J4UGRJWfehWo6g7Gi8k8UgyveMZBGuVuM/xq5xlzsZ4DP9S+be0jayI
 oHsXvbrdV0xSCBHSFDC0k47FJnChrKL7eaZ3YCCFRdIRkLpa2K6bgJjUUu9p9Nkwamm4
 YseQ==
X-Gm-Message-State: AOAM532WVDDY7EWJvV5YNYH9pF/gVN1NLQBGIzgWN3a3bh/fX1HxIyKQ
 cYlNjuTsiYBP9ZP/9iCw+ss=
X-Google-Smtp-Source: ABdhPJyGB+U3gO1kAGzHQsdpRDV8svemT3zKAyNPWMoEzioiHLuUbNy6AOhrhPwCNeE3NNBWZeMhYA==
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr3334138wru.178.1612961161574; 
 Wed, 10 Feb 2021 04:46:01 -0800 (PST)
Received: from ziggy.stardust (static-188-169-27-46.ipcom.comunitel.net.
 [46.27.169.188])
 by smtp.gmail.com with ESMTPSA id f17sm2826671wrx.57.2021.02.10.04.46.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 04:46:01 -0800 (PST)
To: Weiyi Lu <weiyi.lu@mediatek.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
 <1608642587-15634-11-git-send-email-weiyi.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v6 10/22] clk: mediatek: Add MT8192 basic clocks support
Message-ID: <b16e4693-1dc6-e13c-3cc9-feb5005179dd@gmail.com>
Date: Wed, 10 Feb 2021 13:46:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1608642587-15634-11-git-send-email-weiyi.lu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_074602_999432_CC7800D7 
X-CRM114-Status: GOOD (  23.41  )
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
Cc: srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/12/2020 14:09, Weiyi Lu wrote:
> Add MT8192 basic clock providers, include topckgen, apmixedsys,
> infracfg and pericfg.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig      |    8 +
>  drivers/clk/mediatek/Makefile     |    1 +
>  drivers/clk/mediatek/clk-mt8192.c | 1326 +++++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-mux.h    |   15 +
>  4 files changed, 1350 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8192.c
> 

[...]

> +static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
> +{
> +	struct clk_onecell_data *clk_data;
> +	struct device_node *node = pdev->dev.of_node;
> +	int r;
> +
> +	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
> +	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
> +	if (r)
> +		return r;
> +
> +	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +}
> +
> +static const struct of_device_id of_match_clk_mt8192[] = {
> +	{
> +		.compatible = "mediatek,mt8192-apmixedsys",
> +		.data = clk_mt8192_apmixed_probe,
> +	}, {
> +		.compatible = "mediatek,mt8192-topckgen",
> +		.data = clk_mt8192_top_probe,
> +	}, {
> +		.compatible = "mediatek,mt8192-infracfg",
> +		.data = clk_mt8192_infra_probe,
> +	}, {
> +		.compatible = "mediatek,mt8192-pericfg",
> +		.data = clk_mt8192_peri_probe,
> +	}, {
> +		/* sentinel */
> +	}
> +};
> +
> +static int clk_mt8192_probe(struct platform_device *pdev)
> +{
> +	int (*clk_probe)(struct platform_device *pdev);
> +	int r;
> +
> +	clk_probe = of_device_get_match_data(&pdev->dev);
> +	if (!clk_probe)
> +		return -EINVAL;
> +
> +	r = clk_probe(pdev);
> +	if (r)
> +		dev_err(&pdev->dev, "could not register clock provider: %s: %d\n", pdev->name, r);
> +
> +	return r;
> +}
> +
> +static struct platform_driver clk_mt8192_drv = {
> +	.probe = clk_mt8192_probe,
> +	.driver = {
> +		.name = "clk-mt8192",
> +		.of_match_table = of_match_clk_mt8192,
> +	},
> +};
> +
> +static int __init clk_mt8192_init(void)
> +{
> +	return platform_driver_register(&clk_mt8192_drv);
> +}
> +
> +arch_initcall(clk_mt8192_init);

Do we really need all these clocks that early?
Why don't we use CLK_OF_DECLARE_DRIVER() then and why do we initialize some
clocks CLK_OF_DECLARE_DRIVER and other with arch_initcall?

I know that this is in other drivers for MediaTek SoCs, but that does not mean
it's the right approach.


> diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
> index f5625f4..afbc7df 100644
> --- a/drivers/clk/mediatek/clk-mux.h
> +++ b/drivers/clk/mediatek/clk-mux.h
> @@ -77,6 +77,21 @@ struct mtk_mux {
>  			_width, _gate, _upd_ofs, _upd,			\
>  			CLK_SET_RATE_PARENT)
>  
> +#define MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,		\
> +			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
> +			_upd_ofs, _upd, _flags)				\
> +		GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,	\
> +			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
> +			0, _upd_ofs, _upd, _flags,			\
> +			mtk_mux_clr_set_upd_ops)
> +
> +#define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,			\
> +			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
> +			_upd_ofs, _upd)					\
> +		MUX_CLR_SET_UPD_FLAGS(_id, _name, _parents,		\
> +			_mux_ofs, _mux_set_ofs, _mux_clr_ofs, _shift,	\
> +			_width, _upd_ofs, _upd,	CLK_SET_RATE_PARENT)
> +

Why can't we do something like:

#define MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,			\
			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
			_upd_ofs, _upd)					\
		GATE_CLR_SET_UPD_FLAGS(_id, _name, _parents, _mux_ofs,	\
			_mux_set_ofs, _mux_clr_ofs, _shift, _width,	\
			0, _upd_ofs, _upd, CLK_SET_RATE_PARENT,			\
			mtk_mux_clr_set_upd_ops)

>  struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
>  				 struct regmap *regmap,
>  				 spinlock_t *lock);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
