Return-Path: <SRS0=soVQ=ON=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB095C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 16:36:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 801CB60EE5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 16:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 801CB60EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FCl8nofOkIcxseZjEbntrTxGC+L3uSLUQ6VpltHaUE=; b=bNDFQOv10VhJd2
	WE/qlZUIq5CcXK/fNlLlt50EIUMHA/eU2lDsNV9qGuI/Izzl6ZPfVPZVzTeBL1xLJ6+GvRp3g+2ei
	yRGe+2X3GJtpdEekoVaiCQ+A30q6c+/XUkbBg02Hh0gzyIcXcZMD0Ka9sT8JSssk4aMf4muWoKShA
	OuQR4xt8xXe0nDzTI/8Fl//V+/mnE7PdjS1FEz9apU6wb8eRtEphXpLqpOZ9uWI6HrMEDk5rmvKsT
	hJhxx+OlKTugMEg12OayOx4ijhf1vfD7DZptGnmc8+RYBemKNM8lW/qr91rHK7sMUZB+/oN2uYBZv
	jhTiT1DdaSXebnsLMKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTRi4-00CAhT-Mq; Thu, 23 Sep 2021 16:36:32 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTRhz-00CAgx-FV
 for linux-mediatek@lists.infradead.org; Thu, 23 Sep 2021 16:36:29 +0000
Received: by mail-oi1-x22f.google.com with SMTP id r26so10497554oij.2
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Sep 2021 09:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EgkHI1/87WDfYzGJHVb9uSE8ondAm9IZ1p7rxtfYoTA=;
 b=idG49OCyvw2XsrxgeWp7JIYA5MIGDaQADtUR/XHYoXs21cqMY7Ja0Sf5vm+n94vsYW
 E125f//+lcVc+h/6jjy+QPlyyma7fvCBoMPOjVq0R+oePyikDMpcGGvRcsMhe3re3ERl
 YNiLG7aOKJdgeh9JrhTR6Ch8qlhc87rX+VcR8AB9brCFih06yF5Xtm4JfAh2WCqOWgdH
 ZPFYmqsOj/1ioMkTasvEv1AE9XSHpjtuLDu8gkQ0ig5TREtT63mw8bK1no3cosNfsjj9
 OjQr3fqVDmJp+em0WtdNSHOF55fuKUttxhJGc6yrRSlEHUxn93K3yyQ0JxMDmGFCG6NJ
 tLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EgkHI1/87WDfYzGJHVb9uSE8ondAm9IZ1p7rxtfYoTA=;
 b=nmeT79VRiY0JgYeoIUD/GDhNN1Jj23VAIRsFeturcOHXgOc5DXbqH17u2JssvRd8+f
 3h8fP42dbVjPrVALzRBDtZ4L2MY0UxqzduyxfGihD4dPmqVoPUYvryCMl7lLhFTWeAFi
 cqkGn9nX/M7BRsdqhgWc8aLDuS6GDZ7jpW862EHQkeI1PNvdz9oxvDDSje7jOSeuo8Gv
 +HabFP/BaFYf9Q4PSWSuYXER/qvUV7vNh9/52gdlB9/wC4itPdQGi5rZ+tNIu5qP+s3J
 3L5gj/PWbYRPcjW4Nnfrd7Mn3srxkWdTyNPR9IP4HZxAGKw7+DEWWqc8wKTQpfo1/fAj
 yWjg==
X-Gm-Message-State: AOAM530YyeyphdMjd+e9xujDrrdgG/2h3Rur0OFA0YuieQIdmq1GKlWq
 Wdu7ggFHxy2/9C+I1LKbkNhYgNN7DOUP7a+5EHA=
X-Google-Smtp-Source: ABdhPJwVBfEUhgTdfCYXfFnmIw23HGHjH+SStzaW4GjLv4936Io/Sl3rGN0NJB+Nk6FYT3HqSJHrEAEGc+2fRjVyS0s=
X-Received: by 2002:a05:6808:1787:: with SMTP id
 bg7mr13811452oib.39.1632414985961; 
 Thu, 23 Sep 2021 09:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210808234733.14782-1-chunkuang.hu@kernel.org>
 <CAAOTY_9LstZegE_Gyibov5tLo5eEqiPfoAcnyj_uoS=8xLLhnA@mail.gmail.com>
 <CAFqH_53M2OO8DpkPa3L7cwppVRYiUgEDjrLjK7JJNgKgxnQpVA@mail.gmail.com>
 <CAAOTY__4ZKf8YwJWMHkiZRjbcnDuf4tcVPO=AG1V3pv9_-4bVw@mail.gmail.com>
