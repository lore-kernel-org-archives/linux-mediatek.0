Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC988C4727D
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 23:09:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1BFD21D7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 23:09:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U3hgVT/8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NTwz65oe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1BFD21D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yKgKz2HmbDj24M8/RxcHkkMYLefRbf65h7eqLWLQamg=; b=U3hgVT/8Ff09CvPFmuCwy6ExKe
	T5VAYkv2YDlh/4Ll9idPAqa7DOJT6CZBp+yUtrDzW6DLKO/v19vJlo5ziXBgeEokJOiiBzgH9yxPg
	3zFqK2K/416EkbISlbkPIz0fe/7D1qzyNNkei113rdaGEGI2bwcFyJayRV04lMVfTIeQ/aXx1+08R
	NPE5eE5YIKzZZOi7mTeqgvgKRgGB+wVEqTa3WQzJdR8+ThvOno8leN338MNadKmr/5XMFwy9LNbn6
	CKbjl98uKwcz9+MvE9sBzmThgXk4pEbUGFjaBLVdFO21ggw0+5g/ZH5yxKoZ6pcQ1mXQnzqgaTR7N
	XYsAjP4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKUwF-0005ft-Cs; Mon, 21 Sep 2020 23:09:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKUwB-0005ec-9z
 for linux-mediatek@lists.infradead.org; Mon, 21 Sep 2020 23:09:36 +0000
X-UUID: 4847071a1d494a44b8478de5c80acb3e-20200921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ehfb91CZzudcGd//YT5PVZW9V0LBguKR5pLVDx0OdJs=; 
 b=NTwz65oeZOqpnWxUofHD1KbpIV8bF9sVEvbgGKIHcpltCfeJNXGdFXEv3lGM52ITLEm8UiaB45dW0oDNdTg3S0cGQKeJVZyE8W4k41Ol64kakLOoAob4KuXxDK2P5w6K062RhJGbbtbIEm5mDRyVya21/SKNBpXpPOo/oBWma7o=;
X-UUID: 4847071a1d494a44b8478de5c80acb3e-20200921
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1874752394; Mon, 21 Sep 2020 15:09:27 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Sep 2020 16:09:24 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Sep 2020 07:09:24 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Sep 2020 07:09:23 +0800
From: <sean.wang@mediatek.com>
To: <davem@davemloft.net>, <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <vivien.didelot@gmail.com>, <kuba@kernel.org>
Subject: [PATCH net-next] net: Update MAINTAINERS for MediaTek switch driver
Date: Tue, 22 Sep 2020 07:09:23 +0800
Message-ID: <5d601ae7347d49268822356121d5388739311459.1600729601.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_190935_468706_7332111E 
X-CRM114-Status: GOOD (  10.04  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Landen Chao <Landen.Chao@mediatek.com>, Steven
 Liu <steven.liu@mediatek.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Sean Wang <objelf@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <objelf@gmail.com>

Update maintainers for MediaTek switch driver with Landen Chao who is
familiar with MediaTek MT753x switch devices and will help maintenance
from the vendor side.

Cc: Steven Liu <steven.liu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Landen Chao <Landen.Chao@mediatek.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e3c1c70057e4..0ee08f131a42 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11062,6 +11062,7 @@ F:	drivers/char/hw_random/mtk-rng.c
 
 MEDIATEK SWITCH DRIVER
 M:	Sean Wang <sean.wang@mediatek.com>
+M:	Landen Chao <Landen.Chao@mediatek.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/dsa/mt7530.*
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
