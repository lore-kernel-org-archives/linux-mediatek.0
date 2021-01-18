Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE2CC433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 07:59:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5321E224B8
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 07:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5321E224B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7UVGkgkwGE9v/hliG8KuJF3Zp079Hcp4hC8UhHNUFcM=; b=rmxBcdFd2KJwcCjNha3n8+5ny
	ZGXRCrkNdeu2qgEElz7asJKVpcOszImBiJQT1X4WdhzA6cITplSgF3X6/4okp8u4EKLmK56VpHtlW
	3hAwMHGZE6N2aoJ7nMDlvx0qKNQw3OTl9choT/jNC1AV7ZciD2Nv9TV6TKDaUlOp9xsBBVjULPlZ/
	YmFCdXqKcdIU28t+Dz32cpfFYJkpCagFmQb9v7lPUprALeO2+AIlvFK/msYZAaSVww0f2p4TQE+hw
	zRF64zJeC+CeDGzxjHCQfDF8V+UQTqgPBsrzhAuSentBYs8+sA8PLoX8WSDJs4eeCkOjHJAF7h4is
	Q5G49pPKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1PRG-0005uq-KT; Mon, 18 Jan 2021 07:59:02 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1PRC-0005ts-B9; Mon, 18 Jan 2021 07:58:59 +0000
Received: by mail-ot1-x336.google.com with SMTP id w3so15398201otp.13;
 Sun, 17 Jan 2021 23:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+pua5Gz7X03MCfazw2FMpdYgyIB67LM2COVuZ3gUxWQ=;
 b=lSnC3hR4eOjaRFlWfYoewkPPii7bue9M83B4abPBVFrXjO3lZvABE2N/QB11a7uV34
 kfHMcPKtUrNClOKYTPrPqN0e5h2GCUIrAPhIEKtFyTtYXlGTv4eregazSL9i7PbDU/g2
 TqYgt4jUGav/RCzJr7+oSzCuQZfJoRAEh0cw2L9nCijYsUXwOb2nYkU1dcxzXOGSGc0Z
 YAKno1alTvHsbZjbiOLnBzQ83e03uYIxKxsJmAA+v+T7aRwfKMjpTxYCbsdLMrGiJ+o1
 VP1cG9M3QixvKplVx6yvPP84z+3Eb+XEMP8G4EfX6fPXjs0aLkrWwJASMRo7R89O0Q11
 YcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+pua5Gz7X03MCfazw2FMpdYgyIB67LM2COVuZ3gUxWQ=;
 b=Bu4/7esinRGrieaSqVak9lrFOBlYIvcaQjRohIIM5hyo2QS+2X93g93zWSRLwqmgHn
 O5qJfSritnKmZdvyGa/Aue4q0sOsTyqu9dw0Y7jQ850MzgLrMd8F5rdsPySEt+Vn9M75
 MzUmwKmcQgw4CEgrkKok/MmpT8+JZE389jrANCzqKIjzfrfGr+7fsxNnwr91W8okw+7I
 SECnk061PMg/qgBkGydty70WRC/4buwSuwqLlqBZhlEyXq8WfrREkjkvqkXcX/OVtCPP
 d0y+Xr7httMq6sE/m2Bg+Ytrx1w5OSV2jRkP9dMExZCw8C/qxcY3AZHnlaPfBQ+u3Vbf
 xVig==
X-Gm-Message-State: AOAM53241YgO41nFhftHpfBqWpbx5nFIczxqzyE8+YAsJXhMFAX97ELm
 WEA2D+yrN+5aiRCZBPPMDu66QXs42OS7ZoswxX8=
X-Google-Smtp-Source: ABdhPJw374BOPOpd/HDhDTOJyhxewF5r8SqojbvvQxmCnOBYrtv7NQiYnhP1+TOW/VKrUdbqNGmJbKL+eJLlUanW/Wk=
X-Received: by 2002:a05:6830:160f:: with SMTP id
 g15mr16889598otr.129.1610956735299; 
 Sun, 17 Jan 2021 23:58:55 -0800 (PST)