In-Reply-To: <CAAOTY__4ZKf8YwJWMHkiZRjbcnDuf4tcVPO=AG1V3pv9_-4bVw@mail.gmail.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 23 Sep 2021 18:36:14 +0200
Message-ID: <CAFqH_51Vtq=AkZaV2A69-FAVohr2DyD=1cjKkQ-hStQ4GXRnPA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] CMDQ refinement of Mediatek DRM driver
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_093627_582917_528122A2 
X-CRM114-Status: GOOD (  37.75  )
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

SGkgQ2h1bi1LdWFuZywKCk1pc3NhdGdlIGRlIENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBr
ZXJuZWwub3JnPiBkZWwgZGlhIGR0LiwgMjEgZGUKc2V0LiAyMDIxIGEgbGVzIDE1OjE1Ogo+Cj4g
SGksIEVucmljOgo+Cj4gRW5yaWMgQmFsbGV0Ym8gU2VycmEgPGViYWxsZXRib0BnbWFpbC5jb20+
IOaWvCAyMDIx5bm0OeaciDIx5pelIOmAseS6jCDkuIvljYg0OjM25a+r6YGT77yaCj4gPgo+ID4g
SGkgQ2h1bi1LdWFuZywKPiA+Cj4gPiAoYWdhaW4gd2l0aG91dCBodG1sIGZvcm1hdCwgc29ycnkg
Zm9yIHRoZSBub2lzZSkKPiA+Cj4gPiBNaXNzYXRnZSBkZSBDaHVuLUt1YW5nIEh1IDxjaHVua3Vh
bmcuaHVAa2VybmVsLm9yZz4gZGVsIGRpYSBkai4sIDEyCj4gPiBk4oCZYWcuIDIwMjEgYSBsZXMg
MjoxMzoKPiA+ID4KPiA+ID4gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+
IOaWvCAyMDIx5bm0OOaciDnml6Ug6YCx5LiAIOS4iuWNiDc6NDflr6vpgZPvvJoKPiA+ID4gPgo+
ID4gPiA+IFRoZXNlIHJlZmluZW1lbnRzIGluY2x1ZGUgdXNpbmcgc3RhbmRhcmQgbWFpbGJveCBj
YWxsYmFjayBpbnRlcmZhY2UsCj4gPiA+ID4gdGltZW91dCBkZXRlY3Rpb24sIGFuZCBhIGZpeGVk
IGNtZHFfaGFuZGxlLgo+ID4gPgo+ID4gPiBGb3IgdGhpcyBzZXJpZXMsIGFwcGxpZWQgdG8gbWVk
aWF0ZWstZHJtLW5leHQgWzFdLgo+ID4gPgo+ID4gPiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9
bWVkaWF0ZWstZHJtLW5leHQKPiA+ID4KPiA+Cj4gPiBUaGVzZSBwYXRjaGVzIHNlZW0gdG8gYnJl
YWsgdGhlIGRpc3BsYXkgb24gdGhlIEFjZXIgQ2hyb21lYm9vayBSIDEzCj4gPiAoTVQ4MTczKSBp
biB0aGUgY3VycmVudCBtYWlubGluZS4gQWZ0ZXIgcnVubmluZyBhIGJpc2VjdGlvbiBpdCBwb2lu
dGVkCj4gPiBtZSB0byB0aGUgZm9sbG93aW5nIGNvbW1pdAo+ID4KPiA+IGNvbW1pdCBmNGJlMTdj
ZDViMTRkZDczNTQ1YjBlMDE0YTYzZWJlOWFiNWVmODM3Cj4gPiBBdXRob3I6IENodW4tS3Vhbmcg
SHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+ID4gRGF0ZTogICBTdW4gSnVsIDQgMTU6MzY6
NDggMjAyMSArMDgwMAo+ID4KPiA+ICAgICBkcm0vbWVkaWF0ZWs6IFJlbW92ZSBzdHJ1Y3QgY21k
cV9jbGllbnQKPiA+Cj4gPiBSZXZlcnRpbmcgdGhpcyBwYXRjaCBhbG9uZSBpcyBub3QgdHJpdmlh
bCwgc28gSSBlbmRlZCB1cCByZXZlcnRpbmcgdGhlCj4gPiBmdWxsIHNlcmllcywgYW5kIEkgY2Fu
IGNvbmZpcm0gdGhhdCByZXZlcnRpbmcgdGhlIGZ1bGwgc2VyaWVzIG1ha2VzCj4gPiB0aGUgZGlz
cGxheSB3b3JrIGFnYWluLgo+Cj4gSSB0aGluayB5b3UgY291bGQgbm90IGp1c3QgcmV2ZXJ0ICJk
cm0vbWVkaWF0ZWs6IFJlbW92ZSBzdHJ1Y3QKPiBjbWRxX2NsaWVudCIsIHlvdSBzaG91bGQgYWxz
byByZXZlcnQgdGhlIHBhdGNoZXMgYWZ0ZXIgaXQsIHN1Y2ggYXMKPgo+ICJkcm0vbWVkaWF0ZWs6
IENsZWFyIHBlbmRpbmcgZmxhZyB3aGVuIGNtZHEgcGFja2V0IGlzIGRvbmUiCj4gImRybS9tZWRp
YXRlazogQWRkIGNtZHFfaGFuZGxlIGluIG10a19jcnRjIgo+ICJkcm0vbWVkaWF0ZWs6IERldGVj
dCBDTURRIGV4ZWN1dGlvbiB0aW1lb3V0Igo+CgpZZXMsIGluIGZhY3QgSSByZXZlcnRlZDoKCjll
ZmIxNmMyZmRkNiBkcm0vbWVkaWF0ZWs6IENsZWFyIHBlbmRpbmcgZmxhZyB3aGVuIGNtZHEgcGFj
a2V0IGlzIGRvbmUKYmM5MjQxYmU3M2Q5IGRybS9tZWRpYXRlazogQWRkIGNtZHFfaGFuZGxlIGlu
IG10a19jcnRjCjhjZGNiMzY1MzQyNCBkcm0vbWVkaWF0ZWs6IERldGVjdCBDTURRIGV4ZWN1dGlv
biB0aW1lb3V0CmY0YmUxN2NkNWIxNCBkcm0vbWVkaWF0ZWs6IFJlbW92ZSBzdHJ1Y3QgY21kcV9j
bGllbnQKYzFlYzU0YjdiNWFmIGRybS9tZWRpYXRlazogVXNlIG1haWxib3ggcnhfY2FsbGJhY2sg
aW5zdGVhZCBvZiBjbWRxX3Rhc2tfY2IKCldpdGhvdXQgdGhlc2UgcGF0Y2hlcyA1LjE1LXJjMiB3
b3JrcyBhZ2FpbiBvbiBteSBwbGF0Zm9ybS4KClRoZSBjb21taXQgJ2MxZWM1NGI3YjVhZiBkcm0v
bWVkaWF0ZWs6IFVzZSBtYWlsYm94IHJ4X2NhbGxiYWNrIGluc3RlYWQKb2YgY21kcV90YXNrX2Ni
JyBhbG9uZSBpbnRyb2R1Y2VzIGxvdHMgb2Ygd2FybmluZ3MgaW4gdGhlIGtlcm5lbAoKV0FSTklO
RzogQ1BVOiAwIFBJRDogMCBhdCBkcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jOjE5
OApjbWRxX3Rhc2tfZXhlY19kb25lKzB4YjgvMHhlMAoKSSB0aGluayBpcyBqdXN0IGEgbGVmdG92
ZXIgb3IgdGhlIG1lbnRpb25lZCB3YXJuaW5nLCBidXQgdGhhdCBjb25mdXNlZAptZSBhIGJpdCBk
b2luZyB0aGUgYmlzZWN0aW9uLiBUaGVuLCBhZnRlciBjb21taXQgJ2Y0YmUxN2NkNWIxNApkcm0v
bWVkaWF0ZWs6IFJlbW92ZSBzdHJ1Y3QgY21kcV9jbGllbnQnIG15IHN5c3RlbSBzaW1wbHkgZ2V0
cyBzdHVjay4KRm9yIG5vdyBJIGRvbid0IHNlZSBhbnkgb2J2aW91cyBtaXN0YWtlIGJ1dCB3aWxs
IGRpZyBmdXJ0aGVyLgoKQ2FuIEkgYXNrIHlvdSBpbiB3aGljaCBwbGF0Zm9ybSBkaWQgeW91IHRl
c3Q/IEFuZCBpZiB5b3UgY2FuIGRvdWJsZQpjaGVjayBpZiB5b3VyIHBsYXRmb3JtIGlzIGJyb2tl
biB0b28gaW4gY3VycmVudCBtYWlubGluZT8KClRoYW5rcywKICBFbnJpYwoKPiBJZiAiZHJtL21l
ZGlhdGVrOiBSZW1vdmUgc3RydWN0IGNtZHFfY2xpZW50IiBpcyB0aGUgcGF0Y2ggY2F1c2UKPiBk
aXNwbGF5IGFibm9ybWFsLCBJIHRoaW5rIHlvdSBjb3VsZCBjb21wYXJlIGNvZGUgdy8gYW5kIHcv
byB0aGlzCj4gcGF0Y2guIEZvY3VzIG9uIHRoZSB2YWx1ZSBhY2N1cmFjeSwgc3VjaCBhcyBjbWRx
X2NsIGFuZCBjbWRxX2NoYW4uIEFuZAo+IGZvY3VzIG9uIHRoZSBmbG93IGFjY3VyYWN5LCBzdWNo
IGFzIG10a19kcm1fY3J0Y191cGRhdGVfY29uZmlnKCkgYW5kCj4gZGRwX2NtZHFfY2IoKS4gSWYg
dGhpcyBjb3VsZCBub3QgZmluZCB0aGUgcHJvYmxlbSwgSSB0aGluayB0aGUgbGF0ZXN0Cj4gd2F5
IGlzIHRvIGJyZWFrIHRoaXMgcGF0Y2ggaW50byBzbWFsbCBwYXRjaGVzLCBjaGFuZ2VzIGxpdHRs
ZSBpbiBlYWNoCj4gc21hbGwgcGF0Y2hlcyBhbmQgd2UgY291bGQgZmluYWxseSBmaW5kIG91dCB0
aGUgcHJvYmxlbS4KPgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPgo+ID4KPiA+IFVuZm9ydHVu
YXRlbHksIGFmdGVyIHRoZSBtZXJnZSB3aW5kb3csIGRpZmZlcmVudCB0aGluZ3MgYnJva2UgZm9y
IHRoaXMKPiA+IGRldmljZSwgYW5kIEkgZGlkbid0IGZpbmlzaCBpc29sYXRpbmcgdGhlbSwgYW5k
IGl0IGlzIG5vdCBjbGVhciB0byBtZQo+ID4geWV0IHdoZXRoZXIgdGhlIGxvZ3MgSSdtIGdldHRp
bmcgYXJlIHVzZWZ1bCBmb3IgdGhpcyBzcGVjaWZpYyBpc3N1ZSBvcgo+ID4gbm90LiBCYXNpY2Fs
bHkgd2l0aCB0aGlzIHNlcmllcyBtZXJnZWQgdGhlIGtlcm5lbCBzZWVtcyB0byBiZSBzdHVjaywK
PiA+IGFuZCB0aGUgZGlzcGxheSBpcyBub3Qgd29ya2luZy4gTGF0ZXN0IG1lc3NhZ2UgaXMKPiA+
Cj4gPiBbICAgMTIuMzI5MTczXSBtdGstaW9tbXUgMTAyMDUwMDAuaW9tbXU6IFBhcnRpYWwgVExC
IGZsdXNoIHRpbWVkIG91dCwKPiA+IGZhbGxpbmcgYmFjayB0byBmdWxsIGZsdXNoCj4gPgo+ID4g
V2l0aG91dCB0aGUgc2VyaWVzLCB0aGUga2VybmVsIGdvZXMgZmFyIGFuZCBkaXNwbGF5IHdvcmtz
LCBob3dldmVyCj4gPiB0aGVyZSBhcmUgb3RoZXIgaXNzdWVzIGFmZmVjdGluZyB0aGUgY3Jvcy1l
YywgYnV0IEkgdGhpbmsgdGhhdCdzCj4gPiBhbm90aGVyIGlzc3VlLgo+ID4KPiA+IEknbGwgdHJ5
IHRvIGRpZyBhIGJpdCBtb3JlLCBidXQsIG1lYW53aGlsZSwgaWYgeW91IGhhdmUgYW55IGlkZWEK
PiA+IHBsZWFzZSBsZXQgbWUga25vdy4KPiA+Cj4gPiBUaGFua3MsCj4gPiAgRW5yaWMKPiA+Cj4g
Pgo+ID4gPiBSZWdhcmRzLAo+ID4gPiBDaHVuLUt1YW5nLgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4g
Q2hhbmdlcyBpbiB2MjoKPiA+ID4gPiAxLiBEZWZpbmUgbXRrX2RybV9jbWRxX3BrdF9jcmVhdGUo
KSBhbmQgbXRrX2RybV9jbWRxX3BrdF9kZXN0cm95KCkKPiA+ID4gPiAgICB3aGVuIENPTkZJR19N
VEtfQ01EUSBpcyByZWFjaGFibGUuCj4gPiA+ID4KPiA+ID4gPiBDaHVuLUt1YW5nIEh1ICg0KToK
PiA+ID4gPiAgIGRybS9tZWRpYXRlazogVXNlIG1haWxib3ggcnhfY2FsbGJhY2sgaW5zdGVhZCBv
ZiBjbWRxX3Rhc2tfY2IKPiA+ID4gPiAgIGRybS9tZWRpYXRlazogUmVtb3ZlIHN0cnVjdCBjbWRx
X2NsaWVudAo+ID4gPiA+ICAgZHJtL21lZGlhdGVrOiBEZXRlY3QgQ01EUSBleGVjdXRpb24gdGlt
ZW91dAo+ID4gPiA+ICAgZHJtL21lZGlhdGVrOiBBZGQgY21kcV9oYW5kbGUgaW4gbXRrX2NydGMK
PiA+ID4gPgo+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMg
fCAxMTAgKysrKysrKysrKysrKysrKysrKystLS0tCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5
MSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IC0tCj4gPiA+
ID4gMi4yNS4xCj4gPiA+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
