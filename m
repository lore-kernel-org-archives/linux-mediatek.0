Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B992C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 14:49:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE84660E96
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 14:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE84660E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RcaYQ58bvWVoVAuO/88Dgvl21YyR/RaW1h8RaWuee0k=; b=N1STj2t7m1HHw7
	RSpWmtluOrRKg37BwUjqlS+3ootP/ja2bks9JVOWv6lJE/JIVI0+S2GfJUwGRP/Zh6Z19oejANKe+
	g30gF5mbUR87AnNMYDHxf39YD8T+SOCQaxlEK10R1jzH51COt2ZC5rHE1woqluN93YxnRz+fzLnib
	YcuF7vAlwWkCsDCyaPAmtcoHR+jc/2ZN0sg1MY24glynbO8hQaWV3DRzG/38Y/DEs329mgDXaLVgO
	L2hWkzt01vecK9kchhMh8cHxi+6dy3al9ZDZ3Us0ndMbE9Yn4oGsVgvFF/+NZFECZwk8wucGbO+/x
	XSTf8RFyMH8bhsku90UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBICe-006VAD-N2; Wed, 04 Aug 2021 14:49:04 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBICY-006V91-Hs
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 14:49:02 +0000
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
 by mail.holtmann.org (Postfix) with ESMTPSA id 80392CECD6;
 Wed,  4 Aug 2021 16:48:50 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v5 1/2] Bluetooth: btusb: Record debug log for Mediatek
 Chip.
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210804090316.12080-1-mark-yw.chen@mediatek.com>
Date: Wed, 4 Aug 2021 16:48:50 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>, chris.lu@mediatek.com,
 will-cy.lee@mediatek.com, Sean Wang <sean.wang@mediatek.com>,
 BlueZ <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>,
 Michael Sun <michaelfsun@google.com>, shawnku@google.com,
 jemele@google.com, apusaka@google.com, mcchou@chromium.org
Message-Id: <8988B918-95FD-42DE-95FA-3BAC4A144165@holtmann.org>
References: <20210804090316.12080-1-mark-yw.chen@mediatek.com>
To: =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?=
 <Mark-YW.Chen@mediatek.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_074858_792915_E8C46FA1 
X-CRM114-Status: GOOD (  16.38  )
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

> Mediatek Bluetooth controller sends the FW log and FW dump via EP2.
> This patch creates an MTK specified callback(btusb_recv_acl_mtk) to
> replace the original one (hci_recv_frame) when an MTK controller is
> detected. The new callback will separate the firmware dump traffics
> from the ACL data to have them process separately.
> 
> 1. Add a new field (recv_acl) to the btusb_data struct to store
> vendor-specific ACL callback handler.
> 2. Add the MTK-specific ACL callback handler (btusb_recv_acl_mtk) to
> process ACL data, debug log, and firmware dump.
> 3. The debug log traces LMP/LL events and connection quality reports.
> 4. The upper layer can use hci_channel_monitor to receive these
> packets.
> 
> Example btmon: firmware debug log.
> 1. Enable firmware debug log.
> < HCI Command: Vendor (0x3f|0x005d) plen 4
>        00 00 02 02                                      ....
>> HCI Event: Command Complete (0x0e) plen 8
>      Vendor (0x3f|0x005d) ncmd 1
>        Status: Success (0x00)
>        00 00 02 02                                      ....
> 2. Diagnostic packet from controller
> = Vendor Diagnostic (len 500)
>          ff 05 f0 01 fd ff 02 0e 08 01 5d fc 00 00 00 02
>          02 aa aa aa cb e3 f0 15 b0 0c 5f 01 00 d1 0f 33
>          01 7f 00 08 57 61 0c 00 00 00 00 00 23 37 17 00
>          fd ff 00 00 29 60 ff ff b1 56 e8 00 57 40 0a 40
>          39 95 f2 00 47 40 43 00 fc f0 16 00 57 61 0c 00
>          00 00 00 00 23 37 17 00 fd ff 00 00 29 60 ff ff
>          65 95 f2 00 57 40 0a 40 ec d3 fc 00 47 40 3b 00
>          2c f1 17 00 57 61 0c 00 00 00 00 00 23 37 17 00
>          fd ff 00 00 29 60 ff ff 19 d4 fc 00 57 40 76 1c
>          b2 61 01 01 47 40 b3 04 0b 63 18 00 fe ff 02 01
>          04 05 33 8b 9e 08 00 aa aa aa aa aa 27 38 01 02
>          01 00 00 00 02 e0 10 00 20 00 20 00 2a 08 40 00
>          20 00 20 08 2a 08 02 00 40 00 00 01 2e 08 40 00
>          01 67 b0 c2 2e 08 3e 07 ff ff ff ff 40 08 01 00
>          02 00 00 00 34 08 a3 00 00 00 00 00 34 08 a3 00
>          00 00 00 00 35 08 45 01 00 00 00 00 2e 08 40 00
>          01 67 b0 c2 30 35 01 02 00 00 00 00 2c 31 01 00
>          02 00 00 40 2d 19 03 00 00 40 00 00 fd ff 02 0f
>          04 00 01 01 04 aa aa aa aa aa aa aa 57 61 0c 00
>          00 00 00 00 23 46 32 00 01 00 00 00 2f 35 00 02
>          00 00 00 00 29 35 ff 02 00 22 00 00 2d 31 a6 02
>          02 00 00 00 31 6c 40 00 14 63 18 1b 31 6c 40 00
>          14 63 18 23 51 08 53 00 12 63 18 00 2c 35 12 01
>          fe 00 00 00 2b 35 fe 02 02 00 00 00 2f 31 21 00
>          00 00 02 00 75 61 01 00 4c 1b 93 00 79 61 01 00
>          00 00 00 00 12 e3 63 18 20 31 86 01 74 61 68 03
>          00 00 04 00 a1 73 ff 00 b9 01 00 00 a1 73 04 00
>          00 00 00 00 a1 73 00 00 00 00 00 00 a1 73 00 00
>          02 00 00 00 31 6c 40 00 16 63 18 0c 31 6c 40 00
>          16 63 18 1c 77 61 40 00 48 33 40 00 14 e3 63 18
>          40 31 86 01 00 d1 02 c5 07 23 a1 34 73 61 37 02
>          02 00 00 a1
> 
> Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
> Reviewed-by: Michael Sun <michaelfsun@google.com>
> Reviewed-by: Archie Pusaka <apusaka@chromium.org>
> ---
> drivers/bluetooth/btusb.c | 25 ++++++++++++++++++++++++-
> 1 file changed, 24 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
