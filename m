Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEA9C4320E
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 05:39:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B88B0610A8
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 05:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B88B0610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vt8IfqAIrfM4A/Ib7QDs2arZ7rl/fNkJZdPcmivnQYM=; b=b0fdohaMKTIrCv
	WPENzbdfFaMm3Zd8OXdXdL80/fiES34Ui6FZcZdGEVONBlnmCU6YGjRcwvjChhERXaPHeRJxC9eRb
	jHiu6CJBZAXil2LN+KQUv2j096jV2nmkozjSHmob7Tlm7Sae5+of/gThE0k+awqE4mVtDKarLs/Uo
	YBcPuga3e4B/phSQjIc2i6o3uFqu1/JgBWeyLKn96Das1BaQgxpc5gZSeQa3v1P7JyUy7/QWfwmdO
	g8bVem0+teq3t9HESZtg50lFc6Ds19tZgGKjEuCbigw+x++8N2wu3FNz5IK2Eks/MPZfeS4bGNYaf
	1ihft9A/KYfyQjrNx0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLIyT-003v8L-TD; Wed, 01 Sep 2021 05:39:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLIyR-003v86-NY
 for linux-mediatek@bombadil.infradead.org; Wed, 01 Sep 2021 05:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=To:References:Message-Id:
 Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
 Content-Type:Sender:Reply-To:Content-ID:Content-Description;
 bh=/62lZUdUIEDX/hsTd4WszyfnIt7fXgohaInfKpoLciA=; b=RJ/p35mc5pDmPPgY972sVcBFoa
 ItbnnP84pePEL/lea4GXKPSNWry6X75WE8MpUaL6aXMOAurG4lNP9tuduNay6BeXyZqDIcAa3nlVG
 K39jd7GJf64F6WstKguPBR5z+PzrFu82vSsYEUzcP4BnsK1jiYUkGMOKXI/CdZLytUtncPLDQof9T
 ZCuTfthXPZBY6FxYGTZyR5dm/PbL+gPpoLl/am6rSg+3B77d2bw5WMTLwHTepZXH+5rD3S4L4H+L6
 osBBno6R28e4LX18khFMxeDoogBRGgF6erXoiVTnSnHW/gGRLm9ycPxCVadCSgpkn5vbViYwK78Lf
 ZS1KgsAg==;
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLIxT-001upm-LR
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 05:39:08 +0000
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
 by mail.holtmann.org (Postfix) with ESMTPSA id 2C1BFCECED;
 Wed,  1 Sep 2021 07:38:25 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v2 1/2] Bluetooth: btusb: Support public address
 configuration for MediaTek Chip.
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210901033226.20693-1-mark-yw.chen@mediatek.com>
Date: Wed, 1 Sep 2021 07:38:24 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>, chris.lu@mediatek.com,
 "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>,
 Michael Sun <michaelfsun@google.com>, mcchou@chromium.org
Message-Id: <3878646A-57BA-47A3-B7C8-884B5AE3DF34@holtmann.org>
References: <20210901033226.20693-1-mark-yw.chen@mediatek.com>
To: =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?=
 <Mark-YW.Chen@mediatek.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_063853_916160_AB05EF50 
X-CRM114-Status: UNSURE (   8.73  )
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

> The MediaTek chip support vendor specific HCI command(0xfc1a) to
> change the public address. Add hdev->set_bdaddr handler for MediaTek
> Chip. After doing a power cycle or MediaTek Bluetooth reset, BD_ADDR
> will bring back the original one.
> 
> Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
> ---
> drivers/bluetooth/btusb.c | 18 ++++++++++++++++++
> 1 file changed, 18 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
