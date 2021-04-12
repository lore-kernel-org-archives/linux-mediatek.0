Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD459C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 23:54:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A4A56128E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 23:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A4A56128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J/rIV5xnUssokia81ho98yt0CQsjS+Vnq14r2kNpMrM=; b=a9I2rpB1OnvZd4ujWy8v/xjff
	j0fUDnEMBkQZ++Ta1w7ACpn2Trva5Ccv+qdfFziNjkE1rO5zKYWA+oFtkDR/FnbE/mbZ0sOJ0uxgi
	4FuhQDPkglUmGf1x01jcBimL/MEKrqzRGtNbV7MnBt9Akh/s7HT92RfalfXY/inn7Gq/Zn58goEGf
	tPqFKEnvOTi8JZlslAGJ4ndrgMYxkhvRV1T95Ksv6psSGjRzMAZUHtN5v00M3tDnQVWEznP9LLkEG
	uPJ6hv7+s+3YyOJ4xdNj6v2s6tmH+m5MGYcccJsZ3A0AKspaXVKMlJGy4qwAi/ygZEPJ60OYW4LVT
	vSX8lsQEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lW6NI-007vF4-O4; Mon, 12 Apr 2021 23:53:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW6NF-007vEp-H3
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 23:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=cgT1HApdmZ6zS0OsJ1xfBAFlpTT4bt9tHkmOVAqIDmE=; b=D3plxSIFw92izaSMuFQXUpEDBd
 gLlwDo0zlaMVe/xda+FCB4sp2J/U5AAjoubtnnvxxJSl/LDTL7WWrc6dWUxqR+Zq6JWzH/XlS8dqg
 EZfnqWxZZKtu3/nxRUOEK/cM1R17ylWxY44SqAPnNHrlYWp9S3IoDgbPKnw9pqvZiREjIQfZYydc8
 ncuPoyY8+oB0CVPQ1RFxsKqqRgKN4726wZ0LQSEjFD+3R/SwTQBiSDd9SIOEM7uv5k1Y/eUWRRQW1
 Ob54eed2RNciNujoXavEByMrysSiW+vRsrwiGVjvkr4xLhLNc/GfBHyMxrnl73Ek4Qr1nDvESslz/
 hOgmT8Jg==;
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lW6NC-006dUB-Pm
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 23:53:44 +0000
Received: by mail-oi1-x22f.google.com with SMTP id b3so473190oie.5
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Apr 2021 16:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cgT1HApdmZ6zS0OsJ1xfBAFlpTT4bt9tHkmOVAqIDmE=;
 b=rLfqXGY3INUuJ2aRB/CzZnSw4KvS7BIaZPNNa/NJ1C6Dt/jGgiBhZl2iKVpg8KnTtY
 7MPjxY1QIymJLvhWtu9lX2CCNfmk4y2TeONlYDrYiocw2TnD2jtNeJESwir3O3aSb30X
 8AivrzRbyZLO64KNIsm0/yeVJ5bYFWdhV/anHLWvC+dcrkChxvWGjXgvDqKMhfr9NVAq
 uqzTsxGZkBkL+EAFLngxQnUc74zp5KTUZ9CBDmPrOIygQjfBgLBmTAnT9FXGd2vzTkow
 MBAD3KghXlIfSODGL/ftQxpjE9Cw3y+aAwyDmTs4yy1p3c+y+6Cc8eUmuzR2vK7K2QQj
 0GzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cgT1HApdmZ6zS0OsJ1xfBAFlpTT4bt9tHkmOVAqIDmE=;
 b=jxnl+xeiDcYZnBy7SPFJcTRB/5Wdbiluy/xk1Hk1l1cq0u3BOmrju+Kbr4Xi73E9Bi
 DhwHULpi0NOO11tvn4/fL84PmEnl5on1nfceoukw0m3ms/wmLTBctEfX1f8mZp/h+Wec
 EG/C61sX5OK8eP66djvrCeGinoyeo6iLE3S0GS84yzKXTfb6ysTB7wf8p4xPUFxtdxom
 qASvW86Z3yaaJPQpBQnu1cWPJ67pA3oBIIgKC6OgqLOngTSJr6wNIO8UQkomRf6jYbNo
 ewXg7WnJl1pLe/yJG7Fc41FedUMEnZl18EFwfd2vbz3zdLHjufPNo1hXetwMtGmrII6r
 0lcg==
X-Gm-Message-State: AOAM532Bm59saFvLU5TGk11czxPV2L3ttzxTgztzRvTxKnxRoXipmqhv
 KWxkv02GcIwopyG8DajVmtmbwwJ5lBOLjg==
X-Google-Smtp-Source: ABdhPJwB8eYTup93oYQNOALWr8lw5AXfKmpA25UytBaSHUI5Cm/0tYufSL5e57UWns9RDNfc9MMg4A==
X-Received: by 2002:aca:5d82:: with SMTP id r124mr1229083oib.59.1618271621720; 
 Mon, 12 Apr 2021 16:53:41 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id q10sm2451934ooo.34.2021.04.12.16.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 16:53:41 -0700 (PDT)
Date: Mon, 12 Apr 2021 18:53:39 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] phy: qcom-qmp: remove redundant error of clock bulk
Message-ID: <20210412235339.GF1538589@yoga>
References: <1617937630-24832-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617937630-24832-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_165342_874541_08976249 
X-CRM114-Status: GOOD (  15.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu 08 Apr 22:07 CDT 2021, Chunfeng Yun wrote:

> There is error log in clk_bulk_prepare/enable()
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 9cdebe7..f14b8be 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -3598,10 +3598,8 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>  	}
>  
>  	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
> -	if (ret) {
> -		dev_err(qmp->dev, "failed to enable clks, err=%d\n", ret);
> +	if (ret)
>  		goto err_rst;
> -	}
>  
>  	if (cfg->has_phy_dp_com_ctrl) {
>  		qphy_setbits(dp_com, QPHY_V3_DP_COM_POWER_DOWN_CTRL,
> @@ -4035,10 +4033,8 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
>  	}
>  
>  	ret = clk_bulk_prepare_enable(cfg->num_clks, qmp->clks);
> -	if (ret) {
> -		dev_err(qmp->dev, "failed to enable clks, err=%d\n", ret);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	ret = clk_prepare_enable(qphy->pipe_clk);
>  	if (ret) {
> -- 
> 1.8.1.1.dirty
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
