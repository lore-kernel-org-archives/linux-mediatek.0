Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3857CD3C533
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 21:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PplG7VVviuXhuSv+Ud3YH+rqp5m5boGul+BQVv7DV/Q=; b=17qAr+NpvMhKZZl6QTYBjUwLSD
	xnJefFi8wBiXFKGcMlKzHvI/5QQB9E0M+QkOTLS5z+SEicPGBHV+0Xy9OgPczatTo1i97xftap8Eb
	rTOdorJ58tNjQP8J8PIyAPJNszCzsLwF8rAzRqN+MS36TjVTyzCNAJAdZr4wV3N8V/0aHlRtZCZfM
	AIeA8tKvtXzV24gxXN9cwbs3q3Fbc6eu5vmSxdA7io5+Oj1yxSxolOaDSv9Uw5pzogC95He0jsZJF
	iSHAOmjA3VrTfnmnU8dGO+JS6VA99UkLkh0GCkTmUIL9uoBDBkN7OLuIY+CYQ8IQDAiqp38V3B+d/
	2xuntpgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1XfV-0000000GAcm-3eXG;
	Thu, 17 Oct 2024 21:04:25 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Xe5-0000000GATW-0bdZ
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Oct 2024 21:03:01 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a99cc265e0aso185984966b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Oct 2024 14:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729198971; x=1729803771; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PplG7VVviuXhuSv+Ud3YH+rqp5m5boGul+BQVv7DV/Q=;
        b=HFSRg3rOvNUCjmLo3I7Av5F0QSyMTIuF6bWYoS0Rj7EnhLhn8E3eNv1yJfsEBqloyy
         dH7ginnMfQPNhN0C/7qcyW6/gB5/kBsFxw1Sl9CM4LaNu3GMLB7u0WAShlkLkA84HeoC
         kwHnEB2MxA0SrLSCvG+hR6lCArvsq0YCwBz20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729198971; x=1729803771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PplG7VVviuXhuSv+Ud3YH+rqp5m5boGul+BQVv7DV/Q=;
        b=r783Z43nuYQz58QCegQLtp63L+kyCGtUvvPYk6y4pvz0Q3AYayx/JMUV+YR8X/63B1
         Lv6u0J4q4XO4+diFh/wYouuMTNoVUM5OXskA4xgS1f5xHikENRY1x+DN5mohBetxpAwM
         8lcyZ8G4sIf6KM+Z5vUI7EKN7BF6dgB2fttz0Cbuw/7wORVzKN3lga9MRn1FkD/I8ldF
         gI3Iom9Q9SjdXIM6rW0e+FCCSWmaW71Li/Ok5yNSfJF83zzL4AqF0C+ZbwshKolEUShS
         JP9zqFt+kYCVqnK4C0igecCSHcJwuWcPL0ksg2uou3173AK98GTaxDT81kykcmJiMUXB
         Q9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXfpqgBCGLWM5DYKKvBexbbq9TgUB+hXlIBklN1gyYykvZ64uAM3PFr9Ca31VXeGvMU4ZKkaX1LAOz3bJAwqg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy92RVK3Yhr8K2YTLm/OzeDsio+dsGioFURiBv/+WnQh3V9G2Q2
	tYhOsUCMNyNXxCNw9Ej5liaMj+tQ6gEvmJ/gYfZyQiW/Ebe+qYgS2v1gLUl63jsnwqI+18rLMjV
	c7w==
X-Google-Smtp-Source: AGHT+IH0sd76NmH2lIhORq77l7oyIbCbcqgHq+T0c4FHlrx4SsXtHJklveNALR2N7VW0WVDhnaErxg==
X-Received: by 2002:a17:907:9801:b0:a99:42e7:21f with SMTP id a640c23a62f3a-a9a69b7ae47mr7281766b.37.1729198970986;
        Thu, 17 Oct 2024 14:02:50 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68ad4da2sm13094166b.56.2024.10.17.14.02.49
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 14:02:50 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so894123f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Oct 2024 14:02:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWs9Z8SAfybVYxJh7/XYMHyjStNJsFWypGoD1zTq3Ni6/MiamZulzlmdrxXLlhim8hYlyAbE8N/8azv+4e9mQ==@lists.infradead.org
X-Received: by 2002:a5d:45cd:0:b0:37d:39c1:4d3 with SMTP id
 ffacd0b85a97d-37ea21de065mr215420f8f.6.1729198968725; Thu, 17 Oct 2024
 14:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241017094222.1014936-1-wenst@chromium.org> <20241017094222.1014936-4-wenst@chromium.org>
In-Reply-To: <20241017094222.1014936-4-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Oct 2024 14:02:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vy6q-nPZ99k7t8-G_osefg=0jxPUWm8F1uhtVw0xDvxg@mail.gmail.com>
Message-ID: <CAD=FV=Vy6q-nPZ99k7t8-G_osefg=0jxPUWm8F1uhtVw0xDvxg@mail.gmail.com>
Subject: Re: [PATCH v9 3/7] i2c: Introduce OF component probe function
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_140257_193171_D53A8FC7 
X-CRM114-Status: GOOD (  43.09  )
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

