Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438FBC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 12:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idLUYeqqEbxcTU0tIrqpCQJGV2ZLDnV4FJQaAFa2p8k=; b=4JT/CasD+AYzjY
	lWJWMgwGHBfzuMNGCBlnbSsZPvRNVAsiKbVBnV8N8htxUtaQX41+1TGoQRiyo8vIcfELdpsfBmIbS
	lB63WS7b7h0LvO1T7viCYOWfCCdtehfGfpB2oKBDKaKlVzINHMybKFH9ww8wnU9exKXRhnYynlnHB
	hyZFko1jKgdIBQ4ceUY6nl7G65vd0o803oSaKSrDwOangZNtQZGK9wUaeEaYbdywaMO/19cyP/MET
	ACWPx9n9+bDBsjnYuofogsMCi1eGmtYW854Zc1IvXVZMQbCbjoUf8nDS2siqAOKRZ9bHUPt5FLGgg
	nC6/fbZ2eKFsNULXUs9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPkiR-006N6e-2R; Thu, 03 Mar 2022 12:37:55 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPkiM-006N3j-2S; Thu, 03 Mar 2022 12:37:52 +0000
Received: by mail-pl1-x636.google.com with SMTP id q11so4397126pln.11;
 Thu, 03 Mar 2022 04:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FF/MJjppdIPbLAPuX69GDDcuetlfqDD+38vpsQJKjV4=;
 b=bORDDPjE3HJ8Q+lkuHUI9YXm2z2OfuiHyYo73LjCVUqKH+mzapaLyTx7j6vUSzodyH
 H1fbBW3W0VvnP5bKsE/Cw0qa3UKie6z+yV023jD/NJPLY9kKDIxXXIT7NvpcVUCfUtIs
 KFg6MVSLFINqOtsOfPJChC2DDL1HsjgJIQ8T87wI93Fz/8cIhc43z3LdnIXEJu5YqpzN
 mnmxIpvlp/TKF5EWx4k9hHupAU2T1e2iVIXLRuFiSvdgN4U8XMzx7dalBaWhuU90/nq+
 yD0rNidPjh7VKui8oE8v/Ywp+ZPTs/OvJCCqJBXBdG8sdbvMpiVPMu/2SHGpauCCE/Ok
 XUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FF/MJjppdIPbLAPuX69GDDcuetlfqDD+38vpsQJKjV4=;
 b=RxlO879Ms79t9XMUqShBYtXVGw//T7FtDknO+gyVTkegZj5wlg+gHkhu93HBdF4ZlX
 Eu9oWTedvl6Phf3U8X9+Oe6LycXkLYnZbcOink+pmuYBSl/plMe/3HwD9nJgrRv+j+fw
 Qk3MKs6iJ3quAP9VNHnKETKutN6bPnjZll1LiXg1IGRZV+HItNdo7T9zTQNoPqgfgojb
 pmWpBHmpF3kkOiD0q+FC4qvIy7gyJMZfy0MtADAHbtG1bo7LWh4w7zKjBXFG4JVek11h
 vdrr4iwcuBum4SLqX1zsppSK5MWaszF3fJYDsTiLtZDkJ5IYeD7a9O8gMlvU5nZizdmE
 4P7g==
X-Gm-Message-State: AOAM5329GN70xs2VdTzhVwcaLFpvM6X1nBsTgW0hL+VeO6ayhSVxa1Oj
 wwpELp54i6wxwwiGNYmulgE=
X-Google-Smtp-Source: ABdhPJwaQutGx29a4puPWhBgOBT74prgxxfsvHgGuVwO/yqGuQ+dVL8XCd59bWLeDERLYwR3js66yQ==
X-Received: by 2002:a17:903:22d0:b0:151:97f5:db54 with SMTP id
 y16-20020a17090322d000b0015197f5db54mr7837971plg.58.1646311068298; 
 Thu, 03 Mar 2022 04:37:48 -0800 (PST)
Received: from ubuntu.huawei.com ([119.3.119.19])
 by smtp.googlemail.com with ESMTPSA id
 t7-20020a17090a024700b001bf12386db4sm1483030pje.47.2022.03.03.04.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 04:37:47 -0800 (PST)
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
Date: Thu,  3 Mar 2022 20:37:18 +0800
Message-Id: <20220303123718.12426-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <2d208771c50b4c6db4f43039e9d62851@AcuMS.aculab.com>
References: <2d208771c50b4c6db4f43039e9d62851@AcuMS.aculab.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_043750_147532_2EC4B1C6 
X-CRM114-Status: GOOD (  48.03  )
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

