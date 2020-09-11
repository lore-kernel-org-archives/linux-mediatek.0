Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0510DC43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 21:21:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6843E2076C
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 21:21:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pc+VA6/M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwx2YXfA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6843E2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BRTUWLA1RNcYew3NDSYLfX2dBvWKNKZGP3BeE8OHEyc=; b=Pc+VA6/MTaHjQ1ucvo3+EWhmv
	hR/QR8Av0Q/MxgVT7Fyzj2/EANk8QBMhaeXJrKrd26JD/smqP3L1TxnGUnjlgFqXM5lFwu9VoiPQ8
	iSYXwAE6ctgc+Z7ZgWZtiC5Nzur458fZGLzuNo5eyGnV5LNKsrP4JPgC9ZRCBvc9HlRvGe1V+oa6F
	3RwaqdiM+wuNCVyMDadpjpEKjPp1/Nunv8N6rV/Lrnmviaduawz3vlhmwFDxafyO6O9XzqAoKFfY4
	k4s1HBTB+KNimJEf48r3gPgcEWhGyjMjaiSykoxlT92AnlmfCcy8yATRN9tpC6eGvlcJdQumUWFjs
	B0iEo3XLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGqUE-0001uf-6c; Fri, 11 Sep 2020 21:21:38 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGqUC-0001u9-8g; Fri, 11 Sep 2020 21:21:37 +0000
Received: by mail-ed1-x541.google.com with SMTP id w1so11607241edr.3;
 Fri, 11 Sep 2020 14:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AdOFtW4+OTIfp7Vou5995FqSxqsP8JuVzsLCHo5nrGw=;
 b=iwx2YXfAln6p3+zUP1hzFoV8htJuprZmjPd2GMeVHLV95xIUBZ0d5kbG/zN0idAJZR
 CW420ks8syqWX+2MiN9x1egEJbYq6ia6v6uBT4Mn6BGQZ501QvqklbRxxbPomAkdHG2s
 VH+TyXl/AifpbFN2iDgXavo7b2SXiy9kbQOo4LdGoT2SYQdx87zlsOnUkH/a2RyziGnq
 q17UG/ZDvz+FSf5JCOpBjuiSczlBwJz7ESoPAjKHsFu2nvXFV1CDhOSEHk+tgaIamwow
 hEMXayvrrYu7sm1LSaOfY6zeTQiaYSQ2n0owQeMkDo3DKVSa/naw+QHhfeyBS502+0QX
 CCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AdOFtW4+OTIfp7Vou5995FqSxqsP8JuVzsLCHo5nrGw=;
 b=q9srarK6VZw2fVgod99whxn5e6fl8DU+usjFHNKQVuwcJD0f8Al0XnsLtpwAknAvc9
 knP/q8cZS6O3foLYp0nrpckoZQHOMAAY7T/LSz2dePFC82M1UoEKZMIZdbCIdbSbXanJ
 B0lULKES3n1yNuqbuxSZ1/5z6mAmh9wXciiVQz7UYNUsTR6QD3uTQM5fbeLAW2UUIKTe
 OIrM3D+vM8Rx5Ofow2mt2rTlEVX2ofe2seX5H7jHZxx/SZLxCvZfHDhwqWI/QdcVixeb
 3zuSulTeBLYTd2gZThl+w9ZOLthamRhpiK/+bq22jdgJE4/DQGchgIqhlppY/vQnWnDc
 GCjg==
X-Gm-Message-State: AOAM53056kDmAlAhPsqYbAAncI2BuWCXAeWFL8TGUXPW542TJRG0K+MU
 WL2+wcnpw9VCO0nMXvl+RneDrPvpBrM=
X-Google-Smtp-Source: ABdhPJwjd7y5MMCMMarDa3tCNp2fu5QkfRwhlPlnzt92v+gipu179RrQr1jgubq+d5d0CcG2FGf/+g==
X-Received: by 2002:aa7:d296:: with SMTP id w22mr4581288edq.327.1599859295171; 
 Fri, 11 Sep 2020 14:21:35 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:e953:3254:5e71:3177?
 ([2a01:110f:b59:fd00:e953:3254:5e71:3177])
 by smtp.gmail.com with ESMTPSA id z18sm2200844ejb.92.2020.09.11.14.21.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 14:21:34 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>, Pavel Machek <pavel@ucw.cz>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <559a568e-3a2e-33c6-43aa-547a18f8e26b@gmail.com> <20200911070503.GA9818@amd>
 <CAE+NS34aKmu0tjnCPg3nF_vB0ELKsKwZSOeEXsm5V9aPAqqSbQ@mail.gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <7e67c8f7-7f79-72f8-05bc-022ed0655a3f@gmail.com>
