Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1AFC43219
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 07:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oaKULgTDXQAz6IdxiUoqP14Ad1R/9FEtA/2j4+lhf1E=; b=w8tBHzq4e5bR0x
	kJohCbfh3CNRBcQ2qfACRmOusEHHazXaXnqKIQPbexPI6g1Itv2rr+Clz9iBSiqpupz24DjloxQSJ
	A4wTdyoBAKduKTwN+B/QqaDbCWVRus1+2ToCVuXcntI3ZIpe/mEW8YB0UTO8+68wvRkmQ89FkgX9H
	TbTjsfXqBbvb7Ar0fyAOoQ/FVtekXs8DbRdlXbdQcsawkQCunUUsn75TDyZXX6M2ulv3F624UZdR/
	9ku5wZ+/a0ldDb14XBfyf082OhnBI6UiZNeDaxkT8EevSrx88iGCpfHW7/EB4lKp2ysq6+2CincTf
	6Q2G412kftShISlJf6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPfry-005ZB5-CY; Thu, 03 Mar 2022 07:27:26 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPfrv-005Z9u-7j; Thu, 03 Mar 2022 07:27:24 +0000
Received: by mail-pl1-x629.google.com with SMTP id e2so3747774pls.10;
 Wed, 02 Mar 2022 23:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sgLnwuYIGskFjie2H2jjPO7yZK5PfHYTTkrYtctc5ws=;
 b=FXSRJXcZ2cyaSSh+RFzgN891/0EsPjQQYnYlHyt7Q6au+u55Yhw9CQjtuc/Xh+IxeA
 jmfOE8xDuyw6aNjCCweSWK23ooxkZ+FDp1vmELSXGe87/BlE9lQAJ5VCHRxCoJXheQ6e
 z0ZjBk6ntNVuChDJjKVkipnrg4PFzEOabNhKEpFBHr+LTEWxBydNvmRMp4x1CJuZdUwr
 yIPtetuwCR4pZCzLE6nNdjkyjeKTi+kDUarqoW7jVGs3qBeY6IJUgMC1jfObzr57dlqg
 9D3LdaczFYPoymDULVGPmDhvRiVgHdjXQ/LS1xahv5fAEYKipZZ05ntIAVBo2UMKI5ki
 Sw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sgLnwuYIGskFjie2H2jjPO7yZK5PfHYTTkrYtctc5ws=;
 b=uDUhOp2dO6PSHQt7PXXTYU/OzBtNn2vRr6nMBjy78WxsjElASEibk6UsibJckgE/H3
 nhOhaC4Z+v22/sPW4+UyFjyMGToOlM/YlCDF1mIorWUiVKl6BBo/k0vaao+/izWJ7l31
 IVOco2Uw094RNiGsq3O6nfhnpYwvThdm6tOEueK94B8nVD4yWPZf/le75EGKFWQz/mB1
 WIEWREv2IDvvM/C04Cbl9LWMsKAk9V7u+Wnm9l2F06NwGONE8cmS0fKcIRXl5XBONaM7
 2uKmAemfk21qA22QjjT3gJNhc8N00pDSkR4jkVpMyQVxkvUPQXCzJ97ILJIzYTaEsWqF
 +kbA==
X-Gm-Message-State: AOAM533d8eX+sixueLOigthzzRdH9pyEfCes170DkRRS3WTet+aOmxbo
 mSvxpp6qVKWBNE1LToMWb4g=
X-Google-Smtp-Source: ABdhPJxXZq8uo59Ohm7FMpyCTbKfTT1earKguyYxXh9VkI02LjxK1/LHoatHqlibGa3Ordge+YwobQ==
X-Received: by 2002:a17:902:9687:b0:151:7b31:9a57 with SMTP id
 n7-20020a170902968700b001517b319a57mr13723244plp.146.1646292442145; 
 Wed, 02 Mar 2022 23:27:22 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
 by smtp.googlemail.com with ESMTPSA id
 nu18-20020a17090b1b1200b001bbef4d9049sm1302089pjb.23.2022.03.02.23.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 23:27:21 -0800 (PST)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: david.laight@aculab.com
