Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3064C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 09:37:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B50622070B
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 09:37:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PY5T9lYf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eeEIpWvS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B50622070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1+ewpnn0MQrhymLED09GUI3m8/1qcAFIS8QoQEJ7Lrc=; b=PY5T9lYfr+DOA6OwPLZ6h1pSv
	kYjw6Y9/xBg/luim987Mc9kHXRep7vrKNkbZvef9Fc+z0NMoPl4x+2jXmH8/bU474EEv6xtEfUBde
	TqjAftIeYwcWWFroqXMWAOloFHA95mcNoikhHeZadxZvS28d2IvoIQsEfSgbYGarkUBwx1/Op20m+
	lrUr4xRNTEkNF4WbyfKOSxAueeBaxbTp/xttMcB2maC88DPjaRmRg1nhF2bgiZ1YqlEz8OmZun1SB
	UiJyKdrs5FOXMI1KGcRl/uI0GG+XGgd7RBhVhwXa2XOAeowWYNPLZamhWnu+JVu873jCa/Ew0cpbu
	DwCLjwMLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k54Eb-0001fn-76; Mon, 10 Aug 2020 09:36:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k54EY-0001f1-LS; Mon, 10 Aug 2020 09:36:47 +0000
X-UUID: 39823f9d6d7640b08d6edad4f84bc3a2-20200810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VwRgWjEdkPYGkWZKNJSxx1FhonydZDDe5W6HPLrIeDY=; 
 b=eeEIpWvS96ga53cQzaNwO/MvUBF8zz1atKtNYY7cJmUcqxBmKHQcHUu0K5ycnuVXCq/zkJfe80j3nANG4mDhzL28sHSuTqop1eNwcSufHtxqL4tYHOiKZ9b91D45Kbpe+We/CeXO+bUFZYV85vVZorq48Tun943h9wkxLUCeN5Q=;
X-UUID: 39823f9d6d7640b08d6edad4f84bc3a2-20200810
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <wendell.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2006595564; Mon, 10 Aug 2020 01:36:26 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 02:36:32 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 17:36:24 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Aug 2020 17:36:25 +0800
Message-ID: <1597052186.27843.1.camel@mtkswgap22>
Subject: Re: [PATCH 1/1] clk: Export clk_register_composite
From: Wendell Lin <wendell.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 10 Aug 2020 17:36:26 +0800
In-Reply-To: <1595493126-21611-1-git-send-email-wendell.lin@mediatek.com>
References: <1595493126-21611-1-git-send-email-wendell.lin@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_053646_880017_8FB697AB 
X-CRM114-Status: GOOD (  17.80  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias and all,

Gentle ping on this patch.

Thanks

Wendell Lin


On Thu, 2020-07-23 at 16:32 +0800, Wendell Lin wrote:
> clk_register_composite() will be used in mediatek's
> clock kernel module, so export it to GPL modules.
> 
> Signed-off-by: Wendell Lin <wendell.lin@mediatek.com>
> ---
>  drivers/clk/clk-composite.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/clk-composite.c b/drivers/clk/clk-composite.c
> index 7376f57..7c609c2 100644
> --- a/drivers/clk/clk-composite.c
> +++ b/drivers/clk/clk-composite.c
> @@ -360,6 +360,7 @@ struct clk *clk_register_composite(struct device *dev, const char *name,
>  		return ERR_CAST(hw);
>  	return hw->clk;
>  }
> +EXPORT_SYMBOL_GPL(clk_register_composite);
>  
>  struct clk *clk_register_composite_pdata(struct device *dev, const char *name,
>  			const struct clk_parent_data *parent_data,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
