Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEF4C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 16:37:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6795E64E41
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 16:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6795E64E41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jZ5iThhJQxKce3wnDdJGkzehdENxtN/F1aqKAvKt/68=; b=C5q1UE4SLQiSeI8F+JqVqtXbN
	3frvtAwR7LdF/hpjprTkp930c0TafJa5sH5bbXkfGnOf9BJ6Y69Udl4X8Gu+9tj3GzT/PgaCZhybC
	PPxfxVxqu0hahRyOicWApxw43rlQ3qOQ/TEMFjW0keypoImbylAQKPTfvgg25b6GD8EgpA1kpiiLu
	CXbmHkDPzKJcj/i4VWAko9aSbARWfWObZ8ktGLr4dP872s0nwmp+vALhD+s4muaX9sEN9sEdCq7FZ
	aHxGZAfncYaIuNSAHQGj5heFN9GOh02Nuxt58477BrNyoySiXVnvh9eisCUBR1pfifzxnb1bTd+si
	JwCvgK8GA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7hdS-0003gh-Sy; Thu, 04 Feb 2021 16:37:38 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7hdO-0003fP-Li; Thu, 04 Feb 2021 16:37:35 +0000
Received: by mail-pf1-x42f.google.com with SMTP id j12so2420530pfj.12;
 Thu, 04 Feb 2021 08:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nwObsRzKSVhqA/EbWV8d9m9v2JwQDreOVTF8iuaBQ+g=;
 b=Qs76dodtfk29vh9y2oWEdTMAEgX8pR7GDXBRZt11OnuF+F3yrCFpGCfE3EUSAGkLGg
 5jkQJMKtoXCFCFsOw41yy0P24mbEQnUU/PN1vC734l1/K39+46+VS6bbscHzj2L55Whw
 FW22EBkyNiVCxmkNsXDYGEsP+zGH6f3LFIpXAoDhgixEHEseFXS8agAF7cSt15vBfmIu
 sa7oQOcvJtNzr/K6/r+vpvpUh+C2Mr6l1bM36mquA5Xn9VwjHxOLJnJ4Q3BcPgr4LZ4Y
 ey0TsDb+L/fowZ7+gofPOCsnCxtE2ihWeCgNDWMxadMu+izWumzDBNC7nofrD9894P78
 GvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nwObsRzKSVhqA/EbWV8d9m9v2JwQDreOVTF8iuaBQ+g=;
 b=pYEI4vjUgnS7Ug7/pIMbH4HmIMcNoqdAXq+rIOY5ZI5+ECIuODtzk8oUgGM0tO/KrS
 l5wDPOfbxHaIhi3nn5S3H49/hPfgSv1C7dCpxlyP1pPnKxJj5Un4VQVRiLJJ4RFpvAJH
 wnGd9wJp5stp7GFaekTQR/p+6h7IvvnAVoRKPEDmP5mPICGPDozJwAYbjVcPgYa4GCO4
 pfM3ZFzU42uOZif/tlqG6xVB6+1JCzRumikLFEu01TiLpiRG3LVcKKpS99YcfIPzxdXp
 nu1Nb1Q89+CIyfLbnOpMDr4esIJAj4FCIxh669mYtnrBF5AJ83gPBduU+2bJr8p2TO8W
 hh9A==
X-Gm-Message-State: AOAM533n+MAlaJ5qJHcfXShI7tActHfmtVlRz0TaEag2aDkFxXYKUWRd
 iBra0X26U8xEATEv6uksvgc=
X-Google-Smtp-Source: ABdhPJwYeZjRTrriYxBENEsGDiTCAauUg/JSwi9Ur6XUH/miSvOUu2eE8co0/Eh8tRvQGVqY8tG4fw==
X-Received: by 2002:a62:e217:0:b029:1c1:59ed:ae73 with SMTP id
 a23-20020a62e2170000b02901c159edae73mr77195pfi.6.1612456652596; 
 Thu, 04 Feb 2021 08:37:32 -0800 (PST)
Received: from localhost.localdomain (61-230-45-44.dynamic-ip.hinet.net.
 [61.230.45.44])
 by smtp.gmail.com with ESMTPSA id 9sm2371133pgw.61.2021.02.04.08.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 08:37:31 -0800 (PST)
