Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A108AC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 10:38:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 595A061355
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 10:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 595A061355
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J94WoU7NCrY85DUYyJovVcpi1ICbsZLU+c3fjRIUKUc=; b=WvB4Z2d95on+Cy+5IvWEhnwg0G
	VLjNpu3C2QlVO1mnYU7YNPF2rvjG1o6E4tonNuPReUC/5NYIVbHSvPssOnJIqBiQMjtR+3sSbdtSD
	Pbq4nXwfUqKFv2Qgs5egM5M7V25jBrFbcHtNOcogozh4wnR8s/bAO9Akojtu0JHUUwZRuG5vNpAzK
	ClDDROFsC+RKwzVgGhRnCBZmXlDzpgXPnobtVHiVAxzBa7zOv/NVL5xVXR2KYChVCgkAnPB1EtEma
	dL6D85EZKO8iWruR9+cjvx1pwLn+TjkNgkK5TZVAHf3IggCnwSjByiOT6zrdAxiFiK6vRbOnO+ell
	bG3FD/lA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljJab-003bgb-3A; Wed, 19 May 2021 10:38:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljJaQ-003bfm-5B; Wed, 19 May 2021 10:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=fSQxLIF+SSmuLxcr9AktDMU7JtES+LcxCeHLO/dMRSc=; b=JBlReU8lwTKDcAnCj4Wm2Coinm
 622pLghw4Oj2yhdsZFYs8WbgvGz9i6bJyBhtADznuGm9GA1Gd2GYBs3P74Vws83lZWySm2zMf16Y/
 sfdxm5xKKgCbbLIuIEZEUYDBZm2Tah/P+mCjfnIr3WiJ7zjb06MTQ/80gmROS9oj061QimOZyZQjd
 lv0DjWWgk7YRkfyvo2OBPhTAFPl6XpEOcnQLbWHwdmZ73PvYd/6X96XzpXNFHBV/3bvMaqIf4ko9H
 CgKaglfFt4h7PC75cUQ7mU0f0RuTNsdLyzKjAjnx9i/PrPZVBfSq5EEfu8+0X8wr8CNQcF9YFNvFo
 z0ViNiSw==;
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1ljJaM-00FMLi-1M; Wed, 19 May 2021 10:37:55 +0000
Received: from linux.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Bx0OJz6qRgrKcAAA--.3389S2;
 Wed, 19 May 2021 18:37:41 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, lkp@intel.com,
 Dan Carpenter <dan.carpenter@oracle.com>, Heiko Stuebner <heiko@sntech.de>,
 kbuild@lists.01.org
Subject: [PATCH v2] phy: phy-mtk-tphy: Fix some resource leaks in
 mtk_phy_init()
Date: Wed, 19 May 2021 18:37:39 +0800
Message-Id: <1621420659-15858-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Bx0OJz6qRgrKcAAA--.3389S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr43Kw48urWUJFykZF1kKrg_yoWftrX_CF
 1vgwnxZan8WF1akw1UKF17ZF97u3W0qF1kGr9ay34Fkryjgr1Ygr1qvFZ3Gay7Cws3uF13
 Jwn8u3Z29r47ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbsxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xK
 xwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
 IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
 6r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
 IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2
 jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
 ZFpf9x07jOgAwUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_033754_516298_4184F115 
X-CRM114-Status: UNSURE (   7.17  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use clk_disable_unprepare() in the error path of mtk_phy_init() to fix
some resource leaks.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---

v2: remove Fixes tag and add Reviewed-by tag

 drivers/phy/mediatek/phy-mtk-tphy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index cdbcc49..731c483 100644
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
2.1.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
