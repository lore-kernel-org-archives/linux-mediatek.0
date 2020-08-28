Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA01C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 09:39:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EACA32075B
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 09:39:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g/T9efzn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EACA32075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0NT3SDIim6Ibqh0RZKiwYGkDzsr03Z9mWDv/UnL6GcY=; b=g/T9efznpigV4eASMOgNgQbns
	FOLkUL8d46C0GOEN1Ffjw6641DfG2w1dUrUhULJnrWIxDuWbZDh1QxP5+YyuqH97AM3y/KzIBm5jO
	uqarvMeyyDTplO2+hfAUwpaXPyuIkFw91od0p+7O6/DHs8fuFazecUT4+P/c9U+vfAoFu4JOz4oZZ
	2WVp2e9foG0xuirHl50KB7xANhY5/j5Lv0lhZZNWkMg/D88JEOHDYsR4TuZiiT8zDHMlupFHZmw5/
	TMjIGp4MzTOV1LZf2VCAyOEiSXJBvyV0zlBg5D8MeY8W8vm7zoLK//W5bXYvOTxCQ+6uO3u6OWGNK
	Yl1DGg1tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBaqj-0006a5-Ep; Fri, 28 Aug 2020 09:39:09 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBaqe-0006Xr-S9; Fri, 28 Aug 2020 09:39:06 +0000
IronPort-SDR: 2vywx9D74CZs45R5mIMrtragDQHUXNRdrwVNMc2BlZdS/Bkzsz5KFqz4n9d7mTu6RecmHJXpGp
 ImIWcnTwL96Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="144313135"
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; d="scan'208";a="144313135"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 02:39:00 -0700
IronPort-SDR: Ut9KRfr4SGf5laRD8mXE62p6pqgQNERWE+yGTMCfW8KYu4yXQeHj+qtfoFsXkYjybPwXWFLHXe
 7KTlR1hVvZmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; d="scan'208";a="403704515"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 28 Aug 2020 02:38:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 28 Aug 2020 12:38:35 +0300
Date: Fri, 28 Aug 2020 12:38:35 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: ChiYuan Huang <u0084500@gmail.com>
Subject: Re: [PATCH v3 1/3] usb typec: mt6360: Add support for mt6360 Type-C
 driver
Message-ID: <20200828093835.GC174928@kuha.fi.intel.com>
References: <1598527137-6915-1-git-send-email-u0084500@gmail.com>
 <20200827140001.GE813478@kuha.fi.intel.com>
 <CADiBU393V_iQw_8Hx2braL=8QpvQuTY0059C-XkqmjO9W=aBgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADiBU393V_iQw_8Hx2braL=8QpvQuTY0059C-XkqmjO9W=aBgQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_053905_079566_E298FAF9 
