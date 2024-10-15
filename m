Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8B7CFC273
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 07:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaW2sa/1ZxtztZoldWmZYhD7VcMhjqCGkrdW4rioaxc=; b=qbisz3R2eYbPBX3nqD0Ncwqjll
	t5tTMMZ0tsjka1VbTltbC4wJt8aeXcBH5bOPzxnly2J+9VIcbV3ITtjGDdZjsqAF56VY63lk2hNmy
	dXBFnb0sarRBgr4JrNh56AAbAvldCjYqGrHQFXMu6mTeK4YLhUVZA+EfpvGsJcbj6xOqV3w5nMTpE
	hVGuI+fKVLLDTdPYQ3iJQ+A1EaveTt+G02tNmYAEMstqSUcMtHQ2WvDIcJtEnozJ6v4ilD5narbrd
	e2qDy9XxJPFSE37bBV9APN0Edg/6sclLqo2ZeTfy0szEe8YJv7g/HhgSpDAzLzF6Drz1fMVGNH1FB
	1Koa1Rsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cL4-00000007OUU-0qM7;
	Tue, 15 Oct 2024 07:51:30 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cL1-00000007OTj-207y
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 07:51:28 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-717d2b8c08aso1935212a34.1
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 00:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728978686; x=1729583486; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aaW2sa/1ZxtztZoldWmZYhD7VcMhjqCGkrdW4rioaxc=;
        b=VlHBof3NbyLoCg8wOufhmynCQAKBTvsmCZns4AByFVrVmqrPWzvAgq8esGDhomNk4F
         B0WDwyBM7tnpXd5sziQuqpAHjP2orZKv0fKMxfQf5VlKtzY8Ll8JKha4GWgEKLi6XctR
         1ROPcWrJcOQykrwTU3SWVeGKrFEuTd8ZK9rGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728978686; x=1729583486;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aaW2sa/1ZxtztZoldWmZYhD7VcMhjqCGkrdW4rioaxc=;
        b=hwsRPtbvKKTxGT7ot+INz16OoCP/F/Noig6DbltyQmFXBzX61gyqbmHnqq3BuWf/8n
         xxsh3eneztwGO8XD8xUonmyst0JS6aijBKcth1WmcrjF0IDXt3QFgn5dlaFPKnDRzcNn
         UlBpyXEvcXKsdlCs4Mn4CLy7ePVV3pbGZimuqMfQnFTJk9kzz6EaLkjOk6C99Z9SnaTH
         7mVbiJYsJKpYgekwfeEwfsfUrKp0AOHTcBf2z3YJzgwsVibRhv3GjjcUDX95h7zrxL/v
         rDPWFI3iWzNferghUX6nSgm8ktIxUhXOlpwojVzy3za2lr6GjVn2TfuZCaUZMknW3Y7R
         a25g==
X-Forwarded-Encrypted: i=1; AJvYcCUp2ibMgY9HU/nA5MWN0X6Yde+Y0oa2Q0E15TmWKm+xHx5BlcFzJ4+dSha44hdxEAOBjqDPzcLS24JagYcXnw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8bPve+cVQIIIt+cHZSqBOeZ8CDfczXu4JY+SQMKmbiAaHHI82
	FFE6U0Ra0jaxWcwsB9qaFeG3vke5PzR9GK9Er/BvS8ErA0mohQkGaCREX0GMmg==
X-Google-Smtp-Source: AGHT+IEfvWKZ1jcEyU30hF3ZW6BxaiMzf1hjuhVYl88Vngg8HNiMsojaXq2qzSwNVqU01VmSdulBrA==
X-Received: by 2002:a05:6358:52c5:b0:1b5:a38c:11d1 with SMTP id e5c5f4694b2df-1c32bc8c0f9mr537792955d.26.1728978685952;
        Tue, 15 Oct 2024 00:51:25 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:f99b:9883:3b88:182a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c713432sm730557a12.83.2024.10.15.00.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 00:51:25 -0700 (PDT)
