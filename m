Return-Path: <SRS0=UXZI=AU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8765FC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 07:07:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57C3E20674
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2020 07:07:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nj1ESTZP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HPwNJUBf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57C3E20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bc5tzGlrAmhcHnwm5q66oYZpCfYkJ0N2QbQUDdTY6GQ=; b=nj1ESTZP2IIL34YPgKKrG6+dY
	Bg4CfudSZCPecvd8VtY/k0bXD4fNGY7q/e+pd3TzjxlxpyD+62LzOBb4ZdXgNhKkjdTDFMsbZrRjw
	T5lVBdLEcpYqZSEM65HnzKdwNB7vp+M5Y5bC5hkhHH+eLvR7OO0u+huTVefUHYOqSl3pkD+61bUda
	vPI0c0yJO+Nw+VeeP1AW9/3AY0T3/UWGKz8ml15MHhg2E/wCN+F4q54k662VIZ+AWfNgrDyEUha1K
	lW6gkrnOpBE9/7mpqQ2itpweeObIECEjqrWQavrmFTuMBoFYAmlDPOoXFyp5XS435jCl13swUgMU9
	raASouHng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtQeM-0000yf-1v; Thu, 09 Jul 2020 07:07:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtQdc-0000n9-UW; Thu, 09 Jul 2020 07:06:34 +0000
X-UUID: 1b77dbb708f0404dba0dae22d5f654e3-20200708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JCdqhnmOrA4bIemjU77tSTchJtgxF3g3bcC1iZfUepU=; 
 b=HPwNJUBfC5mAmkq6ABB39yQCe3NGDKGEbk1VUPa9jI4VaCMy2mBj9KHePSK1DwEMtakTDttKta+WIGVOwIS9uxhjCM76+XHmLW0Sb44trDkjmf9/cTXZi4KPlG0DATBXHmAkmNRteq6fR8+05dKpcWPADMv3bWdlbNwS5im3p74=;
X-UUID: 1b77dbb708f0404dba0dae22d5f654e3-20200708
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1958342936; Wed, 08 Jul 2020 23:05:58 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jul 2020 00:06:01 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 9 Jul 2020 15:05:59 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Jul 2020 15:05:58 +0800
Message-ID: <1594278321.23885.26.camel@mhfsdcap03>
Subject: Re: [V2 PATCH] usb: mtu3: fix NULL pointer dereference
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Date: Thu, 9 Jul 2020 15:05:21 +0800
In-Reply-To: <87lfjt6vjm.fsf@kernel.org>
References: <1593502942-24455-1-git-send-email-chunfeng.yun@mediatek.com>
 <87lfjt6vjm.fsf@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F3256F28A9F380161FC65DD621C2647F2BB492FBFB0CAC48B3BADA5C9B75167D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_030633_173048_57F6C7A8 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Markus Elfring <Markus.Elfring@web.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-07-09 at 09:40 +0300, Felipe Balbi wrote:
> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> 
> > Some pointers are dereferenced before successful checks.
> >
> > Reported-by: Markus Elfring <Markus.Elfring@web.de>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> do you need a Fixes tag here? Perhaps a Cc stable too?
It will not cause somes issues, I think no need add it.

According to Greg's comment, I guess he means no need check these
pointers at all, so I'll send a new version to remove checks.

Thank you

> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
