Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A04EC432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 05:39:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ED136108E
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 05:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2ED136108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hn184aCMqifT6sDz6rebC3I97vCDrBxL67APk4JTv7U=; b=ivPPW2+Suxvn+i
	SEf+Rtz7yA+KR5FOk81sQ0A+4sjJdyCVbs4TdY0tALKTtqQ46xX51LDAHCAiKZGS1IEdzM5nU6Ax1
	ze/6j8Km7FXC7BoVSfXojDfaE1useF271eJ6YenoZwEz/BLt0Qw/IdISaZqW00vGqzdTjimoz4Dix
	nIbUvczrLkpEXi52LfAZEIRepGQuDtpvobjbeDQIG6tlI4cvMfm7ogNlZLIjbPmp0xW0GNY4HXagc
	tYvlBsA27QKwTQ8YI88iQwFnkf4xmx1Gzh+6pf4L+BgYxUsxYxioqHBNWuEJi0R+DjU8nbkYeulz2
	IP6aE6avZGF32ChJm7zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLIxj-003v3O-2m; Wed, 01 Sep 2021 05:39:03 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLIxf-003v2M-Nl
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 05:39:02 +0000
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
 by mail.holtmann.org (Postfix) with ESMTPSA id B39F9CECEE;
 Wed,  1 Sep 2021 07:38:54 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2 2/2] Bluetooth: btusb: Add protocol for MediaTek
 bluetooth devices(MT7922)
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210901033226.20693-2-mark-yw.chen@mediatek.com>
Date: Wed, 1 Sep 2021 07:38:54 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>, chris.lu@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, michaelfsun@google.com, mcchou@chromium.org
Message-Id: <B3203CDE-D56D-437A-9A4E-262EA871F1D3@holtmann.org>
References: <20210901033226.20693-1-mark-yw.chen@mediatek.com>
 <20210901033226.20693-2-mark-yw.chen@mediatek.com>
To: =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?=
 <Mark-YW.Chen@mediatek.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_223859_971771_327263B8 
X-CRM114-Status: UNSURE (   9.94  )
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

> The information in /sys/kernel/debug/usb/devices about the MT7922U
> Bluetooth device is listed as the below.
> 
> T: Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 18 Spd=480 MxCh= 0
> D: Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs= 1
> P: Vendor=0e8d ProdID=7922 Rev= 1.00
> S: Manufacturer=MediaTek Inc.
> S: Product=Wireless_Device
> S: SerialNumber=000000000
> C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
> A: FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
> I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E: Ad=81(I) Atr=03(Int.) MxPS= 16 Ivl=125us
> E: Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E: Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E: Ad=83(I) Atr=01(Isoc) MxPS= 0 Ivl=1ms
> E: Ad=03(O) Atr=01(Isoc) MxPS= 0 Ivl=1ms
> I: If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E: Ad=83(I) Atr=01(Isoc) MxPS= 9 Ivl=1ms
> E: Ad=03(O) Atr=01(Isoc) MxPS= 9 Ivl=1ms
> I: If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E: Ad=83(I) Atr=01(Isoc) MxPS= 17 Ivl=1ms
> E: Ad=03(O) Atr=01(Isoc) MxPS= 17 Ivl=1ms
> I: If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E: Ad=83(I) Atr=01(Isoc) MxPS= 25 Ivl=1ms
> E: Ad=03(O) Atr=01(Isoc) MxPS= 25 Ivl=1ms
> I: If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E: Ad=83(I) Atr=01(Isoc) MxPS= 33 Ivl=1ms
> E: Ad=03(O) Atr=01(Isoc) MxPS= 33 Ivl=1ms
> I: If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E: Ad=83(I) Atr=01(Isoc) MxPS= 49 Ivl=1ms
> E: Ad=03(O) Atr=01(Isoc) MxPS= 49 Ivl=1ms
> I: If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
> E: Ad=83(I) Atr=01(Isoc) MxPS= 63 Ivl=1ms
> E: Ad=03(O) Atr=01(Isoc) MxPS= 63 Ivl=1ms
> I:* If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
> E: Ad=8a(I) Atr=03(Int.) MxPS= 64 Ivl=125us
> E: Ad=0a(O) Atr=03(Int.) MxPS= 64 Ivl=125us
> I: If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
> E: Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
> E: Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us
> 
> Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
> ---
> drivers/bluetooth/btusb.c | 1 +
> 1 file changed, 1 insertion(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
