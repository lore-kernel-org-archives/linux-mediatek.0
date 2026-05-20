Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54970CD4F3D
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBEbE+camjUKBlwCJLf2N5rzNs637OGXYU74gPqV2Gs=; b=x+RQBzOH92av5it2RfBVww1wOT
	6TTvTUxSY2EHZZKcxGkwZ9yFKdQHWGPP+c3MYsJsNb8tGBzyR5nQACZgmB/r3RFW60tGc81/CiBoM
	PDyHce443464PURQmEmXA3QTBOxb+emIHfUOo3myCNhBrCuaezLUxk6IomlEs5bPl6rsrBViImQwL
	PxQ7KpbI2nDmR/9O29QEAgsv7W3tqdca1+dgrCIWpdglm7ELqe5KFPk5j+BYvncSbK58ElxkpFXdz
	LJFyy1YvFW4dLuXf+xV8fiEpVWKxUQdy5bHa1Khge6OFZFkHbgYD+lfDcLp0xTS7is7xwM+OLTdLF
	i8IBFlQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPi6U-00000004r8u-0uki;
	Wed, 20 May 2026 14:40:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPi6T-00000004r8I-0vVs;
	Wed, 20 May 2026 14:40:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5860360008;
	Wed, 20 May 2026 14:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518441F000E9;
	Wed, 20 May 2026 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779288056;
	bh=iBEbE+camjUKBlwCJLf2N5rzNs637OGXYU74gPqV2Gs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YwNTL7Di1i10LxrXKrgPrBkT/a0mF+W44BHvguh46QEVvWVQhe0w+ull5XI4rpvl2
	 xj7C4ZwWYw2a4mHGNQlMI0kNuXVTLmxMOsFqIFOGImN0/Ky2idXrx4n/KSAHG8YAOC
	 ceNvoEmEppM7aJdswGqOMQ7vOMKSJd3hzJ2TaDhZq5/Cvk8QN7w0xGxXtN99ntUlig
	 CQqeKfTybxHPUrK+Q/yxN+uUEJG4xzA1b88pZuFhXOlw9QSPhEiTTd10Fq2uZwRU86
	 eQIowsSmbhCuQ9Wm5pbWGSiknzkmBJ/eA0BljqC0rmAIWxyGmdEIW7NcUJrzXOwDwD
	 J32BMNelRQr9g==
From: Lee Jones <lee@kernel.org>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Chen Zhong <chen.zhong@mediatek.com>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-input@vger.kernel.org, linux-iio@vger.kernel.org
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-1-6f43838be92f@collabora.com>
References: <20260429-mediatek-genio-mt6365-cleanup-v1-1-6f43838be92f@collabora.com>
Subject: Re: (subset) [PATCH 1/9] dt-bindings: mfd: mediatek: mt6397: Add
 rtc for MT6359
Message-Id: <177928805103.2819461.14868445480011643756.b4-ty@b4>
Date: Wed, 20 May 2026 15:40:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Wed, 29 Apr 2026 11:44:14 +0200, Louis-Alexis Eyraud wrote:
> The rtc block of MT6359 PMIC is compatible with the one found in MT6358
> but this compatibility was never expressed in the dt-bindings, so add
> the missing compatible string for the rtc subnode.

Applied, thanks!

[1/9] dt-bindings: mfd: mediatek: mt6397: Add rtc for MT6359
      commit: 4edf75f835bad0b7e7ac022594b129f9dbf8698c

--
Lee Jones [李琼斯]


