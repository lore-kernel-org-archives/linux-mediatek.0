Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A85EC11F66
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 22:49:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2019761443
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 22:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2019761443
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLSRt89RVnaCCzaTT2qP7K736n9OghoQ+8Gxyf1MXvo=; b=FzNjD3GdlpbUVk
	mFntIKy/S0QYYxCuoBoEFSnjb+J4YfJT2M+7ChvDycEEqQFlgOf23bp9NTWmz+a0udtlXRcTIfcMM
	jZjYAEJEA56dOua9JIsd2ZuckmEV1Zjdu6JbAqOxW5yEaAsVrcHPawdXQ4Wed/BjNEZ0YKELs7Ij+
	WmbgPgP9jAQcdWhlvP/f20ztO89Jh3aWeY3HN1fAxsJtjWSAwZGb7yaIdKoJoBwEpyrNFQT+YGTVe
	HXyCPtD/J9VW7Tj7wxYzAd83fHNzotP7GYAIbuP5yYNn20UfDMoswuda2yRDKbnEFogmCGIbW26yj
	cJIn8dEKhxJ56jgsbUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyj12-00FRZD-Jo; Wed, 30 Jun 2021 22:49:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyj0p-00FRXZ-I2; Wed, 30 Jun 2021 22:48:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 04F356144D;
 Wed, 30 Jun 2021 22:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625093335;
 bh=K5tqVnA5H8pJjO/PErp+ucNJUcozi2NUBIMqh7jU9cg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ff0mncC0JZQqsxNHNmEAQ391wV4s4XXHPtCqgygDCXq6MtkEmYk5aqfAGBX/WwxMh
 wyRe44IuixO2+cwRv7idWkhfbXcdONQOV9QASQfYKUroKnwoKqGVWzcKq9/9DdKQji
 /mv5L95v85w+DItOsSdI/oqWj4937RuBEf+UORRPp6mEEAPjc+q5xUVf1meRR3gpFB
 QlSUxCFj9pxRZ1sjPishkDebNZmFNJ5h3de7WMa+WisBiGQK+m31yTLGilcl9xw/RZ
 6YMerLOmKTJjP53koTfuPkjVW4eIEVrAlTa/EgV/ERV+r/HZ2axbeAAZRlRKupLRvT
 4K+6eioQL+qqA==
Received: by mail-ej1-f44.google.com with SMTP id c17so6927149ejk.13;
 Wed, 30 Jun 2021 15:48:54 -0700 (PDT)
X-Gm-Message-State: AOAM5331IAC+sHyPmkaTuUfLNBPhfSoUJdMHG1wVT7IJqal0KK7npJYd
 j9/PbIhxr5PuNLQF8WFg40NFNHRNBmejQyn0yA==
X-Google-Smtp-Source: ABdhPJzv+vxWlKKUY48KvGgu+sCcmFtxKd8ufDpE3mMFjf3babtLW/Uip0aRn9nBtqlbe5jpH6U/4LTeK9Al6Qe1vJo=
X-Received: by 2002:a17:906:680f:: with SMTP id
 k15mr36868137ejr.75.1625093333492; 
 Wed, 30 Jun 2021 15:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210630144646.868702-1-enric.balletbo@collabora.com>
 <20210630164623.3.I7bd7d9a8da5e2894711b700a1127e6902a2b2f1d@changeid>
In-Reply-To: <20210630164623.3.I7bd7d9a8da5e2894711b700a1127e6902a2b2f1d@changeid>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 1 Jul 2021 06:48:42 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-VAvKCkBj1q4euWFcmbnNUJfXpG9rh9vua80yrok-y9w@mail.gmail.com>
Message-ID: <CAAOTY_-VAvKCkBj1q4euWFcmbnNUJfXpG9rh9vua80yrok-y9w@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: mt8173: Add the mmsys reset bit to reset
 the dsi0
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Nicolas Boichat <drinkcat@chromium.org>, Eizan Miyamoto <eizan@chromium.org>, 
 Collabora Kernel ML <kernel@collabora.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_154855_674710_FE4CEFCE 
X-CRM114-Status: GOOD (  14.61  )
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

SEksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjHlubQ25pyIMzDml6Ug6YCx5LiJIOS4i+WNiDEwOjQ35a+r6YGT77ya
Cj4KPiBSZXNldCB0aGUgRFNJIGhhcmR3YXJlIGlzIG5lZWRlZCB0byBwcmV2ZW50IGRpZmZlcmVu
dCBzZXR0aW5ncyBiZXR3ZWVuCj4gdGhlIGJvb3Rsb2FkZXIgYW5kIHRoZSBrZXJuZWwuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xs
YWJvcmEuY29tPgo+IC0tLQo+Cj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTcz
LmR0c2kgIHwgMiArKwo+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L210ODE3My1yZXNldHMu
aCB8IDIgKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNpIGIvYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaQo+IGluZGV4IGU1NTk2ZmUwMWExZC4uMzZj
Mzk5OGViN2YxIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4
MTczLmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My5kdHNp
Cj4gQEAgLTEwMzYsNiArMTAzNiw3IEBAIG1tc3lzOiBzeXNjb25AMTQwMDAwMDAgewo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIGFzc2lnbmVkLWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9N
TV9TRUw+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIGFzc2lnbmVkLWNsb2NrLXJhdGVzID0g
PDQwMDAwMDAwMD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDE+
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICNyZXNldC1jZWxscyA9IDwxPjsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICBtYm94ZXMgPSA8JmdjZSAwIENNRFFfVEhSX1BSSU9fSElHSEVTVD4s
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZnY2UgMSBDTURRX1RIUl9QUklP
X0hJR0hFU1Q+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIG1lZGlhdGVrLGdjZS1jbGllbnQt
cmVnID0gPCZnY2UgU1VCU1lTXzE0MDBYWFhYIDAgMHgxMDAwPjsKPiBAQCAtMTI2Miw2ICsxMjYz
LDcgQEAgZHNpMDogZHNpQDE0MDFiMDAwIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8Jm1tc3lzIENMS19NTV9EU0kwX0RJR0lUQUw+LAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDwmbWlwaV90eDA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNsb2Nr
LW5hbWVzID0gImVuZ2luZSIsICJkaWdpdGFsIiwgImhzIjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICByZXNldHMgPSA8Jm1tc3lzIE1UODE3M19NTVNZU19TVzBfUlNUX0JfRElTUF9EU0kwPjsK
CkFkZCB0aGlzIGluIGJpbmRpbmcgZG9jdW1lbnQuIEl0IHdvdWxkIGJlIGdvb2QgaWYgdGhlIGJp
bmRpbmcgZG9jdW1lbnQKaXMgaW4geWFtbCBmb3JtYXQuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoK
PiAgICAgICAgICAgICAgICAgICAgICAgICBwaHlzID0gPCZtaXBpX3R4MD47Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgcGh5LW5hbWVzID0gImRwaHkiOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGlu
Z3MvcmVzZXQvbXQ4MTczLXJlc2V0cy5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgx
NzMtcmVzZXRzLmgKPiBpbmRleCBiYTg2MzZlZGE1YWUuLjZhNjBjN2NlY2M0YyAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L210ODE3My1yZXNldHMuaAo+ICsrKyBiL2lu
Y2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTczLXJlc2V0cy5oCj4gQEAgLTI3LDYgKzI3LDgg
QEAKPiAgI2RlZmluZSBNVDgxNzNfSU5GUkFfR0NFX0ZBWElfUlNUICAgICAgIDQwCj4gICNkZWZp
bmUgTVQ4MTczX0lORlJBX01NSU9NTVVSU1QgICAgICAgICA0Nwo+Cj4gKy8qIE1NU1lTIHJlc2V0
cyAqLwo+ICsjZGVmaW5lIE1UODE3M19NTVNZU19TVzBfUlNUX0JfRElTUF9EU0kwICAgICAgIDI1
Cj4KPiAgLyogIFBFUklDRkcgcmVzZXRzICovCj4gICNkZWZpbmUgTVQ4MTczX1BFUklfVUFSVDBf
U1dfUlNUICAgICAgICAwCj4gLS0KPiAyLjMwLjIKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
