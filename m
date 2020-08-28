Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F82AC433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 10:27:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE19E2080C
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 10:27:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mcr9fF7o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="spNyOxSf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE19E2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9hogJ2s5PiPBCzJyIynfs20KkhVbz7vbiU0JKUJjxaw=; b=mcr9fF7o2GmzH21kkrLquhB57
	313QQB3Yx6W1dr2Bdt2MU9kqQbdmHVIyYHS5g8HcQRnv1xAwAMYx6RBwDg0faEXKH5amOrbzUI+hC
	d4mX4lSZJ2IylcLU6YXPJUkLKNnuhmWUZyOCz91pypL9B3T+URAukZ/w5kVGIQovNhe/BCWxOcLjT
	gjeWlT3Zm4oy1fmwgiBFqUSb1GmdOO9puKi4LrIgEsGzQGCdSdxV1ydHyLSaD0/dq/yAHgMcCR+kV
	qEQnYRIame0p6MJVGH3CIgssUUkjTZGVGT3ddMxkfHG3mdhpkZvg5hLc7P3GYzpIgE0iB8mud6lA/
	i+zBgqnOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBbbk-0006F7-0P; Fri, 28 Aug 2020 10:27:44 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBbbf-0006Dy-SL; Fri, 28 Aug 2020 10:27:40 +0000
Received: by mail-lj1-x242.google.com with SMTP id w14so732467ljj.4;
 Fri, 28 Aug 2020 03:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9lkDtTLkGO4tunK9zfL/WiafTkLAKRGScdfHrpzp3JI=;
 b=spNyOxSftXQHpB4Sd8g8X4z8C5IO1ZTMyOsFoosXikVQn7HyGPcWHLis8+XCxg8x0x
 HLdKXM8I3erEmOcY/9eHeYUlr5oySoV0rmEsf/SXrQZzI8NXe5LxG/Prsk/d7JleYVn5
 tccBNcpl+6Nc+enEpm58fJ8zYDlO+1deYvDb6MdyqQ2LFzev3va+VdaKjadspPdsNoJU
 9e5W8jI8t4VJfqIUcU2zK5SlZQ4WUFrxXd9VsRL5iGdsHW3dfaa/VHvUJ/xUBISvnPhs
 86rkMjvNn54zPjANcWI4Yoddi+kxaDENxbUglwUFAdpqSZy4pZTC5l7o+psJBs31MaLM
 Ib3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9lkDtTLkGO4tunK9zfL/WiafTkLAKRGScdfHrpzp3JI=;
 b=dW8tDAAy5cjdXTFDCx9qkYXYoE8SIXOIBH6XokBYHCI+k1zmPgMlRCrZk4tABImtk4
 fObMzL6gqxpi0mROFAB+Qov3Uoy3/YlOGWQJvq9L87RgHK3mYQsUfJRy7MPxSHODgqL4
 dJiQBYytESHBieZA4Sdz0PpZV5K/DdMmET05IIg/8ciewtaIRshsrBz9Vpg+nESS+rdh
 nkdOnKfiDkAPEkx3LbDxcdhrhuEPG8mpezpkFG/z/Doo0/bThizRBkQBlsSTe1e/ABO3
 IJvPRUCmSQ03DpiGr2q+/IVc9KQeZftVIIz8mq+aYR3ijbhvscRnUM0pynIU7frII6VE
 y45w==
X-Gm-Message-State: AOAM533pDQ7sL3c9YLshBNSj76GrqPfEi/a0zK5F9W/YaTSzxZX/FpUJ
 xjPj/BV5mdEDN+8OPyP3GUkrMlQFQ+/OMw1WIQM=
X-Google-Smtp-Source: ABdhPJym9/rev86EcxGFP4d6ftha9uJUJcdwhmiamaAHPf17cUq+zUwL7bIUrFoz/Ydafu1saf4+BKlVaVOJXTmXCQs=
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr531200ljn.356.1598610458337; 
 Fri, 28 Aug 2020 03:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <1598527137-6915-1-git-send-email-u0084500@gmail.com>
 <20200827140001.GE813478@kuha.fi.intel.com>
 <CADiBU393V_iQw_8Hx2braL=8QpvQuTY0059C-XkqmjO9W=aBgQ@mail.gmail.com>
 <20200828093835.GC174928@kuha.fi.intel.com>
