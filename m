Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F158C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 12:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c66iRv1goa5GjhYa6KEOjR+ARiSHuwQJ4FBaC8CFNYw=; b=L41SxNcEiecSyxJfl10jFEoBuW
	FT9n3qD1ha4rJObDPITE0hPxFtLpiPJR10z7dJW/3ML2S+aRmVpRaXqTWvCkBEqaOqv1e8y3Dln/h
	QI/4DA7sh2hUJq+zYIlaeeLga2Zf+N0nuAF9YP7SYICmJdsJr2biWDeA0vXEbrXqShERfzoFqHl9O
	3FE1PpgzhkgotxDMWwRcMHsyagPt1V8+BbGAQDItJ8ulKFPQopl7CM2flHsT/RPvPKXkcqQJKrVvA
	EVCrc4zDc8hXRXGTaV24be4HLtm3uSzGWoexxKCT+jdTRXrvP/Hf2DIBaDQRkX/PYgwqecVhevukH
	f+ddlk2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsTl-001OEa-F6; Mon, 11 Jul 2022 12:25:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAsTP-001O2y-OK; Mon, 11 Jul 2022 12:25:15 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2614266019FC;
	Mon, 11 Jul 2022 13:25:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657542307;
	bh=NaK1O1ALqqqYyyotd1Wb4JqV/Lt7Z/P9Hh/CnZJsMbY=;
	h=From:To:Cc:Subject:Date:From;
	b=Nr8dgLy3A9CaE1HpvbyhJOk8spxDst5WhwkXDS+mRbP56eiZukAsYRnxb1Vkj0qtE
	 XulesiWfB1A1KWqjMSfYClDGjD5cv9tbQm27GccCdtkKE+a4AHTqQ7NoLa5l44pc2O
	 K5rrxA1lWeXZQKD1KodjHQnsZtfaHlm5mL6Y1ObD3M7c2It9qnc3GFzQf+8PqbMNsr
	 xRJhSNQimQDzkk7qJC3+kn3eM2UhtuLx2utEBPPZorA5/fVF6GIzPMAqWcqHI0dt7A
	 EFrCqk1TO7kOE3KvgZDrXhsIFg+xLbEfM5RYU21uRWpaOYQ08ZlIETS6tc3Cq+y2vN
	 97holStZYfZBQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chun-jie.chen@mediatek.com,
	weiyi.lu@mediatek.com,
	mbrugger@suse.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	nfraprado@collabora.com
Subject: [PATCH 0/3] mtk-pm-domains: Use 'syscon' phandle for SCPSYS regmap
Date: Mon, 11 Jul 2022 14:25:00 +0200
Message-Id: <20220711122503.286743-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_052511_984804_2D3B63CE 
X-CRM114-Status: UNSURE (   7.17  )
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

After an attempt by MediaTek to upstream MT8186, MT8192 and MT8195
devicetrees, Krzysztof brought up a discussion in which it emerged
that the usage of a 'simple-mfd' device is not an optimal choice for
a number of reasons [1].

Reading that made me just write this simple code to stop nesting the
SPM power-controller node inside of a "syscon", "simple-mfd" node,
also allowing to move it outside of the main soc bus.

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220704100028.19932-9-tinghan.shen@mediatek.com/

AngeloGioacchino Del Regno (3):
  dt-bindings: power: mediatek: Document phandle to SCPSYS syscon node
  dt-bindings: power: mediatek: Update example to use phandle to syscon
  soc: mediatek: pm-domains: Grab SCPSYS registers from phandle to
    syscon

 .../power/mediatek,power-controller.yaml      | 130 +++++++++---------
 drivers/soc/mediatek/mtk-pm-domains.c         |  16 ++-
 2 files changed, 77 insertions(+), 69 deletions(-)

-- 
2.35.1