From: Lecopzer Chen <lecopzer@gmail.com>
To: will@kernel.org
Subject: Re: [PATCH v2 1/4] arm64: kasan: don't populate vmalloc area for
 CONFIG_KASAN_VMALLOC
Date: Fri,  5 Feb 2021 00:37:21 +0800
Message-Id: <20210204163721.91295-1-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204150100.GE20815@willie-the-truck>
References: <20210204150100.GE20815@willie-the-truck>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_113734_754066_83C7EA48 
X-CRM114-Status: GOOD (  29.21  )
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
Cc: lecopzer.chen@mediatek.com, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tyhicks@linux.microsoft.com,
 glider@google.com, vincenzo.frascino@arm.com, ardb@kernel.org,
 yj.chiang@mediatek.com, kasan-dev@googlegroups.com, dvyukov@google.com,
 aryabinin@virtuozzo.com, linux@roeck-us.net, andreyknvl@google.com,
 lecopzer@gmail.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org,
 gustavoars@kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com,
 rppt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cj4gT24gVGh1LCBGZWIgMDQsIDIwMjEgYXQgMTA6NDY6MTJQTSArMDgwMCwgTGVjb3B6ZXIgQ2hl
biB3cm90ZToKPiA+ID4gT24gU2F0LCBKYW4gMDksIDIwMjEgYXQgMDY6MzI6NDlQTSArMDgwMCwg
TGVjb3B6ZXIgQ2hlbiB3cm90ZToKPiA+ID4gPiBMaW51eCBzdXBwb3J0IEtBc2FuIGZvciBWTUFM
TE9DIHNpbmNlIGNvbW1pdCAzYzVjM2NmYjllZjRkYTkKPiA+ID4gPiAoImthc2FuOiBzdXBwb3J0
IGJhY2tpbmcgdm1hbGxvYyBzcGFjZSB3aXRoIHJlYWwgc2hhZG93IG1lbW9yeSIpCj4gPiA+ID4K
PiA+ID4gPiBMaWtlIGhvdyB0aGUgTU9EVUxFU19WQUREUiBkb2VzIG5vdywganVzdCBub3QgdG8g
ZWFybHkgcG9wdWxhdGUKPiA+ID4gPiB0aGUgVk1BTExPQ19TVEFSVCBiZXR3ZWVuIFZNQUxMT0Nf
RU5ELgo+ID4gPiA+IHNpbWlsYXJseSwgdGhlIGtlcm5lbCBjb2RlIG1hcHBpbmcgaXMgbm93IGlu
IHRoZSBWTUFMTE9DIGFyZWEgYW5kCj4gPiA+ID4gc2hvdWxkIGtlZXAgdGhlc2UgYXJlYSBwb3B1
bGF0ZWQuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMZWNvcHplciBDaGVuIDxsZWNv
cHplci5jaGVuQG1lZGlhdGVrLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiDCoGFyY2gvYXJtNjQv
bW0va2FzYW5faW5pdC5jIHwgMjMgKysrKysrKysrKysrKysrKysrLS0tLS0KPiA+ID4gPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4g
PiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0va2FzYW5faW5pdC5jIGIvYXJjaC9hcm02
NC9tbS9rYXNhbl9pbml0LmMKPiA+ID4gPiBpbmRleCBkOGU2NmM3ODQ0MGUuLjM5YjIxOGE2NDI3
OSAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL2FybTY0L21tL2thc2FuX2luaXQuYwo+ID4gPiA+
ICsrKyBiL2FyY2gvYXJtNjQvbW0va2FzYW5faW5pdC5jCj4gPiA+ID4gQEAgLTIxNCw2ICsyMTQs
NyBAQCBzdGF0aWMgdm9pZCBfX2luaXQga2FzYW5faW5pdF9zaGFkb3codm9pZCkKPiA+ID4gPiDC
oHsKPiA+ID4gPiDCoCB1NjQga2ltZ19zaGFkb3dfc3RhcnQsIGtpbWdfc2hhZG93X2VuZDsKPiA+
ID4gPiDCoCB1NjQgbW9kX3NoYWRvd19zdGFydCwgbW9kX3NoYWRvd19lbmQ7Cj4gPiA+ID4gKyB1
NjQgdm1hbGxvY19zaGFkb3dfc3RhcnQsIHZtYWxsb2Nfc2hhZG93X2VuZDsKPiA+ID4gPiDCoCBw
aHlzX2FkZHJfdCBwYV9zdGFydCwgcGFfZW5kOwo+ID4gPiA+IMKgIHU2NCBpOwo+ID4gPiA+Cj4g
PiA+ID4gQEAgLTIyMyw2ICsyMjQsOSBAQCBzdGF0aWMgdm9pZCBfX2luaXQga2FzYW5faW5pdF9z
aGFkb3codm9pZCkKPiA+ID4gPiDCoCBtb2Rfc2hhZG93X3N0YXJ0ID0gKHU2NClrYXNhbl9tZW1f
dG9fc2hhZG93KCh2b2lkICopTU9EVUxFU19WQUREUik7Cj4gPiA+ID4gwqAgbW9kX3NoYWRvd19l
bmQgPSAodTY0KWthc2FuX21lbV90b19zaGFkb3coKHZvaWQgKilNT0RVTEVTX0VORCk7Cj4gPiA+
ID4KPiA+ID4gPiArIHZtYWxsb2Nfc2hhZG93X3N0YXJ0ID0gKHU2NClrYXNhbl9tZW1fdG9fc2hh
ZG93KCh2b2lkICopVk1BTExPQ19TVEFSVCk7Cj4gPiA+ID4gKyB2bWFsbG9jX3NoYWRvd19lbmQg
PSAodTY0KWthc2FuX21lbV90b19zaGFkb3coKHZvaWQgKilWTUFMTE9DX0VORCk7Cj4gPiA+ID4g
Kwo+ID4gPiA+IMKgIC8qCj4gPiA+ID4gwqAgwqAqIFdlIGFyZSBnb2luZyB0byBwZXJmb3JtIHBy
b3BlciBzZXR1cCBvZiBzaGFkb3cgbWVtb3J5Lgo+ID4gPiA+IMKgIMKgKiBBdCBmaXJzdCB3ZSBz
aG91bGQgdW5tYXAgZWFybHkgc2hhZG93IChjbGVhcl9wZ2RzKCkgY2FsbCBiZWxvdykuCj4gPiA+
ID4gQEAgLTI0MSwxMiArMjQ1LDIxIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBrYXNhbl9pbml0X3No
YWRvdyh2b2lkKQo+ID4gPiA+Cj4gPiA+ID4gwqAga2FzYW5fcG9wdWxhdGVfZWFybHlfc2hhZG93
KGthc2FuX21lbV90b19zaGFkb3coKHZvaWQgKilQQUdFX0VORCksCj4gPiA+ID4gwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAodm9pZCAqKW1vZF9zaGFkb3dfc3Rh
cnQpOwo+ID4gPiA+IC0ga2FzYW5fcG9wdWxhdGVfZWFybHlfc2hhZG93KCh2b2lkICopa2ltZ19z
aGFkb3dfZW5kLAo+ID4gPiA+IC0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAodm9pZCAqKUtBU0FOX1NIQURPV19FTkQpOwo+ID4gPiA+ICsgaWYgKElTX0VOQUJMRUQo
Q09ORklHX0tBU0FOX1ZNQUxMT0MpKSB7Cj4gPiA+Cj4gPiA+IERvIHdlIHJlYWxseSBuZWVkIHll
dCBhbm90aGVyIENPTkZJRyBvcHRpb24gZm9yIEtBU0FOPyBXaGF0J3MgdGhlIHVzZS1jYXNlCj4g
PiA+IGZvciAqbm90KiBlbmFibGluZyB0aGlzIGlmIHlvdSdyZSBhbHJlYWR5IGVuYWJsaW5nIG9u
ZSBvZiB0aGUgS0FTQU4KPiA+ID4gYmFja2VuZHM/Cj4gPgo+ID4gQXMgSSBrbm93LCBLQVNBTl9W
TUFMTE9DIG5vdyBvbmx5IHN1cHBvcnRzIEtBU0FOX0dFTkVSSUMgYW5kIGFsc28KPiA+IEtBU0FO
X1ZNQUxMT0MgdXNlcyBtb3JlIG1lbW9yeSB0byBtYXAgcmVhbCBzaGFkb3cgbWVtb3J5ICgxLzgg
b2Ygdm1hbGxvYyB2YSkuCj4KPiBUaGUgc2hhZG93IGlzIGFsbG9jYXRlZCBkeW5hbWljYWxseSB0
aG91Z2gsIGlzbid0IGl0PwoKWWVzLCBidXQgSXQncyBzdGlsbCBhIGNvc3QuCgo+ID4gVGhlcmUg
c2hvdWxkIGJlIHNvbWVvbmUgY2FuIGVuYWJsZSBLQVNBTl9HRU5FUklDIGJ1dCBjYW4ndCB1c2Ug
Vk1BTExPQwo+ID4gZHVlIHRvIG1lbW9yeSBpc3N1ZS4KPgo+IFRoYXQgZG9lc24ndCBzb3VuZCBw
YXJ0aWN1bGFybHkgcmVhbGlzdGljIHRvIG1lLiBUaGUgcmVhc29uIEknbSBwdXNoaW5nIGhlcmUK
PiBpcyBiZWNhdXNlIEkgd291bGQgX3JlYWxseV8gbGlrZSB0byBtb3ZlIHRvIFZNQVAgc3RhY2sg
dW5jb25kaXRpb25hbGx5LCBhbmQKPiB0aGF0IHdvdWxkIGVmZmVjdGl2ZWx5IGZvcmNlIEtBU0FO
X1ZNQUxMT0MgdG8gYmUgc2V0IGlmIEtBU0FOIGlzIGluIHVzZS4KPgo+IFNvIHVubGVzcyB0aGVy
ZSdzIGEgcmVhbGx5IGdvb2QgcmVhc29uIG5vdCB0byBkbyB0aGF0LCBwbGVhc2UgY2FuIHdlIG1h
a2UKPiB0aGlzIHVuY29uZGl0aW9uYWwgZm9yIGFybTY0PyBQcmV0dHkgcGxlYXNlPwoKSSB0aGlu
ayBpdCdzIGZpbmUgc2luY2Ugd2UgaGF2ZSBhIGdvb2QgcmVhc29uLgpBbHNvIGlmIHNvbWVvbmUg
aGF2ZSBtZW1vcnkgaXNzdWUgaW4gS0FTQU5fVk1BTExPQywKdGhleSBjYW4gdXNlIFNXX1RBRywg
cmlnaHQ/CgpIb3dldmVyIHRoZSBTV19UQUcvSFdfVEFHIGlzIG5vdCBzdXBwb3J0ZWQgVk1BTExP
QyB5ZXQuClNvIHRoZSBjb2RlIHdvdWxkIGJlIGxpa2UKCglpZiAoSVNfRU5BQkxFRChDT05GSUdf
S0FTQU5fR0VORVJJQykpCgkJLyogZXhwbGFpbiB0aGUgcmVsYXRpb25zaGlwIGJldHdlZW4gCgkJ
ICogS0FTQU5fR0VORVJJQyBhbmQgS0FTQU5fVk1BTExPQyBpbiBhcm02NAoJCSAqIFhYWDogYmVj
YXVzZSB3ZSB3YW50IFZNQVAgc3RhY2suLi4uCgkJICovCgkJa2FzYW5fcG9wdWxhdGVfZWFybHlf
c2hhZG93KCh2b2lkICopdm1hbGxvY19zaGFkb3dfZW5kLAoJCQkJCSAgICAodm9pZCAqKUtBU0FO
X1NIQURPV19FTkQpOwoJZWxzZSB7CgkJa2FzYW5fcG9wdWxhdGVfZWFybHlfc2hhZG93KCh2b2lk
ICopa2ltZ19zaGFkb3dfZW5kLAoJCQkJCSAgICAodm9pZCAqKUtBU0FOX1NIQURPV19FTkQpOwoJ
CWlmIChraW1nX3NoYWRvd19zdGFydCA+IG1vZF9zaGFkb3dfZW5kKQoJCQlrYXNhbl9wb3B1bGF0
ZV9lYXJseV9zaGFkb3coKHZvaWQgKiltb2Rfc2hhZG93X2VuZCwKCQkJCQkJICAgICh2b2lkICop
a2ltZ19zaGFkb3dfc3RhcnQpOwoJfQoKYW5kIHRoZSBhcmNoL2FybTY0L0tjb25maWcgd2lsbCBh
ZGQKCXNlbGVjdCBLQVNBTl9WTUFMTE9DIGlmIEtBU0FOX0dFTkVSSUMKCklzIHRoaXMgY29kZSBz
YW1lIGFzIHlvdXIgdGhvdWdodD8KCkJScywKTGVjb3B6ZXIKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
