Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C716C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 09:30:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F32C061289
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 09:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F32C061289
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKt4uacfqR0l4muGUwBvph1cB2KRc2jEI+m/nKwGyBg=; b=UpeAmB3Yy7szjd
	i+9j4/q+2iBPEqEbravf76aMSc4MaQ4bMry4eUiFC19NCpYcItOwMZSPyoI9fm2jqgbxFDq0Kx6pe
	KnUEQBUwqzFz7aePSnIn+ZlFnIJMvfno6woqBDFe50fTxs1qOxW2GOHw7n1siTQfTZ5fZYSEzgNQC
	dod3Ij/dV8WbmLbc2an1qHM1Pb8d04FIrYBZUGLruOsbUhcSPKIN88tiFhFhWfYHOtvU18oWym0bc
	hgAdd81mhJpZTKjAEGLnMrkrkHyW7px4a6MMz+bMZ8tlpb1bE8y3A0OKA/PIzgbV+WCOmvTOmYIVW
	/Nt7KE5IB4OwR1lgIwjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvcjW-006PfC-AE; Tue, 22 Jun 2021 09:30:14 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvcj6-006PTC-Cn
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 09:29:50 +0000
Received: by mail-qt1-x832.google.com with SMTP id z4so15560486qts.4
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Jun 2021 02:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=58zdBT4iccY3hk8j5TcU5G4OItRSttrTmPDv2LwwaDM=;
 b=I8nT0GICPLPZ1Jhb4B9W/QQIYPbvEQrVLYwutlY2c2qEMSCirWGRIwHKuF8WAivTLK
 /LpLwAJ4FKBILv7vHY+BKVUCTgnU9VDqokmEBuXWh61+figaMbqizpO7F0P+kLjpsq9M
 24zUBztp9upMyC/n35LdB09iA/ZB+bpCEv8elrpP6Vb6Vt6P6+r+9QBwR3+5MsXGXIf/
 2WKf+aa4TfFuWtl3C/WNaxcRMjz8R1hlISaW2IbA4EzdUbpSeZZiTsTNzkStWqRZRMcJ
 Qzh0ozt8SJrDCqvmSYYrBo1NUf9TpLcMwXRCrSRBV0a2YSeRl3lALxiXCjQddkx+hDSj
 9P9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=58zdBT4iccY3hk8j5TcU5G4OItRSttrTmPDv2LwwaDM=;
 b=nkPbvpjyWmElcJiylgmpClLYFIb/YPipxwbqcojfMTZtapH8tzQY/PGQssDwTzqr0W
 xZvRmCp6x+VuoWT2oIFrkBOQZ7kpWiOQoHyIWkGQrWEJcHav6fRUdgv2rYF39Q2s6Wzj
 EDQjjRnkYHyqSwxNjLGKa7FagHjZqx9sDIuz661V3YtFb3iLbueZjVcTp1Ut4GUvIFFG
 ZeMMl55pWNy1RSs9sjQmLmaBdigH1lJzI3dCgFwAt59LO67Wwvt3qw+SN8A9FWUS8oPL
 CrNoceIw2s8V7dV18kNS9nHfliVuNK8jVSjYYLg3a9GoETOiNffSq4OW2aNMMI6u4BQG
 1GDQ==
X-Gm-Message-State: AOAM533/nb9RruzeyeZIF6VK8EEEOxAFk45MGI6a02uVAM6yx1F8ttQO
 GuAoCJlRgW3KZEOqmJJaDsCyhkHIV/ibBtx0AEOmeQ==
X-Google-Smtp-Source: ABdhPJyMpRmME/HlkaV4EXqY+IqFB3RLpLD0Aahei9VXIQwOIJQdCVp1+s1OII9DHkhpOgFw6W/vTi4gxUbjIB+r3KI=
X-Received: by 2002:ac8:5dcd:: with SMTP id e13mr2542822qtx.175.1624354187077; 
 Tue, 22 Jun 2021 02:29:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210620114756.31304-1-Kuan-Ying.Lee@mediatek.com>
 <20210620114756.31304-4-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20210620114756.31304-4-Kuan-Ying.Lee@mediatek.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 22 Jun 2021 11:29:11 +0200
Message-ID: <CAG_fn=U0_VzgqBtuyB4JnSMRiHg=C85e-m_4X+=QY-o_u-k9Fw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] kasan: add memory corruption identification
 support for hardware tag-based mode
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-mediatek@lists.infradead.org, wsd_upstream <wsd_upstream@mediatek.com>, 
 chinwen.chang@mediatek.com, nicholas.tang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_022948_507890_EB3B73E5 
X-CRM114-Status: GOOD (  22.11  )
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

