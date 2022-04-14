Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF25C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 08:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfUoVmufcGHgybWenKHYuk4XpidB5eCrqTg2Tcydc1k=; b=dPBtqv7tPr8pjY
	3cdgGCLAciQN8u9VT3V6IrjuFZFgfTJ9tXRvbM0T+EwGPGcN896NKMdfaPe9ZltBIHE81pbcWP56l
	BVqC1AlG7xcy6wOLsAbe1IOoIH4NR6RzmjCvOKEEMkgX4oAZgZD9kKsV02eOygx6rkTx6gEwOpCgk
	Sb+wsuSzpMFluuJ/G4/F6W/Iqdm05l2i3qKgUHpWjh/ydp/afNVLOq7byM1zNYFrbVxFa26YJ2sG/
	UJH2dA1S4yCM8NLnpqhsuWs1N/xxJUXk1O7O+xKkqMknr5abSa/CQXUX27buM3c31ktt3qmn6PVIC
	mHflqzYVe7M2Cvr4fmxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neuf9-004V3d-O6; Thu, 14 Apr 2022 08:17:11 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neuew-004UwT-GY; Thu, 14 Apr 2022 08:17:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649924196; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AsbspUXkFkn8IT+0dQO6+nAUIXZBWkX3UudduNXGRNXTpwpnad/24gTpkZXU4e6kWLvaXBOd/lXqB01ovdbEgANQtvnESnkRDfYFuKhg2SSP4d/EP9pz65ddBIJNdyc+dzYuysdpUxSAmO7Eqh2iQltHsZvJqWTJlD6reeyq8NM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649924196;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=DX3FsxaeKDI941g7IHym5WqsNB7za3Lzp+oTtlBrdg0=; 
 b=VwazXdxxgsDKh5PXsOfE7N4+KzRmOBXQMiVIWkJevXYM+/0pQv23rogmj3atN9ktfwu4KlwVI9aXCshk+2M53vfd+GKuGdiUKGFaveHFX1Ap1R1gyER/F2oJOOs1LQHCJjiU6DNwLWEn5oK3zl4MAy4p97STQwg+4/Y9aUlx/Hw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649924196; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=DX3FsxaeKDI941g7IHym5WqsNB7za3Lzp+oTtlBrdg0=;
 b=ezOkLB+TYbDZluCEVnRi6RdNfdJBhCMxcsg4a//QBZID7wwzpWbfkbzstNRnWgtG
 sOk3kAm0FrDmrWAEG996iSmrMTmmlk1OIGMYSpX53Vi7pbnqj6r2Xa7NvFepsC3paGc
 bikhviBTfHCnxO8C3+s1dvim9mleWqsUql/olEkg=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649924194390779.7996201062704;
 Thu, 14 Apr 2022 01:16:34 -0700 (PDT)
Message-ID: <1023e28e-6523-ea3a-7ac7-fe1d08e5e67f@arinc9.com>
Date: Thu, 14 Apr 2022 11:16:27 +0300
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
 <0dd1da16-232b-d634-3146-bf91e58c9543@arinc9.com>
 <02953ce1-0a43-5918-d139-35afd5f15b5b@linaro.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <02953ce1-0a43-5918-d139-35afd5f15b5b@linaro.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_011658_648007_88B0A90F 
X-CRM114-Status: UNSURE (   5.29  )
X-CRM114-Notice: Please train this message.
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

T24gMTQvMDQvMjAyMiAwOTozMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxNC8w
NC8yMDIyIDAzOjUyLCBBcsSxbsOnIMOcTkFMIHdyb3RlOgo+Pj4KPj4+PiArICBpcyBub3Qgc3Vw
cG9ydGVkLiBUaGVyZSBpcyBubyBwaW5jb25mIHN1cHBvcnQuCj4+Pj4gKwo+Pj4+ICtwcm9wZXJ0
aWVzOgo+Pj4+ICsgIGNvbXBhdGlibGU6Cj4+Pj4gKyAgICBjb25zdDogcmFsaW5rLG10NzYyMC1w
aW5jdHJsCj4+Pj4gKwo+Pj4+ICtwYXR0ZXJuUHJvcGVydGllczoKPj4+PiArICAnLXBpbnMkJzoK
Pj4+PiArICAgIHR5cGU6IG9iamVjdAo+Pj4+ICsgICAgcGF0dGVyblByb3BlcnRpZXM6Cj4+Pj4g
KyAgICAgICdeKC4qLSk/cGlubXV4JCc6Cj4+Pgo+Pj4gV2h5IGRvIHlvdSBoYXZlIHR3byBsZXZl
bHMgaGVyZT8gcGlucy0+cGlubXV4LT5hY3R1YWwgcGluIGNvbmZpZ3VyYXRpb24/Cj4+Cj4+IFll
cywgcGlucy0+cGlubXV4LT5waW4tY29uZmlndXJhdGlvbiBpcyBjdXJyZW50bHkgaG93IGl0J3Mg
ZG9uZS4KPiAKPiBJdCBpcyBjdXJyZW50bHkgZG9uZT8gQXJlbid0IHlvdSBicmluZ2luZyBoZXJl
IG5ldyBiaW5kaW5ncyBhbmQgbmV3Cj4gZHJpdmVyIHN1cHBvcnQ/CgpJJ20gc3VibWl0dGluZyBi
aW5kaW5ncyBmb3IgdGhlIGV4aXN0aW5nIHN1YmRyaXZlcnMuIFRoZXJlJ3Mgbm90aGluZyBuZXcg
CmJ1dCByZWZhY3RvcmluZyBhbmQgc3VibWl0dGluZyB0aGUgbWlzc2luZyBiaW5kaW5ncy4KCkNo
ZWVycy4KQXLEsW7DpwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tZWRpYXRlawo=
