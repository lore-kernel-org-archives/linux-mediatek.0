Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF78C19F32
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Mar 2025 07:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Yg1Rig/amEtbpBCudy1vxzfD7TLJX4N5l4TYsdbz1c=; b=LEtZ0lAAaX/iAT5L4pjj69lpDW
	9jEDdON271ptsUhVf/Jpizq9tWX9CyeMAfWkuURO7EBcsXKuY+7pppp77tauYa/62v8Tz2tz0NXMa
	18rdyCrCl+VQvOVEvlLK7EVJif/FTbq30E0b/GRlr0xcmXkONPO73aA4WAvaBpkiJvlwzQI6BsOU/
	g4pMF2o4DRVau5tIJu9mDhzkjWsxcPazIieE1Jo8rVfpzix+bNaQaQe6eCOzETdYTktd8a9m3kOt1
	Pcjb4gpGXw0q5BfAx0eZDTOoj9L1y9WeWeUu7PRkqMNBUVrmAVTbtw5HWxoZfN9/V7mzJX26AFyLu
	ETiEMcAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSAT-0000000DR73-13cr;
	Fri, 07 Mar 2025 07:30:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqS8o-0000000DQnl-2q6c;
	Fri, 07 Mar 2025 07:29:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2DF4AA45396;
	Fri,  7 Mar 2025 07:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C8DC4CED1;
	Fri,  7 Mar 2025 07:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741332545;
	bh=2QV4HyitRVqMFXPW4Hi7wniqOCXjn7Z/b1mVwIcEbs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWklyrBsCLgsFwE4UpYcmgzEcle2ZjJQEOQhpnkw5nX0m//baSpQhvwAlVWxTum4d
	 vAQ8gJ8WV3oNddWIKGgM5ZocxhTUnnzawLDhUJGSTzDfPQVr2eSljSGBw6TQk2Ss7p
	 PIx1D0w249ZsHFvtVVIq/qVcCbQawwBToLy+l4DPZIaWCJ3i3X3xufgoQ5sxxA/ZuE
	 YFoy+wE6ZV9y40CTDBA/JWdaWO2QnhUrqiMKUv8d5WF6OubfcChH/LsZCykOoAalZF
	 VVnDCjcl1pEI12NF/r+xd2+1DSQpp8lwNPFG8nWpjNIozwRuRQxP0x9YmjQXF+LwDS
	 oyw6Iw+1tATmQ==
Date: Fri, 7 Mar 2025 08:29:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guangjie Song <guangjie.song@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Richard Cochran <richardcochran@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 06/26] dt-bindings: clock: mediatek: Add new MT8196 clock
Message-ID: <20250307-mindful-raspberry-cow-c112ce@krzk-bin>
References: <20250307032942.10447-1-guangjie.song@mediatek.com>
 <20250307032942.10447-7-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250307032942.10447-7-guangjie.song@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_232906_800276_6C537365 
X-CRM114-Status: UNSURE (   8.04  )
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

On Fri, Mar 07, 2025 at 11:27:02AM +0800, Guangjie Song wrote:
> Add the new binding documentation for system clock and functional clock
> on Mediatek MT8196.
> 
> Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
> ---
>  .../bindings/clock/mediatek,mt8196-clock.yaml |   66 +
>  .../clock/mediatek,mt8196-sys-clock.yaml      |   63 +
>  include/dt-bindings/clock/mt8196-clk.h        | 1503 +++++++++++++++++

Filename matching binding, so mediatek,mt8196-clock.h

I would not even dream about people testing patches before sending
them...

Best regards,
Krzysztof