PiBGcm9tOiBYaWFvbWVuZyBUb25nCj4gPiBTZW50OiAwMyBNYXJjaCAyMDIyIDA3OjI3Cj4gPiAK
PiA+IE9uIFRodSwgMyBNYXIgMjAyMiAwNDo1ODoyMyArMDAwMCwgRGF2aWQgTGFpZ2h0IHdyb3Rl
Ogo+ID4gPiBvbiAzIE1hciAyMDIyIDEwOjI3OjI5ICswODAwLCBYaWFvbWVuZyBUb25nIHdyb3Rl
Ogo+ID4gPiA+IFRoZSBwcm9ibGVtIGlzIHRoZSBtaXMtdXNlIG9mIGl0ZXJhdG9yIG91dHNpZGUg
dGhlIGxvb3Agb24gZXhpdCwgYW5kCj4gPiA+ID4gdGhlIGl0ZXJhdG9yIHdpbGwgYmUgdGhlIEhF
QUQncyBjb250YWluZXJfb2YgcG9pbnRlciB3aGljaCBwb2ludGVycwo+ID4gPiA+IHRvIGEgdHlw
ZS1jb25mdXNlZCBzdHJ1Y3QuIFNpZGVub3RlOiBUaGUgKm1pcy11c2UqIGhlcmUgcmVmZXJzIHRv
Cj4gPiA+ID4gbWlzdGFrZWx5IGFjY2VzcyB0byBvdGhlciBtZW1iZXJzIG9mIHRoZSBzdHJ1Y3Qs
IGluc3RlYWQgb2YgdGhlCj4gPiA+ID4gbGlzdF9oZWFkIG1lbWJlciB3aGljaCBhY3V0YWxseSBp
cyB0aGUgdmFsaWQgSEVBRC4KPiA+ID4KPiA+ID4gVGhlIHByb2JsZW0gaXMgdGhhdCB0aGUgSEVB
RCdzIGNvbnRhaW5lcl9vZiBwb2ludGVyIHNob3VsZCBuZXZlcgo+ID4gPiBiZSBjYWxjdWxhdGVk
IGF0IGFsbC4KPiA+ID4gVGhpcyBpcyB3aGF0IGlzIGZ1bmRhbWVudGFsbHkgYnJva2VuIGFib3V0
IHRoZSBjdXJyZW50IGRlZmluaXRpb24uCj4gPiAKPiA+IFllcywgdGhlIHJ1bGUgaXMgInRoZSBI
RUFEJ3MgY29udGFpbmVyX29mIHBvaW50ZXIgc2hvdWxkIG5ldmVyIGJlCj4gPiBjYWxjdWxhdGVk
IGF0IGFsbCBvdXRzaWRlIHRoZSBsb29wIiwgYnV0IGhvdyBkbyB5b3UgbWFrZSBzdXJlIGV2ZXJ5
b25lCj4gPiBmb2xsb3dzIHRoaXMgcnVsZT8KPiA+IEV2ZXJ5b25lIG1ha2VzIG1pc3Rha2VzLCBi
dXQgd2UgY2FuIGVsaW1pbmF0ZSB0aGVtIGFsbCBmcm9tIHRoZSBiZWdpbm5pbmcKPiA+IHdpdGgg
dGhlIGhlbHAgb2YgY29tcGlsZXIgd2hpY2ggY2FuIGNhdGNoIHN1Y2ggdXNlLWFmdGVyLWxvb3Ag
dGhpbmdzLgo+ID4gCj4gPiA+ID4gSU9XLCB5b3Ugd291bGQgZGVyZWZlcmVuY2UgYSAoTlVMTCAr
IG9mZnNldF9vZl9tZW1iZXIpIGFkZHJlc3MgaGVyZS4KPiA+ID4KPiA+ID5XaGVyZT8KPiA+IAo+
ID4gSW4gdGhlIGNhc2Ugd2hlcmUgYSBkZXZlbG9wZXIgZG8gbm90IGZvbGxvd3MgdGhlIGFib3Zl
IHJ1bGUsIGFuZCBtaXN0YWtlbHkKPiA+IGFjY2VzcyBhIG5vbi1saXN0LWhlYWQgbWVtYmVyIG9m
IHRoZSBIRUFEJ3MgY29udGFpbmVyX29mIHBvaW50ZXIgb3V0c2lkZQo+ID4gdGhlIGxvb3AuIEZv
ciBleGFtcGxlOgo+ID4gICAgIHN0cnVjdCByZXF7Cj4gPiAgICAgICBpbnQgYTsKPiA+ICAgICAg
IHN0cnVjdCBsaXN0X2hlYWQgaDsKPiA+ICAgICB9Cj4gPiAgICAgc3RydWN0IHJlcSAqcjsKPiA+
ICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KHIsIEhFQUQsIGgpIHsKPiA+ICAgICAgIGlmIChyLT5h
ID09IDB4MTApCj4gPiAgICAgICAgIGJyZWFrOwo+ID4gICAgIH0KPiA+ICAgICAvLyB0aGUgZGV2
ZWxvcGVyIG1hZGUgYSBtaXN0YWtlOiBoZSBkaWRuJ3QgdGFrZSB0aGlzIHNpdHVhdGlvbiBpbnRv
Cj4gPiAgICAgLy8gYWNjb3VudCB3aGVyZSBhbGwgZW50cmllcyBpbiB0aGUgbGlzdCBhcmUgKnIt
PmEgIT0gMHgxMCosIGFuZCBub3cKPiA+ICAgICAvLyB0aGUgciBpcyB0aGUgSEVBRCdzIGNvbnRh
aW5lcl9vZiBwb2ludGVyLgo+ID4gICAgIHItPmEgPSAweDIwOwo+ID4gVGh1cyB0aGUgInItPmEg
PSAweDIwIiB3b3VsZCBkZXJlZmVyZW5jZSBhIChOVUxMICsgb2Zmc2V0X29mX21lbWJlcikKPiA+
IGFkZHJlc3MgaGVyZS4KPiAKPiBUaGF0IGlzIGp1c3QgYSBidWcuCj4gTm8gZGlmZmVyZW50IHRv
IGZhaWxpbmcgdG8gY2hlY2sgYW55dGhpbmcgZWxzZSBtaWdodCAncmV0dXJuJwo+IGEgTlVMTCBw
b2ludGVyLgoKWWVzLCBidXQgaXTigJhzIGEgbWlzdGFrZSBldmVyeW9uZSBoYXMgbWFkZSBhbmQg
d2lsbCBtYWtlLCB3ZSBzaG91bGQgYXZvaWQKdGhpcyBhdCB0aGUgYmVnaW5uaW5nIHdpdGggdGhl
IGhlbHAgb2YgY29tcGlsZXIuCgo+IEJlY2F1c2UgaXQgaXMgYSBOVUxMIGRlcmVmZXJlbmNlIHlv
dSBmaW5kIG91dCBwcmV0dHkgcXVpY2tseS4KCkFGQUlL77yMTlVMTCBkZXJlZmVyZW5jZSBpcyBh
IHVuZGVmaW5lZCBiYWhhdmlvciwgY2FuIGNvbXBpbGVyIHF1aWNrbHkKY2F0Y2ggaXQ/IE9yIGl0
IGNhbiBvbmx5IGJlIGFwcGxpZWQgdG8gc29tZSBzaW1wbGUvcmVzdHJpY3RlZCBjYXNlcy4KCj4g
VGhlIGV4aXN0aW5nIGxvb3AgbGVhdmVzIHlvdSB3aXRoIGEgdmFsaWQgcG9pbnRlciB0byBzb21l
dGhpbmcKPiB0aGF0IGlzbid0IGEgbGlzdCBpdGVtLgo+IAo+ID4gPiA+IFBsZWFzZSByZW1pbmQg
bWUgaWYgaSBtaXNzZWQgc29tZXRoaW5nLCB0aGFua3MuCj4gPiA+ID4KPiA+ID4gPiBDYW4geW91
IHNoYXJlIHlvdXIgImFsdGVybmF0aXZlIGRlZmluaXRpb25zIiBkZXRhaWxzPyB0aGFua3MhCj4g
PiA+Cj4gPiA+IFRoZSBsb29wIHNob3VsZCBwcm9iYWJseSB1c2UgYXMgZXh0cmEgdmFyaWFibGUg
dGhhdCBwb2ludHMKPiA+ID4gdG8gdGhlICdsaXN0IG5vZGUnIGluIHRoZSBuZXh0IHN0cnVjdHVy
ZS4KPiA+ID4gU29tZXRoaW5nIGxpa2U6Cj4gPiA+IAlmb3IgKHh4eCAqaXRlciA9IGhlYWQtPm5l
eHQ7Cj4gPiA+IAkJaXRlciA9PSAmaGVhZCA/ICgoaXRlbSA9IE5VTEwpLDApIDogKChpdGVtID0g
bGlzdF9pdGVtKGl0ZXIpLDEpKTsKPiA+ID4gCQlpdGVyID0gaXRlbS0+bWVtYmVyLT5uZXh0KSB7
Cj4gPiA+IAkgICAuLi4KPiA+ID4gV2l0aCBhIGJpdCBvZiBjYXN0aW5nIHlvdSBjYW4gdXNlICdp
dGVtJyB0byBob2xkICdpdGVyJy4KPiA+IAo+ID4geW91IHN0aWxsIGNhbiBub3QgbWFrZSBzdXJl
IGV2ZXJ5b25lIGZvbGxvd3MgdGhpcyBydWxlOgo+ID4gImRvIG5vdCB1c2UgaXRlcmF0b3Igb3V0
c2lkZSB0aGUgbG9vcCIgd2l0aG91dCB0aGUgaGVscCBvZiBjb21waWxlciwKPiA+IGJlY2F1c2Ug
aXRlbSBpcyBkZWNsYXJlZCBvdXRzaWRlIHRoZSBsb29wLgo+IAo+IFRoYXQgb25lIGhhcyAnaXRl
cicgZGVmaW5lZCBpbiB0aGUgbG9vcC4KCk9oLCBzb3JyeSwgSSBtaXN1bmRlcnN0b29kLiBUaGVu
IHRoaXMgaXMgdGhlIHNhbWUgd2F5IHdpdGggbXkgd2F5IG9mCmxpc3RfZm9yX2VhY2hfZW50cnlf
aW5zaWRlKHBvcywgdHlwZSwgaGVhZCwgbWVtYmVyKSwgd2hpY2ggZGVjbGFyZQp0aGUgaXRlcmF0
b3IgaW5zaWRlIHRoZSBsb29wLgpZb3UgZ28gZnVydGhlciBhbmQgbWFrZSB0aGluZ3MgbGlrZSAi
JnBvcy0+bWVtYmVyID09IChoZWFkKSIgZ29lcyBhd2F5CnRvIGF2b2lkIGNhbGN1bGF0ZSB0aGUg
SEVBRCdzIGNvbnRhaW5lcl9vZiBwb2ludGVyLCBhbHRob3VnaCB0aGUKY2FsY3VsYXRpb24gaXMg
aGFybWxlc3MuCgo+IAo+ID4gQlRXLCB0byBhdm9pZCBhbWJpZ3VpdHnvvIx0aGUgImFsdGVybmF0
aXZlIGRlZmluaXRpb25zIiBoZXJlIGkgYXNrZWQgaXMKPiA+IHNvbWV0aGluZyBmcm9tIHlvdSBp
biB0aGlzIGNvbnRleHQ6Cj4gPiAiT1RPSCB0aGVyZSBtYXkgYmUgYWx0ZXJuYXRpdmUgZGVmaW5p
dGlvbnMgdGhhdCBjYW4gYmUgdXNlZCB0byBnZXQKPiA+IHRoZSBjb21waWxlciAob3Igb3RoZXIg
Y29tcGlsZXItbGlrZSB0b29scykgdG8gZGV0ZWN0IGJyb2tlbiBjb2RlLgo+ID4gRXZlbiBpZiB0
aGUgZGVmaW5pdGlvbiBjYW4ndCBwb3NzaWJseSBnZW5lcmF0ZSBhIHdvcmtpbmcga2Vycm5lbC4i
Cj4gCj4gSSB3YXMgdGhpbmtpbmcgb2Ygc29tZXRoaW5nIGxpa2U6Cj4gCWlmICgocG9zID0gbGlz
dF9maXJzdCkpLCAxKSBwb3MgPSBOVUxMIGVsc2UKPiBzbyB0aGF0IHVuY2hlY2tlZCBkZXJlZmVy
ZW5jZXMgYWZ0ZXIgdGhlIGxvb3Agd2lsbCBiZSBkZXRlY3RhYmxlCj4gYXMgTlVMTCBwb2ludGVy
IG9mZnNldHMgLSBidXQgdGhhdCBpbiBpdHNlbGYgaXNuJ3QgZW5vdWdoIHRvIGF2b2lkCj4gb3Ro
ZXIgd2FybmluZ3MuCj4gCgpEbyB5b3UgbWVhbiBwdXQgdGhpcyByaWdodCBhZnRlciB0aGUgbG9v
cCAoSSBjaGFuZ2VkIHNvbXRoaW5nIHRoYXQgaQpkbyBub3QgdW5kZXJzdGFuZCwgcGxlYXNlIGNv
cnJlY3QgbWUgaWYgaSBhbSB3b3JuZywgdGhhbmtzKToKICAgICAgIGlmIChwb3MgPT0gbGlzdF9m
aXJzdCkgcG9zID0gTlVMTDsgZWxzZQphbmQgY29tcGlsZXIgY2FuIGRldGVjdCB0aGUgZm9sbG93
aW5nIE5VTEwgZGVyZWZlcm5jZT8KQnV0IGlmIHRoZSBOVUxMIGRlcmVmZXJuY2UgaXMganVzdCBy
aWdodCBhZnRlciB0aGUgbG9vcCBvcmlnaW5hbGx5LAppdCB3aWxsIGJlIG1hc2tlZCBieSB0aGUg
KmVsc2UqIGtleXdvcmTjgIIKCj4gPiA+ID4gVGhlICJsaXN0X2Zvcl9lYWNoX2VudHJ5X2luc2lk
ZShwb3MsIHR5cGUsIGhlYWQsIG1lbWJlcikiIHdheSBtYWtlcwo+ID4gPiA+IHRoZSBpdGVyYXRv
ciBpbnZpc2lhYmxlIG91dHNpZGUgdGhlIGxvb3AsIGFuZCB3b3VsZCBiZSBjYXRjaGVkIGJ5Cj4g
PiA+ID4gY29tcGlsZXIgaWYgdXNlLWFmdGVyLWxvb3AgdGhpbmdzIGhhcHBlbmVkLgo+ID4gCj4g
PiA+IEl0IGlzIGFsc28gYSBjb21wZXRlIFBJVEEgZm9yIGFueXRoaW5nIGRvaW5nIGEgc2VhcmNo
Lgo+ID4gCj4gPiBZb3UgbWVhbiBpdCB3b3VsZCBiZSBhIGJ1cmRlbiBvbiBzZWFyY2g/IGNhbiB5
b3Ugc2hvdyBtZSBzb21lIGV4YW1wbGVzPwo+IAo+IFRoZSB3aG9sZSBidXNpbmVzcyBvZiBoYXZp
bmcgdG8gc2F2ZSB0aGUgcG9pbnRlciB0byB0aGUgbG9jYXRlZCBpdGVtCj4gYmVmb3JlIGJyZWFr
aW5nIHRoZSBsb29wLCByZW1lbWJlcmluZyB0byBoYXZlIHNldCBpdCB0byBOVUxMIGVhcmxpZXIg
ZXRjLgoKT2ssIGkgc2VlLiBBbmQgdGhlbiB5b3UgbmVlZCBwYXNzIGEgIml0ZW0iIHRvIHRoZSBs
aXN0X2Zvcl9lYWNoX2VudHJ5IG1hY3JvCmFzIGEgbmV3IGFyZ3VtZW50LgoKPiAKPiBJdCBpcyBz
byBtdWNoIGJldHRlciBpZiB5b3UgY2FuIGp1c3QgZG86Cj4gCQlpZiAoZm91bmQpCj4gCQkJYnJl
YWs7Cj4gCj4gCURhdmlkCgp0aGlzIGNvbmZ1c2VkIG1lLiB0aGlzIHdheSBpcyBiZXR0ZXIgb3Ig
dGhlICJzYXZlIHRoZSBwb2ludGVyIHRvIHRoZSBsb2NhdGVkIGl0ZW0KYmVmb3JlIGJyZWFraW5n
IHRoZSBsb29wIiBvbmU/CgotLQpYaWFvbWVuZyBUb25nCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
