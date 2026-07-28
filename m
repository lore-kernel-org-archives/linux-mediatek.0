Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FF4C54F4C
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 08:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Pnnw3JHFaaC6x08vGFcx99YtllWt4ifCUVtU2BIzrw=; b=pWqsr4PnF//rUpxUk2KhZQqREH
	Pc7tuWD7mAuGFcis3KoSm2P+uLWeYjNGnuXjkuwQB4dlm1sQolBh7l9J8PYTZ0t8DiVWd60bp9I3t
	PiNR2L4nf6MUYT8yVbtY0hMmGyHmC2iMsOvqmEwZAqEnZ7lnApGcv2caQT95czPk/FDXrbTQQbngv
	YD49svleEBx0LquPOihk+oICtmZdhI6vx0EDAXCHHPZZKIq8ddnapvuHmBZT7Oqm9CvukGf1u0bNM
	okNtkXU3oywz7KrYadgvTHzWBTqKYRNQwUjuAze2CatAeDMcvAoeH0lN6lbFxn8eLDN67/HkdVvFH
	Ulrt/ktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodcz-00000004lNC-16os;
	Tue, 28 Jul 2026 08:57:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodcn-00000004lJo-0XhG;
	Tue, 28 Jul 2026 08:57:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785229038;
	bh=lUhD51bc6FbmG7QU3H2DChRpvP96MhevdBzHdhS/M5g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WyV6xFHQVO1MkoWRzNERwwuHvdoo1TpMtSmpAgrFCtPK56bPUjBmJLxe+ahdzPKv+
	 xnu6ghGr6T795gabC6orDVpbRy/TeSOCNXvUUyTrl2UlIG/kkao7lF+iBoJ53nUM7Y
	 7wVwyQY4zHuao3vr8Ana9wLGEvhg+CkBZ0eZR/zSN3EPG/y5tkclmr/WMycB/z5s42
	 D3X7CXCJi53cbVfc7g9yPDIlAFWY9ORlBKPREM9yNlRQFTIejqZ0HM+zValwQAOb4s
	 U+Kf1R/q4/HURt7f+RYZeqGd1dvpH/jdzc0qgWQusxfDJgeMmAQCgRTEaJLFN9M79Y
	 yFxnnBbgxzTQQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18BB917E019E;
	Tue, 28 Jul 2026 10:57:18 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
In-Reply-To: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
References: <20260709-mt6323-adc-v5-0-d11b8332a735@protonmail.com>
Subject: Re: (subset) [PATCH v5 0/4] AUXADC driver for the MediaTek mt6323
 PMIC
Message-Id: <178522903805.10327.4229525653360897202.b4-ty@b4>
Date: Tue, 28 Jul 2026 10:57:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_015721_328221_6C68DEFA 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

On Thu, 09 Jul 2026 13:52:46 +0300, Roman Vivchar wrote:
> This series adds support for the 15-bit AUXADC hardware block found on
> the MediaTek mt6323 PMIC.
> 
> The previous version of the series for all AUXADC, EFUSE and thermal
> drivers was split after Krzysztof's comment [1].
> 
> Tested on the MediaTek mt6572 and mt8163 SoCs (Ben), both paired with a
> mt6323.
> 
> [...]

Applied to v7.2-next/dts32, thanks!

[4/4] ARM: dts: mediatek: mt6323: add AUXADC support
      commit: 6326a6811b1af6674e3eef128df6a3825de26872

Cheers,
Angelo



