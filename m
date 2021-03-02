Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319B3C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 20:54:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92BAB64EF8
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 20:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92BAB64EF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1fLk6fYuUWxGOKr6aUQTWD5E0pb5Cij31FBhqjgMcRI=; b=WpHHHGnGtjA4tdfGLzR6ENBwM
	Ddlikp7eXBM3KUXqidqxzZio/NtBIuxjzyxy+QUTKnFJC+036kfw5FFvFpekjFreh0OLNSVfcapt0
	aRRV+koZHD+ftuavLyTT0v1u+MMzXgBJwx7mgRE9aOj9CIXezUQ0Jj5BzJT24+ekp4DgPRj4mfw6r
	Ia1/Rm1eHoyqaM1Fnm59p9bomLIQAxaU3osRB7n5/167YBKIHvkawS02jgoXeQLnaEzgAvwQR/nL8
	3C+1f0urLMgElRUTM0WuPqKFykBtTYOk1i+piDdgdexhCqsga5VRbMj94ph7z8HhZlfxrShkjwPaD
	6HQdHu32A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHYVX-006Usb-KI; Wed, 03 Mar 2021 20:54:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT7E-005JLa-DK
 for linux-mediatek@desiato.infradead.org; Wed, 03 Mar 2021 15:08:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=3ZRCi/nRxti+OHB6RGuP2kk8X0Uuta9T9GY8fOIWmF8=; b=WnHBBFBrJZ/ghw8DQzBGGvO8OA
 IZrI7qTDGUDGseGeXaCjm9Bc6jt2jtYt0tiaJ1lyJ5SodJrQN9j5SnbqYiODnmUzcNJNZ609Xqlmt
 FK28ayl8T9z+y1dlpNqou2hP1GgCOUMGoE72ZhIVORbgqdaaXSGdP9gQ4MMgDXU4t7ihBC6czQ1VL
 epFQ1hoghguDxO/zjeU6iABTRsMqfe7PqStNpUsaBgk5mQxrPWhe1GFdUhC4DdFnF3ZshdmJJQ7iL
 izD2L0PDxZWsKDePL+lFMpVzmRqhmMQex+t/e1fNIG3p6TWgwJ5d+MUvly5xD59tKOExCIJHlkAO2
 62IIDAAA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH4Ds-00H6m9-O7
 for linux-mediatek@lists.infradead.org; Tue, 02 Mar 2021 12:33:59 +0000
X-UUID: 818cc6a21297493a9782a0254a20f60b-20210302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3ZRCi/nRxti+OHB6RGuP2kk8X0Uuta9T9GY8fOIWmF8=; 
 b=uP89SOWI/4awQ9Sr2L5UPRGyaZvTeT0Z8+XtwFDT1Jl/VXo8arBymKJc20gPhe+EzoCvVtMxCcrlWI9EyrzGl2ku7hipqVBSzLKcSU0/mM6D2ELKxrCils4rsJRCSBMls6HUCkTYfVYO9Ls9Bp/1Q9SIKOf/w+O/Taclv4EnWZ0=;
X-UUID: 818cc6a21297493a9782a0254a20f60b-20210302
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1871686587; Tue, 02 Mar 2021 04:32:16 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Mar 2021 04:32:14 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 2 Mar 2021 20:32:11 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Mar 2021 20:32:11 +0800
Message-ID: <1614688331.28437.7.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: Get device clock-stretch time via dts
From: Qii Wang <qii.wang@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
CC: <wsa@the-dreams.de>, srv_heupstream <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, <linux-i2c@vger.kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 2 Mar 2021 20:32:11 +0800
In-Reply-To: <CAATdQgCoLB-iOcxN2ptDmqD69FnyUen5XeRTq=LCCfXmWkBeWw@mail.gmail.com>
References: <1612348525-13364-1-git-send-email-qii.wang@mediatek.com>
 <CAATdQgCoLB-iOcxN2ptDmqD69FnyUen5XeRTq=LCCfXmWkBeWw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2EB7B12E6C512922AD6609AB522FD825146F1596765CF85E5FB095D7D12A9FB82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_123359_314332_EFF88600 
X-CRM114-Status: GOOD (  12.54  )
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

Hi,
On Tue, 2021-03-02 at 19:30 +0800, Ikjoon Jang wrote:
> Hi Qii,
> >
> > @@ -1171,6 +1173,8 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
> >         if (i2c->clk_src_div == 0)
> >                 return -EINVAL;
> >
> > +       of_property_read_u32(np, "clock-stretch-ns", &i2c->clock_stretch_ns);
> > +
> 
> I think this new property "clock-stretch-ns" is for the same purpose of
> "i2c-scl-falling-time-ns" + "i2c-scl-rising-time-ns" defined in
> Documentation/devicetree/bindings/i2c/i2c.txt?
> 

I haven't find the corresponding instructions;and this patch is for the
problem caused by clock-stretch when the scl is pulled.

> >         i2c->have_pmic = of_property_read_bool(np, "mediatek,have-pmic");
> >         i2c->use_push_pull =
> >                 of_property_read_bool(np, "mediatek,use-push-pull");
> > --
> > 1.9.1
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
