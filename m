Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BB8C77B73
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 11:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hWQ30+yCMXmpdnJYjYXC6Zz/30400LVyGU7/esOpB1E=; b=mAmS1ncWpk/3W1T3XiKSPGSqA3
	ogkp2D71MFIAHjQFLAqn5JtTNAj2q7KJjaq/UqblS2wR2OxnlII9SbCMRNAWAcGtNVbPd/tJzhlzv
	IqhCnIRBKqDQ8WMgVqYK2w4BpO/ys1vJESMEfPmJNrh3EzumDtL0GlbYzagS4PX4tXM8obvckRtjX
	Go2xRGFjCJTns7mPjbr9nV70tmPykRvVt4E+cnAqrXU680pa9bkFS6esCYcII60ulhSWGI2J09euA
	HlPM26z31NVE8nYMCgVUAByxkWkSUk4SWNrYiohtpp0hXeyjWuy6iCZjvWlEEiSV318H2jFEpFUXH
	F2DuJ3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6VFp-001VVW-0G;
	Tue, 06 Jun 2023 11:53:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6VFl-001VUl-1T;
	Tue, 06 Jun 2023 11:53:35 +0000
X-UUID: c0b81022046011ee83ed1395ce914268-20230606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hWQ30+yCMXmpdnJYjYXC6Zz/30400LVyGU7/esOpB1E=;
	b=n/muHkqkya99BTkfAEyjor+ub8p4W+Ac2J3KnTJ5j/tSyArqEFJa7825LxSCuw0LK8aTrheZxraZngs4x3qrMtQNIdiGBBIyZ23Flpc6+K2uWdhNmWRBvh9oxrXxkXlADDHAkmyTzzPJIqSq0DacGNhIQVrPvZmQn9ou+ayGnxs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:732c6a9d-1705-4d51-84d2-3780f9d63bae,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:5b8ebe3d-7aa7-41f3-a6bd-0433bee822f3,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: c0b81022046011ee83ed1395ce914268-20230606
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <wenbin.mei@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2017013463; Tue, 06 Jun 2023 04:53:29 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 6 Jun 2023 19:32:51 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 6 Jun 2023 19:32:50 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Adrian Hunter
	<adrian.hunter@intel.com>, Ritesh Harjani <riteshh@codeaurora.org>, "Asutosh
 Das" <asutoshd@codeaurora.org>, <linux-mmc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v5 0/1] mmc: mtk-sd: reduce CIT for better performance
Date: Tue, 6 Jun 2023 19:32:48 +0800
Message-ID: <20230606113249.28057-1-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_045334_110273_659A0409 
X-CRM114-Status: UNSURE (   6.49  )
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

change v5:
1. add version change log and the previous patch link
2. change comment in msdc_cqe_cit_cal() to increase readability.
3. change the type of hclk_freq from "u64" to "unsigned long".
4. don't open code FIELD_GET.

change v4:
1. remove else case in msdc_cqe_cit_cal() function due to it doesn't need.
2. fix build error.

change v3:
1. add msdc_cqe_cit_cal() function to calculate the CIT value.

change v2:
1. add more comments.



