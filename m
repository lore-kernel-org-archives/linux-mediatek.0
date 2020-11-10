Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67939C388F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 13:12:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00FFA20674
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 13:12:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JobDYZ0R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Di+p8tHp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00FFA20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NV/Wrm+xa2LE5pdEdZK5fqfffJ0M1ScSaBikYUlDOfo=; b=JobDYZ0RZb0Tu3LKPxLtLle9U
	RFyPXfd9UNpIZHmPbAdEsn5F2YtIqblw3doegV4OLQXWFZvgpzNvzdFesUInL+BWHD/1QUhnVWHQL
	ZB3ptqSrFlY3Jdb42EBu8e4jcTXxZcOLW8EL+YecFDVF4T/OEZ7amemKxbOZAnu/R2Xw7uiGyjTZe
	XGvt375mNgN87t3bgud9P35BDChFpVsXY5EYRYLlFszwy7zNdf3i2kp2EvSRSmZLfIG+qwVYFXbpG
	3QZyTEfFa8keI4/44KGjuAMnOYwg7245mCCRasPITV4mVWajrYTPf6o4+0mDDoyYfzczGJD2d2jiC
	K3fg+6vDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcTRu-0004AG-Si; Tue, 10 Nov 2020 13:12:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcTRq-00047R-C7
 for linux-mediatek@lists.infradead.org; Tue, 10 Nov 2020 13:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605013952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2V11rFQ3FKVTN+koXAVvig/bkOvKVZoOl9jWSSiZ8Ik=;
 b=Di+p8tHpuaV5rtMlatp24D6j8+WKmCUBtqz8yv0zCEdrS6sGXtBKp/ajiNQKnRgk1iVbBf
 EPgPhQ0oDcmNLweqKLA2uf1G287zKEdUoDcJ+SAJtNZ7ElvnOQlZ77m+OxtwtGg6hoPAvK
 H8JUZjK8UjW7EnlIU91t9XZBpHRi/X8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-jGHkhq6VPoSvJ31vA-5wJQ-1; Tue, 10 Nov 2020 08:12:31 -0500
X-MC-Unique: jGHkhq6VPoSvJ31vA-5wJQ-1
Received: by mail-qk1-f198.google.com with SMTP id f9so8630076qkg.13
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2020 05:12:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2V11rFQ3FKVTN+koXAVvig/bkOvKVZoOl9jWSSiZ8Ik=;
 b=IswHJ97dvViNdIbeY5IPCrv2uYKDhNQRt9c9uwElUD/76LQ6VIx6JuVSF5TxyNDszm
 V8NQYEAOrwwZnkDOwvU+1RyxBBuQG1lfnU4tEABr6JYfIHTttBv1SOx1+rP4mNrEsMI0
 D920dDKqNQlKblaFH27B+aSmwJeCvXdsPrECnI8c8USGB/lS4+BzSo2fG45ZPGOA1CaM
 jrUpPBvYKqXtmu9arkFB+XJb6khlckQk6veg0l7zGNEDM+S/w7LfKPINb+hcXlOIjU9W
 L3riSpOXBCcBO1GzDjOkZmN2EP5fE/u/mJCWevMHBb+qXuOJLoMq1PywC15Rz1RQykGJ
 BZRQ==
X-Gm-Message-State: AOAM533zxbPHdYcEoCy1fwuicf/Ogt7J8qC6bknng+4gTi7oP3TMz/bX
 EG9tT7c7QdQwvHwBvjoV3UyvhJmMnrsXktWLRn2wg/IIkr7h73h/HHfHuyQ6TmYW5Z8xIC0Gfj4
 ifNn7M84Wb6qspJy1u56M89Vcf6KDdnoY
X-Received: by 2002:ac8:3621:: with SMTP id m30mr8787098qtb.168.1605013950433; 
 Tue, 10 Nov 2020 05:12:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRnI1rUF5eW2rST1vImtIogpOlMRBum2fO0dVCe+zUlRqVIaRBqmVo31rjlhOk2kmW2Hr8dQ==
X-Received: by 2002:ac8:3621:: with SMTP id m30mr8787064qtb.168.1605013950178; 
 Tue, 10 Nov 2020 05:12:30 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id e8sm7658678qti.28.2020.11.10.05.12.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 05:12:29 -0800 (PST)
