Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3255C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgfgLuz+E4vuJUDPXIZsB3FWI9oZ3eCKHglcOvJdiJQ=; b=PflAqE4NwkEwHRZAx5ZWcRjUEX
	vN36Q613iQU0W4Cxhq/U04F1iI8G8d3QHXX4wslsbMSKNojsmqAep4aGrEMT0faGBm/jnLgmivO0d
	BLUCGVcByGHDV0XG7Ya9dLyyw/pzEMI6n7vO3wBI7RlA+ksxwlM62iC+8SHz6SbSRbMLBY4qD3mSE
	AFgND4x6x936S8XjzZBrnMzF4yNcJVxzOJPcZgMkNkWsAkM31feCbCaJwBDMHHDeIxE/ebtYgS9A9
	HnMkwRqSiMl59I6M4lSkejA2MDaLhhhBYUi6CCTx6P1hSvTkJKgc/2/kjogACNQaDTBpkbOdSO8St
	kP92h3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peeiD-00D3dJ-33;
	Tue, 21 Mar 2023 16:19:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peei9-00D3bx-1f;
	Tue, 21 Mar 2023 16:19:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DECC4B818CC;
	Tue, 21 Mar 2023 16:19:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4539C433D2;
	Tue, 21 Mar 2023 16:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679415582;
	bh=nSCf8mJZjMVljeWisul4AhH31jB5GSrv2dGElw8BRZs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ETKQ5RB7py3Gt7I6u3XvD/SvQfhZHnG8Kh+YxJraIItc49x/j/AL5u1ydRAMsFtWJ
	 9mwt9r70Y6xB5jSh72A9mXCpfDbDn24XMch3rrelgs17nlURxTxMBqpfSfd3aHotyH
	 PsQy9JcoiuMKwixp6T4ulqG4MVUs0lEOL2DYPSIiXiatZZ0XO6GAFCLHCp5ZNv1GXF
	 TO6yHFZf1LYn0xB9lJF7GN/vxzDAqHh1M9JlpIcyBNH+lyz6Uz8RLcu0MVAHflG4WE
	 4DXJhmRPHwjRym7lpVkzgghNx+FXXaI9wInWDAz2CTMTmdYPi/9NGQLZu8aZeUHf5n
	 lXh6AFJrQLQaQ==
Date: Tue, 21 Mar 2023 09:19:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo.bianconi@redhat.com, daniel@makrotopia.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 00/10] mtk: wed: move cpuboot, ilm and dlm in
 dedicated dts nodes
Message-ID: <20230321091940.2f296a4b@kernel.org>
In-Reply-To: <ZBl65HJ/C0OXbs8p@lore-desk>
References: <cover.1679330630.git.lorenzo@kernel.org>
	<20230320214356.27c62f9f@kernel.org>
	<ZBl65HJ/C0OXbs8p@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_091945_691535_CC04CC45 
X-CRM114-Status: GOOD (  11.86  )
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

On Tue, 21 Mar 2023 10:37:40 +0100 Lorenzo Bianconi wrote:
> > On Mon, 20 Mar 2023 17:57:54 +0100 Lorenzo Bianconi wrote:  
> > >  arch/arm64/boot/dts/mediatek/mt7986a.dtsi     | 69 +++++++-------  
> > 
> > Do you know if this can go via our tree, or via arm/MediaTek ?  
> 
> Since the series requires some network driver changes I would say it should go
> through the net-next tree but I do not have any strong opinion on it.

We'll need to get an ack from Matthias to take it via networking,
but whatever's easiest.

