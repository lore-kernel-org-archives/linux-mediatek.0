Return-Path: <SRS0=bqbO=BL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FA1C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Aug 2020 00:13:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E4392071E
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Aug 2020 00:13:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y7j7H8Ur";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwTK4nTd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E4392071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BJ6N3VzX6pgWI8c8pLcyA+4i0Gm0whNhaeeEdkmvEio=; b=y7j7H8Ur2UfPxMkVBnW7RriGL
	z5EG3NEw4E3f7dR40hO02s4iTPJwx8xfKywoklIhPtGERnSBJKDABx5DpZFjGQ4CGUeQuePdZHOqS
	IiA2wtZBT5OrQv7pzXudBlWfFpj1nLMiM3/BfeUT6NgBEoBBBgIfpklcqKuISB7X83K0UhgzTAGBs
	+SUEAuoHtrwbr/+Z5feK7GdeRT6uvOaI83qutyoTV4QrIf1cRT7fhAH7/1gFYcf/ayYMXH9rSfR1r
	pVMUBxsF247BkfGxORjF2EwNsc7uah5A4117EZSnjEA7IT0azcgwXbxZgbrVGEvLPtAeF4LJkRdA3
	crs53oncw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1f9G-0007v5-3N; Sat, 01 Aug 2020 00:13:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1f9C-0007ts-0P; Sat, 01 Aug 2020 00:13:11 +0000
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE89F2071E;
 Sat,  1 Aug 2020 00:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596240789;
 bh=n7WNIjd113yI4hTkSUhS0MieCDn0mYiulcZegXarHiQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cwTK4nTdLjiSBKaFyrshHnlaq/mhK5249QxAYMkm0Wg4Lora9fjbCpn/V3wEf8MRk
 Q1alTIeZXZNLduDsnZT+c0hZDBCsfgI0o5HH9F9ZSa2o4NduJIN5mtpHKGZRuptS6k
 fCYMzf7cgUiskfH/b6FgOwLahq+30cwi7SiITHus=
Received: by mail-ed1-f41.google.com with SMTP id di22so16303606edb.12;
 Fri, 31 Jul 2020 17:13:08 -0700 (PDT)
X-Gm-Message-State: AOAM531V/hYLpWmCMTOst3eviPuXmGk1w3air5AjsK3DPwlZ3MFeJEZG
 0u9/5o5CuM0BjDCDYie4KczCklJZICzuEk4Qmg==
X-Google-Smtp-Source: ABdhPJwefFzeSQPuG9/zk5h5dJ0CnlevRnNRHabHnVcRCbp4uOMwHYFc8O2rJIMyRTAv+YG2GQmp5ufza+VEsIYo0t4=
X-Received: by 2002:a50:ccd0:: with SMTP id b16mr6220123edj.148.1596240787508; 
 Fri, 31 Jul 2020 17:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <1596010690-13178-1-git-send-email-neal.liu@mediatek.com>
 <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
