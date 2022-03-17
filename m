Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E30EC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 11:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3AG0SqyMpOdF7sPhfhe4ffU2FDG2oEx1Nmany3y9Ds=; b=mUKKcvSDE53E41
	CeGE25fGTe8skhyFE2QfGnXlfaXy6qhw5G4EmJO000IOoMZtnss4SPfr1RZEOdGE1GfP36TaffA68
	qF6aF/vh4EqnEHfy2pfCMjNjBTCsLsFtRTn7ZGVdw0YMwQeqEZT4VVKmHY//IsHfHEQQyIcC4aPgb
	5iubOseXfhgFyuWQbBFz4CLOut1fVjjb8Ji/shk1K06hnwiuGENiHjOFmTQmbpyZLLCrgcJDFuI9I
	CX0ulenUSy7TOW6undoWL5yR5qTvOxPQslGpb5nFvEVs+xl8RV2XRFmAtl/9+0STHNzbvDLBEXU7/
	SljHgKo5Z64Zek4BnghA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUo3W-00FnAb-NE; Thu, 17 Mar 2022 11:12:34 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUo3T-00Fn9K-Sa
 for linux-mediatek@lists.infradead.org; Thu, 17 Mar 2022 11:12:33 +0000
Received: from smtpclient.apple (p5b3d2183.dip0.t-ipconnect.de [91.61.33.131])
 by mail.holtmann.org (Postfix) with ESMTPSA id 63425CED0B;
 Thu, 17 Mar 2022 12:12:25 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] Bluetooth: btmtkuart: fix error handling in
 mtk_hci_wmt_sync()
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20220317075740.GE25237@kili>
Date: Thu, 17 Mar 2022 12:12:24 +0100
Cc: Sean Wang <sean.wang@mediatek.com>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 BlueZ <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Message-Id: <E34E4BB0-C5DA-48A3-82DD-0F1788366E88@holtmann.org>
References: <20220317075740.GE25237@kili>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_041232_075753_5E35ECEB 
X-CRM114-Status: UNSURE (   9.97  )
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

Hi Dan,

> This code has an uninitialized variable warning:
> 
>    drivers/bluetooth/btmtkuart.c:184 mtk_hci_wmt_sync()
>    error: uninitialized symbol 'wc'.
> 
> But it also has error paths which have memory leaks.
> 
> Fixes: 8f550f55b155 ("Bluetooth: btmtkuart: rely on BT_MTK module")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> drivers/bluetooth/btmtkuart.c | 12 +++++++-----
> 1 file changed, 7 insertions(+), 5 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