Date: Fri, 11 Sep 2020 23:21:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS34aKmu0tjnCPg3nF_vB0ELKsKwZSOeEXsm5V9aPAqqSbQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_172136_325629_31036A45 
X-CRM114-Status: GOOD (  20.79  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, linux-kernel@vger.kernel.org,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 Dan Murphy <dmurphy@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wilma.Wu@mediatek.com, linux-leds@vger.kernel.org, shufan_lee@richtek.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gOS8xMS8yMCAxOjI0IEFNLCBHZW5lIENoZW4gd3JvdGU6Cj4gUGF2ZWwgTWFjaGVrIDxwYXZl
bEB1Y3cuY3o+IOaWvCAyMDIw5bm0OeaciDEx5pelIOmAseS6lCDkuIvljYgzOjA15a+r6YGT77ya
Cj4+Cj4+IEhpIQo+Pgo+Pj4+ICt7Cj4+Pj4gKyAgICBzdHJ1Y3QgbXQ2MzYwX2xlZCAqbGVkID0g
Y29udGFpbmVyX29mKGxjZGV2LCBzdHJ1Y3QgbXQ2MzYwX2xlZCwgZmxhc2gubGVkX2NkZXYpOwo+
Pj4+ICsgICAgc3RydWN0IG10NjM2MF9wcml2ICpwcml2ID0gbGVkLT5wcml2Owo+Pj4+ICsgICAg
dTMyIGVuYWJsZV9tYXNrID0gTVQ2MzYwX1RPUkNIRU5fTUFTSyB8IE1UNjM2MF9GTENTRU5fTUFT
SyhsZWQtPmxlZF9ubyk7Cj4+Pj4gKyAgICB1MzIgdmFsID0gKGxldmVsKSA/IE1UNjM2MF9GTENT
RU5fTUFTSyhsZWQtPmxlZF9ubykgOiAwOwo+Pj4+ICsgICAgdTMyIHByZXYgPSBwcml2LT5mbGVk
X3RvcmNoX3VzZWQsIGN1cnI7Cj4+Pj4gKyAgICBpbnQgcmV0Owo+Pj4+ICsKPj4+PiArICAgIGRl
dl9kYmcobGNkZXYtPmRldiwgIlslZF0gYnJpZ2h0bmVzcyAlZFxuIiwgbGVkLT5sZWRfbm8sIGxl
dmVsKTsKPj4+PiArICAgIGlmIChwcml2LT5mbGVkX3N0cm9iZV91c2VkKSB7Cj4+Pj4gKyAgICAg
ICAgICAgIGRldl93YXJuKGxjZGV2LT5kZXYsICJQbGVhc2UgZGlzYWJsZSBzdHJvYmUgZmlyc3Qg
WyVkXVxuIiwgcHJpdi0+ZmxlZF9zdHJvYmVfdXNlZCk7Cj4+Pgo+Pj4gRG9lc24ndCBoYXJkd2Fy
ZSBoYW5kbGUgdGhhdD8gSU9XLCB3aGF0IGhhcHBlbnMgd2hlbiB5b3UgaGF2ZSBlbmFibGVkCj4+
PiBib3RoIHRvcmNoIGFuZCBmbGFzaD8gSWYgZmxhc2gganVzdCBvdmVycmlkZXMgdG9yY2ggbW9k
ZSwgdGhhbiB5b3UKPj4+IHNob3VsZCBub3QgcHJldmVudCBlbmFibGluZyB0b3JjaCBpbiB0aGlz
IGNhc2UuCj4+Cj4+IFllcCwgdGhpcyBpcyBzdHJhbmdlL2NvbmZ1c2luZy4uLiBhbmQgd2FzIHJl
YXNvbiB3aHkgSSBhc2tlZCBmb3Igbm90Cj4+IHN1cHBvcnRpbmcgc3Ryb2JlIGZyb20gc3lzZnMu
Cj4+Cj4+IENvdWxkIEkgZ2V0IHlvdSB0byByZW1vdmUgY29kZSB5b3UgYXJlIG5vdCBjb21tZW50
aW5nIGF0IHdoZW4KPj4gcmV2aWV3aW5nPwo+Pgo+IAo+IE1UNjM2MCBGTEVEIHJlZ2lzdGVyIGRl
ZmluZSBpcyBTVFJPQkVfRU4vVE9SQ0hfRU4vQ1MxL0NTMiAoY3VycmVudAo+IHNvdXJjZSkgNCBi
aXRzLgo+IFRoZSBTVFJPQkVfRU4vVE9SQ0hfRU4gaXMgc2hhcmVkIGJ5IEZMRUQxIGFuZCBGTEVE
Mi4KPiBJZiBJIHdhbnQgdG8gZW5hYmxlIEZMRUQxIHRvcmNoIG1vZGUsIEkgc2V0IFRPUkNIX0VO
IGFuZCBDUzEKPiBJZiBJIHdhbnQgdG8gZW5hYmxlIEZMRUQyIHN0cm9iZSBtb2RlLCBJIHNldCBT
VFJPQkVfRU4gYW5kIENTMgo+IEZvciBleGFtcGxlIEkgc2V0IEZMRUQxIHRvcmNoLCB0aGVuIEkg
c2V0IEZMRUQyIHN0cm9iZS4KPiBXaGVuIEkgc2V0IEZMRUQyIHN0cm9iZSwgSSB3aWxsIHNlZSB0
aGUgc3Ryb2JlIGN1cnJlbnQgaXMgRkxFRDIgYWRkCj4gRkxFRDEgY3VycmVudCB3aGljaCBpcyBu
b3QgSSB3YW50Lgo+IFNvIEkgbmVlZCBkaXNhYmxlIEZMRUQxIHRvcmNoIGZpcnN0Lgo+IENvbnNp
ZGVyaW5nIGV2ZXJ5IGNpcmN1bXN0YW5jZXMgaXMgY29tcGxpY2F0ZWQgd2hlbiBzaGFyZSBzYW1l
IEgvVwo+IGxvZ2ljIGNvbnRyb2wuCj4gQW5kIHRoZSBvdGhlciBwcm9ibGVtIGlzIHRvcmNoIG1v
ZGUgc3dpdGNoIHRvIHN0cm9iZSBtb2RlIG5lZWRzIHJhbXAKPiB0aW1lIGJlY2F1c2Ugc3Ryb2Jl
IGFuZCB0b3JjaCBtb2RlIGNhbid0IGJlIGNvLWV4aXN0LgoKVGhhbmsgeW91IGZvciB0aGUgZXhw
bGFuYXRpb24uIFNvIHdlIGhhdmUgdG8ga2VlcCB5b3VyIGd1YXJkcwpidXQgSSB3b3VsZCByZXR1
cm4gLUVCVVNZIGluc3RlYWQgb2YgLUVJTlZBTC4KClRoaXMgd291bGQgYmUgYWxzbyBjb25zaXN0
ZW50IHdpdGggd2hhdApkcml2ZXJzL21lZGlhL3Y0bDItY29yZS92NGwyLWZsYXNoLWxlZC1jbGFz
cy5jCmRvZXMgaW4gaXRzIHY0bDJfZmxhc2hfc19jdHJsKCksIGNhc2UgVjRMMl9DSURfRkxBU0hf
U1RST0JFIC0gaXQgcmV0dXJucwotRUJVU1kgaWYgX19zb2Z0d2FyZV9zdHJvYmVfbW9kZV9pbmFj
dGl2ZSgpIHJldHVybnMgZmFsc2UuCgpUaGUgYWR2YW50YWdlIG9mIFY0TDIgRmxhc2ggaW50ZXJm
YWNlIGlzIHRoYXQgaXQgaGFzIExFRF9NT0RFIHRoYXQKY2FuIGJlIHNldCB0byB0b3JjaCBvciBm
bGFzaCwgYnV0IGluIExFRCBzdWJzeXN0ZW0gd2UgZG9uJ3QgaGF2ZQp0aGUgY291bnRlcnBhcnQu
CgotLSAKQmVzdCByZWdhcmRzLApKYWNlayBBbmFzemV3c2tpCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
