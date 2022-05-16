Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE52BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 19:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/Adz555/mcEJ3IjrXeU7nmN42GkJY1o722jq9tEINo=; b=pbxv+SZbKy4uKU
	SmV4yNIYjuT1fDomKmqBXSy3oxpzpFEyTEKv9YxvCzz7V6voWsswwslRtOAKdOoDqKfAJ66ZlfYEq
	wryPOzYHM0P7bFTiElP+5tS9NE3eAK0YgJzLV8Vs7D5g4EMCmcfmnMKpJF+ndDkzzyrxAQU/fhLGS
	cjV6T4lffLtncqO/B0NsJ4Xz6A2dWJEWBJkfxXceLHTaw9pcr1Co2AtOkPwt43vcSp/oWwSe06S3I
	pCghl6vBFsjAA98HEeBCyF21fg7TlLiibCEctcliRedRXU15/7pSpNCiQMwoNEfx28XkmG0PK2MP8
	evDluDoMH21XfFVxj+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqgH9-009lqu-DQ; Mon, 16 May 2022 19:21:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqgGz-009lon-Mz
 for linux-mediatek@lists.infradead.org; Mon, 16 May 2022 19:20:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E8A15CE16FB
 for <linux-mediatek@lists.infradead.org>; Mon, 16 May 2022 19:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496A9C385AA
 for <linux-mediatek@lists.infradead.org>; Mon, 16 May 2022 19:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652728844;
 bh=qwaR9MS+vRCYsBAEEmVSvTOhEEi9a2Uj6OE3qZoj8Wc=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=fQpGBN9aXw3RRjl8JoOUn2he9ISaMAGYYRxWOJJQ896uuGbDINgShQn0nYlfsUUjL
 jPglvCuaYkA33QwBQOZDlxfD6CBI2UTDS7gCGgfZhWWLKP0KiKnOmLajVF70o1xL4c
 DIRY07+9qvgyipTeLnvAQcbEU66gx7idx6X3WX1FIrq8axRn8GPrikzXZsBcvOBs/V
 //fct5hSc3CJgMfoET7Gu7bk1fowazvPCl4Zk9x8ymNU3kZMNYEoUjAyuBoj19hLmg
 meL8yUHngejdeBlMfg8p36UrcSeakJwasimMA/Y4SXWW2H7caCfycK8cSLZIP5n7C5
 ssXxdQ16RPhrQ==
Received: by mail-io1-f43.google.com with SMTP id f4so17047724iov.2
 for <linux-mediatek@lists.infradead.org>; Mon, 16 May 2022 12:20:44 -0700 (PDT)
X-Gm-Message-State: AOAM532Pv4kSVIBToOdxnO1ZVI/o4UM4ghJkgowbjkpJV/bRlDvkGD5A
 qsNt53a/GCiEq/ytavTedtSDYealUfNIYoZghRU=
X-Google-Smtp-Source: ABdhPJx6+tyZr+cCMZ4s+UJPlLzZR/SlQ6X8GG8QqZTDRpwrF59NKWw4qKWbENpxelAOvNDyLqNfW1l4Oqbd1badVTM=
X-Received: by 2002:a05:6638:3e86:b0:32e:30d4:af53 with SMTP id
 ch6-20020a0566383e8600b0032e30d4af53mr3402267jab.146.1652728843486; Mon, 16
 May 2022 12:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <2537b84fbba82a77ee0a517b12bdcdd5e6ac1503.camel@mediatek.com>
 <20220511162931.nlb4gdbnefjgozpu@notapiano>
In-Reply-To: <20220511162931.nlb4gdbnefjgozpu@notapiano>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 16 May 2022 15:20:32 -0400
X-Gmail-Original-Message-ID: <CA+5PVA43SgXKz5EA6RTk74FxiDALy899G1Rvi_aO=q9Yd_pCKw@mail.gmail.com>
Message-ID: <CA+5PVA43SgXKz5EA6RTk74FxiDALy899G1Rvi_aO=q9Yd_pCKw@mail.gmail.com>
Subject: Re: [PULL] mediatek: Update mt8192 firmware
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Tinghan Shen <tinghan.shen@mediatek.com>,
 Linux Firmware <linux-firmware@kernel.org>, 
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Rong Chang <rongchang@google.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, Shawn Ku <shawnku@google.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, weishunc@google.com, 
 nfraprado@collabora.corp-partner.google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_122054_133259_7FC6E630 
