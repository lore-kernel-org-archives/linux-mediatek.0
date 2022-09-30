Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CB4C43219
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 10:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xt2v3fsvVPs1BpqYWYVZtY0Gpjwk0DyXlw8YbTAf0is=; b=mfbeSmdWr3YXQVjXFBW4asz0Hr
	E5qyEUzW8gG7+7pOvbAY8LqfmahFgYQ3qDVEQmRLAMcwizncCVwD/bOlKvOX34m5c+v1HwG0KC2s0
	RH0BZTSTFoQgZbvsjq5jIOvMLwENrMV5lR6RtA/eWKuWqMqHSvhRZ1NxW7v+/yYC3YvwpQg5rRqpT
	zgR4hyvXlbyBhEIxOfvBOMCvqbdirp/MNxTCXekDdR5SMqoM2PWRtWK16iVzyBL/ptB2X7JGYWr1N
	trSVoVZ1vr/lXm/ukDI2U4N2N8cJeCPspf25lnaFFzrnII/euVMTz080rP9FQgKc2mCBDwlirH5qf
	nVGe3+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeDBL-008ZSz-Jw; Fri, 30 Sep 2022 10:23:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeDBF-008ZQ6-W7
	for linux-mediatek@lists.infradead.org; Fri, 30 Sep 2022 10:23:43 +0000
X-UUID: e23e584ee0734b16a333e99b71d06d4f-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Xt2v3fsvVPs1BpqYWYVZtY0Gpjwk0DyXlw8YbTAf0is=;
	b=T++7esW+F/a3tuHULK1ZX5tigXhePJxr7jn2/BW22415HXhO9GAWQNGBKEHr4PerDtEIOAZTtfOTxeariuMq7u/nmirgWjuPKv2gJncg+ZPkU6OaevFaYl1s++xFAc46mFMecrPwoj9zJq3LfMf2aI/o782iQYuycAFn+DcBMq8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:f25a5d44-2e98-46ba-b519-4ef4445531ec,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:2979a1a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e23e584ee0734b16a333e99b71d06d4f-20220930
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 701852277; Fri, 30 Sep 2022 03:23:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 30 Sep 2022 18:23:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Sep 2022 18:23:07 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: <linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v1 0/2] Fix error handling for MDP3
Date: Fri, 30 Sep 2022 18:23:04 +0800
Message-ID: <20220930102306.13201-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_032342_068510_1E1EB797 
X-CRM114-Status: UNSURE (   7.09  )
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

Hi,
This series fixes some error handling in MDP3 in response to the bug report
submitted by Dan Carpenter (Message ID = YxB1E00e8D6P4W2e@kili)

Moudy Ho (2):
  media: platform: mtk-mdp3: fix error handling in mdp_cmdq_send()
  media: platform: mtk-mdp3: fix error handling about components
    clock_on

 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 51 ++++++++++---------
 .../platform/mediatek/mdp3/mtk-mdp3-comp.c    | 24 ++++++---
 2 files changed, 45 insertions(+), 30 deletions(-)

-- 
2.18.0


