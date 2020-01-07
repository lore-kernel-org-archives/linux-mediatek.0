Return-Path: <SRS0=GJVM=24=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71F1C33C8C
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 12:15:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D2562087F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 12:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uGe4GfLn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D2562087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXJDgWuaWpfFPg9LP8ZWqEwKphVB2AB4YXqpETL9FZs=; b=uGe4GfLnvyIBfO
	0vUGTX5MqPXCdOZL3insSO6AO3qLAotMaQBgRWDktJWLHTQD3p3IxOF/4pMMC4ID/qsPhWHDJO3yc
	d489qfXe/Sq48Oq//d53gKXatm8tUgzGdAYLVKLG/WNEdeAjQSjKguNO/jFqGXFV3kdyV4EvN6FCD
	cdiLv3wZbhv326POH68IpSt1MbWM10Q34ZvZAv4qQAoN/0jE36zpvPUSNEnNsxUTi/wtPbuQ1NVuE
	TdUU4eZ53IdnE6dnUXELRXA2gjcCVWHc6o8fUAICBhgQIdJn/a/sBv7UUjGdIukg6sVdj3P+YNBxS
	wg98pP+NkzIR8LFk3RPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ionlX-00006M-9M; Tue, 07 Jan 2020 12:15:19 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ionlU-00005N-Ll; Tue, 07 Jan 2020 12:15:17 +0000
Received: by mail-ed1-f65.google.com with SMTP id b8so50167541edx.7;
 Tue, 07 Jan 2020 04:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dkoKwK15oscs3r0V8scapeKxlP48dhvoGFKEGuBFTog=;
 b=W9+hJuWRMWNEoxiRmOUFBZOi0pq/koL2/0HygK+1yiAYpl+w8GwHLuzMTKzZR4HVs8
 U2D24QfyD011Oiro/m5M2oSJcMuXaSaMQP4SOeSE1iX2Q7y2t4IEQGzi+C8yDH3k7nvj
 inX9p7fBE7P9xOKGlVTnFM9+bL28Co1ZJG5J6IGLOuDjSBdaebP1pSC5BQfBiDD3hnTb
 ALK9da3uT5W5qT7Ih1yNWGiW9ZhbFqZ+dujYtVM4VFUby7QpOZR9V36H1acn/SMZmkeb
 +kOY3B4nzvou4+M0thQ+qOILhdZ2nzjUgtNFuchoik9NhUKG0IsJ+rtA7Q/mVaUPhW7T
 jILw==
X-Gm-Message-State: APjAAAWXqLU1teZPYdYajOZb1cl4md1GdOcc8R/bnqRrtM3bfHMNPZIF
 9GMTg1cEMPCoTDfAp/LNfoRXXJ7c
X-Google-Smtp-Source: APXvYqwW9wXBZpzOMfTBS/kbOe4ZNckfdL5+6WOz5BazFgA1mugpFZqXKx0VrM2wxvGj7bgEnT9msA==
X-Received: by 2002:a17:906:eda9:: with SMTP id
 sa9mr109435185ejb.297.1578399315230; 
 Tue, 07 Jan 2020 04:15:15 -0800 (PST)
Received: from pi3 ([194.230.155.149])
 by smtp.googlemail.com with ESMTPSA id f9sm7382215edr.66.2020.01.07.04.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 04:15:14 -0800 (PST)
Date: Tue, 7 Jan 2020 13:15:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] pwm: Enable compile testing for some of drivers
Message-ID: <20200107121512.GA319@pi3>
References: <20191230172113.17222-1-krzk@kernel.org>
 <20191230172113.17222-2-krzk@kernel.org>
 <20200107072645.ko247bwhh3ibdu73@pengutronix.de>
 <20200107082539.GA31827@pi3>
 <20200107104234.wq74fska3szrg4ii@pengutronix.de>
 <20200107110359.GA32423@pi3>
 <20200107113354.ggq6zarewq5ip354@pengutronix.de>
 <20200107115429.GA32632@pi3>
 <20200107120926.cgrxk6b4rchf6i42@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107120926.cgrxk6b4rchf6i42@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_041516_715457_1F6BA773 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-pwm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 kernel@pengutronix.de, linux-amlogic@lists.infradead.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMDE6MDk6MjZQTSArMDEwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gPiA+IChPaCwgSEFTX0RNQSBpcyBkZWZpbmVkIHVzaW5nICJkZXBlbmRzIG9u
ICFOT19ETUEiICsgImRlZmF1bHQgeSIuCj4gPiA+IE5PX0RNQSBoYXMgdGhyZWUgZGlmZmVyZW50
IGRlZmluaXRpb25zLiBUd28gb2YgdGhlbSAoaW4KPiA+ID4gZHJpdmVycy9jcnlwdG8vY2NyZWUv
Y2NfaHdfcXVldWVfZGVmcy5oIGFuZCBhcmNoL2FybS9pbmNsdWRlL2FzbS9kbWEuaCkKPiA+ID4g
dW5yZWxhdGVkLikKPiA+IAo+ID4gWWVzLCBIQVNfRE1BIGlzIHRoZSBzZWNvbmQgbWlzc2luZyBw
aWVjZSBmb3IgVU0uCj4gCj4gU28gc29tZXRoaW5nIGxpa2U6Cj4gCj4gCSMgVXNlcm1vZGUgbGlu
dXggZG9lc24ndCBwcm92aWRlIEhBU19ETUEgYW5kIEhBU19JT01FTS4gIFRvIG5vdCBoYXZlIHRv
Cj4gCSMgY2x1dHRlciBtb3N0IGRlcGVuZGVuY2llcyB3aXRoIHRoZXNlIGp1c3QgZXhjbHVkZSBV
TUwgZnJvbSBjb21waWxlCj4gCSMgdGVzdGluZy4KPiAKPiBhcyBjb21tZW50IGZvciBDT01QSUxF
X1RFU1QncyBkZXBlbmQgbGluZSBzaG91bGQgYmUgZmluZSwgcmlnaHQ/Cj4gCgpJIHRoaW5rIHll
cy4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
