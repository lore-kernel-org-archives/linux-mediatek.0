Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61016C433EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 15:56:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20D462064B
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 15:56:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hcbr/I7J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ml5zd+AR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20D462064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pmdHrWyS+h8M/88i/9TY3CIgMfLnHWaEC3HrsKzNkh8=; b=Hcbr/I7Jqn1K51IZTSBvUY4IX
	uLEhF6d9IZuKtuHJRC8ceEMhNrAkQIs8Sn5zV5LcoLD6DgXceSmqzlauVIUbsnccKVUZeiKLg94Cx
	hnviJrUcExlQWiAj2XYZj9fyjt0PKfZOPWS0xreUu1mxzEiHAquWVubYP/gPhCGoLI//+j/TMOe23
	MhP7pGy/B+B1nxVf6pWKlCEj/pc6rAadv7e7Un9ZMjI7gHFZ6b+rvrwP2wODz2FMV/pvzW1HnCgGy
	TvdpFEiHR27XNTQ/EEF75NDZvJh4XfvU/R5qKGVU5ztptpo6h4M57TDxHKXB22ICilpfCMrbugcgP
	jVe9Mb1BQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jz036-0007CV-3g; Fri, 24 Jul 2020 15:55:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jz031-0007Ap-LW; Fri, 24 Jul 2020 15:55:48 +0000
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 646042064B;
 Fri, 24 Jul 2020 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595606146;
 bh=ef9b9MrLIUtKbittV7a9VvvZiypl5gf/FW3sc+SuyUE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ml5zd+ARiR6k/XxHY36LPr4PFo4vCnU0ijem8l5bQMxvQB1uUcExCJoYluKyyYPF4
 tlyFubWCFIDH8KnKqDGQcCUKNDeeLKfvgi0/uFn1rDkPL5TY64gx66gpe7zf4cSgLa
 pkNP5edt4VdqRmlZkwycQ3bVIYdiafhw757ecgAg=
Received: by mail-ej1-f50.google.com with SMTP id n22so10476492ejy.3;
 Fri, 24 Jul 2020 08:55:46 -0700 (PDT)
X-Gm-Message-State: AOAM531ZTieP/6iUjWhGuz5mlJUsmOC7VGOqt8MkzmQVdhkQG2RVB//A
 LS1buTz13idDE4U2MWCuhWyYQ0bfRTD/uI34dw==
X-Google-Smtp-Source: ABdhPJy+hSjOTKEuuBWp5FZGv7u6g6/L+gNwd61AdxT8/pqjf8dQCr+Li/TNi3xesAxIUkGbqGnKH/ddFkpS6ODlrXA=
X-Received: by 2002:a17:906:6959:: with SMTP id
 c25mr9580542ejs.375.1595606144973; 
 Fri, 24 Jul 2020 08:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <1595303971-8793-1-git-send-email-neal.liu@mediatek.com>
 <1595303971-8793-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_8T=DCntU8x5YEo+Pcs2J0Y4YvDaHUBdGiqEFRxghOd_Q@mail.gmail.com>
 <1595389756.20193.12.camel@mtkswgap22>
 <CAAOTY_9k7rM=Pf43DwJR_bkQvxVtpWYTjVoNSZLVE2N0Y_DBmA@mail.gmail.com>
 <1595484707.26237.12.camel@mtkswgap22>
 <CAAOTY__V3zwux7UP7p4SUbreGrPBbwRqi=E1WVsA58tYNmri1A@mail.gmail.com>
 <1595573719.24412.9.camel@mtkswgap22>
In-Reply-To: <1595573719.24412.9.camel@mtkswgap22>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 24 Jul 2020 23:55:33 +0800
X-Gmail-Original-Message-ID: <CAAOTY__KYH4G3E+c=zoOk==hPJHsAd5u4Q0oj4adKstaoOciMg@mail.gmail.com>
Message-ID: <CAAOTY__KYH4G3E+c=zoOk==hPJHsAd5u4Q0oj4adKstaoOciMg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_115547_855015_0F77C7DA 
X-CRM114-Status: GOOD (  34.81  )
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
 wsd_upstream <wsd_upstream@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfm
