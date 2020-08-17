Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E616C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 18:32:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB6C22063A
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 18:32:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="freIFEuo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB6C22063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zNHn7YQk2gn3FZwhYTZoGfFyvAoRKFrHpAWZxWsAi0Y=; b=freIFEuoI6f2HHvjrZKHsH30c
	INTTVm7RQLVkHGHx5sb4hqmD0C4GIrQeBwG/BrFMnupsrakwRUzVvRlxU9PkqWqMT0QF2oB3UN0QI
	7tlQXOJnoYCRE5LH6jap2MyGUqprsq3CydRAzTZt+sOG2A/J+n6PJRuaILXzaGVT3ovIu1xq2fUF6
	PtIgsY0lwroj/ByKsSYqgkrOp+yi/w4aORWAWu/oSY4oo+bJZTD8lxv7yL7VLvEEe5QKo0YAXZBcd
	UukcciFapevlnmGV48FdPXtGZE32sELEhjcXk0DDs5esPcQ/rqlZGpnWtHuN9PFG+5xy8S0RsOLoY
	5GCyK69Jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jvJ-000783-4H; Mon, 17 Aug 2020 18:31:57 +0000
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jvF-000778-HS; Mon, 17 Aug 2020 18:31:54 +0000
Received: by mail-ed1-f68.google.com with SMTP id ba10so13118871edb.3;
 Mon, 17 Aug 2020 11:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=hBUcN4OkcyXAP5E6a2eouoPSQBhcXpldM+aQp0PGfhg=;
 b=ikJjPBA+08g8NzYv/PgeYQLCJQ15pULMNu0LoCxf1oyULpjLHkcsJL+xnRtaqgYX2B
 RFeO7RRrHdPhTJe/1JlJgmRWrN/GOw04WDOBKkY+VeExD+V3gPZPFMFMnidNxdeqgTtr
 0EjeSzdNm8RvZkN8+6O6epuhypYmEB9ulzx2e/Jw/tIAg5S20aK+Ye1z1ACJwI5jOEO4
 DxlNEgEVnJmKyJakDj2BqRePdcw8WcpJCURshKvcxqJEJ/LiZR55pBc8VMcDeB8ucpqJ
 uChh4GPSGu02nh8+cSVBkAUHG+op7ib5Ie0NYBJ8A25SW6Dzx2aMgk/91ZX/rTzjFcMT
 4TcQ==
X-Gm-Message-State: AOAM533VY7pw+tx43N65EUesYr88vpI0ri40pgxipQHc5fS39vIRFVqN
 H37+jbW1vke1YiYACvmDksk=
X-Google-Smtp-Source: ABdhPJwJFBPzF7Ip4mHFHwCJ7i6D0iGFtLdNnjjZFvxi/KEFgJtC4lqELj6xSQmWu9o+PqLjXrbWlQ==
X-Received: by 2002:a05:6402:3196:: with SMTP id
 di22mr15802828edb.193.1597689112098; 
 Mon, 17 Aug 2020 11:31:52 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id
 lc10sm14962158ejb.22.2020.08.17.11.31.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Aug 2020 11:31:51 -0700 (PDT)
Date: Mon, 17 Aug 2020 20:31:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Markus Mayer <mmayer@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Roger Quadros <rogerq@ti.com>, Tony Lindgren <tony@atomide.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Kukjin Kim <kgene@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [RFT v2 02/29] memory: omap-gpmc: Remove unused file-scope
 phys_base and mem_size
Message-ID: <20200817183148.GB3464@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-3-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_143153_588624_C4B194B6 
X-CRM114-Status: GOOD (  15.93  )
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
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdWwgMjQsIDIwMjAgYXQgMDk6NDA6MTFBTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBUaGUgZmlsZS1zY29wZSB2YXJpYWJsZXMgcGh5c19iYXNlIGFuZCBtZW1f
c2l6ZSBhcmUgYXNzaWduZWQgaW4KPiBncG1jX3Byb2JlKCkgYnV0IG5ldmVyIHJlYWQuCj4gCj4g
VGhpcyBmaXhlcyBidWlsZCBlcnJvciB3aGVuIGNvbXBpbGUgdGVzdGluZyBvbiB4ODZfNjQgYXJj
aGl0ZWN0dXJlOgo+IAo+ICAgICBkcml2ZXJzL21lbW9yeS9vbWFwLWdwbWMuYzoyNDY6MjQ6IGVy
cm9yOiBjb25mbGljdGluZyB0eXBlcyBmb3Ig4oCYcGh5c19iYXNl4oCZCj4gICAgICBzdGF0aWMg
cmVzb3VyY2Vfc2l6ZV90IHBoeXNfYmFzZSwgbWVtX3NpemU7Cj4gICAgIEluIGZpbGUgaW5jbHVk
ZWQgZnJvbSBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYWdlLmg6MTI6MCwKPiAgICAgICAgICAgICAg
ICAgICAgICBmcm9tIGFyY2gveDg2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmg6MTIsCj4gICAg
ICAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L3RocmVhZF9pbmZvLmg6MzgsCj4g
ICAgICAgICAgICAgICAgICAgICAgZnJvbSBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wcmVlbXB0Lmg6
NywKPiAgICAgICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvcHJlZW1wdC5oOjc4
LAo+ICAgICAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9zcGlubG9jay5oOjUx
LAo+ICAgICAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9pcnEuaDoxNCwKPiAg
ICAgICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMvbWVtb3J5L29tYXAtZ3BtYy5jOjEyOgo+
ICAgICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYWdlXzY0Lmg6MTI6MjI6IG5vdGU6IHByZXZpb3Vz
IGRlY2xhcmF0aW9uIG9mIOKAmHBoeXNfYmFzZeKAmSB3YXMgaGVyZQo+ICAgICAgZXh0ZXJuIHVu
c2lnbmVkIGxvbmcgcGh5c19iYXNlOwo+IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3ps
b3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tZW1vcnkvb21hcC1ncG1j
LmMgfCA0IC0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgZGVsZXRpb25zKC0pCgpBcHBsaWVkIHRv
IGRyaXZlcnMvbWVtb3J5IHRyZWUuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
