Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98283C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qRvqGHYz4+1K0bx0bfrq9P2bKnD0CkGU+9w01SmnQTg=; b=YApdLk8H1e5jhc
	P4c/dhW6ptmrtFW4HgyT/tuRYvTGpruv8DCoBqqFSx2Ed8nfsFHwGjfoGYdHNjmaC/yN5bAFOY8Kt
	BU5GSUGqLKnJCXZDf+vEuwtEO9WMYvb89owzV30ka7PQzbeNSD2gHFowc02Jri66gkJ9N2OpIhXsC
	IlAKY0CXiXQv3vIjqkqlGdZz32Q2K5CsPm2p596NlKcvUxL7/w1KNwDau14rrFDLxGQA3bfQ5zWF1
	hK+b3sS3BJQfQfTxtqW8SACP+Q8/UT4dAwlPw2goiyPGitLPH/1l5715AMGCqIsiEWfB7OIDVCvPt
	i44eHMIu2rRt0PJTB6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIAjR-00470G-RP; Thu, 10 Feb 2022 14:47:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIAjE-0046ul-Ax; Thu, 10 Feb 2022 14:47:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2C232B8256E;
 Thu, 10 Feb 2022 14:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB58C340F1;
 Thu, 10 Feb 2022 14:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644504440;
 bh=O3JOfPmpBwP/gmoNJ7OcEd8I9SFz30bb2+bBccRllQo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UG557PE0zKLLnOzvvt/XPxcYZtX2VYIeGz3rd+I50f5mCxayksCvm3SOIoREvUKDz
 yeqHjK1VhFBiHZLF+qPoeRhxg1qcRqUrL0klmNDz1o54X3PFsW5nISll9zhmP7nys0
 GzYRGHTit0QS+ZSuiqTvMz3Am3kgREsZaFhKgAuTT0NhojJBjzVEj3Jk7KTxi7FQRI
 xBFrokui8CvRxiAc3RoZcWSvUW5spHTQyYJlknePvkdBSORrdXhPpLYeFozH/0deBD
 N/Z4eElMKAqfBmseWEctG1HPJeeH2gHgsenDcApGh8IxivUeZ9yD4PLelHZpFA1mz6
 XCWVFLLNt6Riw==
Received: by mail-ed1-f48.google.com with SMTP id s7so11379993edd.3;
 Thu, 10 Feb 2022 06:47:20 -0800 (PST)
X-Gm-Message-State: AOAM5307KANDY0goiIi1hnLkNvs/vJNR+TwCL6CB6wVjl38sjnhpoeIp
 esoz5cWvZPxNLntPKAReMsDBVi53uYTUOymd+g==
X-Google-Smtp-Source: ABdhPJxpwUZeJ0qluZsLz3I68UmvPC5zgdCoTcIEq2Zdeqtnc4dwKsGWjpYJoB+Qs4sdmpTJIWsWCoOUl8JTom8pf4k=
X-Received: by 2002:aa7:c418:: with SMTP id j24mr8683068edq.451.1644504438640; 
 Thu, 10 Feb 2022 06:47:18 -0800 (PST)
MIME-Version: 1.0
References: <20220210124638.2330904-1-jstephan@baylibre.com>
In-Reply-To: <20220210124638.2330904-1-jstephan@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 10 Feb 2022 22:47:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY__gw5GZT3+=R4CiaVX=DTRGTs2vtOvXxV6v+tw7LwnU2g@mail.gmail.com>
Message-ID: <CAAOTY__gw5GZT3+=R4CiaVX=DTRGTs2vtOvXxV6v+tw7LwnU2g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: allow commands to be sent during video
 mode
To: Julien STEPHAN <jstephan@baylibre.com>
Cc: CK Hu <ck.hu@mediatek.com>, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>, 
 "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_064724_735225_8E80BEC9 
X-CRM114-Status: GOOD (  23.52  )
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

