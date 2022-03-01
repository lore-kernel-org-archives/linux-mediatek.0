Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19726C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 10:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPsO004G2kUVyIlyM73CbK8zC3XMa7Lmgm2CcunSFxc=; b=E+lQeU5HfpkpR6
	Ysitdo5bOgSKXiQhojjDC8SMYJ86WwTMSGJ0lMyjJdUTgwJ5No8NGScGXNuJV/7mCqgR6nTrRUlqI
	WeMJtR06RSXfmAqF064VVGPYVATPqdhHkhNRvUjq8FnKAwXLpmyRzxfGSKU1LJbxjojJO9EREbJI/
	gYfF7+mzG2QNhhqBQde6lqa+ivYpA9LCyV1Gb1kkau6DqCWTbhIbza8NAvbjwk5Mm01t5Zemi05Yq
	SkKEgsj57JDHKAxdqUX6/J6OpK/Sy7ZE+a2eIMRt3xA/tG4BTqGBsMs/rAjm9qhdDJUQ306v9ewbV
	/ZBR6NFeQOXg0zJpNWsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOzJd-00FySh-2b; Tue, 01 Mar 2022 10:01:09 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOzJ0-00FyA5-Bb
 for linux-mediatek@lists.infradead.org; Tue, 01 Mar 2022 10:00:33 +0000
Received: by mail-wr1-x431.google.com with SMTP id j17so19641706wrc.0
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Mar 2022 02:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/NQBr1sZ8oQQXIIdf1B2NQjdSNXQ4QPfHCPPwQs11cE=;
 b=yfoyhboq/By8VvqSyPz4Pc4WTVhTUz6EPgHo2Rw65TOBCdz3fH4JBoDCxNRdsPnXq/
 HZCFpjKlIZkZGmuqeLj+06YTEiGlC58beIl8NrHj004w1fTCu6pbkZ9ysEwbe5lHYozO
 wuFNkSL8QisrQGLPo3aWl8pYzCWbkgPE3oUT2JFT/3r+n5i46xHmF+J3k9m5vPH50E4L
 EvF5SsKMVm0wCprD1Y7BkhFqQgYghk6IU2xr9dGvXOblrsz3Q/q9rSiz9B7e3Cnh3N7w
 Y5t6LwoJdMtQGeh/HlVIX8UnTYKckMi6YrxcSAtEYoF658cz4ng69CJ0Zir9VMCelJVm
 hjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/NQBr1sZ8oQQXIIdf1B2NQjdSNXQ4QPfHCPPwQs11cE=;
 b=a/oy/6h8p7/KLbD7JVD3VuvRPoyPmUV5l0sGOWHZKUV6vgtvaSMNVCoixi3a/LyJl/
 PtQu/jo9vBn7d7WNmErav0ecPaZcpeZ3AdxApcdailsK4v0ExLj1y7dvr9vhbRxupFkt
 MsR6EmlXVy/qDksWorNLlW6e40lCu3j8eIs6Wcjcf7D8rp3GQXknyPB0wKJw/IwAklrb
 iO0eEdataBt7NDc1Yur50TycROItuomHFvrJ4UZIxdNOhR+IHY7BeLYqINlxrRdeJr7z
 CPT8yPXl4MdhcwlomMgRFgM31g/HzY6lc+XuVxIVKpHBEr9ihPUPErXtODRe1gNANSQO
 64QA==
X-Gm-Message-State: AOAM533ni30yAv5NQodx3oZm/qRb+2Y0hVZfWcM7WPe9LqEJXg8cPEHw
 7mYWRZVmJasQTCIZLIh2oDFiJw==
X-Google-Smtp-Source: ABdhPJxkoqxn1nwWXTwvIK4kRs12pJH4RpRn/7JBDpSDv2croOxCvb0jYahryR9C5EUY2k2J/9Fr7g==
X-Received: by 2002:a5d:4ccd:0:b0:1ed:a139:708f with SMTP id
 c13-20020a5d4ccd000000b001eda139708fmr18430472wrt.672.1646128827711; 
 Tue, 01 Mar 2022 02:00:27 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 x18-20020a1c7c12000000b0037c94766961sm1954654wmc.20.2022.03.01.02.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 02:00:27 -0800 (PST)
Date: Tue, 1 Mar 2022 10:00:25 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Add compatibles for undocumented trivial
 syscons
Message-ID: <Yh3uuVflhwnN89nh@google.com>
References: <20220228221537.1700071-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228221537.1700071-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_020030_429097_193144B7 
X-CRM114-Status: GOOD (  10.87  )
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

T24gTW9uLCAyOCBGZWIgMjAyMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+ICdpbnRlbCxsZ20tc3lz
Y29uJywgJ21hcnZlbGwsYXJtYWRhLTM3MDAtdXNiMi1ob3N0LW1pc2MnLAo+ICdtZWRpYXRlayxt
dDgxMzUtcGN0bC1hLXN5c2NmZycsIGFuZCAnbWVkaWF0ZWssbXQ4MTM1LXBjdGwtYi1zeXNjZmcn
IGFyZQo+IGFsbCB1c2VkIGluIERUIGJpbmRpbmcgZXhhbXBsZXMgYW5kL29yIGR0cyBmaWxlcywg
YnV0IGFyZSBub3QKPiBkb2N1bWVudGVkLiBBZGQgdGhlbSB0byBzeXNjb24ueWFtbCBhcyB0aGV5
IGFyZSBhbGwgdHJpdmlhbCBjYXNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWZkL3N5c2Nvbi55YW1sIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKykKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KUHJpbmNp
cGFsIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9w
ZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8
IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
