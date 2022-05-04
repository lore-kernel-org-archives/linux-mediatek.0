Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC08C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 12:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMeXJOqSNXV4SudGBVizNVCfwqVoZTOTbU46lTH2FFw=; b=xbeROLW5AYt/qC
	N4wko+qik82dn/4PqN3NIyGdygBnL8co6SYFUgoTTpBcnmP2L4VuUm9qxoV9RpovoWW/otcEDskya
	bWCXAHAroAp+gmpCcpQ0RGMQcTwGIuJBseBCj2tUcgPIw5NRBrnEBEeAEBdQkfgvNDEVhCNN4vv3q
	N0pC6TCDR7x6hh/8ynILNMEu/lu2alQ+ep3R8pn2B9VxEQi2LiZsAIK9PxqRZXoFkqNz8pQPQVk24
	h3Y3kWHv3ssVI2sPijSRKxJghQvzyRENVe2CDTPtVpxMZYlN3I9UQdFlJnzdMuziyb4jsrZaRHjwj
	HtvKTDSOQsuqgksrZMZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEQu-00AqeT-TN; Wed, 04 May 2022 12:48:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEQq-00Aqbb-Bz; Wed, 04 May 2022 12:48:43 +0000
X-UUID: 4644768a40e542be8f38b3dd7f13eac9-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b140f078-56dd-4f4e-9c71-285b5fb5fbce, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:b2088cb2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 4644768a40e542be8f38b3dd7f13eac9-20220504
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1412878738; Wed, 04 May 2022 05:48:37 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 05:46:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 20:46:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 4 May 2022 20:46:27 +0800
Message-ID: <fda797664ad3cde1143838bdf63cc587459b2c2f.camel@mediatek.com>
Subject: Re: [PATCH 09/13] clk: mediatek: reset: Export
 mtk_register_reset_controller symbols
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Yassine Oudjana <yassine.oudjana@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
CC: Yassine Oudjana <y.oudjana@protonmail.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, "Tinghan
 Shen" <tinghan.shen@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Ikjoon Jang <ikjn@chromium.org>, Miles Chen <miles.chen@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Wed, 4 May 2022 20:46:22 +0800
In-Reply-To: <20220504122601.335495-10-y.oudjana@protonmail.com>
References: <20220504122601.335495-1-y.oudjana@protonmail.com>
 <20220504122601.335495-10-y.oudjana@protonmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_054840_439227_FED1D7B3 
X-CRM114-Status: GOOD (  15.89  )
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

On Wed, 2022-05-04 at 16:25 +0400, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Export mtk_register_reset_controller and
> mtk_register_reset_controller_set_clr to support building reset
> drivers as modules.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  drivers/clk/mediatek/reset.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/reset.c
> b/drivers/clk/mediatek/reset.c
> index bcec4b89f449..6c2effe6afef 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -129,6 +129,7 @@ void mtk_register_reset_controller(struct
> device_node *np,
>  	mtk_register_reset_controller_common(np, num_regs, regofs,
>  		&mtk_reset_ops);
>  }
> +EXPORT_SYMBOL_GPL(mtk_register_reset_controller);
>  
>  void mtk_register_reset_controller_set_clr(struct device_node *np,
>  	unsigned int num_regs, int regofs)
> @@ -136,5 +137,6 @@ void mtk_register_reset_controller_set_clr(struct
> device_node *np,
>  	mtk_register_reset_controller_common(np, num_regs, regofs,
>  		&mtk_reset_ops_set_clr);
>  }
> +EXPORT_SYMBOL_GPL(mtk_register_reset_controller_set_clr);
>  
>  MODULE_LICENSE("GPL");

Hello Yassine,

Thanks for your patch for mediatek clk reset.
But I have another series to cleanup mediatek clk reset drivers and
most of my patches are reviewed.
Please refer to
https://patchwork.kernel.org/project/linux-mediatek/list/?series=637849

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
