Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7862C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 03:13:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86E7065077
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 03:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86E7065077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FUQ172NN+6gzsIVT1s84hz1wXzgtc9Mc8xbbyGD4Hv8=; b=gzsj/UNg6HzkgsXSjUpq96BwIR
	CFg272mUtMkU63iWxw5MqzngGdSPfDyZf8al0H4wkCdb5+b0Te260K/1oVKyFrctsl3uTnxwShQKK
	oydwI+1E81bARnHmVQHL6ecJZy+E6JnIMYx0Px2VtKSD6oMD15i2uxJbXj3F8naAGd748K/uVFDYT
	Slvvj0aGF4Pq9JT8j7NxbGQbkW7PL4SBsUyoz1R0pNwY6fh7KGfiBnGYDAIp2+sglwLomKcMaCjrf
	tBXjvRLxDh9X8VQJZSaBZaHCnuXYfytpEqBVJARIwdnI7dwE42ZS3UowZF0RaEDy3jOh67OwGCI1o
	klElH/QQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM099-00HIKB-AP; Tue, 16 Mar 2021 03:13:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM08y-00HIJB-3x; Tue, 16 Mar 2021 03:13:19 +0000
X-UUID: 83f40cfbdd424ac786d2900be7013cc8-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=tQRo9UdhSnXs02W6uvLbsoSUbr9KO76ZmItRV/VjI94=; 
 b=fX30FltDx6aq8cJE5aUyU4R7rJ0/z3VMem05B+RpmqR4D2ZQnsEYDcUVJk5vDYykcxwmnkbih4hPHz7iG9oPtd2Z4oLr9AP6KdpEsua7M0C5FZxuOCTpNtZCuWMh2a7bvjavuJZUJN+lNd5r6mfl12WhXf/sWedfV55QUgWqL+E=;
X-UUID: 83f40cfbdd424ac786d2900be7013cc8-20210315
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1133359896; Mon, 15 Mar 2021 19:13:08 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 20:13:07 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 11:13:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Mar 2021 11:13:05 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Rex-BC
 Chen" <rex-bc.chen@mediatek.com>
Subject: [v4,0/2] Add check for max clock rate in mode_valid
Date: Tue, 16 Mar 2021 11:12:56 +0800
Message-ID: <1615864378-21754-1-git-send-email-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_031316_924050_A899FA0D 
X-CRM114-Status: UNSURE (   6.05  )
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

Changes:
  add Author and add patch description

Rex-BC Chen (2):
  drm/mediatek: mtk_dpi: Add check for max clock rate in mode_valid
  drm/mediatek: mtk_dpi: Add dpi config for mt8192

 drivers/gpu/drm/mediatek/mtk_dpi.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
