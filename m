Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16088C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 17:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rxsp7/6uDAM1Fb1zHwclJ47uT4VmOrlozL9Gys7O5fg=; b=kgcNK+Y2IHpG9h
	ZCXXDW6uFtw8NTCuNUd1PqZK6WWEoQaXvpBKge/TFqxPv01DIQsSqNaokp9MlH4lkZgaGG1hnDZlH
	3nC511n1dWdZ4pzgE7fK10/xq1OVpCfNj+ApNb3WBSHuPf4nkEQCf46Lw33T45XCv7GWHFiRtftPc
	14CkggDzSjltfdhrDCumOpfUHI9/MSlh0iKpaIfmd68jZAIXAbrH4V9yng6elXWoaIaHJpfnqPGEZ
	lr4j+5m2vNf5SEjRIrf6EPI1BbBmktFlWr/0duHFgYCdfZXf/JfgukfZHIuBz+n5U6nGJRuo0zVXa
	Mh84hECTIDeyj4SsLtdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX4bP-00EOKi-52; Wed, 23 Mar 2022 17:16:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX4b9-00EODi-2E; Wed, 23 Mar 2022 17:16:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id q20so1370374wmq.1;
 Wed, 23 Mar 2022 10:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hkH0tUK7Ab/Z/SHkXKztrJgwmG4XsuWqH85qdLpELtM=;
 b=ct1V0Qqkvy2GvMt2u3pbPt44uLlr+I0rPDIPx0znmRRnHXn0+brP+ZiDXqkKiHZHC5
 taihcJNjpeyfyaKImanxNodfcVtuKnxE0hOol4jRG8SvEWanwNCNl4YWeDe7ppHT3/MF
 f9gnUXYOpn2GDZX9lQ8tuRH+dE+8PvgtH3XUvoc1zpqbVj17lMDIrDYOdU1L3qeeOfA3
 4OpxMGHQK0mG9sBU7Tx2UQVsLvYqNJkEQHpPlOVMMO6fvOTtr6XfsL57PRFsXGp1SmbA
 hRcIeiOpq33nR03iIwhMyv3O9y6rc71NK6CHhwZMqs6QoJQ3alHktNanm/0zcl50llu9
 BT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hkH0tUK7Ab/Z/SHkXKztrJgwmG4XsuWqH85qdLpELtM=;
 b=3KWgB1fHKCQFPeN7ZBKRgvk4VfOvw7Cdqzjf7/CSHnYP/i97ye2cqaRzkwK6DZ7tfi
 ExRuDLzU/bj1wrGHnjC/kKbVIkVgsUyK4jt8kFLfnIAaJqOdA7IYai2ZhObeFXsaQZZj
 ZyoBPxBoovcXc/vG45n1AebO3xH0P5ZzcNQEu4H/WHMGNzYya3z0MvSHgqd9/vKtsK9c
 wNcWxsUeiAppRPd+0PEFS83r4czISdvnEFnZVa7kmb/gRWE/vwWniLEI1JT52YktUnOw
 dOA5tOiinp87PmAqCKSpKihABH0Ta/ua8F/pcbboXGXQ0QYv9OCIInKSgS+WV5xOCVav
 YrIQ==
X-Gm-Message-State: AOAM530X/5grd0YArrbtkFJS6UX7nKGPfKlNCYgczx91L+MRnJO+UCmc
 IzdbMwt866FP+zCvP1xtk7KJEyvm7EJ3Yg==
X-Google-Smtp-Source: ABdhPJzMjlLcvGg/anxatVCB8sDCZ0HTUpMJqgQHEpIoSduFVctpxRURpT1yhVlix6oTzQh9Xw0fCA==
X-Received: by 2002:a7b:ce02:0:b0:381:2007:f75c with SMTP id
 m2-20020a7bce02000000b003812007f75cmr10735674wmc.6.1648055797230; 
 Wed, 23 Mar 2022 10:16:37 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c4f0f00b0038cbdf5221dsm3336331wmq.41.2022.03.23.10.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 10:16:36 -0700 (PDT)