Hi,

On Thu, Oct 17, 2024 at 2:42=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Some devices are designed and manufactured with some components having
> multiple drop-in replacement options. These components are often
> connected to the mainboard via ribbon cables, having the same signals
> and pin assignments across all options. These may include the display
> panel and touchscreen on laptops and tablets, and the trackpad on
> laptops. Sometimes which component option is used in a particular device
> can be detected by some firmware provided identifier, other times that
> information is not available, and the kernel has to try to probe each
> device.
>
> This change attempts to make the "probe each device" case cleaner. The
> current approach is to have all options added and enabled in the device
> tree. The kernel would then bind each device and run each driver's probe
> function. This works, but has been broken before due to the introduction
> of asynchronous probing, causing multiple instances requesting "shared"
> resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> time, with only one instance succeeding. Work arounds for these include
> moving the pinmux to the parent I2C controller, using GPIO hogs or
> pinmux settings to keep the GPIO pins in some fixed configuration, and
> requesting the interrupt line very late. Such configurations can be seen
> on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> Lenovo Thinkpad 13S.
>
> Instead of this delicate dance between drivers and device tree quirks,
> this change introduces a simple I2C component probe function. For a
> given class of devices on the same I2C bus, it will go through all of
> them, doing a simple I2C read transfer and see which one of them responds=
.
> It will then enable the device that responds.
>
> This requires some minor modifications in the existing device tree. The
> status for all the device nodes for the component options must be set
> to "fail-needs-probe". This makes it clear that some mechanism is
> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v8:
> - Added missing include of <linux/kconfig.h> to i2c-of-prober.h
> - Expanded description of i2c_of_probe_ops::enable to mention that
>   returning -EPROBE_DEFER is valid (Doug)
> - Reworded descrption of i2c_of_probe_ops::cleanup_early to avoid
>   confusion with i2c_of_probe_ops::enable (Doug)
> - Reworked i2c_of_probe_get_i2c_node() to return NULL on failure,
>   matching most functions that return |struct device_node *|.
>
> Changes since v7:
> - Dropped log level of "enabling component" to debug
> - Dropped file name from header file
> - Reverted to __free() cleanup for i2c bus node
> - Corrected "failed-needs-probe" to "fail-needs-probe" in commit message
> - Fixed incorrectly positioned period ('.') in commit message
> - Expanded description of i2c_of_probe_component()
> - Expanded comment explaining check for "available" devices to note that
>   if such a device is found then the i2c probe function becomes a no-op
> - Simplified check for "available" devices for-each loop
> - Expanded description of @free_resources_early callback to explicitly
>   state that it is not called if no working components are found
> - Dropped !cfg check
> - Replaced "fail" with "fail-needs-probe" in i2c_of_probe_component()
>   kernel doc
> - Combined callbacks (.get_resources with .enable; .cleanup with
>   .free_resources_late); .free_resources_early renamed to .cleanup_early
>
> Changes since v6:
> - Correctly replaced for_each_child_of_node_scoped() with
>   for_each_child_of_node_with_prefix()
> - Added namespace for exported symbol
> - Made the probe function a framework with hooks
> - Split out a new header file
> - Added MAINTAINERS entry
> - Reworded kernel-doc
> - Dropped usage of __free from i2c_of_probe_component() since error
>   path cleanup is needed anyway
>
> Changes since v5:
> - Fixed indent in Makefile
> - Split regulator and GPIO TODO items
> - Reversed final conditional in i2c_of_probe_enable_node()
>
> Changes since v4:
> - Split code into helper functions
> - Use scoped helpers and __free() to reduce error path
>
> Changes since v3:
> - Complete kernel-doc
> - Return different error if I2C controller is disabled
> - Expand comment to explain assumptions and constraints
> - Split for-loop finding target node and operations on target node
> - Add missing i2c_put_adapter()
> - Move prober code to separate file
>
> Rob also asked why there was a limitation of "exactly one touchscreen
> will be enabled across the whole tree".
>
> The use case this prober currently targets is a component on consumer
> electronics (tablet or laptop) being swapped out due to cost or supply
> reasons. Designs with multiple components of the same type are pretty
> rare. The way the next patch is written also assumes this for efficiency
> reasons.
>
> Changes since v2:
> - New patch split out from "of: Introduce hardware prober driver"
> - Addressed Rob's comments
>   - Move i2c prober to i2c subsystem
>   - Use of_node_is_available() to check if node is enabled.
>   - Use OF changeset API to update status property
> - Addressed Andy's comments
>   - Probe function now accepts "struct device *dev" instead to reduce
>     line length and dereferences
>   - Move "ret =3D 0" to just before for_each_child_of_node(i2c_node, node=
)
> ---
>  MAINTAINERS                      |   8 ++
>  drivers/i2c/Makefile             |   1 +
>  drivers/i2c/i2c-core-of-prober.c | 182 +++++++++++++++++++++++++++++++
>  include/linux/i2c-of-prober.h    |  75 +++++++++++++
>  4 files changed, 266 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

