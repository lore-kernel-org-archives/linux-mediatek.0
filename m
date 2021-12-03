Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFADC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 21:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=85CXycS+wUfZPiEyODpAgkVADspyjWlmGFlBjm6PMMk=; b=TcYzKf2K4CKrGX
	FtQm4gBCpUiNZSm+7RYkgdBJ7Pozq8T9zxKzaJrfGUjBabsKvimpjRlLiRiFJ1pDmp8AkiHQYFf/M
	y6nUGlHpLJRk0WeI1pygAHt+AYrZ6dAibxLIOtTifa3UFsrNR0SRvqRT6Zf1XH3Xzq56jHJ88OySW
	BIBLEakp8+WymZOtGMaB7LmoEVdpuJAmR4yZ7xFRgWQ1OEpP4VKTUyeVwf1n5s+G/JxnSRBJaCQY6
	tQTkm3em8AGr20caoMVTdUaUnIEkLNPFMQow9FczlEBP9AISG7UyjF2TGS9Q0fx3xkg4/0AMsaL8T
	LiDwWF13rpy184oq49YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtFn2-00H1zi-AL; Fri, 03 Dec 2021 21:08:20 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtFmx-00H1yF-2X
 for linux-mediatek@lists.infradead.org; Fri, 03 Dec 2021 21:08:16 +0000
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
 by mail.holtmann.org (Postfix) with ESMTPSA id A7971CED20;
 Fri,  3 Dec 2021 22:08:08 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v2 2/2] Bluetooth: btmtksdio: fix resume failure
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <7da7852d8fc936c97a0fe4cd00c723e42b889c84.1638381385.git.objelf@gmail.com>
Date: Fri, 3 Dec 2021 22:08:07 +0100
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
Message-Id: <41B08D65-864D-4D02-89D3-147298E86B1D@holtmann.org>
References: <73960845c299e2cd22c11b84014ff6ba4758e9bb.1638381385.git.objelf@gmail.com>
 <7da7852d8fc936c97a0fe4cd00c723e42b889c84.1638381385.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_130815_291751_C71CD99B 
X-CRM114-Status: GOOD (  10.35  )
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
> v2: rebase and resend
> ---
> drivers/bluetooth/btmtksdio.c | 2 ++
> 1 file changed, 2 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
