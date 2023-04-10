Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8168EC77B73
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 16:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PfjhdfUqhNdWDXkS6wpQJmFbKDtFfNdoftXgajcPRcE=; b=lndSjXbfQAOsHRqpar/IMQ1U74
	Rx20kgHK+BpvlZydO9MJBHn8n+3f3gcrpa+7bHaRJ1bv2MLNZh5molt/jsEOl9VKKLodqaLH0WbkN
	0mSlwtQdFXi6SyWpY0ULcvLYJi1XRsHq8RkNo4IA+iE9ADW1QRS45mjjFwwYdy5juyY6FDRAQmz4w
	66zUu4aTM4TKHVwAklmhlOubhL24VcPeujeUUoZiXNXMUCjOpfq8dH5IPeU5Azhumc/s0QkclfYaf
	RI+lsFfOIx5de26i7DUyipp7IeNWjjXLIzapqFQMUoRi0nrkgwokJ3kij3APexMYzr1tpxdV32MB/
	CYZcL5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pluEl-00FWHn-2s;
	Mon, 10 Apr 2023 16:19:23 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pluEj-00FWH6-03;
	Mon, 10 Apr 2023 16:19:22 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pluEZ-0004v2-1O;
	Mon, 10 Apr 2023 18:19:11 +0200
Date: Mon, 10 Apr 2023 17:19:05 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH v3 0/2] i2c: i2c-mt65xx: add support for MT7981
Message-ID: <cover.1680857025.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_091921_049528_FF7BBD0F 
X-CRM114-Status: UNSURE (   8.08  )
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

Add support for the I2C units found in the MediaTek MT7981 and MT7988
SoCs. Just like other recent MediaTek I2C units that also uses v3
register offsets (which differ from v2 only by OFFSET_SLAVE_ADDR being
0x94 instead of 0x4).

Corresponding commit in MediaTek's SDK:
https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/472dc5cf11d4359cb3e3f80577dba22df0696e43/target/linux/mediatek/patches-5.4/0901-i2c-busses-add-mt7981-support.patch

Changes since v2:
 * bindings come before patches using them
 * remove reduntant word 'bindings' from dt-bindings commit

Changes since v1:
 * add missing commit description
 * add link to commit in MediaTek's SDK to cover letter

Daniel Golle (2):
  dt-bindings: i2c: i2c-mt65xx: add MediaTek MT7981 SoC
  i2c: mediatek: add support for MT7981 SoC

 .../devicetree/bindings/i2c/i2c-mt65xx.yaml         |  1 +
 drivers/i2c/busses/i2c-mt65xx.c                     | 13 +++++++++++++
 2 files changed, 14 insertions(+)


base-commit: e134c93f788fb93fd6a3ec3af9af850a2048c7e6
-- 
2.40.0


