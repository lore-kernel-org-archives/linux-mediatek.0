Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A26606A321
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 11:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BzM5S/LE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ja0Jjemo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cjsu9/5ej+ntzXZUPugJjG27uarENToyBzhqO2/xyvE=; b=BzM5S/LEqVY+XJavcUipowQaYl
	mt9RvWDj34asPz4WsN0pJmg3La1puyCqsGZFju6OxQt18AauqpJ5PD702MBnPfhPHihbbCsyX1wg0
	3X5mpPfwRE+jEikahc5/F/apgpeyl/GDArxP7yTS1DaOL7oNk6rNgscsXpr4x4eDPAJE8UYiof9m3
	7pV4SezYM1rN2ujEM1KD3T5+1VxiHCxzfUFFmwSTfn0Npnv3M+e5tYXoRvurUxZM4298XFO3X553L
	FC0OeRI1q6IA5J52PHulsdevoxelMgeNtkjqYdSkjel21xt19myQvnVbx3wekNbzkpowMKu4qWOI0
	dnWEzMlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpGL-0000000CVdq-2aRk;
	Fri, 13 Nov 2026 11:16:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpGK-0000000CVd1-2YzN;
	Fri, 13 Nov 2026 11:16:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 12030626E3;
	Fri, 13 Nov 2026 11:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174671F000C4;
	Fri, 13 Nov 2026 11:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568567;
	bh=cjsu9/5ej+ntzXZUPugJjG27uarENToyBzhqO2/xyvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ja0Jjemo9Q0Vgk2M06FtvFDkVqdzKX1IodhRlb5oUbvAsgneHGm6FPlLMxSmlKzIU
	 xWkrFmbaV8Hrr56eiM5I2puOGg3cnYelhn5U+vJTDC7AUmEj7MnpJlnI/ti9bB0gMd
	 CpbuFE5JLBSmQhQeYOIxuB0h0Ba/IZ1/zlBIV9CQLmXkzxi9qhmoFxbAn1GpmdtcF5
	 SLG6hiyumKtG55PRJkcju2Bem9//c2vFAL0k/pwguiuqgdkjvkaK3LvTi/Azdy5a0V
	 V7UXMeRzWLyOtHJCWdaX/2kEDKv+nXgzirmHMI5/TJZvld1v5mIz0J/WPqpEasnnO+
	 duGo3LPnpxIxQ==
Date: Fri, 13 Nov 2026 12:16:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: mt8173-amazon-suez: Add the
 PMIC AUXADC
Message-ID: <20261113-hypersonic-inventive-kittiwake-956033@quoll>
References: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-0-77b47cdea702@gmail.com>
 <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-5-77b47cdea702@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111-rbrue-suez-upstreaming-amazon-suez-dts-v1-5-77b47cdea702@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 12:19:54PM -0600, Ryan Brue wrote:
> Describe the MT6397's AUXADC and the battery pack's thermistor on it.
> The SoC's AUXADC only has the board thermistors, and the charger has no
> ADC, so this is the only way to measure the battery.
> 
> The thermistor is a 47 kOhm NTC behind a 24 kOhm pull-up to 1.2 V.
> 
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
> The thermistor numbers were referenced from the vendor kernel.
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-amazon-suez.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Adding new board is one commit.

Best regards,
Krzysztof


