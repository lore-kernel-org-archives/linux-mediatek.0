Return-Path: <SRS0=BF5s=ZA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B90AC5DF60
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Nov 2019 08:14:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BE1C21D7F
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Nov 2019 08:14:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ar7V8cXX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gaNzLAbH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BE1C21D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEkvRW4mjMRonPrv1Q+BvFufdmbv+R0u331EHJMDUlI=; b=Ar7V8cXXz5RSc/
	d5KlT0NYLxLjcJjT4tQ2b5/JEgULovscKmYpesMbtalabQekHr2G325Fnhhj+pjf2yhgsWNFLQqG3
	k/U86ljct+HkCqyapQXIxPDn3qTy2bzqujEYZhXB8iM0bW1//Y8PpcYy8xO3tJ2gKVa8RvfSGxvzX
	Zeb3wwq4RlOpOdUXBjNw+8ZwHtlr2GHp7epF7xeptkmsWaUZrdEjfQrGlSmdDLQhjUgkXPF7OWIre
	msBFi/d0Ly7fll9OiTzYhbgKZSNiHZ1eu+RYf0JviC/0DjmUkoQVNKFak3PGlYuktbQL294fFbf5g
	GwPosgBV0dcbQ6LDG+rA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSzPG-0000Ck-Ad; Fri, 08 Nov 2019 08:14:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSzP3-0008VA-Lq; Fri, 08 Nov 2019 08:13:58 +0000
X-UUID: e281e83cdbf54713aeeb88feaa1d44de-20191108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xBlkyXC6QXDUVtiAo1Ep4CtUp9rzUNb55vuuwtwgRxQ=; 
 b=gaNzLAbHUbPc8cHrLJOCkW0kG80ufIGtRF9iUaqDaRtsVQh8ow/lZUTpXlzHkhwouwrhoa21FFfCtS57v/v6pwjhTJvW4jAuON/iUmw/aSuFcmWC7kIVENw0Wf65Tk2ZBpSHD7KJxJVMtyTRWB33G0p+Oa/7YKSqEFo251Z65m0=;
X-UUID: e281e83cdbf54713aeeb88feaa1d44de-20191108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-mc.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 279056674; Fri, 08 Nov 2019 00:13:38 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 8 Nov 2019 00:13:28 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 8 Nov 2019 16:13:26 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 8 Nov 2019 16:13:26 +0800
Message-ID: <1573200809.10348.9.camel@mtksdccf07>
Subject: Re: [PATCH net] net: ethernet: mediatek: rework GDM setup flow
From: mtk15127 <Mark-MC.Lee@mediatek.com>
To: David Miller <davem@davemloft.net>
Date: Fri, 8 Nov 2019 16:13:29 +0800
In-Reply-To: <20191107.154922.1123372183066604716.davem@davemloft.net>
References: <20191107105135.1403-1-Mark-MC.Lee@mediatek.com>
 <20191107.154922.1123372183066604716.davem@davemloft.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191108_001357_723362_F09AB197 
X-CRM114-Status: GOOD (  10.47  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, andrew@lunn.ch, jakub.kicinski@netronome.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, opensource@vdorst.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com,
 Mark-MC.Lee@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2019-11-07 at 15:49 -0800, David Miller wrote:
> From: MarkLee <Mark-MC.Lee@mediatek.com>
> Date: Thu, 7 Nov 2019 18:51:35 +0800
> 
> > +	for (i = 0; i < 2; i++) {
> 
> This is a regression, because in the existing code...
> 
> > -	for (i = 0; i < MTK_MAC_COUNT; i++) {
> 
> the proper macro is used instead of a magic constant.
 Yes, you are right, I make a mistake here, will correct it in the next
patch
> 
> You're doing so many things in one change, it's hard to review
> and audit.
> 
> If you're going to consolidate code, do that only in one change.
> 
> Then make other functional changes such as putting the chip into
> GDMA_DROP_ALL mode during the stop operation etc.
Thanks for your suggestion, I will separate these changes into
a patch series to make every change to be more clear for its 
purpose.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
