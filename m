Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF333C5321E
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 21:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQfV5/7F8iCB8hgaB5SKkH1VV5uYwJvQlWEsE/ftnPk=; b=EnYXdfSX2LcjdZGe3iz1Bx+2si
	cLrPPFHmpB7IPZDjNW8BSAxNqOlQ5FG2jFI3vm8bLKb7ylE6e//tXGcWTaZx9Rggy3+jX8a1B8hxW
	Tbtmaf9PtmXxqAwFdGx/ddp83LWGTGkyaj4dn8ncYxQQVvfjN0qc53SrudgniuP+Jmuj9Y9g24byC
	mSoCbXv7VT/3TKVcRazSU8KTwxZI2W4YUwajz7r0l7bYPAtAore6VwDFCG6q5R8/T0C+fczlT4nfR
	aHwxbAMPGs2nrnNXy0/evsGslj1x4BDCKc5G+AfzO+dcqDLA5is/VDLivwzTlpAfJr+IZCi1rjRE1
	Ty7fNIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shbsr-00000000iec-1DHA;
	Fri, 23 Aug 2024 21:31:49 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shbso-00000000idL-05sZ;
	Fri, 23 Aug 2024 21:31:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1724448699; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bc3Y1MAMdL+bJFRNLbhh5euirsEVbGfLEuczVIOxaaZtHNKsoJcSrfeqQtMKBMur7gxYOnqisz2zgfvCN/eMaQxwDz/Pep/ZZHvSkd6ndOVhDb3Plo2GWSOkF06DkqkpHp0LcoLzECXsXvunfxgwyB85BzFbajf5OwA3d11Y79w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724448699; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vQfV5/7F8iCB8hgaB5SKkH1VV5uYwJvQlWEsE/ftnPk=; 
	b=XxH5E5NPuP0vkvkD1b6IX0fP/nBnEY786/CNVusmqBiqM2ZZ63LnxmbAbNJGEkHFmI2qRvUA7ekfBeADGXt9+IIyNjdLmtuKysZp4BZ2eIHdo0y+kHE6IxQfvzya9awsECrRDqGo1dN++Bo8T1WGH3ShnrAm1lAs6MlX8op81o4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724448699;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=vQfV5/7F8iCB8hgaB5SKkH1VV5uYwJvQlWEsE/ftnPk=;
	b=LvD3C93zfuQxcENbtnK/RwA4Ri78vdFp4E1aZ2LnRl5/NE2aVaNtHXcj4jSZD0Q4
	ccU8e5uv2zxaCl2H6OniKuo3ODVC/ejNjgXTToMFJ5gF/1Gb0jqvp+QY2YH2rAjyDui
	OHNRm80rrh1cIAZvyV+mTyQp4ULHkAfqTOf7XePA=
Received: by mx.zohomail.com with SMTPS id 1724448699135452.7212113854729;
	Fri, 23 Aug 2024 14:31:39 -0700 (PDT)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 23 Aug 2024 17:31:21 -0400
Subject: [PATCH 1/4] media: platform: mtk-mdp3: Use cmdq_pkt_write when no
 mask is needed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240823-mdp3-comp-cleanups-v1-1-1f8c1395ecd3@collabora.com>
References: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
In-Reply-To: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.1
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_143146_134285_2078E931 
X-CRM114-Status: UNSURE (   9.18  )
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

cmdq_pkt_write_mask() boils down to a cmdq_pkt_write() when the mask is
0xFFFFFFFF. Call cmdq_pkt_write() directly in those cases to simplify
the code.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
index ea2ea119dd2a..90658a22a525 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
@@ -325,8 +325,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	/* Enable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
-		cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
-				    set->value, 0xFFFFFFFF);
+		cmdq_pkt_write(&cmd->pkt, set->subsys_id, set->reg, set->value);
 	}
 	/* Config sub-frame information */
 	for (index = (num_comp - 1); index >= 0; index--) {
@@ -381,8 +380,7 @@ static int mdp_path_config_subfrm(struct mdp_cmdq_cmd *cmd,
 	/* Disable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
-		cmdq_pkt_write_mask(&cmd->pkt, set->subsys_id, set->reg,
-				    0, 0xFFFFFFFF);
+		cmdq_pkt_write(&cmd->pkt, set->subsys_id, set->reg, 0);
 	}
 
 	return 0;

-- 
2.46.0


