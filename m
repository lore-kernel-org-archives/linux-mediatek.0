Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E727C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 16:07:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C97A613BD
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 16:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C97A613BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gYv6uncBWVuxikM4qrx4cwtInUjS3UHUY8ZVZ61nLtY=; b=NqImdMw3Utvf0xGRkESe1vx8z
	P3GLLYVIDgboQk5UWo45Vc4xJr8F5xHfn9I/lPXvYQaewYoM15XnmePNRktcdZpVpA+uCEMHC99Nx
	qrXafOg8DYX2TJnrkXUx0IGHKaaGO/p15Z5JvCAKVBVb+/cLB6StdGWqOeVf87QANMnprp0wJBWSj
	SQEh6OEqiUHGu9USUl4G7Cg2mM3AWtAOFTBjTQ7JL3aBd+puVXsrtr/j1MoEZTU0s7Tg6xe1AgHuY
	YoTn/1GpbLwHoDSzqrXw+PDE2lalcfiRwLbz003jhdP63g7Nf76QRvtrgbkK+2ovMB257aV4MsgT0
	f/Sx6vyoQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lToER-002yd3-Uq; Tue, 06 Apr 2021 16:07:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lToEN-002ycM-PW
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 16:07:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26681613DE
 for <linux-mediatek@lists.infradead.org>; Tue,  6 Apr 2021 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617725223;
 bh=q0TkxKOZJRUCAT/XfYl1YgZ73jKyqtq9Ikqkmc/zUi0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GyMC15T1zs1/FkyzEWXhAoZRPjYf8iTv0ebdRrGUWbDRkWlLvORRumrMafdLcFCPg
 QYAZApT/4mG9b41oyajNyffAC8dI7OmznHPc+ULgGQh2OqecWYYejnHKLedqaksmnJ
 PP1659XHUsMr+O1Y/6e52Q9+lpjus3evEJ6fVn/B9eozisxj459ekoIp7vEDHVFHZV
 lm2ubBW0wfV/VPYrf6t+4zRTnX3c4wmEQBb/nHHG+X9MDGsMD6e6/GGGLb34tFBGLk
 xhOSYoPuGNxibwmqk6EXHR7Mm53VggW8AkrwLSI9FN6q6NkBEO7h9nxcxSwFaUVAwE
 hixdnahlEquUQ==
Received: by mail-ej1-f49.google.com with SMTP id u21so22801217ejo.13
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 09:07:03 -0700 (PDT)
X-Gm-Message-State: AOAM531F5gBJbJnWY1WFhg8JpBg5ZKEaUUei7fcQ4sE/AZ7md26/S0ae
 bBQSVOUhBLDe1pK6nTls7t2JLvp9z63HOXZgaQ==
X-Google-Smtp-Source: ABdhPJzMoSMQygWRDajEWdidSk67pVGpnygV7Dy6GVwOgacbGBH3WitosU5sKMxxu8argY+oQjgYUzFyQ6EbAAfWYTg=
X-Received: by 2002:a17:906:490e:: with SMTP id
 b14mr6455459ejq.303.1617725221514; 
 Tue, 06 Apr 2021 09:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210406141819.1025864-1-dqfext@gmail.com>
 <20210406141819.1025864-2-dqfext@gmail.com>
 <CAAOTY_8snSTcguhyB9PJBWydqNaWZL3V4zXiYULVp5n48fN24w@mail.gmail.com>
 <CALW65jbbQSFbgjsMkKCyFWnbkLOenM_+2q6K7BQG5bc4-R0CpA@mail.gmail.com>
In-Reply-To: <CALW65jbbQSFbgjsMkKCyFWnbkLOenM_+2q6K7BQG5bc4-R0CpA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 7 Apr 2021 00:06:50 +0800
X-Gmail-Original-Message-ID: <CAAOTY__4CdGjD-66jJcQVCuzSWOUe7gLxrZ4GAfBAuaOcvX8wA@mail.gmail.com>
Message-ID: <CAAOTY__4CdGjD-66jJcQVCuzSWOUe7gLxrZ4GAfBAuaOcvX8wA@mail.gmail.com>
Subject: Re: [RFC net-next 1/4] net: phy: add MediaTek PHY driver
To: DENG Qingfang <dqfext@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, 
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>, 
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-staging@lists.linux.dev, 
 DTML <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
 Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_170708_190389_26AFBE36 
X-CRM114-Status: GOOD (  10.85  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

REVORyBRaW5nZmFuZyA8ZHFmZXh0QGdtYWlsLmNvbT4g5pa8IDIwMjHlubQ05pyINuaXpSDpgLHk
uowg5LiL5Y2IMTE6NTflr6vpgZPvvJoKPgo+IE9uIFR1ZSwgQXByIDYsIDIwMjEgYXQgMTE6NDcg
UE0gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+
IEhpLCBRaW5nZmFuZzoKPiA+Cj4gPiBERU5HIFFpbmdmYW5nIDxkcWZleHRAZ21haWwuY29tPiDm
lrwgMjAyMeW5tDTmnIg25pelIOmAseS6jCDkuIvljYgxMDoxOeWvq+mBk++8mgo+ID4gPiAtLS0g
YS9kcml2ZXJzL25ldC9waHkvS2NvbmZpZwo+ID4gPiArKysgYi9kcml2ZXJzL25ldC9waHkvS2Nv
bmZpZwo+ID4gPiBAQCAtMjA3LDYgKzIwNywxMSBAQCBjb25maWcgTUFSVkVMTF84OFgyMjIyX1BI
WQo+ID4gPiAgICAgICAgICAgU3VwcG9ydCBmb3IgdGhlIE1hcnZlbGwgODhYMjIyMiBEdWFsLXBv
cnQgTXVsdGktc3BlZWQgRXRoZXJuZXQKPiA+ID4gICAgICAgICAgIFRyYW5zY2VpdmVyLgo+ID4g
Pgo+ID4gPiArY29uZmlnIE1FRElBVEVLX1BIWQo+ID4KPiA+IFRoZXJlIGFyZSBtYW55IE1lZGlh
dGVrIHBoeSBkcml2ZXJzIGluIFsxXSwgc28gdXNlIGEgc3BlY2lmaWMgbmFtZS4KPgo+IFNvICJN
RURJQVRFS19NVDc1MzBfUEhZIiBzaG91bGQgYmUgb2theT8KClRoaXMgaXMgb2ssIGJ1dCB0aGlz
IG5hbWUgbG9va3Mgb25seSBmb3Igb25lIFNvQy4KTUVESUFURUtfRVRIRVJORVRfUEhZIGNvdWxk
IHN1cHBvcnQgbW9yZSBTb0MsIGhvdyBkbyB5b3UgdGhpbms/CgpSZWdhcmRzLApDaHVuLUt1YW5n
LgoKPgo+ID4KPiA+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL3BoeS9tZWRpYXRlaz9oPXY1
LjEyLXJjNgo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBDaHVuLUt1YW5nLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
