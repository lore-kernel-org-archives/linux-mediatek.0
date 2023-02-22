Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A88C6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v/9WYra96LwEc9kw45anrv2JUycxpnlcWIOJ2tMoEHk=; b=2w6KAbth5Kcx1QXjmQ1Rxg6/oK
	Cc8Y69+Rch8Qna0zoKVJqrMUFDSQ7mdQGzkr7WQLhXKFjNQZ3rNcCGZhh0uFChL8iMgrNYOk6foOB
	nS1BaQ05mBcwE2gZPdbPqlc5W46HxEwIQVM+If6Ad390QQ8RJLbBwcCRF4Yl/5tjqefwnlgQbsZZD
	+UrPb507pdcTalhZE4TVhfxsZe/ig4YRM9ceh+DiO+CdSYCv/2q0HNqwSGieZrTq8D5OzzqjraZGV
	GSdP10HeURF68OGoPk3KpkU+SHEcdcrtR/R9yZrJp2CT3X2LArzdC9l5p9jZuJ+lXbp6Lj5Tb8sp/
	U0A6k3Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmF3-00BrjI-N8; Wed, 22 Feb 2023 10:20:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUleP-00BYdu-Ii; Wed, 22 Feb 2023 09:43:03 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 542C6660215E;
	Wed, 22 Feb 2023 09:42:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058979;
	bh=0jvW+qVjVyFbdPGbJSy+ls56McRznRnqH8nf+HGON0w=;
	h=From:To:Cc:Subject:Date:From;
	b=IDnhTy30pCzSC5pdwVh6livJDWWihQU4BASCnAN3HuBgoHUY19aMAa+X4JbX05qo+
	 7pCr9gcdUvx5Sm3Ppg2q/0KgV6hWTzgfptWLDiiRf1VCO2RI4eNRh961hTqgLUXy8E
	 suNiKuDIxxkM0EoJMm2qqVttVGag784ArQ9WqLu9Uv2REFVs066PUPP8znx7xEPAQk
	 2iv7AYY1gfdH0VStk6ccH3fBK89+N67yblwFeTMFx59If0niac4wFjp3rbBK60SwIu
	 +RR70LRCgxnhtHPf9RXPXerHudNNUMUk2piPpp+6xfpPYsGp4+Zu9BaPRwWlfo+Enw
	 LSeJ4NS0FhDGQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: jason-jh.lin@mediatek.com,
	chunkuang.hu@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/9] soc/mediatek: Cleanup mmsys, mutex, cmdq header
Date: Wed, 22 Feb 2023 10:42:44 +0100
Message-Id: <20230222094253.23678-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_014301_781017_FE41E72B 
X-CRM114-Status: UNSURE (   8.43  )
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

Changes in v2:
 - Rebased onto Matthias' v6.3-tmp/soc branch for VPP mutex conflict
   on patch [5/9]

This series adds a proper remove callback for mtk-mmsys, adds light
cleanups on mtk-mutex and, more importantly, adds a cleanup for the
CMDQ helpers.

Special mention goes to the latter: this is just in preparation for
a larger cleanup that I plan to do as soon as possible on other cmdq
helpers users, being mediatek-drm and mtk-mdp3; that's not performed
right now because, in the case of drm/mdp3, the cleanup is not entirely
trivial.

AngeloGioacchino Del Regno (9):
  soc: mediatek: mtk-mmsys: Add .remove() callback
  soc: mediatek: mtk-mmsys: Use module_platform_driver() macro
  soc: mediatek: mtk-mmsys: Compress of_device_id array entries
  soc: mediatek: mtk-mmsys: Add MODULE_DEVICE_TABLE() to allow auto-load
  soc: mediatek: mtk-mutex: Compress of_device_id array entries
  soc: mediatek: mtk-mutex: Replace max handles number with definition
  soc: mediatek: mtk-mutex: Use module_platform_driver() macro
  soc: mediatek: cmdq: Add inline functions for !CONFIG_MTK_CMDQ
  soc: mediatek: Cleanup ifdefs for IS_REACHABLE(CONFIG_MTK_CMDQ)

 drivers/soc/mediatek/mtk-mmsys.c      | 135 +++++++++-----------------
 drivers/soc/mediatek/mtk-mutex.c      |  80 +++++----------
 include/linux/soc/mediatek/mtk-cmdq.h | 114 ++++++++++++++++++++++
 3 files changed, 182 insertions(+), 147 deletions(-)

-- 
2.39.2


