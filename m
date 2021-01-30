Return-Path: <SRS0=EsFa=HB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68698C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 09:46:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12A2664DDC
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 09:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12A2664DDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1FLw9Nuy1szhX8Yoh4W1s4qOb/s8rjV4M83SnuNccTk=; b=dgLeZOit6YsGIa2KZ5xykG5lw
	E2Pnqc3HpnkV2wrxs3UuPJfFAYMvnSx0+TfMvmNOpj6sWVT7Z5vhnv8xWhLSq0XMfuTltcWV9Skag
	L0hW5BPSSERB9iNWIg+rbcSX4m38HTW0/bh0BmLiKb13yW64ZtM8AQiVhHUgrfPOYqf41qcH/fdu7
	n2ZKFLqdI2WH5LMpsf5DpGypvv1vaoGe7p/1K4wn6SP0HNyYtk0910cF/8RjWxfkNR6NRKCKduN3+
	v3yGoDksBAoUIowB+fPIcBndmUjtacGDhH8E9hq/AngsxSpqlsNGwNv3ltkhd6mUTJID3fibsaHlH
	fd5sby6TQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5mpK-0002Gi-4j; Sat, 30 Jan 2021 09:45:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5mpF-0002Fo-Fo; Sat, 30 Jan 2021 09:45:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91FC664E04;
 Sat, 30 Jan 2021 09:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611999951;
 bh=MhQGmFgm/LGG1ligU9jCk3BNvT4EdziFNPpiMLDajrE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ttc3Y1c7ogHDMe1fGfGMNlq8p6ptIklpY7cIqMmFL1YhWivfE7GfWl3xrgyjPCIno
 BAC/zvnVdviTnfV2EH6VTNE7mg9S0G9iDmaQVOBL9TFX/Dsu/DT2/0MuwkzboHX6G+
 KG/OdwPyERud0t44FCFJeyrhCmanu3LGerldZ+acAz5wfhGfX1c8qgo9hfB/kHWSsG
 XmOQv4uxoPcP6mxfaTnd4y9LP+6zkjyOe4QFJHbpNC2JOWY9LB0E/iSJJq+xe9bmJS
 jcAPFazowHSASrDTnsdCSlVRkL5RcO3/5BBQzAT+ihDzH/ujDpVvkVfHFWowcJSOGj
 WlmOZXmoLmaQw==
Received: by mail-wr1-f51.google.com with SMTP id q7so11205500wre.13;
 Sat, 30 Jan 2021 01:45:51 -0800 (PST)
X-Gm-Message-State: AOAM530PjGvXISrRYZNLBgzmCl/NqMcTsi0PMfk4uQyGlVX8oX/U8BYn
 rNfSwxA8xiod6o8k8R80y+//zfURPQ30DZnI+Q==
X-Google-Smtp-Source: ABdhPJyB4BiUHRoeBGFBg4TGw9IN5L7kt1fDo/DtawET2t8dfkdw1dTjhLZCj+8lSm4K+kgbv7iA2Qui4j5NU86e5WA=
X-Received: by 2002:adf:f303:: with SMTP id i3mr8763867wro.60.1611999950124;
 Sat, 30 Jan 2021 01:45:50 -0800 (PST)
MIME-Version: 1.0
References: <20201202235856.7652-1-chunkuang.hu@kernel.org>
 <CAAOTY__p4C0ctXuOFu42-9HaTrGnOef-Sg47pyC0Uk7yN5406w@mail.gmail.com>
