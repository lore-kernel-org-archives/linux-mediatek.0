Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5B8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 03:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zYpP22Uhi+IRUdf8k/0dQxAI+T4fjHlnDZby2Iq5vr0=; b=X/XKUb7Doqtu5I
	qdPH3f3r4PT0YfKCeCd7eo3jr1c/zWzr1+69Drd2edL+uYyUXXklgVT5SPKiAr46ZzdY5Ma59HKvW
	HvdKKdDgQLCZ5MTCksop5FsnEI5X8WCZO/Rn6U0xtsn8ojZtJqCgvqnYdLzSqGn8Jm7jrztwDXMy7
	MAU+28SS2lf188bnYYYYUV+gJtab0Y+Wtddb4GPLY2HnOV17HrSSqAyzFPsPpDXck4FHbh58+fFzr
	5aYPdRRlR6W43/bMNQxvrF3KAPGlVp/yBvKZuwP2vRu7pyr+vNW7KwB6HvhlhB67hAKyoZ3FkOeFu
	l6Wyj9ZAa17oQwXXWEHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMhwB-00CSL9-ID; Wed, 23 Feb 2022 03:03:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMhw2-00CSBV-6c; Wed, 23 Feb 2022 03:03:23 +0000
X-UUID: 7414cb2bcbe048b689b5c7514580d8fa-20220222
X-UUID: 7414cb2bcbe048b689b5c7514580d8fa-20220222
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 210440920; Tue, 22 Feb 2022 20:02:32 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Feb 2022 19:02:30 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Feb 2022 11:02:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Feb 2022 11:02:16 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <jassisinghbrar@gmail.com>, <robh+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH 0/2] Add gce support for mt8186
Date: Wed, 23 Feb 2022 11:01:36 +0800
Message-ID: <20220223030138.13939-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_190322_263636_5DF542F4 
X-CRM114-Status: UNSURE (   8.43  )
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

Rex-BC Chen (1):
  dt-bindings: mailbox: add definition for mt8186

Yongqiang Niu (1):
  dt-bindings: gce: add gce header file for mt8186

 .../devicetree/bindings/mailbox/mtk-gce.txt   |   8 +-
 include/dt-bindings/gce/mt8186-gce.h          | 421 ++++++++++++++++++
 2 files changed, 426 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8186-gce.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