SGksIEp1bGllbjoKCkp1bGllbiBTVEVQSEFOIDxqc3RlcGhhbkBiYXlsaWJyZS5jb20+IOaWvCAy
MDIy5bm0MuaciDEw5pelIOmAseWbmyDkuIvljYg4OjQ35a+r6YGT77yaCj4KPiBNaXBpIGRzaSBw
YW5lbCBkcml2ZXJzIGNhbiB1c2UgbWlwaV9kc2lfZGNzX3tzZXQsZ2V0fV9kaXNwbGF5X2JyaWdo
dG5lc3MoKQo+IHRvIHJlcXVlc3QgYmFja2xpZ2h0IGNoYW5nZXMuCj4KPiBUaGlzIGNhbiBiZSBk
b25lIGR1cmluZyBwYW5lbCBpbml0aWFsaXphdGlvbiAoZHNpIGlzIGluIGNvbW1hbmQgbW9kZSkK
PiBvciBhZnRlcndhcmRzIChkc2kgaXMgaW4gVmlkZW8gTW9kZSkuCj4KPiBXaGVuIHRoZSBEU0kg
aXMgaW4gVmlkZW8gTW9kZSwgYWxsIGNvbW1hbmRzIGFyZSByZWplY3RlZC4KPgo+IERldGVjdCBj
dXJyZW50IERTSSBtb2RlIGluIG10a19kc2lfaG9zdF90cmFuc2ZlcigpIGFuZCBzd2l0Y2ggbW9k
ZXMKPiB0ZW1wb3JhcmlseSB0byBhbGxvdyBjb21tYW5kcyB0byBiZSBzZW50LgoKUmV2aWV3ZWQt
Ynk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBTVEVQSEFOIDxqc3RlcGhhbkBiYXlsaWJyZS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogTWF0dGlqcyBLb3JwZXJzaG9layA8bWtvcnBlcnNob2VrQGJheWxpYnJlLmNvbT4KPiAt
LS0KPiBDaGFuZ2VzIGluIHYyOgo+ICAgLSB1cGRhdGUgY29tbWl0IG1lc3NhZ2UgdG8gYmUgbW9y
ZSBkZXNjcmlwdGl2ZQo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgfCAz
NCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI1IGlu
c2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMKPiBpbmRleCA1ZDkwZDJlYjAwMTkuLjdkNjZmZGM3ZjgxZCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kc2kuYwo+IEBAIC04OTEsMjQgKzg5MSwzNCBAQCBzdGF0aWMgc3NpemVfdCBt
dGtfZHNpX2hvc3RfdHJhbnNmZXIoc3RydWN0IG1pcGlfZHNpX2hvc3QgKmhvc3QsCj4gICAgICAg
ICB1OCByZWFkX2RhdGFbMTZdOwo+ICAgICAgICAgdm9pZCAqc3JjX2FkZHI7Cj4gICAgICAgICB1
OCBpcnFfZmxhZyA9IENNRF9ET05FX0lOVF9GTEFHOwo+IC0KPiAtICAgICAgIGlmIChyZWFkbChk
c2ktPnJlZ3MgKyBEU0lfTU9ERV9DVFJMKSAmIE1PREUpIHsKPiAtICAgICAgICAgICAgICAgRFJN
X0VSUk9SKCJkc2kgZW5naW5lIGlzIG5vdCBjb21tYW5kIG1vZGVcbiIpOwo+IC0gICAgICAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgIHUzMiBkc2lfbW9kZTsKPiArCj4gKyAgICAg
ICBkc2lfbW9kZSA9IHJlYWRsKGRzaS0+cmVncyArIERTSV9NT0RFX0NUUkwpOwo+ICsgICAgICAg
aWYgKGRzaV9tb2RlICYgTU9ERSkgewo+ICsgICAgICAgICAgICAgICBtdGtfZHNpX3N0b3AoZHNp
KTsKPiArICAgICAgICAgICAgICAgaWYgKG10a19kc2lfc3dpdGNoX3RvX2NtZF9tb2RlKGRzaSwg
Vk1fRE9ORV9JTlRfRkxBRywgNTAwKSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlY3Zf
Y250ID0gLUVJTlZBTDsKPiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHJlc3RvcmVfZHNp
X21vZGU7Cj4gKyAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPgo+ICAgICAgICAgaWYgKE1U
S19EU0lfSE9TVF9JU19SRUFEKG1zZy0+dHlwZSkpCj4gICAgICAgICAgICAgICAgIGlycV9mbGFn
IHw9IExQUlhfUkRfUkRZX0lOVF9GTEFHOwo+Cj4gLSAgICAgICBpZiAobXRrX2RzaV9ob3N0X3Nl
bmRfY21kKGRzaSwgbXNnLCBpcnFfZmxhZykgPCAwKQo+IC0gICAgICAgICAgICAgICByZXR1cm4g
LUVUSU1FOwo+ICsgICAgICAgaWYgKG10a19kc2lfaG9zdF9zZW5kX2NtZChkc2ksIG1zZywgaXJx
X2ZsYWcpIDwgMCkgewo+ICsgICAgICAgICAgICAgICByZWN2X2NudCA9IC1FVElNRTsKPiArICAg
ICAgICAgICAgICAgZ290byByZXN0b3JlX2RzaV9tb2RlOwo+ICsgICAgICAgfQo+Cj4gLSAgICAg
ICBpZiAoIU1US19EU0lfSE9TVF9JU19SRUFEKG1zZy0+dHlwZSkpCj4gLSAgICAgICAgICAgICAg
IHJldHVybiAwOwo+ICsgICAgICAgaWYgKCFNVEtfRFNJX0hPU1RfSVNfUkVBRChtc2ctPnR5cGUp
KSB7Cj4gKyAgICAgICAgICAgICAgIHJlY3ZfY250ID0gMDsKPiArICAgICAgICAgICAgICAgZ290
byByZXN0b3JlX2RzaV9tb2RlOwo+ICsgICAgICAgfQo+Cj4gICAgICAgICBpZiAoIW1zZy0+cnhf
YnVmKSB7Cj4gICAgICAgICAgICAgICAgIERSTV9FUlJPUigiZHNpIHJlY2VpdmUgYnVmZmVyIHNp
emUgbWF5IGJlIE5VTExcbiIpOwo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAr
ICAgICAgICAgICAgICAgcmVjdl9jbnQgPSAtRUlOVkFMOwo+ICsgICAgICAgICAgICAgICBnb3Rv
IHJlc3RvcmVfZHNpX21vZGU7Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIGZvciAoaSA9IDA7IGkg
PCAxNjsgaSsrKQo+IEBAIC05MzMsNiArOTQzLDEyIEBAIHN0YXRpYyBzc2l6ZV90IG10a19kc2lf
aG9zdF90cmFuc2ZlcihzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAqaG9zdCwKPiAgICAgICAgIERSTV9J
TkZPKCJkc2kgZ2V0ICVkIGJ5dGUgZGF0YSBmcm9tIHRoZSBwYW5lbCBhZGRyZXNzKDB4JXgpXG4i
LAo+ICAgICAgICAgICAgICAgICAgcmVjdl9jbnQsICooKHU4ICopKG1zZy0+dHhfYnVmKSkpOwo+
Cj4gK3Jlc3RvcmVfZHNpX21vZGU6Cj4gKyAgICAgICBpZiAoZHNpX21vZGUgJiBNT0RFKSB7Cj4g
KyAgICAgICAgICAgICAgIG10a19kc2lfc2V0X21vZGUoZHNpKTsKPiArICAgICAgICAgICAgICAg
bXRrX2RzaV9zdGFydChkc2kpOwo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIHJldHVybiByZWN2
X2NudDsKPiAgfQo+Cj4gLS0KPiAyLjM1LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
