Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA56DC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nUlz9gOvY4ZFpLJn1ylV/xbU/Gc2j1G6n18l35/Vv94=; b=DRrq4LyEKDOA+x
	zRBrpZvmh8supvjC+R8ZvtxbLH+iK5Tpaqkz78ICGyzO0ba5RhRpnjMZkzCxHmERmhp+JRGq9Xmpt
	7FNSZe0WUkJGxAqRC/VztADcOfaBUi4M65WMaQn5d4qXZbxtBer4Lt0RIvMH1FRc1tRWSmTAUKFbu
	TN3uBNKoWfrC/4FR7TuqAXvhgTr4GEEpJXeBZVXUUz5WZQESJ7tzscCiW+0zTTGpfGyTq41Od+cA3
	NMAyuj3VeIFct89Wa4ipA3+r2mJia5CWsX/g2xgcjvl84TFNO+pY92eJPZVMYK76CqUAK0eKt8K0s
	0hq1u087ePpCuzhe5IQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDTdQ-002niV-MY; Fri, 28 Jan 2022 15:58:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDTdC-002ne9-ME; Fri, 28 Jan 2022 15:57:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BD036B82635;
 Fri, 28 Jan 2022 15:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1A4C340E6;
 Fri, 28 Jan 2022 15:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643385463;
 bh=IQ8hvyw1pDAvDp94xvG8YbiEIf7ZBPJyDu22r8ISfVw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VNz1du+TBjld4PhPZ+jkdPNJiAVgrFEcCQMeV1IqW4tQxuagjbz750OUKZYNO9Wqe
 5Ramldm2aALYNHOqEtVoUe/KzJ+9j2fGR2FHzVonemL+LT3wGtyfYuZ6CteNb1hqTF
 OXI2GJLwBTYodJGgenkJ6c2FIYeid+gulDzFkbqEcdM9UXwjgYV+Aow9Dm0eumZinc
 Ns4nKSiQ0vomivo5dR6fLv+zTujyFIhazzVts2vMEKKYc+krpOzL8M7yY5gLfh66s4
 7w0URWeLM3EXoEIfmJupi3xQTR4hPuaX1NsYY+SJIt0fUn0KJJJHkR7/jetdjWLdEV
 8j7gPnfuljTGg==
Received: by mail-ej1-f42.google.com with SMTP id s13so17505956ejy.3;
 Fri, 28 Jan 2022 07:57:43 -0800 (PST)
X-Gm-Message-State: AOAM532B8wdj1bP/3Gwh1fdVwoakUEyaXRZl9kc0BX9DsQS/iBRcLegR
 7ovFz4zUInxmHeLyY8HOQMtsGApIezE3lr1RDA==
X-Google-Smtp-Source: ABdhPJyMCW3ZK9Ri660QNZ9AOmvNSPBp9tIK7lI4yHvpk7o6D/w1vWVHsyn828J7qAojrYyUdg5EKyBrHHxW5i1lJ8U=
X-Received: by 2002:a17:907:3ea8:: with SMTP id
 hs40mr7443689ejc.48.1643385461799; 
 Fri, 28 Jan 2022 07:57:41 -0800 (PST)
MIME-Version: 1.0
References: <20220127143623.123025-1-angelogioacchino.delregno@collabora.com>
 <CAAOTY__yO6Cq8qt8RSh9AX68mJEv+wWvuhY0_p-PTJ=eJD_7aA@mail.gmail.com>
 <b8911eab-1419-60ad-ef07-25a5de365a52@collabora.com>
 <ddb05e08-f81a-11f9-8091-9af0c57e687d@collabora.com>
In-Reply-To: <ddb05e08-f81a-11f9-8091-9af0c57e687d@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 28 Jan 2022 23:57:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8ZPmUEizdVEOWb26FV+3qpndk=t1N2vYyFCd4K2RM0Nw@mail.gmail.com>
Message-ID: <CAAOTY_8ZPmUEizdVEOWb26FV+3qpndk=t1N2vYyFCd4K2RM0Nw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, 
 linux-kernel <linux-kernel@vger.kernel.org>, andrzej.hajda@intel.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_075747_050980_6F3829E7 
