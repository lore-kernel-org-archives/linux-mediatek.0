Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B811C04A95
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 06:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfnTvI4GdsO3+FNOnQzLcJsES3nFkH0SLT+tjy22q1s=; b=oU3gZyYeI3gOxDvTW2LrqZxbNE
	gXu3+BK4tEy9rUc0eXVPPyv/S0FXwIHIcltjabkZIi7RP2xhsl2/cfTPlOyeO3LniP/fZ6WHaM5BK
	8A27wulnYxxjyPFla8sB0iSWiJVbJmBfXo4xlO07jtNJY5smSejw7o5C5iMqo72k4Rqqtgt+u+kPX
	3BJKmwArXOlvw9N5QN7h42B1uOFDWm/9zq9JRPaqlaAWQNDKzw3YbJJg64Ly7wUnQ2s+b8DfTLKp8
	OSDi3rh2aOdQ8cBjNDO7Uw6sVQ21n5gPkHcZjhsrlYHf2gKxYHnr3tPN1kmFwLLvNJvKlKr4N+GjM
	VgJSCCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onDr5-0044EH-Id; Tue, 25 Oct 2022 06:56:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onDqt-00448E-JA; Tue, 25 Oct 2022 06:55:57 +0000
X-UUID: 2c372f1b733241b184ca1672d4b40e65-20221024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID; bh=CfnTvI4GdsO3+FNOnQzLcJsES3nFkH0SLT+tjy22q1s=;
	b=SzizaYfA8XJzbvIk7BvYYJEc14oPI3xq5b7ZlVdO3D9aYwlTN5h/+2Qx4dBk7m/ph5lat3o4NrzSkKJWS8/zHoK00v1p3FTU+sepLemrA9oLsvbYIE4IW/kZD+qoZH5OQSjZfGd8Huo61nWMNaOiu9q7qGs/p6Kc9HYI1NIbYCw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:4603d3cd-8e20-4846-be92-b9695a9a8fc7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:d6320c27-9eb1-469f-b210-e32d06cfa36e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2c372f1b733241b184ca1672d4b40e65-20221024
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sam.shih@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1986021402; Mon, 24 Oct 2022 23:55:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 25 Oct 2022 14:35:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 25 Oct 2022 14:35:43 +0800
Message-ID: <b5ab84b4d595713588f1d8a68a1585ca3ae5521e.camel@mediatek.com>
Subject: Re: [PATCH 1/2] pwm: mediatek: Add support for MT7986
From: Sam Shih <sam.shih@mediatek.com>
To: Daniel Golle <daniel@makrotopia.org>, <linux-pwm@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 25 Oct 2022 14:35:43 +0800
In-Reply-To: <Y1K5ym1EL8kwzQEt@makrotopia.org>
References: <Y1K5ym1EL8kwzQEt@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_235555_678791_C0769A04 
X-CRM114-Status: GOOD (  19.34  )
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

Hi Daniel:

On Fri, 2022-10-21 at 16:24 +0100, Daniel Golle wrote:
> Add support for PWM on MT7986 which has 2 PWM channels, one of them
> is
> typically used for a temperature controlled fan.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/pwm/pwm-mediatek.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
> index 6901a44dc428de..2219cba033e348 100644
> --- a/drivers/pwm/pwm-mediatek.c
> +++ b/drivers/pwm/pwm-mediatek.c
> @@ -329,6 +329,12 @@ static const struct pwm_mediatek_of_data
> mt8365_pwm_data = {
>  	.has_ck_26m_sel = true,
>  };
>  
> +static const struct pwm_mediatek_of_data mt7986_pwm_data = {
> +	.num_pwms = 2,
> +	.pwm45_fixup = false,
> +	.has_ck_26m_sel = true,

For MT7986 SoC, I think the value of "has_ck_26m_sel" should be 'false' 

> +};
> +
>  static const struct pwm_mediatek_of_data mt8516_pwm_data = {
>  	.num_pwms = 5,
>  	.pwm45_fixup = false,
> @@ -342,6 +348,7 @@ static const struct of_device_id
> pwm_mediatek_of_match[] = {
>  	{ .compatible = "mediatek,mt7623-pwm", .data = &mt7623_pwm_data
> },
>  	{ .compatible = "mediatek,mt7628-pwm", .data = &mt7628_pwm_data
> },
>  	{ .compatible = "mediatek,mt7629-pwm", .data = &mt7629_pwm_data
> },
> +	{ .compatible = "mediatek,mt7986-pwm", .data = &mt7986_pwm_data
> },
>  	{ .compatible = "mediatek,mt8183-pwm", .data = &mt8183_pwm_data
> },
>  	{ .compatible = "mediatek,mt8365-pwm", .data = &mt8365_pwm_data
> },
>  	{ .compatible = "mediatek,mt8516-pwm", .data = &mt8516_pwm_data
> },

Regards,
Sam


