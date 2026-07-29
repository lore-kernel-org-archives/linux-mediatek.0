Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607BCC53200
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 17:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r9lmLVYjr93Girs1odAHEeMDnIJQvCQg1I6d0OHkOeA=; b=fbVcpkKEb73MP3FhoIcWTgtWNm
	IpHl29DHCAX+cY/hLDiYQ9nc1JEe8/tuXPOpCAqZNI4kfLAZkipeaYc/eGhOg7Mo1OvLfa68LKGB2
	pjPjnSy5y93kmG2a3JKavET2JoFT3kemEwYwYr3Ut2QKlN2IFyQdYn9QGYDSFjS+XS+YtIilbpzYA
	+VpuZYVI2ZTDqct548wXCcXlMubCkpKePZRN6V4bzhUosb+vGGgz07lcj/ULIdwQ2c0XaXdH78MIa
	2/5PeWVKSdVtgcenh4cIl0jROP6OfB7Pu/4Ms1REyNx2bEKvZQaEBK9/3TSG+sY8dIVcdrG4TtqeV
	HsSTVaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Cz-00000008iZg-3F4C;
	Wed, 29 Jul 2026 17:36:45 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8Cw-00000008iYQ-3vnS
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jul 2026 17:36:43 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cfff5f88dbso14533645ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2026 10:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785346601; x=1785951401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9lmLVYjr93Girs1odAHEeMDnIJQvCQg1I6d0OHkOeA=;
        b=ThspChvjEWTerxF4v+u36gVNAlUck5mMrPZvSjzCM6oHm7KQur9OUlPnf+aMey/WCg
         e9GibLFOHtEcXsh45fR7uQ8FfAy1Y2S2OB67igFhvuC8WxiwlCSsh4FIMZo03qFKlU/u
         7FR3d5CTi60YvrR+6OYMLel1wJXZ0iak9cKsEx5KMrm8nT4DhUprtYOr+m04jNQ6xWKh
         5Ya5aehR/pUnIt0aIdZv+n/q+e9VlD3X/62Pfe2ePZbbuoZvjOAL3qFz1LZa1dkTybnA
         KNTTxV7VeIyJ4KAwNm5I/Rk4D7cRL+z1ZvUuZUc+pOePZYnTqDju3y/1EGOZGrYDWWHd
         mfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785346601; x=1785951401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9lmLVYjr93Girs1odAHEeMDnIJQvCQg1I6d0OHkOeA=;
        b=mpeiVNOFSTseaC2WW03MFkfgxxecCxYxZrJsexQUEnkjuvpe14SMqgux1irCOUwmh/
         1AtRqKieXr9gZZByGt/c3yHpGs+tvkPc96WIpbgc6bXLab6bFkBwGFFN/gMoZ1nsigtf
         Cxn2fyNEjpBu1Q9WioCCQXc65l024mYE9MKGERvTg1xyPsI0Ic3tw4zaGLtFTk23dK6F
         FvF0GKtQAXG/pukdWG9Dm8oSrjvPCz6VXK7Z7MD2o8/y7+z+LCr+hl2gQJKrz4gtgjmd
         yCP2ZPDILk6PkPXuXhW1m+mDI1oG1pPsUXgjA7sd8fe1fEg6t8cNkCNPFZx86GoqIn7c
         1hZQ==
X-Forwarded-Encrypted: i=1; AHgh+RprO+au1TGE1aJAKQFFoS6wjsR/caz4eFCsix4lB/GG2GPYCmVHZWiQbu9gR6QaoEvE6LinQTIFGksXBGkbOw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0pPp9JIF2+gCDQzaH87lY67XB9vn5p311wyQ9mTZ8q8Mv06tO
	oAb8LfvDPH0X/AHnum+5K4rfEIPSkI9nzNRL97vPdfUspY7YQDJ2jueT
X-Gm-Gg: AR+sD11b6dS2RXga7aglcASCz9vlaSgINyKik6QuGz3Ciesq/thXHFdwKOmADp+p16e
	6NFWzJlG7TtVp4asRu6MaDfdvYejkshSzyUXSvpafcWQlHK0YejLiyejusUeeEHHM0eAtvCB7vu
	qmmd12ve9cbR1LSmwMxG8aeTkxCuZQTyq036FKf6d3aGIJgVFKRo9LLBOyOje1Hh9Q1gp9HglKG
	VC9SwYZPvvQ/Ydm0COXaO0WWQArVjrTbb3Fe5KkywOWG2tR+i8RflRgqXbybF7UdfO49SAvVkCv
	YrJFiuOdvnpVHXjtMyo01khmHxRKBl4sYwutt0Nwqnaoho/x9n6Taftgc/xT17ODlAcG0J0+Zqg
	gXwZIuXhEKn2Y8t/cJb9YAmtnVEXSZUTnEpiq2p0Jt7LjqZxL6rmX6ZQ++sMA81dcavevl6R5Oi
	Ogcj/0IDhOCuXwnAuG79QiX/QIqC/+2zG5oTMv2SuDOWzuQfitpn0UlF6f01cB2pMv4a5CKBWk5
	Zm99//XLy1ZpLAZHchzQHLETQ/UfgqkxDdGcQ==
X-Received: by 2002:a17:902:f54f:b0:2ca:f40a:be76 with SMTP id d9443c01a7336-2d015d94cb0mr78650655ad.36.1785346601182;
        Wed, 29 Jul 2026 10:36:41 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([120.234.91.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf39cdsm14806045ad.55.2026.07.29.10.36.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Jul 2026 10:36:40 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rex Lu <rex.lu@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Chad Monroe <chad@monroe.io>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] wifi: mt76: unlink TWT flows when MCU ADD fails
Date: Thu, 30 Jul 2026 01:36:30 +0800
Message-ID: <20260729173632.14387-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_103642_991821_2699AA14 
X-CRM114-Status: UNSURE (   8.95  )
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

mt7915 and mt7996 link a TWT flow into the device list before asking the
MCU to add the agreement. If that request fails, the accounting masks
remain clear but the embedded flow node stays linked.

A retry can corrupt the list by reinitializing the same linked node. If
the station is removed instead, the mask-gated teardown skips the flow,
leaving a dangling node for later scheduling and debugfs walks. The two
patches restore the list to its pre-request state on the MCU ADD failure
path, split per driver because their Fixes targets differ.

MCU DELETE failures are deliberately outside this series. Deciding
whether to drop host bookkeeping while firmware may retain an agreement
requires separate ownership and accounting treatment.

Zhao Li (2):
  wifi: mt76: mt7915: unlink TWT flow on MCU add failure
  wifi: mt76: mt7996: unlink TWT flow on MCU add failure

 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 4 +++-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)


base-commit: 57aa1718d5953dd532137d43b696c68545c2e0b3
-- 
2.50.1 (Apple Git-155)

