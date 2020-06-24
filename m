Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D5F8C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 13:49:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5051F2082F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 13:49:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pmJqUTp9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="0jvmCkm1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5051F2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RhuCWXdelIB9K//KdjjFtN7ScGz4lUYuubNxMjoQrtg=; b=pmJqUTp9D1D0+FRPGSWPBXtld
	Nz06enqFACIkqFFwEbPGT6DqocntSCyZmzWzAdj7BG3ZmEFsFO23U3bxs0NT8xvQVi7vPgyJjBldX
	+EGSlxNgayLuK+iKBjiCeEiNcvIFLaT97+mBAQCJdnvhVm0if0jT3GJa8gg7L7S6j3J7KOvVo2Cxg
	q6vlj4fV/m3PnLoyZSLDZoQgV29ZSdv6nLA//RWc436X21ur87bFTV6mfGd5nEGPlxWceRuBIqj8D
	pV/4rezIvaK7TfoGj4KDxPAzrZkNunyZ27z0zVe9mS8H7al8CbBsWUa0wZDIb1FgpEKUOLWEkVNLV
	vTHHj6GoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo5m0-0007wr-L5; Wed, 24 Jun 2020 13:49:08 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo5lu-0007tD-Vk
 for linux-mediatek@lists.infradead.org; Wed, 24 Jun 2020 13:49:04 +0000
Received: by mail-il1-x141.google.com with SMTP id c75so2089680ila.8
 for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2020 06:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HMgVoQ0NH17cOLvd+EMrZ4qMVzF5NeVckkBSBDB5GLs=;
 b=0jvmCkm1uxOa1uyi4BAYlDRMMqRDa38wgi9E8/XIDdGrA9oQ5L4spIW2A1eGA4BtF2
 S8zElmWx4UIeuMFNfhPYYnWZuScbEVueJuWuV4FXywiqce4LL2run2a4ymvcOzIu/C/+
 6Fe7gIuaYQNI6sGKgF4WgNb2BUsmVdRrHfRKrtAsfldLg5IvcbHl6PWauCZhmFQojQhm
 9a7Q5RrPl/lbr4+33xEC9+RPw7xZD15uxySVT5i1FJFwQookYTDkrFsYT0wH0jVU3Rlu
 L9Tp3z1r1c62MEmeG50kWokbFvxn6cOtU/lGUbjrNM0wFfDadl3nZISJG+6IalJfMcDf
 33mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HMgVoQ0NH17cOLvd+EMrZ4qMVzF5NeVckkBSBDB5GLs=;
 b=XrT0mjhD1Fg6tAN8fN5EWfgNrQrPsnHQU/FBuM1fe0VBAsF637/YfRjrhkRP8omQ96
 Nr9aoKNjg2WnzllwiPjcZi/la3wEP2oJlyZSSL1gHkaFfZd+JT/lYZF9QmpnOcU8EJSV
 HQ40Ug+brTk7Id2BKwmEv9dmyXwyNwwL4YIerPCXf+X/Jcmt3OYbvRWdm8yapvAZ5hyg
 zJMK188fCp2qdySUTcFkeM1bkavrWhFmrP2b1EETulHD1krZGCbChFuQPirgiMF4Gf+d
 5LIiRWG9/x5EfPjK/QGKurfoC9SQINJ6wg53rGttp6O6ZLXizriHlnZ55NDUdXo/D9Yu
 HvmA==
X-Gm-Message-State: AOAM530pVH2zGqUl0/sqotZVqJ/Oyey7DJIFWDE+7C2s2fOmuMCX/vVy
 DPld1NGjLdVYiLp3yRc2stg2fKprpOwJi+lUdip19Q==
X-Google-Smtp-Source: ABdhPJxdX8ruFrJVm8CZiU93LA3RvFI3WisGoVFQmLOi9T6/smGz8KDwDETgwAqF6p43r34eXBRDqfcPxFBj5bX92S8=
X-Received: by 2002:a92:de10:: with SMTP id x16mr29799293ilm.6.1593006540971; 
 Wed, 24 Jun 2020 06:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200622093744.13685-1-brgl@bgdev.pl>
 <20200622093744.13685-10-brgl@bgdev.pl>
 <20200622133940.GL338481@lunn.ch> <20200622135106.GK4560@sirena.org.uk>
 <dca54c57-a3bd-1147-63b2-4631194963f0@gmail.com>
 <20200624094302.GA5472@sirena.org.uk>
In-Reply-To: <20200624094302.GA5472@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Jun 2020 15:48:50 +0200
Message-ID: <CAMRc=McBxJdujCyjQF3NA=bCWHF1dx8xJ1Nc2snmqukvJ_VyoQ@mail.gmail.com>
Subject: Re: [PATCH 09/15] net: phy: delay PHY driver probe until PHY
 registration
To: Mark Brown <broonie@kernel.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree <devicetree@vger.kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Frank Rowand <frowand.list@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Salil Mehta <salil.mehta@huawei.com>, netdev <netdev@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Pedro Tsai <pedro.tsai@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

