Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA8DC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 11:08:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA8BA60249
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 11:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA8BA60249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u1CFFoLHvFe3bvoPJChitHnSknpJ9cxH63ANE4C5nvU=; b=qDk42LDWIdkmrY
	v4t98Y+TgxlDmvlN1kKJmWLwKYhDHtWG5wMOrsvFw7M9JCoxPUh2v64g4f12csJlwFmV15W8RnDpA
	H34J1bO1BkI2oLQRmaRq8GuGc9AUm3QLAIanPuWx6iuDHU9zluC7TAENybTXVp3xJf8pAGZkFUKww
	XHA5Urb2WzZzYYdsPstrJIT9BbxVrAuMZwOD6E/8YOtIpoPlagHwHo6qrSSu+uX5XsWJpW0DZQTWc
	FtmGK8aNz/yJTiuKUi0VlAP69g/2BcEtOsr/09Tgkn05JO8JVL6HYeELRPbfD/Vzjnjc39Olh/N1T
	ScQGeSmMdvnPGXMc3/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL1dF-0026q0-6a; Tue, 31 Aug 2021 11:08:45 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL1cz-0026jU-4u; Tue, 31 Aug 2021 11:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1630408097;
 bh=Q3naRGFUOjCanc3SPmyynPd1C68uqCO9v6By/oLNW38=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kVsBeUZNmAPdaHNjse2sCbByppVde/dWY7PXtV4t/LrCMMOvP60GIoJRGoRa22QZJ
 cZOB2XUkIXPJbyu28As0fL7Qw9I/tIAgZHxCnZt4KZoRoHTe51QJWjcr1gWgeJINVO
 Vhisjj03G5J+Q0gprH68HeJVL8hKojfMWengWYZg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.77.109] ([80.245.77.109]) by web-mail.gmx.net
 (3c-app-gmx-bap45.server.lan [172.19.172.115]) (via HTTP); Tue, 31 Aug 2021
 13:08:17 +0200
MIME-Version: 1.0
Message-ID: <trinity-2f57e648-cb42-4116-b3d0-6fcdbaae81b6-1630408097512@3c-app-gmx-bap45>
From: Frank Wunderlich <frank-w@public-files.de>
To: Sungbo Eo <mans0n@gorani.run>
Cc: linux-mediatek@lists.infradead.org,
 =?UTF-8?Q?Chunfeng_Yun_=28=E4=BA=91=E6=98=A5=E5=B3=B0=29?=
 <Chunfeng.Yun@mediatek.com>, "b-liu@ti.com" <b-liu@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Subject: Aw: Re: [PATCH v4 1/2] arm: dts: mt7623: add musb device nodes
Date: Tue, 31 Aug 2021 13:08:17 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <3d57ae38-9d8f-05e3-c5b3-58db73879f16@gorani.run>
References: <20210822041333.5264-1-mans0n@gorani.run>
 <20210830155903.13907-1-mans0n@gorani.run>
 <20210830155903.13907-2-mans0n@gorani.run>
 <16f980b95e1f32bb8eb32448f1615bafdc51b792.camel@mediatek.com>
 <14C40B35-3607-49C6-970B-441F9093125A@public-files.de>
 <3d57ae38-9d8f-05e3-c5b3-58db73879f16@gorani.run>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:HA2wZfkN2riithVmFwnSZ1/BfJwDAEJS8KaCZjTcOXMuMyr9Gv/w9eOyIEvnZbjTlkOb2
 vumjUULx8/phJD0+woWFe1xD7+8R+XLKYMF83XtNeqqBI813PI4r6hvfNVW1TDkbUFa2EwbPE9ip
 GBNsRWIGFnfeTEA8x4VRpZr2BGweCPlo5xVDymNE2/CZmJLnpmZlDJhUhDwC4mo/7h3xHu01P4t1
 IiBGIlVGyTabd4CwcHfa4FMKX8x/D6esWx4SFYd3NRNG50QU15EEvPhzJ8iHC8hjkhT1O5NgECJC
 C8=
X-UI-Out-Filterresults: notjunk:1;V03:K0:Poez8dKN2Fw=:TmHdTsCV04OMxVmZdrDObR
 ljsE7K/UT/WJY4VBRUIYbDjME8YThAhmAavEdnbOV+S2kHr7jpKWPFZ4zVwabv8CsGfJ8Zm6R
 QR0FgcQVrUocmDWdT9Sbp3AReNMesw0s0uhWfm4R+u8N+R5vYkkk70SSqiSQGo4a6pDvywMTB
 WPBhhOa9PcUaM2W0iUXviEg+0OyW63WpxeBtYOiMjrHeOEQG46i+lDNZ0W8kGNPZwEUy0Dr7h
 eky56x0gJxbdswAHByKqPrGKAkmdsAH8F9HIou6Jh9YdiUbLVKhOV7uJ45+nJxuU/vUchmK5j
 mg11k/W2Y0Jcagxf45gjj6WWMk8tiDWpWrPw9ISn2s51nzRjGt+WmbdH5N+xYWbsZE4Rjbqyw
 y2OyV3jV8zzM8rq5KyA5XrqeAEcG8MXv/zuXGOq/bnL1rAalmuLEPxC3x+Hu84lY9UwqyHo5t
 fgyqh20CQG53CgF/BJIVzMi5gJlvnuzv/U3Nc1/Rh084XWC+9q7Mi0aK0/h/f13Zyoll5xc24
 yZo7oDieGt2NlZ8GnXIUpes/4MnmmxHppiW1Y/+vbK4gZCobuNaKEwYOj1kQ60me4s/xu/2uE
 /2xHc1sPDZnPIQbbz68YA7Z0TIoQvHrtiF2HW2+IOq/GTwktdExMkOZo/g+aMjeQefH5mWQvm
 GnqvhV6uVq0stZ+qkP1GuSTtT13FSvwrLIO6S1MZMPyaCngvF8y2TDdAUujtp1L/u7/mGwQTf
 /dsSYvFhX64gNL6ZL2sTN+BmCMuITrto0dmmPXMr2AapkINAm16IDK+zDByXfjcGnr7jf2FYA
 Hz+fGpon/jpPamoPSf98b8PABwQzfJyjzLuKO24ZfK3lI3pyzc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_040829_532841_C959447D 
