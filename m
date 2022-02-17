Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1F4C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 13:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJtaSC+zmWnWDhmBYmFnmW39TOfPFyzklGJ0i6kZaaQ=; b=yFUMTAlJW8a1U5
	+74xw3MpAz5oZKG950JYaoI26JI2/TECoTixCYjjMqYzyzHDIY57kWASUtiuKWDtn+gRQnFFi7ktZ
	yucrppoUyipYY4wkMbmjBoFVl0U46SNCSGWcMF8iUBaw0TP18dKrUuVmQnhpbTP4GdIzhySvvZL3x
	52ed1AEfgFauyzhs9/MXkOrptEKnzyk6VMnE4wid402jky3qKpQ1B3FHtGBWU/8YTo4O2LRVFxzAn
	AugirIfZekE5/QAIx2DflwnGLk/0k4Pnf3dHEocUf3LPgpn1AstXeDw6lri53NZZDBLxKrVWgbbDb
	pVI7eRo5DnTdOeNWcarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKgVo-00AX71-2c; Thu, 17 Feb 2022 13:07:56 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKgVk-00AX53-Sb
 for linux-mediatek@lists.infradead.org; Thu, 17 Feb 2022 13:07:54 +0000
Received: from smtpclient.apple (p4fefcd07.dip0.t-ipconnect.de [79.239.205.7])
 by mail.holtmann.org (Postfix) with ESMTPSA id A1828CECDE;
 Thu, 17 Feb 2022 14:07:51 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH v2 1/2] Bluetooth: mt7921s: support bluetooth reset
 mechanism
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <d328920a9abaaaedafc8c4922cdeb5935f6d64c3.1644342794.git.objelf@gmail.com>
Date: Thu, 17 Feb 2022 14:07:51 +0100
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
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chih-Ying Chiang <chih-yin.chiang@mediatek.com>
Message-Id: <EEA04207-812F-48F2-A2EC-2D6DD990F5D7@holtmann.org>
References: <d328920a9abaaaedafc8c4922cdeb5935f6d64c3.1644342794.git.objelf@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_050753_103673_BFB4DCE3 
X-CRM114-Status: UNSURE (   9.28  )
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

> Implement .cmd_timeout to reset the MT7921s device via a dedicated GPIO
> pin when the firmware hang or the command has no response.
> 
> Co-developed-by: Mark Chen <mark-yw.chen@mediatek.com>
> Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Chih-Ying Chiang <chih-yin.chiang@mediatek.com>
> ---
> v2: no change
> ---
> drivers/bluetooth/btmtk.h     |   6 ++
> drivers/bluetooth/btmtksdio.c | 113 +++++++++++++++++++++++++++++++++-
> 2 files changed, 118 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
