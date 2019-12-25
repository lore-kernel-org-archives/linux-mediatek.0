Return-Path: <SRS0=B1Xv=2P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59488C2D0DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Dec 2019 13:53:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C6D520722
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Dec 2019 13:53:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HUUEDbHY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="mZit9suz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C6D520722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjKX4e+z3ByoebBF9jV61hgolzm3yNsNxZZtHZ3AQVw=; b=HUUEDbHYGCMlkl
	kG8r1MyQSz7nD1PA5Lkcg1dMMKM1+V7jQaNuMoFvNVg4fHHLWl/KROqpmdiK7YQNgY1p1Tzysgcio
	r41Ap9yg0XGA+XuvVPw8vTOHMPSCfybekIy95u/YC/+moZ5ImZvqCRsrhxCHrAMMacXkdOejC0W45
	PgFmc2hWkhmqmrgBM8ZUPkljz9see0/LNO21z9SUSUmOYybpUbwzoq3/G6E5Xu2wLY2EFC0S0V5h6
	VBjfgHS/UFbbUcKAlPMC1ORKpmFeES8/0hDDVSDN7TNBMRCPw8qehvNUYRuJujC1HzM81IeJArQ/S
	NAPujb9LOnfjVudTtsxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ik76G-0004BG-45; Wed, 25 Dec 2019 13:53:20 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ik76C-0004Aa-Ag
 for linux-mediatek@lists.infradead.org; Wed, 25 Dec 2019 13:53:18 +0000
Received: by mail-qt1-x842.google.com with SMTP id d18so17625138qtj.10
 for <linux-mediatek@lists.infradead.org>; Wed, 25 Dec 2019 05:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=KUrCa6xAYjppP+kYyaFb1kK7z66EPpyNc7GyOaqtVdk=;
 b=mZit9suzmem/cS/gpTcNGVlvF3wGKIXuNs61u7kNov92m4+hdxWzR7feJ21VbWW7Cw
 UjcRkz5+CqAocHebwCuhi9iMarvn2JU1/its/7R0LLOdi7KiXXKlPNcI1EFsbsi3VnyO
 WOtUWv/y3a5h1qkyugjDmpvkvUXu6BVzL8ZmZ0EEZzMyGxDC0LfOYQt3DQ63p9Mw3be+
 7vGssLfKj8RXnuajMHWSN77Pm50+9DgrqtfxqpAe+JSUMfDyWNzFI8fR1IpGqa+Xg1h4
 1TIbCplYVDsctABJqD/m/ELpHGAg7ufzgpu5c8dzgdb+sp2HSZVSqxU0x6CKI2boQlBP
 UOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=KUrCa6xAYjppP+kYyaFb1kK7z66EPpyNc7GyOaqtVdk=;
 b=sasqtt9gjc0l6Pf28PkdWEUc2lzuyWHomY10uS7ycq2sKQVdTvllzcVE4A+bNfPe+e
 Z7cGW3BsSQJxJU/eSmMO77ZboxuSRIdS1O0HUSKuDWpmxQIoe6xr2sIcugh5Refok8WB
 Mf1UOxyIyGCcVTfKCOlarB8PSvhJULUV04s0a5fy5iqLPz10AtKZKnMVpzjzv1QXvCJP
 43Ta25f4f7iaLrwRNock7xEriA4ixNPti6KvfuqY7cl4aC1yz/o9NZ78DDKUFVmySEn7
 tHDQYCBN3WdNUyWJo5NVkPXBZ8qH3aFPlqB1l1pGmemI1w0ul0755qC3c13d/bY/gaST
 eQXA==
X-Gm-Message-State: APjAAAXK/7TGlSXmZ16c1nhoIP24usjWVtIMA352EVedYIzJWNSxrwHD
 Gl/xNypziehWKp0u+UtC/HXcCg==
