Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9068C432C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 12:39:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB9522071A
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 12:39:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tZCa/A+G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L/s0D1Bj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB9522071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fYu+biNLxSWEvPGgGNPkC1+dCdQhYTIpGWMPTlsgz4Y=; b=tZCa/A+G0WXgok
	Y76ydIVbCTq6VuJ+1+rWM0f07JampJ9d4jJk/DrOE5O4+fbtcMfGJEO5iNF30UM16wzJNjGNuIqsr
	62ESFeaFhdhrhzIXbQBcVwaJU63eNwfmLtYxpwltXWSclqS8QATmG6o3M3WMsDjbw45Lq4A+lsGr/
	uyZ1TqcE5xu/2BBAf6FnSml4uELDBDsTD9THeE5RaPCJ+azVVhdW157Bn7bngEtrg6HUdQ+VTMixQ
	zv/Tw76Rmmm746rImga4jT3Ing8Slut0O/EBmEBFURIVxbWJPyWifxiY2k71PgsSzlGQa0d+woMho
	fn6zEKzccPfC5joyoCHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZa84-0005Bd-1K; Tue, 26 Nov 2019 12:39:40 +0000
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZa80-0004e5-VN
 for linux-mediatek@lists.infradead.org; Tue, 26 Nov 2019 12:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574771974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2VadMJ/aSgwHbJpMFCv+DTeYpcUUQbzgSGAFUkGztGI=;
 b=L/s0D1Bj79CpS/8zoehJlhXffJwhKZTNCh4H+O3F6h0NoyIGC1JESm8XcDY720GYmtLQK7
 +HtDosJnyDyRWSDZ3yt7+giBKq7woRM6FTCeUV+/SqX1gqCSm12voTKp+QMItDe6rXC05u
 kCqvVqsVf3GSmW4kYk8AH/z9w15vpgk=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-DnY6RQy7P2q7zBsX6LyEJg-1; Tue, 26 Nov 2019 07:39:31 -0500
Received: by mail-lf1-f71.google.com with SMTP id t28so3821068lfq.6
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Nov 2019 04:39:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=2VadMJ/aSgwHbJpMFCv+DTeYpcUUQbzgSGAFUkGztGI=;
 b=dPWimN/lZZagxVkVgH5npFbo9WRQgObF2jfa/F6u5xoKj3SXT0V2oRrmL/fDGcMlA+
 Uj2g8W76ZiUDkLzQCNiu3U75sit4F4Ao8kqmt/tP/wVNS6lxLACzi3Rb3ceZ4lhu7HTL
 KhqMkZJy5wINUnqKsIkZR206HQ6jiC8FnKK/3iKO+uMsS6+SUWmYyNEGDNgl6QRI+65F
 hwnLCx3WsJ7IBqTqvfSb76ZpVXaD2X+K5hQjm2Itdud0jQwplh2sroTy1P3v8S0U0XGN
 ir8p9JtlSa9z84O0YU75A5slOZyESPwElppiKOXkMI0AxBhJcuQQXtc9hGPQVr3FxljV
 XjPw==
X-Gm-Message-State: APjAAAXeb9ulXRe0v4bNHJ0ga+R3krNXu1lJNjq1Qag2CPTii7aLVSVv
 rUbqJd5kYZq65FRcWMhZ/OC0vUKNRtC5NaPX4JD/VFpaxw5HUfoi9LIChyJlZdH4r98FiRZW1Zp
 cHcR9ya9mGeh8bGCXFi4itXpdMgdopUiO
X-Received: by 2002:ac2:4102:: with SMTP id b2mr25034845lfi.16.1574771969862; 
 Tue, 26 Nov 2019 04:39:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqwMUX4nVqQ+FMTokq7ORlBMBeiqIzP7BUvwDeFyDsu8c8xnsq1l+pQCS86d53A3EOuT0b0huQ==
X-Received: by 2002:ac2:4102:: with SMTP id b2mr25034833lfi.16.1574771969730; 
 Tue, 26 Nov 2019 04:39:29 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
 by smtp.gmail.com with ESMTPSA id d4sm5140763lfi.32.2019.11.26.04.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 04:39:29 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 65E451818BF; Tue, 26 Nov 2019 13:39:28 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH] mac80211: airtime: Fix an off by one in
 ieee80211_calc_rx_airtime()
In-Reply-To: <20191126120910.ftr4t7me3by32aiz@kili.mountain>
References: <20191126120910.ftr4t7me3by32aiz@kili.mountain>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 26 Nov 2019 13:39:28 +0100
Message-ID: <87wobmyfpb.fsf@toke.dk>
MIME-Version: 1.0
X-MC-Unique: DnY6RQy7P2q7zBsX6LyEJg-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_043937_095274_74B0C77F 
X-CRM114-Status: UNSURE (   7.50  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPiB3cml0ZXM6Cgo+IFRoaXMg
Y29kZSB3YXMgY29waWVkIGZyb20gbXQ3NiBhbmQgaW5oZXJpdGVkIGFuIG9mZiBieSBvbmUgYnVn
IGZyb20KPiB0aGVyZS4gIFRoZSA+IHNob3VsZCBiZSA+PSBzbyB0aGF0IHdlIGRvbid0IHJlYWQg
b25lIGVsZW1lbnQgYmV5b25kCj4gdGhlIGVuZCBvZiB0aGUgYXJyYXkuCj4KPiBGaXhlczogZGIz
ZTFjNDBjZjJmICgibWFjODAyMTE6IEltcG9ydCBhaXJ0aW1lIGNhbGN1bGF0aW9uIGNvZGUgZnJv
bSBtdDc2IikKPiBSZXBvcnRlZC1ieTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJl
ZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBv
cmFjbGUuY29tPgo+IC0tLQoKVGhhbmtzIQoKQWNrZWQtYnk6IFRva2UgSMO4aWxhbmQtSsO4cmdl
bnNlbiA8dG9rZUByZWRoYXQuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
