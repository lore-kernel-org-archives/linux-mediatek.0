Return-Path: <SRS0=/klC=A3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FF5C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 13:44:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6669F207E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2020 13:44:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k3+/N0gH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z92LEFwT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6669F207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gYbeTVqesfAKFFoMTfVODd515jGVfsSJyQ9CTzVtXLc=; b=k3+/N0gH/vy5t+WKAAaNS7QKX
	r6YHsYS43FTTa1Mw15IUfcGHT8F5Irom5MGtAGczwTQBWCak7medk7mMv5wTAF9tLPN0SKMzM4qFR
	/bl51TdU8PDPDhAe15fkT7kP7lVTM3aKsDoKZYMuHBkP+W/TMVatfHHq1xsdT2FENsr1E+1XxXkHR
	AWwb/DATJBS0qt0wooDebQQyKbJb4A0axVv0Ik5gUedkamXkwJVHrxmf7uegIYIXCOhWJf5F3hYyl
	Rvu1M6J+WeM9cKUTdPbLb1Z5n4XXNmE40x2jREt3t28kZeXCCxBjjXjxOKQcbU/yN01joxaMkvDkp
	OXRBlK+KA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw4BK-0001jV-1P; Thu, 16 Jul 2020 13:44:14 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw4BH-0001il-IQ
 for linux-mediatek@lists.infradead.org; Thu, 16 Jul 2020 13:44:12 +0000
Received: by mail-wm1-x341.google.com with SMTP id o2so11697510wmh.2
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2020 06:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=tPvUD+Jzvv3iWRg8/7rpNm8CjGwz7MHu7BZfaoonDng=;
 b=Z92LEFwTgmxAxCLyNA3Gi79kTX3HrUWTFsX2kFVvI7Hb9M6mIORxgS63z3ujToztg3
 aQQutln4iOa07LH8xB0zLGZ/WuGZd/kjwcFKxBpP1e5fvTu7EeqHnwxAQEM4OXjBIzYg
 ZiQEwStwucWsJec/27BCGM8AM8JvwDL0MhRnWOt3Om9oF3B2wRvKq8C7QG/rsr6m23IF
 wJuBEyL3myH6qPrx3wam1/6PTJxxAislUBhtuVvTOfzlMp9jct+uR+VuzDcK5Jnk7Fu/
 tidT3OQ10yxXWQWMgsBkgjBiwwljyvW76xAFZv6AO5nbzZh5qs0DuqrhmIvUF/Qz6yqw
 FJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tPvUD+Jzvv3iWRg8/7rpNm8CjGwz7MHu7BZfaoonDng=;
 b=LVA3TjESlPWctLDCEQmteDdCwIC7VRNWId5NV515gAdDBc/4502qYO2Km06QZxmr/g
 pddi+72PUkh2owUs0ELcTHnxxtuhHaz78y2sZ58hw0Cnv1kjDkO0cKF5qOGTQKY4DXqH
 ub+XDo5mbhzHVtAGnrcuIIlCsQzJOjqUQSTmBukf06wdfpDUAO8vLHg8owO8EA529Hbk
 PIRoK99ZlWvb9IPstqV5p9jPm8M9TluMm8Q2QjdCKcACLDRUvoN0TeuBIRo9illQk3ZN
 g1EOXKeIp9TqvWRRq10+d68cTOpanpC62nbyC7bSRP8uTuaRrRL5tMmcif2SUh8URsuw
 ZJjg==
X-Gm-Message-State: AOAM532YzJu3FqlNVuQ7sBoV7BSM1HQ1P96BueNJT4+XKTxliNRA9EhG
 +/Uq79z7btbDfjOV/bS2UyQuRA==
X-Google-Smtp-Source: ABdhPJww5qpSJhbG0KBpS0QFSYaR7SsAgrYvay7pX+NyMK6HhSpQzKWYYhnNkbb+GmJ5Vny05u1uGQ==
X-Received: by 2002:a1c:b608:: with SMTP id g8mr4428615wmf.55.1594907048522;
 Thu, 16 Jul 2020 06:44:08 -0700 (PDT)
