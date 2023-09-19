Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA081CD54A9
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 09:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IieZRrI9GUhZP9IQ74HE7L/8iWDr/o2dJIwXOd6Ieok=; b=CLxOdN0u6/v056Y+xXGwhgwQVE
	P1wp/COHessVbJip6mmAoXCBzUHGHFCr0e4v2SA9hNcVnTuT03oz4cga7I/koY5a+6gt6MtKcH8PC
	FPRjxdEDAgT3HENWCmShew6xU0PqjnOzbUcVA4alcUaq2ZjLyaFFXV2lqrADdQ7nLQYMaBaTaIc7F
	3t7+bGQThD0n/4pQR8NPm2ogOTy8NuFMX8FbucjjkbOS/lC+AVbHfV+0vO+BofSkvgCq3SLFKbZyq
	U3jMBJCJsSRlxzl2JE2JOqXoFTL2JlKYXoUJVFsNvb90M1KT3aYi+jc3UVpzj+Vun9bpc0rvYodhl
	uiciJO/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXWJ-00HZdA-2I;
	Tue, 19 Sep 2023 09:59:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXWF-00HZaz-0M;
	Tue, 19 Sep 2023 09:59:48 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3981666003B9;
	Tue, 19 Sep 2023 10:59:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695117583;
	bh=vdjqwvikUTSEg0RbloUXKWZcw3Q5awlw9Ycji3qqMhk=;
	h=From:To:Cc:Subject:Date:From;
	b=ETgSxmKdx+EdOECb3X6z/Eufhpv6ukE7JbBn15ai3osywNTl4eRwy2/z83jcsMhtF
	 kJ+EiRyyk1XijgpKCmY6PuWhxGhLqARkr+99xP28ojur82Np2/OZUDUo05svC4slJ/
	 J5isqL7u5HS3t9PnWHWXSUGVNuhrG7eDP7L8joqwI4571NHyy9Ui3ZumHl03RwEcLW
	 9W+qdcfAGLIRwLf/fPSLqj07fQkrpeCET/emULTLZs4OmUUwcPPWZdAAky+PKJQXUe
	 S1raQgsjZm3RZx9dnQ1NhGvAIm3cy+/9o7hbx0Ax5Hw9AspXjQRO8GyngAy9ysXJZL
	 h3QN0hOLzqmKQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mchehab@kernel.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	moudy.ho@mediatek.com,
	hverkuil-cisco@xs4all.nl,
	sakari.ailus@linux.intel.com,
	u.kleine-koenig@pengutronix.de,
	linqiheng@huawei.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH 0/2] MediaTek MDP3: use devicetree to retrieve SCP
Date: Tue, 19 Sep 2023 11:59:36 +0200
Message-ID: <20230919095938.70679-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_025947_341660_951D1FF4 
X-CRM114-Status: UNSURE (   8.28  )
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

Especially now that Multi-Core SCP support has landed, it makes sense to
retrieve the SCP handle by using the "mediatek,scp" property (as already
done in MediaTek VCODEC), both to select one specific SCP core for MDP3
and to avoid walking the parent node to find a SCP node.

AngeloGioacchino Del Regno (2):
  media: dt-bindings: mediatek: Add phandle to mediatek,scp on MDP3 RDMA
  media: platform: mtk-mdp3: Use devicetree phandle to retrieve SCP

 .../bindings/media/mediatek,mdp3-rdma.yaml       |  6 ++++++
 .../media/platform/mediatek/mdp3/mtk-mdp3-core.c | 16 ++++++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

-- 
2.42.0


