Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE07CF8863
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TyXP7KOyjdxhtqFsxyDjlJv6yi/vRAnydIaELHlv748=; b=llIf5gCbMUfelnsXZtRaTSIHbE
	BFttu3+8PLq9wUAbdNC/6EgDabq5f6XwZRTO467eWOV3vKJm5qUXn/b91z2SxscFX30+MK7qgZ7t2
	hRaJyL/NI5rmSn4WgIemlOafxknvHhCynWsXuCaITf25d7gHhRCcFhDPYYrHrGHiciguUJC0Txmb/
	qsknPuJc9ZhimXRmb8g8Xp1nwSZGoHpGW7yCZMVQNljhACBS88IxLKy5pxWfa4JeczSjo2IXKT65K
	xeCNbBaeLY0AwPW9rI/e37XXT3UFew+qcXLxQs+2Xbwz9wlISti+zj8txPPS2iAXRVR9gC2FI6r9W
	NXBHwqpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy633-00000005BFJ-3IQg;
	Tue, 08 Oct 2024 08:58:29 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5zT-00000005A5y-3xfl;
	Tue, 08 Oct 2024 08:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728377686;
	bh=AWG6oEPgkDnw7LKNBFVWOBnbxOnDKzU9e0dST5ZmFXE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JwPa/CRVOdDORLtFLtBLkIoZG3BujChD2qm5GonXu+9uVQo3g+8ZfJhWpeF/Q81L9
	 zAObKF9dVyXkXtUy5ksZfdiwcwOz+xQzGG3Oii989v8/CLf/QWKqQXTxICHkLxvCQr
	 sVHC7UwJz6C9Yzo7Yktu6tWupi+yLfQqB6/Z0hwjHt63JsXVuOwe7kBsDVdLdaAWZk
	 6cYv3+/UMNzTYdAvMrmSGQQwxujLIWqq9klc4WxB8rnySOf3l/TXPKbSkYwZ7Mf46I
	 DIPrsPHSgpiNVNsXK0U2zXyRVR0rrdOiuvoaYbBiBmmuVfCf6x1gmvsV8F8GW53oF9
	 c4fwmLwDEyWmw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B45FC17E10C2;
	Tue,  8 Oct 2024 10:54:45 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
In-Reply-To: <20240909-i2c-delay-v1-0-4b406617a5f5@chromium.org>
References: <20240909-i2c-delay-v1-0-4b406617a5f5@chromium.org>
Subject: Re: [PATCH 0/4] arm64: dts: mt8183: Add i2c-scl-internal-delay-ns
Message-Id: <172837768568.33038.2488434052434863943.b4-ty@collabora.com>
Date: Tue, 08 Oct 2024 10:54:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_015448_166707_A1A09B87 
X-CRM114-Status: UNSURE (   5.72  )
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

On Mon, 09 Sep 2024 07:29:02 +0000, Hsin-Te Yuan wrote:
> Add i2c-scl-internal-delay-ns for each device.
> 
> 

Applied to v6.12-next/dts64, thanks!

[1/4] arm64: dts: mt8183: fennel: add i2c2's i2c-scl-internal-delay-ns
      https://git.kernel.org/mediatek/c/5bbddfd0
[2/4] arm64: dts: mt8183: burnet: add i2c2's i2c-scl-internal-delay-ns
      https://git.kernel.org/mediatek/c/3d3bc7cb
[3/4] arm64: dts: mt8183: cozmo: add i2c2's i2c-scl-internal-delay-ns
      https://git.kernel.org/mediatek/c/02586956
[4/4] arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns
      https://git.kernel.org/mediatek/c/65b99309

Cheers,
Angelo



