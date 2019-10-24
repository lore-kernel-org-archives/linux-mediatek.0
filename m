Return-Path: <SRS0=Rw5Z=YR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D62CA9EBB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 08:19:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 446FB2166E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 08:19:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KU2SkNgh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rctbzubu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 446FB2166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=532Az9lxdIFkeZr5lc6nUVZSlWUwLnKSv1dJHfQsRI8=; b=KU2SkNghFELSED
	OzZpg1yS3UKgVPV1hDm8VvaF/X0IczcvN1NXw8rprFDEvVnGJokltnwnZoui0bZLx7zfk3j+Nyqy+
	/f6xgYn8exNu3E0XB0WGwyogjfQfuzjiUsFe1sCh+TVRHmYv8uEEe/9XJJYgyo2Bk6Ch07Duaumqm
	XrApXUGI3wHEfcl1FGsCn5Zeg9cMw4p/rZApTVXc0S18bmclhvbR8pirR/95Mp9yHmndudCXY5AEu
	s2tYCELnrrV/S0R93YwKeAtXuMIuYOkgtqwgcf+I6jUZ8kbgw03+fQX75zlpCKyo/uLGPtcJAa7ho
	l00bwmHFp6Bq4bYg1lug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNYLD-0001gC-8I; Thu, 24 Oct 2019 08:19:31 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNYLA-0001XF-7k
 for linux-mediatek@lists.infradead.org; Thu, 24 Oct 2019 08:19:29 +0000
Received: by mail-wr1-x442.google.com with SMTP id c2so19744944wrr.10
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Oct 2019 01:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=bwpDjxlqC/mR626oiSg3Rt01CrIhV7qqzUguEfa254s=;
 b=rctbzubuNGhdxVH1cHUWtH6wBzi8gxCG7yptBsEwlS4gWYi5kvsNmT5BF4Sx07qp03
 58+QCW2JdBBoM9MZBOrilx3qjwt1pb3RAsdbjhrSXDYYFb4wml6EVX3Bs/aywQ4UNhG8
 g19cVHb9HkAZ9rUULh4jSiUc2yNbtPugmpoip64TkSO4UIAAG18+IJE9hjxcq2qm8KJL
 e2ayVuB/OBKuH/SKnTWW1287Id3pdrM8Kq8mS6QRWQ+9KMQAWQLgo0JsGf2XDVB07rnm
 ovkLyNEZQ+K3iQzF/ep2WCT0oIDVsJbkvCmePPccdB22nf8flh0RBaX0s5BG6ckHuscZ
 9Gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=bwpDjxlqC/mR626oiSg3Rt01CrIhV7qqzUguEfa254s=;
 b=kbIu0WbAW+9jXXgqJwSuoE/jqbF2K0810Fdrq8ueUr4Fdq5OADxvpqMayc0/eESTiC
 /9XT61s9pD2t9LjHvBggXSdGLM+i2Lq6PkdJ3/z03QAicETNa2/0GSaaXWGJlBLDiY4/
 BUKvORsD53MInCiKgEUmLmH5GqL+Kk1ij5PxPXNBMYpIehPoriQ3DysmOxHVBQ47KSLY
 LLQBOg9ZqBUWcmrjg6q3ITH0LcIRkEEgLYFUIKoBIyE+ZEydYRLNApusi6gw4epTx6hQ
 CMm5/TRIV75z1jzfVTpQQzBB8oWbGluz7B8YzieiSW5IPsfoq3FBwLMPjRsWdcB91s9j
 Ld9g==
X-Gm-Message-State: APjAAAUp1sjGwY1/6FZuzLQZKFsNqJ8q2zt4/RVHsMIArbQk6I6PL7z4
 J5uQq/fs4hLmI/EtJKaaOM7lRw==
X-Google-Smtp-Source: APXvYqzeWDHSLcoAOmOaHrCuIDnceXDiEw2PFxiRUtr8YD5A9NrQvgKoaJB8J6nksskgcWcq450hBA==
X-Received: by 2002:adf:c448:: with SMTP id a8mr2657636wrg.233.1571905165370; 
 Thu, 24 Oct 2019 01:19:25 -0700 (PDT)
