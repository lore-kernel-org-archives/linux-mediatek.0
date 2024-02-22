Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C03C48BF8
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 04:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0xKN2jUIqLJv3oULNhPWv+pSYgawbESaRrEvYOTM2o=; b=g5YLBv90nH/VZcehGzeYMFyKyj
	Q2F3P2FnsrwtO2az4J/MZUsJe5nf00ADQPexRoGzzv51HYXthRXsqOYa6N4RopYbpZ+sXPa40T7Q3
	V0Z1Qj/QqKst1WW3uDg04mq75duaYvcVpWwuwuex+qSRzr2kvhFLDY8uBHvICi6O57trr0MdAWOa6
	JC/yrj53TnGnw79raFZu4/pzeDQa5DzGBL878XsgWW3pgvyi0mlGNo+991IdARr8eh3oZkryeEk/M
	lJM/d6QllPLyBuAvwTA/QSKv4IyoRU6LpHZN813Jchv0UTT9HPaLjGsozKZ0Mt8IYOOQVLKpc/P+Q
	oGzNM+Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd199-00000003WnI-0aoH;
	Thu, 22 Feb 2024 04:57:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd195-00000003WmA-2fV7;
	Thu, 22 Feb 2024 04:57:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06BD161703;
	Thu, 22 Feb 2024 04:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90348C433F1;
	Thu, 22 Feb 2024 04:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708577838;
	bh=h0xKN2jUIqLJv3oULNhPWv+pSYgawbESaRrEvYOTM2o=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=j8PLpDcMsIh1w2Vfa9NcWW8SPXwzHWw8nd+aFCfptlv20qbE/4+8rWWieRtWMEa8E
	 Pqb8KLkGbiEAqqbVhjhcEE4fk3eMQ+ibSXBZNX0zP9+UZhB5utZMX74SRhti0RkGEa
	 2L+34nm6QlP6iH6k6ZhWyKVCh+um3SzHMQQERRHs2B8xIKhDRxeoaHnx64sN1D1w3y
	 G2/6OXTtil5JIvsM8PV1zr4Pxu24h6A0MmPkwCSy+0DgWYDzhvlgxQYi24ZQZJMwmH
	 hbY9ImVA4yv/uvW0bBUzsEhCXrNqIK2KAWhKqhirFC2CUBTj18XAYTOIEVhJs8O/F/
	 fve0TtGZ4WaQw==
Message-ID: <f6ed0b3e66e346994003e4c3954e1edf.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240214061233.24645-2-zajec5@gmail.com>
References: <20240214061233.24645-1-zajec5@gmail.com> <20240214061233.24645-2-zajec5@gmail.com>
Subject: Re: [PATCH V4 1/3] dt-bindings: clock: mediatek: convert hifsys to the json-schema clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Rob Herring <robh@kernel.org>
Date: Wed, 21 Feb 2024 20:57:16 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_205719_742194_610DEC12 
X-CRM114-Status: UNSURE (   7.40  )
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

Quoting Rafa=C5=82 Mi=C5=82ecki (2024-02-13 22:12:31)
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> This helps validating DTS files. Introduced changes:
> 1. Documented "reg" property
> 2. Documented "#reset-cells" property
> 3. Dropped "syscon" as it was incorrectly used
> 4. Adjusted "compatible" and "reg" in example
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

