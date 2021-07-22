Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54928C63797
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 14:15:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DA986128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 14:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DA986128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zv/yeBNvXXwL5m9kPI4P88L9RqaNJFpCebO/RjlHck0=; b=YX74A5RZcszgY1
	XIpoBkXHX7iiNYjaxM90+V5KrrRHsUlUXriZMuW8WIiP1pUz5Y8+mVVsmr9KM0YVTKN66o9GDLEyI
	0NvZOGxRfYDzIkC53dcFZBH5fy6xlWSoyW3QRnx0DlMZvxHwjf3o/1kvAX+4F6PzucBon8LOVkZIu
	pdGenrl3oMVgiiMjnILRGL4zbKHe41iGHpcSL0butkGpIns4AbTpqED8sqt2Hk84M8htAj6JvSXcx
	/Cnv1dlaw98A2F8BuOhGOOr0m6YZ/e+o3IrIWc2hsf0gkMvK7cXL2pw0a4n4T6ZeJ87j5bK/tz+3W
	DlBs+LPKhMxfb+FVGPgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6ZUB-001rVP-2K; Thu, 22 Jul 2021 14:15:39 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6ZU7-001rUT-LI
 for linux-mediatek@lists.infradead.org; Thu, 22 Jul 2021 14:15:37 +0000
Received: from smtpclient.apple (p5b3d2eb8.dip0.t-ipconnect.de [91.61.46.184])
 by mail.holtmann.org (Postfix) with ESMTPSA id B8D5FCECDC;
 Thu, 22 Jul 2021 16:15:33 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH] Bluetooth: btusb: Add support for Foxconn Mediatek Chip
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210708131214.695458-1-aaron.ma@canonical.com>
Date: Thu, 22 Jul 2021 16:15:33 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, matthias.bgg@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Message-Id: <E6EC3615-DAC0-4267-AD9B-3B0604EDAD87@holtmann.org>
References: <20210708131214.695458-1-aaron.ma@canonical.com>
To: Aaron Ma <aaron.ma@canonical.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_071535_920335_74FC5703 
X-CRM114-Status: GOOD (  11.70  )
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

