Return-Path: <SRS0=GDFl=DL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B60C4363C
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2020 13:05:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A725206C1
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2020 13:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yhwPYyfM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="S75llJuX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A725206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J4rX33202+TkkRHMrI06j2y12woxgR/UM5Tj94soxoI=; b=yhwPYyfMfV6uGLNGT0olPooHw
	KRdEPNn7DYKgWz0WSlfQjBAPYkEsGZMjbWtYdkDYHIcwPoWSsDEH/Zq+vV17P1eAwTlZxwbJ6ek5a
	gjM9OVIPNqp5lm3psQQ0p1EY/flFw3LGOQ/c81a+SObsgY+j/w55JyjX0tu153FKQ+9eQpuLm7hn4
	gHKhLXBHRBzsZvH6faRge0/ngFjhfKp/FBq/38SQXmGa9dSixNVMVjEK31IHw80uW7IDCs8UjM7sc
	/6LRWcwudo6ekhfJRcym1Z8iwD66Acews+BRQmj+t8zDLi92ORUTP4K8HWz2vWHOhhX8pgEQgMAGG
	KCs22s0Fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kP3hh-000882-EN; Sun, 04 Oct 2020 13:05:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kP3hd-00087A-Pg; Sun, 04 Oct 2020 13:05:26 +0000
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CF212078B;
 Sun,  4 Oct 2020 13:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601816723;
 bh=b3VJELJHxJ+kqWcCs/bmj4n7ROvR4MBKkbSqU/Xk2ng=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S75llJuXkVhNsHZ9NWtMK4on87LqyYF/Iol5MUK9nXxATt9zimtt+R0/1e5tJxb6A
 tUy7MhK5MtGrRV39paO+SOjzompHmL7LJgBbSP13hCTaaGEmuOqpa+TOkwgY3mDQp8
 mJOHw1f0cHu1kYjM5SOBqDoZpTnWJK42au+cEfAo=
Received: by mail-ed1-f43.google.com with SMTP id l17so6545368edq.12;
 Sun, 04 Oct 2020 06:05:23 -0700 (PDT)
X-Gm-Message-State: AOAM532Se3LIqVnnoAA9tgbSFsdZmq2Z9X1w4/p8ROgrBWGE7oWO+hdZ
 FxVlUUJ0l3GCRMsnl2XEiWzZOblhUz6xvzPWQg==
X-Google-Smtp-Source: ABdhPJzRNV8rMjJitmmvOwtnDM7OTxut1f/+0PXkBKVhYNYUdoWjJXy+wH0JoZphp5SwJc6HEG+LVPNFmEUc31+vzrY=
X-Received: by 2002:a05:6402:c12:: with SMTP id
 co18mr12243824edb.162.1601816721815; 
 Sun, 04 Oct 2020 06:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201004055024.23542-1-phil.chang@mediatek.com>
In-Reply-To: <20201004055024.23542-1-phil.chang@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 4 Oct 2020 21:05:11 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8vCb-adkbpdmbTWLeOFt-+dHjr4HVonHX7XPkLkzy1yA@mail.gmail.com>
Message-ID: <CAAOTY_8vCb-adkbpdmbTWLeOFt-+dHjr4HVonHX7XPkLkzy1yA@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] of_reserved_mem: Increase the number of reserved
 regions
To: Phil Chang <phil.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_090525_901243_70D21A23 
X-CRM114-Status: GOOD (  19.43  )
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
Cc: DTML <devicetree@vger.kernel.org>, Alix Wu <alix.wu@mediatek.com>,
 YJ Chiang <yj.chiang@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Joe Liu <joe.liu@mediatek.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFBoaWw6CgpQaGlsIENoYW5nIDxwaGlsLmNoYW5nQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDl
ubQxMOaciDTml6Ug6YCx5pelIOS4i+WNiDE6NTHlr6vpgZPvvJoKPgo+IENlcnRhaW4gU29DcyBu
ZWVkIHRvIHN1cHBvcnQgbGFyZ2UgYW1vdW50IG9mIHJlc2VydmVkIG1lbW9yeQo+IHJlZ2lvbnMs
IGVzcGVjaWFsbHkgdG8gZm9sbG93IHRoZSBHS0kgcnVsZXMgZnJvbSBHb29nbGUuCj4gSW4gTVRL
IG5ldyBTb0MgcmVxdWlyZXMgbW9yZSB0aGFuIDY4IHJlZ2lvbnMgb2YgcmVzZXJ2ZWQgbWVtb3J5
Cj4gZm9yIGVhY2ggSVAncyB1c2FnZSwgc3VjaCBhcyBsb2FkIGZpcm13YXJlIHRvIHNwZWNpZmlj
IHNhcGNlLAoKc3BhY2UKCj4gc28gdGhhdCBuZWVkIHRvIHJlc2VydmUgbW9yZSByZWdpc2lvbnMK
CnJlZ2lvbnMuCgpJIGd1ZXNzIHRoaXMgcmVxdWlyZW1lbnQgaXMgZnJvbSBNZWRpYXRlayBTb0Ms
IGJ1dCBJIGZpbmQgYmVsb3cgZGV2aWNlCnRyZWUgYW5kIGp1c3QgZmluZCBvbmUgcmVzZXJ2ZWQg
bWVtb3J5IHJlZ2lvbiwKCmFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3NjIyLmR0c2kK
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaQphcmNoL2FybTY0L2Jvb3Qv
ZHRzL21lZGlhdGVrL210ODUxNi5kdHNpCgpDb3VsZCB5b3Ugc2hvdyBtZSB0aGUgNjggcmVnaW9u
cz8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gU2lnbmVkLW9mZi1ieTogSm9lIExpdSA8am9l
LmxpdUBtZWRpYXRlay5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWUogQ2hpYW5nIDx5ai5jaGlhbmdA
bWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFsaXggV3UgPGFsaXgud3VAbWVkaWF0ZWsu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IFBoaWwgQ2hhbmcgPHBoaWwuY2hhbmdAbWVkaWF0ZWsuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jIGIvZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9tZW0u
Ywo+IGluZGV4IDQ2YjkzNzFjOGEzMy4uNTk1ZjA3NDFkY2VmIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMKPiArKysgYi9kcml2ZXJzL29mL29mX3Jlc2VydmVkX21l
bS5jCj4gQEAgLTIyLDcgKzIyLDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L21lbWJsb2NrLmg+Cj4KPiAtI2RlZmluZSBNQVhfUkVTRVJWRURfUkVHSU9O
UyAgIDY0Cj4gKyNkZWZpbmUgTUFYX1JFU0VSVkVEX1JFR0lPTlMgICAxMjgKPiAgc3RhdGljIHN0
cnVjdCByZXNlcnZlZF9tZW0gcmVzZXJ2ZWRfbWVtW01BWF9SRVNFUlZFRF9SRUdJT05TXTsKPiAg
c3RhdGljIGludCByZXNlcnZlZF9tZW1fY291bnQ7Cj4KPiAtLQo+IDIuMTguMAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
