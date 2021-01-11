Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547C7C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 08:22:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A80522A85
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 08:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A80522A85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jrr0q9n+VAzCLb5hEtqWYK7Si66l7IX+gBH+pQty5gs=; b=mwc4P6bSQJVdOJfqxQeyzOpTx
	m9cwKzAUGdAk/QQFB5ZsNVRDSqUqRBI05TDOD+p+uTZmW7WtRNmcjfThvdOIP+BNOqxeSPAK9wTl8
	QHcWLJcl+s0DgcAkgIRO6VbV78WDQvJWTcfF7R4QZPTY0D0bugYjAgyXVwjOd0l34pjLhK44l2vgz
	HqSvhNX5mDhXVY0MKPawVv3isThjV9oiKXo0m5ciWMbtgGlMgZcxI4OVCvSNbtX3mUfg0K29Ic9jO
	tKHewqz9bChgYBArr9fug8EE0OqkfuIOQqoZxF18PVaUWPc8MGRZJW3cNLjmmf8ejwoE9dLY8raEz
	z8OlTmF2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kysSm-00077Q-IE; Mon, 11 Jan 2021 08:22:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kysSj-000740-0Y
 for linux-mediatek@lists.infradead.org; Mon, 11 Jan 2021 08:22:06 +0000
X-UUID: fa72da7e851e4c2fa01097eaec608c6e-20210111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hfz1Dwq0tE2ZcwV0URZ7GdXGBVL9FzFRfW0ZiLdnv8k=; 
 b=YyNDaOwnoaLhZQG8xA6S6/EYNU0ishjZUqTqRBI3xxr4lFShKtz2mrtVPtnMU6+lo4X2KQ0AcFPVFrEQYyOQS+mLKR822G1BEsQrOwnXWu48uYwZA3Trxu7aEh6966NiuT9qKixwvwFwbzB3hBwrk1+qpRdNao/RO26DvALyJo4=;
X-UUID: fa72da7e851e4c2fa01097eaec608c6e-20210111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <skylake.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2098314076; Mon, 11 Jan 2021 00:21:58 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 00:11:56 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 16:11:54 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 16:11:54 +0800
Message-ID: <1610352714.9738.14.camel@mtksdccf07>
Subject: Re: FW: [PATCH] dts64: mt7622: fix slow sd card access
From: SkyLake Huang <skylake.huang@mediatek.com>
To: <linux-mediatek@lists.infradead.org>
Date: Mon, 11 Jan 2021 16:11:54 +0800
In-Reply-To: <630fc8584a2f426d9fce6b900a337918@mtkmbs05n1.mediatek.inc>
References: <20210109190937.42409-1-linux@fw-web.de>
 <630fc8584a2f426d9fce6b900a337918@mtkmbs05n1.mediatek.inc>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_032205_271337_0E561CBB 