SGkgQWFyb24sCgo+IEFkZCBzdXBwb3J0IGZvciBhbm90aGVyIEZveGNvbm4gLyBIb24gSGFpIGRl
dmljZSB3aXRoIE1UNzkyMSBjaGlwLgo+IAo+IFQ6ICBCdXM9MDUgTGV2PTAxIFBybnQ9MDEgUG9y
dD0wMyBDbnQ9MDIgRGV2Iz0gIDMgU3BkPTQ4MCAgTXhDaD0gMAo+IEQ6ICBWZXI9IDIuMTAgQ2xz
PWVmKG1pc2MgKSBTdWI9MDIgUHJvdD0wMSBNeFBTPTY0ICNDZmdzPSAgMQo+IFA6ICBWZW5kb3I9
MDQ4OSBQcm9kSUQ9ZTBjZCBSZXY9IDEuMDAKPiBTOiAgTWFudWZhY3R1cmVyPU1lZGlhVGVrIElu
Yy4KPiBTOiAgUHJvZHVjdD1XaXJlbGVzc19EZXZpY2UKPiBTOiAgU2VyaWFsTnVtYmVyPTAwMDAw
MDAwMAo+IEM6KiAjSWZzPSAzIENmZyM9IDEgQXRyPWUwIE14UHdyPTEwMG1BCj4gQTogIEZpcnN0
SWYjPSAwIElmQ291bnQ9IDMgQ2xzPWUwKHdsY29uKSBTdWI9MDEgUHJvdD0wMQo+IEk6KiBJZiM9
IDAgQWx0PSAwICNFUHM9IDMgQ2xzPWUwKHdsY29uKSBTdWI9MDEgUHJvdD0wMSBEcml2ZXI9YnR1
c2IKPiBFOiAgQWQ9ODEoSSkgQXRyPTAzKEludC4pIE14UFM9ICAxNiBJdmw9MTI1dXMKPiBFOiAg
QWQ9ODIoSSkgQXRyPTAyKEJ1bGspIE14UFM9IDUxMiBJdmw9MG1zCj4gRTogIEFkPTAyKE8pIEF0
cj0wMihCdWxrKSBNeFBTPSA1MTIgSXZsPTBtcwo+IEk6KiBJZiM9IDEgQWx0PSAwICNFUHM9IDIg
Q2xzPWUwKHdsY29uKSBTdWI9MDEgUHJvdD0wMSBEcml2ZXI9YnR1c2IKPiBFOiAgQWQ9ODMoSSkg
QXRyPTAxKElzb2MpIE14UFM9ICAgMCBJdmw9MW1zCj4gRTogIEFkPTAzKE8pIEF0cj0wMShJc29j
KSBNeFBTPSAgIDAgSXZsPTFtcwo+IEk6ICBJZiM9IDEgQWx0PSAxICNFUHM9IDIgQ2xzPWUwKHds
Y29uKSBTdWI9MDEgUHJvdD0wMSBEcml2ZXI9YnR1c2IKPiBFOiAgQWQ9ODMoSSkgQXRyPTAxKElz
b2MpIE14UFM9ICAgOSBJdmw9MW1zCj4gRTogIEFkPTAzKE8pIEF0cj0wMShJc29jKSBNeFBTPSAg
IDkgSXZsPTFtcwo+IEk6ICBJZiM9IDEgQWx0PSAyICNFUHM9IDIgQ2xzPWUwKHdsY29uKSBTdWI9
MDEgUHJvdD0wMSBEcml2ZXI9YnR1c2IKPiBFOiAgQWQ9ODMoSSkgQXRyPTAxKElzb2MpIE14UFM9
ICAxNyBJdmw9MW1zCj4gRTogIEFkPTAzKE8pIEF0cj0wMShJc29jKSBNeFBTPSAgMTcgSXZsPTFt
cwo+IEk6ICBJZiM9IDEgQWx0PSAzICNFUHM9IDIgQ2xzPWUwKHdsY29uKSBTdWI9MDEgUHJvdD0w
MSBEcml2ZXI9YnR1c2IKPiBFOiAgQWQ9ODMoSSkgQXRyPTAxKElzb2MpIE14UFM9ICAyNSBJdmw9
MW1zCj4gRTogIEFkPTAzKE8pIEF0cj0wMShJc29jKSBNeFBTPSAgMjUgSXZsPTFtcwo+IEk6ICBJ
ZiM9IDEgQWx0PSA0ICNFUHM9IDIgQ2xzPWUwKHdsY29uKSBTdWI9MDEgUHJvdD0wMSBEcml2ZXI9
YnR1c2IKPiBFOiAgQWQ9ODMoSSkgQXRyPTAxKElzb2MpIE14UFM9ICAzMyBJdmw9MW1zCj4gRTog
IEFkPTAzKE8pIEF0cj0wMShJc29jKSBNeFBTPSAgMzMgSXZsPTFtcwo+IEk6ICBJZiM9IDEgQWx0
PSA1ICNFUHM9IDIgQ2xzPWUwKHdsY29uKSBTdWI9MDEgUHJvdD0wMSBEcml2ZXI9YnR1c2IKPiBF
OiAgQWQ9ODMoSSkgQXRyPTAxKElzb2MpIE14UFM9ICA0OSBJdmw9MW1zCj4gRTogIEFkPTAzKE8p
IEF0cj0wMShJc29jKSBNeFBTPSAgNDkgSXZsPTFtcwo+IEk6ICBJZiM9IDEgQWx0PSA2ICNFUHM9
IDIgQ2xzPWUwKHdsY29uKSBTdWI9MDEgUHJvdD0wMSBEcml2ZXI9YnR1c2IKPiBFOiAgQWQ9ODMo
SSkgQXRyPTAxKElzb2MpIE14UFM9ICA2MyBJdmw9MW1zCj4gRTogIEFkPTAzKE8pIEF0cj0wMShJ
c29jKSBNeFBTPSAgNjMgSXZsPTFtcwo+IEk6KiBJZiM9IDIgQWx0PSAwICNFUHM9IDIgQ2xzPWUw
KHdsY29uKSBTdWI9MDEgUHJvdD0wMSBEcml2ZXI9KG5vbmUpCj4gRTogIEFkPThhKEkpIEF0cj0w
MyhJbnQuKSBNeFBTPSAgNjQgSXZsPTEyNXVzCj4gRTogIEFkPTBhKE8pIEF0cj0wMyhJbnQuKSBN
eFBTPSAgNjQgSXZsPTEyNXVzCj4gSTogIElmIz0gMiBBbHQ9IDEgI0VQcz0gMiBDbHM9ZTAod2xj
b24pIFN1Yj0wMSBQcm90PTAxIERyaXZlcj0obm9uZSkKPiBFOiAgQWQ9OGEoSSkgQXRyPTAzKElu
dC4pIE14UFM9IDUxMiBJdmw9MTI1dXMKPiBFOiAgQWQ9MGEoTykgQXRyPTAzKEludC4pIE14UFM9
IDUxMiBJdmw9MTI1dXMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBYXJvbiBNYSA8YWFyb24ubWFAY2Fu
b25pY2FsLmNvbT4KPiAtLS0KPiBkcml2ZXJzL2JsdWV0b290aC9idHVzYi5jIHwgMyArKysKPiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Ymx1ZXRvb3RoL2J0dXNiLmMgYi9kcml2ZXJzL2JsdWV0b290aC9idHVzYi5jCj4gaW5kZXggYTk4
NTVhMmRkNTYxLi4yNDA0NjNkMGUzNjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ibHVldG9vdGgv
YnR1c2IuYwo+ICsrKyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMKPiBAQCAtNDE0LDYgKzQx
NCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCBibGFja2xpc3RfdGFibGVb
XSA9IHsKPiAJeyBVU0JfREVWSUNFKDB4MDRjYSwgMHgzODAyKSwgLmRyaXZlcl9pbmZvID0gQlRV
U0JfTUVESUFURUsgfAo+IAkJCQkJCSAgICAgQlRVU0JfV0lERUJBTkRfU1BFRUNIIHwKPiAJCQkJ
CQkgICAgIEJUVVNCX1ZBTElEX0xFX1NUQVRFUyB9LAo+ICsJeyBVU0JfREVWSUNFKDB4MDQ4OSwg
MHhlMGNkKSwgLmRyaXZlcl9pbmZvID0gQlRVU0JfTUVESUFURUsgfAo+ICsJCQkJCQkgICAgIEJU
VVNCX1dJREVCQU5EX1NQRUVDSCB8Cj4gKwkJCQkJCSAgICAgQlRVU0JfVkFMSURfTEVfU1RBVEVT
IH0sCgpwYXRjaCBkb2VzbuKAmXQgbm90IGFwcGx5IGNsZWFubHkgdG8gYmx1ZXRvb3RoLW5leHQg
dHJlZSwgcGxlYXNlIHJlYmFzZSBpdC4KClJlZ2FyZHMKCk1hcmNlbAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
