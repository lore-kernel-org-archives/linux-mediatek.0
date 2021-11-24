Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840FDC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 14:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kk4ZW8F5avPiVmvo8yoKfeoB9z6vxyHsYtvrAUE0dSk=; b=GIYUuKliMhxsXS
	ePXIz+3/vzEtmTWrtUDpQB5s5xMY4bFc2V7f28hocJzyctGNDA+Ej+AREQx4Bk8pUkaEmMht1cNOW
	lNBN7YlcHp74DYaAwtLMt92n+uQ2UfW/LnoZVJMbGZhm7ioGrw89jn/2CittRE1eaVlP1KDI5cpw3
	v1JfyjJ9Rk4EV/yIpoFZ5PMonovsrdAcyk6YJG/MlIqoRud6q3wQWiwkR+df1fOgAcMP44qznfh11
	BmRf1GT3pwACpBVxZWdSezYlZ7ioQ7AB5bnsjzMy9Nkn9rVDaeC4brtAWxecZYPYBYo+kRc/aHnTh
	yYy2VgUPDaNnt9gWuy6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpteS-0053AW-VP; Wed, 24 Nov 2021 14:53:36 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpteN-005380-QI
 for linux-mediatek@lists.infradead.org; Wed, 24 Nov 2021 14:53:35 +0000
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
 by mail.holtmann.org (Postfix) with ESMTPSA id 9C0A8CED24;
 Wed, 24 Nov 2021 15:53:23 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH 2/4] Bluetooth: btmtksdio: handle runtime pm only when
 sdio_func is available
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <07cd9db8ef295bfe3e6b42796ccb8c9fb59dd9ba.1637360076.git.objelf@gmail.com>
Date: Wed, 24 Nov 2021 15:53:23 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?= <Mark-YW.Chen@mediatek.com>, 
 Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, jemele@google.com,
 abhishekpandit@google.com, michaelfsun@google.com, mcchou@chromium.org,
 shawnku@google.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <74A2D0D6-6A65-4832-BAFC-BCBA68F8DE78@holtmann.org>
References: <4176102d8bbc36e5156e348df666a3e12c5a3d75.1637360076.git.objelf@gmail.com>
 <07cd9db8ef295bfe3e6b42796ccb8c9fb59dd9ba.1637360076.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_065332_039571_FEF1B17A 
X-CRM114-Status: GOOD (  16.54  )
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

Hi Sean,

> Runtime pm ops is not aware the sdio_func status that is probably
> being disabled by btmtksdio_close. Thus, we are only able to access the
> sdio_func for the runtime pm operations only when the sdio_func is
> available.
> 
> Fixes: 7f3c563c575e7 ("Bluetooth: btmtksdio: Add runtime PM support to SDIO based Bluetooth")
> Co-developed-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
> Signed-off-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> drivers/bluetooth/btmtksdio.c | 6 ++++++
> 1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
> index 4f3412ad8fca..4c46c62e4623 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -1037,6 +1037,9 @@ static int btmtksdio_runtime_suspend(struct device *dev)
> 	if (!bdev)
> 		return 0;
> 
> +	if (!test_bit(HCI_RUNNING, &bdev->hdev->flags))
> +		return 0;
> +
> 	sdio_claim_host(bdev->func);
> 
> 	sdio_writel(bdev->func, C_FW_OWN_REQ_SET, MTK_REG_CHLPCR, &err);
> @@ -1064,6 +1067,9 @@ static int btmtksdio_runtime_resume(struct device *dev)
> 	if (!bdev)
> 		return 0;
> 
> +	if (!test_bit(HCI_RUNNING, &bdev->hdev->flags))
> +		return 0;
> +
> 	sdio_claim_host(bdev->func);
> 
> 	sdio_writel(bdev->func, C_FW_OWN_REQ_CLR, MTK_REG_CHLPCR, &err);

I dislike looking at HCI_RUNNING since that check should be removed from a driver. Do you really need it? I mean, a driver should now if it is running or not.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
