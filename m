Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B52AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 20:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HE37XNKgzeh+FYXRVQJzdlHuss3WlnqLSppF3Iv3UY=; b=nanbVt7opSA6E+
	2IVNnJdwemAHrgXGUyGLnDrd/oga9wsB6DwSN4I08Dxc217AjApodXp8JBD0w0gQiTIiTDk0KTIJb
	sEbD3i7S+YXMm8NmWeaGACePXQb3EgEE9MrWb6JjxJETho3RWI6RpmStlqlua7oeI6udk8CKOuC9k
	nUdvFm1YQiLKSLfsOBEq68PvNZrtx5PJAvezt1QZ7sDf5gWi5m8EYKl6DFyHSTdCAMbS3XPBbM4xC
	mL/UnisWDalBGv7h30SxabKhRwYNJ4eVXkSIzjMY8CRKTJtGIH0YHTEB229YPCMUMnRIRI3ZqgQ6c
	MYHGLjW+40jxw7vGOKug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwrUk-004FRA-SU; Thu, 02 Jun 2022 20:32:38 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwrUZ-004FPh-JS; Thu, 02 Jun 2022 20:32:29 +0000
Received: by mail-pg1-x543.google.com with SMTP id 129so5681575pgc.2;
        Thu, 02 Jun 2022 13:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Kb/EgUnEl+66ubR0OBdnZBhP1OFKsT5B/tkrmGF5yWM=;
        b=NkE0Ee2nKeVG01X4TGf7Tds/HpDebAAGIAaGwKYQebrpvg7ak4oaNFBWIPs3Xdbx/6
         /ueM/g2UgL33WPhvSE1L6JXOWT5chkMdkpBYr1/zYN99/wpvyMYpmPhA1oytFSuRvYuV
         PNVqn/U5agKa+qIWBAIGEorsNvVDKBWugZg900PvAoG9Qmtwztu7xfeAcVkvqkOl0WYL
         cOZn4F9+0NeUducPaMA2Z6OZ8Mng1gwTUzPg03BP8mG4yWhRQRsi/9O5/gtaqrHqD4Bg
         4OA13xXtBNtUEnlW2r45PUnCTtuMdwsf1kr3gPJWnFj4wDmdBPTRZoNV0p1ETDx5FzvG
         2rSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Kb/EgUnEl+66ubR0OBdnZBhP1OFKsT5B/tkrmGF5yWM=;
        b=dUsMDaPaZhmNa4H9XM2d8mGutOOZ1jmGLtMgipnfLIa/Z8fU+3hOmoS93Xvmowq/g0
         AAGiZScRP4KXvSmx609AQg445VaC36EU6nyZTvAm4TteLNRpHnSSn4v69kgjAcY3VD8q
         helzCbjJcUBtM4rKYD6cTX/KmX8lRIczjqnpNZQMYIrCZ7zJFfArSaHC92r30h5D8EM9
         SHJTZ0aAi7n+s8cOGZjp44kp9jNQhlVujQTUH/zO9Ji4JOBN7cLOSxGmvLjBBu1WiDQl
         Ef9E/5pJyusP+wE1T3ZhxEW1fWdQFEihIjN1GfzYygt7z4CPIW0mMY9PaMNeaVexAmId
         GsWA==
X-Gm-Message-State: AOAM530L323nwf9Va8e0BTza/3AaMu/A58lp+kjfyC+ejBG5mrk6+Cb6
	li3NYODaO5XFJAn8/aURSgNNwLKIlxcXFI1j8ik+6kG/Gsw=
X-Google-Smtp-Source: ABdhPJys4WOb9urNyLdt4aeuOqGuCZdLw80FNC5PvFsBXte5r8ULYu9Wjjuq4Wzf+sPQ6VLvykCW8T4PAgm77gNu2zY=
X-Received: by 2002:a05:6e02:4a1:b0:2d3:a778:f0f1 with SMTP id
 e1-20020a056e0204a100b002d3a778f0f1mr3986818ils.212.1654194896902; Thu, 02
 Jun 2022 11:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220531104211.17106-1-peterwu.pub@gmail.com> <20220531104211.17106-2-peterwu.pub@gmail.com>
 <33a797d7-ca60-5153-2ba1-3a909fcc5965@linaro.org>
In-Reply-To: <33a797d7-ca60-5153-2ba1-3a909fcc5965@linaro.org>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 3 Jun 2022 02:34:45 +0800
Message-ID: <CABtFH5+nNRn4azfniKCNc=S2Z2Y0jji_beA_16_UYzAvkak-VA@mail.gmail.com>
Subject: Re: [PATCH 10/14] dt-bindings: power: supply: Add Mediatek MT6370
 Charger binding documentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
	pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com, 
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de, 
	lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com, deller@gmx.de, 
	ChiYuan Huang <cy_huang@richtek.com>, alice_chen@richtek.com, chiaen_wu@richtek.com, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_133227_672121_1649BEE2 
