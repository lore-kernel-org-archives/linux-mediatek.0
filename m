Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CBEC32796
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 13:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1mC1qjq1nLPOWjHV5r+l86DrF7X2T1C9oykomno0dVI=; b=lAyIs3NP29zgjVtJ3HLY37dV+2
	X7TYXEbBIXEQg19kTjECVtrmlpjg3tb2lcoGk7iD+3XH8JYlAvkMfUIkgeI09nMgNEk8fNwHXkF9k
	/cR6tshe+QErhXp39C7hmHoRfYFCn6yzwPeryneQ8WTp/FzR0i1lBQIgkDcDfC6ZhGpjY1kuBrc2K
	exWzgcq7inhwpZR6+DnuWGif9Oik5rB9yCWlA07h2rjIAgRi0iZRIYT06M+IomZ5Mr7JIn9njbsqH
	5+lm69/xLnaglKhfdFYL7I8bvk7mOUvHXe1Xy6/yOsHOKx1ARQ7vJZvpjvblTQLCpKYgUFWGw0o0W
	WiBh62Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqN4-00DDks-Lt; Wed, 24 Aug 2022 13:24:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQqN1-00DDiq-Ss; Wed, 24 Aug 2022 13:24:37 +0000
X-UUID: 095b611755d3482f8ac828cfd5eb29c7-20220824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=1mC1qjq1nLPOWjHV5r+l86DrF7X2T1C9oykomno0dVI=;
	b=RSgUydQddO9IgFFJNqQd3inehTU2QsIEIN67YfK5ql6JDZI++CtcME6A2L/7QULaewfxTQxvTvicraYufsxITQZgrIMK1u0f8sMX8R7hOpZgcyqS31lHqIBcnRKQaUL6phv9X+3qNz3yj24GQCn60rRPW2EnzeQoY+kZWWsEeeY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:58825e79-ff0b-4345-bef0-49608a1e6ae9,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:99087ccf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 095b611755d3482f8ac828cfd5eb29c7-20220824
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 404239745; Wed, 24 Aug 2022 06:24:29 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 24 Aug 2022 20:23:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 24 Aug 2022 20:23:20 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<nfraprado@collabora.com>, <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <matthias.bgg@gmail.com>, <jiaxin.yu@mediatek.com>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<project_global_chrome_upstream_group@mediatek.com>, chunxu.li
	<chunxu.li@mediatek.com>
Subject: [PATCH v2 0/2] ASoC: mediatek: dt-bindings: modify machine
Date: Wed, 24 Aug 2022 20:23:17 +0800
Message-ID: <20220824122319.23918-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_062435_947880_6FFDC22F 
X-CRM114-Status: UNSURE (   7.32  )
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

From: "chunxu.li" <chunxu.li@mediatek.com>

Changes since V1:
  - remove unnecessary quotes

Add SOF related field.
1. Add a property "mediatek,adsp", Only when adsp phandle could be retrieved,
 from DTS, the SOF related part of machine driver is executed.
2. Add a property "mediatek,dai-link" to support dai-links could be specified
 from DTS

chunxu.li (2):
  ASoC: mediatek: dt-bindings: modify machine bindings for SOF
  ASoC: mediatek: dt-bindings: modify machine bindings for SOF

 .../bindings/sound/mt8186-mt6366-da7219-max98357.yaml  | 10 ++++++++++
 .../bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 10 ++++++++++
 2 files changed, 20 insertions(+)

-- 
2.25.1


