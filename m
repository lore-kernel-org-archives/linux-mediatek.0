Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D5EC36002
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Mar 2025 09:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McEwD/1d4/Eide2Hwd2L4937F2DhEadKA7AdOJgFrLU=; b=NpvyP63ARvwP69S8V9A0NJ6aX2
	iNm1ZNmTiMw6pusikqt9qnQwJSNVxNQ97AfbQP0gA5E+gtkubgLoco7zbc35rMF2n1qY+w3LJuAYt
	4dvV57WCeGZwO1vgXPgqYMX6BVqe2P///MUNv4B4vPKlPlsx9eTVaPQnIyTgaNpNub4v/kuY5jXK0
	DCwI10JEg6RQT1FvC9Ai9N6K4Kq6Hds3Nugn3KS+O4NsGgvqaF0fryp7xiGdqn4zcza8THXIxycHK
	UPgR+VZ3a5yExvPO+8F4KqxNN7V5+Re25e8WK/ir5XQAO6FoSIC1igcQxwEnd+F1UbusZAdROAdw/
	/NhfK8Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tweIS-00000002kBA-0d7q;
	Mon, 24 Mar 2025 09:40:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tweC7-00000002j8z-00TR;
	Mon, 24 Mar 2025 09:34:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E9CF5C4839;
	Mon, 24 Mar 2025 09:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF6CC4CEDD;
	Mon, 24 Mar 2025 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742808846;
	bh=FvQn3givm85EANWlfsUtGcpdsUFHMIzmUrIJkbrLKlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HA98kcj3d+kiZI2Lofc3n1TBAGS7wYTceRz1BVXH62/B4d5TNdiIjqZNskJcWKKtz
	 Vpjj0auztCgtdivyZ/WHR5b0zJT8QvR6jSYk4wTuy+2oYygLaULIWN+HSsUQ7Uo3/P
	 1BZnR8plpgEWS3OmPmzjY6W/VBMYs6kI2b9dOLVchttfqBHLuv12TdXHDscJIA0lyz
	 SoJ7xwUJoBzbbUejhLYLX84VY5pUXIVbxht9NSjtO5+M0J+BrMPKVlEzZ2FVCgKbmu
	 wUoN4brf8KOLM6bRVYbq25XEeBlzOUX52q99zgulHr/en2hem1Hd0sToceVrHw0ALw
	 gQx/wmwyQHGrg==
Date: Mon, 24 Mar 2025 10:34:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
Subject: Re: [PATCH v2 02/15] dt-bindings: soc: mediatek: add mutex yaml for
 MT8196
Message-ID: <20250324-amusing-pearl-yak-9d925a@krzk-bin>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
 <20250321093435.94835-3-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321093435.94835-3-paul-pl.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_023407_096752_4E7BB360 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, xiandong.wang@mediatek.com, chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, singo.chang@mediatek.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, treapking@chromium.org, devicetree@vger.kernel.org, nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org, sunny.shen@mediatek.com, p.zabel@pengutronix.de, sirius.wang@mediatek.com, matthias.bgg@gmail.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 21, 2025 at 05:33:31PM +0800, paul-pl.chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add compatible string to support mutex for MT8196.
> 
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml        | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


