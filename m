Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35B1C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 02:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oAgvCkE4M2zbYmW++fzjJcHwTEGwPobG91eN8CsvEBI=; b=3UQsWX/JeA2v0uZh3NFDmDiwQM
	cV20QnAxdIgSEAJ7ILHoak6SH5r68hyyOBC4CoY4GinbdvfoY+WLR35YeGK0QEZt+JZjWRfZneFyq
	CTBCYEeL8IDCKOO2oOdLFEc+AXeFVKq9jKw2AH/Uahor6ilFmbDQAHpTtAmPyXrbdbSIcPIpz4AKF
	tngujC09xVQDoeiLk71+PYjdPeQpKMZ4zi3OFkWOEjntwOnDHo3GUI1UvzId4Nq/RnERMm/p7z1h8
	knO9indEz26ArUm83yyRd3gOabDWNEajkfmzMJzox9yHxwEPbClFCK+3Y5qy9TLoKkXdaiEs/qmm5
	Zcg94CzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDy41-001oCT-2q;
	Fri, 15 Dec 2023 02:36:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDy3y-001oBT-2p;
	Fri, 15 Dec 2023 02:36:32 +0000
X-UUID: bd43eb369af211ee958cff29c719f35b-20231214
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=oAgvCkE4M2zbYmW++fzjJcHwTEGwPobG91eN8CsvEBI=;
	b=ryMzjk8VKfCXOQDg5xL28CRuMsbvj+CqT5+BUlzoIcIJX9pvI4gpWIAG6JTpjlqZzpfQnFNGmL+AkCR1mwkveA5W/W9R2HxejgzgM0biLtVj/4ktLrxUWEnEf+upvxRFBSsjHhZLOtgHQBNydZQ5PGU7JnRMAyLp/W4FjWc3/Lk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:df67b179-c0b6-4b18-bd37-c68d49f1261a,IP:0,U
	RL:0,TC:0,Content:24,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:24
X-CID-META: VersionHash:5d391d7,CLOUDID:697c3861-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bd43eb369af211ee958cff29c719f35b-20231214
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 821121164; Thu, 14 Dec 2023 19:36:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Dec 2023 10:35:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Dec 2023 10:35:48 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>, Jason-ch Chen <jason-ch.chen@mediatek.com>, "Johnson
 Wang" <johnson.wang@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	"Jason-jh Lin" <jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH 0/2] Add CMDQ driver support for mt8188
Date: Fri, 15 Dec 2023 10:35:44 +0800
Message-ID: <20231215023546.6594-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.931300-8.000000
X-TMASE-MatchedRID: yd+n2EYA75gb+BGg6rnrdlz+axQLnAVBuLwbhNl9B5W6SmGkMbaxzqPF
	jJEFr+olKE0Je8DR/D4CU1PRf9o2s90H8LFZNFG7doMssNsUwYX69iXByCLZ0AqJrCeZkMsUYqi
	98iWc8Ne3v8y3o7lkiSSXpcVye5jiXjvIBRQGNUHwA3HHlzP9c6rO4O9SwYGHtkxmOvfMlP+AhO
	caQrQ0U1GyRcoeF18qmKP0zzpTAeGwod8xOMKmvA1Aka/KIp/p
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.931300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A355C0DDCA07CD1D0FD23379EC3A0DDDDCDC844E13490BD97FE65BA7510588312000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_183630_913043_6C12B4C6 
X-CRM114-Status: UNSURE (   7.88  )
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

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

Since mt8188 has 32 GCE HW thread, we nedd a new platform data to
support it.

So we sort the platform data in numerical order of compatible names and
add a new mt8188 platform data.

Jason-JH.Lin (2):
  mailbox: mtk-cmdq: Sort cmdq platform data by compatible name
  mailbox: mtk-cmdq: Add CMDQ driver support for mt8188

 drivers/mailbox/mtk-cmdq-mailbox.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.18.0


