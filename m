Return-Path: <SRS0=/klC=A3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4790BC433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 10:13:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11C1D2074B
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 10:13:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c9WLj2rF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnwxWB5n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11C1D2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BthYsUVuC6I8V2H0GHjoSwdSv/qOrMIiUiKXyL+4PUI=; b=c9WLj2rFGYncwkry14TKTerEK
	gtOQS4AW2Qsp/YiF3AInzKko88Hy74Pa4A/JJmTWG7wyPsF4p61NDrj1Q5ToAC37bHkBBQy3uq+YW
	8hqSvUvNv5CQX2HCQpPrh2el870nenALZIdSr7p7MBMgAd05oVAnhgCGsoA7fZNCWVmbmuZwu7sdi
	4TmgMvk4dNDlgQ7K16XJg5/rMIgs26KmOLJAAQajkx3RBMbOERSybPO2TyZTZ+c6ESXc4OqLvsFau
	eQf3FANrk+soT+MRBCpk6wEPKNrpxiK3CWew7+7qlxDygkIK8x/IZFhu2e5mDV9/5G64kVjgCEF9H
	sah214zGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw0t4-0002mW-TF; Thu, 16 Jul 2020 10:13:10 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw0sy-0002kK-M4; Thu, 16 Jul 2020 10:13:05 +0000
Received: by mail-io1-xd41.google.com with SMTP id i4so5381795iov.11;
 Thu, 16 Jul 2020 03:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UVSUvMmGFLUkKum7MuCJsKB4zScIvSW6XBRGHMBXovI=;
 b=nnwxWB5nbEedMdL5kQECjnAUyHVcThBpkh6AyS0YxPd+lLGuMcdd6ft4Xg2OMx30Ln
 KBjZzmMZkOmtBTJo1yCIriviCdDdEDp7J7WtdD1mvH7IEZaSjkjYnPF6FS2UmIO9flBg
 F7athv29zSKXA9nurBHOa8Plv/B++y7PnIi0rBac5qGardrV4PM8GGF0zRCnUBGExE/y
 k+urYbu5ntw4oFyBiU42isFOleRMLPe7fi2D5elIJ9/rrtaS18g+Aawd2BOQRVaOD80b
 lujgb33HFwX6FX1Egb6uByYdqNqs9gcY26XuWMrMtW6i1WrfaeFKHeyLH43wy8+15r3C
 HduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UVSUvMmGFLUkKum7MuCJsKB4zScIvSW6XBRGHMBXovI=;
 b=mHAy2VSTq8Cx2UnUJJSGqRMiOH2c9ts/98gr73db4pqna+2KvGAN4zqzTtDpmgIWyI
 +Fxg69J2KF3YJcLDm3amIPbPMf98wh2PlbrVmk6Vtd9MQ7Z0FwW8eTAJI9BIOrrANnyg
 2YSOW75FIyffdfwSLxmbw6U4wNyXKRI38m9KUxdb/L2G1QTw5qUYzxz6a02eAJgzPeKf
 QpszZMur34zB7p6vGQmY3clZwlG7WMTGK1+E4PtaTLEN5sWvdcKeWJNylTQug8rhF/QI
 7VZTAPXHhKUJrs5eFwMugqNDhw682AXldhJ40Rk3Sse2mJY4jHr5UFzfXo7InrSUkYq6
 Qwdg==
X-Gm-Message-State: AOAM532QJVaSM280y+pKh6iBdSNI6HTYpknAYIgxdvRzaApjDevb+Oik
 breZZO9eLMdy1DwAdNay2y2zOaPbpim/O2EYYXw=