Cc: akpm@linux-foundation.org, alsa-devel@alsa-project.org,
 amd-gfx@lists.freedesktop.org, andriy.shevchenko@linux.intel.com,
 arnd@arndb.de, bcm-kernel-feedback-list@broadcom.com,
 bjohannesmeyer@gmail.com, c.giuffrida@vu.nl, christian.koenig@amd.com,
 christophe.jaillet@wanadoo.fr, dan.carpenter@oracle.com,
 dmaengine@vger.kernel.org, drbd-dev@lists.linbit.com,
 dri-devel@lists.freedesktop.org, gustavo@embeddedor.com, h.j.bos@vu.nl,
 intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org,
 jakobkoschel@gmail.com, jgg@ziepe.ca, keescook@chromium.org,
 kgdb-bugreport@lists.sourceforge.net, kvm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-block@vger.kernel.org,
 linux-cifs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sgx@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux@rasmusvillemoes.dk,
 linuxppc-dev@lists.ozlabs.org, nathan@kernel.org, netdev@vger.kernel.org,
 nouveau@lists.freedesktop.org, rppt@kernel.org,
 samba-technical@lists.samba.org, tglx@linutronix.de,
 tipc-discussion@lists.sourceforge.net, torvalds@linux-foundation.org,
 v9fs-developer@lists.sourceforge.net, xiam0nd.tong@gmail.com
Subject: RE: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
Date: Thu,  3 Mar 2022 15:26:57 +0800
Message-Id: <20220303072657.11124-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
References: <39404befad5b44b385698ff65465abe5@AcuMS.aculab.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_232723_306286_993FF72E 
X-CRM114-Status: GOOD (  29.91  )
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

