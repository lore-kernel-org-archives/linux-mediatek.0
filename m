Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F90C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 03:40:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D585660F93
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 03:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D585660F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DxpNVW4VEWvs4SFbBKK3VApDNtDK6NG5uR4Pg3yZn/c=; b=jcazg6E1J1LrBg
	Ck18pOAwHA7gClTEqzYNVc3JJ66UPalWKM5NAw3oH5P+BFvik/tRUSOqDlbNL75NfGS1ciwpNwz20
	Sw46810OTEl6JBclH/AqL6tUN/FIQVRfaTx7dOEHLcPAlCWVFqHzAdXuMuyB5e0w46cPAhd3FGs31
	CKn1+I6Ccth6JpZ+Qd9qxOz49z9YchAtPo+KlH4DpnVTGv8CVVqP0VL+p9bHrQ890D7fJzPGNiydE
	LYxBnxwa6XLw8y/VrVFg7Dn/aUbWAwGLVXk4kgx8zVl9OO0kloRtLuEUWbmio/wN/mOqtuF8/ydfT
	6mVzy9Gfdd5p2QZio3OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8aQu-00GvAC-2u; Wed, 28 Jul 2021 03:40:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8aQL-00Gv0N-JG; Wed, 28 Jul 2021 03:40:03 +0000
X-UUID: 5030230693b246b7a1a5443a974ca583-20210727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=7eU7nnZt1U+zSOrbRUTX8G4pEX5czUnGotMmfFNxRWk=; 
 b=RwTK7p5GOII57s0rkg0cTd2/oi96AUktQBguHLc0/DV9g2uIWnSjFItrg7E3uqp4iw2Sn82ASFa3yS0ycNW7uhrNGN0FOAVsMBDbscohtZWJdO5dxhGl1jXkB1gt6qNp2rm9Cg/2OYUYaBe6nyPOV8HeAdfzXG5sTTk/41ckiX8=;
X-UUID: 5030230693b246b7a1a5443a974ca583-20210727
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 346918638; Tue, 27 Jul 2021 20:39:59 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 20:39:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 11:39:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 28 Jul 2021 11:39:45 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
 <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <tzungbi@google.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH 0/4] Mediatek MT8195 SCP support
Date: Wed, 28 Jul 2021 11:39:26 +0800
Message-ID: <20210728033930.5269-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_204001_688490_0B192166 
X-CRM114-Status: UNSURE (   8.64  )
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

Changes since v2:
- Add compatible for mt8192
- Convert mtk,scp.txt to mtk,scp.yaml 
- Refine clock checking method

Changes since v1:
- Fix missing 'compatible' line in binding document

Tinghan Shen (4):
  dt-bindings: remoteproc: mediatek: Add binding for mt8195 scp
  dt-bindings: remoteproc: mediatek: Add binding for mt8192 scp
  dt-bindings: remoteproc: mediatek: Convert mtk,scp to json-schema
  remoteproc: mediatek: Support mt8195 scp

 .../bindings/remoteproc/mtk,scp.txt           | 36 --------
 .../bindings/remoteproc/mtk,scp.yaml          | 85 +++++++++++++++++++
 drivers/remoteproc/mtk_scp.c                  |  3 +-
 3 files changed, 87 insertions(+), 37 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