Date: Tue, 15 Oct 2024 15:51:21 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 7/8] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <20241015075121.GA292890@google.com>
References: <20241008073430.3992087-1-wenst@chromium.org>
 <20241008073430.3992087-8-wenst@chromium.org>
 <Zwfy6ER6sbr_QxsY@smile.fi.intel.com>
 <CAGXv+5FAhZQR+Tah_6Qxp4O7=x2RawfWuMh29_FT4mGQGQF84w@mail.gmail.com>
 <Zwz_p3o1PJF6sl2Y@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zwz_p3o1PJF6sl2Y@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_005127_569848_9AA4E71B 
X-CRM114-Status: GOOD (  26.61  )
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

On Mon, Oct 14, 2024 at 02:25:27PM +0300, Andy Shevchenko wrote:
> On Mon, Oct 14, 2024 at 03:04:44PM +0800, Chen-Yu Tsai wrote:
> > On Thu, Oct 10, 2024 at 11:29 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Oct 08, 2024 at 03:34:26PM +0800, Chen-Yu Tsai wrote:
> 
> ...
> 
> > > > +static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
> > > > +     .cfg = &chromeos_i2c_probe_simple_trackpad_cfg,
> > >
> > >         .cfg = DEFINE_I2C_OF_PROBE_CFG(trackpad, i2c_of_probe_simple_ops),
> > >
> > > Or even
> > >
> > > #define DEFINE_I2C_OF_PROBE_CFG_SIMPLE(_type_)                  \
> > >         DEFINE_I2C_OF_PROBE_CFG(type, &i2c_of_probe_simple_ops)
> > >
> > > > +     .opts = &(const struct i2c_of_probe_simple_opts) {
> > >
> > > Perhaps also DEFINE_xxx for this compound literal?
> > 
> > I think it's better to leave this one as is.
> 
> Using a compound literal like this questions the entire approach.

I don't follow. It's a valid use.

> Why you can't you drop it and use the static initializers?

Did you mean split that part out as a separate variable:

	static const struct i2c_of_probe_simple_opts
	chromeos_i2c_probe_voltorb_tch_opts = {
		.res_node_compatible = "elan,ekth6915",
		.supply_name = "vcc33",
		.gpio_name = "reset",
		.post_power_on_delay_ms = 1,
		.post_gpio_config_delay_ms = 300,
		.gpio_assert_to_enable = true,
	};

	static const struct chromeos_i2c_probe_data
	chromeos_i2c_probe_voltorb_touchscreen = {
		.cfg = &chromeos_i2c_probe_simple_touchscreen_cfg,
		.opts = &chromeos_i2c_probe_voltorb_tch_opts,
	};

Instead of the following, which is slightly shorter, and gets rid of one
explicit symbol name:

	static const struct chromeos_i2c_probe_data
	chromeos_i2c_probe_voltorb_touchscreen = {
		.cfg = &chromeos_i2c_probe_simple_touchscreen_cfg,
		.opts = &(const struct i2c_of_probe_simple_opts) {
			.res_node_compatible = "elan,ekth6915",
			.supply_name = "vcc33",
			.gpio_name = "reset",
			.post_power_on_delay_ms = 1,
			.post_gpio_config_delay_ms = 300,
			.gpio_assert_to_enable = true,
		},
	};



ChenYu

> > Not every entry will
> > use the same combination of parameters. And having the entry spelled
> > out like this makes it easier to read which value is for what
> > parameter, instead of having to go up to the macro definition.
> > 
> > For comparison, this entry uses just two of the parameters, while for
> > another platform I'm working on the full set of parameters is needed.
> > 
> > > > +             .res_node_compatible = "elan,ekth3000",
> > > > +             .supply_name = "vcc",
> > > > +             /*
> > > > +              * ELAN trackpad needs 2 ms for H/W init and 100 ms for F/W init.
> > > > +              * Synaptics trackpad needs 100 ms.
> > > > +              * However, the regulator is set to "always-on", presumably to
> > > > +              * avoid this delay. The ELAN driver is also missing delays.
> > > > +              */
> > > > +             .post_power_on_delay_ms = 0,
> > > > +     }
> > > > +};
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

