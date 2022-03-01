Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74186C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 10:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CC6TJXc1k35s4zmaQq2G+tOOo3zEzqOzOsvBpyOlAXI=; b=actDDOBlJE9Vlg
	SXUEzTcOzicCJ6jAUc9MeCjwJHSQa3MpWM3B0VFYzY/6sQWgQmsEBu91WhXuYFHaqlqt6vJNkjpbc
	vhzDU8M+v28+w+dkbvdWxUtVMs/3xsZlnCUZoI+Cbpt5nYTWjfY67Xg5pWCQTdoyOgczXZ2bPQwD5
	6C9BftAh6ZPYv3ZKxFrZcDr9h5r3TVgMhMerzmiUBId+Vpusc5U+DwKEpoY+NhiUVjx/yiYxWsAiJ
	DZrauptv8RMYPy1OiE9r0Av0Ztdb5A+EsCH5J4G6vOtGWmAvF/ZctUER0JSXU3xgHFlQ2OJZAQXIm
	Njuvy4j3ITERDis7hg5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOzKK-00Fyk9-FO; Tue, 01 Mar 2022 10:01:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOzJP-00FyMU-6j
 for linux-mediatek@lists.infradead.org; Tue, 01 Mar 2022 10:00:56 +0000
Received: by mail-wr1-x42b.google.com with SMTP id e10so2012877wro.13
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Mar 2022 02:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=J1W+5NXO359jvQpWTWx2S3L1BddQHRxmvi0thYVEQxI=;
 b=EvioAi2JMzHmdmeCqilFnhiMJEBqSJpLbfddJCFexrQKhoas9sAmLMUXSg+ZUkTN3A
 3gbW+517u9+GHlE/ttlOlhf7MYLeXgR1yAP3JtAmn3BQa35tAnow3bxo4YfXa6wzFwed
 XO/wwQBK4BUJcWAucc1CvWou2Z5YRmyxsFH0dthzkcVUKHbuDYHYutzHNR8VdFpMIUWC
 yqLzFpfhmZFQpUiZAdhs1G/leot2Ib7ZfZPnjd9MGU9c+goa5RnFxXGrqgLUh8qDyUJs
 F+vTudPweGQdsJ/wiRpPdLwLWjCq8yQlbirDimUiC8TQ53/aepmR6CS0oP3nO6nu19BR
 xE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=J1W+5NXO359jvQpWTWx2S3L1BddQHRxmvi0thYVEQxI=;
 b=DRCvycWJK8DupMBy87HzEuFmAo+dpMWYgLbhhknyhDHzmkMSF/zoacc8MdjbWS/jOs
 UHm8O9JeYZussnGBUXKQhKUGq6QBq2Z672tUnP/8gFQWeR5UdeUhKvHAhaG3hyQYLgt1
 TKULDkDWtPfdUk59W3wFj8GsxbznckzgQ2jhmBI4S98YItJqqrM8i5klSvJltOSUFwmd
 Aba/X+YihDaFmerKhK3MIy9M+G46kpBwaGw9INh6zDZgIvQBT3BLDsvygEtSGl+9T2Zz
 NAvXpV+/EjEUNrcpkWBizatDFpFQy4iq3XF/YdMv2c/dO40Dljbx9NHyZBqQZhI8gJ9q
 Fb3Q==
X-Gm-Message-State: AOAM532Y0AMM9z19zLjk4tbwwm7Uqk5Zn+1hi9L0uqnqVRmCh/tmt0Ao
 y6zRcL8Pl5/GFtjHgNApwKgtXw==
X-Google-Smtp-Source: ABdhPJybNpwkGPWvhpD5Gj/Y2hRNA4Xb9vLVAVuQH7zbt/VnEvQAgZ5cHIde1jf/OW/iV2BGsYNRkA==
X-Received: by 2002:a5d:6405:0:b0:1ef:7df1:5c04 with SMTP id
 z5-20020a5d6405000000b001ef7df15c04mr12104965wru.178.1646128853485; 
 Tue, 01 Mar 2022 02:00:53 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 d6-20020a5d4f86000000b001ea8119512bsm13061374wru.55.2022.03.01.02.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 02:00:52 -0800 (PST)
