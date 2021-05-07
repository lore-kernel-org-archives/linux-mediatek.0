Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B8AC43462
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 02:12:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07E386113D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 02:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07E386113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=THfdgYmDxKpUJJEb2JYQblMVRpiIQH1+eNJVX4RgNLI=; b=ZukcEe2+v6UretBua0YKKQJs3
	GOGLf0vwftvhbg4dRNSDidBM/5jIxye00454iAbwRUpZOyKZPuWrLnILz8lNd/uutCUwTMsWfLDwr
	89PHz7JfOucJrHCS52/yoQPVNkW42+t1U1cHTNUnscrYXHtg4PXDcnbZE0Zxb32y9KEwkyhPDjlsA
	ZaUKN3AtaGrj8hGZWIC8Ln3rO1V/breMoRyZZs8e1z9bPLP5XKVazLNs64+nlPD1o25RZgkZ+LIid
	/H5WLDukoT0pHMUVrHJRYr4XNmmahJUwT6GtUipdbYfrvuGClXZC6THt2vQq4SKHTM0pyGMDWXT1P
	Is34QuQJA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lepy8-005q6Z-4A; Fri, 07 May 2021 02:11:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lepxt-005q4n-Ef; Fri, 07 May 2021 02:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=NPgTcIgW2uDi8Jb3tOlGTVkuqdYHCq5ukEckW6p8fnM=; b=uIir3VL+4osW0I4iXzF+kLUiRA
 mvQdmWiQvy2UNKa/BMBAWfbiR5fttrL5+4OQG6vjoEs/o+b03NZmmVe3BKmxyALG9RJFg/qrUvdB2
 xRb5CptQNJlazt+ewGuKEGqSM20itO2slrPPosC1h/+qcggNAS4rXkhiJbh9B+kSJDaG9r8YOY6+q
 UmiQj3jKx78x+ndzh1xuXCoGioI1c6UbahF7w9bcYn4lJgR87QsStwLTC6ctRUb+/YuObRSMkVu8G
 IwzlOjHBsZv2yj7V2P0W2iq226ZIHwHDoizSLngKrvLuLVm9WT6ejKElvOttq9TAeo+xa8tDAf+lG
 4nPB42Cg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lepxq-006WKl-Bi; Fri, 07 May 2021 02:11:39 +0000
X-UUID: 0dd3db02a96d441a9da3197e3177cf63-20210506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=NPgTcIgW2uDi8Jb3tOlGTVkuqdYHCq5ukEckW6p8fnM=; 
 b=IHzRZxwK91GrLh1b/IpjqHfAAmQUaSnCXXdOvjSoh9xK7xjVAmcsoyNcJ0twDWFc/QGY0R7FsYPRq4ns4OdfZMGrrUiMQDIIaIuv/a0P8EmOd0spdHF2nkbmXVbRrAm8CpfMsIZpn666FKQE0RS8ESPyxxrBCjBFQIhvy/zetxY=;
X-UUID: 0dd3db02a96d441a9da3197e3177cf63-20210506
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1920907830; Thu, 06 May 2021 19:11:33 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 19:11:32 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 10:11:30 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 May 2021 10:11:29 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ikjoon
 Jang" <ikjn@chromium.org>, Eddie Hung <eddie.hung@mediatek.com>, "Sergei
 Shtylyov" <sergei.shtylyov@gmail.com>
Subject: [PATCH v3 4/4] usb: xhci-mtk: use first-fit for LS/FS
Date: Fri, 7 May 2021 10:11:27 +0800
Message-ID: <20210507021127.54717-4-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210507021127.54717-1-chunfeng.yun@mediatek.com>
References: <20210507021127.54717-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0269824944F8711192F45F979C6A83DEF9026876C84B90A1EAD5F5ECE6A8B7732000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_191138_430800_DE011329 
X-CRM114-Status: GOOD (  10.12  )
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

Use first-fit instead of best-fit for LS/FS devices under TT,
we found that best-fit will consume more bandwidth for some
cases.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: no changes
---
 drivers/usb/host/xhci-mtk-sch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 9fb75085e40f..c07411d9b16f 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -634,6 +634,11 @@ static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
 			min_bw = worst_bw;
 			min_index = offset;
 		}
+
+		/* use first-fit for LS/FS */
+		if (sch_ep->sch_tt && min_index >= 0)
+			break;
+
 		if (min_bw == 0)
 			break;
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
