Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BC2C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 07:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PgNvPOGSo53LgcHpJzW9xdWnHWqMU47KZmIpG/i7ZTI=; b=Jgq4TaEf5ptpme7iGkvUObFj+x
	6hQ5MTcQ1Q6J3VHaSngor1ArQ7nE6BY9ZSAM3t7bvSnKBY7PmMlqEJe3QFaRWJkGQB5RJThLXq5LL
	I1FpYUSMRbiHXQk/9I54Y6q7AJpU7vBG8rBMc+nrg8rRhDtKtv4a/FNnm12wkIf/MXKB6Pz3EA5dA
	lWpjmYJeQKc1BXKdKtzDEGaJ1aEUNK4xdGT9d8LBx3qWlzwwpPzgPZF6hptwE//MMnaldlBloyGQB
	GpOJ8RrJ0FJomFd8Im074EpDFPqsd6E1qQbW6NOyopzSOacSgFy6xKUN43iSkFXeE28fr3wyBx+/G
	bCvWla1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy75d-006OG7-L6; Thu, 24 Nov 2022 07:56:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy75Z-006OFC-Ph; Thu, 24 Nov 2022 07:56:08 +0000
X-UUID: 4e8ed8840d274746b464a3a3c490e376-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=PgNvPOGSo53LgcHpJzW9xdWnHWqMU47KZmIpG/i7ZTI=;
	b=s5wH67mJ78CP8yhw3h0SZXsWxhCNps1eb+otgFX3Y+1or0X+nWs2E3bh3Opmzu+cn9qsfxhC/HBaUTOSYLN8gKQm80fGoZ3Z5Avf8sCrRpICpyX+90teO/GVkphc9GNE80WsfZVagt4ZsmP2Q+4dfYMOjkvobMv6B8MXz4FhMw8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:cdc436e0-7b36-497e-90da-b1719dcffbe5,IP:0,U
	RL:0,TC:0,Content:55,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:55
X-CID-META: VersionHash:dcaaed0,CLOUDID:bedcb32f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801|102,TC:nil,Content:3,EDM:-3,IP:n
	il,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4e8ed8840d274746b464a3a3c490e376-20221124
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <elvis.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 733192556; Thu, 24 Nov 2022 00:55:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 24 Nov 2022 15:55:25 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 24 Nov 2022 15:55:24 +0800
From: Elvis.Wang <Elvis.Wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Elvis Wang
	<Elvis.Wang@mediatek.com>
Subject: [PATCH v4 0/2] Add gce support for mt8188
Date: Thu, 24 Nov 2022 15:55:14 +0800
Message-ID: <20221124075516.1669-1-Elvis.Wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_235605_862466_9649E52C 
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

From: Elvis Wang <Elvis.Wang@mediatek.com>

Base on tag: next-20221123, linux-next/master

Change in v4:
 - add gce header file under dt-bindings/mailbox/.

Change in v3:
 - remove incorrect message.

Change in v2:
 - use vendor in filename, use Dual license and remove inappropriate
   define in mediatek,mt8188-gce.h

Elvis Wang (2):
  dt-bindings: gce: add gce header file for mt8188
  dt-bindings: mailbox: mediatek,gce-mailbox: add mt8188 compatible name

 .../mailbox/mediatek,gce-mailbox.yaml         |   1 +
 .../dt-bindings/mailbox/mediatek,mt8188-gce.h | 966 ++++++++++++++++++
 2 files changed, 967 insertions(+)
 create mode 100644 include/dt-bindings/mailbox/mediatek,mt8188-gce.h

-- 
2.18.0


