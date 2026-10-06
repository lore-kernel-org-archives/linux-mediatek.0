Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F28CA5FF0
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 02:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3eMaA/dAfZyaaGYxGAXlh6BdUVFikHvMq+/MCgOaIU=; b=VrSk6JtJQDrQ3kXKU2NcydI44R
	fSRJuprzCIDroN6EeNVFGEHDu2SUGscMlZIo6rnqJuMVSSnFJzU2yyz4VWFvQsCbcQPjxSuz16+t3
	bLj6ywb0E79hNLH3H6z2FJh9XC6hONP77CmkzatMW1mNUGi2Dgw5/mGS+9mMUWAff+88RLXuXiSqA
	Q6FwxF4g7wzdKPqrptbQpq/TPqCCCa/bG8lcjqr6GNSpuKvVKUHBMVEPKDmm34GWejDGrFTK3+K21
	6wIZkMoo13pCrO8YEEc1TcEI3oCwTrpn9Zd3bQ128JpqjY33SlOAxZsqPBFJW8ZZzb5txm9n4tsCv
	9u0UaEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDv9v-0000000HWFB-0P89;
	Tue, 06 Oct 2026 02:44:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDv9t-0000000HWE5-2RxZ
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 02:44:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BEBE44784;
	Tue,  6 Oct 2026 02:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3D71F00898;
	Tue,  6 Oct 2026 02:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791254641;
	bh=w3eMaA/dAfZyaaGYxGAXlh6BdUVFikHvMq+/MCgOaIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EfA/Km37Mj1DsqWmYwF/N9WuXnilKwPt5410n92WnDb+mGs/nL7NfFJdcaN8QKUdD
	 QFnk9vQSAJLjvr9hxZENYxD6E90WhURJLJXbLSzRdiI2aJCvQJbkEobIYhmsHkTe2J
	 jCDum9UnGplArfF0WgAikdUWtz/mJDZtZagnS6H4TPaP9mny4FHcnOM7ZTY/J8JK2L
	 dUrfdqqUS1Uj4OKbkSOBnacuco5gI9JaF8inB2PxM/qV4oT8NTSXU3Kf3TOeziieyY
	 zAbnDkOiyWOVCEYnW0ramUvMdzVKtZn7PyIovNInFvwyMUOzhU3JnWflA8cby3sjhG
	 l1uClUDRfdlWw==
From: "Martin K. Petersen (Oracle)" <mkp@kernel.org>
To: linux-scsi@vger.kernel.org,
	avri.altman@sandisk.com,
	alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	bvanassche@acm.org,
	Naomi Chu <naomi.chu@mediatek.com>
Cc: "Martin K . Petersen" <mkp@kernel.org>,
	wsd_upstream@mediatek.com,
	peter.wang@mediatek.com,
	alice.chao@mediatek.com,
	chun-hung.wu@mediatek.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ed.tsai@mediatek.com
Subject: Re: [PATCH v1] scsi: ufs: core: Hold a clock reference across the probe
Date: Mon,  5 Oct 2026 22:43:52 -0400
Message-ID: <179125457799.2089616.17339382964055151353.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909091045.1134956-1-naomi.chu@mediatek.com>
References: <20260909091045.1134956-1-naomi.chu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 09 Sep 2026 17:10:45 +0800, Naomi Chu wrote:

> Clock gating becomes possible as soon as ufshcd_init_clk_gating() has
> run, and from that point on the probe keeps accessing host registers
> without ever taking a clock reference. This has been safe only because
> of the state check in __ufshcd_release(): gate_work is not queued
> unless hba->ufshcd_state is UFSHCD_STATE_OPERATIONAL, and the promotion
> to that state used to happen after the last register access of the
> probe, at the end of ufshcd_probe_hba().
> 
> [...]

Applied to 7.3/scsi-fixes, thanks!

[1/1] scsi: ufs: core: Hold a clock reference across the probe
      https://git.kernel.org/mkp/scsi/c/02a317831963

-- 
Martin K. Petersen

