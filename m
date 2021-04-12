Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A0AC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 12:09:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78DB561287
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 12:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78DB561287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AfkQOjNte3XJms1QR04mH/aaRpGpIdmYhEuhM1G/okI=; b=pWcfE42b/hBvZQ9KfVokDsw9y
	9kizls90BvNF90zP5tYTzNIfClqVuKhOwGzryWrS4Xnn/1+8/R6lS1oR9W32TXoU+n4J6fhnIovSI
	/NsB3R9UgQvoHR9RgTRdi6J8LgGYUAq+XaGWfBE69T6Ow8/3NTNHLzfpC4zKu8LNs0d0//Ur8MCal
	Tr0KD/UTaekbFOnD81CtZCwiyV/MctKp7fYgKDOCb3Q+UlRUz/iS6SRTZRjf7MAzeHhhK3Prt/4ZA
	+Fv3ssqQOFxsk9h6lCYNvCGLnAdgriaPqUB9greSAg+ZnNlpHxAlyr3GoIhjwyE40wbYSuNcCIr20
	qvVKTYxFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVvNx-006e9R-9x; Mon, 12 Apr 2021 12:09:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVvNj-006e7r-Cu; Mon, 12 Apr 2021 12:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=xjIpJFHcvYjgEZJlihOq0w4qVxnmy2ixpDuQuCRxIzY=; b=KhgFprY5QypxeMy3cPVnJ66nJI
 MGxsTnlKIon8Eo2B1Ur1jp4TsIAoYU1B15Q+y47bX9x8DsxSSNLdgY4AeBssjgHmJDoHZMzVNWdQW
 6//t+opQ70eRkpRDz9NlUMFx6V1N9Ik2jhoulEim299ckWfYp7W/rINUX6MFZ5zU7ACdWDRU0fpaS
 cjZri+qpsR2V0tV1Z8sQkDCVi376hQ0wKeH9iRR/kSmAJsawkE+WIS8ARNN2+2XBKqF9fMwkNn19d
 Fkf5RRpsEOqjeD7F2xZbM38CTrgZQ4u3hqo+LBiG2px7Hk7slEQyU0da1/Ecs40oyStDCYxnsE50V
 PB5nXoXQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVvNg-006CoJ-Dp; Mon, 12 Apr 2021 12:09:29 +0000
X-UUID: aa0fc467405d427d844b55f9e3449527-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xjIpJFHcvYjgEZJlihOq0w4qVxnmy2ixpDuQuCRxIzY=; 
 b=OMOwPMoMGgd2PQpew6blRmRm5tPg487EzvFFjRV8puBSekNrMfhWCpRssgcIAROkww5l2LWAMUSolHEiY9X+2MLZ9/peGRlGYoJd40y8lRsQC0yT1rCn26FXQayEjxK9oGLYB6NpNBar5o7dLQjYFaXyOKNuiWHXYuPMPIJTv7o=;
X-UUID: aa0fc467405d427d844b55f9e3449527-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2019832906; Mon, 12 Apr 2021 05:09:23 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 05:03:21 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 12 Apr 2021 20:03:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 20:03:14 +0800
Message-ID: <1618228994.32225.3.camel@mhfsdcap03>
Subject: Re: [RESEND] i2c: mediatek: Get device clock-stretch time via dts
From: Qii Wang <qii.wang@mediatek.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>
Date: Mon, 12 Apr 2021 20:03:14 +0800
In-Reply-To: <20210407181936.GA1614@kunai>
References: <1615622664-15032-1-git-send-email-qii.wang@mediatek.com>
 <20210406194856.GF3122@kunai> <1617797706.32076.1.camel@mhfsdcap03>
 <20210407181936.GA1614@kunai>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A7CFFEEEB61B385686FB02EAD7F2826708C53DF7161DB026B3C8B8AD5232F5922000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_050928_488280_9FB8DE91 
X-CRM114-Status: GOOD (  12.71  )
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

On Wed, 2021-04-07 at 20:19 +0200, Wolfram Sang wrote:
> > Due to clock stretch, our HW IP cannot meet the ac-timing
> > spec(tSU;STA,tSU;STO). 
> > There isn't a same delay for clock stretching, so we need pass a
> > parameter which can be found through measurement to meet most
> > conditions.
> 
> What about using this existing binding?
> 
> - i2c-scl-internal-delay-ns
>         Number of nanoseconds the IP core additionally needs to setup SCL.
> 

I can't see the relationship between "i2c-scl-falling-time-ns" and clock
stretching, is there a parameter related to clock stretching?
If you think both of them will affect the ac-timing of SCL, at this
point, "i2c-scl-falling-time-ns" maybe a good choice.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