nIgyNOaXpSDpgLHkupQg5LiL5Y2IMjo1NeWvq+mBk++8mgo+Cj4gSGkgQ2h1bi1LdWFuZywKPgo+
IE9uIEZyaSwgMjAyMC0wNy0yNCBhdCAwMDozMiArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToK
PiA+IEhpLCBOZWFsOgo+ID4KPiA+IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+IOaW
vCAyMDIw5bm0N+aciDIz5pelIOmAseWbmyDkuIvljYgyOjEx5a+r6YGT77yaCj4gPiA+Cj4gPiA+
IEhpIENodW4tS3VhbmcsCj4gPiA+Cj4gPiA+IE9uIFdlZCwgMjAyMC0wNy0yMiBhdCAyMjoyNSAr
MDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiA+ID4gPiBIaSwgTmVhbDoKPiA+ID4gPgo+ID4g
PiA+IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0N+aciDIy5pel
IOmAseS4iSDkuIrljYgxMTo0OeWvq+mBk++8mgo+ID4gPiA+ID4KPiA+ID4gPiA+IEhpIENodW4t
S3VhbmcsCj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gV2VkLCAyMDIwLTA3LTIyIGF0IDA3OjIxICsw
ODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gPiA+ID4gPiBIaSwgTmVhbDoKPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gTmVhbCBMaXUgPG5lYWwubGl1QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDl
ubQ35pyIMjHml6Ug6YCx5LqMIOS4i+WNiDEyOjAw5a+r6YGT77yaCj4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gKy8qCj4gPiA+ID4gPiA+ID4g
KyAqIG10a19kZXZhcGNfZHVtcF92aW9fZGJnIC0gZ2V0IHRoZSB2aW9sYXRpb24gaW5kZXggYW5k
IGR1bXAgdGhlIGZ1bGwgdmlvbGF0aW9uCj4gPiA+ID4gPiA+ID4gKyAqICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZGVidWcgaW5mb3JtYXRpb24uCj4gPiA+ID4gPiA+ID4gKyAqLwo+ID4gPiA+
ID4gPiA+ICtzdGF0aWMgYm9vbCBtdGtfZGV2YXBjX2R1bXBfdmlvX2RiZyhzdHJ1Y3QgbXRrX2Rl
dmFwY19jb250ZXh0ICpjdHgsIHUzMiB2aW9faWR4KQo+ID4gPiA+ID4gPiA+ICt7Cj4gPiA+ID4g
PiA+ID4gKyAgICAgICB1MzIgc2hpZnRfYml0Owo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4g
PiArICAgICAgIGlmIChjaGVja192aW9fbWFzayhjdHgsIHZpb19pZHgpKQo+ID4gPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4g
PiA+ICsgICAgICAgaWYgKCFjaGVja192aW9fc3RhdHVzKGN0eCwgdmlvX2lkeCkpCj4gPiA+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ID4gPiA+ID4gPiArCj4gPiA+
ID4gPiA+ID4gKyAgICAgICBzaGlmdF9iaXQgPSBnZXRfc2hpZnRfZ3JvdXAoY3R4LCB2aW9faWR4
KTsKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gKyAgICAgICBpZiAoc3luY192aW9fZGJn
KGN0eCwgc2hpZnRfYml0KSkKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGZh
bHNlOwo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiArICAgICAgIGRldmFwY19leHRyYWN0
X3Zpb19kYmcoY3R4KTsKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSB0aGluayBnZXRfc2hpZnRf
Z3JvdXAoKSwgc3luY192aW9fZGJnKCksIGFuZAo+ID4gPiA+ID4gPiBkZXZhcGNfZXh0cmFjdF92
aW9fZGJnKCkgc2hvdWxkIGJlIG1vdmVkIG91dCBvZiB2aW9faWR4IGZvci1sb29wICh0aGUKPiA+
ID4gPiA+ID4gbG9vcCBpbiBkZXZhcGNfdmlvbGF0aW9uX2lycSgpKSBiZWNhdXNlIHRoZXNlIHRo
cmVlIGZ1bmN0aW9uIGlzIG5vdAo+ID4gPiA+ID4gPiByZWxhdGVkIHRvIHZpb19pZHguCj4gPiA+
ID4gPiA+IEFub3RoZXIgcXVlc3Rpb246IHdoZW4gbXVsdGlwbGUgdmlvX2lkeCB2aW9sYXRpb24g
b2NjdXIsIHZpb19hZGRyIGlzCj4gPiA+ID4gPiA+IHJlbGF0ZWQgdG8gd2hpY2ggb25lIHZpb19p
ZHg/IFRoZSBsYXRlc3QgaGFwcGVuZWQgb25lPwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4g
PiA+IEFjdHVhbGx5LCBpdCdzIHJlbGF0ZWQgdG8gdmlvX2lkeC4gQnV0IHdlIGRvbid0IHVzZSBp
dCBkaXJlY3RseSBvbiB0aGVzZQo+ID4gPiA+ID4gZnVuY3Rpb24uIEkgdGhpbmsgYmVsb3cgc25p
cCBjb2RlIG1pZ2h0IGJlIGJldHRlciB3YXkgdG8gdW5kZXJzdGFuZCBpdC4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBmb3IgKC4uLikKPiA+ID4gPiA+IHsKPiA+ID4gPiA+ICAgICAgICAgY2hlY2tfdmlv
X21hc2soKQo+ID4gPiA+ID4gICAgICAgICBjaGVja192aW9fc3RhdHVzKCkKPiA+ID4gPiA+Cj4g
PiA+ID4gPiAgICAgICAgIC8vIGlmIGdldCB2aW9faWR4LCBtYXNrIGl0IHRlbXBvcmFyaWx5Cj4g
PiA+ID4gPiAgICAgICAgIG1hc2tfbW9kdWxlX2lycSh0cnVlKQo+ID4gPiA+ID4gICAgICAgICBj
bGVhcl92aW9fc3RhdHVzKCkKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAgIC8vIGR1bXAgdmlv
bGF0aW9uIGluZm8KPiA+ID4gPiA+ICAgICAgICAgZ2V0X3NoaWZ0X2dyb3VwKCkKPiA+ID4gPiA+
ICAgICAgICAgc3luY192aW9fZGJnKCkKPiA+ID4gPiA+ICAgICAgICAgZGV2YXBjX2V4dHJhY3Rf
dmlvX2RiZygpCj4gPiA+ID4gPgo+ID4gPiA+ID4gICAgICAgICAvLyB1bm1hc2sKPiA+ID4gPiA+
ICAgICAgICAgbWFza19tb2R1bGVfaXJxKGZhbHNlKQo+ID4gPiA+ID4gfQo+ID4gPiA+Cj4gPiA+
ID4gVGhpcyBzbmlwIGNvZGUgZG9lcyBub3QgZXhwbGFpbiBhbnkgdGhpbmcuIEkgY291bGQgcmV3
cml0ZSB0aGlzIGNvZGUgYXM6Cj4gPiA+ID4KPiA+ID4gPiBmb3IgKC4uLikKPiA+ID4gPiB7Cj4g
PiA+ID4gICAgIGNoZWNrX3Zpb19tYXNrKCkKPiA+ID4gPiAgICAgY2hlY2tfdmlvX3N0YXR1cygp
Cj4gPiA+ID4KPiA+ID4gPiAgICAgLy8gaWYgZ2V0IHZpb19pZHgsIG1hc2sgaXQgdGVtcG9yYXJp
bHkKPiA+ID4gPiAgICAgbWFza19tb2R1bGVfaXJxKHRydWUpCj4gPiA+ID4gICAgIGNsZWFyX3Zp
b19zdGF0dXMoKQo+ID4gPiA+ICAgICAvLyB1bm1hc2sKPiA+ID4gPiAgICAgbWFza19tb2R1bGVf
aXJxKGZhbHNlKQo+ID4gPiA+IH0KPiA+ID4gPgo+ID4gPiA+IC8vIGR1bXAgdmlvbGF0aW9uIGlu
Zm8KPiA+ID4gPiBnZXRfc2hpZnRfZ3JvdXAoKQo+ID4gPiA+IHN5bmNfdmlvX2RiZygpCj4gPiA+
ID4gZGV2YXBjX2V4dHJhY3RfdmlvX2RiZygpCj4gPiA+ID4KPiA+ID4gPiBBbmQgbXkgdmVyc2lv
biBpcyBpZGVudGljYWwgd2l0aCB5b3VyIHZlcnNpb24sIGlzbid0IGl0Pwo+ID4gPgo+ID4gPiBT
b3JyeSwgSSBkaWQgbm90IGV4cGxhaW4gaXQgY2xlYXJseS4gTGV0J3MgbWUgdHJ5IGFnYWluLgo+
ID4gPiBUaGUgcmVhc29uIHdoeSBJIHB1dCAiZHVtcCB2aW9sYXRpb24gaW5mbyIgYmV0d2VlbiBt
YXNrICYgdW5tYXNrIGNvbnRleHQKPiA+ID4gaXMgYmVjYXVzZSBpdCBoYXMgdG8gc3RvcCBpbnRl
cnJ1cHQgZmlyc3QgYmVmb3JlIGR1bXAgdmlvbGF0aW9uIGluZm8sCj4gPiA+IGFuZCB0aGVuIHVu
bWFzayBpdCB0byBwcmVwYXJlIG5leHQgdmlvbGF0aW9uLgo+ID4gPiBUaGVzZSBzZXF1ZW5jZSBn
dWFyYW50ZWUgdGhhdCBpZiBtdWx0aXBsZSB2aW9sYXRpb24gaXMgdHJpZ2dlcmVkLCB3ZQo+ID4g
PiBzdGlsbCBoYXZlIGluZm9ybWF0aW9uIHRvIGRlYnVnLgo+ID4gPiBJZiB0aGUgY29kZSBzZXF1
ZW5jZSBpbiB5b3VyIHZlcnNpb24gYW5kIG11bHRpcGxlIHZpb2xhdGlvbiBpcwo+ID4gPiB0cmln
Z2VyZWQsIHRoZXJlIG1pZ2h0IGJlIG5vIGFueSBpbmZvcm1hdGlvbiBidXQga2VlcHMgZW50ZXJp
bmcgSVNSLgo+ID4gPiBGaW5hbGx5LCBzeXN0ZW0gbWlnaHQgYmUgYWJub3JtYWwgYW5kIHdhdGNo
ZG9nIHRpbWVvdXQuCj4gPiA+IEluIHRoaXMgY2FzZSwgd2Ugc3RpbGwgZG9uJ3QgaGF2ZSBhbnkg
aW5mb3JtYXRpb24gdG8gZGVidWcuCj4gPgo+ID4gSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kIHdo
eSBubyBpbmZvcm1hdGlvbiB0byBkZWJ1Zy4gRm9yIGV4YW1wbGUgd2hlbgo+ID4gdmlvX2lkeCA1
LCAxMCwgMTUgaGFzIHZpb2xhdGlvbiwKPiA+IFlvdSB3b3VsZCBtYXNrIHZpb19pZHggNSB0byBn
ZXQgaW5mb3JtYXRpb24sIGJ1dCB2aW9faWR4IDEwLCAxNSBkb2VzCj4gPiBub3QgbWFzayB5ZXQu
Cj4gPiBJbiB5b3VyIHdvcmRzLCB3aGVuIHZpb19pZHggMTAsIDE1IG5vdCBtYXNrLCB5b3Ugd291
bGQgbm90IGdldCBhbnkKPiA+IGRlYnVnIGluZm9ybWF0aW9uIHdoZW4geW91IHByb2Nlc3Mgdmlv
X2lkeCA1Lgo+ID4KPiA+IEluIG15IHZlcnNpb24sIEkgd291bGQgY2xlYXIgYWxsIHN0YXR1cywg
d2h5IGtlZXBzIGVudGVyaW5nIElTUj8KPgo+IFRoaW5rIGFib3V0IHRoaXMgY2FzZSwgaWYgc29t
ZW9uZSB0cmllcyB0byBkdW1wICJBQUEiIG1vZHVsZSdzIHJlZ2lzdGVyLgo+IEl0IHdvdWxkIGtl
ZXAgcmVhZCByZWcgYmFzZSwgYmFzZSsweDQsIGJhc2UrMHg4LCAuLi4KPiBBbGwgdGhlc2UgcmVn
aXN0ZXJzIGFyZSBpbiB0aGUgc2FtZSBzbGF2ZSwgd2hpY2ggd291bGQgYmUgc2FtZSB2aW9faWR4
Lgo+IChUYWtlIHZpb19pZHggNSBhcyBleGFtcGxlKQo+IEluIHRoaXMgY2FzZSwgdmlvX2lkeCA1
IHdpbGwga2VlcCB0cmlnZ2VyaW5nIGludGVycnVwdC4gSWYgeW91IGRpZCBub3QKPiBkbyAiZHVt
cCB2aW9sYXRpb24gaW5mbyIgYmV0d2VlbiBtYXNrICYgdW5tYXNrLCB5b3UgY2Fubm90IGdldCBh
bnkKPiB2aW9sYXRpb24gaW5mbyB1bnRpbCB0aGUgbGFzdCBpbnRlcnJ1cHQgYmVpbmcgaGFuZGxl
ZC4KPiBOb3JtYWxseSwgc3lzdGVtIHdpbGwgY3Jhc2ggYmVmb3JlIGxhc3QgaW50ZXJydXB0IGNv
bWluZy4KCllvdSBoYXZlIHNhaWQgdGhhdCBmaXJzdCB2aW9fYWRkciB3b3VsZCBiZSBrZXB0IHVu
dGlsIGl0J3MgJ2hhbmRsZWQnLgpTbyB0aGUgZmlyc3QgdmlvX2FkZHIgcmVnX2Jhc2Ugd291bGQg
YmUga2VwdCBldmVuIHRob3VnaCBvdGhlcgp2aW9sYXRpb24gaGFwcGVuLiBBbmQgSSBjb3VsZCBo
YW5kbGUgKGNsZWFyIHN0YXR1cyBhbmQgZHVtcCBpbmZvKSBpdAp0aGVuIHZpb19hZGRyIHdvdWxk
IG5leHQgdmlvbGF0aW9uJ3MgYWRkcmVzcy4gSSdtIGNvbmZ1c2VkIHdpdGggeW91cgpzdGF0ZW1l
bnQuIElmIEFBQSBpcyBkdW1waW5nIHJlZ2lzdGVyIG9mIHZpb19pZHggNSwgQkJCIGlzIGR1bXBp
bmcKcmVnaXN0ZXIgb2YgdmlvX2lkeCAxMCwgQ0NDIGlzIGR1bXBpbmcgcmVnaXN0ZXIgb2Ygdmlv
X2lkeCAxNSwgSSB0aGluawp5b3Ugc2hvdWxkIG1hc2sgYWxsIHZpb19pZHggbm90IG9ubHkgb25l
LiBTbyB0aGUgY29kZSB3b3VsZCBiZQoKZm9yIGFsbCB2aW9faWR4IHsKICAgIG1hc2tfbW9kdWxl
X2lycSh0cnVlKQp9CgpkZXZhcGNfZXh0cmFjdF92aW9fZGJnKCkKCmZvciBhbGwgdmlvX2lkeCB7
CiAgICBjbGVhcl92aW9fc3RhdHVzKCkKICAgIG1hc2tfbW9kdWxlX2lycShmYWxzZSkKfQoKPgo+
ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IEFib3V0IHlvdXIgcXVlc3Rpb24s
IHZpb19hZGRyIHdvdWxkIGJlIHRoZSBmaXJzdCBvbmUuCj4gPiA+ID4KPiA+ID4gPiBTbyBvdGhl
ciB2aW9fYWRkciB3b3VsZCBiZSBkcm9wcGVkPyBPciBoYXJkd2FyZSB3b3VsZCBrZWVwIGFsbAo+
ID4gPiA+IHZpb19hZGRyIGFuZCB5b3UgaGF2ZSBzb21lIHdheSB0byBnZXQgYWxsIHZpb19hZGRy
Pwo+ID4gPiA+Cj4gPiA+Cj4gPiA+IEluIHRoaXMgY2FzZSwgaGFyZHdhcmUgd2lsbCBkcm9wIG90
aGVyIHZpb2xhdGlvbiBpbmZvIGFuZCBrZWVwIHRoZSBmaXJzdAo+ID4gPiBvbmUgdW50aWwgaXQg
YmVlbiBoYW5kbGVkLgo+ID4KPiA+IERvZXMgJ2hhbmRsZWQnIG1lYW4gc3RhdHVzIGlzIGNsZWFy
ZWQ/Cj4KPiAiaGFuZGxlZCIgbWVhbnMgY2xlYXIgc3RhdHVzIGFuZCBkdW1wIHZpb2xhdGlvbiBp
bmZvLgo+Cj4gPgo+ID4gUmVnYXJkcywKPiA+IENodW4tS3VhbmcuCj4gPgo+ID4gPgo+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gKyAgICAgICByZXR1cm4gdHJ1ZTsKPiA+
ID4gPiA+ID4gPiArfQo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiArLyoKPiA+ID4gPiA+
ID4gPiArICogZGV2YXBjX3Zpb2xhdGlvbl9pcnEgLSB0aGUgZGV2YXBjIEludGVycnVwdCBTZXJ2
aWNlIFJvdXRpbmUgKElTUikgd2lsbCBkdW1wCj4gPiA+ID4gPiA+ID4gKyAqICAgICAgICAgICAg
ICAgICAgICAgICAgdmlvbGF0aW9uIGluZm9ybWF0aW9uIGluY2x1ZGluZyB3aGljaCBtYXN0ZXIg
dmlvbGF0ZXMKPiA+ID4gPiA+ID4gPiArICogICAgICAgICAgICAgICAgICAgICAgICBhY2Nlc3Mg
c2xhdmUuCj4gPiA+ID4gPiA+ID4gKyAqLwo+ID4gPiA+ID4gPiA+ICtzdGF0aWMgaXJxcmV0dXJu
X3QgZGV2YXBjX3Zpb2xhdGlvbl9pcnEoaW50IGlycV9udW1iZXIsCj4gPiA+ID4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtdGtfZGV2YXBjX2Nv
bnRleHQgKmN0eCkKPiA+ID4gPiA+ID4gPiArewo+ID4gPiA+ID4gPiA+ICsgICAgICAgdTMyIHZp
b19pZHg7Cj4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICsgICAgICAgZm9yICh2aW9faWR4
ID0gMDsgdmlvX2lkeCA8IGN0eC0+dmlvX2lkeF9udW07IHZpb19pZHgrKykgewo+ID4gPiA+ID4g
PiA+ICsgICAgICAgICAgICAgICBpZiAoIW10a19kZXZhcGNfZHVtcF92aW9fZGJnKGN0eCwgdmlv
X2lkeCkpCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
PiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAvKiBFbnN1cmUgdGhh
dCB2aW9sYXRpb24gaW5mbyBhcmUgd3JpdHRlbiBiZWZvcmUKPiA+ID4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgICogZnVydGhlciBvcGVyYXRpb25zCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAqLwo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBzbXBfbWIoKTsKPiA+ID4gPiA+
ID4gPiArCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIC8qCj4gPiA+ID4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAqIE1hc2sgc2xhdmUncyBpcnEgYmVmb3JlIGNsZWFyaW5nIHZpbyBzdGF0
dXMuCj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAqIE11c3QgZG8gaXQgdG8gYXZvaWQg
bmVzdGVkIGludGVycnVwdCBhbmQgcHJldmVudAo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICAgKiB1bmV4cGVjdGVkIGJlaGF2aW9yLgo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAg
Ki8KPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgbWFza19tb2R1bGVfaXJxKGN0eCwgdmlv
X2lkeCwgdHJ1ZSk7Cj4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAg
ICBjbGVhcl92aW9fc3RhdHVzKGN0eCwgdmlvX2lkeCk7Cj4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICBtYXNrX21vZHVsZV9pcnEoY3R4LCB2aW9faWR4LCBmYWxz
ZSk7Cj4gPiA+ID4gPiA+ID4gKyAgICAgICB9Cj4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+
ICsgICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOwo+ID4gPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiA+
ID4gKwo+ID4gPiA+ID4gPiA+ICsvKgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