Date: Tue, 1 Mar 2022 10:00:50 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Add compatibles for undocumented trivial
 syscons
Message-ID: <Yh3u0uD/oJ41M++b@google.com>
References: <20220228221537.1700071-1-robh@kernel.org>
 <c5d61fe7-5238-58ae-c782-5e28531d9b2b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c5d61fe7-5238-58ae-c782-5e28531d9b2b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_020055_280573_9E9C9000 
X-CRM114-Status: GOOD (  17.00  )
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

T24gVHVlLCAwMSBNYXIgMjAyMiwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKCj4gSGkgUm9iLAo+
IAo+IE9uIDI4LzAyLzIwMjIgMjM6MTUsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gJ2ludGVsLGxn
bS1zeXNjb24nLCAnbWFydmVsbCxhcm1hZGEtMzcwMC11c2IyLWhvc3QtbWlzYycsCj4gPiAnbWVk
aWF0ZWssbXQ4MTM1LXBjdGwtYS1zeXNjZmcnLCBhbmQgJ21lZGlhdGVrLG10ODEzNS1wY3RsLWIt
c3lzY2ZnJyBhcmUKPiA+IGFsbCB1c2VkIGluIERUIGJpbmRpbmcgZXhhbXBsZXMgYW5kL29yIGR0
cyBmaWxlcywgYnV0IGFyZSBub3QKPiA+IGRvY3VtZW50ZWQuIEFkZCB0aGVtIHRvIHN5c2Nvbi55
YW1sIGFzIHRoZXkgYXJlIGFsbCB0cml2aWFsIGNhc2VzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3lzY29uLnlhbWwgfCA0ICsrKysKPiA+ICAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zeXNjb24ueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3lzY29uLnlhbWwKPiA+IGluZGV4IGVlYWMxY2Jj
NWExNy4uMjlkNGE5N2Y3MTA4IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21mZC9zeXNjb24ueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9zeXNjb24ueWFtbAo+ID4gQEAgLTQ0LDYgKzQ0LDEwIEBAIHBy
b3BlcnRpZXM6Cj4gPiAgICAgICAgICAgICAgICAgLSBoaXNpbGljb24saGk2MjIwLXNyYW1jdHJs
Cj4gPiAgICAgICAgICAgICAgICAgLSBoaXNpbGljb24scGNpZS1zYXMtc3ViY3RybAo+ID4gICAg
ICAgICAgICAgICAgIC0gaGlzaWxpY29uLHBlcmktc3ViY3RybAo+ID4gKyAgICAgICAgICAgICAg
LSBpbnRlbCxsZ20tc3lzY29uCj4gPiArICAgICAgICAgICAgICAtIG1hcnZlbGwsYXJtYWRhLTM3
MDAtdXNiMi1ob3N0LW1pc2MKPiA+ICsgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTM1LXBj
dGwtYS1zeXNjZmcKPiA+ICsgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTM1LXBjdGwtYi1z
eXNjZmcKPiAKPiBUaGFua3MgZm9yIGZpbGxpbmcgdGhlIGdhcC4gV291bGQgeW91IG1pbmQgdG8g
YWRkIGFzIHdlbGw6Cj4gIm1lZGlhdGVrLG10MjcwMS1wY3RsLWEtc3lzY2ZnIgo+ICJtZWRpYXRl
ayxtdDI3MTItcGN0bC1hLXN5c2NmZyIKPiAibWVkaWF0ZWssbXQ3NjIzLXBjdGwtYS1zeXNjZmci
Cj4gIm1lZGlhdGVrLG10ODE3My1wY3RsLWEtc3lzY2ZnCj4gCj4gV2l0aCB0aGF0Ogo+IFJldmll
d2VkLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgoKUGxlYXNl
IGZvbGxvdy11cCB3aXRoIGEgc2VwYXJhdGUgcGF0Y2guCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzm
lq9dClByaW5jaXBhbCBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8u
b3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzog
RmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
