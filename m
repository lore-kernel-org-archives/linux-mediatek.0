Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2646C4707B
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bENDPfHqd20Jam1npGGs351jrK6EIWZ3CcF1UU31Ixk=; b=nI61xSb0O8s0ILC6IItCF1omzL
	IO4okMMjliQ5xiSizS29hwASWHDzWPOPjEqeYmS9wx60+w/5wlOdVPnTdfUdKvm/zUP1MDaVjZzEV
	BBs+wGdY2lPtq0Emn2oVzVS6B7AYTWRq72SkO7gIzqOC4BdapRWRzv+CADPebeK8ne8pv7pbAIDVO
	Ra3f7x/PsMly3fHEu0lPtVi1YldUvgCh0nWG4Z3gYA0Bi7WJZeKGrJ5aAABkcT/8hmJu+FE2KI+Gr
	sID01CVTGvr3WjERbhuBHb8nqP7Qax4NY5O5vq80jrCL8wefCYnQroyYGQs6BjcL1dePtJ2zBrMer
	qogzk+mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZWD-00CJ23-2S;
	Wed, 10 Jan 2024 14:25:21 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZW9-00CIzO-1n;
	Wed, 10 Jan 2024 14:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704896714;
	bh=vwOsYK81Kz7ekPSjYz//FcETzOWODCjxJchEEfAb39s=;
	h=From:To:Cc:Subject:Date:From;
	b=D5B/bia0HVVwkZiV0SO4gzRNmHqonfK01qPchiAJpbfX5nI7JJQ2tgcRNDUrM/Pu1
	 wI2R0GxMa3nTsiPNsLq5dej97eMn+I9kcFXWTLHm76Rdmftx5E3BGVm74V5aha/+50
	 AvmIL7SjElDBUEitXy4RYk3t4Bn0W1y5T5I2gdUFnQZkvCYNtoDA9fAnQnHwGRmO8m
	 lRl3FSYNYRzHpVcofQRSgoYrYpJmP/pvlAToPIDaEeUZG80EgFeHX+lqVGoN4TlsiE
	 ZceLgY4fZxZCdA166gNLRIKjECmYdTiEh9H3R3kHnAIiaWPebjTu8xYV7zkeNESp6d
	 kenMdZhU4HUug==
Received: from localhost.localdomain (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D94AE378045F;
	Wed, 10 Jan 2024 14:25:08 +0000 (UTC)
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	"Hector.Yuan" <hector.yuan@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/2] Fixes for hang on MT8195-Tomato during mediatek-cpufreq-hw init
Date: Wed, 10 Jan 2024 11:23:00 -0300
Message-ID: <20240110142305.755367-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_062517_759134_8083A3EC 
X-CRM114-Status: UNSURE (   9.44  )
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


These two patches fix an issue observed on MT8195-Tomato where if the
mediatek-cpufreq-hw driver enabled the hardware (by writing to
REG_FREQ_ENABLE) before the SPMI controller driver (spmi-mtk-pmif),
behind which lies the big CPU supply, probed the platform would hang
shortly after with "rcu: INFO: rcu_preempt detected stalls on
CPUs/tasks" being printed in the log.

Changes in v2:
- Moved supply phandles to CPU nodes in DT
- Added fixes tags
- Added patch to verify CPU supplies are available before proceeding in
  the mediatek-cpufreq-hw driver

Nícolas F. R. A. Prado (2):
  arm64: dts: mediatek: cherry: Describe CPU supplies
  cpufreq: mediatek-hw: Wait for CPU supplies before probing

 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 32 +++++++++++++++++++
 drivers/cpufreq/mediatek-cpufreq-hw.c         | 19 ++++++++++-
 2 files changed, 50 insertions(+), 1 deletion(-)

-- 
2.43.0


