Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165BCC61DF4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 07:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=biIA5nolcnycLWZaSMxodwzv1zZqXFegizuysjjQ1Dg=; b=QTx9eM65AR6KgOy7BFOoCgQKwy
	k6XhNafSnUOjUBUSoqUMCXWUCWJFMRt9aBoG2Bdd7OtliczUf4lv2d68LKimCR/y2sh9xGHIGl2JL
	S55eUHVX87vj9hP9Xrl8tvpfxC7UDR9VWHy6U9TRVZ5fEDUI0mh6M34CTE1He/4X/DqPYE9NksN7a
	eNa+ho4Y2vuBQq2chaKgc7xMdOcjdC6wXeT2xeZdZ+bN7L9XCwe9jjk/esC09vAwrGti4JaaEujoe
	6sk6cYFo9ODksoGPNT5a4474qzpbJmM/DZqzOWFHXqGZtjE3j5vnOyjisfUojPV3NF6eB0fqXuI1j
	YYm2PJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Qd1-006OSB-32;
	Fri, 24 Nov 2023 07:29:31 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Qcy-006ORB-32;
	Fri, 24 Nov 2023 07:29:30 +0000
X-UUID: 2e0b7ee68a9b11ee86758d4a7c00f3a0-20231124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=biIA5nolcnycLWZaSMxodwzv1zZqXFegizuysjjQ1Dg=;
	b=swSfnQctm2+GAjYGziawP3gw9yMH2HjcJnJaUHep5nmPXrsmypZrZfEiTNZ1D2Zrgd+L19Ale+grtzUK2D2eQyMALGUXBwR/4st9AzibgEbSeUWmhI8LkVH2UmJ8H8aRA0AjG4gUGO7bdQrYb5hM74ZqKHp60uc3zT+dFAqg7Nw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:ef851b37-cca8-4a30-b639-ab30db11b2d5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:1b0f0673-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2e0b7ee68a9b11ee86758d4a7c00f3a0-20231124
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2073064029; Fri, 24 Nov 2023 00:29:19 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 24 Nov 2023 15:08:42 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 24 Nov 2023 15:08:41 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Wenbin
 Mei" <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1 0/2] mmc: mediatek: add support for complete clock cycle tuning
Date: Fri, 24 Nov 2023 15:08:37 +0800
Message-ID: <20231124070839.12484-1-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.394300-8.000000
X-TMASE-MatchedRID: tiRXYRqWr+s9S3IiQd+eNQUNJ/OP1hfdTJDl9FKHbrmdohxAwFG9tKPF
	jJEFr+olKE0Je8DR/D4CU1PRf9o2s90H8LFZNFG7doMssNsUwYV3W1qHy8N3b+43JwG7OOXNPDY
	iTTu2WpE5YJpG/jXVlKC1Q6bYV6FwaaeeX2Q5bK9+HGPweyal2mGdUezV59DHQZpgl3CshRSeqD
	9WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.394300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: E95754AC5D9D43F15DE16F73CCF87387CB93DDE3ED625A8CFDA9C6099A14A6B92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_232929_033493_2C8BE9E9 
X-CRM114-Status: UNSURE (   7.96  )
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

Add support for 64-steps tuning for better calibration result.
In the past, msdc driver only tune 32-steps and may not achieve the
globally optimal sampling delay.

Axe Yang (2):
  mmc: mediatek: add support for 64-steps tuning
  dt-bindings: mmc: mtk-sd: add 64-steps tuning related property

 .../devicetree/bindings/mmc/mtk-sd.yaml       |   8 ++
 drivers/mmc/host/mtk-sd.c                     | 133 +++++++++++++-----
 2 files changed, 105 insertions(+), 36 deletions(-)

-- 
2.25.1