X-Google-Smtp-Source: APXvYqyYd1Qrn+cNoCtdF1a9JXv2sOcUEywIf7eukL77EDLmSZ8iElk8z29HZl+sFgCMnO7hAsELsw==
X-Received: by 2002:ac8:5313:: with SMTP id t19mr31565483qtn.375.1577281993999; 
 Wed, 25 Dec 2019 05:53:13 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id e3sm7057253qtj.30.2019.12.25.05.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Dec 2019 05:53:13 -0800 (PST)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] mm/page_owner: print largest memory consumer when OOM
 panic occurs
Date: Wed, 25 Dec 2019 08:53:12 -0500
Message-Id: <1806FE86-9508-43BC-8E2F-3620CD243B14@lca.pw>
References: <1577266145.31907.4.camel@mtkswgap22>
In-Reply-To: <1577266145.31907.4.camel@mtkswgap22>
To: Miles Chen <miles.chen@mediatek.com>
X-Mailer: iPhone Mail (17C54)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191225_055316_430357_BE1D0F84 
X-CRM114-Status: UNSURE (   7.84  )
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
Cc: Michal Hocko <mhocko@suse.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cgo+IE9uIERlYyAyNSwgMjAxOSwgYXQgNDoyOSBBTSwgTWlsZXMgQ2hlbiA8bWlsZXMuY2hlbkBt
ZWRpYXRlay5jb20+IHdyb3RlOgo+IAo+IEZvciBleGFtcGxlLCB3ZSdyZSBpbXBsZW1lbnRpbmcg
b3VyIGlvbW11IGRyaXZlciBhbmQgdGhlcmUgYXJlIG1hbnkKPiBhbGxvY19wYWdlcygpIGluIGRy
aXZlcnMvaW9tbXUuCj4gVGhpcyBhcHByb2FjaCBoZWxwcyB1cyBsb2NhdGVkIHNvbWUgbWVtb3J5
IGxlYWthZ2VzIGluIG91cgo+IGltcGxlbWVudGF0aW9uLgoKTm90IHN1cmUgaWYgeW91IGhhdmUg
Y29kZSB0aGF0IGNhbiBzaGFyZSBidXQgSSBjYW7igJl0IGltYWdpbmUgdGhlcmUgYXJlIG1hbnkg
cGxhY2VzIHRoYXQgd291bGQgaGF2ZSBhIHNpbmdsZSBjYWxsIHNpdGUgaW4gdGhlIGRyaXZlciBk
b2luZyBhbGxvY19wYWdlcygpIG92ZXIgYW5kIG92ZXIgYWdhaW4uIEZvciBleGFtcGxlLCB0aGVy
ZSBpcyBvbmx5IHR3byBhbGxvY19wYWdlcygpIGluIGludGVsLWlvbW11LmMgd2l0aCBvbmUgaXMg
b25seSBpbiB0aGUgY29sZCBwYXRoLCBzbyBldmVuIGlmIGFsbG9jX3BndGFibGVfcGFnZSgpIG9u
ZSBkbyBsZWFraW5nLCBpdCBpcyBzdGlsbCB1cCB0byB0aGVyZSBhaXIgaWYgeW91ciBwYXRjaCB3
aWxsIGNhdGNoIGl0IGJlY2F1c2UgaXQgbWF5IG5vdCBhIHNpbmdsZSBjYWxsIHNpdGUgYW5kIGl0
IG5lZWRzIHRvIGxlYWsgc2lnbmlmaWNhbnQgYW1vdW50IG9mIG1lbW9yeSB0byBiZSB0aGUgZ3Jl
YXRlc3QgY29uc3VtZXIgd2hlcmUgaXQgaXMganVzdCBub3Qgc28gcmVhbGlzdGljLiBGb3IgZGVi
dWdnaW5nIHBvaW50IG9mIHZpZXcsIElNTyBpdCBpcyBiZXR0ZXIgdG8gYW5ub3RhdGUgdGhpcyBv
bmUgYWxsb2NfcGFnZXMoKSBjYWxsIHdoZW4gaW4gZG91YnQsIHNvIHRoYXQga21lbWxlYWsgd291
bGQgY2F0Y2ggaXQgaW5zdGVhZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
