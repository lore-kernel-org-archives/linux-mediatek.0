Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A9FC5320E
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Aug 2024 17:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63Y+QYTGNkut9FxlBx+qh8tB1J35P7B3p1Wyc8Hfbgs=; b=zbquq9ZKU5zuYA0r2UtPclWMY8
	Vj3lLKm2TYFROxzySZoKlP5bmPM0g6aA2cqMrXJU2Q6+oBX4Ua0q6yztEGR6HQ+QVbJ5TME0dCVz3
	7/kwOP58xfzz9PDLOc6lpqQuJdF38yQYtpaQZQI0bSYQxHGN/36MYrrG29zmGlb80D3FzzSqb7Gjo
	LuQSauzm8Yz6WrgOU36h8iuoyGBJKGYxSDv9/7QFdld//9gDYJSJZ/Hdt+Y6KjSglpj2XzYH/Vdit
	CnxEGvSr1qO6Xfjo6BJO2OHeYjQuWLQkbYbRCebxl0Y6T4Ew4gHIKKZQpMINidPOZmcsqI1JS+zhR
	BSasX9NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfjsC-0000000GvKd-28Gu;
	Sun, 18 Aug 2024 17:39:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfjo9-0000000Guck-1fvS;
	Sun, 18 Aug 2024 17:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=63Y+QYTGNkut9FxlBx+qh8tB1J35P7B3p1Wyc8Hfbgs=; b=lZA9wdms8JnNXozC8Q4QzS3bN1
	g1bG8O9M5vNx9ghGlok/q/1yKDPY47fKg6QJ8Cu4M2uNHdLP6VrdbWdDdesK27GZDzu4PCLpm/O17
	YFJKmUSlpN7OpmskuUCehlPGa+XEoU3PoHq7V+uLrEnKjmqTPOx9cc2sO+5lFRkGFHTU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sfjo3-0052wi-C1; Sun, 18 Aug 2024 19:35:07 +0200
Date: Sun, 18 Aug 2024 19:35:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <4a7c9ef5-fcdd-4464-8871-041534f85029@lunn.ch>
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
 <20240816225257.GA2411475-robh@kernel.org>
 <1d223ae5-cd2c-4883-b293-bb182e90222b@genexis.eu>
 <6da7acc8-f77e-453c-b2fa-4eb9161f637c@lunn.ch>
 <3a52e550-1bb1-40fc-b7dd-b454d7c97f97@genexis.eu>
 <19793afa-dc62-421f-ba09-8ca2815ae4a2@lunn.ch>
 <377507f5-e9f8-47b9-bd0c-d1fb0ffeac92@genexis.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <377507f5-e9f8-47b9-bd0c-d1fb0ffeac92@genexis.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_103513_485111_28C51680 
X-CRM114-Status: UNSURE (   7.46  )
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

> Hi, the pwm driver could be re-used on the EN7523 SoC. Future Airoha SoCs
> will most likely have the same ip-block also.

A lot will depend on if they sort out the mess they made with the
registers. Given how simple these drivers are, it is sometimes better
to just write a new driver once the registers are in sane blocks,
rather than all interleaved.

       Andrew


