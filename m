Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1216C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9EgxTQWYCERHo//1o54MUMz0DEJGa5abmp5/ZNzoMw=; b=HA48w409HhH55t
	FrVtMaQmOXC8DWVoLi8z6metLza+wuxll3XtuLdx14sbMVlWw4vnayOPxQDpfEPGrvvgIbLGooKcU
	i6vL+DuWkdOsG8IzIHKm6L8Zh+YpYCKnpC4yRs9+5QR4ZbcMF+nLQTe615qnYQp3qze3d3gK0CEl0
	WOtVRw2YQnXjSpiTwTQayWCUGVXSTXi3m9BPD97STb4GmsH5c3MiKIKRj4dQcdDx1BAIEAOFn/RV8
	vKfvFKKSJbZ/IqIkGkFJ8xkvXYGhN8kob682ig6Fq/+TBdQxkn36/JtF6ej1ymBhq4Sn6difQrSep
	W997/SSEjS+v5GNr7ktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnHR-00C1vl-1h; Thu, 17 Feb 2022 20:21:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnH0-00C1he-CX; Thu, 17 Feb 2022 20:21:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E9D3B61DAD;
 Thu, 17 Feb 2022 20:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49914C340EB;
 Thu, 17 Feb 2022 20:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129265;
 bh=kpVFqHR7EEivpuk4kXKFclkUlRQihynBK03dMXGSf38=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=IgI/7IWqLTNpU/Fjcg7z04k64BFxsmQVfKF8MT3WpLePlvMZRYvWkp+80kABel9Bt
 +waWETlQKm3QWGPlJe1tHEMnn4hjZlyUPSOiIjIs1mKvnU2TV54H8eqbRIjLr+dLgx
 HcgaH8mi+CqzPoc0UQfGLSG628YteVpmJSW9RmFF4wds0wuDNxDoywiLi/9y9Q648h
 G56V+6ZzX36GHSEAwOZ7uDzgx1jwoiUjXjPMOSEZMRFRnhMo0ggJ1p2oWPLneEkD8m
 sbvdkgDkHYGqyaToVvhhjbeKCgnkWejgWTh0Nca4+aBd6KZBXpthTLWY+2rvvcvlpL
 ZJMOazl152hXQ==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-5-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-5-wenst@chromium.org>
Subject: Re: [PATCH v3 04/31] clk: mediatek: gate: Implement unregister API
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 17 Feb 2022 12:21:03 -0800
User-Agent: alot/0.10
Message-Id: <20220217202105.49914C340EB@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122106_490869_1B85D8BC 
X-CRM114-Status: UNSURE (   9.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Chen-Yu Tsai (2022-02-08 04:40:07)
> The gate clk type within the MediaTek clk driver library only has a
> register function, and no corresponding unregister function. This
> means there is no way for its users to properly implement cleanup
> and removal.
> 
> Add a matching unregister function for the gate type clk.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
