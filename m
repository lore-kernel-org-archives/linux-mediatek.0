Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C82C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 14:25:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D060D64EE1
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 14:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D060D64EE1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DrSZ+IZnvzvdsqwFdB9nS8TBw4EW5HtmLkHn9GCHNlQ=; b=KEsH0gV36U+dKVs/yw80isGx2
	xujlZY+vSXC3MaO/r+iMm4DDqCKr/HCzPEYIvhMDRkb0q5i8H1/ueriyyD9iOl0At4G5RKDQgIamQ
	wyWI97qq1DP1KZlnQRetl+A2Em4zL7at4ZBHuFtrXBJmzgy0VvDx6RXmZJmIEa6gQqmp3O7thhnBF
	/eKUYGKRhAJK7hLkp1tlfj/F8Oz2fgcNAdYFWN1btiZhiL5FnMiy9k2GB9+0HEEW73Nrf/+WgvdTi
	5wRFh6au7Sd9K+yAgiiKKdy8TVNdiVLUg3UPkVlc0Gwepsep1KeuWhuQPDj/vmAL6yhVpmMAKCFxw
	Eg8xUTDeA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMtaW-005Tt2-1S; Thu, 18 Mar 2021 14:25:24 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMtaF-005Tpp-HG; Thu, 18 Mar 2021 14:25:09 +0000
Received: by mail-oi1-x22c.google.com with SMTP id w125so1642272oib.13;
 Thu, 18 Mar 2021 07:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x3gm3O0zGV8d6mrkbGdIstufDDjuTEV+EDN8sx1MHFs=;
 b=uFGGOC4Ywk38a7fsMuK1d25rlsW5/SVNRmMEVbRSofSkKCpYoAXsTUGK+c7MQ4/U6C
 8UY6cdQqic8CUKPdi9K2n91vOnIC5JEQuI12KQOx2Oa7CYg47pS87oja4fKSFERHAVD5
 zO5EONSGDbeCfXVYSF2iLtlnICXpnJbGDvBj+8nuMlFeOXNKP/4mhMBp4VYLfIukY3ZZ
 G6V7bWXvj03TMheyPLxxdsG2NuyEZlfpr5z5VdhKuKA3PGhElNJkqdCCdyO8K6k5EupI
 2OetHceDyWe72SgbsvqmHdLXO56YJBetfboxUqGsPH6tHlm+ZDdvP2Hg14RdEcsQPcSR
 F4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x3gm3O0zGV8d6mrkbGdIstufDDjuTEV+EDN8sx1MHFs=;
 b=YcFbjEjkH/Cs6dVp0Sv+NKgb59HGbEqm/HuVkxyDzQmJFspQtKXsb4KGgMhntH1Sla
 8hXFkt8wIbHoEtH74F0BS5Z3Fq/kbik1u90fcC3nT3DWwfkzFTVLFT53H53Y3PfJGwan
 fYEgp2P3zR6hnU0mUkScvQ+UEem0YCIYCG3T+1O2WB+Z2mbRhU+YViWFA8CuC2mqoXbn
 ERZyvFdlIwEfJU+6s44lHDNJu6u/514HpeLYJldMYrz5p5YQ69Rk/kxUIqzNz6cCUfe0
 my8nYgASzPdwvTCjnMkuDA2q/5O5BF2Gn7r4+fxmtKQIaH+fajN5uz7Ni678for0++10
 VwTA==
X-Gm-Message-State: AOAM533NKSIxVacs1udecqg1Ngxd225/InvmBIbPyj8WaXcjS/0xCXzc
 U7Hyu+aVeV3UvSIYzueDrNNf+Lw1ajd9TI8Vess=
X-Google-Smtp-Source: ABdhPJxczSmp9JhNjJ3jMbWiFTuzUjg10FCu/S5NMdSOgtYKIeIzaQfwZ8OYrjih3HhdHbZ5ZkhHFhjjpP2iIqIh8Io=
X-Received: by 2002:a05:6808:14cf:: with SMTP id
 f15mr3233685oiw.39.1616077505936; 
 Thu, 18 Mar 2021 07:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <1616046056-29068-1-git-send-email-rex-bc.chen@mediatek.com>
 <1616046056-29068-2-git-send-email-rex-bc.chen@mediatek.com>
In-Reply-To: <1616046056-29068-2-git-send-email-rex-bc.chen@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 18 Mar 2021 15:24:54 +0100
Message-ID: <CAFqH_51qkjtRRS8yjiRXQhN7Hvn-rG34ieKxKnKmreJrOJVUow@mail.gmail.com>
Subject: Re: [v5, 1/2] drm/mediatek: mtk_dpi: Add check for max clock rate in
 mode_valid
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Pi-Hsun Shih <pihsun@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_142507_618567_8EF30644 
X-CRM114-Status: GOOD (  19.39  )
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