Received: from dell ([95.149.164.99])
 by smtp.gmail.com with ESMTPSA id u1sm35262518wru.90.2019.10.24.01.19.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Oct 2019 01:19:24 -0700 (PDT)
Date: Thu, 24 Oct 2019 09:19:23 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: [GIT PULL] Immutable branch between MFD, Power and RTC due for the
 v5.5 merge window
Message-ID: <20191024081923.GJ15843@dell>
References: <20190910070446.639-1-frank-w@public-files.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190910070446.639-1-frank-w@public-files.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_011928_286076_BF135207 
X-CRM114-Status: GOOD (  12.70  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>,
 linux-pm@vger.kernel.org, Josef Friedl <josef.friedl@speed.at>,
 linux-kernel@vger.kernel.org, Tianping Fang <tianping.fang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Sebastian Reichel <sre@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RW5qb3khCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDU0ZWNiOGY3MDI4YzVl
YjNkNzQwYmI4MmIwZjFkOTBmMmRmNjNjNWM6CgogIExpbnV4IDUuNC1yYzEgKDIwMTktMDktMzAg
MTA6MzU6NDAgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoK
CiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2xlZS9tZmQu
Z2l0IGliLW1mZC1wb3dlci1ydGMtdjUuNQoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IDlkMDg2M2JhZmY0OTc4ODBjMTQyN2QzZWE3Yjg5YjMwM2FjZTk2NzU6CgogIE1BSU5UQUlORVJT
OiBhZGQgTWVkaWF0ZWsgc2h1dGRvd24gZHJpdmVycyAoMjAxOS0xMC0yNCAwOTowNDowMCArMDEw
MCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KSW1tdXRhYmxlIGJyYW5jaCBiZXR3ZWVuIE1GRCwgUG93ZXIgYW5kIFJUQyBk
dWUgZm9yIHRoZSB2NS41IG1lcmdlIHdpbmRvdwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpKb3NlZiBGcmllZGwgKDYpOgog
ICAgICBkdC1iaW5kaW5nczogcnRjOiBtZWRpYXRlazogYWRkIG1pc3NpbmcgbXQ2Mzk3IHJ0Ywog
ICAgICBydGM6IG10NjM5NzogbW92ZSBzb21lIGNvbW1vbiBkZWZpbml0aW9ucyBpbnRvIHJ0Yy5o
CiAgICAgIHJ0YzogbXQ2Mzk3OiBpbXByb3ZlbWVudHMgb2YgcnRjIGRyaXZlcgogICAgICBydGM6
IG10NjM5NzogYWRkIGNvbXBhdGlibGUgZm9yIG10NjMyMwogICAgICBwb3dlcjogcmVzZXQ6IGFk
ZCBkcml2ZXIgZm9yIG10NjMyMyBwb3dlcm9mZgogICAgICBNQUlOVEFJTkVSUzogYWRkIE1lZGlh
dGVrIHNodXRkb3duIGRyaXZlcnMKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvcnRjLW10
NjM5Ny50eHQgICAgICAgICB8ICAyOSArKysrKysKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsrCiBkcml2ZXJzL3Bvd2VyL3Jlc2V0L0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArKwogZHJpdmVycy9wb3dlci9yZXNl
dC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9wb3dlci9y
ZXNldC9tdDYzMjMtcG93ZXJvZmYuYyAgICAgICAgICAgICAgfCAgOTcgKysrKysrKysrKysrKysr
KysrKwogZHJpdmVycy9ydGMvcnRjLW10NjM5Ny5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAxMDcgKysrKy0tLS0tLS0tLS0tLS0tLS0tCiBpbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvcnRj
LmggICAgICAgICAgICAgICAgICAgICB8ICA3MSArKysrKysrKysrKysrKwogNyBmaWxlcyBjaGFu
Z2VkLCAyMzYgaW5zZXJ0aW9ucygrKSwgODYgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9ydGMtbXQ2Mzk3LnR4dAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcG93ZXIvcmVzZXQvbXQ2MzIzLXBvd2Vyb2ZmLmMK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvcnRjLmgKCi0tIApM
ZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJv
OiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
