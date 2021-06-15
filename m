Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E332C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 19:59:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30DBE613B3
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 19:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30DBE613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9/DtxWObHq5jCzpe/6Qh1l2p2Mu9IZPYXv33WHm5kk=; b=OheVZWaNU2izgT
	/yd6m8nUNNtB2liQry+Zflq+CiyC7htATvj3mvN2oRPX4WXs9H9eyuIoUYymIWNidiZ0ZdspMxEGq
	p91yq+DwHAkYlr7InCkaK5rCCVHpukw8ncH/08HQB58jmHRmZCt6Shb0DTqfmZ6uP/JPbN0KH+Qms
	Ji+0Xk50plTfB1UFxIrsnPuY1eNRMAyuZsWJPvsV5qrIPSjGzqCMYT3KLqjrMkLjbJJxtakbPK4M3
	pmOEO6XZFCgbMygDpg1feU8WDj4uNCwBuGGUJ3w/O4dotn8nQ48Jwitcay4TMMYXZyxEQkn1chWWb
	O0YAsDtIqIbWL0kFGmjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltFD6-002d69-Gi; Tue, 15 Jun 2021 19:58:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltBJA-0015wV-2t; Tue, 15 Jun 2021 15:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=eVYwBOAOTAkGv39WLZJnWJZXfM5fxMMj7Ycz5FsIarI=; b=i0gySU5C24Hpu2I1VNjOPJP6do
 HN4nXneFtmc+hJ/EcFIYRWz5Ig3jS3qBbPAlME8kVFsImtc5L9p12IoZCEILj2vjkHcDZ/sxliZgY
 7vfC9IixyYejirhvGaRPzUwcy15ioNhlUmaJ9ra2yuDLJgAkR08asANGj8p7F7lk5JSlxqM2YvQLV
 Jx/lanuNf7C5x9eKdyBOzI1de06uY3dcL77dyOJMyR69Bq6xlCLB9QBbhp7gZc+RuD9bAwKQIAvu6
 38g3ZE6xPzw5YH1p0HdJcy6CGpNrgN6tVhKeVmnhA8QxZn42JdKgRkineIIeDF35zzMcIrl9g3IL1
 orUs21+Q==;
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltBIz-0081QO-Sv; Tue, 15 Jun 2021 15:48:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FFBE6162C;
 Tue, 15 Jun 2021 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623772112;
 bh=/4qA9Gz7Yw2MDT2xfMW43+5+10S3nLL/FwGV37M7M2k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J6K3bOM4kObnFHUaxIDfDygQEDveSq1Jcl5hQWC+rdi2+YhMiO3lxp5xR40mntPsp
 /iYgz2Wqpnm2qPnKsoe3PiJZlKadz5sU1/bPKwjtEZ/YRMXbllg3K7Jj7IW49tCJdc
 FUYoLh6tWAmlvkNFgRx5bgV3Gf9S5mIHcXu77QhiILheEdjnJJGa546iG0Bz/ZmTBv
 qfH3nSxIoFb43XYXmEF41uLYJrotwLxCBfbjUNgn+FKgdPdlwtsjnurci7okA6T8+2
 hGvjjsHR2znRHq3SyfjsqdOck0RI+7Ku5YNURh4VoEj5EQvuXT9+ogXtsPDK5IpJ3k
 TGmS0JBba8zmA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Sasha Levin <sashal@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 06/33] phy: phy-mtk-tphy: Fix some resource leaks
 in mtk_phy_init()
Date: Tue, 15 Jun 2021 11:47:57 -0400
Message-Id: <20210615154824.62044-6-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615154824.62044-1-sashal@kernel.org>
References: <20210615154824.62044-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_164852_930622_FE5270C7 
X-CRM114-Status: UNSURE (   7.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Tiezhu Yang <yangtiezhu@loongson.cn>

[ Upstream commit aaac9a1bd370338ce372669eb9a6059d16b929aa ]

Use clk_disable_unprepare() in the error path of mtk_phy_init() to fix
some resource leaks.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Link: https://lore.kernel.org/r/1621420659-15858-1-git-send-email-yangtiezhu@loongson.cn
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index cdbcc49f7115..731c483a04de 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -949,6 +949,8 @@ static int mtk_phy_init(struct phy *phy)
 		break;
 	default:
 		dev_err(tphy->dev, "incompatible PHY type\n");
+		clk_disable_unprepare(instance->ref_clk);
+		clk_disable_unprepare(instance->da_ref_clk);
 		return -EINVAL;
 	}
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
