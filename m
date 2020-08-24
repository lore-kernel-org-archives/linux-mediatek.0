Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082E0C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 10:23:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8EC320738
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 10:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iwBObfyL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="divqktAM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8EC320738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=weLJ7bcsJ8fZGjdmcKCb3xiOXRzrsp0i8kZ4mHeFl9E=; b=iwBObfyLPcuQY3qbyekJlRkni
	efQkwtfNZM7p7xejZCUjhiG2+K3teGCBC5PjIpbgSKZp24u9JWlqOJXbTLTrw4vNi36Roys8kt0sv
	f02B79OjWNqdCuzflIaddkHCU5koqNWOhPFvV7O/xUuAgDKvIVWsk+y47iKCCjbUIY2EUWaHpA075
	Dnww3GkvZiRnr4jr1oz3TrRkm6kln7IfHDZWuBvy1/j03i++J23bxPuaP+C1O0+mXNh/M+ZLwxH3S
	AWBnJfnPxtz+XQ7nUeyIDrsW3sDvMK37hm/L5XjfdODLMeUg7bUfErZq/p850aJrCtgYg4vAk1vMi
	tD/cnh8aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA9da-00045u-Q9; Mon, 24 Aug 2020 10:23:39 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA9dW-00041E-1G; Mon, 24 Aug 2020 10:23:35 +0000
Received: by mail-il1-x141.google.com with SMTP id j9so6735515ilc.11;
 Mon, 24 Aug 2020 03:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eppDuuHLOI5VOLJzJCYhod9oPaidx9gSqKiUktHmrVk=;
 b=divqktAMZuFes1GiD35GYGhb7swEwaEccNiOc16b+dfhMMtZk7qRb38um1oHlkUk6k
 hEnYJUqQAomg3alD+ahSw12f7Mt8GwJFsBkbdRi0cUO4OqWe69Sl4VroXvy326Dez5d4
 I+gtIuakWu5UqP5K/czMywaWPccRkG3or7Y08cIDE3+3gNnVEC9bnPYA2n5hd3A1APg8
 X5S97/uPTQwwllp5uQtkKwPyyHGnhRCQd3VUCDaGEPuRyngxmAwwVbsmEWhnjRBkVCT6
 8qoitN/CE3xF45hXm3Bi/hCiK9XZTFaCqQfTxGkuCtFbt1voD1bkIwARiqQAA72Osw3D
 bhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eppDuuHLOI5VOLJzJCYhod9oPaidx9gSqKiUktHmrVk=;
 b=agBf9OOkYT1ygg7uzGrO2Z7QKKqmFSFgkNTgJzN6lfCqUncSKL7BiLSPOjZk0p9xHP
 hmOcz9WSmKVFWlQfqM15ZZUD2TzLnbCULvbmtRfm0QnWmZ9Xj1rdrPv4hRmllFAdC+xa
 KwWAsBiKJ9B5IGoLSwRlrymWnBU9CBSWT7PVZ2ZwCJdcCcqPVlPYkH54dRb1gJF7SbQr
 z98oj7WzNe0bdx4gKv3PIVKSsa9ik4FHhjOt5UHPuh69xKHeCUB9bw4zqQzObLWZQAlm
 yh4woEDOknMQ9bDxSJ1p7Sjs4DQXfR1R686/ZmYj5Aw7M7yc4YBJyMSqrstUqTg8OQen
 3IpQ==
X-Gm-Message-State: AOAM532M17+3wQ1w/6+MuPluchOe0v0AHTArp+Y1qXop7AGgE9biMrz9
 0bUTN43RZ5y9faovOCeQvo6wfXmCUcsy/3eVc3s=
X-Google-Smtp-Source: ABdhPJzL/ijd0HW2Tt67za2CHZb0C24HeAy7TSZp5sLVUDfU1OLJSD+689YumyA/furfpuHuExsiBEngYTystKWMXFM=
X-Received: by 2002:a92:5f06:: with SMTP id t6mr4125876ilb.212.1598264611324; 
 Mon, 24 Aug 2020 03:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597910022-22617-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200820114524.GC5854@sirena.org.uk>
In-Reply-To: <20200820114524.GC5854@sirena.org.uk>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Mon, 24 Aug 2020 18:23:19 +0800
Message-ID: <CAE+NS34WuWnT7zvsHhaciWVLT2y0wpwt0wXAp3UmjEuJ2its6A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] regulator: mt6360: Add support for MT6360 regulator
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_062334_260818_6C9FAF15 
X-CRM114-Status: GOOD (  13.20  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDjmnIgyMOaXpSDpgLHl
m5sg5LiL5Y2INzo0NeWvq+mBk++8mgo+Cj4gT24gVGh1LCBBdWcgMjAsIDIwMjAgYXQgMDM6NTM6
NDFQTSArMDgwMCwgR2VuZSBDaGVuIHdyb3RlOgo+Cj4gPiArICAgICBtcmQtPnJlZ21hcCA9IGRl
dl9nZXRfcmVnbWFwKHBkZXYtPmRldi5wYXJlbnQsIE5VTEwpOwo+ID4gKyAgICAgaWYgKCFtcmQt
PnJlZ21hcCkgewo+ID4gKyAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQg
dG8gZ2V0IHBhcmVudCByZWdtYXBcbiIpOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVOT0RF
VjsKPiA+ICsgICAgIH0KPgo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIF9f
bWF5YmVfdW51c2VkIG10NjM2MF9yZWd1bGF0b3Jfb2ZfaWRbXSA9IHsKPiA+ICsgICAgIHsgLmNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2MzYwLXJlZ3VsYXRvciIsIH0sCj4gPiArICAgICB7fSwK
PiA+ICt9Owo+ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10NjM2MF9yZWd1bGF0b3Jfb2Zf
aWQpOwo+Cj4gVGhpcyBkZXZpY2Ugb25seSBleGlzdHMgaW4gdGhlIGNvbnRleHQgb2YgYSBzaW5n
bGUgcGFyZW50IGRldmljZSwgdGhlcmUKPiBzaG91bGQgYmUgbm8gbmVlZCBmb3IgYSBjb21wYXRp
YmxlIHN0cmluZyBoZXJlIC0gdGhpcyBpcyBqdXN0IGEgZGV0YWlsCj4gb2YgaG93IExpbnV4IGRv
ZXMgdGhpbmdzLiAgVGhlIE1GRCBzaG91bGQganVzdCBpbnN0bnRpYXRlIHRoZSBwbGF0Zm9ybQo+
IGRldmljZS4KClRyeWluZyB0byBhdXRvbG9hZCBtb2R1bGUgd2l0aG91dCBvZl9pZF90YWJsZSB3
aWxsIGNhdXNlIHJ1bi10aW1lIGVycm9yOgp1ZXZlbnRkOiBMb2FkV2l0aEFsaWFzZXMgd2FzIHVu
YWJsZSB0byBsb2FkCm9mOk5yZWd1bGF0b3JUKG51bGwpQ21lZGlhdGVrLG10NjM2MC1yZWd1bGF0
b3IKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC83MjY2OTEvCkFjY29y
ZGluZyB0byB0aGlzIHBhdGNoLCBhdXRvbG9hZCBjYW4ndCBsb2FkIG1vZHVsZSB3aGljaCBkb2Vz
bid0CmluY2x1ZGUgYWRkIGlkX3RhYmxlIG9yIG9mX2lkX3RhYmxlIGluIG1vZHVsZS5hbGlhcwpT
byBJIG5lZWQga2VlcCBvZl9pZl90YWJsZSBmb3IgYXV0byBsb2FkIHN1Y2Nlc3MKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
