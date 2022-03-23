Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64DBC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 17:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mC70GoOoBcd3QzbUkHKUBJbWC/KH1jeLZJBfEe55JIs=; b=lLJtzMZY5zXQO1
	h/yXoLE84t/tOlG9BDsf81Ybh8131nSNcxbC5k0XI2udhCHBxr/Swf2cKfEHN2rr12WzR+dlW+89U
	74Hje1fcpx+nZ67C2aL6PZU2vTCzHTQCjZgs1+pTDcSvU8vKB6qTMjhlqTF87rjlZIMm1fU46eM/V
	XdCdQW4GUU8ytzZkDBbs3mLC8LGLi0xFOZoVJa9CrJKgjEtp0q+ibPxJybBYHvVf/3/MqOHVl4MDq
	kI6o++KAHvO9S8LZzoyjInjsINVX93wnhuudhwq3qEa4wmyifm+mQ8+kIHa0FpLxjDJYHuJvQU+hV
	jTqmKZ7j1tjHJiVfW3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX4ie-00EQmI-Ln; Wed, 23 Mar 2022 17:24:24 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX4iM-00EQfm-Az; Wed, 23 Mar 2022 17:24:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id v22so3134534wra.2;
 Wed, 23 Mar 2022 10:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Hb32dDdO1qQ+N0iO81Os3RXNLwN3DToRtRm2BHJ4zPY=;
 b=DRQktLhWWE7E8r8CBTkIuaY9kDFwj1GbxhNrCUaN4mKjEEvJoAnnnIUlC2KAtxVArp
 p/VyfyXpv1wETZBWfR6TEhNq3LkXs/9TnVkXq0ZybOllat3PX8hBPYETdN9omqua7TBN
 4E4maMMPy9qq/sPLEbxtO7vrmAfmWvqJ2yv7C4J9yThAyxr/4eaBVoYvkYf9Euhfv/Yl
 HejkFDaqKFS9k3wtm7OCoDof6qXtwhNc/I20Vbx/48z+lKZSdNc5gX87SFbWKbqeWACM
 J6OBPyupSfdVTLrs/EJQNhPfBaKYqd44oBOwYckaUG5nkAfjFgsgY1r+PJ3NUElMwrqy
 n0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hb32dDdO1qQ+N0iO81Os3RXNLwN3DToRtRm2BHJ4zPY=;
 b=XzSZsIR13u91Vq9QSPBe5MLhmuZfSUXPI3YXrfdKYcbDqz9AqZmgQzYYBoNrGenYI/
 iS9Am3AU5uEMr+IZd7Cc7/MqplF120jWSpjnpZVwCNtZ1vtPNsGKigYk9IAYhBJKu4Mg
 pVCqfFn8Gt8qChwA/8UYqjecole84iWgRPHQBR1WZp5zchnumSxM20SCtM1efnfIpNEJ
 phfRHkRvi697sEiuhn2tpyWD69ejwpLS0kc2tmXohMEVMKO3GJ8k6pf8iZIwLd9iurJg
 6i73wfdMdv+1z7+bQ6AnB5sMK3WtG1qAUH1dM81UY72f7TQz2seKhwuHSnvknCmvjmaQ
 P0xw==
X-Gm-Message-State: AOAM533SuD4nMRG5LtYnWWAY5Xw9wSEkjW6qSOjONqA2f9aUiRB7hj8D
 6omjMIP8UhCIrdWu5d+PY/g=
X-Google-Smtp-Source: ABdhPJz0gyJKC1sgaW3NYJbopqhfgocbBO3YRKk4AGZ4glvtMs0XETdWdH0DbswGnxUuw50ias6wlw==
X-Received: by 2002:a05:6000:1863:b0:204:101a:b2b4 with SMTP id
 d3-20020a056000186300b00204101ab2b4mr817017wri.259.1648056244689; 
 Wed, 23 Mar 2022 10:24:04 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a1ca102000000b0038c78fdd59asm4488884wme.39.2022.03.23.10.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 10:24:04 -0700 (PDT)
Message-ID: <a4935385-e7a5-8650-914b-73c699d2f8ca@gmail.com>
Date: Wed, 23 Mar 2022 18:24:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 03/22] arm64: dts: mt8192: Add gce node
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
 <20220318144534.17996-4-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_102406_408500_3DEDE46D 
X-CRM114-Status: GOOD (  14.76  )
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

CgpPbiAxOC8wMy8yMDIyIDE1OjQ1LCBBbGxlbi1LSCBDaGVuZyB3cm90ZToKPiBBZGQgZ2NlIG5v
ZGUgZm9yIG10ODE5MiBTb0MuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxsZW4tS0ggQ2hlbmcgPGFs
bGVuLWtoLmNoZW5nQG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogTsOtY29sYXMgRi4gUi4g
QS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgo+IFJldmlld2VkLWJ5OiBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEu
Y29tPgo+IC0tLQo+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIuZHRzaSB8
IDEwICsrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi5kdHNpCj4gaW5kZXggMGY5ZjIxMWNh
OTg2Li45ZTFiNTYzYmViYWIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDgxOTIuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4
MTkyLmR0c2kKPiBAQCAtNiw2ICs2LDcgQEAKPiAgIAo+ICAgL2R0cy12MS87Cj4gICAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvY2xvY2svbXQ4MTkyLWNsay5oPgo+ICsjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvZ2NlL210ODE5Mi1nY2UuaD4KPiAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQt
Y29udHJvbGxlci9hcm0tZ2ljLmg+Cj4gICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0
LWNvbnRyb2xsZXIvaXJxLmg+Cj4gICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcGluY3RybC9tdDgx
OTItcGluZnVuYy5oPgo+IEBAIC01NTIsNiArNTUzLDE1IEBACj4gICAJCQkjc2l6ZS1jZWxscyA9
IDwwPjsKPiAgIAkJfTsKPiAgIAo+ICsJCWdjZTogbWFpbGJveEAxMDIyODAwMCB7Cj4gKwkJCWNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLWdjZSI7Cj4gKwkJCXJlZyA9IDwwIDB4MTAyMjgw
MDAgMCAweDQwMDA+Owo+ICsJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjAzIElSUV9UWVBFX0xF
VkVMX0hJR0ggMD47Cj4gKwkJCSNtYm94LWNlbGxzID0gPDM+OwoKI21ib3gtY2VsbHMgc2hvdWxk
IGJlIDIsIHJpZ2h0PwoKUmVnYXJkcywKTWF0dGhpYXMKCj4gKwkJCWNsb2NrcyA9IDwmaW5mcmFj
ZmcgQ0xLX0lORlJBX0dDRT47Cj4gKwkJCWNsb2NrLW5hbWVzID0gImdjZSI7Cj4gKwkJfTsKPiAr
Cj4gICAJCXNjcF9hZHNwOiBjbG9jay1jb250cm9sbGVyQDEwNzIwMDAwIHsKPiAgIAkJCWNvbXBh
dGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLXNjcF9hZHNwIjsKPiAgIAkJCXJlZyA9IDwwIDB4MTA3
MjAwMDAgMCAweDEwMDA+OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
