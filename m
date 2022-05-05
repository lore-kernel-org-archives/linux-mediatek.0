Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A135C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 13:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pe5A09lKhTFtX59HVXsBnkcKTSvlzWFXbMQ95PgBJfk=; b=PUK1peUFFICNPi
	tBVywmXXV2L/0bQZgmxUvkJoAGpV9UVSyoIhpJsIESxZzxtzXIjkh6AhoaB0OSM4JmhYj2us57pNL
	OIO2Nsl5XQMTsz7XetLmMe3cZr48vnFWgRXfWTcqQ3DFwTOXXv4Udhwdf9NULZ+eAhmci5tPrJOSS
	7uJn0h0Wtyixlq8wYZHRdgrokBULd1DnvcgFi/P2KO2QpI1GxrCJ8qOXOGCv2pXM9ws0kHr0xgHM9
	UydkhmvgxMD5jzF3mgpcYq3bwjiDVSbxcRnCI6zff5/rqvbXv//Jb7La4v5aPPPsZA7wiRcxFgL3f
	sifX4N2QrG7dVab6Nygg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmbiN-00G5Rz-PB; Thu, 05 May 2022 13:40:19 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmbiB-00G5OK-SW; Thu, 05 May 2022 13:40:09 +0000
Received: by mail-wr1-x436.google.com with SMTP id j15so6188305wrb.2;
 Thu, 05 May 2022 06:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z1RR59cI7xuB4wHEsyPKJMalbJOLkbwR60Nf/1GYehA=;
 b=ndpgFCn1qTpGhnYt6AJHLLEWJlQPdUMvg62egEiojKObjEKE6FEJzqy6ysaSTXnW+c
 39A4IXst24GMi+5AuVkfQN15o6O1nTSncpaAri2VwU//cHQS/1y1bpHqkwxymohUQsMy
 S7wxs09NfXgyGf1uoENAa54UlPTrAtVVdsaV2CffmVoIcn+umOfBQRugbByiyd3Hjen9
 0rC61Vzo7wsAW4hDQHGMPdb+cscQM5+HptSwTHt4KPxmOiNjKnA4tWJtqnmNEHdrlti3
 fq39KCHk4Z4/01z2TpJrV0KDpn7/FCGgSJ3ktpOfCsY2b+g0urMPWeLPnVmWZg6p5Mrj
 D5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z1RR59cI7xuB4wHEsyPKJMalbJOLkbwR60Nf/1GYehA=;
 b=PnWIB6N6u1qCjkoRskYPmVIfrNGW2AO+hbuPHYBQl1E/j5RanqDFqt+jqFyFSIk/LH
 MkfqI35t+sAi3JKJkvDTFVjz4NvudtYokpF4qo3zRdyE/4jrcZdIq6eiU0fsgzGANYre
 l3JKemw3KQY5B+g8IkvD0M4brumN948+zYWEzr6JnX62E9OtQ175gXrJZWEJmU9yZAKP
 9BG1XckCqf7hcq7a4XC9OVRnlcIv/LSTZovRKMLtcNdKacrVGFCJt+MzmkXR58YqgM8M
 q2metM4gvy6ca8LuCrQFM1iBTkS79Gi0lui7gBIG3T0IjeSRZJEE3AKX0VSb5OiaC4GJ
 1PxQ==
X-Gm-Message-State: AOAM531hzQf9eyEG/J7CYhSKUhKLFyG2ssvIjqPe94Wj4ATffl1SyUYy
 sfZSc3tOvp12ZTK0TVaormY=
X-Google-Smtp-Source: ABdhPJyHaFZllmZOyM64fdf7fRq3DCLuUeYU8LlG4ML06VUn++MVFboIpiIVZAXJFIk1tqRN2CMwlQ==
X-Received: by 2002:adf:e40f:0:b0:20a:d221:b00c with SMTP id
 g15-20020adfe40f000000b0020ad221b00cmr20911209wrm.11.1651758005257; 
 Thu, 05 May 2022 06:40:05 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c2f9000b003942a244f50sm6912572wmn.41.2022.05.05.06.40.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 06:40:04 -0700 (PDT)
