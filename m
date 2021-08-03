Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8773C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 08:02:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A450560EBD
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 08:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A450560EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1FAFsueEfTbvpm5gj3rk2YQf0sP7tSmpu9hw8YcWJFQ=; b=n6cnG85OGvzvVU
	bJooS3K/VYY1R65uN4IN4L/S38un0XATrEz9+5Yykpn+4z+u2tv1jrw4iQb+erHu68F7nVR7CyEKa
	aZCRwLFv/q47XUkYjspZtHS8S0tqTVIf7chXe+wAEeU/T3uaf2fkTmclCDfTZqGumHvE05OOpUe1x
	KVjSkI9hkwLRc+Of8tVNE2G4Qc0dD7/gilEU1dl4pf6fAf6qQQgNmooGaTjB23bSc7SJF6ypyriCT
	DShoJib3Hp/hMsRq/AvU4+MHYGHL23pkzMD/TXBN2EJkotJZr79Q7yDm+AYlZsTJ5iTi70WihoI/J
	zFzh3p2oWketPi0bYx0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mApNn-001Wms-5F; Tue, 03 Aug 2021 08:02:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mApNk-001Wl9-7c; Tue, 03 Aug 2021 08:02:37 +0000
X-UUID: ade9792904244b088e62def8c3a52448-20210803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Pb2QrWj+Yzqxsj/XNvTSF8swYoqlyuQebfEcntCaKak=; 
 b=TSUAuzd+qC6Y80b78FM1nGYnBEFhc8pf6w8ix4+PyivE7DEBl1cjTVrxySOSYCLZEq31L7MLrR8EPffWXGh+a9UQ//pqYTDEGQdZRn/RbC/QT5hRXcIN7AC8atF3rEau4m/1awtR17PqEsaEsaCI31YzYnF+qyw/t1A6oc/eGKQ=;
X-UUID: ade9792904244b088e62def8c3a52448-20210803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 409684914; Tue, 03 Aug 2021 01:02:34 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 00:59:25 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 15:59:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 3 Aug 2021 15:59:23 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <ohad@wizery.com>, <bjorn.andersson@linaro.org>,
 <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, 
 <krzysztof.kozlowski@canonical.com>, <shawnguo@kernel.org>,
 <sam@ravnborg.org>, <linux@rempel-privat.de>, <daniel@0x0f.com>,
 <Max.Merchel@tq-group.com>, <geert+renesas@glider.be>, <fanghao11@huawei.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH v5 0/5] Mediatek MT8195 SCP support
Date: Tue, 3 Aug 2021 15:59:17 +0800
Message-ID: <20210803075922.11611-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_010236_332335_3EB0453E 
X-CRM114-Status: GOOD (  10.74  )
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

Changes since v4:
- Move clock acquirement to mtk_scp_of_data
- Add new vendor-prefix for Mediatek SCP
- Refine mtk,scp.yaml
  - Remove '|' in 'description'
  - Add 'items' to replace 'description' in reg-names property
  - Add 'const' to replace 'description' in clock-names property
  - Add optional required property for mt8183 and mt8192
  - Rewrite 'patternProperties' by 'additionalProperties'
  - Rewrite example with 1 address and size-cell.
  - Drop dts label from example 

Changes since v3:
- Add missing patch version in mail subject
- No change to patches.

Changes since v2:
- Add compatible for mt8192
- Convert mtk,scp.txt to mtk,scp.yaml 
- Refine clock checking method

Changes since v1:
- Fix missing 'compatible' line in binding document

Tinghan Shen (5):
  dt-bindings: remoteproc: mediatek: Add binding for mt8195 scp
  dt-bindings: remoteproc: mediatek: Add binding for mt8192 scp
  dt-bindings: vendor-prefixes: Add another prefix for Mediatek Co.
  dt-bindings: remoteproc: mediatek: Convert mtk,scp to json-schema
  remoteproc: mediatek: Support mt8195 scp

 .../bindings/remoteproc/mtk,scp.txt           | 36 --------
 .../bindings/remoteproc/mtk,scp.yaml          | 92 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/remoteproc/mtk_common.h               |  1 +
 drivers/remoteproc/mtk_scp.c                  | 48 +++++++++-
 5 files changed, 138 insertions(+), 41 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
