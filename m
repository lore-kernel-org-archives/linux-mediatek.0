Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7128BD3C52C
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 19:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgGw+348hq+8XaJjRr2RQ3h8zLKyBzjTagmsfJeeBVQ=; b=RWcFotm6IX3pb3rB6iNK6HQQeS
	AlbcEUc2W/QCo29Tfq+qOIpvRJqh4953h70uZAK4Qm5olhyfc9r5LkURDgJgLdTdKuTqNs7zXV4vl
	3TX4JEf1dd59jo67YGvzLNJUVV44KB06xOZuk5rGU3eE/C5c3osiP8LAILAi6+k8Mt0HmFxNOtERR
	1ZKdVK/LWHdLLVPmo6PCQwQfOZE2YuTUb8HJQNXrDGbwS0FN1Ta/MsDB6QdZvNwDspcAzTDg/ZXCl
	nqL8puFeWVRPkLIpA1WsbHg2mh6VzN/7B6XthERMra/oWMNtoD+KgKWb8y8JsxBtddrEsJSYYj1Ie
	JVlwiFBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1WDp-0000000G2M1-2LHS;
	Thu, 17 Oct 2024 19:31:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1WCL-0000000G2Bq-09Wn;
	Thu, 17 Oct 2024 19:30:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 51CD6A4420F;
	Thu, 17 Oct 2024 19:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCBEBC4CEC3;
	Thu, 17 Oct 2024 19:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729193412;
	bh=FgGw+348hq+8XaJjRr2RQ3h8zLKyBzjTagmsfJeeBVQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DfJ4KjPzP5fLnkvbrv1jOSYYFT/OAzw2b/vS+1ZwAyVybbvP1cg5fRueMCn50bs9u
	 Vrdyaph9ggPybHJPCg7+EqeWM4ptUnLApy8O/HObuu92Qdslz16dfgcUaThYNqQ0r3
	 q+EAFpsD7A2RILPucjP0D7EYnd/TH6fTpqAuxQs3Z5BTXO5xbe/SiGdSKnrTBwMJB5
	 UzUUnCOzNudLScpRvofZmg4pr+/64pynMpogFOUlj+XgUiL7oQvuevXYmJeRcET/tv
	 1fDcoMqwhjCQVY2duwyAl7QKk66QgUMq/AFyKi25fRVVwy3VMv4lpCzDF4LZoXuOED
	 sOCvRn5ZZD63Q==
Message-ID: <18b311f580dfd0640db076d066ba5286.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241017071708.38663-3-y.oudjana@protonmail.com>
References: <20241017071708.38663-1-y.oudjana@protonmail.com> <20241017071708.38663-3-y.oudjana@protonmail.com>
Subject: Re: [PATCH v7 2/2] clk: mediatek: Add drivers for MediaTek MT6735 main clock and reset drivers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Yassine Oudjana <y.oudjana@protonmail.com>, Yassine Oudjana <yassine.oudjana@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Yassine Oudjana <yassine.oudjana@gmail.com>
Date: Thu, 17 Oct 2024 12:30:09 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_123013_165644_7EFFE7A2 
X-CRM114-Status: UNSURE (   6.45  )
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

Quoting Yassine Oudjana (2024-10-17 00:17:06)
> From: Yassine Oudjana <y.oudjana@protonmail.com>
>=20
> Add drivers for MT6735 apmixedsys, topckgen, infracfg and pericfg
> clock and reset controllers. These provide the base clocks and resets
> on the platform, enough to bring up all essential blocks including
> PWRAP, MSDC and peripherals (UART, I2C, SPI).
>=20
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next

