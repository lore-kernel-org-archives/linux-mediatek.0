Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0FDC25B67
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 05:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O18ACdOlxBoaBz1z4uRBsuAuyaadjOVTHABGOAlW9Lc=; b=I/bJ74jXnPWoDTxqxUwaOXI5UI
	KmPP2pbMDreLmaCXcSgPa9pei5/Ttg/LQCryZZWveJ270H03RHU7qU3btr1/1qGKx8AJ1Tdjti/VH
	32JF+ST48Wb/Ty5h2EiaOXoWg1KGl3A6wlaXKeIp8ZQmBQbMYxoDF7RLsPr68LSoDllvsgEu2muVa
	dcxViLWPUVIh25vuCO7+79R7nQ6Cng32qx4QH/+EsWbfBflCayVpE5aulvsNTLjdp58AiRQwa1PoM
	5wSqf15TnV/2J7ASls0okHjgF0r8j/FuVc3OL7b/06fZFO0bktbH78orjZDsrwZ356YBENXPXnPBL
	uouxBa3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvt8a-00Dilz-0c;
	Thu, 26 Oct 2023 05:42:32 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvt8X-00DikX-1d;
	Thu, 26 Oct 2023 05:42:30 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99c3c8adb27so72417666b.1;
        Wed, 25 Oct 2023 22:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698298944; x=1698903744; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O18ACdOlxBoaBz1z4uRBsuAuyaadjOVTHABGOAlW9Lc=;
        b=dOBqWLkp7XMYwxZ1yNzTUk30LPcwpPhRPBaz7BNNOlOkPGmOS0j6dDLqzHthhO0s4N
         ujshXiSirmb0wnQFny9WV91uDG5k5t9C0qzKxMAKxzb89Wr3AJ47h/IAakxiMpmRWwC/
         BrcoK+Jrgsp8TusBQIPKuN82B7U5xFkBouoBN4AcnkhovV7gOFrkUMW8oXV4sFOndJ4m
         NLW3pYDd4dDnxX6V/qCvQB/S1JAvyJTBWuHvfN92A44r4UF/tKk+HX0CqXcSzNw+2Kmi
         pc0fT6AzWeFn2V0f4raIqv8Cprrev5e1hqSO/G5vq99Y0kI3cIhV2ZDFwaOgWv5uQ/37
         i6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698298944; x=1698903744;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O18ACdOlxBoaBz1z4uRBsuAuyaadjOVTHABGOAlW9Lc=;
        b=ofmBAM1EabiC2bv4uftxOq4eW9wzoVmCQl4UTVd/DuBN8pou7+oXqAePgZ2+6yyOIv
         +JTvi3tZ7wzRL8gTVP5ExGgDLaShKzrU1WG6Hz6+AUKels9JyKkmPQTZFyx1btMzMlaT
         5njErUPTA23vI2QSBO4wXhxAOBg7zGi7fl5bOKqP/iyZyyCApYOQcOrTLCYKHUXkcapb
         nswr0WIT5gokB1cQVObnoIeUPT3ZrVf1PMa5otdcVB0nLVO2iGENRZiGXE+gJLFAGC29
         fg2tgUHEDxRPd8c5vBbIa28+0nDMy2hpQNGuBHNDWlIuZ8110NRIz1j9QWnkXdko9Iax
         Td+g==
X-Gm-Message-State: AOJu0Yz14pxRrg/fwck6JLTIwAz9z3v70ITUL7A35g6gRVCasThk1f0P
	S+g6VztVkg9JWbwqmSQ5dUE=
X-Google-Smtp-Source: AGHT+IHmMO3TLhv7sxxKLpdaJx+E9H3rUYUWCTNqp9Fy0oskRy3AJT3yW6Ydo3VAks2ONiqNvcp/xg==
X-Received: by 2002:a17:907:3d9f:b0:9c1:9b3a:4cd1 with SMTP id he31-20020a1709073d9f00b009c19b3a4cd1mr12788174ejc.3.1698298943815;
        Wed, 25 Oct 2023 22:42:23 -0700 (PDT)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id 10-20020a17090602ca00b009b2f2451381sm11117028ejk.182.2023.10.25.22.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:42:23 -0700 (PDT)
