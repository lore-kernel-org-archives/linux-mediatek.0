Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80881C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Aug 2024 17:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7Xqdol5gnkgnaYaCTqYhW60HRh2RXsmw92RpXiwZag=; b=cHXk9KZili5612d3x0BSaeqFGR
	8izTsg3D3jIsT7+PRkB6bnG6aSJK7mHtdrzFvfxttEcdvEF6/0juLpt3zcRdiRrlVBhrv/oHKjkx1
	rSzDyPHDblA3CECGKvhgoFBW1L3EoPF7RazAChaJa/Zp6IhSseUv85CFZ9+BeSHU2sNFqUtt7xx4H
	DyLlxBadZVbeyF6ymgCQUSswzd7M6aqgt1HDL7EWjI/5fb7hJ3UOYIiJK2yjA7saI7LNBMY+tQRT/
	bv04C5nbe5FJhW5/LBmJFC/NHLsebe4Xa172HJWaAP3ixGQFLSL61e9d2oWHFxb1JzpJhBeQ+6qHp
	0Ic81lQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb1xH-0000000GlwE-3DMa;
	Mon, 05 Aug 2024 17:57:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb1wk-0000000Glni-0Hyw;
	Mon, 05 Aug 2024 17:56:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 65042CE0B6C;
	Mon,  5 Aug 2024 17:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08C9C4AF0B;
	Mon,  5 Aug 2024 17:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722880595;
	bh=FWXRir7NdsfpCQeLqcWhIT+hGlGvOxV0pY5ePjzURQc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JvmicJlhcb9ra3ANDoPREMWtUItBsDGq2aUK1Q31n6KD8C7UQW36fKqoKqdJvloFW
	 y9tvU7ZFhCa/yRSD+RI5lo0p0GSKqVNpReAVIz6gT/FHiVUIQ7iBdgFJcsiETc1Zqx
	 MO+AZ1vQ2gcLVAybrsX1BnKgisi61TtQIaKONV90USB9dAXmJC1XjFhy5AiyPbc/7L
	 wPK5Twk5roHNEh/4c2WCbSCDamxIP+2ZaM8zBO0uV8OH9nvY0Dk5iVzUJT9duDQjuV
	 4PbBXXx+ZdJwBoGUcTATsZTTkH/ycCKqHpV67oEW7biXJ6A0IH+xZz3XZrQ7TpxiDz
	 ubu4GnUnT0kTw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peter Wang <peter.wang@mediatek.com>,
	Bean Huo <beanhuo@micron.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	James.Bottomley@HansenPartnership.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	manivannan.sadhasivam@linaro.org,
	avri.altman@wdc.com,
	ahalaney@redhat.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.10 04/16] scsi: ufs: core: Bypass quick recovery if force reset is needed
Date: Mon,  5 Aug 2024 13:55:36 -0400
Message-ID: <20240805175618.3249561-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805175618.3249561-1-sashal@kernel.org>
References: <20240805175618.3249561-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.3
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_105638_312995_BC42E803 
X-CRM114-Status: GOOD (  10.99  )
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

From: Peter Wang <peter.wang@mediatek.com>

[ Upstream commit 022587d8aec3da1d1698ddae9fb8cfe35f3ad49c ]

If force_reset is true, bypass quick recovery.  This will shorten error
recovery time.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Link: https://lore.kernel.org/r/20240712094506.11284-1-peter.wang@mediatek.com
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/core/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 3678b66d3849a..27cce03be375e 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6555,7 +6555,8 @@ static void ufshcd_err_handler(struct work_struct *work)
 	if (ufshcd_err_handling_should_stop(hba))
 		goto skip_err_handling;
 
-	if (hba->dev_quirks & UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS) {
+	if ((hba->dev_quirks & UFS_DEVICE_QUIRK_RECOVERY_FROM_DL_NAC_ERRORS) &&
+	    !hba->force_reset) {
 		bool ret;
 
 		spin_unlock_irqrestore(hba->host->host_lock, flags);
-- 
2.43.0


