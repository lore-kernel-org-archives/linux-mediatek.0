Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E68DC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 06:33:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE96F610A5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 06:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE96F610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJP8eUWTUIQex5VpdSde/gjTJMzfYn22dr6XJR7WMbY=; b=kT1cz9BRtg4eIW
	flkGKhmUrK/QmYAopgOzM/YqBdE1IcUMKaETjoGToR3gYOyLjWGzQM7XcIMY4SDAU6GqqKk1SVF9M
	KtNPTBNQJNDcyKlzjbl8I/sfAg3guqUe+K7ZAahEJ0bO79vZcJV4RijPAj0Wpr287aFOpEOYKlbgm
	NmTfI4so2rC0xxC+CyeSWmibM8Q6Nq9OjtlUS5IVh+zKC2gW8mxjzm/ueU6e4xjAajwRTjasWuGOE
	SmbFwqMCYuilACikgR5QE1RcKiAnEjLv5NPY0DSaBmaZCa/ou5uHs9bTQaYDFMklCLs8BQVD0VJ7Y
	mB1pBkih5Cv2zsZYLRyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEQkK-00Bq3A-Hf; Fri, 13 Aug 2021 06:32:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEQja-00Bpcd-TN; Fri, 13 Aug 2021 06:32:06 +0000
X-UUID: 7680e497b4e4413fab29f646dd8d185c-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qOFm7HOpxtDCgpp8io5qPOxVRHoi3S1kz9zooPfBxzM=; 
 b=hI872B4VK47Z8drX1qA0FdBt663dVSy46YflEh7szoHvaMfN4XGnQpDzgCE/9JGgbTRavILhpsl69J/Be9gGCx1melnAbshuqgv+fKWnXoUcZznw2NfT8k2yYe1dEUYF2cFfqacClbp3+MncIPNUFRf83o5SJZ4XA4CsPboryaA=;
X-UUID: 7680e497b4e4413fab29f646dd8d185c-20210812
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 471757778; Thu, 12 Aug 2021 23:31:57 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 23:31:55 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 14:31:54 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Aug 2021 14:31:53 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi
 <balbi@kernel.org>
CC: Pawel Laszczak <pawell@cadence.com>, Al Cooper <alcooperx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Yang Yingliang <yangyingliang@huawei.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bcm-kernel-feedback-list@broadcom.com>,
 <linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, <stable@vger.kernel.org>
Subject: [PATCH v3 2/7] usb: mtu3: use @mult for HS isoc or intr
Date: Fri, 13 Aug 2021 14:30:48 +0800
Message-ID: <1628836253-7432-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1628836253-7432-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1628836253-7432-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_233203_001910_740B71F3 
X-CRM114-Status: GOOD (  13.06  )
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

For HS isoc or intr, should use @mult but not @burst
to save mult value.

Fixes: 4d79e042ed8b ("usb: mtu3: add support for usb3.1 IP")
Cc: stable@vger.kernel.org
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: fix invalid email format for stable
v2: new patch, split from [2/6] suggested by Felipe
---
 drivers/usb/mtu3/mtu3_gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 5e21ba05ebf0..635ad277cb13 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -92,7 +92,7 @@ static int mtu3_ep_enable(struct mtu3_ep *mep)
 				usb_endpoint_xfer_int(desc)) {
 			interval = desc->bInterval;
 			interval = clamp_val(interval, 1, 16) - 1;
-			burst = (max_packet & GENMASK(12, 11)) >> 11;
+			mult = (max_packet & GENMASK(12, 11)) >> 11;
 		}
 		break;
 	default:
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
