Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDF2C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 15:04:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F3DB204FD
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 15:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UphyigiZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k3PdcOBA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F3DB204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qECMzPGAAPGahGNYMe+BaWMIzmIDalbTrhiFEVfUKPA=; b=UphyigiZfkGajD9IrQcycKGIh
	suRrLpLyIo98ynVPF8eXSAtre/G11+bF/4WnmzAKKklkikglB5I2N1dPHAEcVxc68rY5dEa2jRYLD
	tVYqAgn4ww7tfFZ2xajPyCQjHlEQ3sGu9r4oRvEAKMUbYdnFBGauDptMilmeHHclEShSIOpnn6w0I
	46YP8COIPy8iMDC+wcH26+0bbHelS4nSvwmYGp6qKIcPW6ZHVK4OaDa10gY4QfMNw3tDAbs4T4I6Q
	0cQn3mNE10N3wpUFI00cpgxkuyVUlDk0tk1GL5IEQkaL4K+dbo8+MWvrftHlmtwkBfAkOcYJoIciE
	2icLWjbGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7ggs-0002be-PR; Mon, 17 Aug 2020 15:04:50 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7ggq-0002b6-Et; Mon, 17 Aug 2020 15:04:49 +0000
Received: by mail-oi1-x242.google.com with SMTP id z22so15075447oid.1;
 Mon, 17 Aug 2020 08:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d6ygu7yB/ujRPicbXyGxxAa8G3qW+b6Pxo9XVrZgMhg=;
 b=k3PdcOBAs8eNGqpjg0cD63uWZU3AZUe2rARWPvRY3xs9ccxnDb0t7T5Qw+DxLpenkb
 Wg/wRdeN1jg6rlfQqD2Vir66HguiwzMHhHd7RwcYid3sKyDJMntXYqGL45bjNGFZmg2O
 mzlF8x5VeXqFDu387q0cmojqYFDcUGNF8oNhaY8D0oojF5s41pvDX5P8X5zEA6q0iSls
 QeYO8ngCULKr4zTUddufWCcNWCNbdYXhaJ4xx4Ib8vXvHREiB1kjH+Mwqxt5bjJQ4fCd
 RtMk5/AgqKL9zZKyjKIKUJq1M++BLwaqiU6ZI/5tGkNGenFPf3fZqTuGrzOroeIB7jI8
 MmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d6ygu7yB/ujRPicbXyGxxAa8G3qW+b6Pxo9XVrZgMhg=;
 b=X2MZZdDoh/d623C5NgIN5JmCiai0xzV4tJnMA7ncHw9d5k0r206g1RMmkasWC/XC/n
 KNzAkdGe/xWp1vPQf7yIba5H0bkw4J5jmhcgvhW6KoXHZthY6xd69PY/BwSBf53DHWUM
 j+OUbfXAKieW22TF18zTw0LJhwpllRww/JzinBgqPlK5qgQeNes/bfwfTt8aP63SN1Kd
 zPWGMaZE5nJFX6K7MnrG4kLmNDvPL1WDLtLiu7wx+1GvDHcZMYcEsxE8FztcR3LNZiOW
 4gOOLsgk7rNkAwJF1Y64HpgxZ1NrZsjFKjyQ+I77kUDH3siLqMBiT0t2ZIZaNFupXFGN
 gvDg==
X-Gm-Message-State: AOAM5306iyLTCDhobSv1eYdAkaB0O1Inad/jWI1icusPlSmVg0CMGI07
 HMTi0Hi+1UwuJLAm7QLBG7CeIPRV3zueDRYw3hk=
X-Google-Smtp-Source: ABdhPJxmyaXL4AVUuqaFZwCfq5LT8P6R7o1QhehDVn5e7xYBKgetFnuM/8R3EajqK660oaSHsxjuJRRjP/UmpZN8vFA=
X-Received: by 2002:aca:240b:: with SMTP id n11mr10214622oic.47.1597676686009; 
 Mon, 17 Aug 2020 08:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200817145738.986999-1-linux@fw-web.de>
