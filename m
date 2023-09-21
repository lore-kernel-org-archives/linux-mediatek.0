Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98385E71081
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 14:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mEkl2/pj/h1q72Uql2p+TVnXavWq5n5/3g0t9a79Nw=; b=GGFDP8fpBSLXSqlZp0ke7BIPYk
	q0kunAJlwh/djbCVIgmv0/LFXInZ75DK55irRQk7lNRJcXAw+Kg75yaF17o1j45CicTpKgH+sGpL4
	8WEZU3LaB3jxFVj+fsRA16IKaFReas+bjdVEhFdBYKAcEsOc7dEzpWjhj47dEibHvet54Ndj7b+fK
	baMuMdYLSdOg/jgaQqJQEAZ9+l+ypy6myIDTM/Azr4FQD72dJYC4LG4j0GkY+RzlXQOUdsLgvk2WI
	2A58iRZtdhxxDnzhNg2EM9hOra4ipqJj/P6Mvlh6H81Ga2iSuG9fXuQzyYjd1vEJyqKRtVIcWAiu9
	CRtZyWWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKgn-006HHQ-1u;
	Thu, 21 Sep 2023 14:29:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjKgc-006HBt-2L;
	Thu, 21 Sep 2023 14:29:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 1A9D3CE2216;
	Thu, 21 Sep 2023 14:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA81BC4E76F;
	Thu, 21 Sep 2023 14:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695306583;
	bh=TLvaJrIvbE3wSBgqozLTIG4l1mfwrfkwlcmiyZgo5cc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Yc8QPaUquEBjB1CSrc05c0riWprQKnlPs6h00lgeuRtRfYvx8vs5so2GFIzgYL933
	 Ahhve/aeGebRnovdYJ8vhUpOGSzIgnGmNNeGeUB6FFgLD+pnWzEI5NUK3RP0OjQ2Qt
	 3MqNy7R4bouj3AJJaLHcoufSFvzT2ENRMe8j5kDZhihTYKrsshU9hrctKcIpdw6ToK
	 8Sr9dB256taMmBdgCC5Cs2OHx7gcNdi/6f3xvb3/sb9H9kEY0yLpCVFQOzuuC4kSQ8
	 Z64XumVNjvBjmalpmWsSa8D6G+yu5zFsOaghT3UZ2Z60ocESMGcFxJm5I/WFkPMn5z
	 /hgWUohSjMpGA==
From: Vinod Koul <vkoul@kernel.org>
To: chunfeng.yun@mediatek.com, kishon@kernel.org, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 Shuijing Li <shuijing.li@mediatek.com>
Cc: linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com
In-Reply-To: <20230908075310.17825-1-shuijing.li@mediatek.com>
References: <20230908075310.17825-1-shuijing.li@mediatek.com>
Subject: Re: [PATCH v3] dt-bindings: phy: Add compatible for Mediatek
 MT8188
Message-Id: <169530657939.106263.17269838650335090138.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 16:29:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_072946_941835_0248A513 
X-CRM114-Status: UNSURE (   5.20  )
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


On Fri, 08 Sep 2023 15:53:10 +0800, Shuijing Li wrote:
> Add dt-binding documentation of dsi-phy for MediaTek MT8188 SoC.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: Add compatible for Mediatek MT8188
      commit: be5747285ea0774501c5c9d25cbff43e6b0b53b9

Best regards,
-- 
~Vinod



