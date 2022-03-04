Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFE5C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 10:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4OjbL0iIyV7N7Gvrin31GQf4AuN/VaC7ZnchN0FbsOY=; b=kVqOAHz2OBry+U
	o81wG5l1AsPtnMs2ddZo9fqaJFb1bw3oK3yIN5Fzj6nupn4jeHPIFt0vmfqCIY8eS4n7Wd3gEATLT
	O4sZ7PB3P28A3Yoj4y79iZyWd8LBAT6q+O1ZOosoc2r9D67ks+uLncm0ePzmkJBjoBC/8o0ftI9z0
	k7XLnaHHn4MrfBk5GXBRf0OucYLVRux2Rc/XJm8f2VtqSE3ELbv6GWZgyNGSmWX4yqtaaZWnDwIop
	6askyXQU8J4fQUwkz0yZ4WaoULbBtaghfTbLizip0s5g7oKmna/WSg3F0nLzVAYUZgMcvsKsSCq0i
	ROogrqwGKyfDyM4sCT/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ5ZY-009eI9-3V; Fri, 04 Mar 2022 10:54:08 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ5ZM-009eET-45; Fri, 04 Mar 2022 10:53:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F07E31F46564
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646391234;
 bh=iyvfPCOywVdYTVL340FKcoWnpL9Q7LDdzRZuLLuLf0I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=i8EVJZVcAkDv0a4yRg2+xUaJmxcNaMTJ8wMR1qdO/p00rkXl6HGckPXX9CP/dab7G
 eUkDYd1J9SJkiJL2v3S8YEcBfXuWyBn6Ck8rOkT88Yri8eKSoeqf0gWC16cDULxuhR
 MDwQp4xWmAA8zQDunNVUP0Quf4OXRdTGPjc7uFXtdqGcNJRaFbnpokRYjMkgX12Zhm
 /d0ENXnxc1PDjoCBKEbVgesQ+aPfOH+NssrBw1YVJqQKe0Nn+2mm0UhqSzGnekyMmq
 KqloPbnfxtA/wX75CVIE5YgiZL5d1jvamUt4Z8PVzF/yTgBvBYWxta2PV9EZ2Qnv96
 8RLK36k87Ny/w==
Message-ID: <312a66e2-b0da-23a4-d922-0a37e04367d9@collabora.com>
Date: Fri, 4 Mar 2022 11:53:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v21 1/3] dt-bindings: input: Add bindings for Mediatek
 matrix keypad
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fengping Yu <fengping.yu@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>
References: <20220303154302.252041-1-mkorpershoek@baylibre.com>
 <20220303154302.252041-2-mkorpershoek@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220303154302.252041-2-mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_025356_328697_A59A959C 
X-CRM114-Status: GOOD (  10.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 03/03/22 16:43, Mattijs Korpershoek ha scritto:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> This patch add devicetree bindings for Mediatek matrix keypad driver.
> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   .../input/mediatek,mt6779-keypad.yaml         | 77 +++++++++++++++++++
>   1 file changed, 77 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
