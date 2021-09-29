Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF6AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 10:00:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51547613A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 10:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51547613A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZorO34x/Pnm0eH6BuNVaJm0sXfgOlsO/IDzQZCzczA=; b=zSsHlW6n9Mjow2
	2ME2mStM9n6Z80E3LI3oBHy/Ghulb2X3egzxYdxejSAO0aBuiHNRHigWe+1dWfuKCH4jtfiHGSi+q
	dNMZkXE/qu2gPdhbl9QBpsFU6Q0Ck7TKHFWKL4xmkdVaD3UVzVa2CQnobfgC2NQiGrGUFWTl3XRDq
	KEwb5gwuKQ0yZeJmvXP8ssEgfVdX89nkmhJ5+AiRa1nb2JhS45c8a/5OweZh21p6mbzqxN6AQRcXj
	EH/RDoJ8kSMHYv67jKeyd65PCZ7H+TInRzBMPWEsRINJ6AJOviK0HAcu4xgARUASkapDvbeIZost9
	7513tfRFktPp3kjbrP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVWNX-00Aeum-Tv; Wed, 29 Sep 2021 09:59:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVWNU-00Aetp-IY; Wed, 29 Sep 2021 09:59:53 +0000
X-UUID: 51f8a5f5675c401eac1836228ce644dc-20210929
X-UUID: 51f8a5f5675c401eac1836228ce644dc-20210929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-ch.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1010447077; Wed, 29 Sep 2021 02:59:48 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Sep 2021 02:52:38 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 29 Sep 2021 17:52:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Sep 2021 17:52:37 +0800
Message-ID: <4c2ad5e4a9747c59a55d92a8fa0c95df5821188f.camel@mediatek.com>
Subject: Re: [PATCH] r8152: stop submitting rx for -EPROTO
From: Jason-ch Chen <jason-ch.chen@mediatek.com>
To: Hayes Wang <hayeswang@realtek.com>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 "Project_Global_Chrome_Upstream_Group@mediatek.com"
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "hsinyi@google.com"
 <hsinyi@google.com>, nic_swsd <nic_swsd@realtek.com>
Date: Wed, 29 Sep 2021 17:52:37 +0800
In-Reply-To: <cbd1591fc03f480c9f08cc55585e2e35@realtek.com>
References: <20210929051812.3107-1-jason-ch.chen@mediatek.com>
 <cbd1591fc03f480c9f08cc55585e2e35@realtek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_025952_649033_981068A7 
X-CRM114-Status: GOOD (  18.77  )
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

On Wed, 2021-09-29 at 08:14 +0000, Hayes Wang wrote:
> Jason-ch Chen <jason-ch.chen@mediatek.com>
> > Sent: Wednesday, September 29, 2021 1:18 PM
> 
> [...]
> > When unplugging RTL8152 Fast Ethernet Adapter which is plugged
> > into an USB HUB, the driver would get -EPROTO for bulk transfer.
> > There is a high probability to get the soft/hard lockup
> > information if the driver continues to submit Rx before the HUB
> > completes the detection of all hub ports and issue the
> > disconnect event.
> 
> I don't think it is a good idea.
> For the other situations which return the same error code, you would
> stop the rx, too.
> However, the rx may re-work after being resubmitted for the other
> cases.
> 
> Best Regards,
> Hayes
> 
Hi Hayes,

Sometimes Rx submits rapidly and the USB kernel driver of opensource
cannot receive any disconnect event due to CPU heavy loading, which
finally causes a system crash.
Do you have any suggestions to modify the r8152 driver to prevent this
situation happened?

Regards,
Jason


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
