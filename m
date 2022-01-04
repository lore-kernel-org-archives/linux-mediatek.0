Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D983C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 00:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjiZ6SRtyZ0KYw9fIynVTTPuXUd5CSeL+YHeFR8/b40=; b=qqDt5FCeAVblvp
	QIoRu5lJtADx/ziritT7Okcyx4xiAT5+aUWtYqjBmei4CDB/BfkRUfnx+0Lt0kW1bhaUQ+xBmHH3O
	MbJ9s7fkxxLfYE9sZHtbfQoXDbztz6V530EvR88TzGjYg5UFfzQkuHiUPuvqLUrqeFtRp5xHg4dYG
	VybqBNi/vpc3+WXvVuv0xBRJt017fCyN/6OdsHdoD5ueIWNZzWUQq3Hua9OBjdU39237sdmuExeFR
	/rI2It3avrzl2PDrdcYciNrbW7nnz+r6RNxmtwIRCuaHQLOiZ+CWbCyK4boPmnMOPXLaommfvbh8M
	OXV/dDl7kajWLMa2PNYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4XGC-00A8V0-JP; Tue, 04 Jan 2022 00:01:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4XFz-00A8T6-A6; Tue, 04 Jan 2022 00:00:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B7171B81116;
 Tue,  4 Jan 2022 00:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BB3C36AEF;
 Tue,  4 Jan 2022 00:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641254448;
 bh=TNarL2hfu8eJEcGtDz9+dQGA77tHSc49VlWpuvPnZ1I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Eo0d+CTN+FJuwECto80YDNRaqot6AcT3Bxh3XoliN0XewK/BjDNPG0IJYL4In1zX2
 ZiuXIrm8SfnDNb5bMmNkrufSwrLApanTc7G+RtQlJj+rijosScqsTz9SwHvQLSBXLH
 Uk2dcIKVJJ9NX87GoqC7Fk1dxMqCx+VJba42HV6AI1vJXjFU4lvQVgjqt2ZwcStE7+
 kqa9OAjitm67zTlz8D8gCQnFnktwYLenpRFHNNgAfXGWo2DBYmltqnwXYROXpV0GCv
 aJDVh8vm98EBjS7gM2ILCtHb8DmFQJa2VAnhsbnhkpWC6EIBmnjD1bwVJky0e2tOIH
 3XPFll6PKc3YQ==
Received: by mail-ed1-f54.google.com with SMTP id o6so141666194edc.4;
 Mon, 03 Jan 2022 16:00:48 -0800 (PST)
X-Gm-Message-State: AOAM530l15PykFwlXhyadLr+thz4e2qSf/fz1PX/a6iVTPE71ae41DF5
 Jnxo/j6ICkI51+yk96a1qv9Sj/RF6GZgaWqcCQ==
X-Google-Smtp-Source: ABdhPJyaz7BnlYjQMVi+kdPY5KTdRWwNiolCizpj3tNIG5pA43f+7YnaYUahBNDOYOQUnP476RsDvzNIT9t6xMhhfW8=
X-Received: by 2002:a17:906:c109:: with SMTP id
 do9mr37211153ejc.48.1641254446823; 
 Mon, 03 Jan 2022 16:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20220103054706.8072-1-miles.chen@mediatek.com>
In-Reply-To: <20220103054706.8072-1-miles.chen@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Jan 2022 08:00:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-WX8p=Ba_4JPgnX4Wmh66bNF09RiP5C7+0=7V-ngdsLA@mail.gmail.com>
Message-ID: <CAAOTY_-WX8p=Ba_4JPgnX4Wmh66bNF09RiP5C7+0=7V-ngdsLA@mail.gmail.com>
Subject: Re: [PATCH v4] drm/mediatek: Fix mtk_cec_mask()
To: Miles Chen <miles.chen@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Junzhi Zhao <junzhi.zhao@mediatek.com>, 
 Jie Qiu <jie.qiu@mediatek.com>, Zhiqiang Lin <zhiqiang.lin@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_160051_657666_B130D96E 
