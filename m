Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956D4C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 15:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1GtnfVerQm68BPN8aR9wdSdWbKb1AyxSwcy/nzGUR8=; b=VuPFG8vMNi5t3f
	zVnB1fMI+3RylTLdPnmV/HINAX54E5u0uJXReXrjkmcg7XqG8Tfu5ILoEkIrGo4G4R7AzE75yUWIi
	b8MbLhnTPWe80nMt8I7fjLX//2rYVXJ6S3TrmST6/o5GoFUCS0kfhk6L3fqRbTs2/BW6SCnpgODpe
	jBZRTHdniRisBdWgF0bWvAaHwPN9vd99t4DFtyaOVic4i37cEmricmxExWPxWLOMNxNzpNFYfjb2h
	bXkW3iYU7OLAPk4ilNgUAmBBUZqusNd72ikM3+K2RxJZ+MgoQ34Cf8tTMlWla31B9MSxEEAVb8ONL
	SMMYbukS5DDSllvQsmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpu58-0055Ce-CC; Wed, 24 Nov 2021 15:21:10 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpu55-0055CB-Jc
 for linux-mediatek@lists.infradead.org; Wed, 24 Nov 2021 15:21:08 +0000
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
 by mail.holtmann.org (Postfix) with ESMTPSA id ED7DECED24;
 Wed, 24 Nov 2021 16:21:05 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH 3/4] Bluetooth: btmtksdio: fix resume failure
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <8a0a4db81b6aede029701cd4db734aaf9bd37ee7.1637360076.git.objelf@gmail.com>
Date: Wed, 24 Nov 2021 16:21:05 +0100
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
Message-Id: <C3BBFD94-0A2A-4BA1-9892-86CB2956F982@holtmann.org>
References: <4176102d8bbc36e5156e348df666a3e12c5a3d75.1637360076.git.objelf@gmail.com>
 <8a0a4db81b6aede029701cd4db734aaf9bd37ee7.1637360076.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_072107_816298_9EC46E1C 
X-CRM114-Status: GOOD (  13.47  )
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

> btmtksdio have to rely on MMC_PM_KEEP_POWER in pm_flags to avoid that
> SDIO power is being shut off during the device is in suspend. That fixes
> the SDIO command fails to access the bus after the device is resumed.
> 
> Fixes: 7f3c563c575e7 ("Bluetooth: btmtksdio: Add runtime PM support to SDIO based Bluetooth")
> Co-developed-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
> Signed-off-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> drivers/bluetooth/btmtksdio.c | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
> index 4c46c62e4623..cae1fcd15512 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -1040,6 +1040,8 @@ static int btmtksdio_runtime_suspend(struct device *dev)
> 	if (!test_bit(HCI_RUNNING, &bdev->hdev->flags))
> 		return 0;
> 
> +	sdio_set_host_pm_flags(func, MMC_PM_KEEP_POWER);
> +
> 	sdio_claim_host(bdev->func);
> 
> 	sdio_writel(bdev->func, C_FW_OWN_REQ_SET, MTK_REG_CHLPCR, &err);

if this makes sense without 2/4 patch, then please re-send.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
