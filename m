Return-Path: <SRS0=6VVk=OM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099C7C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 14:20:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C664360F56
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 14:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C664360F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pePIwQWXl3PXMdn5jJ/DStGDIdea8gjVKEzMetZ2fYs=; b=sYG4I85GtdEOJ6
	r9FXeU3HFvBWabuqKFSVdntjW+zBsxxKW29WD4ZG0O1MHlWsTEVN7jEvkEddLgUaivG1ln5tNwCay
	8CLDPa/40RN8Ubtuwdndix5xlRmWxCxwD83h+GVZBO0S3J+uPsVUuCUHANRTjE9kEIpGvFKBrHmqr
	PobkUdID++W2p3dMyt7dF4oFJlhC9Mx1yove+z4hzEsq5Xekwj5qIkPJUffDmvYC4Q85MrSSO6jK6
	HvmT3a4f1aOkzQJ0wZK/TFJK7ad778EjNgOmL8nexWZctT3TTlLORMdtEsBGGexIAiJTjEJyvMVQ1
	r3S6J9hmgi82+slnL/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mT36F-008ngr-DO; Wed, 22 Sep 2021 14:19:51 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mT33J-008msg-TX; Wed, 22 Sep 2021 14:16:51 +0000
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
 by mail.holtmann.org (Postfix) with ESMTPSA id 81392CED34;
 Wed, 22 Sep 2021 16:16:44 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] Bluetooth: btmtkuart: fix a memleak in mtk_hci_wmt_sync
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210922134945.27503-1-dinghao.liu@zju.edu.cn>
Date: Wed, 22 Sep 2021 16:16:44 +0200
Cc: Sean Wang <sean.wang@mediatek.com>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <88B71D9F-DA0D-46A7-AC42-C9A5E5B95C7B@holtmann.org>
References: <20210922134945.27503-1-dinghao.liu@zju.edu.cn>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_071650_177996_7BC324F8 
X-CRM114-Status: GOOD (  10.62  )
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

Hi Dinghao,

> bdev->evt_skb will get freed in the normal path and one error path
> of mtk_hci_wmt_sync, while the other error paths do not free it,
> which may cause a memleak. This bug is suggested by a static analysis
> tool, please advise.
> 
> Fixes: e0b67035a90b ("Bluetooth: mediatek: update the common setup between MT7622 and other devices")
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
> drivers/bluetooth/btmtkuart.c | 13 ++++++++-----
> 1 file changed, 8 insertions(+), 5 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