X-CRM114-Status: GOOD (  21.13  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMTEsIDIwMjIgYXQgMTI6MjkgUE0gTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8K
PG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgTWF5IDExLCAyMDIy
IGF0IDAyOjU0OjQyUE0gKzA4MDAsIFRpbmdoYW4gU2hlbiB3cm90ZToKPiA+IEhpIGxpbnV4LWZp
cm13YXJlIG1haW50YWluZXJzLAo+ID4KPiA+IFVwZGF0ZSB0aGUgTWVkaWFUZWsgbXQ4MTkyIGZp
cm13YXJlIHRvIHYyLjAuODUzNy4KPiA+Cj4gPgo+ID4gVGhhbmtzLAo+ID4gVGluZ0hhbgo+ID4K
PiA+IC0tCj4gPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGIxOWNiZGNhNzhh
YjJhZGZkMjEwYzkxYmUxNWEyMjU2OGU4YjhjYWU6Cj4gPgo+ID4gICBNZXJnZSBicmFuY2ggJzgx
ODMtdjIuMC4yNzQ1JyBvZiBodHRwczovL2dpdGh1Yi5jb20vdGluZ2hhbi1zaGVuL2xpbnV4X2Z3
X3NjcCBpbnRvIG1haW4gKDIwMjItMDUtCj4gPiAwOSAxMzo1OTo0MyAtMDQwMCkKPiA+Cj4gPiBh
cmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiA+Cj4gPiAgIGh0dHBzOi8v
Z2l0aHViLmNvbS90aW5naGFuLXNoZW4vbGludXhfZndfc2NwIDgxOTItdjIuMC44NTM3Cj4gPgo+
ID4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDg2ZTY0ZmU3YzA1MmI4NTc2MmVlZWZj
MjU4YzM3OTMzMWU2YjIwYjM6Cj4gPgo+ID4gICBtZWRpYXRlazogVXBkYXRlIG10ODE5MiBTQ1Ag
ZmlybXdhcmUgKDIwMjItMDUtMTEgMTM6MzY6NDggKzA4MDApCj4KPiBIaSBUaW5nSGFuLAo+Cj4g
dGhhbmsgeW91IGZvciB0aGlzIHVwZGF0ZS4gVW5saWtlIHRoZSBwcmV2aW91cyBtdDgxOTIgZmly
bXdhcmUgd2hpY2ggaGFkIHRyb3VibGUKPiBib290aW5nLCB0aGlzIGZpcm13YXJlIGRvZXMgd29y
ayBhbmQgSSB3YXMgYWJsZSB0byBkZWNvZGUgVlA4IGFuZCBWUDkgd2l0aCBpdCBvbgo+IG10ODE5
Mi1hc3VyYWRhLXNwaGVyaW9uIHdpdGggdGhlIG10ODE5MiBkZWNvZGVyIHNlcmllcyBbMV0gYXBw
bGllZC4gU28sCj4KPiBUZXN0ZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJh
ZG9AY29sbGFib3JhLmNvbT4KClB1bGxlZCBhbmQgcHVzaGVkIG91dC4KCmpvc2gKCj4KPiBUaGFu
a3MsCj4gTsOtY29sYXMKPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA1
MDYwOTI4NTUuMjI5NDAtMS15dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20vCj4KPiA+Cj4gPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gPiBUaW5naGFuIFNoZW4gKDEpOgo+ID4gICAgICAgbWVkaWF0ZWs6IFVwZGF0ZSBtdDgx
OTIgU0NQIGZpcm13YXJlCj4gPgo+ID4gIFdIRU5DRSAgICAgICAgICAgICAgICAgIHwgICAyICst
Cj4gPiAgbWVkaWF0ZWsvbXQ4MTkyL3NjcC5pbWcgfCBCaW4gMzA5NDM2IC0+IDMyNzk2OCBieXRl
cwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+
Cj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
