Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88106C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:12:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B88F60E76
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B88F60E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Nbve3jquwZwf/DhGV75IQuSVV/riisByqGsQf83P/Q=; b=vAZWaEezzTXiSw
	8JEfh9UITWP5Tey63+QW9Rt19pOJiH+PUkFglGuvYocYCTf/C1tV7gewhNDlM0r0iZH4r7zg4DV4s
	sksPQIYcmHv0M6EYKKel2CdSlqUiW6J/lqlQeHJ5AhVSuSNuUQDlflH0SW9nY/yLndYR43ukH9Ajy
	LHnYqDu59THJ0WgS8Z32vPvGwPyyq8tgwWCx0EWvf+j29xR+cJouyM3jgAkFCjIuuEQv18FvZQcm2
	K8mwEFueAGY5LqEBo722gqrdNh2eKYYYj6w7jDzbqkTGSqLJKC+hE2zdvxAcQHk3GvJ3zufteL7F8
	IazA3QRLv40PwpLveNpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGjiK-008kHF-Ij; Thu, 19 Aug 2021 15:12:16 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGji5-008kBK-6K; Thu, 19 Aug 2021 15:12:02 +0000
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
 by mail.holtmann.org (Postfix) with ESMTPSA id ABA47CED16;
 Thu, 19 Aug 2021 17:11:50 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v3] Bluetooth: btusb: Remove WAKEUP_DISABLE and add 
 WAKEUP_AUTOSUSPEND for Realtek devices
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210817030312.27755-1-max.chou@realtek.com>
Date: Thu, 19 Aug 2021 17:11:50 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, matthias.bgg@gmail.com,
 "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alex Lu <alex_lu@realsil.com.cn>, Hilda Wu <hildawu@realtek.com>,
 kidman@realtek.com, Archie Pusaka <apusaka@chromium.org>,
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 josephsih@chromium.org
Message-Id: <F4EB3AD0-2ADF-44C4-83A1-F37F98530B1B@holtmann.org>
References: <20210817030312.27755-1-max.chou@realtek.com>
To: Max Chou <max.chou@realtek.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_081201_428025_496B163C 
X-CRM114-Status: GOOD (  15.65  )
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

Hi Max,

> For the commit of 9e45524a011107a73bc2cdde8370c61e82e93a4d, wakeup is
> always disabled for Realtek devices. However, there's the capability
> for Realtek devices to apply USB wakeup.
> 
> In this commit, remove WAKEUP_DISABLE feature for Realtek devices.
> If users would switch wakeup, they should access
> "/sys/bus/usb/.../power/wakeup"
> 
> In this commit, it also adds the feature as WAKEUP_AUTOSUSPEND
> for Realtek devices because it should set do_remote_wakeup on autosuspend.
> 
> Signed-off-by: Max Chou <max.chou@realtek.com>
> Tested-by: Hilda Wu <hildawu@realtek.com>
> Reviewed-by: Archie Pusaka <apusaka@chromium.org>
> Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> Changes in v2:
> -fix the compiling error due to the incorrect patch file submited
> 
> Changes in v3:
> -do rebase and make the patch on the latest revision
> ---
> drivers/bluetooth/btusb.c | 28 +++++++++-------------------
> 1 file changed, 9 insertions(+), 19 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
