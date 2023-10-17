Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60291CDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 06:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MPuv30uv9FasPPW84MTqa0P9OrABIfXuwPIC7B6YSO0=; b=YGrKjizqM/OBaBQwkgJlkjEGEz
	QCiZQL4e36H+RYGnRs11A3Hy7bBxNE3tnS77VRpJ4e/rvB3Mkz60x8HFIXKN/DAPAz6lk8nhVL+t2
	f5PgnO7IhzlHGUvmPGNJiOUyPZ98SJILBzve5QHmyuHNxYsO0cw9jtkfyDv12vmrMYJwO0JB2hiHj
	REbb8e6klB3Ntdboek9GkKexzzpxw5SAcWSb+8XADr+QwIb0U5OGnsMAHP70qVy+S/yh+crHzyNDD
	IXR3WGLRWeyRL7wi9INzEg2ySjSkwcqfLIPq6Q5WHzzB1AvQKAgPJOVpECpHQiM//O6aH/HNHdTPP
	iPLj4CKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdMP-00BNov-0d;
	Tue, 17 Oct 2023 06:15:21 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdML-00BNno-11;
	Tue, 17 Oct 2023 06:15:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B11C460008;
	Tue, 17 Oct 2023 06:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1697523311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MPuv30uv9FasPPW84MTqa0P9OrABIfXuwPIC7B6YSO0=;
	b=AeL30HLYNJdO3uijbN1aNhaKJ7e0ZN0+f1wyjGKF304vxytdUpwYZADQo1IU7oj1VFH0gz
	RzY9yNdsN3SbbcKADAD1rn7S9/gfzQqkvNQ0I3tGpKMLFqVHEswiSsGV8GYWfQkMQ8aCPd
	Rv7pzBe2fIo5Q0fLGhHwEKaxW6SVzrqKjKKnnk5VvTi/nKuq1wkN9u08/k+hpIBq1SNCQO
	nhp+7YI4VPgV3c2VE6CnRYC/4Ov/PpQhbUy6ycPZjAbbHAtFHIW4vM0GvDKvlkhLZouu5r
	+3PwNgPOKHdzjcO/amI84TtI8FFLLmNnNewvE15H3k86gupGVBjdV/ylS+F+Xg==
Message-ID: <c48db3ac-ed79-4c30-b2f9-f7808fd82328@arinc9.com>
Date: Tue, 17 Oct 2023 09:14:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/8] dt-bindings: net: Add missing
 (unevaluated|additional)Properties on child node schemas
To: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 John Crispin <john@phrozen.org>,
 Gerhard Engleder <gerhard@engleder-embedded.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Justin Chen <justin.chen@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_231517_514270_C231D4B4 
X-CRM114-Status: UNSURE (   7.47  )
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

On 17.10.2023 00:44, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> Add unevaluatedProperties or additionalProperties as appropriate.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