T24gVGh1LCAzIE1hciAyMDIyIDA0OjU4OjIzICswMDAwLCBEYXZpZCBMYWlnaHQgd3JvdGU6Cj4g
b24gMyBNYXIgMjAyMiAxMDoyNzoyOSArMDgwMCwgWGlhb21lbmcgVG9uZyB3cm90ZToKPiA+IFRo
ZSBwcm9ibGVtIGlzIHRoZSBtaXMtdXNlIG9mIGl0ZXJhdG9yIG91dHNpZGUgdGhlIGxvb3Agb24g
ZXhpdCwgYW5kCj4gPiB0aGUgaXRlcmF0b3Igd2lsbCBiZSB0aGUgSEVBRCdzIGNvbnRhaW5lcl9v
ZiBwb2ludGVyIHdoaWNoIHBvaW50ZXJzCj4gPiB0byBhIHR5cGUtY29uZnVzZWQgc3RydWN0LiBT
aWRlbm90ZTogVGhlICptaXMtdXNlKiBoZXJlIHJlZmVycyB0bwo+ID4gbWlzdGFrZWx5IGFjY2Vz
cyB0byBvdGhlciBtZW1iZXJzIG9mIHRoZSBzdHJ1Y3QsIGluc3RlYWQgb2YgdGhlCj4gPiBsaXN0
X2hlYWQgbWVtYmVyIHdoaWNoIGFjdXRhbGx5IGlzIHRoZSB2YWxpZCBIRUFELgo+Cj4gVGhlIHBy
b2JsZW0gaXMgdGhhdCB0aGUgSEVBRCdzIGNvbnRhaW5lcl9vZiBwb2ludGVyIHNob3VsZCBuZXZl
cgo+IGJlIGNhbGN1bGF0ZWQgYXQgYWxsLgo+IFRoaXMgaXMgd2hhdCBpcyBmdW5kYW1lbnRhbGx5
IGJyb2tlbiBhYm91dCB0aGUgY3VycmVudCBkZWZpbml0aW9uLgoKWWVzLCB0aGUgcnVsZSBpcyAi
dGhlIEhFQUQncyBjb250YWluZXJfb2YgcG9pbnRlciBzaG91bGQgbmV2ZXIgYmUKY2FsY3VsYXRl
ZCBhdCBhbGwgb3V0c2lkZSB0aGUgbG9vcCIsIGJ1dCBob3cgZG8geW91IG1ha2Ugc3VyZSBldmVy
eW9uZQpmb2xsb3dzIHRoaXMgcnVsZT8KRXZlcnlvbmUgbWFrZXMgbWlzdGFrZXMsIGJ1dCB3ZSBj
YW4gZWxpbWluYXRlIHRoZW0gYWxsIGZyb20gdGhlIGJlZ2lubmluZwp3aXRoIHRoZSBoZWxwIG9m
IGNvbXBpbGVyIHdoaWNoIGNhbiBjYXRjaCBzdWNoIHVzZS1hZnRlci1sb29wIHRoaW5ncy4KCj4g
PiBJT1csIHlvdSB3b3VsZCBkZXJlZmVyZW5jZSBhIChOVUxMICsgb2Zmc2V0X29mX21lbWJlcikg
YWRkcmVzcyBoZXJlLgo+Cj5XaGVyZT8KCkluIHRoZSBjYXNlIHdoZXJlIGEgZGV2ZWxvcGVyIGRv
IG5vdCBmb2xsb3dzIHRoZSBhYm92ZSBydWxlLCBhbmQgbWlzdGFrZWx5CmFjY2VzcyBhIG5vbi1s
aXN0LWhlYWQgbWVtYmVyIG9mIHRoZSBIRUFEJ3MgY29udGFpbmVyX29mIHBvaW50ZXIgb3V0c2lk
ZQp0aGUgbG9vcC4gRm9yIGV4YW1wbGU6CiAgICBzdHJ1Y3QgcmVxewogICAgICBpbnQgYTsKICAg
ICAgc3RydWN0IGxpc3RfaGVhZCBoOwogICAgfQogICAgc3RydWN0IHJlcSAqcjsKICAgIGxpc3Rf
Zm9yX2VhY2hfZW50cnkociwgSEVBRCwgaCkgewogICAgICBpZiAoci0+YSA9PSAweDEwKQogICAg
ICAgIGJyZWFrOwogICAgfQogICAgLy8gdGhlIGRldmVsb3BlciBtYWRlIGEgbWlzdGFrZTogaGUg
ZGlkbid0IHRha2UgdGhpcyBzaXR1YXRpb24gaW50bwogICAgLy8gYWNjb3VudCB3aGVyZSBhbGwg
ZW50cmllcyBpbiB0aGUgbGlzdCBhcmUgKnItPmEgIT0gMHgxMCosIGFuZCBub3cKICAgIC8vIHRo
ZSByIGlzIHRoZSBIRUFEJ3MgY29udGFpbmVyX29mIHBvaW50ZXIuIAogICAgci0+YSA9IDB4MjA7
ClRodXMgdGhlICJyLT5hID0gMHgyMCIgd291bGQgZGVyZWZlcmVuY2UgYSAoTlVMTCArIG9mZnNl
dF9vZl9tZW1iZXIpCmFkZHJlc3MgaGVyZS4KCj4gPiBQbGVhc2UgcmVtaW5kIG1lIGlmIGkgbWlz
c2VkIHNvbWV0aGluZywgdGhhbmtzLgo+ID4KPiA+IENhbiB5b3Ugc2hhcmUgeW91ciAiYWx0ZXJu
YXRpdmUgZGVmaW5pdGlvbnMiIGRldGFpbHM/IHRoYW5rcyEKPgo+IFRoZSBsb29wIHNob3VsZCBw
cm9iYWJseSB1c2UgYXMgZXh0cmEgdmFyaWFibGUgdGhhdCBwb2ludHMKPiB0byB0aGUgJ2xpc3Qg
bm9kZScgaW4gdGhlIG5leHQgc3RydWN0dXJlLgo+IFNvbWV0aGluZyBsaWtlOgo+IAlmb3IgKHh4
eCAqaXRlciA9IGhlYWQtPm5leHQ7Cj4gCQlpdGVyID09ICZoZWFkID8gKChpdGVtID0gTlVMTCks
MCkgOiAoKGl0ZW0gPSBsaXN0X2l0ZW0oaXRlciksMSkpOwo+IAkJaXRlciA9IGl0ZW0tPm1lbWJl
ci0+bmV4dCkgewo+IAkgICAuLi4KPiBXaXRoIGEgYml0IG9mIGNhc3RpbmcgeW91IGNhbiB1c2Ug
J2l0ZW0nIHRvIGhvbGQgJ2l0ZXInLgoKeW91IHN0aWxsIGNhbiBub3QgbWFrZSBzdXJlIGV2ZXJ5
b25lIGZvbGxvd3MgdGhpcyBydWxlOiAKImRvIG5vdCB1c2UgaXRlcmF0b3Igb3V0c2lkZSB0aGUg
bG9vcCIgd2l0aG91dCB0aGUgaGVscCBvZiBjb21waWxlciwKYmVjYXVzZSBpdGVtIGlzIGRlY2xh
cmVkIG91dHNpZGUgdGhlIGxvb3AuCgpCVFcsIHRvIGF2b2lkIGFtYmlndWl0ee+8jHRoZSAiYWx0
ZXJuYXRpdmUgZGVmaW5pdGlvbnMiIGhlcmUgaSBhc2tlZCBpcwpzb21ldGhpbmcgZnJvbSB5b3Ug
aW4gdGhpcyBjb250ZXh0OgoiT1RPSCB0aGVyZSBtYXkgYmUgYWx0ZXJuYXRpdmUgZGVmaW5pdGlv
bnMgdGhhdCBjYW4gYmUgdXNlZCB0byBnZXQKdGhlIGNvbXBpbGVyIChvciBvdGhlciBjb21waWxl
ci1saWtlIHRvb2xzKSB0byBkZXRlY3QgYnJva2VuIGNvZGUuCkV2ZW4gaWYgdGhlIGRlZmluaXRp
b24gY2FuJ3QgcG9zc2libHkgZ2VuZXJhdGUgYSB3b3JraW5nIGtlcnJuZWwuIgoKPiA+IAo+ID4g
PiBPVE9IIHRoZXJlIG1heSBiZSBhbHRlcm5hdGl2ZSBkZWZpbml0aW9ucyB0aGF0IGNhbiBiZSB1
c2VkIHRvIGdldAo+ID4gPiB0aGUgY29tcGlsZXIgKG9yIG90aGVyIGNvbXBpbGVyLWxpa2UgdG9v
bHMpIHRvIGRldGVjdCBicm9rZW4gY29kZS4KPiA+ID4gRXZlbiBpZiB0aGUgZGVmaW5pdGlvbiBj
YW4ndCBwb3NzaWJseSBnZW5lcmF0ZSBhIHdvcmtpbmcga2Vycm5lbC4KPiA+IAo+ID4gVGhlICJs
aXN0X2Zvcl9lYWNoX2VudHJ5X2luc2lkZShwb3MsIHR5cGUsIGhlYWQsIG1lbWJlcikiIHdheSBt
YWtlcwo+ID4gdGhlIGl0ZXJhdG9yIGludmlzaWFibGUgb3V0c2lkZSB0aGUgbG9vcCwgYW5kIHdv
dWxkIGJlIGNhdGNoZWQgYnkKPiA+IGNvbXBpbGVyIGlmIHVzZS1hZnRlci1sb29wIHRoaW5ncyBo
YXBwZW5lZC4KCj4gSXQgaXMgYWxzbyBhIGNvbXBldGUgUElUQSBmb3IgYW55dGhpbmcgZG9pbmcg
YSBzZWFyY2guCgpZb3UgbWVhbiBpdCB3b3VsZCBiZSBhIGJ1cmRlbiBvbiBzZWFyY2g/IGNhbiB5
b3Ugc2hvdyBtZSBzb21lIGV4YW1wbGVzPwoKT3IgeW91IG1lYW4gaXQgaXMgdG9vIGxvbmcgdGhl
IGxpc3RfZm9yX2VhY2hfZW50cnlfaW5zaWRlKiBzdHJpbmcgdG8gbGl2ZQppbiBvbmUgc2luZ2xl
IGxpbmUsIGFuZCBzaG91bGQgc3BpbHQgaW50byB0d28gbGluZT8gSWYgaXQgaXMgdGhlIGNhc2Us
IHRoZXJlCmFyZSAyIHdheSB0byBtaXRpZ2F0ZSBpdC4KMS4gcGFzcyBhIHNob3J0ZXIgdCBhcyBz
dHJ1Y3QgdHlwZSB0byB0aGUgbWFjcm8KMi4gYWZ0ZXIgYWxsIGxpc3RfZm9yX2VhY2hfZW50cnkg
bWFjcm9zIGJlIHJlcGxhY2VkIHdpdGgKbGlzdF9mb3JfZWFjaF9lbnRyeV9pbnNpZGUsIHJlbW92
ZSB0aGUgbGlzdF9mb3JfZWFjaF9lbnRyeSBpbXBsZW1lbnRhdGlvbnMKYW5kIHJlbmFtZSBhbGwg
bGlzdF9mb3JfZWFjaF9lbnRyeV9pbnNpZGUgdXNlIGJhY2sgdG8gdGhlIG9yaWdpbgpsaXN0X2Zv
cl9lYWNoX2VudHJ5IGluIGEgc2luZ2xlIHBhdGNoLgoKRm9yIG1lLCBpdCBpcyBhY2NlcHRhYmxl
IGFuZCBub3QgYSBzdWNoIGJpZyBwcm9ibGVtLgoKLS0KWGlhb21lbmcgVG9uZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
