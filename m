Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E9AC5AC7C
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pztF5ZmE57ytikk6f3PQbP5jBmY/LIYwAmQLXlLbfIs=; b=OVjva3dZ+lqS85+b2euqwUbL6U
	LKwf9XHsHPmbeVM6WpiNyGjE0VrXEB4FU4u6dMK2RLo9pRIsO915x2VZO/bcFKTkkRNuahyyE010w
	3O+mBbSQ7b4a1Z5E6r6ulbehXMTasnA6FeKwS3elLOu3P0gcFu5jZ1mTxi8RX6sXsQChCT+v4rGoP
	SKfk8BwetXrCeMdxBrPMBYvD2tEOEodNhRHPWqppVjLkaOjXqTPqRbKIDJTU+/fnLqc3Uqd05PO0v
	fVOgcDATXwszfSdzGNOhZX3g4xO54HLAz5xEX1E70Cqt3xh3cQf4yuf8RfPwTK5MFSVTEN2FaE4Fg
	p16GD2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHeB-00000007eZE-3z6T;
	Fri, 07 Aug 2026 10:17:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHeA-00000007eYT-0XOR;
	Fri, 07 Aug 2026 10:17:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5384260A86;
	Fri,  7 Aug 2026 10:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3851F00A3A;
	Fri,  7 Aug 2026 10:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786097869;
	bh=pztF5ZmE57ytikk6f3PQbP5jBmY/LIYwAmQLXlLbfIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LSB/0X+9XEap2xAfvK4LNYyoEdhiXgPP9zSo9nREqqKzTmHXVX+ZeKhJa0vwnUSB5
	 i11+t2xKrW6i1Fwrl9Gakc4ZcjXtTDn3z8L+qMttvF2zKMpOcJGmDdDjkkr1SKvTuu
	 w/IXBDEuDxONJBMCcgU4kPV69sHLFcdVFwJnxlLTdeEJIiRFmUdfl7dXf+ac8Y7f4N
	 JalGQM2Zr13VhrPy5RXKBfC1btgUdTSK0ck3r1EAbq+52R5ECu0sHlDaGEqii/lp8n
	 R3SuYydG702WEsyHFco/uhIvPBCOtF8F4vumvy8yp9jrSHmLXoWcMAfni7jWsGqM8u
	 JEBc0+WaPprQA==
Date: Fri, 7 Aug 2026 12:17:40 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: Document MT8196 MediaTek
 PCI-Express Gen4 S-PHY
Message-ID: <4copgyszdf2tjc7mes3lzw3tnvtn4nn3ossdjbgckaucnfrn52@di74kohvokfz>
References: <20260720152654.92216-1-angelogioacchino.delregno@collabora.com>
 <20260720152654.92216-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720152654.92216-2-angelogioacchino.delregno@collabora.com>
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

On Mon, Jul 20, 2026 at 05:26:53PM +0200, AngeloGioacchino Del Regno wrote:
> This adds bindings for the PCI-Express Gen4 S-PHY found in newer
> MediaTek SoCs, such as MT8196 and its variants.
> 
> In the current "revision 3", depending on the specific port, this
> S-PHY supports up to two lanes of PCI-Express Gen 4 and both EP
> and RC modes.
> It is not clear whether revisions/versions earlier than 3 have
> ever been shipped in any other MediaTek SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

