Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96DFC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 16:55:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B289520759
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 16:55:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vHnVrUru"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B289520759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iTiG1adNXT/s3xmjY/VRbBYlbQ6tf5wXf6QNbrx3pPg=; b=vHnVrUru9GIUJx++RRuLWMMPj
	ZBVeC5lChT8jpurUaJRL9BOTnnGosj04RE8wedzOo/k+s97n5049srI/BbpyDW0cfZJ54Day6ToBT
	l9gg2sHPunVj2tL179sAvxTz1jhEmGBAelgBkV+QpLbtVa2J0ArZx8ErV0yXLBJQD7mL6nlXle9Tl
	Wa+fIhDu3vvyEnHWphUpeeyzXxzwNNkiA8tpiSaiTnn8wD4znirmyHxKASly3nIC7DmC2HN4wTeNK
	WSFbV4PZwE/NapgR5+Il/Nx3EdKXzUMKReCZnsfqsVSNDpbG4mH9rfqvxscMETyiMU/AYSi1PJTon
	WAPcu+56Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqJXy-0004fM-81; Tue, 30 Jun 2020 16:55:50 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqJXn-0004co-Im; Tue, 30 Jun 2020 16:55:46 +0000
Received: from marcel-macpro.fritz.box (p5b3d2638.dip0.t-ipconnect.de
 [91.61.38.56])
 by mail.holtmann.org (Postfix) with ESMTPSA id 8CF1ACECEE;
 Tue, 30 Jun 2020 19:05:24 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2] Bluetooth: btusb: USB alternate setting 1 for WBS
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200630130940.14339-1-hildawu@realtek.com>
Date: Tue, 30 Jun 2020 18:55:29 +0200
Message-Id: <5A548628-4B7E-4E25-A728-B1CD06C28F39@holtmann.org>
References: <20200630130940.14339-1-hildawu@realtek.com>
To: hildawu@realtek.com
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_125540_430828_565428CF 
X-CRM114-Status: GOOD (  10.52  )
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
Cc: max.chou@realtek.com, Johan Hedberg <johan.hedberg@gmail.com>,
 kidman@realtek.com, kernel list <linux-kernel@vger.kernel.org>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>, alex_lu@realsil.com.cn,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hilda,

> RTL8822CE supports transparent WBS to apply USB alternate setting 1.
> Add a flag to the device match data to apply alternate setting 1 which
> meet the transfer speed for WBS support.
> 
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
> Changes in v2:
> - More descriptive commit log and short description.
> - Use BTUSB_USE_ALT1_FOR_WBS replace BTUSB_WBS_ALT1 for descriptive name.
> - Move alternate setting 1 check into the btusb_probe() function and adjust position of data->isoc for alternate setting check.
> ---
> ---
> drivers/bluetooth/btusb.c | 34 ++++++++++++++++++++--------------
> 1 file changed, 20 insertions(+), 14 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
