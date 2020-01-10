Return-Path: <SRS0=J4iI=27=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA585C32771
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 01:20:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4BB720678
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 01:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LMpWEpgj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQ9PP0kq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4BB720678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYV95w69yN3tp4iX49DFXYUgqN4wZSpKSsZFZOJ4WyM=; b=LMpWEpgjDS87Tf
	ECb7f4RV/uqLCNa2weZaxWnfrxma0sZWZ+u6aBtJ9R9bepC+QbPM8DuOXxUQTUlbCLk60Plcel1NQ
	EaKX4khXsP3nI7qMecTPDD+Np/jYfacpgIuqECJmQjP8ya3O7ndu6a39eP9CzgpWl/wjpoZW7WFLk
	KQzvgDnQOf2u5pePZb7QuvBFozhKqesgoYi2PbNyDyxX6eYS6bMN/rOU/n1CGZ+Pfebl56KFZWSDz
	yaABGbSa2UpuobaH2FxCyFLC/9gZ3qG17afw/P2JT556T5hbYxPY1oAQpaij2bsXBl/dfd2HHWpmW
	nHXcb6Biw3n8LeX5m86w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipiyJ-0008R6-LL; Fri, 10 Jan 2020 01:20:19 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipiyH-0008Q6-4e; Fri, 10 Jan 2020 01:20:18 +0000
Received: by mail-pf1-x443.google.com with SMTP id x6so270951pfo.10;
 Thu, 09 Jan 2020 17:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7qHBXesr8QwkRbtaOO3IQUgTasNvUcS3WaDX6rref+o=;
 b=VQ9PP0kq9emuyO9zctbmMsV5NyHq8XW7Vh1JXS/aXmo4wPrzwkuuIr6EyjoK+/J9KT
 TzGek5TwC27brWx80ESHo4XMoWZ9S71kKr3hpupVLRGrXrJw555pViT1X19RgwfzoIrE
 Vgfht5QpYcYU8/+Bd7km+YAkVQ4FN8Bb5EASTSP4SzakzJg0HABpOIPpvcXjf6bXVUfr
 PH2RMEQ9kWfbabqRKgszqenRNh+xCrw72EO4G64fRS1uv5QMyQJne+0Ut3o0sUd5nnA3
 4sVpFmWTicK1mdCP/05JPz1XWI9uQD/ORIeS9sOy0xK6F+OvX0zAwzimukIcDkHKhZm0
 k5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7qHBXesr8QwkRbtaOO3IQUgTasNvUcS3WaDX6rref+o=;
 b=KBjGchaNpc/zWSTmAQ22fv/LAKKiyahGfzxzwt/xP7tAfAyDx4JhC7mIV7sXJSFQCp
 c5PtkGd1RwBoUqa30EWlQoO7BxjPje1qzJnMynKaoOw/0hQxRR4HbAq5+p7xzuKyiFXb
 uDJ05OInji4CADJUQlsjE6hICWOO6SfJXTXGMt95yNt8Ki59jozWbDM7MkUMBSujFW88
 AV965l78U4zhWHTLHAPZA1sEErKVXflUth27PkNFCqhKjrHSc7HHwdrf3GbWoWmpETAC
 5uNHuIp99GtzILs/6kD2urMd3NuH1RhOZgaZ+ZafixyBKx0fMCKTo2+3XU7buPLx/63k
 gcQQ==
X-Gm-Message-State: APjAAAV7aaKP8lCdyG3Rux2hWy7sl4+cp55eUarLtiSq04e2c6gFnTgX
 Djjy+CISOhtjtiLDid8yWiE=
X-Google-Smtp-Source: APXvYqyrq1wKaVn4zIBzDao2JVWanRP644J1Yd9W7FW2nZwgfcda20aUAmsP0hDomJYYu/i1QhwmcQ==
X-Received: by 2002:aa7:8ad9:: with SMTP id b25mr926611pfd.70.1578619216147;
 Thu, 09 Jan 2020 17:20:16 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id b1sm283458pjw.4.2020.01.09.17.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 17:20:15 -0800 (PST)
Date: Thu, 9 Jan 2020 17:20:13 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH V2 2/2] drivers: input: keyboard
Message-ID: <20200110012013.GR8314@dtor-ws>
References: <20200108062923.14684-1-fengping.yu@mediatek.com>
 <20200108062923.14684-3-fengping.yu@mediatek.com>
 <1578473162.12131.13.camel@mtksdaap41>
 <20200108112609.GN32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108112609.GN32742@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_172017_185969_647693E9 
X-CRM114-Status: GOOD (  15.49  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jacky Bai <ping.bai@nxp.com>,
 wsd_upstream@mediatek.com, Stefan Agner <stefan@agner.cn>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>,
 Anson Huang <Anson.Huang@nxp.com>, YueHaibing <yuehaibing@huawei.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 linux-input@vger.kernel.org, Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Thierry Reding <treding@nvidia.com>,
 Valentin Schneider <valentin.schneider@arm.com>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Maxime Ripard <mripard@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Aisheng Dong <aisheng.dong@nxp.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 fengping yu <fengping.yu@mediatek.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 08, 2020 at 01:26:09PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 08, 2020 at 04:46:02PM +0800, Yingjoe Chen wrote:
> > On Wed, 2020-01-08 at 14:29 +0800, fengping yu wrote:
> 
> > > +	tasklet_init(&keypad->tasklet, kpd_keymap_handler,
> > > +		     (unsigned long)keypad);
> > > +
> > > +	writew((u16)(keypad->key_debounce & KPD_DEBOUNCE_MASK),
> > > +		     keypad->base + KP_DEBOUNCE);
> > 
> > You use a 13 bits mask and set it directly to KP_DEBOUNCE register. Are
> > you sure the debounce unit is ms?
> > 
> > > +
> > > +	/* register IRQ */
> > > +	err = request_irq(keypad->irqnr, kpd_irq_handler, IRQF_TRIGGER_NONE,
> > > +			  KPD_NAME, keypad);
> > 
> > please consider using devm_request_irq, otherwise you have to free it in
> > _remove function.
> 
> No, you may not use devm_*_irq() when tasklets are in use. There is a nasty
> race condition.
> 
> Actually the rule of thumb is to NOT use devm_*_irq() unless you exactly know
> what you are doing.
> 
> P.S. Why simple not to switch to threaded IRQ handler and drop tasklet? In such
> case devm_*_irq() is fine.

Actually, we are simply reading iomem data and forward it to input
subsystem, there is no need to use threaded interrupt nor the tasklet.

Thanks.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
