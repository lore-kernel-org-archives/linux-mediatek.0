Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F743C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 15:05:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D796960F9E
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 15:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D796960F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9P8kPuGq8aJvGOMibKUnjUwWoPEy0gFTXzn9heIdHHY=; b=pGhL7eqtqllD0F
	CY1EjpjK0P6NJW6YJSs9g0xB64zYLIBBmMQdukUGp/gg4tuCYRpUUTHiNomVMQRy5vuZ0jGmi3SnQ
	xkjGqSaidMiIAoQ9TlQvZTHG74KeQvVsQS9C/v9JIjVYMp80MK5V7nRCal7f7diSQ7sDOFOagGTuA
	xHNid+OcshDuKy+zH2tpEDVy+MVdteky6Prg6L3EQq+PaztPvL9F53sobpDiLDgASHWx9lqyGXeHk
	LaWI3lWo2ZlsAwHGIMlKjY1bfHLvKtBirnxnymUWT0II5HhpoKQHrmDRRFLhjlQ1O4CkbksDmqF61
	RGTSMSKzPqOCU7lv1FOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAZVg-00Gqoo-U1; Mon, 02 Aug 2021 15:05:44 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAZVd-00GqlA-9b
 for linux-mediatek@lists.infradead.org; Mon, 02 Aug 2021 15:05:43 +0000
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
 by mail.holtmann.org (Postfix) with ESMTPSA id B92E9CED0B;
 Mon,  2 Aug 2021 17:05:33 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH 1/1] Bluetooth: btusb: Enable MSFT extension for Mediatek
 Chip (MT7921)
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210802125941.29078-1-mark-yw.chen@mediatek.com>
Date: Mon, 2 Aug 2021 17:05:33 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>, chris.lu@mediatek.com,
 will-cy.lee@mediatek.com, Sean Wang <sean.wang@mediatek.com>,
 BlueZ <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>, michaelfsun@google.com,
 shawnku@google.com, jemele@google.com, apusaka@google.com
Message-Id: <838E84AB-1F38-45A3-A5B7-27CE134FFD49@holtmann.org>
References: <20210802125941.29078-1-mark-yw.chen@mediatek.com>
To: =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?=
 <Mark-YW.Chen@mediatek.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_080541_527366_791157F6 
X-CRM114-Status: UNSURE (   8.98  )
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

Hi Mark,

> The Mdiatek MT7921(7961) support MSFT HCI extensions, we are using
> 0xFD30 for VsMsftOpCode.
> 
> Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
> ---
> drivers/bluetooth/btusb.c | 2 ++
> 1 file changed, 2 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
