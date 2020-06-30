Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6496C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 07:29:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CCF320759
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 07:29:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yjaEJmGz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hALw+ltj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CCF320759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YInIqHXfu+K71ne5jQrdjlG2hz0m+sIWcnOh/EIKvMY=; b=yjaEJmGz/vxH6Esq9ueQm1xAI
	CeybVuXPzCiwHb7GbrPpii7QUdMmeg+xeIvjSpGnrm7KW2HItFkHpqnikd4uUigsqZcrRl+05Y6re
	UOji4/zG4T+pv75FJCA+aRK1pdWrgjO06XrPh9Yfv0tTxWFrOq2W2e6NgFAqO3LCA3Trvj3i6iKL2
	Jv0te/15YDLJepM1o+GwVoKK79MSdT41sWdE3LlYcxvOL/VD2ALfl+6YFecnlJesUxQiYjpTUG3yP
	K78T7ZGoUL40sisi6laMtLbiLO5ZrvicDmoAY/7m9kENAde13tGOchlJy/+K4RQGdRzwJLG5eYavD
	/OWHgF7fQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqAhv-0004uR-1d; Tue, 30 Jun 2020 07:29:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqAhs-0004sp-H5; Tue, 30 Jun 2020 07:29:29 +0000
X-UUID: 649e0299a42041fda2408b28ec83bdc9-20200629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HAx+5BTPXfGNqdXAn2CnRwU8idpAgHvW4EJmH0eOK5s=; 
 b=hALw+ltjvCgo8K/x7tJTs59w+VHEF1BeidKYbG+3dl16gCt4nF5/f+X3+aoZYd2nxcqrWle0FDoYIqIDtNXQqCaNLwwJk+SrF8+z4sgg6gB3/qRd+M6ebb8nciyv0bU/mC7oJM/WQ2YD0q6iJIVtLof9BCfu4/HkqN4ogCvrBCM=;
X-UUID: 649e0299a42041fda2408b28ec83bdc9-20200629
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 280348949; Mon, 29 Jun 2020 23:29:15 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 00:29:20 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 30 Jun 2020 15:29:18 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 15:29:17 +0800
Message-ID: <1593502139.23885.5.camel@mhfsdcap03>
Subject: Re: [PATCH 2/2] usb: mtu3: fix NULL pointer dereference
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 30 Jun 2020 15:28:59 +0800
In-Reply-To: <99fc1f6e-7907-6723-612a-8b68ffa871e5@web.de>
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
 <1593410434-19406-2-git-send-email-chunfeng.yun@mediatek.com>
 <99fc1f6e-7907-6723-612a-8b68ffa871e5@web.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C01562A8C5541EC7257F9E298FE7512CE55EAEBA0420D98040392F23F24A9DAF2000:8
X-MTK: N
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
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIwLTA2LTI5IGF0IDEwOjAwICswMjAwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToN
Cj4gPiBTb21lIHBvaW50ZXJzIGFyZSBkZXJlZmVyZW5jZWQgYmVmb3JlIHN1Y2Nlc3NmdWwgY2hl
Y2tzLg0KPiANCj4gSSBzdWdnZXN0IHRvIHJlY29uc2lkZXIgYW5kIGltcHJvdmUgdGhlIGNoYW5n
ZSBkZXNjcmlwdGlvbi4NCj4gDQo+ICogV291bGQgYSBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2Ug
YmUgcG9zc2libGUgb25seSB3aXRoIHRoZSB2YXJpYWJsZXMg4oCcbWVw4oCdDQo+ICAgYW5kIOKA
nG1yZXHigJ0gaW4gdGhlIGltcGxlbWVudGF0aW9uIG9mIHRoZSBmdW5jdGlvbiDigJxtdHUzX2dh
ZGdldF9kZXF1ZXVl4oCdPw0KPiANCj4gKiBIb3cgZG8geW91IHRoaW5rIGFib3V0IHRvIGFkanVz
dCBhbnkgbW9yZSB2YXJpYWJsZSBpbml0aWFsaXNhdGlvbnM/DQpZZXMsIEknbGwgZG8gaXQgaWYg
bmVlZCwgdGhhbmtzDQoNCj4gDQo+ICogV2lsbCBpdCBiZWNvbWUgaGVscGZ1bCB0byBhZGQgdGhl
IHRhZyDigJxGaXhlc+KAnSB0byB0aGUgY29tbWl0IG1lc3NhZ2U/DQpNYXliZSBuZWVkbid0DQoN
Cj4gDQo+IFJlZ2FyZHMsDQo+IE1hcmt1cw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
