Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D99C88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 01:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5q5KE8fUs+8ODPhfMajWOCRm4Na5oZFgYV9W9yAhSs8=; b=kRaL8OJ0dntye28UFsOJorOs6N
	g9E4XdBdrQaY3Pe1XKN8+DoC6SZgIpfVzHDeWTc5jow2Aoeoybzcu7YHB51dYauo7hZEZuhVWTnd5
	utBiQoLHrYIEm3CTVi0L1y+BzdnedT7+NWWIl9k8yO4gHmZfEqNRmgoMbZLKp1kzGzXhGyIQLXW8b
	zb2XvtNE5GJM2Vf19Zm5QImwovgDnVlqLfDY7pBiTCxwHPOQkM6C95C2/ITurQovDzZDl0gwf/SsV
	fRqcJZeNfhZbpHy1aJPcTRubSA8ni1zXZ3TmlRioK9tNI/JlT75eeTZ0si///YPCqk757EJf1JWxs
	N0vqK9ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6epA-00000008Al6-0AQ6;
	Wed, 16 Sep 2026 01:52:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ep8-00000008Al0-16RA
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 01:52:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A3FBA40C1E;
	Wed, 16 Sep 2026 01:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FBC1F00899;
	Wed, 16 Sep 2026 01:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789523553;
	bh=5q5KE8fUs+8ODPhfMajWOCRm4Na5oZFgYV9W9yAhSs8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oOnCJVYITmVBvRALLoaSLsGGfEfrslH4IRByKYg7ekzx56HZmO8CMFwSp/55ZGVzn
	 iy4AJy6G48kQiaaDUwP0A4okz+dlqSvCihCKwubHZ3xjcJWUpgwKZmu9zT6BRK0igb
	 XCvrZ/AwstTt634Ltrs0TPFLgooFV3Xf+k+oJfJfSKjCHYoF3AGjEVK76U/uNymu4x
	 BIA9hrN59g4pwku+2LdTd02ncTI/oiDsanYQfBldlIwMuxtChE7/7IWYRs0/VBXyWi
	 3ppOvrtJOX5OAH9SYT8YmzXvoPkTaO0ZlzMghGTea9sgirFEa9RdJud21IuoM6OtVa
	 T96e7GN11J27w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	martin.petersen@oracle.com,
	James.Bottomley@HansenPartnership.com,
	bvanassche@acm.org,
	avri.altman@sandisk.com,
	alim.akhtar@samsung.com,
	wsd_upstream@mediatek.com,
	linux-mediatek@lists.infradead.org,
	peter.wang@mediatek.com,
	chun-hung.wu@mediatek.com,
	alice.chao@mediatek.com,
	cc.chou@mediatek.com,
	chaotian.jing@mediatek.com,
	tun-yu.yu@mediatek.com,
	naomi.chu@mediatek.com,
	ed.tsai@mediatek.com
Subject: Re: [PATCH 6.18.y] scsi: ufs: core: Re-arm the device command completion before submitting
Date: Tue, 15 Sep 2026 21:52:13 -0400
Message-ID: <daily-reply-20260915-0008-re-ufs-dev-cmd-completion@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915052638.459390-1-alice.chao@mediatek.com>
References: <20260915052638.459390-1-alice.chao@mediatek.com>
MIME-Version: 1.0
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

> Re-arm the completion in ufshcd_issue_dev_cmd(), immediately before
> submitting. All submitters - ufshcd_exec_dev_cmd(),
> ufshcd_issue_devman_upiu_cmd() and ufshcd_advanced_rpmb_op() - reach it
> holding hba->dev_cmd.lock, so no extra serialization is needed.

The analysis reads correct to me and the patch is clean against 6.18, but
this is a stable only change in the UFS core completion path with no
mainline counterpart, since 08b12cda6c44 ("scsi: ufs: core: Switch to
scsi_get_internal_cmd()") deleted this code outright. I would like a
subsystem ack before queueing it.

-- 
Thanks,
Sasha

