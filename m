Return-Path: <SRS0=M/W3=OG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1EFC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 03:05:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DFD361186
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 03:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DFD361186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S8mLblaxMVOKV9iBahuGbFaRBgAYmAzGY7ZIDGCnIvE=; b=tCI1JNKV4Vc3AF
	SyXYA+BbnWMxnqzVqyrJozIDgx+ErTpxXQ2rDUNdsCNWKjEWzK6oWeTO7tOduz8i96yPPpfHD2DKb
	QGfb93namTt95uPT236eeullUP4tFYCziIclEIwX7v24F/BhDVaPk7nTzSAGzMtZDp5LoNCx5aejQ
	mHcgZtaYEyrjbDcJ8dBP+4W2S45733gzMOsW4ODmJGbR2BW46nitWjCySxtBJ3FHEOpKrBiDWVjs6
	e0GNxg8f58o4I3Hs9ZUJvlrKt8aZGToRkzqQ1x7pTOA0D5baWGczJ86PL77yx5oWJmFn3KJVSk0ZK
	rcT8zpH9ENESJRQv/Riw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQhi9-00AF8B-SE; Thu, 16 Sep 2021 03:05:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQhi7-00AF7V-8U; Thu, 16 Sep 2021 03:05:16 +0000
X-UUID: 35fcd941544e423e835de3f65728fe5d-20210915
X-UUID: 35fcd941544e423e835de3f65728fe5d-20210915
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2035023302; Wed, 15 Sep 2021 20:05:09 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Sep 2021 20:05:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 11:05:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Sep 2021 11:05:06 +0800
Message-ID: <607a9a1a0269db8934e8d18940bc25c52a8c60d0.camel@mediatek.com>
Subject: Re: [PATCH v5 04/16] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, DTML
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>
Date: Thu, 16 Sep 2021 11:05:06 +0800
In-Reply-To: <CAAOTY_9pvtP-Ri4UHjRGDvA3j0F7J+HsRqOiNzPbEeE=NmAsqA@mail.gmail.com>
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-5-nancy.lin@mediatek.com>
 <CAAOTY_9pvtP-Ri4UHjRGDvA3j0F7J+HsRqOiNzPbEeE=NmAsqA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_200515_345273_A9DCC641 
X-CRM114-Status: GOOD (  17.65  )
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

SGkgQ2h1bi1LdWFuZywKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCk9uIFdlZCwgMjAyMS0wOS0w
OCBhdCAwMDowNiArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiBIaSwgTmFuY3k6Cj4gCj4g
TmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDnmnIg25pelIOmA
seS4gCDkuIvljYgzOjE15a+r6YGT77yaCj4gPiAKPiA+IEFkZCB2ZG9zeXMxIHJlc2V0IGNvbnRy
b2wgYml0IGZvciBNVDgxOTUgcGxhdGZvcm0uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE5hbmN5
LkxpbiA8bmFuY3kubGluQG1lZGlhdGVrLmNvbT4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvZHQtYmlu
ZGluZ3MvcmVzZXQvbXQ4MTk1LXJlc2V0cy5oIHwgMTIgKysrKysrKysrKysrCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTk1LXJlc2V0cy5oCj4gPiBiL2luY2x1ZGUvZHQtYmluZGlu
Z3MvcmVzZXQvbXQ4MTk1LXJlc2V0cy5oCj4gPiBpbmRleCBhMjZiY2NjOGI5NTcuLmVhYWE4ODJj
MDliZCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTk1LXJl
c2V0cy5oCj4gPiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L210ODE5NS1yZXNldHMu
aAo+ID4gQEAgLTI2LDQgKzI2LDE2IEBACj4gPiAKPiA+ICAjZGVmaW5lIE1UODE5NV9UT1BSR1Vf
U1dfUlNUX05VTSAgICAgICAgICAgICAgIDE2Cj4gPiAKPiA+ICsvKiBWRE9TWVMxICovCj4gPiAr
I2RlZmluZSBNVDgxOTVfVkRPU1lTMV9TVzBfUlNUX0JfTUVSR0UwX0RMX0FTWU5DIDI1Cj4gPiAr
I2RlZmluZSBNVDgxOTVfVkRPU1lTMV9TVzBfUlNUX0JfTUVSR0UxX0RMX0FTWU5DIDI2Cj4gPiAr
I2RlZmluZSBNVDgxOTVfVkRPU1lTMV9TVzBfUlNUX0JfTUVSR0UyX0RMX0FTWU5DIDI3Cj4gPiAr
I2RlZmluZSBNVDgxOTVfVkRPU1lTMV9TVzBfUlNUX0JfTUVSR0UzX0RMX0FTWU5DIDI4Cj4gPiAr
I2RlZmluZSBNVDgxOTVfVkRPU1lTMV9TVzBfUlNUX0JfTUVSR0U0X0RMX0FTWU5DIDI5Cj4gPiAr
I2RlZmluZSBNVDgxOTVfVkRPU1lTMV9TVzFfUlNUX0JfSERSX1ZET19GRTBfRExfQVNZTkMgNTEK
PiA+ICsjZGVmaW5lIE1UODE5NV9WRE9TWVMxX1NXMV9SU1RfQl9IRFJfVkRPX0ZFMV9ETF9BU1lO
QyA1Mgo+ID4gKyNkZWZpbmUgTVQ4MTk1X1ZET1NZUzFfU1cxX1JTVF9CX0hEUl9HRlhfRkUwX0RM
X0FTWU5DIDUzCj4gPiArI2RlZmluZSBNVDgxOTVfVkRPU1lTMV9TVzFfUlNUX0JfSERSX0dGWF9G
RTFfRExfQVNZTkMgNTQKPiA+ICsjZGVmaW5lIE1UODE5NV9WRE9TWVMxX1NXMV9SU1RfQl9IRFJf
VkRPX0JFX0RMX0FTWU5DIDU1Cj4gCj4gTWF5YmUgeW91IHNob3VsZCBhbGlnbiB0aGUgaW5kZW50
IHN0eWxlIHdpdGggVE9QUkdVLgo+IAo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPiAKT0ssIEkg
d2lsbCBtb2RpZnkgaXQgaW4gdGhlIG5leHQgcmV2aXNpb24uCgpSZWdhcmRzLApOYW5jeSBMaW4K
Cj4gPiArCj4gPiAgI2VuZGlmICAvKiBfRFRfQklORElOR1NfUkVTRVRfQ09OVFJPTExFUl9NVDgx
OTUgKi8KPiA+IC0tCj4gPiAyLjE4LjAKPiA+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