MIME-Version: 1.0
References: <1608796084-29418-1-git-send-email-gene.chen.richtek@gmail.com>
 <1608796084-29418-3-git-send-email-gene.chen.richtek@gmail.com>
 <20210106201654.lkmqorlgcecgqqkf@earth.universe>
 <CAE+NS37t-Gf7fjK0crZ+9qxWxfxm3k8hoEvwystdNP4CjM=KXQ@mail.gmail.com>
 <20210116101237.vktppv2ec7kvtz3v@earth.universe>
In-Reply-To: <20210116101237.vktppv2ec7kvtz3v@earth.universe>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Mon, 18 Jan 2021 15:58:44 +0800
Message-ID: <CAE+NS34dKX+Zrzp3zzL2-NFvh7FrCUEminVT8jMBDOvS1ZQH9w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] power: supply: mt6360_charger: add MT6360 charger
 support
To: Sebastian Reichel <sebastian.reichel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_025858_395017_9036DE47 
X-CRM114-Status: GOOD (  25.79  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree <devicetree@vger.kernel.org>,
 linux-pm@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiYuan Huang <cy_huang@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

U2ViYXN0aWFuIFJlaWNoZWwgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+IOaWvCAy
MDIx5bm0MeaciDE25pelIOmAseWFrSDkuIvljYg2OjEy5a+r6YGT77yaCj4KPiBIaSwKPgo+IE9u
IE1vbiwgSmFuIDExLCAyMDIxIGF0IDA4OjE1OjMzUE0gKzA4MDAsIEdlbmUgQ2hlbiB3cm90ZToK
PiA+IFNlYmFzdGlhbiBSZWljaGVsIDxzZWJhc3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPiDm
lrwgMjAyMeW5tDHmnIg35pelIOmAseWbmyDkuIrljYg0OjE25a+r6YGT77yaCj4gPiA+ID4gKyAg
ICAgbGFzdF91c2JfdHlwZSA9IG1jaS0+cHN5X3VzYl90eXBlOwo+ID4gPiA+ICsgICAgIC8qIFBs
dWcgaW4gKi8KPiA+ID4gPiArICAgICByZXQgPSByZWdtYXBfcmVhZChtY2ktPnJlZ21hcCwgTVQ2
MzYwX1BNVV9VU0JfU1RBVFVTMSwgJnVzYl9zdGF0dXMpOwo+ID4gPiA+ICsgICAgIGlmIChyZXQg
PCAwKQo+ID4gPiA+ICsgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiA+ID4gKyAgICAgdXNiX3N0
YXR1cyAmPSBNVDYzNjBfVVNCX1NUQVRVU19NQVNLOwo+ID4gPiA+ICsgICAgIHVzYl9zdGF0dXMg
Pj49IE1UNjM2MF9VU0JfU1RBVFVTX1NIRlQ7Cj4gPiA+ID4gKyAgICAgc3dpdGNoICh1c2Jfc3Rh
dHVzKSB7Cj4gPiA+ID4gKyAgICAgY2FzZSBNVDYzNjBfQ0hHX1RZUEVfVU5ERVJfR09JTkc6Cj4g
PiA+ID4gKyAgICAgICAgICAgICBkZXZfaW5mbyhtY2ktPmRldiwgIiVzOiB1bmRlciBnb2luZy4u
LlxuIiwgX19mdW5jX18pOwo+ID4gPiA+ICsgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiA+Cj4g
PiA+IElESyB3aGF0IHRoaXMgaXMgc3VwcG9zZWQgdG8gdGVsbCBtZS4gRG8geW91IG1lYW4gImRl
dGVjdGlvbiBpbgo+ID4gPiBwcm9ncmVzcyI/IEFsc28gd2h5IGlzIHRoaXMgaW5mbyBsZXZlbD8g
SSB3b3VsZCBleHBlY3QgZWl0aGVyCj4gPiA+IGRlYnVnIChhc3N1bWluZyBpdCBoYXBwZW5zIHJl
Z3VsYXJseSBhbmQgaXMgbm9ybWFsKSBvciB3YXJuaW5nCj4gPiA+IChhc3N1bWluZyBpdCBzaG91
bGQgbm90IGhhcHBlbikuCj4gPiA+Cj4gPgo+ID4gV2hlbiBoYW5kbGluZyBhdHRhY2ggaW50ZXJy
dXB0IGFuZCBjYWJsZSBwbHVnIG91dCBhdCB0aGUgc2FtZQo+ID4gdGltZSwgSFcgY2hhbmdlIHJl
Z2lzdGVyIHN0YXR1cy4gU28gd2UgZG9uJyBuZWVkIHRvIGhhbmRsZSB0aGlzCj4gPiBhdHRhY2gg
aW50ZXJydXB0IGF0IHRoaXMgY2FzZS4KPgo+IFNvIHRoaXMgaXMgYmFzaWNhbGx5IGZvciBkZWJv
dW5jaW5nPyBJIHN1Z2dlc3QgYWRkaW5nIGEgY29tbWVudDoKPgo+IC8qIFJlY2VpdmVkIGF0dGFj
aCBJUlEgZm9sbG93ZWQgYnkgZGV0YWNoIGV2ZW50LCBzbyBub3RoaW5nIHRvIGRvICovCj4gZGV2
X2RiZyhtY2ktPmRldiwgInVuZGVyIGdvaW5nLi4uXG4iKTsKPiBnb3RvIG91dDsKPgoKU29ycnkg
SSBoYXZlIGEgbGl0dGxlIG1pc3VuZGVyc3RhbmQuCnVuZGVyIGdvaW5nIGlzICJkZXRlY3QgaW4g
cHJvZ3Jlc3MiLgpBdHRhY2hpIGlycSB3aWxsIHRyaWdnZXIgd2hlbiBwb3dlciByZWFkeSh2YnVz
PTVWKSBhbmQgYmMxMgpjaGFyZ2VkZXRlY3Rpb24gZG9uZS4KQW5vdGhlciBpcnEsIERldGFjaGks
IGlzIGluZGljYXRlZCBwb3dlciBub3QgcmVhZHkodmJ1cz0wVikgYW5kIHdoaWNoCmlzIGJlIG1h
c2tlZC4KU28sIGlmIHRoZSB1c2Igc3RhdHVzIGlzIG5vdCBTRFAvTk9OU1REL0NEUC9EQ1AsIHRo
ZSByZXN1bHQgY2FuIGJlCmlnbm9yZWQuIChlLnEuIE5PIFZCVVMvVW5kZXIgZ29pbmcvQkMxMiBk
aXNhYmxlZC9SZXNlcnZlZCBhZGRyZXNzKQoKPiBbLi4uXQo+Cj4gPiA+ID4gKyAgICAgY29uZmln
LmRldiA9ICZwZGV2LT5kZXY7Cj4gPiA+ID4gKyAgICAgY29uZmlnLnJlZ21hcCA9IG1jaS0+cmVn
bWFwOwo+ID4gPiA+ICsgICAgIG1jaS0+b3RnX3JkZXYgPSBkZXZtX3JlZ3VsYXRvcl9yZWdpc3Rl
cigmcGRldi0+ZGV2LCAmbXQ2MzYwX290Z19yZGVzYywKPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmNvbmZpZyk7Cj4gPiA+ID4gKyAgICAgaWYg
KElTX0VSUihtY2ktPm90Z19yZGV2KSkKPiA+ID4gPiArICAgICAgICAgICAgIHJldHVybiBQVFJf
RVJSKG1jaS0+b3RnX3JkZXYpOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICByZXQgPSBtdDYzNjBf
c3lzZnNfY3JlYXRlX2dyb3VwKG1jaSk7Cj4gPiA+ID4gKyAgICAgaWYgKHJldCkgewo+ID4gPiA+
ICsgICAgICAgICAgICAgZGV2X2VycigmcGRldi0+ZGV2LAo+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAiJXM6IEZhaWxlZCB0byBjcmVhdGUgc3lzZnMgYXR0cnNcbiIsIF9fZnVuY19fKTsK
PiA+ID4gPiArICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+ID4gKyAgICAgfQo+ID4gPgo+
ID4gPiBVc2UgY2hhcmdlcl9jZmcuYXR0cl9ncnAgdG8gcmVnaXN0ZXIgY3VzdG9tIHN5c2ZzIGdy
b3VwIGZvcgo+ID4gPiBwb3dlci1zdXBwbHkgZGV2aWNlcy4gT3RoZXJ3aXNlIHlvdXIgY29kZSBp
cyByYWN5ICh1ZGV2IG1heSBub3QgcGljawo+ID4gPiB1cCB0aGUgc3lzZnMgYXR0cmlidXRlcyku
IEFsc28gY3VzdG9tIHN5c2ZzIGF0dHJpYnV0ZXMgbmVlZCB0byBiZQo+ID4gPiBkb2N1bWVudGVk
IGluIERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtY2xhc3MtcG93ZXItPGRyaXZlcj4u
Cj4gPiA+Cj4gPiA+IExvb2tpbmcgYXQgdGhlIGF0dHJpYnV0ZXMgeW91IGFyZSBwbGFubmluZyB0
byBleHBvc2UsIEkgZG9uJ3QgdGhpbmsgdGhleQo+ID4gPiBhcmUgc3VpdGFibGUgZm9yIHN5c2Zz
IGFueXdheXMuIExvb2tzIG1vcmUgbGlrZSBhIGRlYnVnIGludGVyZmFjZSwgd2hpY2gKPiA+ID4g
c2hvdWxkIGdvIGludG8gZGVidWdmcyBpbnN0ZWFkLiBCdXQgaXQncyBoYXJkIHRvIHRlbGwgd2l0
aG91dCBhbnkgZG9jdW1lbnRhdGlvbgo+ID4gPiBiZWluZyBwcm92aWRlZCA6KQo+ID4KPiA+IEFD
SywgSSB3aWxsIGNoYW5nZSB0byBjaGFyZ2VyX2NmZy5hdHRyX2dycC4KPiA+IEkgYXNzdW1lZCB0
aGUgY2hhcmdlciBhbGdvcml0aG0gdGhyZWFkIGlzIGluIHVzZXIgc3BhY2UsIGFuZCB0YWtlCj4g
PiBjb250cm9sIGJ5IHN5c2ZzIG5vZGUgZnJvbSBjaGFyZ2VyIGRldmljZSwgbGlrZSBicTI0MTkw
LmMuCj4gPiBTaG91bGQgSSBjaGFuZ2UgdG8gZGVidWdmcz8KPgo+IEl0J3MgaGFyZCB0byB0ZWxs
IHdpdGhvdXQga25vd2luZyBtb3JlIGFib3V0IHRoZSBhdHRyaWJ1dGVzCj4geW91ciBhcmUgdHJ5
aW5nIHRvIGV4cG9zZS4gSW4gZGVidWdmcyB3ZSBoYXZlIHJlbGF4ZWQgQUJJIHJ1bGVzLAo+IHNv
IGl0J3MgZWFzaWVyIHRvIGFkb3B0IG5hbWluZyBlLnQuYy4gbGF0ZXIuCj4KCkkgYnJpZWZseSBj
bGFzc2lmeSB0aGUgd2hvbGUgYXR0cmlidXRlcy4gVGhlcmUgYXJlIGVpdGhlciB1bnVzZWQsIG9y
CmNhbiBiZSByZXBsYWNlZCBieSBQT1dFUl9TVVBQTFkgUFJPUEVSVFksCnNvIEkgd2lsbCByZW1v
dmUgdW51c2UgcGFydC4KCkhJWiA9IFZCVVNfSU4gaGlnaCBpbXBlZGFuY2UgbW9kZS4KVk1JVlIg
PSBNYXhpbXVtIGlucHV0IHZvbHRhZ2UgcmVndWxhdGlvbi4gTGV0IGlucHV0IHBvd2VyIGNhbiBw
cm92aWRlCmF0IHRoZSBwcmVkZXRlcm1pbmVkIHZvbHRhZ2UgbGV2ZWwuCihsaWtlIFBPV0VSX1NV
UFBMWV9QUk9QX0lOUFVUX1ZPTFRBR0VfTElNSVQpClNZU1JFRyA9IENvbmZpZyBzeXN0ZW0gbWlu
aW11bSByZWd1bGF0aW9uIHZvbHRhZ2UuCk9UR19PQyA9IG1heGltdW0gY3VycmVudCBvZiBiYXR0
ZXJ5IGJvb3N0IE9URyA1Vi4KSUNIRyA9IG1heGltdW0gQ2hhcmdpbmcgY3VycmVudC4gKGxpa2UK
UE9XRVJfU1VQUExZX1BST1BfQ09OU1RBTlRfQ0hBUkdFX0NVUlJFTlQpCklFT0MgPSBMaWtlIFBP
V0VSX1NVUFBMWV9QUk9QX0NIQVJHRV9URVJNX0NVUlJFTlQKVk9SRUcgPSBJbnB1dCB2b2x0YWdl
IHJlZ3VsYXRpb24uIChsaWtlClBPV0VSX1NVUFBMWV9QUk9QX0NPTlNUQU5UX0NIQVJHRV9WT0xU
QUdFKQpMQlAgPSBMb3cgYmF0dGVyeSBwcm90ZWN0aW9uIGZvciBiYXR0ZXJ5IGJvb3N0IE9URyA1
Vi4KVlBSRUMgPSBQcmUtY2hhcmdlIHZvbGF0Z2UgbGV2ZWwuIChtYXliZSBjYW4gYWRkIG5ldyBw
cm9wClBPV0VSX1NVUFBMWV9QUk9QX1BSRUNIQVJHRV9WT0xUQUdFKQpURSA9IENoYXJnZSB0ZXJt
aW5hdGlvbiBlbmFibGUvZGlzYWJsZS4KQ0hHX1dEVF9FTiA9IENoYXJnZXIgV2F0Y2ggZG9nIHRp
bWVyIGVuYWJsZS9kaXNhYmxlLgpDSEdfV0RUID0gQ2hhcmdlciBXYXRjaCBkb2cgdGltZXIsIDgv
NDAvODAvMTYwcy4KV1RfRkMgPSBGYXN0IGNoYXJnZSBUaW1lciwgNH4yMGhyLgpCQVRfQ09NUCA9
IEJhdHRlcnkgSVIgY29tcGVuc2F0aW9uIHJlc2lzdG9yIHNldHRpbmcuClZDTEFNUCA9IEJhdHRl
cnkgSVIgY29tcGVuc2F0aW9uIG1heGltdW0gdm9sdGFnZSBjbGFtcC4KVVNCQ0hHRU4gPSBVU0Ig
Y2hhcmdlciBkZXRlY3Rpb24gZmxvdyBlbmFibGUvZGlzYWJsZS4KQ0hHX0VOID0gQmF0dGVyeSBj
aGFyZ2luZyBlbmFibGUvZGlzYWJsZS4KQ0hSREVUX0VYVCA9IFZCVVNfSU4gaXMgYmV0d2VlbiBW
QlVTX1VWX1RIKDMuN1YpIGFuZCBWQlVTX09WX1RIKDEwLjVWKQoKPiAtLSBTZWJhc3RpYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