In-Reply-To: <CAAOTY__p4C0ctXuOFu42-9HaTrGnOef-Sg47pyC0Uk7yN5406w@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 30 Jan 2021 17:45:37 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Qk8Bun9km1DRoCPMAwOJdJ2omsnMipS1jGzUrrrv=sg@mail.gmail.com>
Message-ID: <CAAOTY_9Qk8Bun9km1DRoCPMAwOJdJ2omsnMipS1jGzUrrrv=sg@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: cmdq: Remove cmdq_pkt_flush()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_044553_670248_0EBD8AA7 
X-CRM114-Status: GOOD (  21.67  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hdHRoaWFzOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaW
vCAyMDIx5bm0MeaciDEw5pelIOmAseaXpSDkuIrljYg2OjU55a+r6YGT77yaCj4KPiBIaSwgTWF0
dGhpYXM6Cj4KPiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g5pa8IDIw
MjDlubQxMuaciDPml6Ug6YCx5ZubIOS4iuWNiDc6NTnlr6vpgZPvvJoKPiA+Cj4gPiByeF9jYWxs
YmFjayBpcyBhIHN0YW5kYXJkIG1haWxib3ggY2FsbGJhY2sgbWVjaGFuaXNtIGFuZCBjb3VsZAo+
ID4gY292ZXIgdGhlIGZ1bmN0aW9uIG9mIHByb3ByaWV0YXJ5IGNtZHFfdGFza19jYiwgc28gaXQg
aXMgYmV0dGVyCj4gPiB0byB1c2UgdGhlIHN0YW5kYXJkIG9uZSBpbnN0ZWFkIG9mIHRoZSBwcm9w
cmlldGFyeSBvbmUuIEJ1dAo+ID4gcmVnaXN0ZXIgcnhfY2FsbGJhY2sgc2hvdWxkIGJlZm9yZSBt
Ym94X3JlcXVlc3RfY2hhbm5lbCgpLAo+ID4gc28gcmVtb3ZlIGNtZHFfcGt0X2ZsdXNoKCkgYW5k
IGxldCBjbGllbnQgZHJpdmVyIGltcGxlbWVudAo+ID4gaXRzIG93biBzeW5jaHJvbm91cyBmbHVz
aC4KPgo+IEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdGhpcyBwYXRjaD8gVGhpcyBwYXRjaCBpcyBk
ZXJpdmVkIGZyb20gWzFdCj4gYWNjb3JkaW5nIHRvIEphc3NpJ3Mgc3VnZ2VzdGlvbiBbMl0uCj4K
PiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVr
L3BhdGNoLzIwMjAwOTI3MjMwNDIyLjExNjEwLTMtY2h1bmt1YW5nLmh1QGtlcm5lbC5vcmcvCj4g
WzJdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9j
b3Zlci8yMDIwMDkyNzIzMDQyMi4xMTYxMC0xLWNodW5rdWFuZy5odUBrZXJuZWwub3JnLwoKSnVz
dCBhIHBpbmcuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFu
Zy4KPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBr
ZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVs
cGVyLmMgfCAzMiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIGluY2x1ZGUvbGludXgv
c29jL21lZGlhdGVrL210ay1jbWRxLmggIHwgMTIgLS0tLS0tLS0tLQo+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgNDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL21l
ZGlhdGVrL210ay1jbWRxLWhlbHBlci5jIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEt
aGVscGVyLmMKPiA+IGluZGV4IDUwNTY1MWIwZDcxNS4uZmQzYmMzOTUzOGExIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMKPiA+ICsrKyBiL2Ry
aXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jCj4gPiBAQCAtNTAyLDM2ICs1MDIs
NCBAQCBpbnQgY21kcV9wa3RfZmx1c2hfYXN5bmMoc3RydWN0IGNtZHFfcGt0ICpwa3QsIGNtZHFf
YXN5bmNfZmx1c2hfY2IgY2IsCj4gPiAgfQo+ID4gIEVYUE9SVF9TWU1CT0woY21kcV9wa3RfZmx1
c2hfYXN5bmMpOwo+ID4KPiA+IC1zdHJ1Y3QgY21kcV9mbHVzaF9jb21wbGV0aW9uIHsKPiA+IC0g
ICAgICAgc3RydWN0IGNvbXBsZXRpb24gY21wbHQ7Cj4gPiAtICAgICAgIGJvb2wgZXJyOwo+ID4g
LX07Cj4gPiAtCj4gPiAtc3RhdGljIHZvaWQgY21kcV9wa3RfZmx1c2hfY2Ioc3RydWN0IGNtZHFf
Y2JfZGF0YSBkYXRhKQo+ID4gLXsKPiA+IC0gICAgICAgc3RydWN0IGNtZHFfZmx1c2hfY29tcGxl
dGlvbiAqY21wbHQ7Cj4gPiAtCj4gPiAtICAgICAgIGNtcGx0ID0gKHN0cnVjdCBjbWRxX2ZsdXNo
X2NvbXBsZXRpb24gKilkYXRhLmRhdGE7Cj4gPiAtICAgICAgIGlmIChkYXRhLnN0YSAhPSBDTURR
X0NCX05PUk1BTCkKPiA+IC0gICAgICAgICAgICAgICBjbXBsdC0+ZXJyID0gdHJ1ZTsKPiA+IC0g
ICAgICAgZWxzZQo+ID4gLSAgICAgICAgICAgICAgIGNtcGx0LT5lcnIgPSBmYWxzZTsKPiA+IC0g
ICAgICAgY29tcGxldGUoJmNtcGx0LT5jbXBsdCk7Cj4gPiAtfQo+ID4gLQo+ID4gLWludCBjbWRx
X3BrdF9mbHVzaChzdHJ1Y3QgY21kcV9wa3QgKnBrdCkKPiA+IC17Cj4gPiAtICAgICAgIHN0cnVj
dCBjbWRxX2ZsdXNoX2NvbXBsZXRpb24gY21wbHQ7Cj4gPiAtICAgICAgIGludCBlcnI7Cj4gPiAt
Cj4gPiAtICAgICAgIGluaXRfY29tcGxldGlvbigmY21wbHQuY21wbHQpOwo+ID4gLSAgICAgICBl
cnIgPSBjbWRxX3BrdF9mbHVzaF9hc3luYyhwa3QsIGNtZHFfcGt0X2ZsdXNoX2NiLCAmY21wbHQp
Owo+ID4gLSAgICAgICBpZiAoZXJyIDwgMCkKPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gZXJy
Owo+ID4gLSAgICAgICB3YWl0X2Zvcl9jb21wbGV0aW9uKCZjbXBsdC5jbXBsdCk7Cj4gPiAtCj4g
PiAtICAgICAgIHJldHVybiBjbXBsdC5lcnIgPyAtRUZBVUxUIDogMDsKPiA+IC19Cj4gPiAtRVhQ
T1JUX1NZTUJPTChjbWRxX3BrdF9mbHVzaCk7Cj4gPiAtCj4gPiAgTU9EVUxFX0xJQ0VOU0UoIkdQ
TCB2MiIpOwo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1j
bWRxLmggYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oCj4gPiBpbmRleCA5
NjA3MDRkNzU5OTQuLjJjNmFhODRjMGU4MCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGludXgv
c29jL21lZGlhdGVrL210ay1jbWRxLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvc29jL21lZGlh
dGVrL210ay1jbWRxLmgKPiA+IEBAIC0yODgsMTYgKzI4OCw0IEBAIGludCBjbWRxX3BrdF9maW5h
bGl6ZShzdHJ1Y3QgY21kcV9wa3QgKnBrdCk7Cj4gPiAgaW50IGNtZHFfcGt0X2ZsdXNoX2FzeW5j
KHN0cnVjdCBjbWRxX3BrdCAqcGt0LCBjbWRxX2FzeW5jX2ZsdXNoX2NiIGNiLAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpOwo+ID4KPiA+IC0vKioKPiA+IC0gKiBjbWRx
X3BrdF9mbHVzaCgpIC0gdHJpZ2dlciBDTURRIHRvIGV4ZWN1dGUgdGhlIENNRFEgcGFja2V0Cj4g
PiAtICogQHBrdDogICAgICAgdGhlIENNRFEgcGFja2V0Cj4gPiAtICoKPiA+IC0gKiBSZXR1cm46
IDAgZm9yIHN1Y2Nlc3M7IGVsc2UgdGhlIGVycm9yIGNvZGUgaXMgcmV0dXJuZWQKPiA+IC0gKgo+
ID4gLSAqIFRyaWdnZXIgQ01EUSB0byBleGVjdXRlIHRoZSBDTURRIHBhY2tldC4gTm90ZSB0aGF0
IHRoaXMgaXMgYQo+ID4gLSAqIHN5bmNocm9ub3VzIGZsdXNoIGZ1bmN0aW9uLiBXaGVuIHRoZSBm
dW5jdGlvbiByZXR1cm5lZCwgdGhlIHJlY29yZGVkCj4gPiAtICogY29tbWFuZHMgaGF2ZSBiZWVu
IGRvbmUuCj4gPiAtICovCj4gPiAtaW50IGNtZHFfcGt0X2ZsdXNoKHN0cnVjdCBjbWRxX3BrdCAq
cGt0KTsKPiA+IC0KPiA+ICAjZW5kaWYgLyogX19NVEtfQ01EUV9IX18gKi8KPiA+IC0tCj4gPiAy
LjE3LjEKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
