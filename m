Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1614AC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 11:58:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6EA02078A
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 11:58:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eyRAD44G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6EA02078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bTf6GHtnV2cGFAU1b54Mrloh7Oif7AhChreBpkV66+I=; b=eyRAD44GqM01XfmVKIuEfJvMk
	QlUkuFwsQkvSfZqOXMaou8uSPKswtpHOArF+7TWJoOlda/0ovPmfmgRrA6IVOUF0C3LTXI84CmPvG
	L+bGhrcoAAazNWpUyGnfWOqbWe2o2gjaKrvn2Z2C+3UiX9eS/3cs6gQbgB2Nu02O6lgIcwRy8Btn2
	UcouLTgwdNIlfH4C3tBW+ajMVrRynTOFwxrwWMOUW7ZgjwxmKNI5kcw1UWLQnRxYroJFoEhE/r9/z
	6b/lSHHXW/2XsoQDaWV9CNec+eND6wZxCwX7IicLaB5CKPU69fdX697Kcp0yvNXdw7ZdLMFv5HY6v
	h1eeO8R9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBd12-0007vZ-Pp; Fri, 28 Aug 2020 11:57:56 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBd0y-0007tl-59; Fri, 28 Aug 2020 11:57:53 +0000
IronPort-SDR: hRO7dj7pTMLoUaZs7ekcgYcnSeK4tUvfdEZHeEeQhCWBBV4lKMtBgVXuwhTRXB9+M0nn55xG9Z
 fV0noQdZSA5A==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="156655537"
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; d="scan'208";a="156655537"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 04:57:49 -0700
IronPort-SDR: zbqzJ1v11VIvW5bralVZkEHGh69hEJPSzeh8h951iMTGpgL9Jfq/uzANhJGMbzqQP94TYtpjdN
 mrsaGGmJDEBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,363,1592895600"; d="scan'208";a="403733952"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 28 Aug 2020 04:57:45 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Fri, 28 Aug 2020 14:57:45 +0300
Date: Fri, 28 Aug 2020 14:57:45 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: ChiYuan Huang <u0084500@gmail.com>
Subject: Re: [PATCH v3 1/3] usb typec: mt6360: Add support for mt6360 Type-C
 driver
Message-ID: <20200828115745.GE174928@kuha.fi.intel.com>
References: <1598527137-6915-1-git-send-email-u0084500@gmail.com>
 <20200827140001.GE813478@kuha.fi.intel.com>
 <CADiBU393V_iQw_8Hx2braL=8QpvQuTY0059C-XkqmjO9W=aBgQ@mail.gmail.com>
 <20200828093835.GC174928@kuha.fi.intel.com>
 <CADiBU3-S025q10WYzLk+v2K-5V+iTP=zDu4i8srTpHQvRkm0UQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADiBU3-S025q10WYzLk+v2K-5V+iTP=zDu4i8srTpHQvRkm0UQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_075752_388961_7BC14E9F 
X-CRM114-Status: GOOD (  28.44  )
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

