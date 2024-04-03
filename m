Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9213CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 10:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFOLxvwwbqurOsaBKKDGIkr/U3h3e/8V7ICbLUNaRRw=; b=O4IplclN1JBQuh/cDgwa9+i3Cc
	UatGSrirXYG9sC/ONceOlmzDnYLuzW7eXBBeZy7Jbzxp7dArGhvp9Gz/jNBL5bbCev27epWbdF3jf
	lnWtdzlklbpTxm7iUXicda8AERuQlrMPkwNoKFOXe5qHd93cfCFiHHNKyDlRe+015l3ice6fBG7pi
	LoL6bUzwiazNIYHxP23oDFSnU0eVbAsd21ZeNT+TUSeFVWPUslcXjyeA4XeniyIWcyW4GjnnXdcNb
	no2eK9guciwJdfXqwxP2OpMMWysvCd/+gG8Tmtd08mU/TqOpW38/hRdWc8bpaeX6bzWhzCHLtsPQd
	YtUC0Dlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxuE-0000000FWus-27Jv;
	Wed, 03 Apr 2024 10:31:46 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxtu-0000000FWe1-3yYm;
	Wed, 03 Apr 2024 10:31:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712140284;
	bh=PYIRmUFghpI8A50oiu40PS5xDa+QI8EerqhE598Bz9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EqKeAqTPlb3pmbIe6dSIwV4CVEgMpzMxoOltEpWseRBh8y5x0vQCHFN0zZhqmBrq+
	 eSrGqLka7CpdA+Pwng7gKj+Ef7Iiy/DJfolP83Vt5+FxweMO4FeSy6x7ImqMp+KMyZ
	 OzzNip2Ujt5vMjeBIfYvNShisxHjGJ7fZQiIiBHYC5TuZ4KVZmf4iwhZzJS+N0+hUJ
	 4LwXesTio/2PpGob7izm9ptQkpK5f8ibFvdMcsmUr5Jg5xJUiFhhmB2JOc1VOsJMqR
	 GqckyLXmFTkxxWXBzs+ZpsNohaBe3VJp7CmJ92pXi+ixaT4hFYX/0NV7OwEnfmsE0M
	 pYfJdzN9WWsxQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EE9B737820F3;
	Wed,  3 Apr 2024 10:31:22 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	"Nancy.Lin" <nancy.lin@mediatek.com>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 0/4] dts: mediatek: add Cudy WR3000 V1 wireless router
Date: Wed,  3 Apr 2024 12:30:59 +0200
Message-ID: <171213179798.60933.728917515471078236.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240317223206.22033-1-zajec5@gmail.com>
References: <20240317223206.22033-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_033127_338828_5F6A5447 
X-CRM114-Status: UNSURE (   6.97  )
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

On Sun, 17 Mar 2024 23:32:02 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Cudy WR3000 V1 is a MediaTek Filogic 820 based 802.11ax wireless router.
> 
> https://www.cudy.com/productinfo/1637722.html
> 
> Rafał Miłecki (4):
>   dt-bindings: vendor-prefixes: add Cudy
>   dt-bindings: arm64: dts: mediatek: Add Cudy WR3000 V1 router
>   arm64: dts: mediatek: mt7981: add pinctrl
>   arm64: dts: mediatek: Add Cudy WR3000 V1
> 
> [...]

Applied to v6.9-next/dts64, thanks!

[1/4] dt-bindings: vendor-prefixes: add Cudy
      (no commit info)
[2/4] dt-bindings: arm64: dts: mediatek: Add Cudy WR3000 V1 router
      (no commit info)
[3/4] arm64: dts: mediatek: mt7981: add pinctrl
      (no commit info)
[4/4] arm64: dts: mediatek: Add Cudy WR3000 V1
      (no commit info)

Cheers,
Angelo


