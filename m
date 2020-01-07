Return-Path: <SRS0=GJVM=24=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67EE6C33C8C
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 12:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 399CB206F0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 12:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sUPEtFcy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Wk7K5PvL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 399CB206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z46uWzo0By3KEytz4/vpcmVTl26fNzFU5fpCdJMIa+c=; b=sUPEtFcyXwhnDD
	ywuS23xOQnY35jp8H4LrN9UiFhrW8HgAPdKOaUIDkxAyq117nrK4GIcSDOs86bkaCjKsdXa+dDfUI
	oT4IBTA8yjR5rlWVE8wvViNlpQzxcoWYZRsdTpxduqDA8vqNcEhSTuxh4cS37cAjChc8iOs+RUjyH
	/SCMI4gvspFupL+Fv3bkBPwonu5eonaHrRkX6gcaaoY0xCnoKsj7KhhXzJTigblGn+00Ufs7CMM57
	ytw0yieHtvUY/IXBf5rpB2XdO1zwG3j8vMHyTZHME5gFD0vBrGlPX6g+IQJm5oEeYArfNCGQi2Le4
	j9cGnOnzID/bWzuBsSFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ionnF-0001A3-LP; Tue, 07 Jan 2020 12:17:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ionnC-00018u-OC
 for linux-mediatek@lists.infradead.org; Tue, 07 Jan 2020 12:17:04 +0000
X-UUID: 99f242940d09401f999ecb4089b609b6-20200107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=xUz0iKdA3Jx7oeQE3+cQqp7m0F3c8sg3JZxB5700qYk=; 
 b=Wk7K5PvLmuqs0f37o3uTDVzG3WZjjykLl9vUGffeHnBc/sW3y56CjF1LVcThnsspWNWnFD16Q8ISbmVygZCL4sET33CuR6gNsRAj0y7yVCiCskpmSwqUAviZMDn0EcNq4+0CNLrqyp9XfNB31ZRVsermppVsv2W6xXxrH3mBTbI=;
X-UUID: 99f242940d09401f999ecb4089b609b6-20200107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1994214483; Tue, 07 Jan 2020 04:16:55 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 Jan 2020 04:17:26 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 Jan 2020 20:15:50 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 7 Jan 2020 20:17:15 +0800
Message-ID: <1578399400.16092.14.camel@mtkswgap22>
Subject: Re: [PATCH v7 5/6] Backward compatible to previous Mediatek's
 bias-pull usage
From: Light Hsieh <light.hsieh@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jan 2020 20:16:40 +0800
In-Reply-To: <CACRpkdbto2goahTjzozi_LXXo1QNUTV1wm_rwoFOTcb36w0jkw@mail.gmail.com>
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
 <1577799707-11855-5-git-send-email-light.hsieh@mediatek.com>
 <CACRpkdbto2goahTjzozi_LXXo1QNUTV1wm_rwoFOTcb36w0jkw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B7E5CF622FD1C7D1CA83D3F7690555CFE8E879EC25EAEB8C1BCCED3F2290A7CC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_041702_796655_C17259B3 
X-CRM114-Status: GOOD (  13.81  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sean Wang <sean.wang@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 kuohong.wang@mediatek.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-01-07 at 11:40 +0100, Linus Walleij wrote:
> On Tue, Dec 31, 2019 at 2:41 PM Light Hsieh <light.hsieh@mediatek.com> wrote:
> 
> > Refine mtk_pinconf_set()/mtk_pinconf_get() for backward compatibility to
> > previous MediaTek's bias-pull usage.
> > In PINCTRL_MTK that use pinctrl-mtk-common.c, bias-pull setting for pins
> > with 2 pull resistors can be specified as value for bias-pull-up and
> > bias-pull-down. For example:
> >     bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
> >     bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> >     bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
> >     bias-pull-up = <MTK_PUPD_SET_R1R0_11>;
> >     bias-pull-down = <MTK_PUPD_SET_R1R0_00>;
> >     bias-pull-down = <MTK_PUPD_SET_R1R0_01>;
> >     bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> >     bias-pull-down = <MTK_PUPD_SET_R1R0_11>;
> >
> > On the other hand, PINCTRL_MTK_PARIS use customized properties
> > "mediatek,pull-up-adv" and "mediatek,pull-down-adv" to specify bias-pull
> > setting for pins with 2 pull resistors.
> > This introduce in-compatibility in device tree and increase porting
> > effort to MediaTek's customer that had already used PINCTRL_MTK version.
> > Besides, if customers are not aware of this change and still write devicetree
> > for PINCTRL_MTK version, they may encounter runtime failure with pinctrl and
> > spent time to debug.
> >
> > This patch adds backward compatible to previous MediaTek's bias-pull usage
> > so that Mediatek's customer need not use a new devicetree property name.
> > The rationale is that: changing driver implementation had better leave
> > interface unchanged.
> 
> Are these devicetree bindings upstream, or are these bindings never
> submitted for inclusion in the official device tree bindings?
> 
> I don't really want to encourage out-of-tree non-canonical device
> tree experiments.
> 
> On the other hand I want running code.
> 
> I suppose if there is a solid use case for backwards compatibility
> that also affect independent developers (such as people just
> hacking around with these devices) then we could add it.
> 
> Yours,
> Linus Walleij

Use of "bias-pull-down = <MTK_PUPD_SET_R1R0_XX>" had already been
described in
Documentation/devicetree/binding/pinctrl/pinctrl-mt65xx.txt.
Previous MediaTek chips using pinctrl-mtk-common.c had already use such
binding. This is so-called backward compatibility.

Besides, according to
Documentation/devicetree/binding/pinctrl/pincfg-node.yaml, bias-pull-up
and bias-pull-down can have an optional argument to select pull strength
when supported by hardware.
So, I think the propose of using "mediatek,pull-up-adv" and
"mediatek,pull-down-adv" is not necessary. However, I fail to stop
upstream of using "mediatek,pull-up-adv" and "mediatek,pull-down-adv" in
pinctrl-mtk-common-v2.c.

Light Hsieh


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
