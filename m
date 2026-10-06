Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1941ACA5FF0
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 02:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNYD+CpNcWz00HBG+LHdcTGmGAdIXiwkIYdQxEuIMOE=; b=ACqsbwBlfpPPOJQimKIAMLU09K
	uDqhy6ATOnuqfdV+JjS4BsFXB8N/9VRIFyafLklryXgUCH7IDQEwHGvP6W8N2arAESbXlgm30gQJG
	keGq0gigv7Ilu4Q0mVakrmYtPSMlg2SjPy1oZ03lk2hdDIqmGarSUR2tCB5hAuJASVHDH0YQVQOX/
	iu0iUqsY0wT6ZAMUbi1DMzUTmGM+a2vGbfGScWFiZ0Z2mhlN2H7bfQqj1fz6g2jOPom2VEknJ/4kP
	Lba+56ggiN+83wD/l8nbU0Zuo2al9vyaD25bc1erBqtk8aXmh2N43X/Am/2geoi2ma52pvBA/hI7h
	qCAmgeog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvAf-0000000HWQa-0p7T;
	Tue, 06 Oct 2026 02:44:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvAd-0000000HWQH-3TSo
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 02:44:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E0C04601FF;
	Tue,  6 Oct 2026 02:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4171F00893;
	Tue,  6 Oct 2026 02:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791254686;
	bh=XNYD+CpNcWz00HBG+LHdcTGmGAdIXiwkIYdQxEuIMOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QeMWcZmMVwkBXBy5HmXohbAOEdEszM74TAkTH/Twx2dNH91LmiQI5jdMZPf02Mm+4
	 ZQbKZwGvR8H26qj/LX8fuZNqKLqgspvfabI85oVHlECEbvoOsgtaaHs4HP/dtODT1i
	 UdQUWZdYgDwUIU0CS79NkMvJ7unnMPia6dHosJkCtyuRFazp6k3Szu/kCSaaDJVp00
	 fYQEBFboYWmpG2eNzGA4SIYs3LOAjRcwUKgQRxiEKSZHwU+vpA4g9vFvmF8pBjg8L8
	 ikckrItQFBTKYBbTmTmRGR3M8lnaLOtlDk5lvOxTw6XOQe9FF03Yma2UoD8nxD+fi4
	 u0RqhsdiD+c5w==
From: "Martin K. Petersen (Oracle)" <mkp@kernel.org>
To: linux-scsi@vger.kernel.org,
	avri.altman@sandisk.com,
	alim.akhtar@samsung.com,
	bvanassche@acm.org,
	santosh.sy@samsung.com,
	h.vinayak@samsung.com,
	"Martin K. Petersen" <mkp@kernel.org>,
	peter.wang@mediatek.com
Cc: wsd_upstream@mediatek.com,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	alice.chao@mediatek.com,
	cc.chou@mediatek.com,
	chaotian.jing@mediatek.com,
	tun-yu.yu@mediatek.com,
	naomi.chu@mediatek.com,
	ed.tsai@mediatek.com
Subject: Re: [PATCH v2 0/2] ufs: fix POST_CHANGE pairing and AHIT race condition
Date: Mon,  5 Oct 2026 22:44:37 -0400
Message-ID: <179103513133.923653.2927639008481783507.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914085148.136429-1-peter.wang@mediatek.com>
References: <20260914085148.136429-1-peter.wang@mediatek.com>
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

On Mon, 14 Sep 2026 16:49:23 +0800, peter.wang@mediatek.com wrote:

> Patch 1 fixes a bug where POST_CHANGE was skipped on a failed gear
> switch, leaving the host in an inconsistent state if resources acquired
> in PRE_CHANGE were never released.
> 
> Patch 2 fixes a race between the sysfs AHIT update path and the
> MediaTek host driver's power mode change path. A mutex and depth
> counter are introduced to serialize AHIT register access and ensure
> AHIT is correctly restored after the last disabler completes.
> 
> [...]

Applied to 7.4/scsi-queue, thanks!

[1/2] ufs: always notify POST_CHANGE even on gear switch failure
      https://git.kernel.org/mkp/scsi/c/6efee14ca0ae
[2/2] ufs: serialize AHIT register access between sysfs and host driver
      https://git.kernel.org/mkp/scsi/c/7dec5cedf7b2

-- 
Martin K. Petersen

