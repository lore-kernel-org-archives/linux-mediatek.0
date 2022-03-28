Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB1FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 13:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EdPHgfirzLXMrQU8mmUuyfImfs+askTruGzl/g0sPgs=; b=CDMZk6EQHO4eBf
	9yp8FlfjuCgaIZNhKAZ5KyaLMkGNgD8Ezh9bi+ptV+NDUxNNHVwHvgUwDmjrsZryHMAZTiMbWDGU1
	X75INQKMs6yjAw+XWgU38/Gvf6vxA9GmcKAKlJ8+/7CONQA+8opnvpVk6SAAD1u39efLtwsdG+yTZ
	vAjz4ZusnxrXUonRcxfRrZ9t5Fqy8xsAmZVvH36XczHcQ93PHIQbRUVFaGMlSq6hwCBAUB9tmf65u
	tcoEUWePWuXdeUhoMWAiYVWPolRmaGfW42VkMtv1WcwOfOSneL9KTthmUEgk0k9TB34mJx9yyVBKs
	NX8v0jWzgaUD1DWWnw4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYpsE-008xdJ-LO; Mon, 28 Mar 2022 13:57:34 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYpm3-008uvL-38; Mon, 28 Mar 2022 13:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1648475436;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=4ezCWy705CocHbi8RdHxAqN8vv3gv5SFt/Dzp2Yq4pw=;
 b=h67cVVRQQY22Ho6Oj4lqPV6bbZckg/sqlHJTvISuhhitSpD81WickIMTAt5h0AFRCu
 Qg+4KMYijDSN2sgiXaUl4mkWwL9szWD4xXIJNJkYGv3z88l0PTuJb0dZ/VHDeEbmgBID
 CBrquT4GkxLKaOV2BIp8osnHX+l3cX0/OHzhwCQzswvxR4LPQN6v+l5jOK8elenecZim
 yxdVkybdH/gWZLIWfRewxjT6C6qAdZGJSpqqZf7tPJGeXqzB/cGuyUHgPrRZx7Uc2aQt
 y0IhuWC0oSbH7Z+AuXQhtPgu/MgbvE1jvg6fxo79GX5ZqOVxt5WvtyeuH2CF7eSsjLBB
 +nnw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43u32M="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.42.1 DYNA|AUTH)
 with ESMTPSA id u3e945y2SDoZ3IR
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 28 Mar 2022 15:50:35 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <YkG2RPrtPaBNXb7a@latitude>
Date: Mon, 28 Mar 2022 15:50:34 +0200
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra@vger.kernel.org, linux-oxnas@groups.io,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Message-Id: <D9AFAC3C-46CA-4C40-8559-FD6934411CAB@goldelico.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <YkG2RPrtPaBNXb7a@latitude>
To: =?utf-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Ansuel Smith <ansuelsmth@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_065111_351638_C669D1FE 
X-CRM114-Status: UNSURE (   4.84  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cgo+IEFtIDI4LjAzLjIwMjIgdW0gMTU6MjEgc2NocmllYiBKb25hdGhhbiBOZXVzY2jDpGZlciA8
ai5uZXVzY2hhZWZlckBnbXgubmV0PjoKPiAKPiBPciBtYXliZSBiY20gaW5zdGVhZCBvZiBicm9h
ZGNvbS4gTm90IHN1cmUgd2hpY2ggaXMgcHJlZmVycmVkIGJ5Cj4gQnJvYWRjb20gcGVvcGxlLgoK
TWF5YmUgaXQgc2hvdWxkIGFsd2F5cyBmb2xsb3cgdGhlIGxpc3Qgb2YgdmVuZG9yIHByZWZpeGVz
IGFzIHdlIGFyZSB0YWxraW5nIGFib3V0IERUUz8KCmp1c3QgbXkgMmN0cywKTmlrb2xhdXMKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
