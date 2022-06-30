Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73646C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 13:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqDFCQMigdYWXavURZY2S4+Y4mHc9Iu747fUu/nCUp0=; b=3UMudoJ05ymj72s2yGEfnWEO6e
	DUyouVm4l0FybsovyEBRAe154B4Lbhiqh0IjiQdO8CWorr+/CrRE9FGyo0EQsAKciQwSDzrC+OVaa
	VFFg1+eZxwBrIzRhgLVpAICsmpvGEESIT/gfFNj9TYajHucg2f9i2S8UHIT64EWFv4VBIA91EF7+g
	lNg3Q6O2Qko6Ma8ESRrqa+FW24tl5jVBrk2G75LV81G6F1J+U0MxHY1d6PtT9W+w3Kt5pOnpfOZRU
	hUkRdN39NzKUxf0TB8sdf+9sOzeIyIhqpyA3N6DWiPOY5y0n7tGu6MVxAX3TqoIj6XC2sDU6iFHTS
	w+h3Ictg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6uRG-00HOUM-NB; Thu, 30 Jun 2022 13:42:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6uR3-00HOO4-Nn; Thu, 30 Jun 2022 13:42:23 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9CEA06601946;
	Thu, 30 Jun 2022 14:42:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656596536;
	bh=zjw1NKua1OqhkkVVGCT+4W7JxDOLoG6XHBVU7jGOB78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P9919LpkeDWT5+HIeeW2bFNEx3vluBXhRHVunbOdmiOxE5AMsYc3EIknZZC8HTypM
	 4Dp+4pbIvhlvpeL8um1PDGdwC7Vi5vSzfxtjECgd4OH9Qfc/XUIl3OBwkWd0atKeyZ
	 NdskSN9hnlzhV8zbWFxpw2YCGcVmTjLWu22cvtz8l+TaLfXiQ2Em79ySYC8eZFJEfq
	 wqvkcKWLsSI0ISmzWwKJY9jSrrECO1E12OxA27xzCJxJN5FxMIQ6rY3Dte0qCVrbGJ
	 ewSmuHn3Zja+o7xQdK1bEesESYxYl0ojf9/egs/8r1Uf3P0zMTJbo4c8L5Y/mo4h0E
	 fwJk5jdV6EvLw==
Date: Thu, 30 Jun 2022 09:42:10 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 3/5] arm64: dts: mt8192: Add display nodes
Message-ID: <20220630134210.7j665amh6tbeaecv@notapiano>
References: <20220629121358.19458-1-allen-kh.cheng@mediatek.com>
 <20220629121358.19458-4-allen-kh.cheng@mediatek.com>
 <20220629232429.c5oysjgy6gflqhct@notapiano>
 <99342f13190cb4ea103c4227e6672eb5cad63b82.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99342f13190cb4ea103c4227e6672eb5cad63b82.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_064222_051455_8EB5B7E7 
X-CRM114-Status: GOOD (  24.37  )
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

On Thu, Jun 30, 2022 at 05:41:31PM +0800, allen-kh.cheng wrote:
> Hi Nícolas, 
> 
> On Wed, 2022-06-29 at 19:24 -0400, Nícolas F. R. A. Prado wrote:
> > On Wed, Jun 29, 2022 at 08:13:56PM +0800, Allen-KH Cheng wrote:
> > > Add display nodes and gce info for mt8192 SoC.
> > > 
> > > GCE (Global Command Engine) properties to the display nodes in
> > > order to
> > > enable the usage of the CMDQ (Command Queue), which is required for
> > > operating the display.
> > > 
> > > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > > Reviewed-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 136
> > > +++++++++++++++++++++++
> > >  1 file changed, 136 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > index a07edc82d403..26d01544b4ea 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
[..]
> > > +		rdma0: rdma@14007000 {
> > > +			compatible = "mediatek,mt8192-disp-rdma";
> > 
> > dtbs_check is complaining that there isn't a "mediatek,mt8183-disp-
> > rdma"
> > fallback compatible here. But given that the rdma driver matches
> > directly to the
> > mt8192 compatible, I think the node here is fine, and the binding is
> > the one
> > that should be updated.
> > 
> 
> I have checked the binding and driver again.
> 
> I prefer use "mediatek,mt8186-disp-rdma" as fallback and remove mt8192
> compatible and data in mtk_disp_rdma.c because they are the same with
> mt8183.
> 
> Do you think it is okay?

Sure, that sounds good to me as well.

Thanks,
Nícolas