X-CRM114-Status: GOOD (  18.80  )
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

SGksIE1pbGVzOgoKTWlsZXMgQ2hlbiA8bWlsZXMuY2hlbkBtZWRpYXRlay5jb20+IOaWvCAyMDIy
5bm0MeaciDPml6Ug6YCx5LiAIOS4i+WNiDE6NDflr6vpgZPvvJoKPgo+IEluIGN1cnJlbnQgaW1w
bGVtZW50YXRpb24sIG10a19jZWNfbWFzaygpIHdyaXRlcyB2YWwgaW50byB0YXJnZXQgcmVnaXN0
ZXIKPiBhbmQgaWdub3JlcyB0aGUgbWFzay4gQWZ0ZXIgdGFsa2luZyB0byBvdXIgaGRtaSBleHBl
cnRzLCBtdGtfY2VjX21hc2soKQo+IHNob3VsZCByZWFkIGEgcmVnaXN0ZXIsIGNsZWFuIG9ubHkg
bWFzayBiaXRzLCBhbmQgdXBkYXRlICh2YWwgfCBtYXNrKSBiaXRzCj4gdG8gdGhlIHJlZ2lzdGVy
LgoKUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoK
Pgo+IEZpeGVzOiA4ZjgzZjI2ODkxZTEgKCJkcm0vbWVkaWF0ZWs6IEFkZCBIRE1JIHN1cHBvcnQi
KQo+Cj4gQ2M6IFpoaXFpYW5nIExpbiA8emhpcWlhbmcubGluQG1lZGlhdGVrLmNvbT4KPiBDYzog
Q0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiBDYzogTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhp
YXMuYmdnQGdtYWlsLmNvbT4KPgo+IFNpZ25lZC1vZmYtYnk6IE1pbGVzIENoZW4gPG1pbGVzLmNo
ZW5AbWVkaWF0ZWsuY29tPgo+Cj4gLS0tCj4KPiBDaGFuZ2Ugc2luY2UgdjE6Cj4gYWRkIEZpeGVz
IHRhZwo+Cj4gQ2hhbmdlIHNpbmNlIHYyOgo+IGFkZCBleHBsYW5hdGlvbiBvZiBtdGtfY2VjX21h
c2soKQo+Cj4gQ2hhbmdlIHNpbmNlIHYzOgo+IGNoYW5nZSBtaXNsZWFkaW5nIHN1YmplY3QgYW5k
IG1vZGlmeSB0aGUgY29tbWl0IG1lc3NhZ2Ugc2luY2UgdGhpcyBpcyBhIGJ1ZyBmaXggcGF0Y2gK
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NlYy5jIHwgMiArLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NlYy5jIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19jZWMuYwo+IGluZGV4IGU5Y2VmNWMwYzhmNy4uY2RmYTY0ODkxMGIyIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfY2VjLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2NlYy5jCj4gQEAgLTg1LDcgKzg1LDcgQEAgc3Rh
dGljIHZvaWQgbXRrX2NlY19tYXNrKHN0cnVjdCBtdGtfY2VjICpjZWMsIHVuc2lnbmVkIGludCBv
ZmZzZXQsCj4gICAgICAgICB1MzIgdG1wID0gcmVhZGwoY2VjLT5yZWdzICsgb2Zmc2V0KSAmIH5t
YXNrOwo+Cj4gICAgICAgICB0bXAgfD0gdmFsICYgbWFzazsKPiAtICAgICAgIHdyaXRlbCh2YWws
IGNlYy0+cmVncyArIG9mZnNldCk7Cj4gKyAgICAgICB3cml0ZWwodG1wLCBjZWMtPnJlZ3MgKyBv
ZmZzZXQpOwo+ICB9Cj4KPiAgdm9pZCBtdGtfY2VjX3NldF9ocGRfZXZlbnQoc3RydWN0IGRldmlj
ZSAqZGV2LAo+IC0tCj4gMi4xOC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
