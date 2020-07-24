Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B176BC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:10:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D65B20674
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 14:10:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="daPRTgwW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D65B20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kxuCbejlTonEk6J00fzq/JyJBudWfM/dKGkV6IVQ1uc=; b=daPRTgwWLeQkZpOCK4JIRPK8N
	OguAdPBEMMbidBYF0R9fXF4itQA4FaP3e7LvJsGUAZIIbV73H4pxRPOQ2s19U7ofhgRe6i3s4NCUZ
	68xFZ4UvAkvPwFI8r95xpJwBIh0OETsk5cz9HZFuMR+RMsxOJBVfTrOGx+38rPgIPel3WPsSuneVf
	+IN+dMITvmlF2tNFIRkjJgK4KwWzlhgS4ab1RAuupkVg1pdCYie2QazYK9llULudyYOIP2beFr1iM
	/9cfnl5e+7Ftt5yR+SVFoyNcSTekefkodm70Fg2VrFJQrwPcb7NV5FTRQROIkp0e8fpzmngf/d5o3
	KRXYQztUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyyOZ-00031u-5q; Fri, 24 Jul 2020 14:09:55 +0000
Received: from mail-wm1-f67.google.com ([209.85.128.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyyOV-00031C-MV; Fri, 24 Jul 2020 14:09:52 +0000
Received: by mail-wm1-f67.google.com with SMTP id c80so8087306wme.0;
 Fri, 24 Jul 2020 07:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=MFZnPQ4CSgoYpNdbp9qv3P2bsVqa9A4NUrenC+UIBjE=;
 b=jmMzalMzef4trE63OAGf6ADA6rK2PmcQKn8vTBM9rErb1MYmKnAfR1zVq0OvJK7/yt
 GaoAeymjMKhX3eRkf7O7CXcxiLUT7Q/DMn4pcOhQhRgsKosw9WJavGUFcCEZPPzQ7ZwF
 VVtJx1a8F3QGUwjNa2t7kte1Djf3NL8wycYk+5Y+9VFLv2SKOccqqP5MWuUswhHZux+G
 7Un+7tRT0c47kKLbk24yevjg7cHAwfnh1IjRwDMirAXMHb8QFOoQbsjSTDA0fJSp8J+2
 W4KNAU8GyBGymj/uD002mGcOC/3b8kwODWeYLnfheHYMS7IRc60HHdUUWcUfkbFlQI31
 KLrg==
X-Gm-Message-State: AOAM533mcgA9kEjWqLbq2Jv6sq6KvbWtzNXfJzenCjX5qA0s1HGjue7h
 HJowEaGjkIK07PI63klnE5c=
X-Google-Smtp-Source: ABdhPJxhDIHHNprIfr5jTTC4+LEgNsGYWxkjN3HfyODAjUnEqQ0fZsCbDmYOnt/yMZ0aD3Uq66R6NQ==
X-Received: by 2002:a1c:7d81:: with SMTP id y123mr6347917wmc.87.1595599790123; 
 Fri, 24 Jul 2020 07:09:50 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id c7sm1522358wrq.58.2020.07.24.07.09.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Jul 2020 07:09:49 -0700 (PDT)
Date: Fri, 24 Jul 2020 16:09:45 +0200
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
Subject: Re: [PATCH v2 03/29] memory: omap-gpmc: Include <linux/sizes.h> for
 SZ_16M
Message-ID: <20200724140945.GA14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-4-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_100951_742877_2E7E4284 
X-CRM114-Status: GOOD (  13.08  )
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

T24gRnJpLCBKdWwgMjQsIDIwMjAgYXQgMDk6NDA6MTJBTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBUaGUgZHJpdmVyIHVzZXMgU1pfMTZNIHdoaWNoIGlzIGRlZmluZWQgaW4g
aW5jbHVkZS9saW51eC9zaXplcy5oLiAgT24KPiBBUk0gaXQgd2FzIHB1bGxlZCBieSBvdGhlciBo
ZWFkZXJzIGJ1dCBpdHMgaW5jbHVzaW9uIGlzIG5lY2Vzc2FyeSBmb3IKPiBjb21waWxlIHRlc3Rp
bmcgb24gb3RoZXIgYXJjaGl0ZWN0dXJlcy4KPiAKPiBUaGlzIGZpeGVzIGJ1aWxkIGVycm9yIHdo
ZW4gY29tcGlsZSB0ZXN0aW5nIG9uIGkzODYgYXJjaGl0ZWN0dXJlOgo+IAo+ICAgICBkcml2ZXJz
L21lbW9yeS9vbWFwLWdwbWMuYzogSW4gZnVuY3Rpb24g4oCYZ3BtY19jc19yZW1hcOKAmToKPiAg
ICAgZHJpdmVycy9tZW1vcnkvb21hcC1ncG1jLmM6OTYxOjEyOiBlcnJvcjog4oCYU1pfMTZN4oCZ
IHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVy
cy9tZW1vcnkvb21hcC1ncG1jLmMgfCAxICsKCkFwcGxpZWQgKGFuZCBwYXJ0IG9mIHB1bGwgcmVx
dWVzdCB0byBhcm0tc29jKS4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
