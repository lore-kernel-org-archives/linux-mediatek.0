Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA12DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 14:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6CHDwFvRg/FyAabKTvv4GgGpPZ+g/8alVDa9d2eol2k=; b=aGVJAq2KGxtfes
	Iq42anY+d5BsekLaE2zJf4NI2RBH+9A2AGBdn5DHOj40tB3WYXdq/N0Rty3iJnUZczszXQhxjfqIR
	hQEyhVuh8ZwlwikKrVlXqfrpgIaZMOzn9szNmU0Xw8odRH1FFflF2I2eZESIIX5NpM6k47SjbrwC5
	8uo7L/9tUDTpkkd+h9q2ZR2UhpRP5uC1xLW6/CbMXbVtm/VwBBw+r9O6/DyeFsIMpny9/X8Xoy87J
	ffCNyy5JJIvCi3oktOIQtPmRMQ134NmCcHczstcL8Lv1+1UEQmZec35EO0hr1IAqbsQm+iDYI6nVJ
	IDCEBy0PxAgoGyr4tRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD5f8-00G3dj-Jk; Thu, 27 Jan 2022 14:22:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD5er-00G3a6-0q; Thu, 27 Jan 2022 14:21:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 46607B822B0;
 Thu, 27 Jan 2022 14:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16986C340EB;
 Thu, 27 Jan 2022 14:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643293309;
 bh=WCMicAv3m6+CZEJhY0E/ZNuhdvOx+mnIiD563lWYSKA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DRVGMFErQez4uI09aLW6MW8vJ+nmNOerjljTHckS3hsk7gLkS4Zgen4nLH1sRJzUx
 wYiQsLJZVfcfEdJ6SZQ+H1vPUxpvVqERDeYW/bnWhEmd59MBrCdsrfQ84uiqtWFLPJ
 08eE0gqxDdNEPbv8BGGA7DhCjIKy+vUg0WjQmRZYtTnJNBa0C3Mq7oOKBeSMR91OcJ
 By0YEZKDTe+T2dcoc0sC9o9fhA1R5XuMjusE11hoL6UKkXIPnRpVmWYFzvoeFGSzyy
 DKkm5fv6xnG4O3b3af3yuc3DzW2PMUKQJPTuN6URw3U9s85mzvhvcxSAIKq+ymJeL2
 CnYGRw5FV9+YQ==
Received: by mail-ej1-f53.google.com with SMTP id ka4so6090055ejc.11;
 Thu, 27 Jan 2022 06:21:49 -0800 (PST)
X-Gm-Message-State: AOAM533OJFdzbyuq8dwycsyNPC+Vppc3y5trL9i7okkcYR+cmB2BwgRa
 uS5VZ3v/oz8Z2UV4G3Ic/A12ZpJhLvGBtK4QPw==
X-Google-Smtp-Source: ABdhPJwFg/nUdUKG/TbORCFUzxiSuRPD7bTzwO4yGRI8Q2uUhc1xeIXTx6N8LN470HA2InvvqGNR0zScKmTCxw059Qw=
X-Received: by 2002:a17:907:a089:: with SMTP id
 hu9mr3168116ejc.680.1643293307414; 
 Thu, 27 Jan 2022 06:21:47 -0800 (PST)
MIME-Version: 1.0
References: <20220104095954.10313-1-angelogioacchino.delregno@collabora.com>
 <CAMty3ZAojTyw3H8VprH9aiyTyWjeL8oqPxNNr=J33_5FrcUj9Q@mail.gmail.com>
 <4b46b8ce-7300-ef42-eb17-efd87ebdf773@collabora.com>
In-Reply-To: <4b46b8ce-7300-ef42-eb17-efd87ebdf773@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 27 Jan 2022 22:21:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-FZ_pCpvZyNOcEMHOk1k5re51uGYY1jCxNxQuu7CQ-5A@mail.gmail.com>
Message-ID: <CAAOTY_-FZ_pCpvZyNOcEMHOk1k5re51uGYY1jCxNxQuu7CQ-5A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 andrzej.hajda@intel.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_062153_417546_7619DF90 
X-CRM114-Status: GOOD (  24.15  )
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

