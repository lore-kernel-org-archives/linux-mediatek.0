Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D53C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 11:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gW757/CFyaYr+ijvAfUFFybRA2rQy/pS81WI/+LiRgU=; b=FYREewO8M5ehQa
	srDKoei0BPy1NBRP2tlUyumfQU+XsesAwhb/pLYt0udmSj6gcxXfmCsQYvBkZrci6cRjqNL5tvD3S
	StCPfGqdiuM5qvRpB37bCnnM4lEoV0KWLgMEioZcarP+iMV9C2xnYXwW3yMHGKAMqnF0V57C/6Vr+
	wTFcmnmsVfIZsrX2/8hvUQEtM113sZzGq9w+0C6g/o+2+nGtaZwijp2+B/DxuuLnZyGpSIQHObBCP
	GZGwAWSRYc8ek3+2IcgxoVeArv1erZlocG8+z7W1VASq9VTZp92EDsE73tc6Dbya88RDWgvDXIt/b
	l+FxR+0sQPrcqWCWzL8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCJjk-007alu-7S; Tue, 25 Jan 2022 11:11:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCJjY-007akC-Qs; Tue, 25 Jan 2022 11:11:34 +0000
X-UUID: 06fa1767d4cd44dab8fa4974470adf1a-20220125
X-UUID: 06fa1767d4cd44dab8fa4974470adf1a-20220125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 921675398; Tue, 25 Jan 2022 04:11:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 03:04:21 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 25 Jan 2022 19:04:19 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 19:04:19 +0800
From: Kewei Xu <kewei.xu@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
 <housong.zhang@mediatek.com>, <yuhan.wei@mediatek.com>,
 <kewei.xu@mediatek.com>, <ryan-jh.yu@mediatek.com>
Subject: [v2 0/2] add i2c support for mt8186
Date: Tue, 25 Jan 2022 19:04:11 +0800
Message-ID: <20220125110413.18988-1-kewei.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_031132_902176_C1FFFEA1 
X-CRM114-Status: UNSURE (   6.77  )
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

V1:
Add i2c compatible for MT8186. Compare to MT8192 i2c controller,
MT8186 doesn't need handshake signal with apdma.

Kewei Xu (2):
  dt-bindings: i2c: update bindings for MT8186 SoC
  i2c: mediatek: Add i2c compatible for Mediatek MT8186

 .../devicetree/bindings/i2c/i2c-mt65xx.txt         |  1 +
 drivers/i2c/busses/i2c-mt65xx.c                    | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

--
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
