Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8C7CCD183
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Oct 2025 14:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BF1nvJKgerbunlxq6rI58NsjqwKmmQvTj5E3RRtPIQ=; b=S1Xi96MgeC+6vnE3Wsxm1iM2Wu
	CDcrbrZkDqwTIkXjQWbCRD6qhLbNSdEaoEDuLolVUfcnZzmlD4HLOOdIQ+C6v6WF9Pi2VECZDIWk3
	zpCN0eJFZDYBM4Kbfbv0x30FbWMXFyYftCBnETtErx3dSAV8eGYUhIwjWGgPkQ3BqFSOMJHuMkXhv
	d4m7W3E10QPQSgDX6OlciFLGs9PeJlX9+/JxT6Rm8WRhRw1k59tOzWZxSlEnxAahjoM50qZpAaFeT
	ve4lmAs5tdunjSw6dTRENFtHw9j0aq9H5dnVg8acBmLq/ElU2GhPbCi+mFmh0caTJ3N9fxV4YjSiJ
	+uvZtrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JlU-0000000DTDI-3B1L;
	Mon, 13 Oct 2025 14:43:08 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JlS-0000000DTBv-2Cud
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Oct 2025 14:43:07 +0000
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-54a81bf36ebso746689e0c.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760366584; x=1760971384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BF1nvJKgerbunlxq6rI58NsjqwKmmQvTj5E3RRtPIQ=;
        b=cAo744SBCaXnfdxUBn7CrfgSGNwBfz5fTwvAnLWtkTK51pWEuYCCQQ1GEbB4ZOUkYA
         mz5W9SYlCtpZbR92L+VxTwkhFq5XmThketVvRabKT4WDvljqo6KeYZ6dqMb5an6OnwkV
         7QI4PQKq1znwWefCGmDOZhi1+0mGO/3tYHKZCpJqOgQTokZKY7Zl8K/Xumil0wQEaL6h
         OIQjZ50z8noZkoBsV/Quv5of9Hm475pCrYGy00Vhtah/ig9BEzMeP8OY1l4lkRL+1iG2
         bzqTmh1s+vRe+k8zMXSajPdihHCuh61Hh4lXjbdcNtr3ki87F9Gy3MIVAleSZql/2y/y
         2GYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKsUvYEgYMz0JG1z0iCBojVMPpuH5cDE9HSBmW/TgLLnKmzCr2uqFbzd6iLYKeZ1MKXTDw0DYp4lXPzuZ0FQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp0SyKXaxs3fcgi0rvTyIxOrY4ok/eOhU69pkJ9UvmtHKi3ZIF
	vjawH3NBWoMCF4AGJV49B+b3EDWm/uhdf8K/5bWs/bCHd/7E0WYDqYKwa60NlyMr
X-Gm-Gg: ASbGncvZz9Mjk/Zuu8A0nSIo2o2drDv2wJEFdRk2/TRlOo9GwadOJXO8338MiTX6QMq
	HDT7e+RN8B9Tnc5nX6RfpTXQbT5U2u742vGe40GKp1s3aPcJXNhXAT6ISSwH4PmHjrY0udKzWrX
	1tqDSKZfxHr2/3zQ9ZyJSFUN2vbf3YbMzLD37Se1hb8mKgsn1jjD4QDNEilNw/IVa3x2gI0Z/BQ
	qA9AFCDYqHlbGIGy+62w4cXja+0ENZmiG0RxYShXsP9pUo7mufA1Kake5YtDLC9fWBytYWhwql9
	stN9dYS1E+r2wvVQd3TD1jkZrZCL7kSkR6pWyifBXlJe6EZR7SOXsgw9LI/LLPp8yTXiaA+S+U/
	ijrF2bIX7rVSSjHlwxjyMVjhirs8w7h4kVh0KSFQ5wlxXmHTJ59BvutwqPK06wF6GrcNxr4TKV/
	32VKs=
X-Google-Smtp-Source: AGHT+IEQUfPOOUG3YwN7qZv0PqD90+Rp8e9qeYSsuqBKDIqpJ+y6WeG1goZGxOyzqIqkdBExeAmKpw==
X-Received: by 2002:a05:6122:3296:b0:54b:c31b:9380 with SMTP id 71dfb90a1353d-554b8b7e58bmr8176562e0c.10.1760366584121;
        Mon, 13 Oct 2025 07:43:04 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d7ecf564sm3107430e0c.2.2025.10.13.07.43.02
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 07:43:02 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-930a1bb7b50so1498273241.1
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Oct 2025 07:43:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5rzsmSt/ak1wbdX/7YhUDIEkNUi4L5aJ++Gcx+3Z/zdcY5wuRSx5cV0yY7l/JonGJ0UNDt+0Ht7F4Q4bYbg==@lists.infradead.org
X-Received: by 2002:a05:6102:598b:b0:521:57e7:3b19 with SMTP id
 ada2fe7eead31-5d5e23ad946mr7466194137.25.1760366582403; Mon, 13 Oct 2025
 07:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org> <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
In-Reply-To: <20251013-ptr_err-v1-27-2c5efbd82952@chromium.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Oct 2025 16:42:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUw4x4GxxZ+m+108rp+_uiuiNFHO4Vtrd3vftb_LwmCLQ@mail.gmail.com>
X-Gm-Features: AS18NWDbEQGWUFg0r_aGxPQP6vUjubUz4v9cHDpfk8kXxZq-lj2695LEwK7MQ10
Message-ID: <CAMuHMdUw4x4GxxZ+m+108rp+_uiuiNFHO4Vtrd3vftb_LwmCLQ@mail.gmail.com>
Subject: Re: [PATCH 27/32] media: renesas: vsp1: Use %pe format specifier
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Daniel Scally <djrscally@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_074306_576223_D4022EF8 
X-CRM114-Status: GOOD (  18.26  )
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

On Mon, 13 Oct 2025 at 16:24, Ricardo Ribalda <ribalda@chromium.org> wrote:
> The %pe format specifier is designed to print error pointers. It prints
> a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> omitting PTR_ERR().
>
> This patch fixes this cocci report:
> ./platform/renesas/vsp1/vsp1_drv.c:958:4-11: WARNING: Consider using %pe to print PTR_ERR()
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