X-CRM114-Status: GOOD (  24.63  )
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

SGkgS3J6eXN6dG9mLAoKVGhhbmsgeW91IGZvciB0aGUgdmFsdWFibGUgc3VnZ2VzdGlvbi4KU29y
cnkgZm9yIHNlbmRpbmcgdGhlIHNhbWUgZW1haWwgYWdhaW4uIEkgZm9yZ290IHRvIHJlcGx5IHRv
IGV2ZXJ5b25lCmluIG15IGxhc3QgZW1haWwuLgoKS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6
dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiDmlrwgMjAyMuW5tDbmnIgx5pelIOmAseS4iSDkuIrl
jYg0OjE15a+r6YGT77yaCj4KPiBPbiAzMS8wNS8yMDIyIDEyOjQyLCBDaGlhRW4gV3Ugd3JvdGU6
Cj4gPiBGcm9tOiBDaGlhRW4gV3UgPGNoaWFlbl93dUByaWNodGVrLmNvbT4KPiA+Cj4KPiBTdWJq
ZWN0IC0gcmVtb3ZlICJiaW5kaW5nIGRvY3VtZW50YXRpb24iLiBJdCdzIGFscmVhZHkgaW1wbGll
ZCBieSBwcmVmaXguCj4KPiA+IEFkZCBNZWRpYXRlayBNVDYzNzAgQ2hhcmdlciBiaW5kaW5nIGRv
Y3VtZW50YXRpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hpYUVuIFd1IDxjaGlhZW5fd3VA
cmljaHRlay5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vcG93ZXIvc3VwcGx5L21lZGlhdGVrLG10NjM3
MC1jaGFyZ2VyLnlhbWwgfCA2MCArKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDYwIGluc2VydGlvbnMoKykKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3N1cHBseS9tZWRpYXRlayxtdDYzNzAtY2hhcmdl
ci55YW1sCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wb3dlci9zdXBwbHkvbWVkaWF0ZWssbXQ2MzcwLWNoYXJnZXIueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9zdXBwbHkvbWVkaWF0ZWssbXQ2MzcwLWNo
YXJnZXIueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAw
MC4uOWQ1YzQ0ODdjYTljCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvc3VwcGx5L21lZGlhdGVrLG10NjM3MC1jaGFyZ2Vy
LnlhbWwKPiA+IEBAIC0wLDAgKzEsNjAgQEAKPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ICslWUFNTCAxLjIKPiA+ICstLS0K
PiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3Bvd2VyL3N1cHBseS9tZWRp
YXRlayxtdDYzNzAtY2hhcmdlci55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBNZWRpYXRlayBN
VDYzNzAgQmF0dGVyeSBDaGFyZ2VyCj4gPiArCj4gPiArbWFpbnRhaW5lcnM6Cj4gPiArICAtIENo
aWFFbiBXdSA8Y2hpYWVuX3d1QHJpY2h0ZWsuY29tPgo+ID4gKwo+ID4gK2Rlc2NyaXB0aW9uOiB8
Cj4gPiArICBUaGlzIG1vZHVsZSBpcyBwYXJ0IG9mIHRoZSBNVDYzNzAgTUZEIGRldmljZS4KPiA+
ICsgIFByb3ZpZGVzIEJhdHRlcnkgQ2hhcmdlciwgQm9vc3QgZm9yIE9URyBkZXZpY2VzIGFuZCBC
QzEuMiBkZXRlY3Rpb24uCj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGlibGU6
Cj4gPiArICAgIGNvbnN0OiBtZWRpYXRlayxtdDYzNzAtY2hhcmdlcgo+ID4gKwo+ID4gKyAgaW50
ZXJydXB0czoKPiA+ICsgICAgZGVzY3JpcHRpb246IHwKPiA+ICsgICAgICBTcGVjaWZ5IHdoYXQg
aXJxcyBhcmUgbmVlZGVkIHRvIGJlIGhhbmRsZWQgYnkgTVQ2MzcwIENoYXJnZXIgZHJpdmVyLiBJ
UlEKPiA+ICsgICAgICAiTVQ2MzcwX0lSUV9DSEdfTUlWUiIsICJNVDYzNzBfSVJRX0FUVEFDSCIg
YW5kICJNVDYzNzBfSVJRX09WUENUUkxfVVZQX0QiCj4gPiArICAgICAgYXJlIHJlcXVpcmVkLgo+
ID4gKyAgICBpdGVtczoKPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBCQzEuMiBkb25lIGlycSBm
b3IgbXQ2MzcwIGNoYXJnZXIKPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiB1c2IgcGx1ZyBpbiBp
cnEgZm9yIG10NjM3MCBjaGFyZ2VyCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogbWl2ciBpcnEg
Zm9yIG10NjM3MCBjaGFyZ2VyCj4KPiBzL2ZvciBtdDYzNzAgY2hhcmdlci8vCj4gaW4gZWFjaCBp
dGVtCgpJIGdvdCBpdCwgdGhpcyB3aWxsIGJlIHJlZmluZWQgaW4gdGhlIG5leHQgdmVyc2lvbi4g
VGhhbmtzIQoKPgo+ID4gKwo+ID4gKyAgaW50ZXJydXB0LW5hbWVzOgo+ID4gKyAgICBpdGVtczoK
PiA+ICsgICAgICAtIGNvbnN0OiBhdHRhY2hfaQo+ID4gKyAgICAgIC0gY29uc3Q6IHV2cF9kX2V2
dAo+ID4gKyAgICAgIC0gY29uc3Q6IG1pdnIKPiA+ICsKPiA+ICsgIGlvLWNoYW5uZWxzOgo+ID4g
KyAgICBkZXNjcmlwdGlvbjogfAo+ID4gKyAgICAgIFVzZSBBREMgY2hhbm5lbCB0byByZWFkIHZi
dXMsIGlidXMsIGliYXQsIGV0Yy4sIGluZm8uIElidXMgQURDIGNoYW5uZWwKPiA+ICsgICAgICBp
cyByZXF1aXJlZC4KPgo+IENvbnN0cmFpbnRzIChlLmcuIG1heEl0ZW1zKSBhcmUgbmVlZGVkLgoK
T0ssIEkgd2lsbCBhZGQgdGhlbSBpbiB0aGUgbmV3IHZlcnNpb24hCgo+Cj4gPiArCj4gPiArICB1
c2Itb3RnLXZidXM6Cj4KPiBMZXQncyBrZWVwIHRoZSBzYW1lIG5hbWUgYXMgaW4gTVQ2MzYwOgo+
Cj4gdXNiLW90Zy12YnVzLXJlZ3VsYXRvcgoKSSdsbCBjaGFuZ2UgdGhlIG5hbWUgdG8gY29ycmVz
cG9uZCB3aXRoIE1UNjM2MCBpbiB0aGUgbmV4dCBwYXRjaCwgdGhhbmtzIQoKPiA+ICsgICAgdHlw
ZTogb2JqZWN0Cj4gPiArICAgIGRlc2NyaXB0aW9uOiBPVEcgYm9vc3QgcmVndWxhdG9yLgo+ID4g
KyAgICAkcmVmOiAvc2NoZW1hcy9yZWd1bGF0b3IvcmVndWxhdG9yLnlhbWwjCj4gPiArCj4gPiAr
ICAgIHByb3BlcnRpZXM6Cj4gPiArICAgICAgZW5hYmxlLWdwaW86Cj4gPiArICAgICAgICBtYXhJ
dGVtczogMQo+ID4gKyAgICAgICAgZGVzY3JpcHRpb246IHwKPiA+ICsgICAgICAgICAgU3BlY2lm
eSBhIHZhbGlkICdlbmFibGUnIGdwaW8gZm9yIHRoZSByZWd1bGF0b3IgYW5kIGl0J3Mgb3B0aW9u
YWwKPgo+IFRoaXMgZGVzY3JpcHRpb24gaXMgcG9pbnRsZXNzIC0gZG9lcyBub3QgYnJpbmcgYW55
IG1vcmUgaW5mb3JtYXRpb24uIFlvdQo+IHJlcGVhdCB0aGUgc2NoZW1hLiBQbGVhc2UsIGF2b2lk
IHN1Y2ggZGVzY3JpcHRpb25zLgoKSSBnb3QgaXQsIEkgd2lsbCByZW1vdmUgdGhlbSBpbiB0aGUg
bmV4dCBwYXRjaC4KCj4KPiA+ICsKPiA+ICtyZXF1aXJlZDoKPiA+ICsgIC0gY29tcGF0aWJsZQo+
ID4gKyAgLSBpbnRlcnJ1cHRzCj4gPiArICAtIGludGVycnVwdC1uYW1lcwo+ID4gKyAgLSBpby1j
aGFubmVscwo+ID4gKwo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+Cj4KPiBIb3cg
YWJvdXQgZXhhbXBsZT8gT3IgaXMgaXQgZ29pbmcgdG8gYmUgaW4gTUZEIHNjaGVtYT8KCkFsbCBv
ZiBNVDYzNzAgYmluZGluZyBkb2N1bWVudGF0aW9uIGV4YW1wbGVzIGFyZSBpbiB0aGUgTUZEIHNj
aGVtYSEgVGhhbmtzLgoKPgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKQmVzdCByZWdh
cmRzLApDaGlhRW4gV3UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
