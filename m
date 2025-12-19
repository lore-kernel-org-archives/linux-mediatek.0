Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16164E66882
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Dec 2025 20:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTwht4KPqA3PA+spuu0+kW37JARZQYkEppQt9MxxhdQ=; b=wV8cKm3ReLwWxcTYOG5KHkKscJ
	jyEX2TW8rK6VnYh1lIx7FRn7pAWU1B+QxOr04uZB2nIYsJiuu7NsD2eJP9ro0NtNUs1Ja9uCNpDuM
	80SqN76pqNnU9lcwXdZCj+YbS8Wo2jruDCYr2P8TMV5m0AMe5ODA9fOH4e7N6e60anZlOOaTkj/fi
	35pqn00GGADLu2PaoNP+dlp8+ZEtrZ17gLPRGoSZD0Os1NZfC2W9emmAjtlw36/zbpcf09WkE+yMV
	cDVkXDvQUIvxVke6Hm0Yis6QYin8UQvJL5eIR4qQsWZhN0Pf77X8lTWaGPXtpN7txDGj9hdWsFlDy
	yt0X+ZIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhSw-0000000AyU7-0RdA;
	Fri, 19 Dec 2025 20:52:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWhSs-0000000AyS8-1dDF;
	Fri, 19 Dec 2025 20:52:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66BC244274;
	Fri, 19 Dec 2025 20:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D428C4CEF1;
	Fri, 19 Dec 2025 20:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766177561;
	bh=HyEXNSVwwJgnE6ov3GXL7SMN9dCPD1vkRVDgcRsTz6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RIcAEJSjVpkzzY619Hqed58ruVEMCqaKwc3IBfQ9EJVEYPoBUiPM+e+8S5gccITKh
	 rn5WIMEco3yV4E36pSScZznRkkrIBSurURccCp89Y+QNC1xKqs8+v/tmdhqW2Cj6bj
	 MT6bdZTt/GnwLB0zy5s1CX/pnZjKhCVo2FKVrXVDtqeprDexXhzquq2sxHavRLtVBR
	 nJCrq4aJvTbSzGfqwoDD6XYhEh4nruDeq6yfft67YHgW3W0ax7yu6slAEqD6LTXSkV
	 6y1NrQHjzETgbPzoqFlSXIDgU/dv9JKBr+DArCYVQUt++Ke6BxA2rRYkImgryjWK8+
	 CCdm7GLunJonw==
Date: Fri, 19 Dec 2025 14:52:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, kernel@collabora.com,
	Guillaume Ranquet <granquet@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v2 03/12] dt-bindings: phy: mediatek,hdmi-phy: Document
 extra clocks for MT8195
Message-ID: <176617755777.3913354.15520009809669313727.robh@kernel.org>
References: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
 <20251217-mtk-genio-evk-hdmi-support-v2-3-a994976bb39a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251217-mtk-genio-evk-hdmi-support-v2-3-a994976bb39a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_125242_444785_7BBCC1A7 
X-CRM114-Status: UNSURE (   8.77  )
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


On Wed, 17 Dec 2025 11:19:02 +0100, Louis-Alexis Eyraud wrote:
> From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
> 
> MT8195's HDMI PHY block has 4 clocks instead of just a single one.
> Describe the extra clocks for it.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> [Louis-Alexis Eyraud: addressed feedback from mailing list]
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  .../devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


