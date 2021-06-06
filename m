Return-Path: <SRS0=RWvT=LA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8ADBC47096
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Jun 2021 14:34:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8335361168
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Jun 2021 14:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8335361168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FmhnxHUEM4wkbqVmWmT0nv4zAWZT3WTIB9YuKlWdSQ=; b=Pm5a5RneW4KOqs
	cG8IH6cLV0gscWwx0PrupA8zx0wMTlzsj62xsC56Ccuy5+QE6Tpdsc/Dn5XzS/Fb/EAuj36mqx2uu
	k+PTmu+KMNPBz5UHpUfn/W+A9kGowulgIC2QHt5G8Qv2onzY1rIv5RumUph8dZd1YCyoxIkUJi77m
	woLBwraCY7QS9rBXDCRPZVesIH0wNhkHrjXvD9ZNkfbOAmB7uS7ZGi1VmC8WndCFoMHOXtp+2Wm/6
	Udb+tsvpXFtTvjnwVowZjbvyAS5vjdVx2uuMv1Cp6n/gfwMSowj/othHVrmDB5Ajc88gUbHO6mQg5
	oAJc5bHim5KWGt1KH+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lptr3-000QaD-6W; Sun, 06 Jun 2021 14:34:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lptqz-000QZY-T6
 for linux-mediatek@lists.infradead.org; Sun, 06 Jun 2021 14:34:20 +0000
X-UUID: 42069e9b3cb44bcfb92e07fa2ce100b9-20210606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eENGFJ4+SpkiY3jmLOHzRg31PNVL6t535kEL01+n4+I=; 
 b=nL8w/HZJ5C78MTCBD5pw7eiPMw2x5MrlgAaAy+NbnXQOuBh1WLO+hvuyVlxn6NKSrI0p9gquXcvfj4IXsM0kP4q+5Ipc8XqGGcE8N39eHtiKgKAXbhCjpOKFQrpW0sb2hVhp2rp4U+MUv0h0YFvTXZm+77Tx5OSVH0ckHs5S2dE=;
X-UUID: 42069e9b3cb44bcfb92e07fa2ce100b9-20210606
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 859914411; Sun, 06 Jun 2021 07:34:13 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Jun 2021 07:34:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Jun 2021 22:34:10 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 6 Jun 2021 22:34:10 +0800
Message-ID: <2f67567432a0e6c304a47d19c655bf83cf271e6d.camel@mediatek.com>
Subject: Re: [PATCH] mt76: mt7921: enable VHT BFee capabiliity
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu
 <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>, Posh Sun
 <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>, Stella Chang
 <Stella.Chang@mediatek.com>, <jemele@google.com>, <yenlinlai@google.com>,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Sun, 6 Jun 2021 22:34:10 +0800
In-Reply-To: <3bbdab20-60be-61fb-d731-5cf5d04f7f3c@nbd.name>
References: <a5748514496b2b4e4b23be7b0b560d2585feafb6.1622627260.git.deren.wu@mediatek.com>
 <3bbdab20-60be-61fb-d731-5cf5d04f7f3c@nbd.name>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_073419_391113_1B7059FB 
X-CRM114-Status: UNSURE (   8.50  )
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

On Sun, 2021-06-06 at 09:51 +0200, Felix Fietkau wrote:
> On 2021-06-02 17:17, Deren Wu wrote:
> > From: Deren Wu <deren.wu@mediatek.com>
> > 
> > enable BFee functions with proper BFee IEs
> > 
> > Tested-by: Eric-SY Chang <Eric-SY.Chang@mediatek.com>
> > Signed-off-by: Leon Yen <Leon.Yen@mediatek.com>
> > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> 
> I've sent out a much simpler replacement for this patch, please take
> a look.
> 
> - Felix
Hi Felix,

Your patch is fine with me. Thanks for help.

Regards,
Deren
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
