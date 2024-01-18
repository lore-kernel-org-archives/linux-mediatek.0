Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66492C4707B
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jan 2024 08:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WAmEJJ7iCm6NtqHWd2BsUTdJPWvtG+lisWcsvvuWsxg=; b=sX7PpPsFvVVT9t
	GcqLcRNNZ+JSTvUYZdtOZPHfp9qnNLEpSN3+NQUl+fCdQIC6+Dkb5VnlQBzPaduV5BJfkKCiTJS8d
	WkcftWmDZEyfAYrZHrx43nsAx4QWwEo2XKcZ82N9P9nmi+OtLt/pZ6DM1eKw7BrWB1quBx+xtnDww
	H7yitk3kou9jYAdFtFqOhW9yrKe3uuHbLl8q23cBbWchQd5FxJa3hEol91pcH0Buawj7AECgcksXY
	Ye6z0rfklHPat81EOh3i6ZWDgvTsrfYkFavjjN6svQuQMXAqzjjP63SmnSPeCSMZL/MCnqkdRgYgW
	Ya0bNtktZPialhBDuviA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQO0x-002Adm-15;
	Thu, 18 Jan 2024 08:44:43 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQO0t-002AbW-2E;
	Thu, 18 Jan 2024 08:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705567478;
	bh=SyeQsQ1ppgbuh7htdCHARcFwlcD8B29VimAs1TsMQxQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nCaG9dICCf0Ej9rjZuH6jcZl1z0dXLs376gr4N6MW1UjU9KSc+YU3vI/3lMfz3vKn
	 L812s79Q7xW7A8w4wzgeHoe5x/i3dJSrk5Irr0GTIQ3lk4skhmOIXuMrMzeYzcnBEM
	 f+ijc6Sz6UPR1Rhi3rQkJV2XwBKkNacVzZad7wRZPlWvNMvQisfwOUAaFUsHk7no8h
	 2NUgsXxbmDnlPHaMJOwHSIBVvMfs+0eFXjgYPgM6pwxhdmohRgbtqB8L3LnSWhkJj6
	 0gV7x576aRZ3HjtRz1fyrVPS73J9HKDfCH4HHOnNnVvIbCAmec+7ydQ4LCcLD5Sxu7
	 ybtezvrH5cMFA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 68E433780C6C;
	Thu, 18 Jan 2024 08:44:37 +0000 (UTC)
Message-ID: <97831a4c-f5d3-44d4-8a81-0bd2cc967421@collabora.com>
Date: Thu, 18 Jan 2024 09:44:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] clk: mediatek: add infracfg reset controller for
 mt7988
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240117184111.62371-1-linux@fw-web.de>
 <20240117184111.62371-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240117184111.62371-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_004439_867277_A05A977A 
X-CRM114-Status: UNSURE (   7.51  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/01/24 19:41, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Infracfg can also operate as reset controller, add support for it.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



