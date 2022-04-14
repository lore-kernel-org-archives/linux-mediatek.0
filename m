Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1116C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 01:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIYA1xdA5nRRE0K3Qk+/Hhf8o99r75nyssRfpJ7uxl4=; b=R8IqBkrBMpzMgD
	KnSO65qPHBglULtcIxVsm+VLsrBsHAIxTzXBJ+yXYLqzH+t6sRDmzCmhiSj56RDE7BPhYU/k9jOeX
	fwYCF8gvJPMVqXmU6HZAJOaeNXXisUfKB01Qqex+Hkzwqx8aasWtD6uI+XnQYJ3xaTQnLoq1kUk50
	4Y4SzprHYAUTTUoD9mNIGssCPBhetTjtF7Levx9d4GAPVp5VpNa/I+HZzTwGK6HmyEiV/wbrrINM9
	wLEYJfjwULO8AbkJoA+Cb7hO51GUDIM2oMmUaH6ye5sK/4I9j7pPjnfL5UqkVHhm2SOzIVkRRH5yz
	phjTFX8uJZ/LBi830vcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neofo-003Lrj-CE; Thu, 14 Apr 2022 01:53:28 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neofb-003Lom-St; Thu, 14 Apr 2022 01:53:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649901172; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=bHZeQVx3jN/0wqWfKct9TVkWDEcH+rjxGHeM8N+jHNXvYp6dZCkiYT+4xsgi/M6zk2/5/F8Gbb8iGtqVcnoS7QlRKYBbCk8EcHk7iMo3k5Q/F+SNWrWf8E5Mxk9baVJYgmvz02mx2FzV4oWRYLo/bSk01LYObJsfkq3qjcRxrTg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649901172;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=0xSGVUhPZgbHPwFpu89X2W24g/jYetTI1SnOG7J0k5Q=; 
 b=ILB/ySvWfxHiIPL83uUkzbN8L/mTJgBOejD3WRxH3mJN3jVDzNnv/VWUdXP+HquPTa5qleBfxgX6rW7KHijHVxh/3jeddiw9NqTNhl1YrLC3KwxhINwMBflnbI8sbyCEdUwm6AjItoCOQvnxlRktb3nxmk2LKFkMwHlvpm72oc8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649901172; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=0xSGVUhPZgbHPwFpu89X2W24g/jYetTI1SnOG7J0k5Q=;
 b=YUrfkzFvJtEXiXaFmuqIesisz2N7XAQ47Y8mWmLX0uNtY6ey2bE5ketmWQrjAmsg
 BS913aoLOTbtOLVY73+hsdm+aD+ihx/W3yFSch0hfxqFIfTVPKQ3yCOMzOPMBsCtivx
 UUbfiHkTr7wtIXKp0l415ajJXf8zHBP/TxyYFa+A=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649901171025892.4263236824818;
 Wed, 13 Apr 2022 18:52:51 -0700 (PDT)
Message-ID: <0dd1da16-232b-d634-3146-bf91e58c9543@arinc9.com>
Date: Thu, 14 Apr 2022 04:52:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 11/14] dt-bindings: pinctrl: add binding for Ralink MT7620
 pinctrl
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: erkin.bozoglu@xeront.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <20220413060729.27639-12-arinc.unal@arinc9.com>
 <41fa58ee-728b-7f0d-eea7-448c59641d85@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <41fa58ee-728b-7f0d-eea7-448c59641d85@linaro.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_185316_031317_E13FFC77 
