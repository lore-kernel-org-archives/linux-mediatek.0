Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E88C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 19:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lGJydqceVcjhnSNzIlJBvcEw9w2tZ2Cz3ubMYtXA9YU=; b=l+swRg49XknFTF
	1VcTYl7nelzBAU8y1nB+8fw3XmwZw2kXqEA5o8Ab0N3dMapJp0abx5Dy9TcuvmmD7jL2GxO/EWNs7
	yN8pFDAs3rnP8AtyQBG0foN6e3HCIHoNFl4ptn/FfglDZF1DRXdA2GmvpMPQQNXbTr5I/ByYJsLxr
	YVrOxWW0AgAJ83uRdK4kUx+xgNp8pJ+vD6AMOIoYwHJDvJY1DPHEZzAElyj4r4g6IK/becLLB0VBE
	tdwXUWTa/+7pLWDeNf2Z0R5j50xeZVPCOUx+q1IWb2sO5Xpn0D8q71zPNwn8JmjpQqmhKPTa7sHMU
	Z8w1THYaCpM5KJCY3dDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngt60-005tDY-Lb; Tue, 19 Apr 2022 19:01:04 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngt4h-005saK-9k; Tue, 19 Apr 2022 18:59:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1650394759; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gyMpKPwcZ56A0saJrbnZ2SGeHNdFwrYWpbLGx4k4y84R17oVRQmnonieJVIHPZpah0c+9Qe9fe5lGD40v6XI/ZyJiowh3uclK+QF2JHzb8FtQ2SIvVRXNWyvWTcErBlJ03VmPx4ziJEoK7gzu+IjbFe4u1VfLzgjX01c3cgeuWA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1650394759;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=9VjwSH0I9W/DB4x/BmRW3flCPs5gbLidfDoHgiRZ19E=; 
 b=f6z9mss4D2oQa/Pxv8nau+aVX/wXNvFKkZ2pb3n/X1hdAY2DE7hM3rmJOcKopNrqwAVAduWPu3k85etTGQn7W5AScEzGa17M2Y9wZxB9QcJQoPBpd8pWxPMi+BS7rcxMtAsK/OXKYPPBmr3U3lQewiXFzGa2yij/uUOk5HLNcjg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1650394759; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=9VjwSH0I9W/DB4x/BmRW3flCPs5gbLidfDoHgiRZ19E=;
 b=NV9Zgjw9a55SlOkSW+AhfsTH1oRAcNtDgGFThRtVAYI3uMCpWbSZWXl7XYg+dh8B
 00+vebYCpTFhaEq2CGoN+vuXKoUTSHODXOcHOQYZMD6Y2ooUO2JscEFDilh5jsQgICZ
 /LeNWbe4Cn6ZCfpYIslKePnYJm/XkB/Z2ChOEkxo=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 165039475819462.97284354678186;
 Tue, 19 Apr 2022 11:59:18 -0700 (PDT)
Message-ID: <4c84c9ce-be19-ee34-d9d0-e69495722b01@arinc9.com>
Date: Tue, 19 Apr 2022 21:59:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 13/14] dt-bindings: pinctrl: add binding for Ralink
 RT305X pinctrl
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Joe Perches <joe@perches.com>,
 erkin.bozoglu@xeront.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
 <20220414173916.5552-14-arinc.unal@arinc9.com>
 <Yl758u9iIMnhYPz2@robh.at.kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <Yl758u9iIMnhYPz2@robh.at.kernel.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_115943_448384_65D7B68E 
X-CRM114-Status: GOOD (  13.17  )
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