T24gU3VuLCBKdW4gMjAsIDIwMjEgYXQgMTo0OCBQTSBLdWFuLVlpbmcgTGVlCjxLdWFuLVlpbmcu
TGVlQG1lZGlhdGVrLmNvbT4gd3JvdGU6Cj4KPiBBZGQgbWVtb3J5IGNvcnJ1cHRpb24gaWRlbnRp
ZmljYXRpb24gc3VwcG9ydCBmb3IgaGFyZHdhcmUgdGFnLWJhc2VkCj4gbW9kZS4gV2Ugc3RvcmUg
b25lIG9sZCBmcmVlIHBvaW50ZXIgdGFnIGFuZCBmcmVlIGJhY2t0cmFjZS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEt1YW4tWWluZyBMZWUgPEt1YW4tWWluZy5MZWVAbWVkaWF0ZWsuY29tPgo+IFN1Z2dl
c3RlZC1ieTogTWFyY28gRWx2ZXIgPGVsdmVyQGdvb2dsZS5jb20+Cj4gQ2M6IEFuZHJleSBSeWFi
aW5pbiA8cnlhYmluaW4uYS5hQGdtYWlsLmNvbT4KPiBDYzogQWxleGFuZGVyIFBvdGFwZW5rbyA8
Z2xpZGVyQGdvb2dsZS5jb20+Cj4gQ2M6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ21h
aWwuY29tPgo+IENjOiBEbWl0cnkgVnl1a292IDxkdnl1a292QGdvb2dsZS5jb20+Cj4gQ2M6IEFu
ZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+ClJldmlld2VkLWJ5OiBBbGV4
YW5kZXIgUG90YXBlbmtvIDxnbGlkZXJAZ29vZ2xlLmNvbT4KPiAtLS0KPiAgbGliL0tjb25maWcu
a2FzYW4gfCAyICstCj4gIG1tL2thc2FuL2thc2FuLmggIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWIv
S2NvbmZpZy5rYXNhbiBiL2xpYi9LY29uZmlnLmthc2FuCj4gaW5kZXggNmY1ZDQ4ODMyMTM5Li4y
Y2MyNTc5MmJjMmYgMTAwNjQ0Cj4gLS0tIGEvbGliL0tjb25maWcua2FzYW4KPiArKysgYi9saWIv
S2NvbmZpZy5rYXNhbgo+IEBAIC0xNTcsNyArMTU3LDcgQEAgY29uZmlnIEtBU0FOX1NUQUNLCj4K
PiAgY29uZmlnIEtBU0FOX1RBR1NfSURFTlRJRlkKPiAgICAgICAgIGJvb2wgIkVuYWJsZSBtZW1v
cnkgY29ycnVwdGlvbiBpZGVudGlmaWNhdGlvbiIKPiAtICAgICAgIGRlcGVuZHMgb24gS0FTQU5f
U1dfVEFHUwo+ICsgICAgICAgZGVwZW5kcyBvbiBLQVNBTl9TV19UQUdTIHx8IEtBU0FOX0hXX1RB
R1MKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgVGhpcyBvcHRpb24gZW5hYmxlcyBiZXN0LWVm
Zm9ydCBpZGVudGlmaWNhdGlvbiBvZiBidWcgdHlwZQo+ICAgICAgICAgICAodXNlLWFmdGVyLWZy
ZWUgb3Igb3V0LW9mLWJvdW5kcykgYXQgdGhlIGNvc3Qgb2YgaW5jcmVhc2VkCj4gZGlmZiAtLWdp
dCBhL21tL2thc2FuL2thc2FuLmggYi9tbS9rYXNhbi9rYXNhbi5oCj4gaW5kZXggYjBmYzlhMWVi
N2UzLi5kNmY5ODJiOGE4NGUgMTAwNjQ0Cj4gLS0tIGEvbW0va2FzYW4va2FzYW4uaAo+ICsrKyBi
L21tL2thc2FuL2thc2FuLmgKPiBAQCAtMTUzLDcgKzE1Myw3IEBAIHN0cnVjdCBrYXNhbl90cmFj
ayB7Cj4gICAgICAgICBkZXBvdF9zdGFja19oYW5kbGVfdCBzdGFjazsKPiAgfTsKPgo+IC0jaWZk
ZWYgQ09ORklHX0tBU0FOX1RBR1NfSURFTlRJRlkKPiArI2lmIGRlZmluZWQoQ09ORklHX0tBU0FO
X1RBR1NfSURFTlRJRlkpICYmIGRlZmluZWQoQ09ORklHX0tBU0FOX1NXX1RBR1MpCj4gICNkZWZp
bmUgS0FTQU5fTlJfRlJFRV9TVEFDS1MgNQo+ICAjZWxzZQo+ICAjZGVmaW5lIEtBU0FOX05SX0ZS
RUVfU1RBQ0tTIDEKPiAtLQo+IDIuMTguMAo+Cj4gLS0KPiBZb3UgcmVjZWl2ZWQgdGhpcyBtZXNz
YWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVkIHRvIHRoZSBHb29nbGUgR3JvdXBzICJrYXNh
bi1kZXYiIGdyb3VwLgo+IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhpcyBncm91cCBhbmQgc3RvcCBy
ZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1haWwgdG8ga2FzYW4tZGV2K3Vuc3Vi
c2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20uCj4gVG8gdmlldyB0aGlzIGRpc2N1c3Npb24gb24gdGhl
IHdlYiB2aXNpdCBodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQva2FzYW4tZGV2LzIw
MjEwNjIwMTE0NzU2LjMxMzA0LTQtS3Vhbi1ZaW5nLkxlZSU0MG1lZGlhdGVrLmNvbS4KCgoKLS0g
CkFsZXhhbmRlciBQb3RhcGVua28KU29mdHdhcmUgRW5naW5lZXIKCkdvb2dsZSBHZXJtYW55IEdt
YkgKRXJpa2EtTWFubi1TdHJhw59lLCAzMwo4MDYzNiBNw7xuY2hlbgoKR2VzY2jDpGZ0c2bDvGhy
ZXI6IFBhdWwgTWFuaWNsZSwgSGFsaW1haCBEZUxhaW5lIFByYWRvClJlZ2lzdGVyZ2VyaWNodCB1
bmQgLW51bW1lcjogSGFtYnVyZywgSFJCIDg2ODkxClNpdHogZGVyIEdlc2VsbHNjaGFmdDogSGFt
YnVyZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
