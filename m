Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF73DC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 04:39:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9188B611C0
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 04:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9188B611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xrQYovM+D19WWQS3USUgGlvOKFFSgp2xqcFUQYyf2IU=; b=k7NysKYEpkzY7q
	Ldwg3LJJJUod2IaiCB7/vmpuEuHyO+rk1s7l1WsGrVUu3wxvuYv1OPklu9qQBMxbznF2zbwGp6/79
	JhMZx1fREjYl9dLQ72GwO6GF1ZiHWNuWRTUXsN3rmE89/ZuP9SmZeNrQL3rSKhqVOOwMOzrAMfhAo
	g7fIFq1NIlU9Z+DojxwhLJjEcGFL/rnccf9w9Y8ojNXZafd5jUinvVzYwaTFoZKFwldzGbM33qUcp
	lWyhq5VW02xlE9ZFVe7JgUAWuh622yTCl87rO8pv2wvAjWvp8Y6Bf2QUOrZPV/XXfExI2dASFhMx/
	A79tFy8k6th7q2oabV3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3t9Q-00H7Ob-FL; Thu, 15 Jul 2021 04:39:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3t9C-00H7Ms-3u; Thu, 15 Jul 2021 04:38:56 +0000
X-UUID: 5199ec28aa9648b68960f458b5bfcb0f-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID;
 bh=FlJW4bMYIdDzSfoxFCdD9ZdvL9adkU6NtqycME8tAaU=; 
 b=hZYdqdv6jWmqityXaKrWkMiyxbB36kYRbxOfsXEJrdKZriw4e988BX/3grOIgjMpW+uDOOtqIjLuKnvTJkcB9x5WlyUgUhsSUc0t1uIW+ofG/27MutZPoLMhjJZu2656XoAEIlTIBSwtt81xq1P2crgofiGaVdkfuLd1I1SNdWw=;
X-UUID: 5199ec28aa9648b68960f458b5bfcb0f-20210714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 170665269; Wed, 14 Jul 2021 21:38:48 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 21:28:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 12:28:39 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 12:28:39 +0800
Message-ID: <1626323319.18118.17.camel@mtkswgap22>
Subject: Fix: Please help to cherry-pick patch "bdi: Do not use freezable
 workqueue" to stable tree
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-stable
 <stable@vger.kernel.org>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>, Ainge Hsu
 <ainge.hsu@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, Miles Chen
 <miles.chen@mediatek.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Macpaul Lin
 <macpaul.lin@gmail.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-usb
 <linux-usb@vger.kernel.org>, AceLan Kao <acelan.kao@canonical.com>, "Rafael
 J. Wysocki" <rafael.j.wysocki@intel.com>, Jens Axboe <axboe@kernel.dk>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Date: Thu, 15 Jul 2021 12:28:39 +0800
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_213854_366779_A44D4B1A 
X-CRM114-Status: UNSURE (   6.87  )
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

Dear Greg,

Our customers have feedback some similar issues as below link on Android
kernel-4.14 and kernel-4.19.
  Link: https://marc.info/?l=linux-kernel&m=138695698516487

They've reported system become abnormal when OTG U-disk has been plugged
out after the system has been suspended.
After debugging, we've found the root cause is the same of the issue
(link) has been reported. We've also tested the patch "bdi: Do not use
freezable workqueue" is worked.
  Link: https://lkml.org/lkml/2019/10/4/176
  commit id in Linus tree: a2b90f11217790ec0964ba9c93a4abb369758c26

However, we've checked that patch seems hasn't been applied to stable
tree (We've checked 4.14 and 4.19). Would you please help to cherry-pick
this patch to stable trees (and to Android trees)?

Thanks!
Macpaul Lin
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