X-CRM114-Status: GOOD (  41.93  )
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

QW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29s
bGFib3JhLmNvbT4g5pa8CjIwMjLlubQx5pyIMjjml6Ug6YCx5LqUIOS4i+WNiDU6MTPlr6vpgZPv
vJoKPgo+IElsIDI3LzAxLzIyIDE2OjQ2LCBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyBoYSBz
Y3JpdHRvOgo+ID4gSWwgMjcvMDEvMjIgMTY6MjEsIENodW4tS3VhbmcgSHUgaGEgc2NyaXR0bzoK
PiA+PiBIaSwgQW5nZWxvOgo+ID4+Cj4gPj4gQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFu
Z2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4g5pa8Cj4gPj4gMjAyMuW5tDHm
nIgyN+aXpSDpgLHlm5sg5LiL5Y2IMTA6Mzblr6vpgZPvvJoKPiA+Pj4KPiA+Pj4gRFJNIGJyaWRn
ZSBkcml2ZXJzIGFyZSBub3cgYXR0YWNoaW5nIHRoZWlyIERTSSBkZXZpY2UgYXQgcHJvYmUgdGlt
ZSwKPiA+Pj4gd2hpY2ggcmVxdWlyZXMgdXMgdG8gcmVnaXN0ZXIgb3VyIERTSSBob3N0IGluIG9y
ZGVyIHRvIGxldCB0aGUgYnJpZGdlCj4gPj4+IHRvIHByb2JlOiB0aGlzIHJlY2VudGx5IHN0YXJ0
ZWQgcHJvZHVjaW5nIGFuIGVuZGxlc3MgLUVQUk9CRV9ERUZFUgo+ID4+PiBsb29wIG9uIHNvbWUg
bWFjaGluZXMgdGhhdCBhcmUgdXNpbmcgZXh0ZXJuYWwgYnJpZGdlcywgbGlrZSB0aGUKPiA+Pj4g
cGFyYWRlLXBzODY0MCwgZm91bmQgb24gdGhlIEFDRVIgQ2hyb21lYm9vayBSMTMuCj4gPj4+Cj4g
Pj4+IE5vdyB0aGF0IHRoZSBEU0kgaG9zdHMvZGV2aWNlcyBwcm9iZSBzZXF1ZW5jZSBpcyBkb2N1
bWVudGVkLCB3ZSBjYW4KPiA+Pj4gZG8gYWRqdXN0bWVudHMgdG8gdGhlIG10a19kc2kgZHJpdmVy
IGFzIHRvIGJvdGggZml4IG5vdyBhbmQgbWFrZSBzdXJlCj4gPj4+IHRvIGF2b2lkIHRoaXMgc2l0
dWF0aW9uIGluIHRoZSBmdXR1cmU6IGZvciB0aGlzLCBmb2xsb3dpbmcgd2hhdCBpcwo+ID4+PiBk
b2N1bWVudGVkIGluIGRybV9icmlkZ2UuYywgbW92ZSB0aGUgbXRrX2RzaSBjb21wb25lbnRfYWRk
KCkgdG8gdGhlCj4gPj4+IG10a19kc2lfb3BzLmF0dGFjaCBjYWxsYmFjayBhbmQgZGVsZXRlIGl0
IGluIHRoZSBkZXRhY2ggY2FsbGJhY2s7Cj4gPj4+IGtlZXBpbmcgaW4gbWluZCB0aGF0IHdlIGFy
ZSByZWdpc3RlcmluZyBhIGRybV9icmlkZ2UgZm9yIG91ciBEU0ksCj4gPj4+IHdoaWNoIGlzIG9u
bHkgdXNlZC9hdHRhY2hlZCBpZiB0aGUgRFNJIEhvc3QgaXMgYm91bmQsIGl0IHdvdWxkbid0Cj4g
Pj4+IG1ha2Ugc2Vuc2UgdG8ga2VlcCBhZGRpbmcgb3VyIGJyaWRnZSBhdCBwcm9iZSB0aW1lIChh
cyBpdCB3b3VsZAo+ID4+PiBiZSB1c2VsZXNzIHRvIGhhdmUgaXQgaWYgbXRrX2RzaV9vcHMuYXR0
YWNoKCkgZmFpbHMhKSwgc28gYWxzbyBtb3ZlCj4gPj4+IHRoYXQgb25lIHRvIHRoZSBkc2kgaG9z
dCBhdHRhY2ggZnVuY3Rpb24gKGFuZCByZW1vdmUgaXQgaW4gZGV0YWNoKS4KPiA+Pj4KPiA+Pj4g
Rml4ZXM6IDIwOTI2NGE4NTcwNyAoImRybS9icmlkZ2U6IERvY3VtZW50IHRoZSBwcm9iZSBpc3N1
ZSB3aXRoIE1JUEktRFNJIGJyaWRnZXMiKQo+ID4+Cj4gPj4gVGhlIGZpeGVkIHRhZyBzaG91bGQg
aW5kaWNhdGUgdGhlIHBhdGNoIHdoaWNoIGNhdXNlIHRoZSBidWcsIGJ1dCB3aHkgYQo+ID4+IHBh
dGNoIGp1c3QgYWRkaW5nIGRvY3VtZW50IHdvdWxkIGNhdXNlIGJ1Zz8KPiA+PiBTbyBubyBhbnkg
cGF0Y2ggY2F1c2UgYnVnPyBUaGlzIHBhdGNoIGp1c3Qgd2FudCB0byBwcmV2ZW50IGEgcG9zc2li
bGUgYnVnPwo+ID4+Cj4gPgo+ID4gSSB0aGluayB5b3UndmUgbWlzc2VkIG15IHByZXZpb3VzIG1l
c3NhZ2Ugb24gdjIsIHNvIEkgd2lsbCBwYXN0ZSBpdCBoZXJlOgo+ID4KPiA+IHVuZm9ydHVuYXRl
bHkgSSBjb3VsZG4ndCBmaW5kIGEgdmFsaWQgY29tbWl0IGZvciBhIEZpeGVzIHRhZy4gVGhpcwo+
ID4gc3RhcnRlZCBiZWluZyBhbiBpc3N1ZSBhdCBzb21lIHBvaW50LCB3aGVuIHRoZSBEUk0gd2Fz
IGNoYW5nZWQgdG8KPiA+IGFkaGVyZSB0byB0aGUgZG9jdW1lbnRlZCBwcm9iZSBzZXF1ZW5jZTog
dGhlIE1lZGlhVGVrIERTSSBkcml2ZXIgd2FzCj4gPiBub3QgdGhlIG9ubHkgb25lIHRoYXQgZ290
IGJyb2tlbi9hZmZlY3RlZCBieSB0aGVzZSBjaGFuZ2VzLgo+ID4KPiA+IElmIHlvdSBoYXZlIGFu
eSBhZHZpY2Ugb24gd2hpY2ggY29tbWl0IHNob3VsZCBiZSB0YWdnZWQsIEknbSBvcGVuIGZvcgo+
ID4gYW55IGtpbmQgb2Ygc3VnZ2VzdGlvbi4KPiA+Cj4gPgo+ID4gSSB0cmllZCB0byBjaGVjayBv
biBvdGhlciBkcml2ZXJzIHdoaWNoIGdvdCBmaXhlZCBmb3IgdGhlIHNhbWUgYmVoYXZpb3IsCj4g
PiBmb3IgZXhhbXBsZSBkcm0vbXNtLCBidXQgbm9uZSBvZiB0aGVtIGhhZCBhIEZpeGVzIHRhZy4K
PiA+IFdoZW4gdGhlIERSTSBnb3QgY2hhbmdlZCB0byBhZGhlcmUgdG8gdGhpcyBzZXF1ZW5jZSwg
c29tZSBkcm0vYnJpZGdlCj4gPiBkcml2ZXJzIHdlcmUgYWxzbyBjaGFuZ2VkOyB0aGlzIGhhcyBj
cmVhdGVkIHNvbWUgaW5jb21wYXRpYmlsaXRpZXMgd2l0aAo+ID4gc29tZSBkcm0gZHJpdmVycywg
aW5jbHVkaW5nIGRybS9tc20gYW5kIGRybS9tZWRpYXRlay4KPiA+Cj4gPiBUaGlzIGNvbW1pdCBp
cyBub3QgZml4aW5nIGEgbGF0ZW50IGJ1ZyB0aGF0IHdhcyBpbnRyb2R1Y2VkIGluIGRybS9tZWRp
YXRlawo+ID4gYnV0IHJhdGhlciBvbmUgdGhhdCB3YXMgaW5kdWNlZCBieSB0aGUgbmV3LCBmaXhl
ZCwgcHJvYmUgZmxvdyB0aGF0IGdvdAo+ID4gcmVjZW50bHkgZG9jdW1lbnRlZCAtIGFuZCB0byB3
aGljaCBkcml2ZXJzIHNob3VsZCBhZGhlcmU7IGZhaWxpbmcgdG8gYWRoZXJlCj4gPiB0byB0aGF0
IHdpbGwgcHJvZHVjZSBhbiBlbmRsZXNzIC1FUFJPQkVfREVGRVIgbG9vcCwgZHVlIHRvIG90aGVy
IGRyaXZlcnMKPiA+IChhcyBtZW50aW9uZWQsIGZvciBleGFtcGxlIGRybS9icmlkZ2UgZHJpdmVy
cykgaGF2aW5nIGJlZW4gY2hhbmdlZCB0byB1c2UKPiA+IHRoYXQgcHJvYmUgc2VxdWVuY2UuCj4g
Pgo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBBbmdlbG8KPiA+Cj4KPiBJJ3ZlIGJlZW4gdGhpbmtpbmcg
YWJvdXQgYW5vdGhlciBzb2x1dGlvbiB0byB0aGlzIGlzc3VlLgo+Cj4gV291bGQgaXQgYmUgZmlu
ZSBpZiBJIHNlbmQgYSB2NCB0aGF0IHJlbW92ZXMgdGhlIEZpeGVzIHRhZywgYnV0IGFkZHMgdGhl
IGZvbGxvd2luZz8KPgo+IENjOiBzdGFibGVAa2VybmVsLm9yZyAjIHY1LjE1KwoKSXQncyBvayB0
byBtZS4gQWNjb3JkaW5nIHRvIHRoZSBkb2N1bWVudGVkIGZvcm1hdCBbMV0sIEkgdGhpbmsgdGhp
cyBzaG91bGQgYmUKCkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyA1LjE1LngKClsxXSBo
dHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y1LjE2L3Byb2Nlc3Mvc3RhYmxlLWtlcm5l
bC1ydWxlcy5odG1sCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+ID4+IFJlZ2FyZHMsCj4gPj4g
Q2h1bi1LdWFuZy4KPiA+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERl
bCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+ID4+PiBS
ZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+Cj4gPj4+
IFJldmlld2VkLWJ5OiBKYWdhbiBUZWtpIDxqYWdhbkBhbWFydWxhc29sdXRpb25zLmNvbT4KPiA+
Pj4KPiA+Pj4gLS0tCj4gPj4+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8
IDE2NyArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ID4+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCA4NCBpbnNlcnRpb25zKCspLCA4MyBkZWxldGlvbnMoLSkKPiA+Pj4KPgo+Cj4gLS0KPiBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubwo+IFNvZnR3YXJlIEVuZ2luZWVyCj4KPiBDb2xsYWJvcmEg
THRkLgo+IFBsYXRpbnVtIEJ1aWxkaW5nLCBTdCBKb2huJ3MgSW5ub3ZhdGlvbiBQYXJrLCBDYW1i
cmlkZ2UgQ0I0IDBEUywgVUsKPiBSZWdpc3RlcmVkIGluIEVuZ2xhbmQgJiBXYWxlcywgbm8uIDU1
MTM3MTgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
