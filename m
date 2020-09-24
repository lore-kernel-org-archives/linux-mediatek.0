Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5603EC4346E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 09:09:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEFC4206CD
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 09:09:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qdxAu/8f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Owoa8rsh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEFC4206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TADyO3vdbfGYHVUDhpYQe7CwdGn9r0+qhQD2j4D+dek=; b=qdxAu/8fUe2ApGY33ItdD06Y+
	0WVMDn3rtrJjtCutoZRn+RlGajH0YdkiF/rY8TF5eYiJyz4aIJu/u1pWA5uVB6IdTr7w96kAuG+uU
	PVeUlpTzRa+XvelUhGkGDuv82gPXNYW6ssGQMVYTASU4bEdnzLsitONLEyKupZzwForhTI26+FXEU
	/D7jFNvOvWGa4wza17RkXLhJhOPfK544IYWR1wdPg9MTXtf3Hw8qTGBT4+oA/eGGe0tK/AQ3/Aadw
	KUb9ZcnkGOQ1ujVcQ1GWCEGiYkeSH7dJqr2/zrMplsyFeXWS+nkZnuidLko9+JopMUNjGZSBbDR5O
	45I7Uytxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLNFg-0003p5-1d; Thu, 24 Sep 2020 09:09:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLNFa-0003nf-5I; Thu, 24 Sep 2020 09:09:17 +0000
X-UUID: f889fc3182ed447a91dd751d5bb9b9e3-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3Osfip0/Fmw6EWA75COU3SlVfE6xh4/kF+AnEUPz9NI=; 
 b=Owoa8rshe0kIAGVm6AG3NxzCQ4AAbrbU1R5LojRSc+qacfzJEurxoeyt2ZApyn3Ea3BZ0EjDsitfKcfdcJIyA/Fpw4DP0lXZ07VX3XDZWTGyk0CzO9i6N+lYySUk5YldbjJrxb+pFQURRYex1suZAWqzQZujFRlrpZi/Oqzylt0=;
X-UUID: f889fc3182ed447a91dd751d5bb9b9e3-20200924
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2105865466; Thu, 24 Sep 2020 01:00:49 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 02:00:47 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Sep 2020 17:00:44 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Sep 2020 17:00:44 +0800
Message-ID: <1600937901.10428.4.camel@mhfsdcap03>
Subject: Re: [PATCH 1/7] usb: mtu3: convert to
 devm_platform_ioremap_resource_byname
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Date: Thu, 24 Sep 2020 16:58:21 +0800
In-Reply-To: <87tuvnej3o.fsf@kernel.org>
References: <1595404275-8449-1-git-send-email-chunfeng.yun@mediatek.com>
 <87d02y1190.fsf@kernel.org> <1600400313.20602.4.camel@mhfsdcap03>
 <87tuvnej3o.fsf@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1DF56F8CBC2847E8528887447F97D71D9F00CDB10BFFC52207B6F5E6DED157B82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_050914_416120_A714280B 
X-CRM114-Status: GOOD (  19.06  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-24 at 10:20 +0300, Felipe Balbi wrote:
> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> 
> > Hi Felip,
> >
> >
> > On Mon, 2020-09-07 at 10:42 +0300, Felipe Balbi wrote:
> >> Hi,
> >> 
> >> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> >> > Use devm_platform_ioremap_resource_byname() to simplify code
> >> >
> >> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> >> 
> >> why is it so that your patches always come base64 encoded? They look
> >> fine on the email client, but when I try to pipe the message to git am
> >> it always gives me a lot of trouble and I have to manually decode the
> >> body of your messages and recombine with the patch.
> >> 
> >> Can you try to send your patches as actual plain text without encoding
> >> the body with base64?
> > Missed the email.
> >
> > Sorry for inconvenience!
> > Is only the commit message base64 encoded, or includes the codes?
> 
> The entire thing :-)
I checked my gitconfig, use the default encoding, that is 8bit. if you
still encounter the issue when apply the series patch
https://patchwork.kernel.org/patch/11764953/
I'll resend them by "git send-email --transfer-encoding=8bit 00*"

> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
