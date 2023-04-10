Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4958FC76196
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 16:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3toTYvGNgCDqL7D1TOqCrOa2+AH5J29maRpT5o9ZBQ=; b=Xuue4xGjU/RjS1KG1Zgf0xKRBO
	r/iR1rOGA2bZpiCYoDJCzNRRY8vtUDAGlWPazIYVu2d7BgCJoPieO0JoSsDJ8Kc1QYS0C7s4Aer7G
	Sc5vrr6rXEg+jlH3hMaludSa461aBwFnh3cBVgbBYLdif/PV1GEUfgYhjtyGw15SS9UQnttbszT/J
	TLmL2cYx9ug/5SFT9bmBuV2HIgBKk6+VI80r2Juo+r1OTtxpadFwGqP5nga+stn0o3+ZC/XNmUflP
	alFvMmdx537LxKNrqjOme1a1aztLNv3e3hotC7XEZ8pibhP7UGxUo4eMk/xNqbTRSnlT5iAgiG3+K
	uNEXRLDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plurr-00FayX-0A;
	Mon, 10 Apr 2023 16:59:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plurj-00Favs-0e;
	Mon, 10 Apr 2023 16:59:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BDA1060FE9;
	Mon, 10 Apr 2023 16:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1187C433A0;
	Mon, 10 Apr 2023 16:59:35 +0000 (UTC)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-tegra@vger.kernel.org,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] memory: tegra: read values from correct device
Date: Mon, 10 Apr 2023 18:59:27 +0200
Message-Id: <168114590173.12295.16629807729065292748.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322234050.47332-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230322234050.47332-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_095939_278649_19AB48C3 
X-CRM114-Status: UNSURE (   9.89  )
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


On Wed, 22 Mar 2023 23:40:50 +0000, Diogo Ivo wrote:
> When reading MR18 for Dev1 the code was incorrectly reading the
> value corresponding to Dev0, so fix this by adjusting the index
> according to the Tegra X1 TRM.
> 
> 

Applied, thanks! It's late, so it might miss current cycle.

[1/1] memory: tegra: read values from correct device
      https://git.kernel.org/krzk/linux-mem-ctrl/c/be4c5c6e84429e87cfdf1c8be350a49a714a93e2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