Message-ID: <65d6ffc4c7bd6ce0ae75f7fb7d1f622467bfe9a7.camel@gmail.com>
Subject: Re: [RFT PATCH 05/17] ASoC: codecs: max9867: Handle component name
 prefix
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@quicinc.com>, Oder Chiou <oder_chiou@realtek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,  alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,  patches@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org
Date: Thu, 26 Oct 2023 07:42:22 +0200
In-Reply-To: <20231023095428.166563-6-krzysztof.kozlowski@linaro.org>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
	 <20231023095428.166563-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_224229_545442_069CE8EC 
X-CRM114-Status: GOOD (  13.48  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIzLTEwLTIzIGF0IDExOjU0ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+IFVzZSBzbmRfc29jX2RhcG1fd2lkZ2V0X25hbWVfY21wKCkgaGVscGVyIHdoZW4gY29t
cGFyaW5nIHdpZGdldCBuYW1lcywKPiB0byBpbmNsdWRlIGFsc28gdGhlIGNvbXBvbmVudCdzIG5h
bWUgcHJlZml4Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlz
enRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPiAtLS0KClJldmlld2VkLWJ5OiBOdW5vIFNhIDxu
dW5vLnNhQGFuYWxvZy5jb20+Cgo+IMKgc291bmQvc29jL2NvZGVjcy9tYXg5ODY3LmMgfCA4ICsr
KystLS0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL21heDk4NjcuYyBiL3NvdW5kL3Nv
Yy9jb2RlY3MvbWF4OTg2Ny5jCj4gaW5kZXggYjYxNmFkMzk4NThjLi4zYjlkZDE1OGMzNGIgMTAw
NjQ0Cj4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9tYXg5ODY3LmMKPiArKysgYi9zb3VuZC9zb2Mv
Y29kZWNzL21heDk4NjcuYwo+IEBAIC01NiwxMyArNTYsMTMgQEAgc3RhdGljIGludCBtYXg5ODY3
X2FkY19kYWNfZXZlbnQoc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgKncsCj4gwqDCoMKgwqDC
oMKgwqDCoHN0cnVjdCBtYXg5ODY3X3ByaXYgKm1heDk4NjcgPSBzbmRfc29jX2NvbXBvbmVudF9n
ZXRfZHJ2ZGF0YShjb21wb25lbnQpOwo+IMKgwqDCoMKgwqDCoMKgwqBlbnVtIG1heDk4NjdfYWRj
X2RhYyBhZGNfZGFjOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgaWYgKCFzdHJjbXAody0+bmFtZSwg
IkFEQ0wiKSkKPiArwqDCoMKgwqDCoMKgwqBpZiAoIXNuZF9zb2NfZGFwbV93aWRnZXRfbmFtZV9j
bXAodywgIkFEQ0wiKSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFkY19kYWMg
PSBNQVg5ODY3X0FEQ19MRUZUOwo+IC3CoMKgwqDCoMKgwqDCoGVsc2UgaWYgKCFzdHJjbXAody0+
bmFtZSwgIkFEQ1IiKSkKPiArwqDCoMKgwqDCoMKgwqBlbHNlIGlmICghc25kX3NvY19kYXBtX3dp
ZGdldF9uYW1lX2NtcCh3LCAiQURDUiIpKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgYWRjX2RhYyA9IE1BWDk4NjdfQURDX1JJR0hUOwo+IC3CoMKgwqDCoMKgwqDCoGVsc2UgaWYg
KCFzdHJjbXAody0+bmFtZSwgIkRBQ0wiKSkKPiArwqDCoMKgwqDCoMKgwqBlbHNlIGlmICghc25k
X3NvY19kYXBtX3dpZGdldF9uYW1lX2NtcCh3LCAiREFDTCIpKQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgYWRjX2RhYyA9IE1BWDk4NjdfREFDX0xFRlQ7Cj4gLcKgwqDCoMKgwqDC
oMKgZWxzZSBpZiAoIXN0cmNtcCh3LT5uYW1lLCAiREFDUiIpKQo+ICvCoMKgwqDCoMKgwqDCoGVs
c2UgaWYgKCFzbmRfc29jX2RhcG1fd2lkZ2V0X25hbWVfY21wKHcsICJEQUNSIikpCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhZGNfZGFjID0gTUFYOTg2N19EQUNfUklHSFQ7Cj4g
wqDCoMKgwqDCoMKgwqDCoGVsc2UKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJl
dHVybiAwOwoK