X-CRM114-Status: GOOD (  16.29  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMTMvMDQvMjAyMiAxODozNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxMy8w
NC8yMDIyIDA4OjA3LCBBcsSxbsOnIMOcTkFMIHdyb3RlOgo+PiBBZGQgYmluZGluZyBmb3IgdGhl
IFJhbGluayBNVDc2MjAgcGluIGNvbnRyb2xsZXIgZm9yIE1UNzYyMCwgTVQ3NjI4IGFuZAo+PiBN
VDc2ODggU29Dcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5h
bEBhcmluYzkuY29tPgo+PiAtLS0KPj4gICAuLi4vcGluY3RybC9yYWxpbmssbXQ3NjIwLXBpbmN0
cmwueWFtbCAgICAgICAgfCA4NyArKysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDg3IGluc2VydGlvbnMoKykKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLG10NzYyMC1waW5jdHJsLnlhbWwK
Pj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5j
dHJsL3JhbGluayxtdDc2MjAtcGluY3RybC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLG10NzYyMC1waW5jdHJsLnlhbWwKPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wMTU3OGI4YWEyNzcKPj4gLS0tIC9k
ZXYvbnVsbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3Ry
bC9yYWxpbmssbXQ3NjIwLXBpbmN0cmwueWFtbAo+PiBAQCAtMCwwICsxLDg3IEBACj4+ICsjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCj4+ICsl
WUFNTCAxLjIKPj4gKy0tLQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9w
aW5jdHJsL3JhbGluayxtdDc2MjAtcGluY3RybC55YW1sIwo+PiArJHNjaGVtYTogaHR0cDovL2Rl
dmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+ICsKPj4gK3RpdGxlOiBSYWxp
bmsgTVQ3NjIwIFBpbiBDb250cm9sbGVyCj4+ICsKPj4gK21haW50YWluZXJzOgo+PiArICAtIEFy
xLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KPj4gKyAgLSBTZXJnaW8gUGFyYWN1
ZWxsb3MgPHNlcmdpby5wYXJhY3VlbGxvc0BnbWFpbC5jb20+Cj4+ICsKPj4gK2Rlc2NyaXB0aW9u
Ogo+PiArICBSYWxpbmsgTVQ3NjIwIHBpbiBjb250cm9sbGVyIGZvciBNVDc2MjAsIE1UNzYyOCBh
bmQgTVQ3Njg4IFNvQ3MuCj4+ICsgIFRoZSBwaW4gY29udHJvbGxlciBjYW4gb25seSBzZXQgdGhl
IG11eGluZyBvZiBwaW4gZ3JvdXBzLiBNdXhpbmcgaW5kaXZpdWFsIHBpbnMKPiAKPiBSdW4gc3Bl
bGxjaGVjayBvbiBvcmlnaW5hbCBiaW5kaW5ncywgZG9uJ3QgY29weSBzYW1lIHR5cG9zLgoKV2ls
bCBhZGRyZXNzLCB0aGFua3MhCgo+IAo+PiArICBpcyBub3Qgc3VwcG9ydGVkLiBUaGVyZSBpcyBu
byBwaW5jb25mIHN1cHBvcnQuCj4+ICsKPj4gK3Byb3BlcnRpZXM6Cj4+ICsgIGNvbXBhdGlibGU6
Cj4+ICsgICAgY29uc3Q6IHJhbGluayxtdDc2MjAtcGluY3RybAo+PiArCj4+ICtwYXR0ZXJuUHJv
cGVydGllczoKPj4gKyAgJy1waW5zJCc6Cj4+ICsgICAgdHlwZTogb2JqZWN0Cj4+ICsgICAgcGF0
dGVyblByb3BlcnRpZXM6Cj4+ICsgICAgICAnXiguKi0pP3Bpbm11eCQnOgo+IAo+IFdoeSBkbyB5
b3UgaGF2ZSB0d28gbGV2ZWxzIGhlcmU/IHBpbnMtPnBpbm11eC0+YWN0dWFsIHBpbiBjb25maWd1
cmF0aW9uPwoKWWVzLCBwaW5zLT5waW5tdXgtPnBpbi1jb25maWd1cmF0aW9uIGlzIGN1cnJlbnRs
eSBob3cgaXQncyBkb25lLgoKPiBDYW5ub3QgYmUgc29tZXRoaW5nIGxpa2UgYnJjbSxiY202MzZ4
IGhhcz8KCkR1bm5vLCBJJ2xsIHRha2UgYSBsb29rLgoKPiAKPj4gKyAgICAgICAgdHlwZTogb2Jq
ZWN0Cj4+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBub2RlIGZvciBwaW5jdHJsLgo+PiArICAgICAg
ICAkcmVmOiBwaW5tdXgtbm9kZS55YW1sIwo+PiArCj4+ICsgICAgICAgIHByb3BlcnRpZXM6Cj4+
ICsgICAgICAgICAgZ3JvdXBzOgo+PiArICAgICAgICAgICAgZGVzY3JpcHRpb246IFRoZSBwaW4g
Z3JvdXAgdG8gc2VsZWN0Lgo+IAo+IEkgd29uZGVyIHdoZXJlIGRvIHlvdSBjb25maWd1cmUgcGFy
dGljdWxhciBwaW5zIGJlY2F1c2UgdGhlc2UgYXJlCj4gZ3JvdXBzLi4uIEl0J3MgYSBiaXQgY29u
ZnVzaW5nIHRvIGNvbmZpZ3VyZSAiaTJjIiBncm91cCBpbnRvICJpMmMiIC0KPiBsb29rcyBvYnZp
b3VzLgoKV2UgZG9uJ3QgY29uZmlndXJlIGVhY2ggcGluIHBhcnRpY3VsYXJseS4gUmFsaW5rIGRy
aXZlciBvbmx5IHN1cHBvcnRzIAptdXhpbmcgY2VydGFpbiBmdW5jdGlvbnMgZm9yIGNlcnRhaW4g
cGluIGdyb3VwcyBhcyBoaW50ZWQgb24gdGhlIGJpbmRpbmcgCmRlc2NyaXB0aW9uLgoKPiAKPj4g
KyAgICAgICAgICAgIGVudW06IFsKPj4gKyAgICAgICAgICAgICAgIyBGb3IgTVQ3NjIwIFNvQwo+
PiArICAgICAgICAgICAgICBlcGh5LCBpMmMsIG1kaW8sIG5kX3NkLCBwYSwgcGNpZSwgcmdtaWkx
LCByZ21paTIsIHNwaSwgc3BpIHJlZmNsaywgdWFydGYsIHVhcnRsaXRlLCB3ZHQsIHdsZWQsCj4+
ICsKPj4gKyAgICAgICAgICAgICAgIyBGb3IgTVQ3NjI4IGFuZCBNVDc2ODggU29Dcwo+PiArICAg
ICAgICAgICAgICBncGlvLCBpMmMsIGkycywgcDBsZWRfYW4sIHAwbGVkX2tuLCBwMWxlZF9hbiwg
cDFsZWRfa24sIHAybGVkX2FuLCBwMmxlZF9rbiwgcDNsZWRfYW4sCj4+ICsgICAgICAgICAgICAg
IHAzbGVkX2tuLCBwNGxlZF9hbiwgcDRsZWRfa24sIHBlcnN0LCBwd20wLCBwd20xLCByZWZjbGss
IHNkbW9kZSwgc3BpLCBzcGkgY3MxLCBzcGlzLCB1YXJ0MCwKPj4gKyAgICAgICAgICAgICAgdWFy
dDEsIHVhcnQyLCB3ZHQsIHdsZWRfYW4sIHdsZWRfa24sCj4+ICsgICAgICAgICAgICBdCj4+ICsK
Pj4gKyAgICAgICAgICBmdW5jdGlvbjoKPj4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBUaGUg
bXV4IGZ1bmN0aW9uIHRvIHNlbGVjdC4KPj4gKyAgICAgICAgICAgIGVudW06IFsKPj4gKyAgICAg
ICAgICAgICAgIyBGb3IgTVQ3NjIwIFNvQwo+PiArICAgICAgICAgICAgICBlcGh5LCBncGlvLCBn
cGlvIGkycywgZ3BpbyB1YXJ0ZiwgaTJjLCBpMnMgdWFydGYsIG1kaW8sIG5hbmQsIHBhLCBwY2ll
IHJlZmNsaywgcGNpZSByc3QsCj4+ICsgICAgICAgICAgICAgIHBjbSBncGlvLCBwY20gaTJzLCBw
Y20gdWFydGYsIHJlZmNsaywgcmdtaWkxLCByZ21paTIsIHNkLCBzcGksIHNwaSByZWZjbGssIHVh
cnRmLCB1YXJ0bGl0ZSwKPj4gKyAgICAgICAgICAgICAgd2R0IHJlZmNsaywgd2R0IHJzdCwgd2xl
ZCwKPj4gKwo+PiArICAgICAgICAgICAgICAjIEZvciBNVDc2MjggYW5kIE1UNzY4OCBTb0NzCj4+
ICsgICAgICAgICAgICAgIGFudGVubmEsIGRlYnVnLCBncGlvLCBpMmMsIGkycywganRhZywgcDBs
ZWRfYW4sIHAwbGVkX2tuLCBwMWxlZF9hbiwgcDFsZWRfa24sIHAybGVkX2FuLAo+PiArICAgICAg
ICAgICAgICBwMmxlZF9rbiwgcDNsZWRfYW4sIHAzbGVkX2tuLCBwNGxlZF9hbiwgcDRsZWRfa24s
IHBjaWUsIHBjbSwgcGVyc3QsIHB3bSwgcHdtMCwgcHdtMSwKPj4gKyAgICAgICAgICAgICAgcHdt
X3VhcnQyLCByZWZjbGssIHJzdmQsIHNkeGMsIHNkeGMgZDUgZDQsIHNkeGMgZDYsIHNkeGMgZDcs
IHNwaSwgc3BpIGNzMSwgc3Bpcywgc3dfciwgdWFydDAsCj4+ICsgICAgICAgICAgICAgIHVhcnQx
LCB1YXJ0MiwgdXRpZiwgd2R0LCB3bGVkX2FuLCB3bGVkX2tuLCAtLAo+IAo+IEFsbCB0aGVzZSBs
aW5lcyBkbyBub3QgZml0IGluIDgwLWNoYXJhY3RlciBsaW1pdC4gTGludXggY29kaW5nIHN0eWxl
Cj4gc3RpbGwgZXhwZWN0cyB0aGlzIGluIG1vc3Qgb2YgY2FzZXMuCgpPaywgZHRfYmluZGluZ19j
aGVjayB3YXJucyBhZnRlciAxMTAgY2hhcmFjdGVycyBzbyBJIG1hZGUgaXQgZml0IHRoYXQuIApJ
J2xsIHVwZGF0ZSB0byA4MC4KCkFyxLFuw6cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
