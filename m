Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E355BC4727C
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 12:51:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 923532075E
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 12:51:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oCCyBpER";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LZbanRdg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 923532075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=637ckLHJaVmtLTXSKV91uOBW7zUC/4tFPIh3IZSRGpM=; b=oCCyBpER24/XDNijq8GKxtXhD
	AMzFCmKqquX8O+ySrAE/FDM0qR5KbNEeiDWH5G3BhHyJ1ZXMz2DrB7WdAYr+mN78T7TAapRVj7i/3
	rcbKBpxbRv12SiaLX4IlGiyrGh2huWHdKsQE5WVwYqixRTSRKcg1wFKiSZQKJqdaj3RqOvE1kZdLK
	igW9oogI6bnXRqQHACinBpzGn0p+TTf9/RH58UNQ1CcMhES3g8O6pmUg43FgDdrxauaJ2BCHfpjQx
	z21PeMOdiGlPV8cr34lpcDe27r5BMje5f1A9kanKGYgtt4STaTPYyHn/PoOHuBP+chBLh3w4w/2su
	wc4QGj4zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLnC1-0002ya-Nn; Fri, 25 Sep 2020 12:51:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLnBw-0002x9-1k; Fri, 25 Sep 2020 12:51:13 +0000
X-UUID: 3e9c871c6aa7434d9941bddf5806638d-20200925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KDuRXITI29rGTc4me2UihJK6MXBboba2ogqxBZTeDyM=; 
 b=LZbanRdgaV82/7Bm21yNV4GUuvSVDezPoBuqTKvak+GfrPzd5UCTqI3Iy2rOEaW7Bas1omTEmpDW0O+B2fM8iSf4edvA1OU02/QONOhwdyONorrelxdMYbe/cemOtaOVEIZGTJXq/Gbgb1lAK1TUxsiSas6hU+zgLwkEUWgKOkw=;
X-UUID: 3e9c871c6aa7434d9941bddf5806638d-20200925
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 593446227; Fri, 25 Sep 2020 04:51:07 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 05:51:05 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Sep 2020 20:50:58 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 20:50:57 +0800
Message-ID: <1601038258.15065.4.camel@mtkswgap22>
Subject: Re: [PATCH v2] pinctrl: mediatek: check mtk_is_virt_gpio input
 parameter
From: Hanks Chen <hanks.chen@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Sep 2020 20:50:58 +0800
In-Reply-To: <1597922546-29633-1-git-send-email-hanks.chen@mediatek.com>
References: <1597922546-29633-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_085112_572936_E76B25FD 
X-CRM114-Status: GOOD (  17.85  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, sin_jieyang <sin_jieyang@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sean & Linux & Matthias,

Please kindly let me know your comments about this fixes patch.
Thanks

Regards,
Hanks


On Thu, 2020-08-20 at 19:22 +0800, Hanks Chen wrote:
> check mtk_is_virt_gpio input parameter,
> virtual gpio need to support eint mode.
> 
> add error handler for the ko case
> to fix this boot fail:
> pc : mtk_is_virt_gpio+0x20/0x38 [pinctrl_mtk_common_v2]
> lr : mtk_gpio_get_direction+0x44/0xb0 [pinctrl_paris]
> 
> Fixes: edd546465002 ("pinctrl: mediatek: avoid virtual gpio trying to set reg")
> Singed-off-by: Jie Yang <sin_jieyang@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> 
> ---
> Changes since v1:
> - update Singed-off-by
> - align with pinctrl/mediatek/pinctrl-mtk-mt*.h 
> 
> ---
>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index c53e2c391e32..a485d79f51a1 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -259,6 +259,10 @@ bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n)
>  
>  	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio_n];
>  
> +	/* if the GPIO is not supported for eint mode */
> +	if (desc->eint.eint_m == NO_EINT_SUPPORT)
> +		return virt_gpio;
> +
>  	if (desc->funcs && !desc->funcs[desc->eint.eint_m].name)
>  		virt_gpio = true;
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
