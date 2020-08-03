Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E7EC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 16:13:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBC7020738
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 16:13:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xAolyU4H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5IxzLoG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBC7020738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1Ha3mQhaKey+y55Ic4n/Se50MYRUl9WCJpCIdfop5/8=; b=xAolyU4H/nZX03a7foo3EL9CJ
	a1CYsQBXOdoyt7OWETYzKCN6H8YA5ElmQdK/ebDirLTIq+H7SAh7W24kCSTO+5I5Of+zZeRXhLWgy
	LWHlLIKdsa1Cttrp+kyRyh1ISI069MnjGKPQjmD1Lwu4xLPeh2cWzlU8MKTzWmQ668KnuOM2LoD2G
	+8NqDhW0ZTx7vjkIPWMQ3bYgyGI+e7LAL5x8SWUcAjm1PgukLZlwJZLGYf+FQmUYI20gKro8W5R+F
	LA3cUaFZnAq1HBYqxkKdC/AIew1e4h5+O/6vyJRu3J9YiSxEFD795cb5x00JUblWk12VxGCQ17W44
	Jyq4s/zeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2d5t-0007x0-Gn; Mon, 03 Aug 2020 16:13:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2d5n-0007ve-93; Mon, 03 Aug 2020 16:13:41 +0000
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 26D4420738;
 Mon,  3 Aug 2020 16:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596471217;
 bh=HiU07JR1A+F1+Z53kyhPMkQd/qW5e56jQ2jPVulC8+4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X5IxzLoGXGhZ8Bs4qDZQdy04EZQYbwGYyq5pZ6j4Y154+ryCc3QMwHdQGC5v1tq34
 4A2h7BH/2Cmd0xibFPwmhNDUoaeGWgtGGAg/l/XlMLE6LQt0g8m2WA7gn23Ll+ewgf
 tIcyXRtGkEbtd56lShh1UKfNr4Icfv8vx+v7EjRM=
Received: by mail-ed1-f42.google.com with SMTP id m20so18156268eds.2;
 Mon, 03 Aug 2020 09:13:38 -0700 (PDT)
X-Gm-Message-State: AOAM533Kfy+do5vGIBsbQyEFw49szgYGszg2ma+AvEO/JoGuNlCWEvb7
 Yap7ABy81xpmzFbgRlmXaha1QjFJmUuenL4qXA==
X-Google-Smtp-Source: ABdhPJxVBbThlPNq2pTchCAyLxwz7hgBlwFmi8zFSCXl7qnrzYmZzBYIfzjIAbCSg/UXEzg38x48cLfkIWq4AkAuZYg=
X-Received: by 2002:a50:d2c7:: with SMTP id q7mr11624009edg.61.1596471216633; 
 Mon, 03 Aug 2020 09:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <1596010690-13178-1-git-send-email-neal.liu@mediatek.com>
 <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_8bE8Qo5-0MA9J1gcEbN4DP=Wf2O6vOUVos=VkoODeayA@mail.gmail.com>
 <1596163478.3932.17.camel@mtkswgap22>
 <CAAOTY_9kS+jrCOpZtOs+L8gBzvkewi+cSN7XWGNxuiMQocedFA@mail.gmail.com>
 <1596425521.22971.13.camel@mtkswgap22>
