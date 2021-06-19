Return-Path: <SRS0=YaGT=LN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B78C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Jun 2021 12:35:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0222C61279
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Jun 2021 12:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0222C61279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7IQCQyclifrO9l8fN44//H2In5bWxlMiFoKj60PUezg=; b=jdq3RpQ1Q6ygdC
	odNVLnyaPZQfp4FtTt1aqpeKnsDRT1hCpRaKbq3n2qMDhtyRZPeNDbCnnmDx7O+yvyjWBCb1mtJwY
	RMqnKyXlRJzJ5a3dxprF9CJ86tA9rvT8gSsgo9ie79MT9MdAIaGOJW4br2Q+KcfOqcMMrVYMLQyHD
	iVaR7tQIDgnnRy0faisgw58B2lNSwts6T+3zs6CzNFzsSfF/LbO0QLYddUzLGhW2r0ex1nxnGq1ME
	vbAHkmfFJr1cugnIPWVsUjfHwWtnzMVG0+yiXGECmbiVc50nkoY565hf2LHyq7r3OKZ/17DdcHMmv
	BgdQZXnAGgFLw8mgcufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luaCL-00GyRd-LH; Sat, 19 Jun 2021 12:35:41 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luaCI-00GyQz-7X
 for linux-mediatek@lists.infradead.org; Sat, 19 Jun 2021 12:35:39 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id
 v17-20020a4aa5110000b0290249d63900faso3225021ook.0
 for <linux-mediatek@lists.infradead.org>; Sat, 19 Jun 2021 05:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=w6n5BgPvWR6hUh2jj6CLFocwaPVYrFHm2/R8qr59NkI=;
 b=TjLkPMOhMUm82jo77vo2DcSnnewJI3mS2F69qk6ofTwk/a/yafxdeXuyMJGvNWMYxx
 dlyTYW2WkP4XstdhzueuAWqipi5s9WB1sgrFO9Qayi2v8gLhle4r2RevtCSACv5jnLnR
 j3vQgma/WGhxTMYhZ2vkgKmSBc2G1Rgj9YkgVQ4ZLs925OJiFLDGPebOts7V/gE/1MWr
 LNPBmhn7G78O9oEJpvHSmMRaNu3ExmpiUpSOa8GC8B91BdACDRAQS8zSyXotrZuqmS42
 24gY+577ADuk/mGubxIJR5lhmQ3RUzD6QD9HKPXxW8M1nCpawQ3hW6R9DYgj3v4UGyBg
 s8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=w6n5BgPvWR6hUh2jj6CLFocwaPVYrFHm2/R8qr59NkI=;
 b=H8oZej3Uu0YGW4iN2Ssg64niKKae8fJqDUgkmLF1XaKloHMQvxuYJKnFFS/bAz2VHq
 zWO+O/BjHJnoe/k3ty45A0FV1DOmUWpzyJ4NCw/bF+iPe9Rr5+WnbsUXW+QlTH2oJKh5
 vjyH9yJKvbeecITfR6Lw8kvqITMCBjnrSbgpgOHpeIL/P3WhgvTp88sFnB4OfBsNM5U3
 BZoRLrkwK8mErCXQbcBynq61VbAzglSGcEaO/deSbaxEsgPqiykAOqTcQlOxC0lGYLwt
 /xYUUHO9+ePrEt+1sVn/Zl1IXF140wpOIS2oY4emkLLjX3YriFkd/yS1Phg3qom28q7Y
 y5GA==
X-Gm-Message-State: AOAM530RKKkGMCEAN1ZpIV5ZJMvXwleG4Xrsce/h1WU8w019KqzsRBYJ
 kU5iSARwKQQXFt0llVr0OxZVNq/eG6Oz/1ip0QQ=
X-Google-Smtp-Source: ABdhPJw/QDc23XWBsm+hrPKPiePNqmIfMsSN03YTvKj0Q1t1z4UHm/zo1N8cBaQPBe6KFBJWCH5s1TwXIcSChhfFqik=
X-Received: by 2002:a05:6820:3cf:: with SMTP id
 s15mr9859889ooj.2.1624106136745; 
 Sat, 19 Jun 2021 05:35:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:3513:0:0:0:0:0 with HTTP; Sat, 19 Jun 2021 05:35:36
 -0700 (PDT)
From: Eric Woudstra <ericwouds@gmail.com>
Date: Sat, 19 Jun 2021 14:35:36 +0200
Message-ID: <CABROOSduRQrD8g7DSYoVfjSRA_qWHPHdWrmFnKKq7SMUGPvWgw@mail.gmail.com>
Subject: mt7530 cannot delete fdb self entries with vlan other then vlan
 number 1
To: Sean Wang <sean.wang@mediatek.com>, Landen.Chao@mediatek.com,
 dqfext@gmail.com
Cc: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_053538_336021_00E4C19A 
X-CRM114-Status: UNSURE (   9.09  )
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