T24gMTkvMDQvMjAyMiAyMTowNSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVGh1LCBBcHIgMTQs
IDIwMjIgYXQgMDg6Mzk6MTVQTSArMDMwMCwgQXLEsW7DpyDDnE5BTCB3cm90ZToKPj4gQWRkIGJp
bmRpbmcgZm9yIHRoZSBSYWxpbmsgUlQzMDVYIHBpbiBjb250cm9sbGVyIGZvciBSVDMwNTAsIFJU
MzA1MiwKPj4gUlQzMzUwLCBSVDMzNTIgYW5kIFJUNTM1MCBTb0NzLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+Cj4+IC0tLQo+PiAgIC4u
Li9waW5jdHJsL3JhbGluayxydDMwNXgtcGluY3RybC55YW1sICAgICAgICB8IDkyICsrKysrKysr
KysrKysrKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgOTIgaW5zZXJ0aW9ucygrKQo+PiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3Ry
bC9yYWxpbmsscnQzMDV4LXBpbmN0cmwueWFtbAo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLHJ0MzA1eC1waW5jdHJsLnlh
bWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmsscnQz
MDV4LXBpbmN0cmwueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAw
MDAwMDAuLjQyNTQwMWM1NDI2OQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxydDMwNXgtcGluY3RybC55YW1s
Cj4+IEBAIC0wLDAgKzEsOTIgQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb25seSBPUiBCU0QtMi1DbGF1c2UKPj4gKyVZQU1MIDEuMgo+PiArLS0tCj4+ICskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3BpbmN0cmwvcmFsaW5rLHJ0MzA1eC1waW5jdHJs
LnlhbWwjCj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2Nv
cmUueWFtbCMKPj4gKwo+PiArdGl0bGU6IFJhbGluayBSVDMwNVggUGluIENvbnRyb2xsZXIKPj4g
Kwo+PiArbWFpbnRhaW5lcnM6Cj4+ICsgIC0gQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmlu
YzkuY29tPgo+PiArICAtIFNlcmdpbyBQYXJhY3VlbGxvcyA8c2VyZ2lvLnBhcmFjdWVsbG9zQGdt
YWlsLmNvbT4KPj4gKwo+PiArZGVzY3JpcHRpb246Cj4+ICsgIFJhbGluayBSVDMwNVggcGluIGNv
bnRyb2xsZXIgZm9yIFJUMzA1MCwgUlQzMDUyLCBSVDMzNTAsIFJUMzM1MiBhbmQgUlQ1MzUwCj4+
ICsgIFNvQ3MuCj4+ICsgIFRoZSBwaW4gY29udHJvbGxlciBjYW4gb25seSBzZXQgdGhlIG11eGlu
ZyBvZiBwaW4gZ3JvdXBzLiBNdXhpbmcgaW5kaXZpZHVhbAo+PiArICBwaW5zIGlzIG5vdCBzdXBw
b3J0ZWQuIFRoZXJlIGlzIG5vIHBpbmNvbmYgc3VwcG9ydC4KPj4gKwo+PiArcHJvcGVydGllczoK
Pj4gKyAgY29tcGF0aWJsZToKPj4gKyAgICBjb25zdDogcmFsaW5rLHJ0MzA1eC1waW5jdHJsCj4g
Cj4gWW91IHNob3VsZCBoYXZlIGEgY29tcGF0aWJsZSBmb3IgZWFjaCBTb0MgdW5sZXNzIHRoZXNl
IGFyZSBhbGwganVzdAo+IGZ1c2VkIG9yIHBhY2thZ2UgdmFyaWVudHMgb2YgdGhlIHNhbWUgY2hp
cC4KClRoZSBydDMwNXggcGluIGNvbnRyb2xsZXIgY2FsbHMgY29kZSBmcm9tIAphcmNoL21pcHMv
aW5jbHVkZS9hc20vbWFjaC1yYWxpbmsvcnQzMDV4LmggdG8gZGV0ZXJtaW5lIHRoZSBTb0MgYW5k
IHVzZXMgCmRpZmZlcmVudCBwaW5tdXggZGF0YSBieSB0aGUgcmVzdWx0IG9mIHRoZSBkZXRlcm1p
bmF0aW9uLgoKSSBndWVzcyB3ZSBjYW4gY2FsbCB0aGlzIGZ1c2VkLgoKQXLEsW7DpwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
