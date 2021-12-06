Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4163C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 19:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nWdLtJkBO9VxN9lfl69+l1yGUEecOrmwQM7NoWqGRU=; b=RGoMIYf6ts9yK7
	obktiTNpgky3yBuBn9nylL6FbUCGrwyzEWXOZX0kPRDnkq+tsZeelWMRDhBiLcqNdlg2d5F8PXVwu
	nRRI5Tu4Mf2DsuhugmbuW2gWhMcWoez7Lu9khrzKLCKmgKk/GxeNur18YkFDQpaeR56FWxe37eC10
	5tKBgr8xMYLzPVhsRVIWrmB7RfrNdz84WAyLPlvPEXEXQOpgdwWAbBJd83IJtFnNDRwN2nViqbkAd
	KsZ1WHJ8vasYYrHMSIIUVJjUdgrGHN7bTSArVq44xJO+M3esEltOwqta9/5c55M6roMCCFfgNLdhy
	aHxAYC6EWRxeU5Y550mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muJqa-005WRI-CE; Mon, 06 Dec 2021 19:40:24 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muJqV-005WQB-8T
 for linux-mediatek@lists.infradead.org; Mon, 06 Dec 2021 19:40:22 +0000
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
 by mail.holtmann.org (Postfix) with ESMTPSA id CA96ACECF9;
 Mon,  6 Dec 2021 20:40:08 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v3 1/2] Bluetooth: btusb: Handle download_firmware failure
 cases
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20211206173343.31380-1-mark-yw.chen@mediatek.com>
Date: Mon, 6 Dec 2021 20:40:08 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, aaron.hou@mediatek.com,
 kaichuan.hsieh@canonical.com, Paul Menzel <pmenzel@molgen.mpg.de>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <AC2E4193-8F59-4F9D-85E6-382E2354D95C@holtmann.org>
References: <20211206173343.31380-1-mark-yw.chen@mediatek.com>
To: mark-yw.chen@mediatek.com
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_114019_493344_D2DD5C31 
X-CRM114-Status: UNSURE (   9.02  )
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

> For Mediatek chipset, it can not enabled if there are something wrong
> in btmtk_setup_firmware_79xx(). Thus, the process must be terminated
> and returned error code.
> 
> Fixes: fc342c4dc4087 ("Bluetooth: btusb: Add protocol support for MediaTek MT7921U USB devices")
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
> ---
> drivers/bluetooth/btusb.c | 4 ++++
> 1 file changed, 4 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
