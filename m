Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C59C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 21:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vf1aLtZiqyko3EpH5ue1f1osyMLahvaqkfpEGbJ74PA=; b=gB5d/kvCjeoDUs+qg9O6HIOquH
	lbmLITzvKZFcDnu0lcPtxAUCMDtjFykecFvMNWwy6iKBZ8NIr4ATQ3IRh7BX1qjG+uvdLIA46UTm7
	rMNL/tpgzlSo2LD2X+1x0wJiAlru/DakW9iSmItREWk52D4W07k4nzE3kQG06MGCwq5frFPNQtO74
	m6JpWviDTI9WaDHdGbbuJHoZXiXS3nahzz6vfmg8LCaw2iN0WYqr5dBIqfVPOibFWQ/uBPlhnlQXj
	dAnNzvXmXpBLy1Zl42sYSEqmCyt0IB9wOSeopqBmiFMGkbwBTwH6ZaF5OS7d/VPmtGCzix4UFpwzN
	FwBOjtvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGoT7-000T9k-Rf; Wed, 27 Jul 2022 21:21:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGoT4-000T6S-9N
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 21:21:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id ABCFCCE23C5;
	Wed, 27 Jul 2022 21:21:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B6AC433D6;
	Wed, 27 Jul 2022 21:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658956875;
	bh=hsXWvrOQMYYiYAKmb1RQ9cRC/SAAdiV4e8gFyATgBZc=;
	h=From:To:Cc:Subject:Date:From;
	b=EEvL5aPwbxkTIK0fAlzahjWAu8MzgvdIF3U3LIGA8rCYsvL0YGXFb7ylm/lRQg5pq
	 lVIl2MS7rFWOv7yN1KzxvMNpVRaUGf6TMooAqwGwW6T1fuU0khqWqZYozE4suAT+Ly
	 NhH1XzA5l/ltONaK1Z/JyI41gJQCpiUtIjdslVHgx8BZ8Fv7c1iqfjVwzTCj9AgDmT
	 PjPz04hMVLaPMi7l3k4RXha7m0UqmZxkf7AOkiNfbtJtmkX7IcKW06ezmw+IYWWjeC
	 gVeBNV0NRw95deBfi09BdzJC/LtE/FEmOUnBPhVjNs0XcBNqxGSAvHNluvpaXWSqx1
	 6nyHHvU7qKn1g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	ilias.apalodimas@linaro.org,
	lorenzo.bianconi@redhat.com,
	jbrouer@redhat.com
Subject: [PATCH net-next 0/3] mtk_eth_soc: introduce xdp multi-frag support
Date: Wed, 27 Jul 2022 23:20:49 +0200
Message-Id: <cover.1658955249.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_142122_530993_153681C7 
X-CRM114-Status: UNSURE (   5.83  )
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

Convert mtk_eth_soc driver to xdp_return_frame_bulk APIs.

Lorenzo Bianconi (3):
  net: ethernet: mtk_eth_soc: introduce mtk_xdp_frame_map utility
    routine
  net: ethernet: mtk_eth_soc: introduce xdp multi-frag support
  net: ethernet: mtk_eth_soc: add xdp tx return bulking support

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 193 +++++++++++++-------
 1 file changed, 128 insertions(+), 65 deletions(-)

-- 
2.37.1