In-Reply-To: <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 1 Aug 2020 08:12:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8aw=6E7bMJwz5jDLXUxYHpy9_Avbwc90osQGckzANNcg@mail.gmail.com>
Message-ID: <CAAOTY_8aw=6E7bMJwz5jDLXUxYHpy9_Avbwc90osQGckzANNcg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_201310_204005_FD4F6F9C 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpUaGlzIHBhdGNoIGlzIGZvciAibWVkaWF0ZWssbXQ2Nzc5LWRldmFwYyIsIHNv
IEkgdGhpbmsgY29tbWl0IHRpdGxlCnNob3VsZCBzaG93IHRoZSBTb0MgSUQuCgpOZWFsIExpdSA8
bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfmnIgyOeaXpSDpgLHkuIkg5LiL5Y2I
NDoyOeWvq+mBk++8mgo+Cj4gTWVkaWFUZWsgYnVzIGZhYnJpYyBwcm92aWRlcyBUcnVzdFpvbmUg
c2VjdXJpdHkgc3VwcG9ydCBhbmQgZGF0YQo+IHByb3RlY3Rpb24gdG8gcHJldmVudCBzbGF2ZXMg
ZnJvbSBiZWluZyBhY2Nlc3NlZCBieSB1bmV4cGVjdGVkCj4gbWFzdGVycy4KPiBUaGUgc2VjdXJp
dHkgdmlvbGF0aW9uIGlzIGxvZ2dlZCBhbmQgc2VudCB0byB0aGUgcHJvY2Vzc29yIGZvcgo+IGZ1
cnRoZXIgYW5hbHlzaXMgb3IgY291bnRlcm1lYXN1cmVzLgo+Cj4gQW55IG9jY3VycmVuY2Ugb2Yg
c2VjdXJpdHkgdmlvbGF0aW9uIHdvdWxkIHJhaXNlIGFuIGludGVycnVwdCwgYW5kCj4gaXQgd2ls
bCBiZSBoYW5kbGVkIGJ5IG10ay1kZXZhcGMgZHJpdmVyLiBUaGUgdmlvbGF0aW9uCj4gaW5mb3Jt
YXRpb24gaXMgcHJpbnRlZCBpbiBvcmRlciB0byBmaW5kIHRoZSBtdXJkZXJlci4KPgo+IFNpZ25l
ZC1vZmYtYnk6IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+Cj4gLS0tCgpbc25pcF0K
Cj4gKwo+ICtzdHJ1Y3QgbXRrX2RldmFwY19jb250ZXh0IHsKPiArICAgICAgIHN0cnVjdCBkZXZp
Y2UgKmRldjsKPiArICAgICAgIHUzMiB2aW9faWR4X251bTsKPiArICAgICAgIHZvaWQgX19pb21l
bSAqZGV2YXBjX3BkX2Jhc2U7Cj4gKyAgICAgICBzdHJ1Y3QgbXRrX2RldmFwY192aW9faW5mbyAq
dmlvX2luZm87Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX2RldmFwY19wZF9vZmZzZXQgKm9m
ZnNldDsKPiArICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZGV2YXBjX3Zpb19kYmdzICp2aW9fZGJn
czsKPiArfTsKCkkgdGhpbmsgdGhpcyBzdHJ1Y3R1cmUgc2hvdWxkIHNlcGFyYXRlIHRoZSBjb25z
dGFudCBwYXJ0LiBUaGUgY29uc3RhbnQgcGFydCBpczoKCnN0cnVjdCBtdGtfZGV2YXBjX2RhdGEg
ewogICAgY29uc3QgdTMyIHZpb19pZHhfbnVtOwogICAgY29uc3Qgc3RydWN0IG10a19kZXZhcGNf
cGRfb2Zmc2V0ICpvZmZzZXQ7IC8qIEkgd291bGQgbGlrZSB0bwpyZW1vdmUgc3RydWN0IG10a19k
ZXZhcGNfcGRfb2Zmc2V0IGFuZCBkaXJlY3RseSBwdXQgaXRzIG1lbWJlciBpbnRvCnRoaXMgc3Ry
dWN0dXJlICovCiAgICBjb25zdCBzdHJ1Y3QgbXRrX2RldmFwY192aW9fZGJncyAqdmlvX2RiZ3M7
IC8qIFRoaXMgbWF5IGRpc2FwcGVhciAqLwp9OwoKQW5kIHRoZSBjb250ZXh0IGlzOgoKc3RydWN0
IG10a19kZXZhcGNfY29udGV4dCB7CiAgICBzdHJ1Y3QgZGV2aWNlICpkZXY7CiAgICB2b2lkIF9f
aW9tZW0gKmRldmFwY19wZF9iYXNlOwogICAgY29uc3Qgc3RydWN0IG10a19kZXZhcGNfZGF0YSAq
ZGF0YTsKfTsKClNvIHdoZW4geW91IGRlZmluZSB0aGlzLCB5b3Ugd291bGQgbm90IHdhc3RlIG1l
bW9yeSB0byBzdG9yZSBub24tY29uc3RhbnQgZGF0YS4KCnN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRr
X2RldmFwY19kYXRhIGRldmFwY19tdDY3NzkgPSB7CiAudmlvX2lkeF9udW0gPSA1MTAsCiAub2Zm
c2V0ID0gJm10Njc3OV9wZF9vZmZzZXQsCiAudmlvX2RiZ3MgPSAmbXQ2Nzc5X3Zpb19kYmdzLAp9
OwoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gKwo+ICsjZW5kaWYgLyogX19NVEtfREVWQVBDX0hf
XyAqLwo+IC0tCj4gMS43LjkuNQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
