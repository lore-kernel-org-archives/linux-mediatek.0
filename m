Return-Path: <SRS0=xNtl=OL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067D3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Sep 2021 13:15:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7FF36112F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Sep 2021 13:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7FF36112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5hZKbySPH0T25V4oNqxUIn1ineb3GWFTZViCyuZ8DI=; b=aXL5pMnCzuBwU2
	K9VCiBMNHAH1Np9dGxhfKiI8MM1ASyjbbd51xo4ti5FRfA+DiCP7hdiA0j2SfPolX5aCUsV04cdsJ
	fNLAZT6nBSjN7wQuS9ctfn47DaMvuuN9flJemFLVTMLR052Mj69sU/8nu7soVk7XRD655N9N72UWD
	zcFbQt1RLMeaOfXv8ZSrt3EhIp2o/ya1DZJs0lJBLY8XRSI3Bk/kE35+0HvEIqMq2AXcogZo9hNXK
	nZ7tZ7BI451s4e/s7CtqrcUFgewWWbscbwIAUiLuNKHui0GW0zawpwsnzy9eK8z/F50hNMPTGtA39
	OM1PneI+yMhla2Y/jIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSfbo-004Xj3-Jx; Tue, 21 Sep 2021 13:14:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSfbk-004XiP-D3
 for linux-mediatek@lists.infradead.org; Tue, 21 Sep 2021 13:14:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7111611C5
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Sep 2021 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632230087;
 bh=iZqPsCMg2X8Aef7G1+KUsPh8b0qsPVUuFvS5wZqe3BM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MnGaAq5/U5cSSf36UkOTQHSPQUgF6z8jt8p/+kjGi+WGuBBenUaz/sNr9sskU87id
 vP6iX3hDs1Beb/089sFmBSOGAz6+UeNNFYK8d5wdeuLNPxuAWzmSi9obYj7GKNuyfk
 ekumIHPvna1bZUc9HBEP0EtZtNk+CwY/1U4s5d/sasutJQIzfWhxKIui4cJyFDP8d3
 RawgXZFI9TddPvmnyTVHxnXhpVoCMbGRoUB4o1J8h3CapUwLsmGb2U7ms5qa/aX9qG
 N6HdAt+PxsFBZXYhN4LaSz01VzzwygXNH5XZhchsf1YKB+r6Xc2WFpkWQZGje/D0W8
 VgduHlXt/yk6g==
Received: by mail-ed1-f49.google.com with SMTP id g8so74367383edt.7
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Sep 2021 06:14:47 -0700 (PDT)
X-Gm-Message-State: AOAM531blMYqYaD2oqN3IuCcWmVtL8Li/nNXdLf7/p4YFyeMDaliUY7x
 Ngn3ZbLMTqn2EmcSt2tTItU2cbjPyyyeoKG/cA==
X-Google-Smtp-Source: ABdhPJzaQNMtEpU87qL4MJS8buFNHtKvHR7CLm3B8cBLx5LTsELv+5n4wF+8USFNS/0L8V+CNT/arQ73tExqtgeNbFA=
X-Received: by 2002:a17:907:995a:: with SMTP id
 kl26mr35090782ejc.6.1632230052399; 
 Tue, 21 Sep 2021 06:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210808234733.14782-1-chunkuang.hu@kernel.org>
 <CAAOTY_9LstZegE_Gyibov5tLo5eEqiPfoAcnyj_uoS=8xLLhnA@mail.gmail.com>
 <CAFqH_53M2OO8DpkPa3L7cwppVRYiUgEDjrLjK7JJNgKgxnQpVA@mail.gmail.com>
