Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBF8EE49A5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 23:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tl1tPAJsY+6HeQIjw/xN1e5yMc1WTSncxxsEvTVmB8M=; b=FVLGq+Lvm/UPJATvBsqhI0hBdK
	tfJEw5Mg83AgtYrr51lIlYUQX9x6Yz08OCnFYA3OMf57DKg0Ol5yKaSjqymVW9AoKmIN6Hb9QUaQ1
	EBg/P0iRnjhGOjgoS3XglJLOz5b3nXMH2P1J9PSyDZjdIwQTc5/DQtBiuYMORUbb/2H+8cBevObfi
	vsizOrY+E60EhpPisnb6eie+F/6rczCRcAi4fh8dfIVWMxm4aZc8hAXrhEAxmVFGCjrYo5A3/AWg8
	wrUNWIaEh6aLrwXfJUa8EElV4fueE+I19jye0Hk+lcdG1lEmW55kRhh+C5F9LmAxhuH0Ry65ED8cw
	uCRuqNPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYaRA-00Gv8U-0v;
	Tue, 22 Aug 2023 23:05:24 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYaR7-00Gv7M-0J;
	Tue, 22 Aug 2023 23:05:22 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9a1681fa868so599569766b.3;
        Tue, 22 Aug 2023 16:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692745517; x=1693350317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tl1tPAJsY+6HeQIjw/xN1e5yMc1WTSncxxsEvTVmB8M=;
        b=J3AHJmH5FH5EWYJY8LWPuAdZqR9BdWQ9dx2Mj9W8vbp91TJ1UXiMgOCaUxI2aniiPB
         f1leJ9g1sr121JreOI3n55cXPjQ7zA4o+tr/7Xj74XSjU5xhQVWLAfv65/vuYbr+kS+Q
         /ovh7L4fXD1jtqk7udukzQ4S+YSX4HiRJ6H32pFUdajFJgi8zouIDKUDCUd8weXZcFy5
         ZQdQmjTtG2icVUMVYzlmKfRIHEZx+3QyGoKxKz9zH+LFSEbggDHgyj35mT8loDz5Q5Ms
         keThPZVmZN3bIb4H+MsLBJ3MXYDN+EbaYcEO8+DwlnB7dfUrh5WDAO80g84MD1k1IB9r
         87Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692745517; x=1693350317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tl1tPAJsY+6HeQIjw/xN1e5yMc1WTSncxxsEvTVmB8M=;
        b=YcCDFnFZfBNfPUaL7uWKuZUJe37DTS7tPOLilGRyl7Hv+ny0KNbQZ6cq/4MPjP3dmA
         V4SiW51CA/4vNjVODxK6wAcoRLM0/vstggghDVv+xZi24aJhfwVZ+x65OwtHSK6WF1iS
         /kaQTCHa/okVEwkqNVMj/5DweVv4AVtfBAoGnrmRPZvwNjD9StEdvdG66WO6f448Qt+x
         Cq30SeKSlDrhdAi3U+/RJmWfn6RTESJrK+s6ytYXA+EXKzBG1eC2t/qK5gpOrn4hjJEm
         ZXMAJ4V5Oi0UmQlxRH52S6WcCf948odde9reJg/XFxASnHiEs65XsEsEUior4716u8Sh
         2SJQ==
X-Gm-Message-State: AOJu0YxQb2LGa6mHv8REA2ba388n6nNQRrGdJlLCpm+oKgMXfA3uIIwg
	Wn47WefzslsjGl1TDQYR71M+Dhbwo7+wV1Zs38E=
X-Google-Smtp-Source: AGHT+IGc4vnfO5SO2rv82RsYq+TW7/uByZDfWyswWgwX0GX8iv3xt75IkRdZmjAU5aKwi0tBJtJFC8zrCiSUE6S0eJg=
X-Received: by 2002:a17:906:535d:b0:98e:f13:e908 with SMTP id
 j29-20020a170906535d00b0098e0f13e908mr9494142ejo.60.1692745517251; Tue, 22
 Aug 2023 16:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174702.4059100-1-robh@kernel.org>
In-Reply-To: <20230714174702.4059100-1-robh@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 22 Aug 2023 18:05:06 -0500
Message-ID: <CABb+yY0ZEkU2fEoFcihDM0GPuNBkCJHYXfkq-+bLJY1xtbf5Jw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_160521_129863_9456FF8C 
X-CRM114-Status: GOOD (  11.48  )
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

On Fri, Jul 14, 2023 at 12:47=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
>
I thought I was to pick the patch. But I see you intend to do it. Np.

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

thanks

