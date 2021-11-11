Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62B4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 11:36:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A63D461208
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 11:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A63D461208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVzpcH8jSTy/IJb7rhH618l4vRCDSN6C8i0nuj1J4z8=; b=r12rGiPp7aRNnGhlwvZZn6q/uR
	u4O9ZN6jz3QEugy+ofllfQ6BYmK1cV1ulbp3vUdqzV+QWb/F6u8WkVm8yyVM6xvBoYbW0h1RL7+Zo
	+fb44zbEdVlx3Jg/hBW3wrpG0AiDJPhHK2J+VO8rQfJDcoyeYblhmZ1gpr11Xb+0EyYD/+RYHbs7G
	hDWZ2/tVV9sui05IorjinJywcRQlnYnS2T2y6fLOuALfdt7h4BUrzMUhVD3ectTeEL7dBIiyKpqMp
	o8RGduutYqovlUYXIs39nWcszRfO4NZs2vmXa7h5/jIWaGcFYn1zEcGRXBe1XeL0ERjXfK1/2arZM
	2CVKEr+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ml8NJ-007nb6-Re; Thu, 11 Nov 2021 11:36:13 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ml8N5-007nZ7-4C; Thu, 11 Nov 2021 11:36:00 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 26B8321B37;
 Thu, 11 Nov 2021 11:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636630556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rt8/aMa5Kry7fqouFBixTE9VuPZ3pHAbttQhw0tgJc4=;
 b=tYGz6h/KDA+Q/zJgrUumoUPd7y2S0wD7gXgB8Dlj2FqGCJJxZhq5/5HA1qzKR7H6wbDnas
 1WCfDAhM+uo3mxBihzZHjHCIn0mY+ApqAVvLGq/7ANy1SJx87ErxkEwzCC0UE0A7FAF71I
 /ey+7UqTTJv4VygIHujfmclXPSyl+7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636630556;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rt8/aMa5Kry7fqouFBixTE9VuPZ3pHAbttQhw0tgJc4=;
 b=qLh9JQx9hbbITghv5K0PLtUppefmmFDFNejE4ijyqP/vBAR62yFPrbtNmpT2aWpj8BQEwl
 Sd8oGasviazh+cDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C969313358;
 Thu, 11 Nov 2021 11:35:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lD43LBoAjWFMUAAAMHmgww
 (envelope-from <dkirjanov@suse.de>); Thu, 11 Nov 2021 11:35:54 +0000
Subject: Re: [PATCH v2 0/5] MediaTek Ethernet Patches on MT8195
To: Biao Huang <biao.huang@mediatek.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, srv_heupstream@mediatek.com,
 macpaul.lin@mediatek.com
References: <20211111071214.21027-1-biao.huang@mediatek.com>
From: Denis Kirjanov <dkirjanov@suse.de>
Message-ID: <c2d3c746-ab32-eb99-0408-1409f43248cd@suse.de>
Date: Thu, 11 Nov 2021 14:35:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211111071214.21027-1-biao.huang@mediatek.com>
Content-Language: ru
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_033559_359344_9EE384F2 
X-CRM114-Status: GOOD (  15.10  )
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

CgoxMS8xMS8yMSAxMDoxMiBBTSwgQmlhbyBIdWFuZyDQv9C40YjQtdGCOgo+IENoYW5nZXMgaW4g
djI6Cj4gMS4gZml4IGVycm9ycy93YXJuaW5ncyBpbiBtZWRpYXRlay1kd21hYy55YW1sIHdpdGgg
dXBncmFkZWQgZHRzY2hlbWEgdG9vbHMKPiAKPiBUaGlzIHNlcmllcyBpbmNsdWRlIDUgcGF0Y2hl
czoKPiAxLiBhZGQgcGxhdGZvcm0gbGV2ZWwgY2xvY2tzIG1hbmFnZW1lbnQgZm9yIGR3bWFjLW1l
ZGlhdGVrCj4gMi4gcmVzdWUgbW9yZSBjb21tb24gZmVhdHVyZXMgZGVmaW5lZCBpbiBzdG1tYWNf
cGxhdGZvcm0uYwo+IDMuIGFkZCBldGhlcm5ldCBlbnRyeSBmb3IgbXQ4MTk1Cj4gNC4gY29udmVy
dCBtZWRpYXRlay1kd21hYy50eHQgdG8gbWVkaWF0ZWstZHdtYWMueWFtbAo+IDUuIGFkZCBldGhl
cm5ldCBkZXZpY2Ugbm9kZSBmb3IgbXQ4MTk1CmFsbCBuZXcgZmVhdHVyZSBzaG91bGQgYmUgc2Vu
dCBwcmVmaXhlZCB3aXRoIG5ldC1uZXh0Cj4gCj4gQmlhbyBIdWFuZyAoNSk6Cj4gICAgbmV0OiBz
dG1tYWM6IGR3bWFjLW1lZGlhdGVrOiBhZGQgcGxhdGZvcm0gbGV2ZWwgY2xvY2tzIG1hbmFnZW1l
bnQKPiAgICBuZXQ6IHN0bW1hYzogZHdtYWMtbWVkaWF0ZWs6IFJldXNlIG1vcmUgY29tbW9uIGZl
YXR1cmVzCj4gICAgbmV0OiBzdG1tYWM6IGR3bWFjLW1lZGlhdGVrOiBhZGQgc3VwcG9ydCBmb3Ig
bXQ4MTk1Cj4gICAgZHQtYmluZGluZ3M6IG5ldDogZHdtYWM6IENvbnZlcnQgbWVkaWF0ZWstZHdt
YWMgdG8gRFQgc2NoZW1hCj4gICAgYXJtNjQ6IGR0czogbXQ4MTk1OiBhZGQgZXRoZXJuZXQgZGV2
aWNlIG5vZGUKPiAKPiAgIC4uLi9iaW5kaW5ncy9uZXQvbWVkaWF0ZWstZHdtYWMudHh0ICAgICAg
ICAgICB8ICA5MSAtLS0tLQo+ICAgLi4uL2JpbmRpbmdzL25ldC9tZWRpYXRlay1kd21hYy55YW1s
ICAgICAgICAgIHwgMjExICsrKysrKysrKysrKwo+ICAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDgxOTUtZXZiLmR0cyAgIHwgIDkyICsrKysrCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210ODE5NS5kdHNpICAgICAgfCAgNzAgKysrKwo+ICAgLi4uL2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMgIHwgMzEzICsrKysrKysrKysrKysrKystLQo+
ICAgNSBmaWxlcyBjaGFuZ2VkLCA2NjQgaW5zZXJ0aW9ucygrKSwgMTEzIGRlbGV0aW9ucygtKQo+
ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9u
ZXQvbWVkaWF0ZWstZHdtYWMudHh0Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9tZWRpYXRlay1kd21hYy55YW1sCj4gCj4gLS0KPiAy
LjE4LjAKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
