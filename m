Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF48CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 07:16:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6FC860FD7
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 07:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6FC860FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BQ10AAaUCd73Dbv6QVhYrfvAq6xLn/a3W5lqFOo19U=; b=Z1I7uGMPByq2xf
	1rlaFZGZn68JsZ9jzny3cpSdOzrTfvVS5XFKyk3Zrb7peFgbpvPS3zTakh09Ul5kOQ0fe6k3IEFCE
	XUzgCoS/f8ElyM7agkJTzAg8RjdXHr+d1V70xRJnqT47heiVytq+46zPNLdpe15cMw7hckWO1l40b
	JisqS3jXhFWyxAcAeBVlYSy4zmNkEZInnkiKMUN+exiipP+kAN3w86t1wJ9svJ79UjQCq2n7mIpmM
	LZPv02uFM1ghFk9LLFsO+Vwp4yu27O9/VdldXbPafnjr03t4ZeJfjKgCnJ4JqlJ1DMSiapvsEIFFI
	lLVkTYsMFK+bd1f5c4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYk7D-001pHk-Jp; Fri, 08 Oct 2021 07:16:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYk6z-001pDB-37; Fri, 08 Oct 2021 07:16:10 +0000
X-UUID: ba1dfd78cfea40cab0fe5e7dacd74452-20211008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qWjr+AiJvYo10hf1cS6L6W6bO/DtrFRJjsgwpRlO+3k=; 
 b=rjLsj8+2NCkKY6qFoWiVjATBm9mrR/P/OnNoYMfPcJgOrPC+nkFCCJnFsCrKByACRiiG64Zahm9qw1AkGPl/6+H5LiXBfoC/xaYUXscmxXInOrLtTkvovnFGdzR+kCOhfLxr5PdQPeojBqE4JrRyQWNFvqlW2VdolCN6AqqOSgU=;
X-UUID: ba1dfd78cfea40cab0fe5e7dacd74452-20211008
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1122887031; Fri, 08 Oct 2021 00:16:02 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Oct 2021 00:13:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Oct 2021 15:13:19 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Oct 2021 15:13:18 +0800
Message-ID: <461ed34baaf49acda8a3287635f0b4670240cd35.camel@mediatek.com>
Subject: Re: [PATCH v7 3/7] i2c: mediatek: Dump i2c/dma register when a
 timeout occurs
From: Kewei Xu <kewei.xu@mediatek.com>
To: Wolfram Sang <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
 <liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
 <ot_daolong.zhu@mediatek.com>, <yuhan.wei@mediatek.com>
Date: Fri, 8 Oct 2021 15:13:21 +0800
In-Reply-To: <YVf+KCztQI9XrdEq@kunai>
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
 <20210917101416.20760-4-kewei.xu@mediatek.com> <YVf+KCztQI9XrdEq@kunai>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_001609_159058_9F851A7B 
X-CRM114-Status: GOOD (  16.95  )
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

On Sat, 2021-10-02 at 08:37 +0200, Wolfram Sang wrote:
> > @@ -837,6 +839,57 @@ static int mtk_i2c_set_speed(struct mtk_i2c
> > *i2c, unsigned int parent_clk)
> >  	return 0;
> >  }
> > +static void i2c_dump_register(struct mtk_i2c *i2c)
> > +{
> > +	dev_err(i2c->dev, "SLAVE_ADDR: 0x%x, INTR_MASK: 0x%x\n",
> > +		mtk_i2c_readw(i2c, OFFSET_SLAVE_ADDR),
> > +		mtk_i2c_readw(i2c, OFFSET_INTR_MASK));
> 
> I think this is too verbose and should be a debugging only patch not
> really suited for upstream. But if you like it this way, then keep
> the verbosity. However, dev_err is too strong, this really needs to
> be
> dev_dbg. Timeouts can happen on an I2C bus, think about an EEPROM in
> a
> long erase cycle while you want to read it. Perfectly normal.
> 
> 
> >  	if (ret == 0) {
> > -		dev_dbg(i2c->dev, "addr: %x, transfer timeout\n", msgs-
> > >addr);
> > +		dev_err(i2c->dev, "addr: %x, transfer timeout\n", msgs-
> > >addr);
> > +		i2c_dump_register(i2c);
> 
> Needs to stay dev_dbg as well.
> 
> Yes, It is used for debugging,but dump the value of value of the
> register is very important for debugging,so we think it is
> necessary. We will use dev_dbg to replace dev_err in V8. Thanks~
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