SGkgUmV4LUJDIENoZW4sCgpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guCgpNaXNzYXRnZSBkZSBS
ZXgtQkMgQ2hlbiA8cmV4LWJjLmNoZW5AbWVkaWF0ZWsuY29tPiBkZWwgZGlhIGRqLiwgMTggZGUK
bWFyw6cgMjAyMSBhIGxlcyA2OjQyOgo+Cj4gQWRkIHBlci1wbGF0Zm9ybSBtYXggY2xvY2sgcmF0
ZSBjaGVjayBpbiBtdGtfZHBpX2JyaWRnZV9tb2RlX3ZhbGlkLgo+Cj4gU2lnbmVkLW9mZi1ieTog
UGktSHN1biBTaGloIDxwaWhzdW5AY2hyb21pdW0ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFJleC1C
QyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRlay5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSml0YW8g
U2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RwaS5jIHwgMTggKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiBpbmRl
eCBiMDVmOTAwZDkzMjIuLjBiNDI3YWQwY2Q5YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYwo+IEBAIC0xMjAsNiArMTIwLDcgQEAgc3RydWN0IG10a19kcGlfeWNfbGltaXQgewo+
ICBzdHJ1Y3QgbXRrX2RwaV9jb25mIHsKPiAgICAgICAgIHVuc2lnbmVkIGludCAoKmNhbF9mYWN0
b3IpKGludCBjbG9jayk7Cj4gICAgICAgICB1MzIgcmVnX2hfZnJlX2NvbjsKPiArICAgICAgIHUz
MiBtYXhfY2xvY2tfa2h6Owo+ICAgICAgICAgYm9vbCBlZGdlX3NlbF9lbjsKPiAgfTsKPgo+IEBA
IC01NTcsOSArNTU4LDIzIEBAIHN0YXRpYyB2b2lkIG10a19kcGlfYnJpZGdlX2VuYWJsZShzdHJ1
Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ICAgICAgICAgbXRrX2RwaV9zZXRfZGlzcGxheV9tb2Rl
KGRwaSwgJmRwaS0+bW9kZSk7Cj4gIH0KPgo+ICtzdGF0aWMgZW51bSBkcm1fbW9kZV9zdGF0dXMK
PiArbXRrX2RwaV9icmlkZ2VfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X2luZm8g
KmluZm8sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3Bs
YXlfbW9kZSAqbW9kZSkKPiArewo+ICsgICAgICAgc3RydWN0IG10a19kcGkgKmRwaSA9IGJyaWRn
ZV90b19kcGkoYnJpZGdlKTsKPiArCj4gKyAgICAgICBpZiAoZHBpLT5jb25mLT5tYXhfY2xvY2tf
a2h6ICYmIG1vZGUtPmNsb2NrID4gZHBpLT5jb25mLT5tYXhfY2xvY2tfa2h6KQoKTWF5YmUgSSBy
ZWFkIHRoaXMgcGF0Y2ggdG9vIGZhc3QsIGJ1dCB3aHkgdGhlICYmPyBTaG91bGRuJ3QgYmUgbW9y
ZQpzaW1wbGUgYW5kIHJlYWRhYmxlCgogICAgICAgICAgaWYgKG1vZGUtPmNsb2NrID4gbWF4X2Ns
b2NrKQoKVGhhbmtzLAogIEVucmljCgoKPiArICAgICAgICAgICAgICAgcmV0dXJuIE1PREVfQ0xP
Q0tfSElHSDsKPiArCj4gKyAgICAgICByZXR1cm4gTU9ERV9PSzsKPiArfQo+ICsKPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fYnJpZGdlX2Z1bmNzIG10a19kcGlfYnJpZGdlX2Z1bmNzID0gewo+
ICAgICAgICAgLmF0dGFjaCA9IG10a19kcGlfYnJpZGdlX2F0dGFjaCwKPiAgICAgICAgIC5tb2Rl
X3NldCA9IG10a19kcGlfYnJpZGdlX21vZGVfc2V0LAo+ICsgICAgICAgLm1vZGVfdmFsaWQgPSBt
dGtfZHBpX2JyaWRnZV9tb2RlX3ZhbGlkLAo+ICAgICAgICAgLmRpc2FibGUgPSBtdGtfZHBpX2Jy
aWRnZV9kaXNhYmxlLAo+ICAgICAgICAgLmVuYWJsZSA9IG10a19kcGlfYnJpZGdlX2VuYWJsZSwK
PiAgfTsKPiBAQCAtNjY4LDE3ICs2ODMsMjAgQEAgc3RhdGljIHVuc2lnbmVkIGludCBtdDgxODNf
Y2FsY3VsYXRlX2ZhY3RvcihpbnQgY2xvY2spCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Rw
aV9jb25mIG10ODE3M19jb25mID0gewo+ICAgICAgICAgLmNhbF9mYWN0b3IgPSBtdDgxNzNfY2Fs
Y3VsYXRlX2ZhY3RvciwKPiAgICAgICAgIC5yZWdfaF9mcmVfY29uID0gMHhlMCwKPiArICAgICAg
IC5tYXhfY2xvY2tfa2h6ID0gMzAwMDAwLAo+ICB9Owo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
bXRrX2RwaV9jb25mIG10MjcwMV9jb25mID0gewo+ICAgICAgICAgLmNhbF9mYWN0b3IgPSBtdDI3
MDFfY2FsY3VsYXRlX2ZhY3RvciwKPiAgICAgICAgIC5yZWdfaF9mcmVfY29uID0gMHhiMCwKPiAg
ICAgICAgIC5lZGdlX3NlbF9lbiA9IHRydWUsCj4gKyAgICAgICAubWF4X2Nsb2NrX2toeiA9IDE1
MDAwMCwKPiAgfTsKPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDgxODNf
Y29uZiA9IHsKPiAgICAgICAgIC5jYWxfZmFjdG9yID0gbXQ4MTgzX2NhbGN1bGF0ZV9mYWN0b3Is
Cj4gICAgICAgICAucmVnX2hfZnJlX2NvbiA9IDB4ZTAsCj4gKyAgICAgICAubWF4X2Nsb2NrX2to
eiA9IDEwMDAwMCwKPiAgfTsKPgo+ICBzdGF0aWMgaW50IG10a19kcGlfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiAtLQo+IDIuMTguMAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
