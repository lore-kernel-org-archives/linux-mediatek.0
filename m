Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B2CC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 07:01:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35AAD610E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 07:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35AAD610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxfFA6OTH24T009l1ttOvERPTIrori3II8pLYFT9m6Q=; b=rSv5/ET80Lw7Fi
	oaZuP7DtcIzgUC74v2bccZ2xCOPlbpOQBcD/d75xllOIdpf2oSf1R4GOM5N+hljLuSMzP8n8Z5VHA
	aE8quKT21H8Ktpjg/y1c2MSW058/XGQyJL0+h93ruKMYAKIvsis1U3D0EHlz5i32t6DNuOXsT+NVy
	EwESwThX3LbxTOt2Z8bTvRBhHzNU7bdV/0kMmaObxzeqCHTeBiw4XZ+oiXQj67zlLUBlz8qGOJvGv
	xXaIoNk0Hb2zxM50A48xNJz+mudmzsOQ4lKk/Xu6kCB+GSgtglbF5znXvJ3m6akGvHdPElRjAPHy9
	zSwvjnqWacsdBapN3N8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGyWv-00ADG3-F4; Fri, 20 Aug 2021 07:01:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGyWp-00ADCU-Ks; Fri, 20 Aug 2021 07:01:27 +0000
X-UUID: 9a5c79832aab4afe97a4c6a8cb8edfc8-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WoT5so28uXpanm5Mr3DEjd5ni0qXqCKXK7Jb7N66Puw=; 
 b=XUeBkilp9Wi3LmaZTLFqb14L8W7CakTAm5E0Tq+2GQ+stZkwZ2lNZiVSxIGutgn2PiwLXtgtbdDsUxGiZUiGVZB4ADa3Jvk4Bt9M4QY/XLCz4GFddaSN08mYAc8MwOpkjpOoymY9RYSfKgI091GiR5F06QsVJRww7qMp9A74hOw=;
X-UUID: 9a5c79832aab4afe97a4c6a8cb8edfc8-20210820
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1458993788; Fri, 20 Aug 2021 00:01:18 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 00:01:17 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 15:01:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 20 Aug 2021 15:01:16 +0800
From: <sean.wang@mediatek.com>
To: <sam.shih@mediatek.com>
CC: <robh+dt@kernel.org>, <sean.wang@kernel.org>, <linus.walleij@linaro.org>, 
 <matthias.bgg@gmail.com>, <mpm@selenic.com>, <herbert@gondor.apana.org.au>,
 <gregkh@linuxfoundation.org>, <wim@linux-watchdog.org>, <linux@roeck-us.net>, 
 <mturquette@baylibre.com>, <sboyd@kernel.org>, <hsinyi@chromium.org>,
 <enric.balletbo@collabora.com>, <fparent@baylibre.com>,
 <seiya.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-serial@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <john@phrozen.org>, <Ryder.Lee@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>
Subject: Re: [v2,
 04/12] pinctrl: mediatek: moore: check if pin_desc is valid before use
Date: Fri, 20 Aug 2021 15:01:13 +0800
Message-ID: <1629442873-24655-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <20210817074557.30953-5-sam.shih@mediatek.com--annotate>
References: <20210817074557.30953-5-sam.shih@mediatek.com--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_000123_734597_5002A5C4 
X-CRM114-Status: GOOD (  10.16  )
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

From: Sean Wang <sean.wang@mediatek.com>

>Certain SoC are missing the middle part gpios in consecutive pins, it's better to check if mtk_pin_desc is a valid pin for the extensibility
>
>Signed-off-by: Sam Shih <sam.shih@mediatek.com>
>


>---
>v2: applied the comment suggested by reviewers:
>    - for the pins not ballout, we can fill .name in struct mtk_pin_desc
>      as NULL and return -ENOTSUPP in gpio/pinconf ops.

Thanks for take the suggestion and the improvement.
Acked-by: Sean Wang <sean.wang@mediatek.com>

>
>---
> drivers/pinctrl/mediatek/pinctrl-moore.c | 18 ++++++++++++++++++
> 1 file changed, 18 insertions(+)
>
>diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
>index 3a4a23c40a71..ad3b67163973 100644
>--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
>+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
>@@ -60,6 +60,8 @@ static int mtk_pinmux_set_mux(struct pinctrl_dev *pctldev,
>		int pin = grp->pins[i];
>
>		desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>+		if (!desc->name)
>+			return -ENOTSUPP;
>
>		mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_MODE,
>				 pin_modes[i]);
>@@ -76,6 +78,8 @@ static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
>	const struct mtk_pin_desc *desc;
>
>	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
>+	if (!desc->name)
>+		return -ENOTSUPP;

<snip>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
