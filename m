Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B6AC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 11:02:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 558E1207C4
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 11:02:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LAJC5Kba"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 558E1207C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GzCIAI/JkX3kIS+0FD5rE6n68Vg/6OLzGflrI6VB3ic=; b=LAJC5KbaX94+YX
	JS1PauywGyoXt5oax+u8M1SVtOT3lJVPfvCK7TH0WXfkfLeAZVEFC331nD/gDYV32pdbrARnrdi2g
	qcqdS8/o01s4ZOiACAu7FAf9ZOks2A4SlvnoiVAHw5nxMjf1Zawpo7tOijQYWujDaQ83L8oqUlVSy
	dsydQBwCDuhbI/oXw+llA7dJROwaU4FMy/028Hy9ORcGRaIfwVOOoSfyh6pqLy6sJut3Fdxb8oub5
	cpSlYT33Mxvr0xdkZTBwu1SbVKNJdbQjvTbSYdy/DAdpNYdd5Ai9/qHsNUtfTlKt3gO2xRjshzWk8
	2eo+EjFi6yfKlcI1I9fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl9MP-0001zr-N5; Tue, 16 Jun 2020 11:02:33 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl9MG-0001rK-F0; Tue, 16 Jun 2020 11:02:25 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 3FC5A1C0C0F; Tue, 16 Jun 2020 13:02:23 +0200 (CEST)
Date: Tue, 16 Jun 2020 13:02:16 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Fengping Yu <fengping.yu@mediatek.com>
Subject: Re: [PATCH v1 2/3] drivers: input: misc: Add mtk vibrator driver
Message-ID: <20200616110216.GK1718@bug>
References: <20200615114203.116656-1-fengping.yu@mediatek.com>
 <20200615114203.116656-3-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615114203.116656-3-fengping.yu@mediatek.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_040224_647853_8BB902AE 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mediatek@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-input@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

> +static int mt_vibra_parse_dt(struct device *dev,
> +		struct reg_vibr_config *vibr_conf)
> +{
> +	int ret;
> +
> +	if (device_property_read_u32(dev, "min-limit",
> +				     &vibr_conf->min_limit))
> +		vibr_conf->min_limit = DEFAULT_MIN_LIMIT;
> +	vibr_conf->min_limit = max_t(unsigned int,
> +		vibr_conf->min_limit, DEFAULT_MIN_LIMIT);
> +
> +	if (device_property_read_u32(dev, "max-limit",
> +				     &vibr_conf->max_limit))
> +		vibr_conf->max_limit = 0;

Is max_limit useful? Do you enforce it in useful way?

> +	if (!vibr_conf->max_limit &&
> +		vibr_conf->max_limit < vibr_conf->min_limit) {
> +		dev_err(dev, "error load dts: get error limitation(min > max)\n");
> +		return -EINVAL;
> +	}

Condition looks wrong.

> +static struct attribute *sysfs_attrs[] = { + &dev_attr_activate.attr, + 
> &dev_attr_state.attr, + &dev_attr_duration.attr, + NULL, +}; + +static struct 
> attribute_group vibr_group = { + .attrs = sysfs_attrs, +}; + +static int 
> regulator_oc_event(struct notifier_block *nb, + unsigned long event, void *data) +{ + 

Do you need custom attributes? Why? Where is their documentation?
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
