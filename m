Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D6AC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 06:00:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E5382076A
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 06:00:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2SbwTB+4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QbSlvJqP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E5382076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DVVSOX7PYv3d9eBoYsYK30ki1dBZT6g47gWmSJzf+Oc=; b=2SbwTB+4mGtcriEUUgWE7zYIfk
	VLMR04sXEP+n2fxwGjDTW9QsYhAfoobv7hoyw/eT4FCCWVYCWLRsB3KmU8NwXtZCIHVXjkHvGwrXm
	UUPpXp2Pip2BIwuPBID6H/XfJ4d3L8u7U3yuUiqLll75+Su99kpMZ6vKNAbd283pGdLFyxE8hoYyW
	mFR3IAsCd/aBUeVk+w4GxlStsLk54RHhaEyrgy1DvOn6CPa6rEOA+03fWmdnTv0i92ZUO8MtJAzGK
	4450RkEOo/PPuHcGTPInIQIgGZShUnr7yQR0jqxfI8btWQcFk6q2cO+tP7IBfypV3rdiyCkF6mFiI
	lTd9dlaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtm4d-00027I-HI; Fri, 10 Jul 2020 05:59:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtm4Z-00026K-IG; Fri, 10 Jul 2020 05:59:49 +0000
X-UUID: 37baaee26ccd4144b145eba8001ca138-20200709
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=NXSoc40w/vzs0ddT+Wgmf68IXPtgdbuXrs4l5A4rBb8=; 
 b=QbSlvJqPSnMFhxDlQjAwuFfqCFVI8kw/C7eolqgnJz5u2aKy00V+DxPsVgxoWxdDdDoLi3iddwQt7gT09KYlLmZRn0W3Kcxkq69Zf5jpDlxhrofjBPuxqcggQy6vfLBc+hJ+wEu+6uqetrP7p/GYtuhk2NOeiG8jh1k0uXpWgHc=;
X-UUID: 37baaee26ccd4144b145eba8001ca138-20200709
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 743601508; Thu, 09 Jul 2020 21:59:42 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 22:58:53 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 13:58:48 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Jul 2020 13:58:49 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Subject: [v2 PATCH] usb: xhci-mtk: fix the failure of bandwidth allocation
Date: Fri, 10 Jul 2020 13:57:52 +0800
Message-ID: <1594360672-2076-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: A4E306D334522FFBCC74B2420148282F0928E1E8771E2A2BEF95B67EF98867B52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_015948_012994_B16E0BFC 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The wMaxPacketSize field of endpoint descriptor may be zero
as default value in alternate interface, and they are not
actually selected when start stream, so skip them when try to
allocate bandwidth.

Cc: stable <stable@vger.kernel.org>
Fixes: 0cbd4b34cda9("xhci: mediatek: support MTK xHCI host controller")
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
V2: add Fixes suggested by Nicolas
---
 drivers/usb/host/xhci-mtk-sch.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index fea5555..45c54d56 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -557,6 +557,10 @@ static bool need_bw_sch(struct usb_host_endpoint *ep,
 	if (is_fs_or_ls(speed) && !has_tt)
 		return false;
 
+	/* skip endpoint with zero maxpkt */
+	if (usb_endpoint_maxp(&ep->desc) == 0)
+		return false;
+
 	return true;
 }
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
