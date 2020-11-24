Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF45C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 08:33:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4352B2073C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 08:33:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wxX5EMmK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJEK4my6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4352B2073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z6IgHMQc+9yUxmHBZNR1eh1MHCshshehufYyfwxjD2E=; b=wxX5EMmKBLreN05T9i4fNeNnh
	/uDMkdEms4/5gRq9S9+jsmav6PscjzkiSh+oSdyCJxLhWbt5UWVp68oQGZedFdyM3rhFqSzpnciIq
	CNi7brhI9o0vIqcbKEfbD7bwVuz+HnipikQmQ5n/appi9xNVIXWWA7drOSNvzwH4Zsql8izGtNN6u
	dgJZamZgRYWsx457fWCcWjGSfN6wVnWICBPhgpexHzLdYCaiF6sTBTjAsQS+hi55ERIxAOJp6vE3O
	rHTrQg62gDzGgsC122p/cVZsuN9uAqooGCGVDnPQtRQ83k/VhVDtqHtNyxQoI1F6DhA1SdMrOFw1y
	0Cj03wdDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khTl5-0004EI-8U; Tue, 24 Nov 2020 08:33:07 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khTl0-0004B7-Ko; Tue, 24 Nov 2020 08:33:03 +0000
Received: by mail-ot1-x344.google.com with SMTP id y24so13053982otk.3;
 Tue, 24 Nov 2020 00:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2Q2PJe5i+0yyqNpuz8z7kTzoUZGPUVSZ0K1hVFCIENc=;
 b=EJEK4my6XgGJ/dD2WIbE+x9yKt34U2S0NfxAtf5UDkh51GwKec1scrVlUnkhzirfpj
 ACu7SVoyXDQ3dn20K1VkpyaZKTiy4KM7d/rgkjoXnlhXcokGAHw0Te0SbpYyWJ1gk4xP
 pbfS9bVFHR6ywMivsTXNTXKwimCbOTWnR6PELgCQlrVA7fVXMLUU22SBxBFwxOIGSE7H
 f1AJUIhUs0ENqLK5yEeNQ3WIrEG2JvAclEr5sFeqKhVN2BKnc8pxyvb1qawpYvBhoKaM
 QcZ1GS9W/IsKJGOBBDbZDHIdqQWwks9p35WVKUxD5lJSr56hJQ2nRIeqsXbVnT9uzxl/
 wwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2Q2PJe5i+0yyqNpuz8z7kTzoUZGPUVSZ0K1hVFCIENc=;
 b=Ie80AYDYc1/DepSTNuRX0GGZMfr8NWr3YgFHEpCR6ULYAJbKiMRYmHeeRRmfrIGYYi
 XdWsSzqw3AcS69WyHwhuzj2ZKzhUBU9DmaMC17IQ7XCDrvc8cw0lo8hsPq1cojMNMdKT
 0pmIHEaHvwS+j3DLuDTOQBpB7vLbCflwbYoIRhBFuPhUKwP/1A5C0tiS7J/wsJot3Idn
 VVX2DUHRdwJtfE4xWOPjAqYm0nhGKsM6rK3h7+TzSzTRmBCqCs2xEJR03m2uuC27O7bZ
 +uFKFHQ32chV5tbfBVR7lNMA9o1rFWgyMZ1CYIPGk9PUKQJLxp3/tPZ/ukKNgt2do+wo
 cvVg==
X-Gm-Message-State: AOAM533hcwhnU91iE/tPaDAgBRdjrZGPXbv5I8+DgZQ2uOgFCdyhftu7
 oPcWLSCQaihVGF14a36OTL8apof2rcxxDHW0wxs=
X-Google-Smtp-Source: ABdhPJxV3Rl2vkNvuvxyPEAKWiZ7f5Gc/SAbQGhC5bCF06tKppvMDBbCfOiBqV/xmGcTl3wCltcJ1C9xb6fCvvAH6bo=
X-Received: by 2002:a9d:6c99:: with SMTP id c25mr2645011otr.327.1606206769728; 
 Tue, 24 Nov 2020 00:32:49 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd> <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
 <20201119215721.GA5337@amd> <0700c32d-643b-fedb-06f0-21547b18205d@gmail.com>
 <CAE+NS363BpytNGZzfZHLa7KLKL8gjGj14oNvRi3oaH9KT79REg@mail.gmail.com>
 <25fef924-634d-7f60-7e1d-0290d1701fab@gmail.com>
 <CAE+NS34vDejgf8Ydfer_rY25qaG-DQQ5H-9-Er+Shz0=UF-EzA@mail.gmail.com>
