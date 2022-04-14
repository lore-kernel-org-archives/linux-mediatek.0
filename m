Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79B0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 12:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7HRDKBlNcn/M+0ZMcYn6Cb+8DOjCwfIzMwvgkU0k6AQ=; b=VVqGh5cL44fo6m
	W4ZUo7XgmjSZfOSKxVZUYtdL8W8gLsai3bFrfyfnhczl6GgRqXgIIsNKc9oRKrJxBMd9FT8TJm6pS
	r7jID5pZYWFfEIwijoEd6L7u3zfERMKP+3ics/mhrWwX81E1uOgVMKiNTSWQJyBJWR78yOs8aQaFz
	MZ8pPWVlhwJroz7M18g6/gMWQhbRo2JPUcmbxbuycQoMvkwSWaJPDyNcJvxtz7AEyAl8ozTD0ab7d
	3BtCWGV9bUnCEaGEVbjLnQ2fPadQgYMQi1maG4BqT+qPjOqft+84KTLx0KU0hDx4MblHwzH/P3z5w
	3+G+KW0I1en6iTHjQXgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neyU1-005VB0-E4; Thu, 14 Apr 2022 12:21:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neyTy-005V8g-Ma; Thu, 14 Apr 2022 12:21:56 +0000
X-UUID: 9726286924db46edafb60065aba6330c-20220414
X-UUID: 9726286924db46edafb60065aba6330c-20220414
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 591788969; Thu, 14 Apr 2022 05:21:45 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 05:21:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 14 Apr 2022 20:21:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Apr 2022 20:21:42 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-remoteproc@vger.kernel.org>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 0/2] remoteproc: mediatek: allow different SCP firmware
 names
Date: Thu, 14 Apr 2022 20:21:38 +0800
Message-ID: <20220414122140.6114-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_052154_765622_0BD8AED9 
X-CRM114-Status: UNSURE (   7.63  )
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

The SCP needs firmware which differs between platforms and SoCs. Add a new
property "firmware-name" to allow the DT to specify the platform/board specific
path to this firmware file.

The firmware-name property is optional and the code falls back to the
old filename if the property isn't present.

Base on tag: next-20220412, linux-next/master

changes since v1:
- fix a misspelled word in commit title

Allen-KH Cheng (2):
  dt-bindings: remoteproc: mediatek: add firmware-name property
  remoteproc: mediatek: allow reading firmware-name from DT

 Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 7 +++++++
 drivers/remoteproc/mtk_scp.c                              | 7 ++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