In-Reply-To: <20200828093835.GC174928@kuha.fi.intel.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Fri, 28 Aug 2020 18:27:26 +0800
Message-ID: <CADiBU3-S025q10WYzLk+v2K-5V+iTP=zDu4i8srTpHQvRkm0UQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] usb typec: mt6360: Add support for mt6360 Type-C
 driver
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_062739_927948_E4EE414B 
X-CRM114-Status: GOOD (  24.56  )
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

SGVpa2tpIEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tPiDmlrwgMjAy
MOW5tDjmnIgyOOaXpSDpgLHkupQg5LiL5Y2INTozOeWvq+mBk++8mgo+Cj4gT24gVGh1LCBBdWcg
MjcsIDIwMjAgYXQgMTA6NTE6NDNQTSArMDgwMCwgQ2hpWXVhbiBIdWFuZyB3cm90ZToKPiA+IEhl
aWtraSBLcm9nZXJ1cyA8aGVpa2tpLmtyb2dlcnVzQGxpbnV4LmludGVsLmNvbT4g5pa8IDIwMjDl
ubQ45pyIMjfml6Ug6YCx5ZubIOS4i+WNiDEwOjAw5a+r6YGT77yaCj4gPiA+Cj4gPiA+IE9uIFRo
dSwgQXVnIDI3LCAyMDIwIGF0IDA3OjE4OjU1UE0gKzA4MDAsIGN5X2h1YW5nIHdyb3RlOgo+ID4g
PiA+IEZyb206IENoaVl1YW4gSHVhbmcgPGN5X2h1YW5nQHJpY2h0ZWsuY29tPgo+ID4gPiA+Cj4g
PiA+ID4gTWVkaWF0ZWsgTVQ2MzYwIGlzIGEgbXVsdGktZnVuY3Rpb25hbCBJQyB0aGF0IGluY2x1
ZGVzIFVTQiBUeXBlLUMuCj4gPiA+ID4gSXQgd29ya3Mgd2l0aCBUeXBlLUMgUG9ydCBDb250cm9s
bGVyIE1hbmFnZXIgdG8gcHJvdmlkZSBVU0IgUEQKPiA+ID4gPiBhbmQgVVNCIFR5cGUtQyBmdW5j
dGlvbmFsaXRpZXMuCj4gPiA+ID4KPiA+ID4gPiB2MSB0byB2Mgo+ID4gPiA+IDEuIEFkZCBmaXgg
dG8gUHJldmVudCB0aGUgcmFjZSBjb25kaXRpb24gZnJvbSBpbnRlcnJ1cHQgYW5kIHRjcGNpIHBv
cnQKPiA+ID4gPiB1bnJlZ2lzdGVyIGR1cmluZyBtb2R1bGUgcmVtb3ZlLgo+ID4gPiA+Cj4gPiA+
ID4gdjIgdG8gdjMKPiA+ID4gPiAxLiBDaGFuZ2UgY29tbWVudCBzdHlsZSBmb3IgdGhlIGhlYWQg
b2Ygc291cmNlIGNvZGUuCj4gPiA+ID4gMi4gTm8gbmVlZCB0byBwcmludCBlcnJvciBmb3IgcGxh
dGZvcm1fZ2V0X2lycV9ieW5hbWUuCj4gPiA+ID4gMy4gRml4IHRjcGNpX3JlZ2lzdGVyX3BvcnQg
Y2hlY2sgZnJvbSBJU19FUlJfT1JfTlVMTCB0byBJU19FUlIuCj4gPiA+ID4gNC4gUmVuYW1lIGRy
aXZlci9LY29uZmlnL01ha2VmaWxlIGZvcm0gbXQ2MzYwIHRvIG10NjM2eC4KPiA+ID4gPiA1LiBS
ZW5hbWUgRFQgYmluZGluZyBkb2N1bWVudHMgZnJvbSBtdDYzNjAgdG8gbXQ2MzZ4Lgo+ID4gPgo+
ID4gPiBZb3UgZG9uJ3QgcGxhY2UgYWRkaXRpb25hbCBjaGFuZ2Vsb2cgaGVyZS4uLgo+ID4gPgo+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IENoaVl1YW4gSHVhbmcgPGN5X2h1YW5nQHJpY2h0ZWsuY29t
Pgo+ID4gPiA+IC0tLQo+ID4gPgo+ID4gPiBZb3UgcHV0IGl0IGhlcmUsIGFmdGVyIHRoYXQgJy0t
LScgbWFya2VyOgo+ID4gPiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9w
cm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI3RoZS1jYW5vbmljYWwtcGF0Y2gtZm9ybWF0
Cj4gPiA+Cj4gPiBISSBIZWtraToKPiA+ICAgICAgYWZ0ZXIgcmVhZGluZyB0aGUgZG9jdW1lbnQs
IEkgaGF2ZSBhIGxpdHRsZSBiaXQgY29uZnVzZWQgaG93IHRvCj4gPiB1c2UgZGlmZnN0YXQgZm9y
IHRoZSBjaGFuZ2Vsb2cuCj4gPiAgICAgICBJcyB0aGVyZSBhbnkgZXhhbXBsZSB0aGF0IG1ha2Ug
bWUga25vdyB0byB3cml0ZSBhIGNsZWFyCj4gPiBkZXNjcmlwdGlvbiBmb3IgdGhlIGNoYW5nZWxv
Zz8KPgo+IFBpY2tpbmcgdGhlIGxhdGVzdCBwYXRjaCBmcm9tIGxpbnV4LXVzYiBtbC4gd2l0aCB2
ZXJzaW9uIGhpc3Rvcnk6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtdXNiLzE1OTgw
ODM1NTMtMzE4OTYtMTEtZ2l0LXNlbmQtZW1haWwtY2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbS8K
Pgo+IFNlZSBob3cgdGhlIGxhc3QgdGFnIGxpbmUgIlNpZ25lZC1vZmYtYnk6IENodW5mZW5nIFl1
bi4uLiIgaXMgZm9sbG93ZWQKPiBieSBtYXJrZXIgIi0tLSIsIHdoaWNoIHRoZW4gaXMgZm9sbG93
ZWQgYnkgdGhlIHZlcnNpb24gaGlzdG9yeSAodGhlCj4gdmVyc2lvbiBoaXN0b3J5IGlzIHRoZW4g
YWxzbyBlbmRlZCB3aXRoIHRoZSBtYXJrZXIgIi0tLSIsIGEgc3RlcCB0aGF0Cj4gSSBkb24ndCB0
aGluayBpcyBtYW5kYXRvcnksIGJ1dCBjb21tb25seSB1c2VkIGFuZCBvZnRlbiByZWNvbW1lbmRl
ZCkuCj4KPiBUaGF0IHdheSB0aGF0IHBhdGNoIHZlcnNpb24gaGlzdG9yeSBkb2VzIG5vdCBjb250
YW1pbmF0ZSB0aGUgYWN0dWFsCj4gY29tbWl0IG1lc3NhZ2UuCj4KPgo+IHRoYW5rcywKPgpBaCwg
SSBhbHJlYWR5IHNlbmQgdGhlIHBhdGNoIHY0LCBJIG9ubHkgYWRkIHRoZSBjaGFuZ2Vsb2cgYWZ0
ZXIgdGhlCnNpZ24tb2ZmIC0tLSBsYWJlbCwgYnV0IGZvcmdldCB0byBhZGQgLS0tIGFmdGVyIGNo
YW5nZWxvZyBlbmRlZAoKUGxlYXNlIGxldCBtZSByZXNlbmQgdGhlIHBhdGNoIHY0IHRvIGFkZCAt
LS0gbGFiZWwgYWZ0ZXIgdGhlIGNoYW5nZSBsb2cgZWRlZC4KPiAtLQo+IGhlaWtraQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