X-CRM114-Status: GOOD (  15.32  )
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

PiBHZXNlbmRldDogRGllbnN0YWcsIDMxLiBBdWd1c3QgMjAyMSB1bSAxMzowMiBVaHIKPiBWb246
ICJTdW5nYm8gRW8iIDxtYW5zMG5AZ29yYW5pLnJ1bj4KPiBPbiAyMDIxLTA4LTMxIDE3OjU5LCBG
cmFuayBXdW5kZXJsaWNoIHdyb3RlOgo+ID4gQW0gMzEuIEF1Z3VzdCAyMDIxIDA4OjI3OjE4IE1F
U1ogc2NocmllYiAiQ2h1bmZlbmcgWXVuICjkupHmmKXls7ApIiA8Q2h1bmZlbmcuWXVuQG1lZGlh
dGVrLmNvbT46Cgo+ID4gSSBkb24ndCBzZWUgWzFdIChhY2sgZnJvbSByb2IpIGluIFsyXS9bM10K
PiAKPiBZb3UgY2FuIGZpbmQgaXQgaGVyZS4KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9ncmVna2gvdXNiLmdpdC9sb2cvP2g9dXNiLW5leHQKPiAKPiA+
IAo+ID4gQHN1bmdibzogcGxlYXNlIGxlYXZlIGR0LWJpbmRpbmdzIHBhdGNoIGluIHNlcmllcy4K
PiAKPiBJJ2xsIGtlZXAgaXQgZm9yIGEgd2hpbGUsIHRoZW4uCgpvaywgdGhlbiBpdCBpcyBub3Qg
bmVlZGVkIGFnYWluLi4uaGF2ZSBub3Qgc2VhcmNoZWQgaW4gdXNiLXRyZWUuCgo+ID4gWW91IG5l
ZWQgbm8gbmV3IHZlcnNpb24gb25seSBmb3IgYWRkaW5nIHRhZ3MgKGFja2VkLHRlc3RlZCBvciBy
ZXZpZXdlZCkuCj4gPiBPbmx5IGZvciBjb2RlLWNoYW5nZXMsYnV0IHRoZW4gYWRkIHRhZ3MgZnJv
bSBwcmV2aW91cyB2ZXJzaW9ucy4KPiAKPiBHb3QgaXQuIFRoYW5rcyBmb3IgdGhlIHRpcC4gOikK
PiAKPiA+IEltaG8gaXQgaXMgYmV0dGVyIHRvIHRha2UgbXkgbXVzYiBwYXRjaCBbNF0KPiA+IGlu
dG8gdGhlIHNlcmllcyBhcyB3ZWxsIHRvIG1ha2UgZGVwZW5jeSBjbGVhbmVyCj4gCj4gT2theSwg
SSdsbCB0YWtlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uCgpva2F5LCBpZiBkdC1iaW5kaW5ncyBp
cyBhbHJlYWR5IGluIHVzYi10cmVlIHdhaXQgd2hhdCBtYWludGFpbmVycyAobWF0dGhpYXMvcm9i
KSBzYXlzIGFib3V0IGFkZGluZyBteSBwYXRjaCB0byBhIG5ldyB2ZXJzaW9uIG9mIHlvdXIgc2Vy
aWVzIG9yIGlmIHRoaXMgaXMgY2xlYXIgbm93IDopCgo+ID4gWzFdIGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDIxMDgwODEyMzg0MC4x
NzY3MzgtMi1tYW5zMG5AZ29yYW5pLnJ1bi8KPiA+IFsyXSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9yb2JoL2xpbnV4LmdpdC9sb2cvP2g9Zm9yLW5leHQK
PiA+IFszXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9t
YXR0aGlhcy5iZ2cvbGludXguZ2l0L2xvZy8/aD1mb3ItbmV4dAo+ID4gWzRdIGh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDIxMDgzMDE0
NTk1OC4xMDg2MDUtMS1saW51eEBmdy13ZWIuZGUvCj4gPiByZWdhcmRzIEZyYW5rCj4gPiAKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
