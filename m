Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BC6C48BEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 04:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LD1a12Iwotseh8k/EGNm4xpZFXAbJSrLwQ+zzlGmHig=; b=MFm1L7qyTG+W8NrC/MJ0ajU/Jx
	DXZYyvoKNHprxtvpEz3dz7ehOxYU3kgOHql6uJYnBM0Ts/VuewNe1GBvVYq282zfT670uV/qHq2uG
	UIra2+58X0Q4aEAKWTLy9b3y9bH0FlZJ7a1sKnxl9Mm5INK/WJVAeeoEmLolI5a8kbgNr6ANogltY
	jkqlSKoRfoN0F6FYmBMwhcdh3lkmFgaAgN0BfZtOL+lJNePtNP12K0CCA3akUShZtTjjbSHbbhY7y
	Sw+QEkmck6VOcewph3YfnuHd3Wnsyy9vdDGqTLYlGefQ6BbwEe6se/38GMwS/ssSZqQCix+JWR0iM
	ZtbOrLpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd19f-00000003X1f-0tKP;
	Thu, 22 Feb 2024 04:57:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd19O-00000003Wtg-3efK;
	Thu, 22 Feb 2024 04:57:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50EDE616F6;
	Thu, 22 Feb 2024 04:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6D5C433C7;
	Thu, 22 Feb 2024 04:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708577858;
	bh=LD1a12Iwotseh8k/EGNm4xpZFXAbJSrLwQ+zzlGmHig=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mpf0+kip2Qpa8fBNhkgu10pfovZVp/XhCe3so/ZwGXGy7ouvjKVJSMbPqbQT4HoEY
	 IYL4sO8wl/gNLWWHIpnLytePYJekOwa4Yni42JKIZbDhz3YoiF/w7eZvOxoIYDja6a
	 Hlfw06K0Fk7+eomJ35IRKRz+VppDF4ANsbkhDrcDN8tcxc6TT12DuAbcj/KNTKaRrm
	 R9eKvy60DoccYwdeqNsG9orebBpOuaUpglOm1ZM5WVxlix+N8Ax2ACtkV7bAKoE9dv
	 oWhVdTkq7BomERG4a+sVYZd8KjoJFVDTaJyrOuiW1fqCMclCWqWRIbQAq7vxpLCVvQ
	 mj1pTVptYMXcQ==
Message-ID: <f631feddb58950b63ecb21e2353e5892.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240214061233.24645-4-zajec5@gmail.com>
References: <20240214061233.24645-1-zajec5@gmail.com> <20240214061233.24645-4-zajec5@gmail.com>
Subject: Re: [PATCH V4 3/3] dt-bindings: clock: mediatek: convert SSUSBSYS to the json-schema clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Michael Turquette <mturquette@baylibre.com>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Rob Herring <robh@kernel.org>
Date: Wed, 21 Feb 2024 20:57:35 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_205739_016703_3FDD9547 
X-CRM114-Status: UNSURE (   7.41  )
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

Quoting Rafa=C5=82 Mi=C5=82ecki (2024-02-13 22:12:33)
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> This helps validating DTS files. Introduced changes:
> 1. Documented "reg" property
> 2. Dropped "syscon" as it was incorrectly used
> 3. Adjusted nodename, "compatible" and "reg" in example
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