Message-ID: <8e482005-8f44-3502-3bca-0824f3e2dd7a@gmail.com>
Date: Wed, 23 Mar 2022 18:16:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 02/22] arm64: dts: mt8192: Add spmi node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-3-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_101639_139139_60C67929 
X-CRM114-Status: GOOD (  14.84  )
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

CgpPbiAxOC8wMy8yMDIyIDE1OjQ1LCBBbGxlbi1LSCBDaGVuZyB3cm90ZToKPiBBZGQgc3BtaSBu
b2RlIGZvciBtdDgxOTIgU29DLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsbGVuLUtIIENoZW5nIDxh
bGxlbi1raC5jaGVuZ0BtZWRpYXRlay5jb20+Cj4gUmV2aWV3ZWQtYnk6IE7DrWNvbGFzIEYuIFIu
IEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5nZWxv
R2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3Jh
LmNvbT4KPiAtLS0KPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kg
fCAxNyArKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIu
ZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKPiBpbmRleCA3
NjQyODU5OTQ0NGUuLjBmOWYyMTFjYTk4NiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDgxOTIuZHRzaQo+IEBAIC01MzUsNiArNTM1LDIzIEBACj4gICAJCQlhc3NpZ25lZC1j
bG9jay1wYXJlbnRzID0gPCZ0b3Bja2dlbiBDTEtfVE9QX09TQ19EMTA+Owo+ICAgCQl9Owo+ICAg
Cj4gKwkJc3BtaTogc3BtaUAxMDAyNzAwMCB7Cj4gKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWss
bXQ2ODczLXNwbWkiOwo+ICsJCQlyZWcgPSA8MCAweDEwMDI3MDAwIDAgMHgwMDBlMDA+LAo+ICsJ
CQkgICAgICA8MCAweDEwMDI5MDAwIDAgMHgwMDAxMDA+Owo+ICsJCQlyZWctbmFtZXMgPSAicG1p
ZiIsICJzcG1pbXN0IjsKPiArCQkJY2xvY2tzID0gPCZpbmZyYWNmZyBDTEtfSU5GUkFfUE1JQ19B
UD4sCj4gKwkJCQkgPCZpbmZyYWNmZyBDTEtfSU5GUkFfUE1JQ19UTVI+LAo+ICsJCQkJIDwmdG9w
Y2tnZW4gQ0xLX1RPUF9TUE1JX01TVF9TRUw+Owo+ICsJCQljbG9jay1uYW1lcyA9ICJwbWlmX3N5
c19jayIsCj4gKwkJCQkgICAgICAicG1pZl90bXJfY2siLAo+ICsJCQkJICAgICAgInNwbWltc3Rf
Y2xrX211eCI7Cj4gKwkJCWFzc2lnbmVkLWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9QV1JB
UF9VTFBPU0NfU0VMPjsKPiArCQkJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmdG9wY2tnZW4g
Q0xLX1RPUF9PU0NfRDEwPjsKPiArCQkJI2FkZHJlc3MtY2VsbHMgPSA8Mj47Cj4gKwkJCSNzaXpl
LWNlbGxzID0gPDA+OwoKV2hhdCBkbyB3ZSBuZWVkIHRoZSBhZGRyZXNzLWNlbGxzIGFuZCBzaXpl
LWNlbGxzIGZvcj8KClJlZ2FyZHMsCk1hdHRoaWFzCgo+ICsJCX07Cj4gKwo+ICAgCQlzY3BfYWRz
cDogY2xvY2stY29udHJvbGxlckAxMDcyMDAwMCB7Cj4gICAJCQljb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE5Mi1zY3BfYWRzcCI7Cj4gICAJCQlyZWcgPSA8MCAweDEwNzIwMDAwIDAgMHgxMDAw
PjsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
