Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34100C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 17:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6O6UwQP89vJshIUEirzFrZsEI5iJyNXIyWCivi1eR3E=; b=WLenGPMFGrlRuT
	D3njZxPAig7A/m4k+5+xajsGZEPNwhTgkT1Nnw91mB6U63L/jwVkcLc6ldF29g1jOMGLHxVsmTYYN
	0lBh7iYd+IoqkG19ouGnTqsLLfqPFvrGTXC+TDx8rEPDmzXc/gHHkPSUMzjYFonoTW/WSjKmXk4yd
	nNi7Cfa6oujpkLYOSKt+ELfdJ/78r4o9onW4czVa+g5Vux0w5sxAUdYm66JQpbuFyAQ6XaeKRx2cv
	+ju/EqbLUnji2GLI3i6OD0RvCmjRYL9j+C7/eUO8u40gcBynx85M1WWskYIgzeWrRRoOiFmogrYOW
	HdefoEOJMV4yIJyq1KZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX4aM-00EO2C-Uf; Wed, 23 Mar 2022 17:15:50 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX4aB-00ENzU-Qn; Wed, 23 Mar 2022 17:15:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so5778498wmb.4; 
 Wed, 23 Mar 2022 10:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oJQgROgJhAs1zSxE1mRh4y4eh7NMgOw/yWHgMuFN26I=;
 b=mIn5e6gAwLR5fDT8jPEigoygRWKOZzU/RGVaiTkiHDSNcImPNYdagX20DR3b1BPQnz
 A5OyFHQNmCzjzZGWJcEd2UE5HJnJdPz4px9EqJdrNmxmR4YVsjsoIEzWe8bVLchlWjEV
 KX0LTmh5mEJTBVR3OPe1PFpsH9mZu1TerF3m260/0Yz0j/jEesCTTaahD8KbDHQPrpek
 I21mlCuEE0L9YtlsscXN3rFaIxL5G8pobQaGC+ibhZDOPo3IrJdPnV2Awrmv8d5ZYSC+
 wvQ2hedNDq0VJjAFOMtFxvt3uiYwdNKymoLDN7afSMr4Y8r6XevbfxMDAkgWQ8uNNUIb
 uQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oJQgROgJhAs1zSxE1mRh4y4eh7NMgOw/yWHgMuFN26I=;
 b=e66iYg09OOFMyKds9y46hSPazD0PvYNjZO3c6DKaqOr9Bmnho5z0M0AEw1if0vGuPr
 lXxmsBkY2SiL4AifHK094odYqt5ZQxEmqp0zVX9gJo52lDTIyvYKt+bIkmO3aVnAO132
 JUbVZhL7bKyCjZy51J4Ytc7hVwZ3V0SSpybnue4lyw/Ebm/tPEEym7/GrNrejzpUmEDe
 UCvNQlFOPd2YBm3WbGeiaDJB7j54z/pVvwbR1wrxaQ7hEEKRo7MEEDpR7akfm7XewLM7
 ulkueVbOaPU8fvRpXg/9sDeM+IfK0pgPztH5T2v5P/nveh1JmF0G9LoDXQOj2Uj00gWa
 eHqg==
X-Gm-Message-State: AOAM532WNlbfV4MNeiVQXJf8AcSGS4VDGSroH1fMbkiUGLuB9/vStkS+
 PMfJ7+Gyi3dHd3vMAufU/ls=
X-Google-Smtp-Source: ABdhPJygYOPyQCoOA2LIJK6393T7O0XcTeprcQYnp4XDZQbgdlmkYUc4J0aKPLXB2HNYh3cMi0w2Qw==
X-Received: by 2002:a05:600c:190c:b0:38c:ca19:1bb7 with SMTP id
 j12-20020a05600c190c00b0038cca191bb7mr2502374wmq.152.1648055737123; 
 Wed, 23 Mar 2022 10:15:37 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d64cc000000b00203d45bfbc7sm408022wri.7.2022.03.23.10.15.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 10:15:36 -0700 (PDT)
Message-ID: <3bddd48b-95c2-de20-3aa2-0f6f3ebffd3e@gmail.com>
Date: Wed, 23 Mar 2022 18:15:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 01/22] arm64: dts: mt8192: Add pwrap node
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
 <20220318144534.17996-2-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_101539_895700_26F0A75A 
X-CRM114-Status: GOOD (  14.96  )
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

CgpPbiAxOC8wMy8yMDIyIDE1OjQ1LCBBbGxlbi1LSCBDaGVuZyB3cm90ZToKPiBBZGQgcHdyYXAg
bm9kZSBmb3IgbXQ4MTkyIFNvQy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGxlbi1LSCBDaGVuZyA8
YWxsZW4ta2guY2hlbmdAbWVkaWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBS
LiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZ2Vs
b0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9y
YS5jb20+CgpBcHBsaWVkCgpUaGFua3MKCj4gLS0tCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE5Mi5kdHNpIHwgMTIgKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE5Mi5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIu
ZHRzaQo+IGluZGV4IDQxMWZlYjI5NDYxMy4uNzY0Mjg1OTk0NDRlIDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKPiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4gQEAgLTUyMyw2ICs1MjMsMTggQEAKPiAg
IAkJCWNsb2NrLW5hbWVzID0gImNsazEzbSI7Cj4gICAJCX07Cj4gICAKPiArCQlwd3JhcDogcHdy
YXBAMTAwMjYwMDAgewo+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njg3My1wd3JhcCI7
Cj4gKwkJCXJlZyA9IDwwIDB4MTAwMjYwMDAgMCAweDEwMDA+Owo+ICsJCQlyZWctbmFtZXMgPSAi
cHdyYXAiOwo+ICsJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjIwIElSUV9UWVBFX0xFVkVMX0hJ
R0ggMD47Cj4gKwkJCWNsb2NrcyA9IDwmaW5mcmFjZmcgQ0xLX0lORlJBX1BNSUNfQVA+LAo+ICsJ
CQkJIDwmaW5mcmFjZmcgQ0xLX0lORlJBX1BNSUNfVE1SPjsKPiArCQkJY2xvY2stbmFtZXMgPSAi
c3BpIiwgIndyYXAiOwo+ICsJCQlhc3NpZ25lZC1jbG9ja3MgPSA8JnRvcGNrZ2VuIENMS19UT1Bf
UFdSQVBfVUxQT1NDX1NFTD47Cj4gKwkJCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JnRvcGNr
Z2VuIENMS19UT1BfT1NDX0QxMD47Cj4gKwkJfTsKPiArCj4gICAJCXNjcF9hZHNwOiBjbG9jay1j
b250cm9sbGVyQDEwNzIwMDAwIHsKPiAgIAkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTky
LXNjcF9hZHNwIjsKPiAgIAkJCXJlZyA9IDwwIDB4MTA3MjAwMDAgMCAweDEwMDA+OwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