In-Reply-To: <CAFqH_53M2OO8DpkPa3L7cwppVRYiUgEDjrLjK7JJNgKgxnQpVA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 21 Sep 2021 21:14:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY__4ZKf8YwJWMHkiZRjbcnDuf4tcVPO=AG1V3pv9_-4bVw@mail.gmail.com>
Message-ID: <CAAOTY__4ZKf8YwJWMHkiZRjbcnDuf4tcVPO=AG1V3pv9_-4bVw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] CMDQ refinement of Mediatek DRM driver
To: Enric Balletbo Serra <eballetbo@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_061448_516934_3DE2AABE 
X-CRM114-Status: GOOD (  28.93  )
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

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gU2VycmEgPGViYWxsZXRib0BnbWFpbC5jb20+IOaW
vCAyMDIx5bm0OeaciDIx5pelIOmAseS6jCDkuIvljYg0OjM25a+r6YGT77yaCj4KPiBIaSBDaHVu
LUt1YW5nLAo+Cj4gKGFnYWluIHdpdGhvdXQgaHRtbCBmb3JtYXQsIHNvcnJ5IGZvciB0aGUgbm9p
c2UpCj4KPiBNaXNzYXRnZSBkZSBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9y
Zz4gZGVsIGRpYSBkai4sIDEyCj4gZOKAmWFnLiAyMDIxIGEgbGVzIDI6MTM6Cj4gPgo+ID4gQ2h1
bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0OOaciDnml6Ug
6YCx5LiAIOS4iuWNiDc6NDflr6vpgZPvvJoKPiA+ID4KPiA+ID4gVGhlc2UgcmVmaW5lbWVudHMg
aW5jbHVkZSB1c2luZyBzdGFuZGFyZCBtYWlsYm94IGNhbGxiYWNrIGludGVyZmFjZSwKPiA+ID4g
dGltZW91dCBkZXRlY3Rpb24sIGFuZCBhIGZpeGVkIGNtZHFfaGFuZGxlLgo+ID4KPiA+IEZvciB0
aGlzIHNlcmllcywgYXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0uCj4gPgo+ID4gWzFd
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFu
Zy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0Cj4gPgo+Cj4gVGhlc2UgcGF0
Y2hlcyBzZWVtIHRvIGJyZWFrIHRoZSBkaXNwbGF5IG9uIHRoZSBBY2VyIENocm9tZWJvb2sgUiAx
Mwo+IChNVDgxNzMpIGluIHRoZSBjdXJyZW50IG1haW5saW5lLiBBZnRlciBydW5uaW5nIGEgYmlz
ZWN0aW9uIGl0IHBvaW50ZWQKPiBtZSB0byB0aGUgZm9sbG93aW5nIGNvbW1pdAo+Cj4gY29tbWl0
IGY0YmUxN2NkNWIxNGRkNzM1NDViMGUwMTRhNjNlYmU5YWI1ZWY4MzcKPiBBdXRob3I6IENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IERhdGU6ICAgU3VuIEp1bCA0IDE1
OjM2OjQ4IDIwMjEgKzA4MDAKPgo+ICAgICBkcm0vbWVkaWF0ZWs6IFJlbW92ZSBzdHJ1Y3QgY21k
cV9jbGllbnQKPgo+IFJldmVydGluZyB0aGlzIHBhdGNoIGFsb25lIGlzIG5vdCB0cml2aWFsLCBz
byBJIGVuZGVkIHVwIHJldmVydGluZyB0aGUKPiBmdWxsIHNlcmllcywgYW5kIEkgY2FuIGNvbmZp
cm0gdGhhdCByZXZlcnRpbmcgdGhlIGZ1bGwgc2VyaWVzIG1ha2VzCj4gdGhlIGRpc3BsYXkgd29y
ayBhZ2Fpbi4KCkkgdGhpbmsgeW91IGNvdWxkIG5vdCBqdXN0IHJldmVydCAiZHJtL21lZGlhdGVr
OiBSZW1vdmUgc3RydWN0CmNtZHFfY2xpZW50IiwgeW91IHNob3VsZCBhbHNvIHJldmVydCB0aGUg
cGF0Y2hlcyBhZnRlciBpdCwgc3VjaCBhcwoKImRybS9tZWRpYXRlazogQ2xlYXIgcGVuZGluZyBm
bGFnIHdoZW4gY21kcSBwYWNrZXQgaXMgZG9uZSIKImRybS9tZWRpYXRlazogQWRkIGNtZHFfaGFu
ZGxlIGluIG10a19jcnRjIgoiZHJtL21lZGlhdGVrOiBEZXRlY3QgQ01EUSBleGVjdXRpb24gdGlt
ZW91dCIKCklmICJkcm0vbWVkaWF0ZWs6IFJlbW92ZSBzdHJ1Y3QgY21kcV9jbGllbnQiIGlzIHRo
ZSBwYXRjaCBjYXVzZQpkaXNwbGF5IGFibm9ybWFsLCBJIHRoaW5rIHlvdSBjb3VsZCBjb21wYXJl
IGNvZGUgdy8gYW5kIHcvbyB0aGlzCnBhdGNoLiBGb2N1cyBvbiB0aGUgdmFsdWUgYWNjdXJhY3ks
IHN1Y2ggYXMgY21kcV9jbCBhbmQgY21kcV9jaGFuLiBBbmQKZm9jdXMgb24gdGhlIGZsb3cgYWNj
dXJhY3ksIHN1Y2ggYXMgbXRrX2RybV9jcnRjX3VwZGF0ZV9jb25maWcoKSBhbmQKZGRwX2NtZHFf
Y2IoKS4gSWYgdGhpcyBjb3VsZCBub3QgZmluZCB0aGUgcHJvYmxlbSwgSSB0aGluayB0aGUgbGF0
ZXN0CndheSBpcyB0byBicmVhayB0aGlzIHBhdGNoIGludG8gc21hbGwgcGF0Y2hlcywgY2hhbmdl
cyBsaXR0bGUgaW4gZWFjaApzbWFsbCBwYXRjaGVzIGFuZCB3ZSBjb3VsZCBmaW5hbGx5IGZpbmQg
b3V0IHRoZSBwcm9ibGVtLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBVbmZvcnR1bmF0ZWx5
LCBhZnRlciB0aGUgbWVyZ2Ugd2luZG93LCBkaWZmZXJlbnQgdGhpbmdzIGJyb2tlIGZvciB0aGlz
Cj4gZGV2aWNlLCBhbmQgSSBkaWRuJ3QgZmluaXNoIGlzb2xhdGluZyB0aGVtLCBhbmQgaXQgaXMg
bm90IGNsZWFyIHRvIG1lCj4geWV0IHdoZXRoZXIgdGhlIGxvZ3MgSSdtIGdldHRpbmcgYXJlIHVz
ZWZ1bCBmb3IgdGhpcyBzcGVjaWZpYyBpc3N1ZSBvcgo+IG5vdC4gQmFzaWNhbGx5IHdpdGggdGhp
cyBzZXJpZXMgbWVyZ2VkIHRoZSBrZXJuZWwgc2VlbXMgdG8gYmUgc3R1Y2ssCj4gYW5kIHRoZSBk
aXNwbGF5IGlzIG5vdCB3b3JraW5nLiBMYXRlc3QgbWVzc2FnZSBpcwo+Cj4gWyAgIDEyLjMyOTE3
M10gbXRrLWlvbW11IDEwMjA1MDAwLmlvbW11OiBQYXJ0aWFsIFRMQiBmbHVzaCB0aW1lZCBvdXQs
Cj4gZmFsbGluZyBiYWNrIHRvIGZ1bGwgZmx1c2gKPgo+IFdpdGhvdXQgdGhlIHNlcmllcywgdGhl
IGtlcm5lbCBnb2VzIGZhciBhbmQgZGlzcGxheSB3b3JrcywgaG93ZXZlcgo+IHRoZXJlIGFyZSBv
dGhlciBpc3N1ZXMgYWZmZWN0aW5nIHRoZSBjcm9zLWVjLCBidXQgSSB0aGluayB0aGF0J3MKPiBh
bm90aGVyIGlzc3VlLgo+Cj4gSSdsbCB0cnkgdG8gZGlnIGEgYml0IG1vcmUsIGJ1dCwgbWVhbndo
aWxlLCBpZiB5b3UgaGF2ZSBhbnkgaWRlYQo+IHBsZWFzZSBsZXQgbWUga25vdy4KPgo+IFRoYW5r
cywKPiAgRW5yaWMKPgo+Cj4gPiBSZWdhcmRzLAo+ID4gQ2h1bi1LdWFuZy4KPiA+Cj4gPiA+Cj4g
PiA+IENoYW5nZXMgaW4gdjI6Cj4gPiA+IDEuIERlZmluZSBtdGtfZHJtX2NtZHFfcGt0X2NyZWF0
ZSgpIGFuZCBtdGtfZHJtX2NtZHFfcGt0X2Rlc3Ryb3koKQo+ID4gPiAgICB3aGVuIENPTkZJR19N
VEtfQ01EUSBpcyByZWFjaGFibGUuCj4gPiA+Cj4gPiA+IENodW4tS3VhbmcgSHUgKDQpOgo+ID4g
PiAgIGRybS9tZWRpYXRlazogVXNlIG1haWxib3ggcnhfY2FsbGJhY2sgaW5zdGVhZCBvZiBjbWRx
X3Rhc2tfY2IKPiA+ID4gICBkcm0vbWVkaWF0ZWs6IFJlbW92ZSBzdHJ1Y3QgY21kcV9jbGllbnQK
PiA+ID4gICBkcm0vbWVkaWF0ZWs6IERldGVjdCBDTURRIGV4ZWN1dGlvbiB0aW1lb3V0Cj4gPiA+
ICAgZHJtL21lZGlhdGVrOiBBZGQgY21kcV9oYW5kbGUgaW4gbXRrX2NydGMKPiA+ID4KPiA+ID4g
IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8IDExMCArKysrKysrKysr
KysrKysrKysrKy0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5MSBpbnNlcnRpb25zKCspLCAx
OSBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gLS0KPiA+ID4gMi4yNS4xCj4gPiA+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
