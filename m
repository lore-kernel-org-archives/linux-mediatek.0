Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8826C001DC
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jul 2023 17:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1vPYh+RBZ0E0Mk1ojSUtBjCV8F9zDSzqFOeRor6Gi8=; b=KeN9qFl7ZExd+H53rLeJRImXi+
	F9oNHxKi3G0Sxn1+LyRhaOORqU1CRun5/VntQEKF2uAhtuF5ViUsJS3rBJRCaXl//imBU0yJiLiMc
	MrmLvtLaplbSloNaeuDmDD79WxR2yRGOhwRLt7qClz4k5o8s/dRc7ExuC05CcYfku+gMvNvF4MCdV
	6oi1vhYckYAKgpMJmK8BgUT3OFwvA6xsi1W4SBBhXIx0tPm/waN3HU53vaQ0SRcE4JCnpnxfLhCqc
	K8ywKDA7/Ujpe9jksGkg/rbVVhYH9dTfWFMCAA+8rwaRSpIiqiqICzDfgwrGsUZ2gwnGo1nHts44Q
	kay70JOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPo27-008Hgm-1W;
	Sat, 29 Jul 2023 17:47:15 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPmyq-0083nj-0I
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Jul 2023 16:39:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9200B1BF207;
	Sat, 29 Jul 2023 16:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1690648783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q1vPYh+RBZ0E0Mk1ojSUtBjCV8F9zDSzqFOeRor6Gi8=;
	b=Ca6970Xdd0mzheJuqr9TNeSO6LKpUu9ThBv1MtHWD7tc1raBHhvJ7bI8jhDK0Sqe+Fide5
	7+g08PbWPKt+CDHhFWYXfHKSGb5/ZjFk/ujaGX312s1TLnomUi4ncg3mrnEY4HWOlSc5rm
	J9vmrWUYbRDzSuFh5BuU2yYRELwxBfPRB2mLKZzWjfdXr1X2qI1UHaCou3sAqXwSLLyOjX
	89f8AMiI3sHBdBnGeztvJe+WonGDh/DnOxDlKM+wELQvP5JNi493OVoCQeMIYaWsbIjhqh
	WXKWLM/9G9cpd+SqesY1QO9TTGfursygGS977NuPwrC/6Q5huqyh6pJ+MJmAAg==
Message-ID: <2eb012d9-0d36-54c6-6f2c-1a286d45c497@arinc9.com>
Date: Sat, 29 Jul 2023 19:39:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mtmips: support requesting different functions
 for same group
To: Shiji Yang <yangshiji66@outlook.com>, linux-gpio@vger.kernel.org
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
References: <TYAP286MB0315A9671B4BA0347E70D9E0BC00A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <TYAP286MB0315A9671B4BA0347E70D9E0BC00A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_093948_300330_8AA3D31C 
X-CRM114-Status: GOOD (  22.50  )
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

On 26.07.2023 03:48, Shiji Yang wrote:
> Sometimes pinctrl consumers may request different functions for the
> same pin group in different situations. This patch can help to reset
> the group function flag when requesting a different function.
> 
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
>   drivers/pinctrl/mediatek/pinctrl-mtmips.c | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtmips.c b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> index efd77b6c5..e5e085915 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> @@ -123,11 +123,24 @@ static int mtmips_pmx_group_enable(struct pinctrl_dev *pctrldev,
>   	int i;
>   	int shift;
>   
> -	/* dont allow double use */
> +	/*
> +	 * for the same pin group, if request a different function,
> +	 * then clear the group function flag and continue, else exit.
> +	 */
>   	if (p->groups[group].enabled) {
> -		dev_err(p->dev, "%s is already enabled\n",
> -			p->groups[group].name);
> -		return 0;
> +		for (i = 0; i < p->groups[group].func_count; i++) {
> +			if (p->groups[group].func[i].enabled == 1) {
> +				if (!strcmp(p->func[func]->name,
> +					p->groups[group].func[i].name))
> +					return 0;
> +				p->groups[group].func[i].enabled = 0;
> +				break;
> +			}
> +		}
> +
> +		/* exit if request the "gpio" function again */
> +		if (i == p->groups[group].func_count && func == 0)
> +			return 0;

Could you help me understand why? The @gpio_request_enable operation is 
not properly implemented on this driver so this check would never be 
true, no?

Even if it was, this makes it so that if a pin group is already given a 
function (meaning the pin group is enabled), it will never be given the 
gpio function when requested, unless I understand it wrong.

Arınç