X-CRM114-Status: GOOD (  22.72  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang <cy_huang@richtek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBdWcgMjcsIDIwMjAgYXQgMTA6NTE6NDNQTSArMDgwMCwgQ2hpWXVhbiBIdWFuZyB3
cm90ZToKPiBIZWlra2kgS3JvZ2VydXMgPGhlaWtraS5rcm9nZXJ1c0BsaW51eC5pbnRlbC5jb20+
IOaWvCAyMDIw5bm0OOaciDI35pelIOmAseWbmyDkuIvljYgxMDowMOWvq+mBk++8mgo+ID4KPiA+
IE9uIFRodSwgQXVnIDI3LCAyMDIwIGF0IDA3OjE4OjU1UE0gKzA4MDAsIGN5X2h1YW5nIHdyb3Rl
Ogo+ID4gPiBGcm9tOiBDaGlZdWFuIEh1YW5nIDxjeV9odWFuZ0ByaWNodGVrLmNvbT4KPiA+ID4K
PiA+ID4gTWVkaWF0ZWsgTVQ2MzYwIGlzIGEgbXVsdGktZnVuY3Rpb25hbCBJQyB0aGF0IGluY2x1
ZGVzIFVTQiBUeXBlLUMuCj4gPiA+IEl0IHdvcmtzIHdpdGggVHlwZS1DIFBvcnQgQ29udHJvbGxl
ciBNYW5hZ2VyIHRvIHByb3ZpZGUgVVNCIFBECj4gPiA+IGFuZCBVU0IgVHlwZS1DIGZ1bmN0aW9u
YWxpdGllcy4KPiA+ID4KPiA+ID4gdjEgdG8gdjIKPiA+ID4gMS4gQWRkIGZpeCB0byBQcmV2ZW50
IHRoZSByYWNlIGNvbmRpdGlvbiBmcm9tIGludGVycnVwdCBhbmQgdGNwY2kgcG9ydAo+ID4gPiB1
bnJlZ2lzdGVyIGR1cmluZyBtb2R1bGUgcmVtb3ZlLgo+ID4gPgo+ID4gPiB2MiB0byB2Mwo+ID4g
PiAxLiBDaGFuZ2UgY29tbWVudCBzdHlsZSBmb3IgdGhlIGhlYWQgb2Ygc291cmNlIGNvZGUuCj4g
PiA+IDIuIE5vIG5lZWQgdG8gcHJpbnQgZXJyb3IgZm9yIHBsYXRmb3JtX2dldF9pcnFfYnluYW1l
Lgo+ID4gPiAzLiBGaXggdGNwY2lfcmVnaXN0ZXJfcG9ydCBjaGVjayBmcm9tIElTX0VSUl9PUl9O
VUxMIHRvIElTX0VSUi4KPiA+ID4gNC4gUmVuYW1lIGRyaXZlci9LY29uZmlnL01ha2VmaWxlIGZv
cm0gbXQ2MzYwIHRvIG10NjM2eC4KPiA+ID4gNS4gUmVuYW1lIERUIGJpbmRpbmcgZG9jdW1lbnRz
IGZyb20gbXQ2MzYwIHRvIG10NjM2eC4KPiA+Cj4gPiBZb3UgZG9uJ3QgcGxhY2UgYWRkaXRpb25h
bCBjaGFuZ2Vsb2cgaGVyZS4uLgo+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hpWXVhbiBIdWFu
ZyA8Y3lfaHVhbmdAcmljaHRlay5jb20+Cj4gPiA+IC0tLQo+ID4KPiA+IFlvdSBwdXQgaXQgaGVy
ZSwgYWZ0ZXIgdGhhdCAnLS0tJyBtYXJrZXI6Cj4gPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2Rv
Yy9odG1sL2xhdGVzdC9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI3RoZS1jYW5vbmlj
YWwtcGF0Y2gtZm9ybWF0Cj4gPgo+IEhJIEhla2tpOgo+ICAgICAgYWZ0ZXIgcmVhZGluZyB0aGUg
ZG9jdW1lbnQsIEkgaGF2ZSBhIGxpdHRsZSBiaXQgY29uZnVzZWQgaG93IHRvCj4gdXNlIGRpZmZz
dGF0IGZvciB0aGUgY2hhbmdlbG9nLgo+ICAgICAgIElzIHRoZXJlIGFueSBleGFtcGxlIHRoYXQg
bWFrZSBtZSBrbm93IHRvIHdyaXRlIGEgY2xlYXIKPiBkZXNjcmlwdGlvbiBmb3IgdGhlIGNoYW5n
ZWxvZz8KClBpY2tpbmcgdGhlIGxhdGVzdCBwYXRjaCBmcm9tIGxpbnV4LXVzYiBtbC4gd2l0aCB2
ZXJzaW9uIGhpc3Rvcnk6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8xNTk4MDgz
NTUzLTMxODk2LTExLWdpdC1zZW5kLWVtYWlsLWNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20vCgpT
ZWUgaG93IHRoZSBsYXN0IHRhZyBsaW5lICJTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4uLi4i
IGlzIGZvbGxvd2VkCmJ5IG1hcmtlciAiLS0tIiwgd2hpY2ggdGhlbiBpcyBmb2xsb3dlZCBieSB0
aGUgdmVyc2lvbiBoaXN0b3J5ICh0aGUKdmVyc2lvbiBoaXN0b3J5IGlzIHRoZW4gYWxzbyBlbmRl
ZCB3aXRoIHRoZSBtYXJrZXIgIi0tLSIsIGEgc3RlcCB0aGF0CkkgZG9uJ3QgdGhpbmsgaXMgbWFu
ZGF0b3J5LCBidXQgY29tbW9ubHkgdXNlZCBhbmQgb2Z0ZW4gcmVjb21tZW5kZWQpLgoKVGhhdCB3
YXkgdGhhdCBwYXRjaCB2ZXJzaW9uIGhpc3RvcnkgZG9lcyBub3QgY29udGFtaW5hdGUgdGhlIGFj
dHVhbApjb21taXQgbWVzc2FnZS4KCgp0aGFua3MsCgotLSAKaGVpa2tpCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