xZtyLiwgMjQgY3plIDIwMjAgbyAxMTo0MyBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+
IG5hcGlzYcWCKGEpOgo+Cj4gT24gVHVlLCBKdW4gMjMsIDIwMjAgYXQgMTI6NDk6MTVQTSAtMDcw
MCwgRmxvcmlhbiBGYWluZWxsaSB3cm90ZToKPiA+IE9uIDYvMjIvMjAgNjo1MSBBTSwgTWFyayBC
cm93biB3cm90ZToKPgo+ID4gPiBJZiB0aGUgYnVzIGluY2x1ZGVzIHBvd2VyIG1hbmFnZW1lbnQg
Zm9yIHRoZSBkZXZpY2VzIG9uIHRoZSBidXMgdGhlCj4gPiA+IGNvbnRyb2xsZXIgaXMgZ2VuZXJh
bGx5IHJlc3BvbnNpYmxlIGZvciB0aGF0IHJhdGhlciB0aGFuIHRoZSBkZXZpY2VzLAo+ID4gPiB0
aGUgZGV2aWNlcyBhY2Nlc3MgdGhpcyB2aWEgZmFjaWxpdGllcyBwcm92aWRlZCBieSB0aGUgYnVz
IGlmIG5lZWRlZC4KPiA+ID4gSWYgdGhlIGRldmljZSBpcyBlbnVtZXJhdGVkIGJ5IGZpcm13YXJl
IHByaW9yIHRvIGJlaW5nIHBoeXNpY2FsbHkKPiA+ID4gZW51bWVyYWJsZSB0aGVuIHRoZSBidXMg
d2lsbCBnZW5lcmFsbHkgaW5zdGFudGlhdGUgdGhlIGRldmljZSBtb2RlbAo+ID4gPiBkZXZpY2Ug
YW5kIHRoZW4gYXJyYW5nZSB0byB3YWl0IGZvciB0aGUgcGh5c2ljYWwgZGV2aWNlIHRvIGFwcGVh
ciBhbmQKPiA+ID4gZ2V0IGpvaW5lZCB1cCB3aXRoIHRoZSBkZXZpY2UgbW9kZWwgZGV2aWNlLCB0
eXBpY2FsbHkgaW4gc3VjaCBzaXR1YXRpb25zCj4gPiA+IHRoZSBwaHlzaWNhbCBkZXZpY2UgbWln
aHQgYXBwZWFyIGFuZCBkaXNhcHBlYXIgZHluYW1pY2FsbHkgYXQgcnVudGltZQo+ID4gPiBiYXNl
ZCBvbiB3aGF0IHRoZSBkcml2ZXIgaXMgZG9pbmcgYW55d2F5Lgo+Cj4gPiBJbiBwcmVtaXNlIHRo
ZXJlIGlzIG5vdGhpbmcgdGhhdCBwcmV2ZW50cyB0aGUgTURJTyBidXMgZnJvbSB0YWtpbmcgY2Fy
ZQo+ID4gb2YgdGhlIHJlZ3VsYXRvcnMsIHJlc2V0cywgcHJpb3IgdG8gcHJvYmluZyB0aGUgUEhZ
IGRyaXZlciwgd2hhdCBpcwo+ID4gY29tcGxpY2F0ZWQgaGVyZSBpcyB0aGF0IHdlIGRvIG5lZWQg
dG8gaXNzdWUgYSByZWFkIG9mIHRoZSBhY3R1YWwgUEhZIHRvCj4gPiBrbm93IGl0cyAzMi1iaXQg
dW5pcXVlIGlkZW50aWZpZXIgYW5kIG1hdGNoIGl0IHdpdGggYW4gYXBwcm9wcmlhdGUKPiA+IGRy
aXZlci4gVGhlIHdheSB0aGF0IHdlIGhhdmUgd29ya2VkIGFyb3VuZCB0aGlzIHdpdGggaWYgeW91
IGRvIG5vdCB3aXNoCj4gPiBzdWNoIGEgaGFyZHdhcmUgYWNjZXNzIHRvIGJlIG1hZGUsIGlzIHRv
IHByb3ZpZGUgYW4gRXRoZXJuZXQgUEhZIG5vZGUKPiA+IGNvbXBhdGlibGUgc3RyaW5nIHRoYXQg
ZW5jb2RlcyB0aGF0IDMyLWJpdCBPVUkgZGlyZWN0bHkuIEluIHByZW1pc2UgdGhlCj4gPiBzYW1l
IGNoYWxsZW5nZXMgZXhpc3Qgd2l0aCBQQ0kgZGV2aWNlcy9lbmRwb2ludHMgYXMgd2VsbCBhcyBV
U0IsIHdvdWxkCj4gPiB0aGV5IGhhdmUgcmVzZXQgb3IgcmVndWxhdG9yIHR5cGljYWxseSBhdHRh
Y2hlZCB0byB0aGVtLgo+Cj4gVGhhdCBhbGwgc291bmRzIHZlcnkgbm9ybWFsIGFuZCBpcyBjb3Zl
cmVkIGJ5IGJvdGggY2FzZXMgSSBkZXNjcmliZT8KPgo+ID4gPiBXZSBjb3VsZCB1c2UgYSBwcmUt
cHJvYmUgc3RhZ2UgaW4gdGhlIGRldmljZSBtb2RlbCBmb3IgaG90cGx1Z2dhYmxlCj4gPiA+IGJ1
c2VzIGluIGVtYmVkZGVkIGNvbnRleHRzIHdoZXJlIHlvdSBtaWdodCBuZWVkIHRvIGJyaW5nIHRo
aW5ncyBvdXQgb2YKPiA+ID4gcmVzZXQgb3IgcG93ZXIgdGhlbSB1cCBiZWZvcmUgdGhleSdsbCBh
cHBlYXIgb24gdGhlIGJ1cyBmb3IgZW51bWVyYXRpb24KPiA+ID4gYnV0IGJ1c2VzIGhhdmUgbW9z
dGx5IGhhbmRsZWQgdGhhdCBhdCB0aGVpciBsZXZlbC4KPgo+ID4gVGhhdCBzb3VuZHMgbGlrZSBh
IGJldHRlciBzb2x1dGlvbiwgYXJlIHRoZXJlIGFueSBzdWJzeXN0ZW1zIGN1cnJlbnRseQo+ID4g
aW1wbGVtZW50aW5nIHRoYXQsIG9yIHdvdWxkIHRoaXMgYmUgYSBnZW5lcmljIExpbnV4IGRldmlj
ZSBkcml2ZXIgbW9kZWwKPiA+IGFkZGl0aW9uIHRoYXQgbmVlZHMgdG8gYmUgZG9uZT8KPgo+IExp
a2UgSSBzYXkgSSdtIHN1Z2dlc3RpbmcgZG9pbmcgc29tZXRoaW5nIGF0IHRoZSBkZXZpY2UgbW9k
ZWwgbGV2ZWwuCgpJIGRpZG4ndCBleHBlY3QgdG8gb3BlbiBzdWNoIGEgY2FuIG9mIHdvcm1zLi4u
CgpUaGlzIGhhcyBldm9sdmVkIGludG8gc2V2ZXJhbCBuZXcgY29uY2VwdHMgYmVpbmcgcHJvcG9z
ZWQgdnMgbXkKdXNlLWNhc2Ugd2hpY2ggaXMgcmVsYXRpdmVseSBzaW1wbGUuIFRoZSBmb3JtZXIg
d2lsbCBwcm9iYWJseSB0YWtlCnNldmVyYWwgbW9udGhzIG9mIGRldmVsb3BtZW50LCByZXZpZXdz
IGFuZCBkaXNjdXNzaW9ucyBhbmQgaXQgd2lsbApibG9jayBzdXBwb3J0aW5nIHRoZSBwaHkgc3Vw
cGx5IG9uIHB1bXBraW4gYm9hcmRzIHVwc3RyZWFtLiBJIHdvdWxkCnByZWZlciBub3QgdG8gcmVk
byB3aGF0IG90aGVyIE1BQyBkcml2ZXJzIGRvIChwaHktc3VwcGx5IHByb3BlcnR5IG9uCnRoZSBN
QUMgbm9kZSwgY29udHJvbGxpbmcgaXQgZnJvbSB0aGUgTUFDIGRyaXZlciBpdHNlbGYpIGlmIHdl
J3ZlCmFscmVhZHkgZXN0YWJsaXNoZWQgaXQncyB3cm9uZy4KCklzIHRoZXJlIGFueSBjb21wcm9t
aXNlIHdlIGNvdWxkIHJlYWNoIHRvIGFkZCBzdXBwb3J0IGZvciBhIGJhc2ljLApjb21tb24gdXNl
LWNhc2Ugb2YgYSBzaW5nbGUgcmVndWxhdG9yIHN1cHBseWluZyBhIFBIWSB0aGF0IG5lZWRzCmVu
YWJsaW5nIGJlZm9yZSByZWFkaW5nIGl0cyBJRCBzaG9ydC10ZXJtIChqdXN0IGxpa2Ugd2UgY3Vy
cmVudGx5CnN1cHBvcnQgYSBzaW5nbGUgcmVzZXQgb3IgcmVzZXQtZ3Bpb3MgcHJvcGVydHkgZm9y
IFBIWXMpIGFuZAppbnRyb2R1Y2luZyBhIHdob2xlIG5ldyBjb25jZXB0IHRvIHRoZSBkZXZpY2Ug
bW9kZWwgZm9yIG1vcmUgYWR2YW5jZWQKKGJ1dCBjdXJyZW50bHkgbW9zdGx5IGh5cG90aGV0aWNh
bCkgY2FzZXMgbG9uZy10ZXJtPwoKQmFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