QWJvdXQ6IGRyaXZlcnMvbmV0L2RzYS9tdDc1MzAuYwoKV2hlcmUgZG8gSSBnbyB3aXRoIHRoaXMg
YnVnIHJlcG9ydD8KCkl0IHdhcyBkaXNjdXNzZWQgaGVyZTogaHR0cDovL2ZvcnVtLmJhbmFuYS1w
aS5vcmcvdC92bGFuLWVuYWJsZWQKLWJyaWRnZS1idWcvMTIyNTQKClRoZSBtdDc1MzAgZHJpdmVy
IGRvZXMgbm90IHNlZW0gdGUgYmUgYWJsZSB0byBkZWxldGUgZmRiICdzZWxmJyBlbnRyaWVzLApm
b3IgdmxhbiBudW1iZXJzIG90aGVyIHRoZW4gMS4gVGhpcyBhZmZlY3RzIHdsYW4gcm9hbWluZyB3
aGVuIHZsYW4KaXMgZW5hYmxlZC4KClRlc3RlZCBvbiBrZXJuZWwgNS4xMi4gSW4gYWxsIGNhc2Vz
IHRoZSBrZXJuZWwgaXMgY29tcGlsZWQgd2l0aApDT05GSUdfQlJJREdFX1ZMQU5fRklMVEVSSU5H
PXkuCgoKSGVyZSBpcyBhIG1vcmUgY29tcGxldGUgZGVzY3JpcHRpb246CgpOZXR3b3JrIHNldHVw
IHdpdGggdmxhbjoKCmlwIGxpbmsgc2V0IGV0aDAgdXAKaXAgbGluayBhZGQgbmFtZSBicjAgdHlw
ZSBicmlkZ2Ugdmxhbl9maWx0ZXJpbmcgMSB2bGFuX2RlZmF1bHRfcHZpZCAzCmlwIGxpbmsgc2V0
IGJyMCB1cAppcCBsaW5rIHNldCBsYW4wIG1hc3RlciBicjAKaXAgbGluayBzZXQgbGFuMCB1cAoK
TmV0d29yayBzZXR1cCB3aXRob3V0IHZsYW46CgppcCBsaW5rIHNldCBldGgwIHVwCmlwIGxpbmsg
YWRkIG5hbWUgYnIwIHR5cGUgYnJpZGdlCmlwIGxpbmsgc2V0IGJyMCB1cAppcCBsaW5rIHNldCBs
YW4wIG1hc3RlciBicjAKaXAgbGluayBzZXQgbGFuMCB1cAoKQm90aDoKCmlwIGFkZHIgYWRkIDE5
Mi4xNjguMS4zMy8yNCBicm9hZGNhc3QgMTkyLjE2OC4xLjI1NSBkZXYgYnIwCmlwIHJvdXRlIGFk
ZCAxOTIuMTY4LjEuMC8yNCBkZXYgYnIwCmlwIHJvdXRlIGFkZCBkZWZhdWx0IHZpYSAxOTIuMTY4
LjEuMQoKClRoZSBCUEktUjY0IGlzIGNvbm5lY3RlZCB3aXRoIGxhbjAgdG8gYSBsYW4gcG9ydCBv
ZiBteSByb3V0ZXIuIFRoZW4gSQpjb25uZWN0IG15IHBob25lIHdpdGggbWFjIGFhOmJiOmNjOmRk
OmVlOmZmIHRvIG15IHJvdXRlci4gVGhlbiBJCmRpc2FibGUgdGhlIHdpZmkgb2YgbXkgcGhvbmUg
c28gbm8gbW9yZSBwYWNrZXRzIHdpdGggdGhpcyBtYWMgYXJlIHNlbnQKb24gdGhlIG5ldHdvcmsu
CgpCcmlkZ2UgY3JlYXRlZCB3aXRoIHZsYW5fZmlsdGVyaW5nIDEgdmxhbl9kZWZhdWx0X3B2aWQg
MwoKcm9vdEBicGktcjY0On4jIGJyaWRnZSBmZGIgfCBncmVwIGFhOmJiOmNjOmRkOmVlOmZmCmFh
OmJiOmNjOmRkOmVlOmZmIGRldiBsYW4wIHZsYW4gMyBtYXN0ZXIgYnIwCmFhOmJiOmNjOmRkOmVl
OmZmIGRldiBsYW4wIHZsYW4gMyBzZWxmCnJvb3RAYnBpLXI2NDp+IyBicmlkZ2UgZmRiIGRlbCBh
YTpiYjpjYzpkZDplZTpmZiBkZXYgbGFuMCB2bGFuIDMgc2VsZgpyb290QGJwaS1yNjQ6fiMgYnJp
ZGdlIGZkYiB8IGdyZXAgYWE6YmI6Y2M6ZGQ6ZWU6ZmYKYWE6YmI6Y2M6ZGQ6ZWU6ZmYgZGV2IGxh
bjAgdmxhbiAzIHNlbGYKcm9vdEBicGktcjY0On4jCgpCcmlkZ2UgY3JlYXRlZCB3aXRob3V0IHZs
YW5fZmlsdGVyaW5nIDEgdmxhbl9kZWZhdWx0X3B2aWQgMwoKcm9vdEBicGktcjY0On4jIGJyaWRn
ZSBmZGIgfCBncmVwIGFhOmJiOmNjOmRkOmVlOmZmCmFhOmJiOmNjOmRkOmVlOmZmIGRldiBsYW4w
IG1hc3RlciBicjAKYWE6YmI6Y2M6ZGQ6ZWU6ZmYgZGV2IGxhbjAgdmxhbiAxIHNlbGYKcm9vdEBi
cGktcjY0On4jIGJyaWRnZSBmZGIgZGVsIGFhOmJiOmNjOmRkOmVlOmZmIGRldiBsYW4wIHZsYW4g
MSBzZWxmCnJvb3RAYnBpLXI2NDp+IyBicmlkZ2UgZmRiIHwgZ3JlcCBhYTpiYjpjYzpkZDplZTpm
Zgpyb290QGJwaS1yNjQ6fiMKCkxhdGVyIEkgZm91bmQgb3V0IHRoYXQgdGhlIGZkYiBzZWxmIGVu
dHJ5IGNhbiBiZSBkZWxldGVkIHdpdGgKdmxhbl9maWx0ZXJpbmcgZW5hYmxlZCwgYnV0IHdpdGgg
dmxhbiBudW1iZXIgMSBvbmx5LgoKTm93IEkgaGF2ZSB0ZXN0ZWQgd2lmaSByb2FtaW5nIG9uIGEg
aG9tZSBuZXR3b3JrIGNvbm5lY3RlZApyb3V0ZXItbGFuIHRvIGJwaXI2NC1sYW4uCgpUaGlzIGlz
IHdpdGggZW5hYmxlZCB2bGFuLCB2bGFuIDEuIEZpcnN0IGNvbW1hbmQsIHBob25lIGNvbm5lY3Rl
ZCB0bwpyZW1vdGUgcm91dGVyLCBzZWNvbmQgY29tbWFuZCwgcGhvbmUgcm9hbWVkIHRvIEJQSS1S
NjQuCgpyb290QGJwaS1yNjQ6fiMgYnJpZGdlIGZkYiB8IGdyZXAgYWE6YmI6Y2M6ZGQ6ZWU6ZmYK
YWE6YmI6Y2M6ZGQ6ZWU6ZmYgZGV2IGxhbjAgdmxhbiAxIG1hc3RlciBicmxhbgphYTpiYjpjYzpk
ZDplZTpmZiBkZXYgbGFuMCB2bGFuIDEgc2VsZgpyb290QGJwaS1yNjQ6fiMgYnJpZGdlIGZkYiB8
IGdyZXAgYWE6YmI6Y2M6ZGQ6ZWU6ZmYKYWE6YmI6Y2M6ZGQ6ZWU6ZmYgZGV2IHdsYW4wIHZsYW4g
MSBtYXN0ZXIgYnJsYW4KClBob25lIGhhcyBnb29kIGludGVybmV0IGNvbm5lY3Rpdml0eSA6c2xp
Z2h0X3NtaWxlOgoKTm93IHRoZSBzYW1lIHNldHVwIGJ1dCB3aXRoIHZsYW4gMgoKcm9vdEBicGkt
cjY0On4jIGJyaWRnZSBmZGIgfCBncmVwIGFhOmJiOmNjOmRkOmVlOmZmCmFhOmJiOmNjOmRkOmVl
OmZmIGRldiBsYW4wIHZsYW4gMiBtYXN0ZXIgYnJsYW4KYWE6YmI6Y2M6ZGQ6ZWU6ZmYgZGV2IGxh
bjAgdmxhbiAyIHNlbGYKcm9vdEBicGktcjY0On4jIGJyaWRnZSBmZGIgfCBncmVwIGFhOmJiOmNj
OmRkOmVlOmZmCmFhOmJiOmNjOmRkOmVlOmZmIGRldiBsYW4wIHZsYW4gMiBzZWxmCmFhOmJiOmNj
OmRkOmVlOmZmIGRldiB3bGFuMCB2bGFuIDIgbWFzdGVyIGJybGFuCgpUaGlzIGxhc3QgcmVzdWx0
IG1ha2VzIHRoZSBwaG9uZSBub3QgYWJsZSB0byByZWFjaCB0aGUgZGhjcApzZXJ2ZXIgKG9uIHRo
ZSByZW1vdGUgcm91dGVyKS4gTm8gY29ubmVjdGl2aXR5LgoKVGhlIGZpeCDigJhuZXQ6IGRzYTog
bXQ3NTMwOiBmaXggcm9hbWluZyBmcm9tIERTQSB1c2VyIHBvcnRz4oCZIGRvZXMgbm90IHdvcmsK
YW55bW9yZSB3aGVuIHZsYW4gaWQgZG9lcyBub3QgZXF1YWwgMS4KCkkgZ3Vlc3MgaXQgc3VmZmVy
cyBmcm9tIHRoZSBzYW1lIGJ1ZyB0aGF0IGZkYiDigJhzZWZm4oCZIGVudHJpZXMgd2l0aCB2bGFu
4oCZcwpvdGhlciB0aGFuIDEgY2Fubm90IGJlIGRlbGV0ZWQuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
