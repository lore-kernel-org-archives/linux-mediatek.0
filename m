Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B707C43464
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 03:41:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DEC521973
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 03:41:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nq+wbTz+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oZ81HU/V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DEC521973
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V9EtbTIO/3ef8DINfy8H8sNnnHRt79Q30LTMzNj1WJs=; b=nq+wbTz+ppYxCYy0htMFbr0vn
	TYg5ec2bq41+eBgJuae4QbSJ3XE784U5llD7bL5Te9VOhazwayLDzm29B1eO9RrNQT05IcJsXp1eN
	lhWqL4Pxa/36A0cKRxjqSrCLcSOz4k0xeH1DuO8AKpEc8G5agnQiRTfQqsIWdgWHbEUocC/MOZyfm
	YYSEPCiP1L7AjwKs5lEKPmZp9a/0XAD0J5gYef2JBtBFWOYBeWJlH8Sva+tbW0knmMfCnZSB1tA7O
	VJn8OTMLHSMEYvDRA4zA7DUXAgjfksVhs1V6OAyhZGiRAk1aI7IyiTpGNITHjZXzRQUBTq4zVakFJ
	m/y4lsGSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ7Gd-0004Ui-HJ; Fri, 18 Sep 2020 03:40:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ7GZ-0004TN-8X; Fri, 18 Sep 2020 03:40:56 +0000
X-UUID: 0e3fd1f737e746e2975bb01fa78d1b19-20200917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NJWqmI9Q+3XKGNwrqS5sBa+WygmHxvHtMA8oZ41d8Zk=; 
 b=oZ81HU/VxH8I4jeR1gBS/Okajoz3Gyi8WPUJOZASUU9aVxXx8fyeJJXKcuJ33c+/8aOfKyA55a2O84NBxZYWV6DBcCfZwhy8DLfLMMlbURXlnQyH5opulRViRLsYvfrxP0EYt63Fu7XRbOM+5GsP2OK4KBgL5pAkobLXDSHzuXU=;
X-UUID: 0e3fd1f737e746e2975bb01fa78d1b19-20200917
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 81651921; Thu, 17 Sep 2020 19:40:48 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Sep 2020 20:40:46 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 18 Sep 2020 11:40:43 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Sep 2020 11:40:43 +0800
Message-ID: <1600400313.20602.4.camel@mhfsdcap03>
Subject: Re: [PATCH 1/7] usb: mtu3: convert to
 devm_platform_ioremap_resource_byname
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Date: Fri, 18 Sep 2020 11:38:33 +0800
In-Reply-To: <87d02y1190.fsf@kernel.org>
References: <1595404275-8449-1-git-send-email-chunfeng.yun@mediatek.com>
 <87d02y1190.fsf@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0CC168B5AFE69E193055849BE7B64D2C4E5C6D83B9F689EBFDF4440AAEA4FFC72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_234055_470286_0ACA9C53 
X-CRM114-Status: GOOD (  15.26  )
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

Hi Felip,


On Mon, 2020-09-07 at 10:42 +0300, Felipe Balbi wrote:
> Hi,
> 
> Chunfeng Yun <chunfeng.yun@mediatek.com> writes:
> > Use devm_platform_ioremap_resource_byname() to simplify code
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> why is it so that your patches always come base64 encoded? They look
> fine on the email client, but when I try to pipe the message to git am
> it always gives me a lot of trouble and I have to manually decode the
> body of your messages and recombine with the patch.
> 
> Can you try to send your patches as actual plain text without encoding
> the body with base64?
Missed the email.

Sorry for inconvenience!
Is only the commit message base64 encoded, or includes the codes?

> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
