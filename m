Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51270C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 10:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJ12wcYwvKrJuQH6O+j/r6QXsyb1XDQuItCQMIyMmEM=; b=GPJpTTl3g5RYbH
	KDHEgHlJti0W5EzBUykDIHXNLcjeIuSvpe6xHhWoW4Rk3v1/v9Ahr6DaIu1YbIxw1oGQqH5XGxTaA
	FloLEovag6LPwJogByurnOa0fAA/n8dJzj4G2xzD+Ts1aJC+1hf+YQm5GgPXG1fgJfUgFd1D7lIqw
	JrieZ9ASRa4x0m7hCXNDixoO406Hedjh9AZcfTLQAfSVkOJmMz0WtPwcIbGM7lMuc6xlNGx0FxIzL
	wc7wDUHnGWZ6o9o1X9U5ipg7teWYzPaOzdwKPaCYdh1TAIbyTplnVctbAuDUW7EB/WgAN8PxJ3iOy
	eIsbDKZvs9feLJg3oa9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEUN1-008xpp-Qh; Mon, 31 Jan 2022 10:57:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEUMp-008xmZ-M3; Mon, 31 Jan 2022 10:57:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6EEF21F4312B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643626622;
 bh=AhIlSPFIs8ak0I/I8Ku1qwLQESsLxE26HyIIypM3mfI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VtX2wMwZbmlVio86rbbyFReXPbkiIl33IMybSs+olR6XD2iuZtBgwcgoZGtzFZxut
 SEPrxE9Y/T3VWOod7FCLJjutTvjmDiIzA3Nb1kYOXfIYdPWG65bUF8jwCdxZWGuC3+
 r5S9a4nWHlmo4C1GF5+cj55SF0DSFdv++YxwL/eOIebuovdwygIlKG6muH9/h3UdKF
 CVOZ7tpZiAkVRiQdmU6hPKolqXWg7uqua8QmEbLLGNxT1N9DqFnzWwAEqEMz4wBbyh
 UzSG1O7T6kr1mZunW5yXiqHkXjij1CDgNJ3y9OtqSTIhMANM7pgftW1YTrOPv3fQrl
 X52Pp5ab6/brw==
Message-ID: <59582e31-66d7-ad07-dd64-4ebb223cf809@collabora.com>
Date: Mon, 31 Jan 2022 11:56:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v22 7/7] soc: mediatek: SVS: add mt8192 SVS GPU driver
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Guenter Roeck <linux@roeck-us.net>
References: <20220127033956.24585-1-roger.lu@mediatek.com>
 <20220127033956.24585-8-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220127033956.24585-8-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_025703_882455_CA5C39BC 
X-CRM114-Status: UNSURE (   6.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 27/01/22 04:39, Roger Lu ha scritto:
> mt8192 SVS GPU uses 2-line (high/low bank) HW architecture to provide
> bank voltages. High bank helps update higher frequency's voltage
> and low bank helps update lower frequency's voltage.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
