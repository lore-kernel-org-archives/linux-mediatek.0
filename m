Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B3BC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Jan 2022 19:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4J5jlnc9s9jCONmY/Hgmg18sWx+30oPSOu9/z0Qt4EA=; b=SSxVFnn5Ll2KZe
	+UU4g3nh+RbryWdSp/9HwzZHwyT1hQ/7fxN7lpixvRxfy3kEmnrDO6gAhMUU1TgPYkcZC7LeVe2U2
	5XB+lIXwfUqgPfm1tySl3SGxEooNnxNxklIWPioaR//LK5z9C0viGyWNWF7/ZAKa9BoK/yRiV3q85
	VlYVxZDMnjq2auBaVFs8iQp0oJDCaHpqMepVyN+keKxxHTEIgcQm0xp5q8IDM50YIWVHmUnKuul70
	LpZQiIf+zGWn7RqCZ7XgOCCcFbBkuzc82/IsesE89FSHh3kNNcVeNWFvzHZIvTrBYg/Wkhbnwyf5Z
	D+Oxop9V6X0KwLQ9Sidw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6dzq-008JGp-57; Sun, 09 Jan 2022 19:36:54 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6dzm-008JFs-Ne
 for linux-mediatek@lists.infradead.org; Sun, 09 Jan 2022 19:36:52 +0000
Received: from smtpclient.apple (p4fefca45.dip0.t-ipconnect.de [79.239.202.69])
 by mail.holtmann.org (Postfix) with ESMTPSA id 31AC5CED27;
 Sun,  9 Jan 2022 20:36:44 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH v5 1/5] Bluetooth: btmtksdio: rename btsdio_mtk_reg_read
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <a22b710e69551c3503203f73ea898504cb634815.1641755121.git.objelf@gmail.com>
Date: Sun, 9 Jan 2022 20:36:43 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?= <Mark-YW.Chen@mediatek.com>, 
 Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, jemele@google.com,
 abhishekpandit@google.com, Michael Sun <michaelfsun@google.com>,
 Miao-chen Chou <mcchou@chromium.org>, shawnku@google.com,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <39A8FEA2-D5AA-4D3D-9A14-E9EC187D300A@holtmann.org>
References: <a22b710e69551c3503203f73ea898504cb634815.1641755121.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_113650_973169_F1A9D570 
X-CRM114-Status: UNSURE (   9.24  )
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

Hi Sean,

> Using "btmtksdio" as the prefix instead of "btsdio"
> 
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> v5: new created to make the series better
> ---
> drivers/bluetooth/btmtksdio.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)

all 5 patches have been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
