Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE43C3600D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Mar 2025 09:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JphACV6ZDAQeGL0J/qquy6milwxYU3EcmuK3JnZYnxU=; b=HzgJOz5MNyYVV9o/lR2+8YvS+N
	b+G4aMM+r+zt9AyfjYj7SCYLYEbpyQ3I3jFnShMpVfkmEkC9znw3bnhDBMYQnTvHWmnA0bbyIbyzk
	qixTUeS/1qe3DhbWD9GtA9dX5s2YA/WICnm4dhDclJumSv0+HznKi+3LO078igkVnV0CiRVYf37GV
	jHA0B9spaNXLLRZqxklVgiP8rsH3u69XIA9K+NST8WI2C1dMOiKCpiX7ev2eY7k5oVsKSmtZk5Q4H
	CE8UyauTWVGL69t48pgBU2tGwqTSphHpsOR6f0Y3wHJOLxFVWbhISGNmn8OM7r3OGW2U4UaIZYirk
	+F4fquzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tweGk-00000002jsk-0mKE;
	Mon, 24 Mar 2025 09:38:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tweBV-00000002j1o-3kk0;
	Mon, 24 Mar 2025 09:33:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25E7343628;
	Mon, 24 Mar 2025 09:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6242C4CEDD;
	Mon, 24 Mar 2025 09:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742808809;
	bh=H4hSWm3+0vSdTwfpHEZaWWMhrb8/UitvhMtuYnogIRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U8EPnFtyK2P9GsInw4s3FVly8Fms0US3jqsf2gRY/Z/Wk8PbkmG7g8Uzfb9QBCCuE
	 KziHU9pbxhjntelVwlitNL2K5XK62VT2toTES+Z5h8XOL+XJH9vUDH93EVMR50FLri
	 xgTAb8YZRzE7F3pAxcEuQxbU/bUOHWmDaNIQvZI+epgIJ6xVXfLgIyHsPIhuxz8yrN
	 lacqD+perTWUK2daQxQy7NGIITCSDXIBSKAuUrWRDs8UQt4J0ruTG6X1iY8nNt5ITO
	 iMBlzV/56m1RS8DVx9BqhREVyqqGMmRsmrNrig6wUika/30+9iBJI29iMIU+fzO3OI
	 /3dMGXkZW/vsA==
Date: Mon, 24 Mar 2025 10:33:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
Subject: Re: [PATCH v2 01/15] dt-bindings: arm: mediatek: mmsys: add
 compatible for MT8196
Message-ID: <20250324-bipedal-berserk-carp-6eeb5f@krzk-bin>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
 <20250321093435.94835-2-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321093435.94835-2-paul-pl.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_023329_954041_ABCD5853 
X-CRM114-Status: UNSURE (   6.66  )
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

On Fri, Mar 21, 2025 at 05:33:30PM +0800, paul-pl.chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> In previous SoCs, a single HW pipeline was an independent mmsys,
> which included the OVL module, PQ module, and display interface
> module.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


