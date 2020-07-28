Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E066CC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 06:06:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0CFF20759
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 06:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cw+Q1yX2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hD9NBGeE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0CFF20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vHfr1ZHBY5xetr3K882as14OiKNa746/zYJgLXTotmk=; b=cw+Q1yX2InlH1/f1moPiTu+Aa
	LMTVDUMJv6Tw0V6jTWMOB9v5AjdQw5pLxOoN2fF5CYKdKYXjEW49AcE0da/7GvMxM6I4Aq6kdDpsy
	8Bj1L+f0JsYbeTs6KUGY/6QwCiLbhh3yuOcftZCPFj3SidOeL7UPJgc+oEQfw77dvZ/Rx0lwSLWHb
	4BcsFdvj4MbtNmw1VIgLvY5APhTq78z98v9V0QXvEDIC3EsDVM8dYiRO7dBKZFxTvaKsJa6Gkwqbw
	bb45I7b1dd5d8JQteGFHfR6OCb14VKPFDBAxy4JAXxbhm34M08VcOus72PRrJ4hE5E0gCUwPg73PQ
	VKXJk/+6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0Ikv-0006g5-RG; Tue, 28 Jul 2020 06:06:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Ikt-0006fU-7u; Tue, 28 Jul 2020 06:06:28 +0000
X-UUID: d40387844d704396b3b36d014b0aef2e-20200727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=E83uOZs7DyeB7TR4C1odBEb7LAe+3RMTV23poiVNiis=; 
 b=hD9NBGeERDNT/0RgLm5PJPVE/yMeq0D+F8sAF1qePLx6EfmdnE9D1JCMlkQ6SO6b/rJ9syRmRu1pUaE4NI08CfZGoTbELoepiGEEMgIeBbwOgTqpqYWtlpAWza4y9yz2yOHVt7GRXUe5HtdfxZIM0MYc/AuLTRyYvp/tzcP0q9c=;
X-UUID: d40387844d704396b3b36d014b0aef2e-20200727
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 590935797; Mon, 27 Jul 2020 22:06:26 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Jul 2020 23:06:19 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs08n1.mediatek.inc
 (172.21.101.55) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 28 Jul 2020 14:06:05 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jul 2020 14:06:05 +0800
Message-ID: <1595916343.21478.4.camel@mhfsdcap03>
Subject: Re: [PATCH 10/11] usb: mtu3: clear dual mode of u3port when disable
 device
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Date: Tue, 28 Jul 2020 14:05:43 +0800
In-Reply-To: <e30483ff-e66a-1cba-e166-a1fe590c2f03@gmail.com>
References: <1595834101-13094-1-git-send-email-chunfeng.yun@mediatek.com>
 <1595834101-13094-10-git-send-email-chunfeng.yun@mediatek.com>
 <e30483ff-e66a-1cba-e166-a1fe590c2f03@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_020627_467982_2C84AB2E 
X-CRM114-Status: GOOD (  12.68  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-27 at 11:07 +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 27.07.2020 10:14, Chunfeng Yun wrote:
> 
> > If not clear u3port's dual mode when disable device, the IP
> 
>     If we don't clear ... when disabling ...?
> 
> > will fail to enter sleep mode when suspend.
Ok, thanks a lot

> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> [...]
> 
> MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