X-Google-Smtp-Source: ABdhPJwZ7zUlj1sz0Az8nGVh3eFi91mGEmmIlOpREI9vwpsWQttiLfwEFzvS3P2giktGt3C6aCmxYXO/tcvR/Ws0G8g=
X-Received: by 2002:a05:6638:240f:: with SMTP id
 z15mr4300797jat.76.1594894382841; 
 Thu, 16 Jul 2020 03:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <1594117856-14343-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594117856-14343-2-git-send-email-gene.chen.richtek@gmail.com>
 <b9540dc6-4d43-45e4-8878-15d2df24a268@gmail.com> <20200713065110.GB3500@dell>
 <CAE+NS36uRRqHetQE5QVJ94WX4g7CdQzvD-0VOnLfKAbqdHs3Sg@mail.gmail.com>
 <20200713104816.GD3500@dell>
In-Reply-To: <20200713104816.GD3500@dell>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Thu, 16 Jul 2020 18:12:51 +0800
Message-ID: <CAE+NS36EEVb0JLDuZ_0tyocu7PeQSpyNGOWm-jWLW2kZFD=jYg@mail.gmail.com>
Subject: Re: [PATCH 1/4] mfd: mt6360: Refactor and fix code style
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_061304_794104_B3A21630 
X-CRM114-Status: GOOD (  18.58  )
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
Cc: Gene Chen <gene_chen@richtek.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjDlubQ35pyIMTPml6Ug6YCx
5LiAIOS4i+WNiDY6NDjlr6vpgZPvvJoKPgo+IE9uIE1vbiwgMTMgSnVsIDIwMjAsIEdlbmUgQ2hl
biB3cm90ZToKPgo+ID4gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjDl
ubQ35pyIMTPml6Ug6YCx5LiAIOS4i+WNiDI6NTHlr6vpgZPvvJoKPiA+ID4KPiA+ID4gT24gRnJp
LCAxMCBKdWwgMjAyMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKPiA+ID4KPiA+ID4gPgo+ID4g
PiA+Cj4gPiA+ID4gT24gMDcvMDcvMjAyMCAxMjozMCwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gPiA+
ID4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiA+ID4gPgo+ID4g
PiA+ID4gUmVhcnJhbmdlIGluY2x1ZGUgZmlsZS4KPiA+ID4gPiA+IFJlbW92ZSBicmFja2V0cyBh
cm91bmQgcmF3IG51bWJlcnMuCj4gPiA+ID4gPiBJbmRpY2F0ZSBzdWItZGV2IGNvbXBhdGlibGUg
bmFtZSBieSB1c2luZyAiLSIKPiA+ID4gPiA+IENvbWJpbmUgbXQ2MzYwIHBtaWMvbGRvIHJlc291
Y2VzIGludG8gbXQ2MzYwIHJlZ3VsYXRvciByZXNvdXJjZXMuCj4gPiA+ID4gPiBSZW5hbWUgbXQ2
MzYwX3BtdV9kYXRhIGJ5IG10NjM2MF9kYXRhLgo+ID4gPiA+ID4gUmVuYW1lIG10NjM2MF9wbXUg
YnkgbXQ2MzYwLgo+ID4gPiA+Cj4gPiA+ID4gVGhhdCBzZWVtcyBsaWtlIGEgbG90IG9mIGNvc21l
dGljcy4gV2h5IGlzIHRoaXMgbmVlZGVkPwo+ID4gPiA+IElmIHlvdSB0aGluayB0aGF0J3MgbmVl
ZGVkIGl0IHNob3VsZCBiZSBzcGxpdCB1cCBpbiBkaWZmZXJlbnQgY29tbWl0cywgZWFjaAo+ID4g
PiA+IGV4cGxhaW5pbmcgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHdoeSB5b3UgZG8gdGhhdC4KPiA+
ID4KPiA+ID4gQWdyZWVkLiAgVGhpcyBzZXQgaXMgc3RpbGwgbm90IGJyb2tlbiB1cCBlbm91Z2gu
Cj4gPiA+Cj4gPiA+IFBsZWFzZSBwbGFjZSBlYWNoIGxvZ2ljYWwgY2hhbmdlIGludG8gaXRzIG93
biBwYXRjaCBmb3IgcmV2aWV3Lgo+ID4gPgo+ID4KPiA+IDEuIFJlYXJyYW5nZSBpbmNsdWRlIGZp
bGUuCj4gPiBBZnRlciBjaGVjayBzZXJ2ZXJhbCBmaWxlIGFib3V0IGNvZGluZyBzdHlsZSwgaW5j
bHVkZSBmaWxlIHNlZW1zIHNvcnQKPiA+IGJ5IGFyY2hpdGVjdHVyZSwgbm90IGJ5IGFscGhhYmV0
Cj4gPiAyLiBSZW1vdmUgYnJhY2tldHMgYXJvdW5kIHJhdyBudW1iZXJzLgo+ID4gRHVlIHRvIHJl
ZHVuZGFudCBicmFja2V0cywgYW5vdGhlciByZXZpZXdlciByZWNvbW1lbmRlZCB0byBkZWxldGUg
dGhlbS4KPiA+IDMuIEluZGljYXRlIHN1Yi1kZXYgY29tcGF0aWJsZSBuYW1lIGJ5IHVzaW5nICIt
Igo+ID4gU3VnZ2VzdGlvbiBieSBMZWVzIHdoZW4gcmV2aWV3IG1mZCBiaW5kaW5nIGRvY3VtZW50
Lgo+ID4gNC4gQ29tYmluZSBtdDYzNjAgcG1pYy9sZG8gcmVzb3VjZXMgaW50byBtdDYzNjAgcmVn
dWxhdG9yIHJlc291cmNlcy4KPiA+IFNpbXBsaWZ5IHRoZSBzaW1pbGFyIHJlc291cmNlcyBvYmpl
Y3QuCj4gPiA1LiBSZW5hbWUgbXQ2MzYwX3BtdV9kYXRhIGJ5IG10NjM2MF9kYXRhLgo+ID4gTm90
IG9ubHkgaW5jbHVkZSBwbXUgcGFydCwgYnV0IGFsc28gZW50aXJlIE1UNjM2MCBJQy4KPiA+IDYu
IFJlbmFtZSBtdDYzNjBfcG11IGJ5IG10NjM2MC4KPiA+IFNhbWUgcmVhc29uIGFzIGFib3ZlLgo+
ID4KPiA+IFdlIHRyeSB0byBtYWtlIGNvZGUgbW9yZSBzaW1wbGVyIGFuZCBlYXNpZXIgdG8gdW5k
ZXJzdGFuZAo+ID4gV2UgY2FuIGFsc28gZGlzY2FyZCBjaGFuZ2VzIGlmIHBhdGNoIDEsMiw0LDUs
NiBkb2Vzbid0IG1ha2UgYW55IGRpZmZlcmVuY2UuCj4KPiBJJ20gbm90IHN1cmUgd2hhdCB5b3Un
cmUgdHJ5aW5nIHRvIHNheS4KPgo+IFBsZWFzZSBwbGFjZSBlYWNoIG9uIG9mIHRoZXNlIGNoYW5n
ZXMgaW50byB0aGVpciBvd24gcGF0Y2guCj4KCkkgbGlzdCBhbGwgdG9waWMgYW5kIHJlYXNvbiB3
aHkgd2Ugd2FudCB0byBtb2RpZnkuCkJlZm9yZSBzcGxpdCBpbnRvIHBhdGNoZXMsIGNhbiB3ZSBk
aXNjdXNzIHdoaWNoIHRvcGljIHJldmlld2VyIGNhbiBhY2NlcHQ/Cm9yIEkgbmVlZCBmaXggZmly
c3Q/Cgo+IExlZSBKb25lcyBb5p2O55C85pavXQo+IFNlbmlvciBUZWNobmljYWwgTGVhZCAtIERl
dmVsb3BlciBTZXJ2aWNlcwo+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBcm0gU29Dcwo+IEZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
