Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2099CCD184
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Oct 2025 05:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6S63uReOFquePjk+el+IDhyWrHQTPL8Zy49l1W17no=; b=r1nvP9u4j5bhdOZCoVYUlY5jqm
	4Svq/zMx/76JWvmANZvGMsI7j4j6K2S+ib3mzHXqH+C6ugGRiH8wEFYgdiyo/JDnqvMbJqMdDnkuC
	moWJg+SVkLWAkFl1OMt1nv66TyPZV2RWfz6Uo0kFELajL7Ft6jUcM4uBfEr+WMXRVvePT/spyzUvv
	Tr+6zFh/pBOlrPqe4mdAKfhxw7bLbjNLOXPvqzNBXL8L3p+RbEIYlWVYyUdF6OmtQTg0RsCZ8Ibg+
	t6rtSG4o3Oh8wJuvX18i53GPhgaBH9KFU/UECvEwCU0cBc3n2q311mkx5rPixkx31LtLW7I5WGd7X
	FCFiOn9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9crX-00000006bi3-0wPl;
	Fri, 17 Oct 2025 05:18:47 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9crU-00000006bgU-0UJA
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Oct 2025 05:18:46 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-781001e3846so1487511b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Oct 2025 22:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760678323; x=1761283123; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l6S63uReOFquePjk+el+IDhyWrHQTPL8Zy49l1W17no=;
        b=fn9pUa1+NX5CQG1g2GuzdLtXFzqBVEVeMFF8eqQOCixb3EoL04Zcns8y/eo/M4mwxg
         F5Y3ls7ZoNEsVJxKZLvkB70ABSMcwUUH1JXj71ZdJ9KJe7cgnvl61MmJ1MBSMBquPwD2
         2C6BRpc1xf/i5yq8E2TASZx6/FdZxz02rpmwQyIbF5fv0MZlLieb90JnMSamwZvl6QDb
         BMQyHGw9+jyfqVUuHmASn1L+zpuBB5qXvtnfaqOpkSJ6uxyufx07JWNlSsHebtFu7xhI
         92PpkDmOWkVBGqu1pxT8CXSb6rAtB8+gRnEW4rdbgjSntUCm0/ZgkaETD2fFyaVz6uVW
         xe9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760678323; x=1761283123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6S63uReOFquePjk+el+IDhyWrHQTPL8Zy49l1W17no=;
        b=TKhmiKj+O+kDq6YsVhJqBg2UMEGC6+zvJoUuYf15nkgK73JiYWWkx40tM52pVZcGTq
         wwhz4JqSur2bNXLXy3s67qhT1BR2IIs6e/mucyYboPlFvo5afZGWDueer4l/RyU5EChU
         sHsvrKKqEHLL5JYc6WnXbmPDwE1SZw2DIbMnZwC2laNFeM6/1hKb9178ZkHXJISjFoVm
         ItmYqLkCLxlL4o7VOymvFyjxfhRT3HLX1aq8VKrQW21E4j14rfuZcOVRwWu5nTpOai57
         KHDolirQd1M9NYppQXBwIqLACfKOQU6zs9qZ7mTzo+Lpk8vNQTAr1IcLmYhaxx/kihPl
         9iOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYJ3EyOiPerdZu+TTbzpFse+FwJIgfW4UDHeZTU8sSQV1M+erSGhFaAM4JpKebQFGocJiMSMbU7DcgvXg8UQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5llQquRG828M67EV0hNQ//1ntKFDPFJR9MUtvR9Cax+qSlqxP
	rWaUw+kDbUBFnbCq3RNy3/kOv/0kSy7lNLfgABZFmW6TgpjAYb89uz0P
X-Gm-Gg: ASbGncuC2kFbB26rI6XrwXAG2vvIJ8nhIYZ+QeqIFjHjBJlMMGma7D4WZozNEpy4pfz
	vim/rQaP9QS/OmbIL4hhb+Z2H1t84cxakKhjwtNdkgPVtlwh4fxNhYViIIlP2a41gAc2oHlBuyZ
	/ORjdsqGquIhFQB1M3fb+KbvFRiP7GwoQ0XeIY1pr84g9/Sz2RDOsswXb/Anv1zFE6tQESiOFdH
	aqyc/qB3keMdZxkyprlYpibg6XSg22nYhiWEiivkZ8oZnY0PwPb+9qb64/ufuX7fGJL51d/YD9f
	1S9RvjrXleErwAmAmIpMzfcBl93q/5LwhYlVhOtBYZktUo6ReTtnRpz6/Hv97sU6yxC2epdHxzs
	K/zPfnZyb8D+B5bhVBu4hEgFWrMW7FpiaNIbHT7hxfXusx2nf8MC7rjGIXQY522eMbRVr4HisMO
	e8Uajh9KxDgUZvKN4wzCxuqcd/5ES9pDvTaMCgXZi85A6J8w60t3I=
X-Google-Smtp-Source: AGHT+IEoZYavaM7njBnG3D3Z+hduFKNotyz+5aU6kPX8BleR1uI1Sy5GSDkuztm0nYl05g784spRlg==
X-Received: by 2002:a05:6a20:9185:b0:32d:b946:dd20 with SMTP id adf61e73a8af0-334a8566437mr3249260637.24.1760678322944;
        Thu, 16 Oct 2025 22:18:42 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:df8a:9eba:d1a8:6b39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d993853sm24177361b3a.74.2025.10.16.22.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 22:18:42 -0700 (PDT)
Date: Thu, 16 Oct 2025 22:18:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Julien Massot <julien.massot@collabora.com>, 
	Jacopo Mondi <jacopo@jmondi.org>, Daniel Scally <djrscally@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Martin Kepplinger <martink@posteo.de>, 
	Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
Message-ID: <xirb6664gow5ldjy7xihkz2wooidbm4bsyl7qrm2uosdybdki7@mqkdqzeznx6h>
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_221844_161895_14E2E565 
X-CRM114-Status: GOOD (  10.34  )
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

On Mon, Oct 13, 2025 at 02:14:41PM +0000, Ricardo Ribalda wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR()
> 
> This patch fixes this cocci report:
> ./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Applied, thank you.

-- 
Dmitry

