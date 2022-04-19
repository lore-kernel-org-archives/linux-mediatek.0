Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF640C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 18:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rHgmZKFovwjWM/dm6UPxC8yPvWlHj5AyD5J4kRSQrk0=; b=ZfxT1WKOC5QgZK
	NDmle7PI1VpRdf1umn7Usjn6VS9UjZOryImcFXOOwy0JS1y64Ku8RngP5Sf8V/RTxdGjmi4mcrW2j
	717mtgMnSbebQgfRDjJB0goKhlagUjuToQk8Jd+Vu7Zx2ge+CE9TUgU8FI46tl8UMJb7wRrB6ir+D
	fFS6SSCEV7qKhFsHi46R3CgiZ9P8B7V9iUAbT8Z6dEcM6YhmsZC2JTB9HfyG0184LF0DSXtrLf60g
	ix/37cp4lw+oMpQFT9VbfY0Dy5ll498ISJ55/eAwg9+pdbwc3/chltJvkGNLOicQED7RaKS3w7l/C
	8YiMFKLBPPKsl4ku0c9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngsBP-005UdL-Fe; Tue, 19 Apr 2022 18:02:35 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngsBD-005Ua7-Gh; Tue, 19 Apr 2022 18:02:25 +0000
Received: by mail-oi1-f171.google.com with SMTP id a10so1514768oif.9;
 Tue, 19 Apr 2022 11:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2uhrxcL/WlGsDwYOE/ex3LEujw8S7I6uYFrm/mTX47Y=;
 b=RufHWo+Kzlt8XQeDRYNS/LU5DaKzJn+ni25+ypqVW61mgNKWF6uuYmCukeJjzT1u9X
 9jYf5ypEw8vWsGk9LlFeJupGWmkbHMee7/v+wQsJNKMlL/XF5O06vuIee+drejWbavb+
 9jFseBgNG5oCRSXMK6ZwivE6W61D+MJC5kkgkO0wDKQnijnHM6McE0M/0gb7wr/HVbTo
 HidaXE6zuQRtcCveqgTxPNX8mshc2/RxTjV3gSW4cMqhKSQcBsleT9brxP4M0QXsd0kI
 mTlbE7s4fgU5bCWhgVAKSacVguO+2BisqTvFqYH67M/BiPA4DGg3ST/fx4kY2pfRSW7H
 i8tA==
X-Gm-Message-State: AOAM532o/vP9dwn8KzzSQJR2k9Z5MMUQh668OP4ylhL6WhqxdTkt3vuu
 hkhe2PxbsmUL19fkKuG15g==
X-Google-Smtp-Source: ABdhPJyC+Ey/LhVwewvu2Dj6uL7e/Pw+ekpuC4DuhF5AskRoN9KlHzZy7DPkZte98+AH/aX0tN54yg==
X-Received: by 2002:a05:6808:13d3:b0:322:8cf5:3afb with SMTP id
 d19-20020a05680813d300b003228cf53afbmr4871293oiw.186.1650391340596; 
 Tue, 19 Apr 2022 11:02:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 5-20020a9d0105000000b005fbe5093eb0sm5606044otu.54.2022.04.19.11.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 11:02:20 -0700 (PDT)
Received: (nullmailer pid 3063578 invoked by uid 1000);
 Tue, 19 Apr 2022 18:02:19 -0000
Date: Tue, 19 Apr 2022 13:02:19 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, erkin.bozoglu@xeront.com,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 Joe Perches <joe@perches.com>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 10/14] dt-bindings: pinctrl: rt2880: fix binding name, 
 pin groups and functions
Message-ID: <Yl75K2iSlAY+9DQF@robh.at.kernel.org>
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
 <20220414173916.5552-11-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414173916.5552-11-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_110223_590478_258634B8 
X-CRM114-Status: GOOD (  11.24  )
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

T24gVGh1LCAxNCBBcHIgMjAyMiAyMDozOToxMiArMDMwMCwgQXLEsW7DpyDDnE5BTCB3cm90ZToK
PiBEZXByZWNhdGUgdGhlIG9sZCBwcm9wZXJ0eSAicmFsaW5rLHJ0Mjg4MC1waW5tdXgiLiBBZGQg
dGhlIG5ldyBwcm9wZXJ0eQo+ICJyYWxpbmsscnQyODgwLXBpbmN0cmwiLiBUaGUgb2xkIHByb3Bl
cnR5IG5hbWUgd2FzIGluYWNjdXJhdGUgYXMgdGhlCj4gaGFyZHdhcmUgYmxvY2sgaXMgY2FsbGVk
IHBpbmN0cmwgYWNyb3NzIHRoZSBNZWRpYXRlay9SYWxpbmsgYXJjaGl0ZWN0dXJlLgo+IAo+IEN1
cnJlbnQgcGluIGdyb3VwIGFuZCBmdW5jdGlvbiBiaW5kaW5ncyBhcmUgZm9yIE1UNzYyMS4gUHV0
IGJpbmRpbmdzIGZvcgo+IFJUMjg4MCBpbnN0ZWFkLgo+IAo+IEFkZCBtZSBhcyBhIG1haW50YWlu
ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzku
Y29tPgo+IC0tLQo+ICAuLi5waW5tdXgueWFtbCA9PiByYWxpbmsscnQyODgwLXBpbmN0cmwueWFt
bH0gfCAyNiArKysrKysrKystLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiAgcmVuYW1lIERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waW5jdHJsL3tyYWxpbmsscnQyODgwLXBpbm11eC55YW1sID0+IHJhbGluayxy
dDI4ODAtcGluY3RybC55YW1sfSAoNTMlKQo+IAoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