Subject: Re: Subject: [RFC] clang tooling cleanups
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, cocci <cocci@systeme.lip6.fr>
References: <20201027164255.1573301-1-trix@redhat.com>
 <3c39c363690d0b46069afddc3ad09213011e5cd4.camel@perches.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <cc512954-2e1d-a165-f1f1-2c489fd6d3a9@redhat.com>
Date: Tue, 10 Nov 2020 05:12:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3c39c363690d0b46069afddc3ad09213011e5cd4.camel@perches.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_081234_485740_4300333B 
X-CRM114-Status: GOOD (  13.75  )
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, qat-linux@intel.com, amd-gfx@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-mmc@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Ck9uIDExLzkvMjAgNjo1MiBQTSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gT24gVHVlLCAyMDIwLTEw
LTI3IGF0IDA5OjQyIC0wNzAwLCB0cml4QHJlZGhhdC5jb20gd3JvdGU6Cj4+IFRoaXMgcmZjIHdp
bGwgZGVzY3JpYmUKPj4gQW4gdXBjb21pbmcgdHJlZXdpZGUgY2xlYW51cC4KPj4gSG93IGNsYW5n
IHRvb2xpbmcgd2FzIHVzZWQgdG8gcHJvZ3JhbWF0aWNhbGx5IGRvIHRoZSBjbGVhbiB1cC4KPj4g
U29saWNpdCBvcGluaW9ucyBvbiBob3cgdG8gZ2VuZXJhbGx5IHVzZSBjbGFuZyB0b29saW5nLgo+
Pgo+PiBUaGUgY2xhbmcgd2FybmluZyAtV2V4dHJhLXNlbWktc3RtdCBwcm9kdWNlcyBhYm91dCAx
MGsgd2FybmluZ3MuCj4+IFJldmlld2luZyB0aGVzZSwgYSBzdWJzZXQgb2Ygc2VtaWNvbG9uIGFm
dGVyIGEgc3dpdGNoIGxvb2tzIHNhZmUgdG8KPj4gZml4IGFsbCB0aGUgdGltZS4gIEFuIGV4YW1w
bGUgcHJvYmxlbQo+Pgo+PiB2b2lkIGZvbyhpbnQgYSkgewo+PiDCoMKgwqDCoMKgc3dpdGNoKGEp
IHsKPj4gwqDCoMKgwqDCoAkgICAgICAgY2FzZSAxOgo+PiAJICAgICAgIC4uLgo+PiDCoMKgwqDC
oMKgfTsgPC0tLSBleHRyYSBzZW1pY29sb24KPj4gfQo+Pgo+PiBUcmVld2lkZSwgdGhlcmUgYXJl
IGFib3V0IDEwMCBwcm9ibGVtcyBpbiA1MCBmaWxlcyBmb3IgeDg2XzY0IGFsbHllc2NvbmZpZy4K
Pj4gVGhlc2UgZml4ZXMgd2lsbCBiZSB0aGUgdXBjb21pbmcgY2xlYW51cC4KPiBjb2NjaW5lbGxl
IGFscmVhZHkgZG9lcyBzb21lIG9mIHRoZXNlLgo+Cj4gRm9yIGluc3RhbmNlOiBzY3JpcHRzL2Nv
Y2NpbmVsbGUvbWlzYy9zZW1pY29sb24uY29jY2kKPgo+IFBlcmhhcHMgc29tZSB0b29sIGNvb3Jk
aW5hdGlvbiBjYW4gYmUgZG9uZSBoZXJlIGFzCj4gY29jY2luZWxsZS9jaGVja3BhdGNoL2NsYW5n
L0xpbmRlbnQgY2FsbCBhbGwgYmUgdXNlZAo+IHRvIGRvIHNvbWUgZmFjZXQgb3IgYW5vdGhlciBv
ZiB0aGVzZSBjbGVhbnVwIGlzc3Vlcy4KClRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuCgpJ
IHdpbGwgdGFrZSBhIGxvb2sgYXQgaXQuCgpUb20KCj4KPgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
