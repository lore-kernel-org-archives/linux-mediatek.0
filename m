Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B6C0C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 02:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xOtiT/NwCRsCp5EbTW4+Y+cH+1/rZPndZCH6CUJOv6Y=; b=47S3Y0fziDp4hJ93AGIzXNuiRX
	1O7cTVDFnwOoY9O5PWz9cR6oYlxy6jPUaO8SCx8+TOuObFimYelDF9FwG1XBn/U+CBCjQUf0LwMnu
	mZew9tLNRLNthsrIeloCxtolxc05U+SG6BH02sp3s6ZuIhhLmbJm/6c1TGjTTl68plE6C8GZFvHFG
	YspOjQ5SBa78KxiTJ05KMM3HXeb3uohGXUBELRpXbi1C4+q6lUQO6tJz1LFRlK6HFJbaNQAOjArmV
	HW8srEa3qvxBSzZg/dlcGKny0ZU2KAdxHP48e2yrKmF15wlGj5TOSV+rwXV9m2lK0y540uEpDF4E1
	RXMWVXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okca3-001bMm-3F; Tue, 18 Oct 2022 02:43:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okcZz-001b3u-IO; Tue, 18 Oct 2022 02:43:45 +0000
X-UUID: c2b0b53caaa74fa29d9f10e6d36b35b2-20221017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xOtiT/NwCRsCp5EbTW4+Y+cH+1/rZPndZCH6CUJOv6Y=;
	b=Dq7CRYx7Yyksd+oOf6wGZqTdNY7BE36nQMkOWZ9IgCx/k3oQOtV2pIjzv9QEAelgyatqqpbELhfxg3/flMWPaFXiyIFWqY8AA5RGpykSd4/mOBJ/uYlDIbIj9HLaWinHZytRjYrZb92dc53JcM6zCX5Z62pdtK5mkwUKSUkqtic=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.11,REQID:798e98b5-f4b7-48fd-b9cf-2114847a3377,IP:0,U
	RL:0,TC:0,Content:100,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS6885AD,A
	CTION:quarantine,TS:200
X-CID-INFO: VERSION:1.1.11,REQID:798e98b5-f4b7-48fd-b9cf-2114847a3377,IP:0,URL
	:0,TC:0,Content:100,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_HTS54396,ACT
	ION:quarantine,TS:200
X-CID-META: VersionHash:39a5ff1,CLOUDID:1f7493ee-314c-4293-acb8-ca4299dd021f,B
	ulkID:221018104308KMNIPY0V,BulkQuantity:2,Recheck:0,SF:38|28|16|19|48|801,
	TC:nil,Content:3,EDM:-3,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: c2b0b53caaa74fa29d9f10e6d36b35b2-20221017
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 246323874; Mon, 17 Oct 2022 19:43:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 18 Oct 2022 10:43:05 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 18 Oct 2022 10:43:04 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, <iommu@lists.linux.dev>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>,
	<chengci.xu@mediatek.com>, <youlin.pei@mediatek.com>,
	<anan.sun@mediatek.com>, <xueqi.zhang@mediatek.com>, Guenter Roeck
	<groeck@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v7 0/6] iommu/mediatek: Improve safety from invalid dts input
Date: Tue, 18 Oct 2022 10:42:52 +0800
Message-ID: <20221018024258.19073-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_194343_616984_0178295A 
X-CRM114-Status: UNSURE (   9.46  )
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

This patchset contains misc improve patches. Mainly to improve safety from 
invalid dts input.

Change notes:
v7: Rebase on v6.1-rc1. Change nothing.

v6: https://lore.kernel.org/linux-mediatek/20220920063733.21770-1-yong.wu@mediatek.com/
    No change code. just reword the commit message in [3/6] from Angelo.

v5: https://lore.kernel.org/linux-mediatek/20220919092405.8256-1-yong.wu@mediatek.com/
    a) Loop from MTK_LARB_NR_MAX in the error path from Angelo.
    b) Fix the redundant put_device for the error patch outside the loop from dan.
 
v4: https://lore.kernel.org/linux-mediatek/20220824064306.21495-1-yong.wu@mediatek.com/
    a) Just remove the first patch about dev_err_probe since it was merged.
    b) Rebase v6.0-rc1

v3: https://lore.kernel.org/linux-mediatek/20220701053942.3266-1-yong.wu@mediatek.com/
    a) Add platform_device_put from Robin.
    b) Use component_match_add instead component_match_add_release suggested from Robin.

v2: https://lore.kernel.org/linux-mediatek/20220616054203.11365-1-yong.wu@mediatek.com/
    a) Rebase on v5.19-rc1.
    b) Add a New patch [5/5] just remove a variable that only is for v1.

v1: https://lore.kernel.org/linux-mediatek/20220511064920.18455-1-yong.wu@mediatek.com/
    Base on linux-next-20220510.
    the improve safety from dts is base on:
    https://lore.kernel.org/linux-mediatek/20211210205704.1664928-1-linux@roeck-us.net/

Guenter Roeck (1):
  iommu/mediatek: Validate number of phandles associated with
    "mediatek,larbs"

Yong Wu (5):
  iommu/mediatek: Add platform_device_put for recovering the device
    refcnt
  iommu/mediatek: Use component_match_add
  iommu/mediatek: Add error path for loop of mm_dts_parse
  iommu/mediatek: Improve safety for mediatek,smi property in larb nodes
  iommu/mediatek: Remove unused "mapping" member from mtk_iommu_data

 drivers/iommu/mtk_iommu.c | 106 +++++++++++++++++++++++++++-----------
 1 file changed, 76 insertions(+), 30 deletions(-)

-- 
2.18.0



