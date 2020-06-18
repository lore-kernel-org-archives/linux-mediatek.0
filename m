Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99DAC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 01:23:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74F40221E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 01:23:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kMNqiUFl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZ6MzIOa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74F40221E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nnCmfgAufinhjS6LjJigk8aKWCOq3ijgU0XAwda5DaM=; b=kMNqiUFlgVOCmb
	Cgfu+7frBli3IDQci4oj82BhVB8DGJL7NXiASyR/Bd238onIGVfn3R8nojL81jt5rSlM1S7fTiqzX
	LfyKRLbJkRWPSsNk2SfyqD7mQ+eE3pDuUUOWOJnSkAdmJxIk6aU8K68E65FDKdpMxMcE1hUkz984A
	x0W061OelDPIAQDoPESVsFnE+phSNBpsMkxPV185WvGn73d0H5Y4RwdS0P0ilxopte3I0HsRfw4DH
	NVhM9DVk02RFw/YLXHTi0LCP52ZGYp/N/6E4jRBbO5DWurQENjz4DySQEM7NJXcAFIIKQhNuPAd8d
	igylX4HV+SuwE4m8AkwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jljGv-0006gN-R1; Thu, 18 Jun 2020 01:23:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlj68-0001kl-EV; Thu, 18 Jun 2020 01:12:10 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF521214DB;
 Thu, 18 Jun 2020 01:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442727;
 bh=lmsOjpJfu1F/07xtNKZqZw1bsoKKOBllErHB92ejtMc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PZ6MzIOaugBA/g2Wf9m1vzM4ijJcm03pDC4uK7O2uWisbMydpPHo3Q/mJ+MDZC1D6
 YJxu32lDkhGdgICn/zxdfDylij2Y02UQBmr4687lt5TyBu8Vmw02EH+4XvxWY5OMx/
 nu8y/Liz7m9tt/gGBJuiHvXt0ZTSTvZFRCi9gsEI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 184/388] remoteproc/mediatek: fix invalid use of
 sizeof in scp_ipi_init()
Date: Wed, 17 Jun 2020 21:04:41 -0400
Message-Id: <20200618010805.600873-184-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_181208_609890_8F0BD5E6 
X-CRM114-Status: GOOD (  10.26  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Hulk Robot <hulkci@huawei.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Wei Yongjun <weiyongjun1@huawei.com>

[ Upstream commit 8096f80a5c09b716be207eb042c4e40d6cdefbd2 ]

sizeof() when applied to a pointer typed expression gives the
size of the pointer, not that of the pointed data.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Fixes: 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Link: https://lore.kernel.org/r/20200509084237.36293-1-weiyongjun1@huawei.com
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/remoteproc/mtk_scp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 2bead57c9cf9..ac13e7b046a6 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -132,8 +132,8 @@ static int scp_ipi_init(struct mtk_scp *scp)
 		(struct mtk_share_obj __iomem *)(scp->sram_base + recv_offset);
 	scp->send_buf =
 		(struct mtk_share_obj __iomem *)(scp->sram_base + send_offset);
-	memset_io(scp->recv_buf, 0, sizeof(scp->recv_buf));
-	memset_io(scp->send_buf, 0, sizeof(scp->send_buf));
+	memset_io(scp->recv_buf, 0, sizeof(*scp->recv_buf));
+	memset_io(scp->send_buf, 0, sizeof(*scp->send_buf));
 
 	return 0;
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
