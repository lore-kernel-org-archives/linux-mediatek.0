Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D73CF34AD
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3euPA6qL7ltHS1xtxdjoJZOdYUM4LjU1WzYcAuHU9o=; b=yvp3qG/8Wx98PC/2stpjNNblTb
	06+pmC9RfjNzCxpbeowVledPMF33EsXxNI8npsXvCn2aqhwe/YHE0i4JCgcXFCNoLTmGfIYZOeCoK
	QjZw9uKTZGdR7oKZoW1oCCUWBUExp/yisehkbtH/VAcWum2vzGw4B0ZGEVOhd9+BI0YU3h8BdWDO2
	r7m9SktLWn5vmZCtXcqEFJvkf/1i+pDvb5GYdGUq+QjVkh3IRWlMV8vEc40QZw9l8/mD6cGLPTcRI
	Lz96q912Aa6gtUTVszW0reUukc9l24zVODcYqlQre0z/SBTer9tn7r0l/vxhE5h+0LmDb0Oi8tUZ9
	WmtUv2fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swLxm-00000009DCT-2ntg;
	Thu, 03 Oct 2024 13:33:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swLwU-00000009CoM-0uQO;
	Thu, 03 Oct 2024 13:32:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0D6C8A43BEE;
	Thu,  3 Oct 2024 13:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28EE1C4CEDB;
	Thu,  3 Oct 2024 13:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727962349;
	bh=mgHYoUmlBkOxDJsSfmWy9DGOO2mWjqY3y0a9Y78YvcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FGHKdCXbLi15mQTk8bLjEtLcDC0Ud6Z1On1IPbeuL9JehGC6AOtgoyNto09Y4Igb1
	 igp2tx+ZNkZIkvW00aXfB16zflRYiGgTz0v9ubXVMpgbSR/t0VnPrpDgGA3wuS2VGi
	 2+JE/JepJ5cR/6qVp871HPoL36tjK1rpES/R0u0H4j/h0I3UFh4Tmly2OhxCM7bHly
	 DQYpj990BWAYH3BhZHhyEYGK0BBK9DwzysjfobTF00+o4PWyDXh11/o39zluclKa1U
	 J+CLzPIgWS9QVksT81HL6J4UMxdTB9Qdwj9Kb907yOr/R35Bp6dF6crl8eKyJArLzd
	 jJjSctXoq0ORw==
Date: Thu, 3 Oct 2024 14:32:20 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next v2 1/2] net: airoha: read default PSE reserved
 pages value before updating
Message-ID: <20241003133220.GM1310185@kernel.org>
References: <20241001-airoha-eth-pse-fix-v2-0-9a56cdffd074@kernel.org>
 <20241001-airoha-eth-pse-fix-v2-1-9a56cdffd074@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-airoha-eth-pse-fix-v2-1-9a56cdffd074@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_063230_339811_5E6967FA 
X-CRM114-Status: GOOD (  10.07  )
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

On Tue, Oct 01, 2024 at 12:10:24PM +0200, Lorenzo Bianconi wrote:
> Store the default value for the number of PSE reserved pages in orig_val
> at the beginning of airoha_fe_set_pse_oq_rsv routine, before updating it
> with airoha_fe_set_pse_queue_rsv_pages().
> Introduce airoha_fe_get_pse_all_rsv utility routine.
> 
> Introduced by commit 23020f049327 ("net: airoha: Introduce ethernet support
> for EN7581 SoC")
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