In-Reply-To: <20200817145738.986999-1-linux@fw-web.de>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 17 Aug 2020 17:04:32 +0200
Message-ID: <CAFqH_53ppxNqhjqpv8z4vz7GPFMxtM8nswx5pgyz5Sx00wGbFA@mail.gmail.com>
Subject: Re: [PATCH] Revert "irqchip/mtk-sysirq: Convert to a platform driver"
To: Frank Wunderlich <linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_110448_537816_7FF71361 
X-CRM114-Status: GOOD (  17.69  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Jason Cooper <jason@lakedaemon.net>,
 Frank Wunderlich <frank-w@public-files.de>, Marc Zyngier <maz@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgRnJhbmssCgpNaXNzYXRnZSBkZSBGcmFuayBXdW5kZXJsaWNoIDxsaW51eEBmdy13ZWIuZGU+
IGRlbCBkaWEgZGwuLCAxNyBk4oCZYWcuCjIwMjAgYSBsZXMgMTY6NTg6Cj4KPiBGcm9tOiBGcmFu
ayBXdW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5kZT4KPgo+IFRoaXMgcmV2ZXJ0cyBj
b21taXQgZjk3ZGJmNDhjYTQzMDA5ZThiOGJjZGYwN2Y0N2ZjOWYwNjE0OWIzNiB3aGljaAo+IGJy
ZWFrcyBib290dXAgb2YgYXJtL2FybTY0IGRldmljZXMgbGlrZSBiYW5hbmFwaS1yMi9tdDc2MjMg
YW5kCj4gYmFuYW5hcGktcjY0L210NzYyMgo+Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmsgV3VuZGVy
bGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+CgpJIGFscmVhZHkgYW5zd2VyZWQgeW91ciBC
VUcgcmVwb3J0LCBidXQsIGZvciB0aGUgcmVjb3JkLCBJIHRoaW5rIGEKcHJvcGVyIGZpeCBpcyBm
b2xsb3dpbmcgaGlzIHdheSBbMV0gYW5kIHByb2JhYmx5IHdpbGwgYmUgbWVyZ2VkIHNvb24uCgpb
MV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbWF6L2Fy
bS1wbGF0Zm9ybXMuZ2l0L2NvbW1pdC8/aD1pcnEvaXJxY2hpcC1uZXh0JmlkPTc4MjhhM2VmODY0
NmZiMmU2OWVkNDU2MTZjODQ1M2EwMzdjYTc4NjcKClRoYW5rcywKIEVucmljCj4gLS0tCj4gIGRy
aXZlcnMvaXJxY2hpcC9pcnEtbXRrLXN5c2lycS5jIHwgNCArLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2lycWNoaXAvaXJxLW10ay1zeXNpcnEuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtbXRrLXN5c2ly
cS5jCj4gaW5kZXggNzI5OWM1YWI0ZDEwLi42ZmY5OGI4N2U1YzAgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9pcnFjaGlwL2lycS1tdGstc3lzaXJxLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJx
LW10ay1zeXNpcnEuYwo+IEBAIC0yMzEsNiArMjMxLDQgQEAgc3RhdGljIGludCBfX2luaXQgbXRr
X3N5c2lycV9vZl9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKPiAgICAgICAgIGtmcmVl
KGNoaXBfZGF0YSk7Cj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4gLUlSUUNISVBfUExBVEZP
Uk1fRFJJVkVSX0JFR0lOKG10a19zeXNpcnEpCj4gLUlSUUNISVBfTUFUQ0goIm1lZGlhdGVrLG10
NjU3Ny1zeXNpcnEiLCBtdGtfc3lzaXJxX29mX2luaXQpCj4gLUlSUUNISVBfUExBVEZPUk1fRFJJ
VkVSX0VORChtdGtfc3lzaXJxKQo+ICtJUlFDSElQX0RFQ0xBUkUobXRrX3N5c2lycSwgIm1lZGlh
dGVrLG10NjU3Ny1zeXNpcnEiLCBtdGtfc3lzaXJxX29mX2luaXQpOwo+IC0tCj4gMi4yNS4xCj4K
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