X-CRM114-Status: GOOD (  17.14  )
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
Cc: devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyMDIxLTAxLTEwIGF0IDAzOjEwICswODAwLCBGcmFuayBXdW5kZXJsaWNoIHdyb3Rl
Og0KPiBGcm9tOiBMaW51eC1tZWRpYXRlayBbbWFpbHRvOmxpbnV4LW1lZGlhdGVrLWJvdW5jZXNA
bGlzdHMuaW5mcmFkZWFkLm9yZ10gT24gQmVoYWxmIE9mIEZyYW5rIFd1bmRlcmxpY2gNCj4gU2Vu
dDogU3VuZGF5LCBKYW51YXJ5IDEwLCAyMDIxIDM6MTAgQU0NCj4gVG86IGxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBS
eWRlciBMZWUgPFJ5ZGVyLkxlZUBtZWRpYXRlay5jb20+OyBXZW5iaW4gTWVpIDxXZW5iaW4uTWVp
QG1lZGlhdGVrLmNvbT47IFdlbmppZSBIdSA8b3Rfd2VuamllLmh1QG1lZGlhdGVrLmNvbT47IEZy
YW5rIFd1bmRlcmxpY2ggPGZyYW5rLXdAcHVibGljLWZpbGVzLmRlPjsgU2VhbiBXYW5nIDxTZWFu
LldhbmdAbWVkaWF0ZWsuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgUm9iIEhl
cnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT47IEppbWlu
IFdhbmcgKOaxqua1juawkSkgPEppbWluLldhbmdAbWVkaWF0ZWsuY29tPg0KPiBTdWJqZWN0OiBb
UEFUQ0hdIGR0czY0OiBtdDc2MjI6IGZpeCBzbG93IHNkIGNhcmQgYWNjZXNzDQo+IA0KPiBGcm9t
OiBGcmFuayBXdW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5kZT4NCj4gDQo+IC0gY2hh
bmdlIHNkY2FyZCAobW1jMSkgdG8gdWhzIGJ5IGNoYW5nZSB2cW1tYy1zdXBwbHkgdG8gMVY4IGJl
Y2F1c2UgZHJpdmVyDQo+ICAgbWFwcyBwaW5jdHJsIGRlcGVuZGluZyBvbiB0aGlzDQo+IC0gYWRk
IHJlc2V0LWNvbnRyb2wgZm9yIG1tYzEgbGlrZSBpdCdzIGRvbmUgZm9yIG1tYzAvZW1tYw0KPiAN
Cj4gRml4ZXM6IDJjMDAyYTMwNDlmNyAoImFybTY0OiBkdHM6IG10NzYyMjogYWRkIG1tYyByZWxh
dGVkIGRldmljZSBub2RlcyIpDQo+IEZpeGVzOiAwYjYyODZkZDk2YzAgKCJhcm02NDogZHRzOiBt
dDc2MjI6IGFkZCBiYW5hbmFwaSBCUEktUjY0IGJvYXJkIikNCj4gU2lnbmVkLW9mZi1ieTogRnJh
bmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+DQo+IC0tLQ0KPiAgYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2MjItYmFuYW5hcGktYnBpLXI2NC5kdHMgfCAzICsr
LQ0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaSAgICAgICAgICAg
ICAgICAgfCAyICsrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsv
bXQ3NjIyLWJhbmFuYXBpLWJwaS1yNjQuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDc2MjItYmFuYW5hcGktYnBpLXI2NC5kdHMNCj4gaW5kZXggMmY3N2RjNDBiOWI4Li45MTZj
YTg5YWI4ZWIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3
NjIyLWJhbmFuYXBpLWJwaS1yNjQuZHRzDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ3NjIyLWJhbmFuYXBpLWJwaS1yNjQuZHRzDQo+IEBAIC0yMzIsMTAgKzIzMiwxMSBA
QCAmbW1jMSB7DQo+ICBidXMtd2lkdGggPSA8ND47DQo+ICBtYXgtZnJlcXVlbmN5ID0gPDUwMDAw
MDAwPjsNCj4gIGNhcC1zZC1oaWdoc3BlZWQ7DQo+ICttbWMtaHMyMDAtMV84djsNCj4gIHJfc21w
bCA9IDwxPjsNCj4gIGNkLWdwaW9zID0gPCZwaW8gODEgR1BJT19BQ1RJVkVfTE9XPjsNCj4gIHZt
bWMtc3VwcGx5ID0gPCZyZWdfM3Azdj47DQo+IC12cW1tYy1zdXBwbHkgPSA8JnJlZ18zcDN2PjsN
Cj4gK3ZxbW1jLXN1cHBseSA9IDwmcmVnXzFwOHY+Ow0KPiAgYXNzaWduZWQtY2xvY2tzID0gPCZ0
b3Bja2dlbiBDTEtfVE9QX01TREMzMF8xX1NFTD47DQo+ICBhc3NpZ25lZC1jbG9jay1wYXJlbnRz
ID0gPCZ0b3Bja2dlbiBDTEtfVE9QX1VOSVY0OE0+OyAgfTsgZGlmZiAtLWdpdCBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3NjIyLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210NzYyMi5kdHNpDQo+IGluZGV4IDViOWVjMDMyY2U4ZC4uN2M2ZDg3MTUzOGE2IDEw
MDY0NA0KDQptdDc2MjIncyBTRC9NTUMgaG9zdCBjb250cm9sbGVyIGRvZXNuJ3Qgc3VwcG9ydCBV
SFMtMSBtb2RlIGZvciBTRCBjYXJkLg0KVG8gbWVldCBjb21wYXRpYmlsaXR5IG9mIG10ay1zZC5j
IGRyaXZlciwgd2hpY2ggaXMgYWxzbyB1c2VkIG9uIG90aGVyDQpwbGF0Zm9ybXMgYmVzaWRlcyBt
dDc2MjIsIHdlIGFkZCBwaW5jdHJsLTEgc2V0IGluIG10NzYyMiAmIGJhbmFuYSBwaSdzDQpkdHMu
IEJ1dCBhY3R1YWxseSB3ZSBkb24ndCB1c2UgVUhTLTEgcGluIHNldHRpbmdzIG9uIG10NzYyMi4g
U28gdGhlcmUncw0Kbm8gbmVlZCB0byBzZXQgdnFtbWMtc3VwcGx5IHRvIDEuOFYNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