In-Reply-To: <CAE+NS34vDejgf8Ydfer_rY25qaG-DQQ5H-9-Er+Shz0=UF-EzA@mail.gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 24 Nov 2020 16:32:40 +0800
Message-ID: <CAE+NS34-oU3FnfBsHD3W+z-4QNr3LgnEjXhDbNrVf+KJg_bDEw@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_033302_716330_F9DA302E 
X-CRM114-Status: GOOD (  26.59  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rml4IFR5cG8uCgpHZW5lIENoZW4gPGdlbmUuY2hlbi5yaWNodGVrQGdtYWlsLmNvbT4g5pa8IDIw
MjDlubQxMeaciDI05pelIOmAseS6jCDkuIvljYgzOjMz5a+r6YGT77yaCj4KPiBKYWNlayBBbmFz
emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT4g5pa8IDIwMjDlubQxMeaciDI05pel
IOmAseS6jCDkuIrljYg0OjUy5a+r6YGT77yaCj4gPgo+ID4gT24gMTEvMjMvMjAgNDowMCBBTSwg
R2VuZSBDaGVuIHdyb3RlOgo+ID4gPiBKYWNlayBBbmFzemV3c2tpIDxqYWNlay5hbmFzemV3c2tp
QGdtYWlsLmNvbT4g5pa8IDIwMjDlubQxMeaciDIw5pelIOmAseS6lCDkuIrljYg2OjI25a+r6YGT
77yaCj4gPiA+Pgo+ID4gPj4gT24gMTEvMTkvMjAgMTA6NTcgUE0sIFBhdmVsIE1hY2hlayB3cm90
ZToKPiA+ID4+PiBPbiBUaHUgMjAyMC0xMS0xOSAyMjowMzoxNCwgSmFjZWsgQW5hc3pld3NraSB3
cm90ZToKPiA+ID4+Pj4gSGkgUGF2ZWwsIEdlbmUsCj4gPiA+Pj4+Cj4gPiA+Pj4+IE9uIDExLzE4
LzIwIDEwOjM3IFBNLCBQYXZlbCBNYWNoZWsgd3JvdGU6Cj4gPiA+Pj4+PiBIaSEKPiA+ID4+Pj4+
Cj4gPiA+Pj4+Pj4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiA+
Pj4+Pj4KPiA+ID4+Pj4+PiBBZGQgTEVEX0NPTE9SX0lEX01PT05MSUdIVCBkZWZpbml0aW9ucwo+
ID4gPj4+Pj4KPiA+ID4+Pj4+IFdoeSBpcyBtb29ubGlnaHQgYSBjb2xvcj8gQ2FtZXJhIGZsYXNo
ZXMgYXJlIHVzdWFsbHkgd2hpdGUsIG5vPwo+ID4gPj4+Pj4KPiA+ID4+Pj4+IEF0IGxlYXN0IGl0
IG5lZWRzIGEgY29tbWVudC4uLgo+ID4gPj4+Pgo+ID4gPj4+PiBUaGF0J3MgbXkgZmF1bHQsIElu
IGZhY3QgSSBzaG91bGQgaGF2ZSBhc2tlZCBhYm91dCBhZGRpbmcKPiA+ID4+Pj4gTEVEX0ZVTkNU
SU9OX01PT05MSUdIVCwgaXQgd2FzIGV2aWRlbnRseSB0b28gbGF0ZSBmb3IgbWUgdGhhdCBldmVu
aW5nLi4uCj4gPiA+Pj4KPiA+ID4+PiBBaGEsIHRoYXQgbWFrZXMgbW9yZSBzZW5zZS4KPiA+ID4+
Pgo+ID4gPj4+IEJ1dCBwbGVhc2UgbGV0J3MgY2FsbCBpdCAidG9yY2giIGlmIHdlIGRvIHRoYXQs
IGFzIHRoYXQgaXMgYWxyZWFkeQo+ID4gPj4+IHVzZWQgaW4ga2VybmVsIHNvdXJjZXMuLi4gYW5k
IHByb2JhYmx5IGluIHRoZSBpbnRlcmZhY2UsIHRvbzoKPiA+ID4+Cj4gPiA+PiBJJ2Qgc2F5IHRo
YXQgdG9yY2ggaXMgc29tZXRoaW5nIGRpZmZlcmVudCB0aGF0IG1vb25saWdodCwKPiA+ID4+IGJ1
dCB3ZSB3b3VsZCBuZWVkIG1vcmUgaW5wdXQgZnJvbSBHZW5lIHRvIGxlYXJuIG1vcmUgYWJvdXQK
PiA+ID4+IHRoZSBuYXR1cmUgb2YgbGlnaHQgZW1pdHRlZCBieSBNTCBMRUQgb24gaGlzIGRldmlj
ZS4KPiA+ID4+Cj4gPiA+PiBQbGVhc2Ugbm90ZSB0aGF0IHRvcmNoIGlzIHVzdWFsbHkgbWVhbnQg
YXMgdGhlIG90aGVyIG1vZGUgb2YKPiA+ID4+IGZsYXNoIExFRCAoc29tZXRpbWVzIGl0IGlzIGNh
bGxlZCAibW92aWUgbW9kZSIpLCB3aGljaCBpcyBhbHJlYWR5Cj4gPiA+PiBoYW5kbGVkIGJ5IGJy
aWdodG5lc3MgZmlsZSBvZiBMRUQgY2xhc3MgZmxhc2ggZGV2aWNlIChpLmUuIGl0cyBMRUQgY2xh
c3MKPiA+ID4+IHN1YnNldCksIGFuZCB3aGljaCBhbHNvIG1hcHMgdG8gdjRsMi1mbGFzaCBUT1JD
SCBtb2RlLgo+ID4gPj4KPiA+ID4KPiA+ID4gSXQncyB1c2VkIHRvIGZyb250IGNhbWVyYSBmaWxs
IGxpZ2h0Lgo+ID4gPiBNb3JlIGJyaWdodG5lc3MgdGhhbiBzY3JlZW4gYmFja2xpZ2h0LCBhbmQg
bW9yZSBzb2Z0IGxpZ2h0IHRoYW4gZmxhc2guCj4gPiA+IEkgdGhpbmsgTEVEX0lEX0NPTE9SX1dI
SVRFIGlzIG9rYXkuCj4gPgo+ID4gU28gd2h5IGluIHY2IHlvdSBhc3NpZ25lZCBMRURfQ09MT1Jf
SURfQU1CRVIgdG8gaXQ/Cj4gPgoKd2Ugc3VwcG9zZSBNb29ubGlnaHQgY2FuIGJlIHdoaXRlIG9y
IGFtYmVyLgoKPiA+IFJlZ2FyZGxlc3Mgb2YgdGhhdCwgbm93IHdlJ3JlIHRhbGtpbmcgYWJvdXQg
TEVEIGZ1bmN0aW9uIC0geW91IGNob3NlCj4gPiBMRURfRlVOQ1RJT05fSU5ESUNBVE9SIGZvciBp
dCwgYnV0IGluZmVycmluZyBmcm9tIHlvdXIgYWJvdmUgZGVzY3JpcHRpb24KPiA+IC0gaXQgY2Vy
dGFpbmx5IGRvZXNuJ3QgZml0IGhlcmUuCj4gPgo+ID4gQWxzbyByZWdpc3RlciBuYW1lcywgY29u
dGFpbmluZyBwYXJ0ICJNTCIgaW5kaWNhdGUgdGhhdCB0aGlzIExFRCdzCj4gPiBpbnRlbmRlZCBm
dW5jdGlvbiBpcyBtb29ubGluZ2h0LCB3aGljaCB5b3VyIGRlc2NyaXB0aW9uIHNvbWVob3cKPiA+
IGNvcnJvYm9yYXRlcy4KPiA+Cj4gPiBNb29ubGlnaHQgTEVEcyBiZWNvbWUgdWJpcXVpdG91cyBu
b3dhZGF5cyBzbyBzb29uZXIgb3IgbGF0ZXIgd2Ugd2lsbAo+ID4gbmVlZCB0byBhZGQgdGhpcyBm
dW5jdGlvbiBhbnl3YXkgWzBdLgo+ID4KPiA+IFswXQo+ID4gaHR0cHM6Ly9sYW5kc2NhcGVsaWdo
dGluZ29ha3ZpbGxlLmNvbS93aGF0LWlzLW1vb24tbGlnaHRpbmctYW5kLXdoeS1kb2VzLWl0LXJl
bWFpbi1zby1wb3B1bGFyLwo+ID4KPgo+IEFjY29yZGluZyB0byByZWZlcmVuY2UsCj4gIldoZW4g
eW91IGFyZSB0cnlpbmcgdG8gaW1pdGF0ZSBtb29ubGlnaHQgeW91IG5lZWQgdG8gdXNlIGxvdyB2
b2x0YWdlLAo+IHNvZnRlciBsaWdodGluZy4gWW91IGRvbuKAmXQgd2FudCBzb21ldGhpbmcgdGhh
dOKAmXMgdG9vIGJyaWdodCIKPiB3aGljaCBpcyBmb2N1cyBvbiBicmlnaHRuZXNzIGluc3RlYWQg
b2YgY29sb3IuCj4KPiBTbyB3ZSBzdXBwb3NlIE1vb25saWdodCBjYW4gYmUgd2hpdGUgb3IgYW1i
ZXIuCj4KPiBTaG91bGQgSSBhZGQgTEVEX0ZVTkNUSU9OX01PT05MSUdIVCBhbmQgc2V0IExFRF9D
T0xPUl9JRF9XSElURT8KPgo+ID4gLS0KPiA+IEJlc3QgcmVnYXJkcywKPiA+IEphY2VrIEFuYXN6
ZXdza2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