Message-ID: <1b42b5aa-2020-b545-72ab-96ec14ef454a@gmail.com>
Date: Thu, 5 May 2022 15:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] arm64: dts: mt8192: Follow binding order for SCP
 registers
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220504214516.2957504-1-nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220504214516.2957504-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_064007_971640_DB0FC077 
X-CRM114-Status: GOOD (  16.67  )
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

CgpPbiAwNC8wNS8yMDIyIDIzOjQ1LCBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyB3cm90ZToKPiBU
aGUgZHQtYmluZGluZyBmb3IgU0NQIGRvY3VtZW50cyB0aGUgcmVnLW5hbWVzIG9yZGVyIGFzIHNy
YW0sIGNmZywKPiBsMXRjbS4gVXBkYXRlIHRoZSBTQ1Agbm9kZSBvbiB0aGUgbXQ4MTkyIGRldmlj
ZXRyZWUgdG8gZm9sbG93IHRoYXQKPiBvcmRlciwgd2hpY2ggZ2V0cyByaWQgb2YgYSBkdGJzX2No
ZWNrIHdhcm5pbmcuIFRoaXMgZG9lc24ndCBjaGFuZ2UgYW55Cj4gYmVoYXZpb3Igc2luY2UgdGhl
IFNDUCBkcml2ZXIgYWNjZXNzZXMgdGhlIG1lbW9yeSByZWdpb25zIHRocm91Z2ggdGhlCj4gbmFt
ZXMgYW55d2F5Lgo+IAo+IEZpeGVzOiBjNjM1NTZlYzZiZmUgKCJhcm02NDogZHRzOiBtdDgxOTI6
IEFkZCBTQ1Agbm9kZSIpCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8g
PG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgo+IAoKQXBwbGllZCB0aGFua3MhCgo+IC0tLQo+IAo+
IENoYW5nZXMgaW4gdjI6Cj4gLSBBZGRlZCBtaXNzaW5nIEZpeGVzIHRhZwo+IAo+ICAgYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaSB8IDYgKysrLS0tCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpIGIvYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaQo+IGluZGV4IDI2ZGJlOWVjYzUyOC4uNzMzYWVj
MmU3Zjc3IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTky
LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4g
QEAgLTY5OSw5ICs2OTksOSBAQCBzcGk3OiBzcGlAMTEwMWUwMDAgewo+ICAgCQlzY3A6IHNjcEAx
MDUwMDAwMCB7Cj4gICAJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1zY3AiOwo+ICAg
CQkJcmVnID0gPDAgMHgxMDUwMDAwMCAwIDB4MTAwMDAwPiwKPiAtCQkJICAgICAgPDAgMHgxMDcw
MDAwMCAwIDB4ODAwMD4sCj4gLQkJCSAgICAgIDwwIDB4MTA3MjAwMDAgMCAweGUwMDAwPjsKPiAt
CQkJcmVnLW5hbWVzID0gInNyYW0iLCAibDF0Y20iLCAiY2ZnIjsKPiArCQkJICAgICAgPDAgMHgx
MDcyMDAwMCAwIDB4ZTAwMDA+LAo+ICsJCQkgICAgICA8MCAweDEwNzAwMDAwIDAgMHg4MDAwPjsK
PiArCQkJcmVnLW5hbWVzID0gInNyYW0iLCAiY2ZnIiwgImwxdGNtIjsKPiAgIAkJCWludGVycnVw
dHMgPSA8R0lDX1NQSSA0MzUgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKPiAgIAkJCWNsb2NrcyA9
IDwmaW5mcmFjZmcgQ0xLX0lORlJBX1NDUFNZUz47Cj4gICAJCQljbG9jay1uYW1lcyA9ICJtYWlu
IjsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