T24gRnJpLCBBdWcgMjgsIDIwMjAgYXQgMDY6Mjc6MjZQTSArMDgwMCwgQ2hpWXVhbiBIdWFuZyB3
cm90ZToKPiBIZWlra2kgS3JvZ2VydXMgPGhlaWtraS5rcm9nZXJ1c0BsaW51eC5pbnRlbC5jb20+
IOaWvCAyMDIw5bm0OOaciDI45pelIOmAseS6lCDkuIvljYg1OjM55a+r6YGT77yaCj4gPgo+ID4g
T24gVGh1LCBBdWcgMjcsIDIwMjAgYXQgMTA6NTE6NDNQTSArMDgwMCwgQ2hpWXVhbiBIdWFuZyB3
cm90ZToKPiA+ID4gSGVpa2tpIEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwu
Y29tPiDmlrwgMjAyMOW5tDjmnIgyN+aXpSDpgLHlm5sg5LiL5Y2IMTA6MDDlr6vpgZPvvJoKPiA+
ID4gPgo+ID4gPiA+IE9uIFRodSwgQXVnIDI3LCAyMDIwIGF0IDA3OjE4OjU1UE0gKzA4MDAsIGN5
X2h1YW5nIHdyb3RlOgo+ID4gPiA+ID4gRnJvbTogQ2hpWXVhbiBIdWFuZyA8Y3lfaHVhbmdAcmlj
aHRlay5jb20+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gTWVkaWF0ZWsgTVQ2MzYwIGlzIGEgbXVsdGkt
ZnVuY3Rpb25hbCBJQyB0aGF0IGluY2x1ZGVzIFVTQiBUeXBlLUMuCj4gPiA+ID4gPiBJdCB3b3Jr
cyB3aXRoIFR5cGUtQyBQb3J0IENvbnRyb2xsZXIgTWFuYWdlciB0byBwcm92aWRlIFVTQiBQRAo+
ID4gPiA+ID4gYW5kIFVTQiBUeXBlLUMgZnVuY3Rpb25hbGl0aWVzLgo+ID4gPiA+ID4KPiA+ID4g
PiA+IHYxIHRvIHYyCj4gPiA+ID4gPiAxLiBBZGQgZml4IHRvIFByZXZlbnQgdGhlIHJhY2UgY29u
ZGl0aW9uIGZyb20gaW50ZXJydXB0IGFuZCB0Y3BjaSBwb3J0Cj4gPiA+ID4gPiB1bnJlZ2lzdGVy
IGR1cmluZyBtb2R1bGUgcmVtb3ZlLgo+ID4gPiA+ID4KPiA+ID4gPiA+IHYyIHRvIHYzCj4gPiA+
ID4gPiAxLiBDaGFuZ2UgY29tbWVudCBzdHlsZSBmb3IgdGhlIGhlYWQgb2Ygc291cmNlIGNvZGUu
Cj4gPiA+ID4gPiAyLiBObyBuZWVkIHRvIHByaW50IGVycm9yIGZvciBwbGF0Zm9ybV9nZXRfaXJx
X2J5bmFtZS4KPiA+ID4gPiA+IDMuIEZpeCB0Y3BjaV9yZWdpc3Rlcl9wb3J0IGNoZWNrIGZyb20g
SVNfRVJSX09SX05VTEwgdG8gSVNfRVJSLgo+ID4gPiA+ID4gNC4gUmVuYW1lIGRyaXZlci9LY29u
ZmlnL01ha2VmaWxlIGZvcm0gbXQ2MzYwIHRvIG10NjM2eC4KPiA+ID4gPiA+IDUuIFJlbmFtZSBE
VCBiaW5kaW5nIGRvY3VtZW50cyBmcm9tIG10NjM2MCB0byBtdDYzNnguCj4gPiA+ID4KPiA+ID4g
PiBZb3UgZG9uJ3QgcGxhY2UgYWRkaXRpb25hbCBjaGFuZ2Vsb2cgaGVyZS4uLgo+ID4gPiA+Cj4g
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGlZdWFuIEh1YW5nIDxjeV9odWFuZ0ByaWNodGVrLmNv
bT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+Cj4gPiA+ID4gWW91IHB1dCBpdCBoZXJlLCBhZnRlciB0
aGF0ICctLS0nIG1hcmtlcjoKPiA+ID4gPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1s
L2xhdGVzdC9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI3RoZS1jYW5vbmljYWwtcGF0
Y2gtZm9ybWF0Cj4gPiA+ID4KPiA+ID4gSEkgSGVra2k6Cj4gPiA+ICAgICAgYWZ0ZXIgcmVhZGlu
ZyB0aGUgZG9jdW1lbnQsIEkgaGF2ZSBhIGxpdHRsZSBiaXQgY29uZnVzZWQgaG93IHRvCj4gPiA+
IHVzZSBkaWZmc3RhdCBmb3IgdGhlIGNoYW5nZWxvZy4KPiA+ID4gICAgICAgSXMgdGhlcmUgYW55
IGV4YW1wbGUgdGhhdCBtYWtlIG1lIGtub3cgdG8gd3JpdGUgYSBjbGVhcgo+ID4gPiBkZXNjcmlw
dGlvbiBmb3IgdGhlIGNoYW5nZWxvZz8KPiA+Cj4gPiBQaWNraW5nIHRoZSBsYXRlc3QgcGF0Y2gg
ZnJvbSBsaW51eC11c2IgbWwuIHdpdGggdmVyc2lvbiBoaXN0b3J5Ogo+ID4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtdXNiLzE1OTgwODM1NTMtMzE4OTYtMTEtZ2l0LXNlbmQtZW1haWwt
Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbS8KPiA+Cj4gPiBTZWUgaG93IHRoZSBsYXN0IHRhZyBs
aW5lICJTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4uLi4iIGlzIGZvbGxvd2VkCj4gPiBieSBt
YXJrZXIgIi0tLSIsIHdoaWNoIHRoZW4gaXMgZm9sbG93ZWQgYnkgdGhlIHZlcnNpb24gaGlzdG9y
eSAodGhlCj4gPiB2ZXJzaW9uIGhpc3RvcnkgaXMgdGhlbiBhbHNvIGVuZGVkIHdpdGggdGhlIG1h
cmtlciAiLS0tIiwgYSBzdGVwIHRoYXQKPiA+IEkgZG9uJ3QgdGhpbmsgaXMgbWFuZGF0b3J5LCBi
dXQgY29tbW9ubHkgdXNlZCBhbmQgb2Z0ZW4gcmVjb21tZW5kZWQpLgo+ID4KPiA+IFRoYXQgd2F5
IHRoYXQgcGF0Y2ggdmVyc2lvbiBoaXN0b3J5IGRvZXMgbm90IGNvbnRhbWluYXRlIHRoZSBhY3R1
YWwKPiA+IGNvbW1pdCBtZXNzYWdlLgo+ID4KPiA+Cj4gPiB0aGFua3MsCj4gPgo+IEFoLCBJIGFs
cmVhZHkgc2VuZCB0aGUgcGF0Y2ggdjQsIEkgb25seSBhZGQgdGhlIGNoYW5nZWxvZyBhZnRlciB0
aGUKPiBzaWduLW9mZiAtLS0gbGFiZWwsIGJ1dCBmb3JnZXQgdG8gYWRkIC0tLSBhZnRlciBjaGFu
Z2Vsb2cgZW5kZWQKPiAKPiBQbGVhc2UgbGV0IG1lIHJlc2VuZCB0aGUgcGF0Y2ggdjQgdG8gYWRk
IC0tLSBsYWJlbCBhZnRlciB0aGUgY2hhbmdlIGxvZyBlZGVkLgoKWW91IGRvIG5vdCBuZWVkIHRv
IGRvIHRoYXQuIExpa2UgSSBzYWlkLCBpdCBpcyBub3QgbWFuZGF0b3J5LgoKdGhhbmtzLAoKLS0g
CmhlaWtraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