In-Reply-To: <1596425521.22971.13.camel@mtkswgap22>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Aug 2020 00:13:23 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9UcnSDTaVPDPyPLsWEYcrcq5MY=z520MWtFdeLw_FqGQ@mail.gmail.com>
Message-ID: <CAAOTY_9UcnSDTaVPDPyPLsWEYcrcq5MY=z520MWtFdeLw_FqGQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_121339_459321_3DFB0F32 
X-CRM114-Status: GOOD (  35.60  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, devicetree@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDjm
nIgz5pelIOmAseS4gCDkuIrljYgxMTozMuWvq+mBk++8mgo+Cj4gSGkgQ2h1bi1LdWFuZywKPgo+
IE9uIEZyaSwgMjAyMC0wNy0zMSBhdCAyMzowMyArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToK
PiA+IEhpLCBOZWFsOgo+ID4KPiA+IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+IOaW
vCAyMDIw5bm0N+aciDMx5pelIOmAseS6lCDkuIrljYgxMDo0NOWvq+mBk++8mgo+ID4gPgo+ID4g
PiBIaSBDaHVuLUt1YW5nLAo+ID4gPgo+ID4gPgo+ID4gPiBPbiBUaHUsIDIwMjAtMDctMzAgYXQg
MDA6MzggKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiA+ID4gSGksIE5lYWw6Cj4gPiA+
ID4KPiA+ID4gPiBOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfm
nIgyOeaXpSDpgLHkuIkg5LiL5Y2INDoyOeWvq+mBk++8mgo+ID4gPiA+ID4KPiA+ID4gPiA+IE1l
ZGlhVGVrIGJ1cyBmYWJyaWMgcHJvdmlkZXMgVHJ1c3Rab25lIHNlY3VyaXR5IHN1cHBvcnQgYW5k
IGRhdGEKPiA+ID4gPiA+IHByb3RlY3Rpb24gdG8gcHJldmVudCBzbGF2ZXMgZnJvbSBiZWluZyBh
Y2Nlc3NlZCBieSB1bmV4cGVjdGVkCj4gPiA+ID4gPiBtYXN0ZXJzLgo+ID4gPiA+ID4gVGhlIHNl
Y3VyaXR5IHZpb2xhdGlvbiBpcyBsb2dnZWQgYW5kIHNlbnQgdG8gdGhlIHByb2Nlc3NvciBmb3IK
PiA+ID4gPiA+IGZ1cnRoZXIgYW5hbHlzaXMgb3IgY291bnRlcm1lYXN1cmVzLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IEFueSBvY2N1cnJlbmNlIG9mIHNlY3VyaXR5IHZpb2xhdGlvbiB3b3VsZCByYWlz
ZSBhbiBpbnRlcnJ1cHQsIGFuZAo+ID4gPiA+ID4gaXQgd2lsbCBiZSBoYW5kbGVkIGJ5IG10ay1k
ZXZhcGMgZHJpdmVyLiBUaGUgdmlvbGF0aW9uCj4gPiA+ID4gPiBpbmZvcm1hdGlvbiBpcyBwcmlu
dGVkIGluIG9yZGVyIHRvIGZpbmQgdGhlIG11cmRlcmVyLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+Cj4gPiA+ID4gPiAt
LS0KPiA+ID4gPgo+ID4gPiA+IFtzbmlwXQo+ID4gPiA+Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAr
LyoKPiA+ID4gPiA+ICsgKiBkZXZhcGNfZXh0cmFjdF92aW9fZGJnIC0gZXh0cmFjdCBmdWxsIHZp
b2xhdGlvbiBpbmZvcm1hdGlvbiBhZnRlciBkb2luZwo+ID4gPiA+ID4gKyAqICAgICAgICAgICAg
ICAgICAgICAgICAgICBzaGlmdCBtZWNoYW5pc20uCj4gPiA+ID4gPiArICovCj4gPiA+ID4gPiAr
c3RhdGljIHZvaWQgZGV2YXBjX2V4dHJhY3RfdmlvX2RiZyhzdHJ1Y3QgbXRrX2RldmFwY19jb250
ZXh0ICpjdHgpCj4gPiA+ID4gPiArewo+ID4gPiA+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3QgbXRr
X2RldmFwY192aW9fZGJncyAqdmlvX2RiZ3M7Cj4gPiA+ID4gPiArICAgICAgIHN0cnVjdCBtdGtf
ZGV2YXBjX3Zpb19pbmZvICp2aW9faW5mbzsKPiA+ID4gPiA+ICsgICAgICAgdm9pZCBfX2lvbWVt
ICp2aW9fZGJnMF9yZWc7Cj4gPiA+ID4gPiArICAgICAgIHZvaWQgX19pb21lbSAqdmlvX2RiZzFf
cmVnOwo+ID4gPiA+ID4gKyAgICAgICB1MzIgZGJnMDsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsg
ICAgICAgdmlvX2RiZzBfcmVnID0gY3R4LT5kZXZhcGNfcGRfYmFzZSArIGN0eC0+b2Zmc2V0LT52
aW9fZGJnMDsKPiA+ID4gPiA+ICsgICAgICAgdmlvX2RiZzFfcmVnID0gY3R4LT5kZXZhcGNfcGRf
YmFzZSArIGN0eC0+b2Zmc2V0LT52aW9fZGJnMTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAg
ICAgdmlvX2RiZ3MgPSBjdHgtPnZpb19kYmdzOwo+ID4gPiA+ID4gKyAgICAgICB2aW9faW5mbyA9
IGN0eC0+dmlvX2luZm87Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIC8qIFN0YXJ0cyB0
byBleHRyYWN0IHZpb2xhdGlvbiBpbmZvcm1hdGlvbiAqLwo+ID4gPiA+ID4gKyAgICAgICBkYmcw
ID0gcmVhZGwodmlvX2RiZzBfcmVnKTsKPiA+ID4gPiA+ICsgICAgICAgdmlvX2luZm8tPnZpb19h
ZGRyID0gcmVhZGwodmlvX2RiZzFfcmVnKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAg
dmlvX2luZm8tPm1hc3Rlcl9pZCA9IChkYmcwICYgdmlvX2RiZ3MtPm1zdGlkLm1hc2spID4+Cj4g
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2aW9fZGJncy0+bXN0aWQuc3Rh
cnQ7Cj4gPiA+ID4KPiA+ID4gPiBXaGF0IGlzIG1hc3Rlcl9pZD8gSG93IGNvdWxkIHdlIHVzZSBp
dCB0byBkZWJ1Zz8gRm9yIGV4YW1wbGUsIGlmIHdlCj4gPiA+ID4gZ2V0IGEgbWFzdGVyX2lkID0g
MSwgd2hhdCBzaG91bGQgd2UgZG8gZm9yIHRoaXM/Cj4gPiA+ID4KPiA+ID4gPiA+ICsgICAgICAg
dmlvX2luZm8tPmRvbWFpbl9pZCA9IChkYmcwICYgdmlvX2RiZ3MtPmRtbmlkLm1hc2spID4+Cj4g
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2aW9fZGJncy0+ZG1uaWQuc3Rh
cnQ7Cj4gPiA+ID4KPiA+ID4gPiBXaGF0IGlzIGRvbWFpbl9pZD8gSG93IGNvdWxkIHdlIHVzZSBp
dCB0byBkZWJ1Zz8gRm9yIGV4YW1wbGUsIGlmIHdlCj4gPiA+ID4gZ2V0IGEgZG9tYWluX2lkID0g
Miwgd2hhdCBzaG91bGQgd2UgZG8gZm9yIHRoaXM/Cj4gPiA+ID4KPiA+ID4KPiA+ID4gbWFzdGVy
X2lkIGFuZCBkb21haW5faWQgYmVsb25ncyBvdXIgYnVzIHNpZGUtYmFuZCBzaWduYWwgaW5mby4g
SXQgY2FuCj4gPiA+IGhlbHAgdXMgdG8gZmluZCB0aGUgdmlvbGF0aW9uIG1hc3Rlci4KPiA+Cj4g
PiBEb2VzICd2aW9sYXRpb24gbWFzdGVyJyBtZWFucyB0aGUgaGFyZHdhcmUgY291bGQgYWNjZXNz
IHRoZSBwcm90ZWN0ZWQKPiA+IHJlZ2lzdGVyPyAoZXguIENQVSwgR0NFLCAuLi4pIElmIHNvLCBJ
IHRoaW5rIGl0J3MgYmV0dGVyIHRvIGFkZAo+ID4gY29tbWVudCB0byBleHBsYWluIGhvdyB0byBt
YXAgKG1hc3Rlcl9pZCwgZG9tYWluX2lkKSB0byBhIGhhcmR3YXJlCj4gPiAobWF5YmUgdGhlIGRl
dmljZSBpbiBkZXZpY2UgdHJlZSkgYmVjYXVzZSBldmVyeSBib2R5IGRvZXMgbm90IGtub3cKPiA+
IHdoYXQgdGhlIG51bWJlciBtZWFucy4gRG9uJ3QgdHJ5IHRvIHRyYW5zbGF0ZSB0aGUgbnVtYmVy
IHRvIGEgc3RyaW5nCj4gPiBiZWNhdXNlIHRoaXMgd291bGQgY29zdCBtdWNoIHRpbWUgdG8gZG8g
dGhpcy4gSnVzdCBwcmludCBhIG51bWJlciBhbmQKPiA+IHdlIGNvdWxkIGZpbmQgb3V0IHRoZSBt
YXN0ZXIgYnkgdGhlIGNvbW1lbnQuCj4KPiAndmlvbGF0aW9uIG1hc3RlcicgbWVhbnMgdGhlIG1h
c3RlciB3aGljaCB2aW9sYXRlcyB0aGUgcGVybWlzc2lvbgo+IGNvbnRyb2wuIEZvciBleGFtcGxl
LCBpZiB3ZSBzZXQgcGVybWlzc2lvbiAnU2VjdXJlIFIvVyBvbmx5JyBhcyBDUFUgdG8KPiBzcGkg
cmVnaXN0ZXIuIFdoZW4gdmlvbGF0aW9uIGlzIHRyaWdnZXJlZCwgaXQgbWVhbnMgQ1BVIGFjY2Vz
cyBzcGkKPiByZWdpc3RlciB0aHJvdWdoIG5vcm1hbCB3b3JsZCBpbnN0ZWFkIG9mIHNlY3VyZSB3
b3JsZCwgd2hpY2ggaXMgbm90Cj4gYWxsb3dlZC4KPgo+ICdtYXN0ZXJfaWQnIGNhbm5vdCB1c2Ug
dGhlIHNpbXBsZSBjb21tZW50cyB0byBkZXNjcmliZSB3aGljaCBtYXN0ZXIgaXQKPiBpcy4gSXQg
ZGVwZW5kcyBvbiB2aW9sYXRpb24gc2xhdmVzLiBGb3IgZXhhbXBsZSwgaWYgdGhlcmUgYXJlIHR3
bwo+IHZpb2xhdGlvbnM6Cj4gMS4gQ1BVIGFjY2VzcyBzcGkgcmVnCj4gMi4gQ1BVIGFjY2VzcyB0
aW1lciByZWcKPiBJdCBtaWdodCBiZSBkaWZmZXJlbnQgJ21hc3Rlcl9pZCcgZm9yIENQVSBvbiB0
aGVzZSB0d28gY2FzZXMuCj4gSSB3b3VsZCBwcmVmZXIgdG8gcmVtYWluIHRoZSBpZCBudW1iZXIg
aWYgdHJhbnNsYXRlIHRvIGEgc3RyaW5nIGlzIGEgYmFkCj4gaWRlYS4KPiBUaGFua3MgIQoKSXQg
c2VhbXMgdGhhdCBtYXN0ZXJfaWQgYW5kIGRvbWFpbl9pZCBkb2VzIG5vdCBoZWxwIGZvciBkZWJ1
Zy4gV2hlbiB3ZQpnZXQgbWFzdGVyX2lkID0gMSBhbmQgZG9tYWluX2lkID0gMiwgd2UgZG9uJ3Qg
a25vdyB3aGF0IGl0IG1lYW4uIEkKdGhpbmsgd2UganVzdCBuZWVkIHZpb2xhdGlvbiBhZGRyZXNz
IGJlY2F1c2Ugd2UgY291bGQgZmluZCB0aGUgZHJpdmVyCnRoYXQgd3JpdGUgdGhpcyBhZGRyZXNz
IGFuZCB0aGUgYnVnIHdvdWxkIGJlIGluc2lkZSB0aGlzIGRyaXZlci4gU28KbmVlZCBub3QgdG8g
cHJvY2VzcyBtYXN0ZXJfaWQgYW5kIGRvbWFpbl9pZC4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+
Cj4gPgo+ID4gPgo+ID4gPiA+ID4gKyAgICAgICB2aW9faW5mby0+d3JpdGUgPSAoKGRiZzAgJiB2
aW9fZGJncy0+dmlvX3cubWFzaykgPj4KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICB2aW9fZGJncy0+dmlvX3cuc3RhcnQpID09IDE7Cj4gPiA+ID4gPiArICAgICAgIHZpb19p
bmZvLT5yZWFkID0gKChkYmcwICYgdmlvX2RiZ3MtPnZpb19yLm1hc2spID4+Cj4gPiA+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgIHZpb19kYmdzLT52aW9fci5zdGFydCkgPT0gMTsKPiA+
ID4gPiA+ICsgICAgICAgdmlvX2luZm8tPnZpb19hZGRyX2hpZ2ggPSAoZGJnMCAmIHZpb19kYmdz
LT5hZGRyX2gubWFzaykgPj4KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB2aW9fZGJncy0+YWRkcl9oLnN0YXJ0Owo+ID4gPiA+Cj4gPiA+ID4gV2hhdCBpcyB2aW9f
YWRkcl9oaWdoPyBBcyBJIGtub3cgYWxsIHJlZ2lzdGVyIGFkZHJlc3MgYXJlIDMyIGJpdHMsIGlz
Cj4gPiA+ID4gdmlvX2FkZHJfaGlnaCB0aGUgYWRkcmVzcyBhYm92ZSAzMiBiaXRzPwo+ID4gPgo+
ID4gPiBZZXMsIHlvdSBhcmUgcmlnaHQuIEluIE1UNjc3OSwgYWxsIHJlZ2lzdGVyIGJhc2UgYXJl
IDMyIGJpdHMuIFdlIGNhbgo+ID4gPiBpZ25vcmUgdGhpcyBpbmZvIGZvciBjdXJyZW50IGRyaXZl
ci4gSSdsbCB1cGRhdGUgb24gbmV4dCBwYXRjaC4KPiA+ID4gVGhhbmtzICEKPiA+Cj4gPiBTdWNo
IGEgc3RyYW5nZSBoYXJkd2FyZSwgYWxsIHJlZ2lzdGVyIGlzIDMyIGJpdHMgYnV0IGl0IGhhcyBh
Cj4gPiB2aW9fYWRkcl9oaWdoIGluIGl0cyByZWdpc3Rlci4gT0ssIGp1c3QgZHJvcCB0aGlzLgo+
ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBkZXZhcGNfdmlv
X2luZm9fcHJpbnQoY3R4KTsKPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiArCj4gPiA+ID4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