Received: from dell ([2.31.163.61])
 by smtp.gmail.com with ESMTPSA id y77sm9612274wmd.36.2020.07.16.06.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 06:44:07 -0700 (PDT)
Date: Thu, 16 Jul 2020 14:44:06 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH 1/4] mfd: mt6360: Refactor and fix code style
Message-ID: <20200716134406.GQ3165313@dell>
References: <1594117856-14343-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594117856-14343-2-git-send-email-gene.chen.richtek@gmail.com>
 <b9540dc6-4d43-45e4-8878-15d2df24a268@gmail.com>
 <20200713065110.GB3500@dell>
 <CAE+NS36uRRqHetQE5QVJ94WX4g7CdQzvD-0VOnLfKAbqdHs3Sg@mail.gmail.com>
 <20200713104816.GD3500@dell>
 <CAE+NS36EEVb0JLDuZ_0tyocu7PeQSpyNGOWm-jWLW2kZFD=jYg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS36EEVb0JLDuZ_0tyocu7PeQSpyNGOWm-jWLW2kZFD=jYg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_094411_710634_A924F300 
X-CRM114-Status: GOOD (  19.81  )
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
Cc: Gene Chen <gene_chen@richtek.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxNiBKdWwgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiDmlrwgMjAyMOW5tDfmnIgxM+aXpSDpgLHkuIAg5LiL5Y2INjo0OOWv
q+mBk++8mgo+ID4KPiA+IE9uIE1vbiwgMTMgSnVsIDIwMjAsIEdlbmUgQ2hlbiB3cm90ZToKPiA+
Cj4gPiA+IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IOaWvCAyMDIw5bm0N+aciDEz
5pelIOmAseS4gCDkuIvljYgyOjUx5a+r6YGT77yaCj4gPiA+ID4KPiA+ID4gPiBPbiBGcmksIDEw
IEp1bCAyMDIwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4g
PiA+ID4KPiA+ID4gPiA+IE9uIDA3LzA3LzIwMjAgMTI6MzAsIEdlbmUgQ2hlbiB3cm90ZToKPiA+
ID4gPiA+ID4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IFJlYXJyYW5nZSBpbmNsdWRlIGZpbGUuCj4gPiA+ID4gPiA+IFJlbW92
ZSBicmFja2V0cyBhcm91bmQgcmF3IG51bWJlcnMuCj4gPiA+ID4gPiA+IEluZGljYXRlIHN1Yi1k
ZXYgY29tcGF0aWJsZSBuYW1lIGJ5IHVzaW5nICItIgo+ID4gPiA+ID4gPiBDb21iaW5lIG10NjM2
MCBwbWljL2xkbyByZXNvdWNlcyBpbnRvIG10NjM2MCByZWd1bGF0b3IgcmVzb3VyY2VzLgo+ID4g
PiA+ID4gPiBSZW5hbWUgbXQ2MzYwX3BtdV9kYXRhIGJ5IG10NjM2MF9kYXRhLgo+ID4gPiA+ID4g
PiBSZW5hbWUgbXQ2MzYwX3BtdSBieSBtdDYzNjAuCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhhdCBz
ZWVtcyBsaWtlIGEgbG90IG9mIGNvc21ldGljcy4gV2h5IGlzIHRoaXMgbmVlZGVkPwo+ID4gPiA+
ID4gSWYgeW91IHRoaW5rIHRoYXQncyBuZWVkZWQgaXQgc2hvdWxkIGJlIHNwbGl0IHVwIGluIGRp
ZmZlcmVudCBjb21taXRzLCBlYWNoCj4gPiA+ID4gPiBleHBsYWluaW5nIGluIHRoZSBjb21taXQg
bWVzc2FnZSB3aHkgeW91IGRvIHRoYXQuCj4gPiA+ID4KPiA+ID4gPiBBZ3JlZWQuICBUaGlzIHNl
dCBpcyBzdGlsbCBub3QgYnJva2VuIHVwIGVub3VnaC4KPiA+ID4gPgo+ID4gPiA+IFBsZWFzZSBw
bGFjZSBlYWNoIGxvZ2ljYWwgY2hhbmdlIGludG8gaXRzIG93biBwYXRjaCBmb3IgcmV2aWV3Lgo+
ID4gPiA+Cj4gPiA+Cj4gPiA+IDEuIFJlYXJyYW5nZSBpbmNsdWRlIGZpbGUuCj4gPiA+IEFmdGVy
IGNoZWNrIHNlcnZlcmFsIGZpbGUgYWJvdXQgY29kaW5nIHN0eWxlLCBpbmNsdWRlIGZpbGUgc2Vl
bXMgc29ydAo+ID4gPiBieSBhcmNoaXRlY3R1cmUsIG5vdCBieSBhbHBoYWJldAo+ID4gPiAyLiBS
ZW1vdmUgYnJhY2tldHMgYXJvdW5kIHJhdyBudW1iZXJzLgo+ID4gPiBEdWUgdG8gcmVkdW5kYW50
IGJyYWNrZXRzLCBhbm90aGVyIHJldmlld2VyIHJlY29tbWVuZGVkIHRvIGRlbGV0ZSB0aGVtLgo+
ID4gPiAzLiBJbmRpY2F0ZSBzdWItZGV2IGNvbXBhdGlibGUgbmFtZSBieSB1c2luZyAiLSIKPiA+
ID4gU3VnZ2VzdGlvbiBieSBMZWVzIHdoZW4gcmV2aWV3IG1mZCBiaW5kaW5nIGRvY3VtZW50Lgo+
ID4gPiA0LiBDb21iaW5lIG10NjM2MCBwbWljL2xkbyByZXNvdWNlcyBpbnRvIG10NjM2MCByZWd1
bGF0b3IgcmVzb3VyY2VzLgo+ID4gPiBTaW1wbGlmeSB0aGUgc2ltaWxhciByZXNvdXJjZXMgb2Jq
ZWN0Lgo+ID4gPiA1LiBSZW5hbWUgbXQ2MzYwX3BtdV9kYXRhIGJ5IG10NjM2MF9kYXRhLgo+ID4g
PiBOb3Qgb25seSBpbmNsdWRlIHBtdSBwYXJ0LCBidXQgYWxzbyBlbnRpcmUgTVQ2MzYwIElDLgo+
ID4gPiA2LiBSZW5hbWUgbXQ2MzYwX3BtdSBieSBtdDYzNjAuCj4gPiA+IFNhbWUgcmVhc29uIGFz
IGFib3ZlLgo+ID4gPgo+ID4gPiBXZSB0cnkgdG8gbWFrZSBjb2RlIG1vcmUgc2ltcGxlciBhbmQg
ZWFzaWVyIHRvIHVuZGVyc3RhbmQKPiA+ID4gV2UgY2FuIGFsc28gZGlzY2FyZCBjaGFuZ2VzIGlm
IHBhdGNoIDEsMiw0LDUsNiBkb2Vzbid0IG1ha2UgYW55IGRpZmZlcmVuY2UuCj4gPgo+ID4gSSdt
IG5vdCBzdXJlIHdoYXQgeW91J3JlIHRyeWluZyB0byBzYXkuCj4gPgo+ID4gUGxlYXNlIHBsYWNl
IGVhY2ggb24gb2YgdGhlc2UgY2hhbmdlcyBpbnRvIHRoZWlyIG93biBwYXRjaC4KPiA+Cj4gCj4g
SSBsaXN0IGFsbCB0b3BpYyBhbmQgcmVhc29uIHdoeSB3ZSB3YW50IHRvIG1vZGlmeS4KPiBCZWZv
cmUgc3BsaXQgaW50byBwYXRjaGVzLCBjYW4gd2UgZGlzY3VzcyB3aGljaCB0b3BpYyByZXZpZXdl
ciBjYW4gYWNjZXB0Pwo+IG9yIEkgbmVlZCBmaXggZmlyc3Q/CgpGaXggZmlyc3QgcGxlYXNlLgoK
LS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9w
ZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBT
b0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