SGksIEFuZ2VsbzoKCkFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5v
LmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+IOaWvAoyMDIy5bm0MeaciDI35pelIOmAseWbmyDkuIvl
jYg2OjMy5a+r6YGT77yaCj4KPiBJbCAxMi8wMS8yMiAwODowOSwgSmFnYW4gVGVraSBoYSBzY3Jp
dHRvOgo+ID4gT24gVHVlLCBKYW4gNCwgMjAyMiBhdCAzOjMwIFBNIEFuZ2Vsb0dpb2FjY2hpbm8g
RGVsIFJlZ25vCj4gPiA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPiB3
cm90ZToKPiA+Pgo+ID4+IERSTSBicmlkZ2UgZHJpdmVycyBhcmUgbm93IGF0dGFjaGluZyB0aGVp
ciBEU0kgZGV2aWNlIGF0IHByb2JlIHRpbWUsCj4gPj4gd2hpY2ggcmVxdWlyZXMgdXMgdG8gcmVn
aXN0ZXIgb3VyIERTSSBob3N0IGluIG9yZGVyIHRvIGxldCB0aGUgYnJpZGdlCj4gPj4gdG8gcHJv
YmU6IHRoaXMgcmVjZW50bHkgc3RhcnRlZCBwcm9kdWNpbmcgYW4gZW5kbGVzcyAtRVBST0JFX0RF
RkVSCj4gPj4gbG9vcCBvbiBzb21lIG1hY2hpbmVzIHRoYXQgYXJlIHVzaW5nIGV4dGVybmFsIGJy
aWRnZXMsIGxpa2UgdGhlCj4gPj4gcGFyYWRlLXBzODY0MCwgZm91bmQgb24gdGhlIEFDRVIgQ2hy
b21lYm9vayBSMTMuCj4gPj4KPiA+PiBOb3cgdGhhdCB0aGUgRFNJIGhvc3RzL2RldmljZXMgcHJv
YmUgc2VxdWVuY2UgaXMgZG9jdW1lbnRlZCwgd2UgY2FuCj4gPj4gZG8gYWRqdXN0bWVudHMgdG8g
dGhlIG10a19kc2kgZHJpdmVyIGFzIHRvIGJvdGggZml4IG5vdyBhbmQgbWFrZSBzdXJlCj4gPj4g
dG8gYXZvaWQgdGhpcyBzaXR1YXRpb24gaW4gdGhlIGZ1dHVyZTogZm9yIHRoaXMsIGZvbGxvd2lu
ZyB3aGF0IGlzCj4gPj4gZG9jdW1lbnRlZCBpbiBkcm1fYnJpZGdlLmMsIG1vdmUgdGhlIG10a19k
c2kgY29tcG9uZW50X2FkZCgpIHRvIHRoZQo+ID4+IG10a19kc2lfb3BzLmF0dGFjaCBjYWxsYmFj
ayBhbmQgZGVsZXRlIGl0IGluIHRoZSBkZXRhY2ggY2FsbGJhY2s7Cj4gPj4ga2VlcGluZyBpbiBt
aW5kIHRoYXQgd2UgYXJlIHJlZ2lzdGVyaW5nIGEgZHJtX2JyaWRnZSBmb3Igb3VyIERTSSwKPiA+
PiB3aGljaCBpcyBvbmx5IHVzZWQvYXR0YWNoZWQgaWYgdGhlIERTSSBIb3N0IGlzIGJvdW5kLCBp
dCB3b3VsZG4ndAo+ID4+IG1ha2Ugc2Vuc2UgdG8ga2VlcCBhZGRpbmcgb3VyIGJyaWRnZSBhdCBw
cm9iZSB0aW1lIChhcyBpdCB3b3VsZAo+ID4+IGJlIHVzZWxlc3MgdG8gaGF2ZSBpdCBpZiBtdGtf
ZHNpX29wcy5hdHRhY2goKSBmYWlscyEpLCBzbyBhbHNvIG1vdmUKPiA+PiB0aGF0IG9uZSB0byB0
aGUgZHNpIGhvc3QgYXR0YWNoIGZ1bmN0aW9uIChhbmQgcmVtb3ZlIGl0IGluIGRldGFjaCkuCj4g
Pj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxv
Z2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+ID4+IFJldmlld2VkLWJ5OiBBbmRy
emVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT4KPiA+PiAtLS0KPiA+Cj4gPiBFdmVu
dHVhbGx5IEkndmUgb2JzZXJ2ZWQgc2ltaWxhciBpc3N1ZSBvbiBvdGhlciBDb21wb25lbnQgYmFz
ZWQgRFNJCj4gPiBjb250cm9sbGVycywgaGVuY2UKPiA+Cj4gPiBSZXZpZXdlZC1ieTogSmFnYW4g
VGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPgo+Cj4gSGVsbG8gZHJpLWRldmVs
LAo+IGNhbiB5b3UgcGxlYXNlIHBpY2sgdGhpcyBwYXRjaD8KPgo+IEFsbCBNZWRpYVRlayBwbGF0
Zm9ybXMgYXJlIGJyb2tlbiBpbiB2NS4xNyB3aXRob3V0IHRoaXMgb25lLgoKUGxlYXNlIGFkZCBG
aXhlcyB0YWcgWzFdIHRvIHRoaXMgcGF0Y2guCgpbMV0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9k
b2MvaHRtbC92NS4xNi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sCgpSZWdhcmRzLApD
aHVuLUt1YW5nLgoKPgo+IFRoYW5rcywKPiBBbmdlbG8KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
