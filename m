Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A808C4361B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 10:59:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1201421BE5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 10:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1201421BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KykcOocOmXPz0D3+6HCLmnMs4x5pbYTfJImLn22zUJU=; b=ybHqBjWUmzjLixNRMF4XjJyFA
	JV42F05Avv44AA4rOLqIuerxQTulJwnJ9YHcinpR8qYS1gr7/e6LkZnhGvVpG7ppsXCDtJhDb9rYP
	RiMhz0MoA/Ou7W7ynNISLZl8tknKHwn6SmFGialTJWPzY7ySV42loNgs/61lUL1blk05z8p8oEbPh
	tBGQ5rpXnL2r1UcF3QqKFrvpHmc8xR6mEMbBxzGXTDSpuY890hZhR/YGRorCv0V0YzSq4W2BLaQT/
	oQ8B5AKd4rh4dcB+QzAIatSMvxyylpsSsXEwwKPQ53EFZ3WwhGa/hUA9c+SaOD6mtl1AcmdeJCGc6
	oktL6f6eQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmEF0-0001iv-T9; Mon, 07 Dec 2020 10:59:38 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmEEy-0001hX-Ip; Mon, 07 Dec 2020 10:59:37 +0000
Received: by mail-ej1-x643.google.com with SMTP id a16so18862180ejj.5;
 Mon, 07 Dec 2020 02:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ueepF1yzZbMICZuzK5SyCCKVIYjp8Ub6eatZHwC5SNQ=;
 b=Uj3sJueNflNH5hUhwt0vjG3oYCYO+JvWwURqSIkaAssBzmL9l0UksVHzWDm3qtz2tJ
 K2m/NH2IdmMK5JHKkmP1rQvuZ8ND6SqV+WJ7jnZvE5Eyn2HHH+Je5moW1QNHSWCyEpDu
 v/pxS7OwzqkPBZf9XdCP/TY/+iTf/wAi+/bR4ovxnTn/pvxrSdiEqGpTmENEooWhkXFS
 YrmBG+XL7/DfLNeH7Csw7rlznTI7736WIW6Y2Bum3XMNeT/Gq4Oua5l8dCecVZSpCWuv
 D4jzSoJ2ktoxY+57WJj5i5Xo4XKLTKhCr/BZ4yAaOQmrtJIxGFSZxYmr+jZYqJS6tGqN
 KUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ueepF1yzZbMICZuzK5SyCCKVIYjp8Ub6eatZHwC5SNQ=;
 b=t3uLjXMxS+PN2D09tOVz438PvLh4Eqt8QYdLoMXVvEecHqCQmYyMBYlGYYknLEauxl
 yJCotkTCb1NUpF/MKLow5XvywEYQly+JJ+t+BmO8O07RVj3OTe9+SLvPoHG4aXuFA4yS
 6zhlnG7c/mYPd8LBxMfX6LVTuk8Cujh2c7OzUhgzIVQPv6Lgkr9Jw5+UFe/vp5T2t/MI
 Tl/okQCdwuFajE8f8Ggd3YY3v9yMadiN9m9CfOHqBjSTGJ9+YJEMwbMQnybznEZY9JT2
 pXIDdisa1lW9jKk5dNCHNhpuS2PLQhQYimcRUly/j83Ni8ilf0Ewr4L8+wWwD1fbbIHu
 aaag==
X-Gm-Message-State: AOAM532pIHE4VySw7ZMGpmebV/V7DIf43+KOIUvmXbvwBm+xVLdC/O9l
 5HVRYXtBW/c/jOf25A01r70=
X-Google-Smtp-Source: ABdhPJwdVXVVZBusMiT3eABzfCHMmKAbPpc8SyCWfIQKwVGaIl4aMaqM9p8ahtPH/YufDw7gFzoe9g==
X-Received: by 2002:a17:906:52d9:: with SMTP id
 w25mr17646791ejn.504.1607338773893; 
 Mon, 07 Dec 2020 02:59:33 -0800 (PST)
Received: from ubuntu-laptop (ip5f5bfce9.dynamic.kabel-deutschland.de.
 [95.91.252.233])
 by smtp.googlemail.com with ESMTPSA id h23sm11571690ejg.37.2020.12.07.02.59.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 07 Dec 2020 02:59:33 -0800 (PST)
Message-ID: <062aa9e8f37c2e50032241ff8ddc1dcbc8051ba9.camel@gmail.com>
Subject: Re: [PATCH] scsi: ufs: Enable WB flush during suspend only if WB is
 enabled
From: Bean Huo <huobean@gmail.com>
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org, 
 martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
 jejb@linux.ibm.com
Date: Mon, 07 Dec 2020 11:59:31 +0100
In-Reply-To: <20201207055006.24471-1-stanley.chu@mediatek.com>
References: <20201207055006.24471-1-stanley.chu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_055936_667867_074717FD 
X-CRM114-Status: GOOD (  20.01  )
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
Cc: alice.chao@mediatek.com, bvanassche@acm.org, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIwLTEyLTA3IGF0IDEzOjUwICswODAwLCBTdGFubGV5IENodSB3cm90ZToKPiBX
cml0ZUJvb3RzZXIgZmx1c2ggZHVyaW5nIHN1c3BlbmQgaXMgbm90IG5lY2Vzc2FyeSB0byBiZSBl
bmFibGVkIGlmCj4gV3JpdGVCb29zdGVyIGZlYXR1cmUgaXMgZGlzYWJsZWQuIFNpbXBseSBhZGRp
bmcgYSBjaGVjayB0byBwcmV2ZW50Cj4gdW5leHBlY3RlZCBwb3dlciBkcmFpbi4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBTdGFubGV5IENodSA8c3RhbmxleS5jaHVAbWVkaWF0ZWsuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL3Njc2kvdWZzL3Vmc2hjZC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zY3Np
L3Vmcy91ZnNoY2QuYyBiL2RyaXZlcnMvc2NzaS91ZnMvdWZzaGNkLmMKPiBpbmRleCA0ODc5ZTg3
NTc3ZTEuLjg5ZmE4YjlhYzExZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Njc2kvdWZzL3Vmc2hj
ZC5jCj4gKysrIGIvZHJpdmVycy9zY3NpL3Vmcy91ZnNoY2QuYwo+IEBAIC01NDU4LDcgKzU0NTgs
NyBAQCBzdGF0aWMgYm9vbCB1ZnNoY2Rfd2JfbmVlZF9mbHVzaChzdHJ1Y3QgdWZzX2hiYQo+ICpo
YmEpCj4gICAgICAgICB1MzIgYXZhaWxfYnVmOwo+ICAgICAgICAgdTggaW5kZXg7Cj4gIAo+IC0g
ICAgICAgaWYgKCF1ZnNoY2RfaXNfd2JfYWxsb3dlZChoYmEpKQo+ICsgICAgICAgaWYgKCF1ZnNo
Y2RfaXNfd2JfYWxsb3dlZChoYmEpIHx8ICFoYmEtPndiX2VuYWJsZWQpCj4gICAgICAgICAgICAg
ICAgIHJldHVybiBmYWxzZTsKPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBUaGUgdWZzIGRldmlj
ZSBuZWVkcyB0aGUgdmNjIHRvIGJlIE9OIHRvIGZsdXNoLgoKCkhpIFN0YW5sZXkKCkluIHRoZSAz
LjEgU3BlYzoKCiJJZiB0aGUgZldyaXRlQm9vc3RlckVuIGZsYWcgaXMgc2V0IHRvIHplcm8sIGRh
dGEgd3JpdHRlbiB0byBhbnkKbG9naWNhbCB1bml0IGlzIHdyaXR0ZW4gaW4gbm9ybWFsIHN0b3Jh
Z2UuCklmIHRoZSBmV3JpdGVCb29zdGVyRW4gZmxhZyBpcyBzZXQgdG8gb25lIGFuZCB0aGUgZGV2
aWNlIGlzIGNvbmZpZ3VyZWQKaW4g4oCcc2hhcmVkIGJ1ZmZlcuKAnSBtb2RlLCBkYXRhIHdyaXR0
ZW4gdG8gYW55IGxvZ2ljYWwgdW5pdCBpcyB3cml0dGVuIGluCnRoZSBzaGFyZWQgV3JpdGVCb29z
dGVyIEJ1ZmZlci4iCgpzbywgSU1PLCBmV3JpdGVCb29zdGVyRW4gaXMgaW5kZXBlbmRhbnQgd2l0
aCBXQiBidWZmZXIgZmx1c2guCgphcyBmb3IgdGhlIGZsdXNoOgoKIlRoZXJlIGFyZSB0d28gbWV0
aG9kcyBmb3IgZmx1c2hpbmcgZGF0YSBmcm9tIHRoZSBXcml0ZUJvb3N0ZXIgQnVmZmVyCnRvIHRo
ZSBub3JtYWwgc3RvcmFnZTogb25lIGlzIHVzaW5nIGFuIGV4cGxpY2l0IGZsdXNoIGNvbW1hbmQs
IHRoZQpvdGhlciBlbmFibGluZyB0aGUgZmx1c2hpbmcgZHVyaW5nIGxpbmsgaGliZXJuYXRlIHN0
YXRlLiBJZiB0aGUKZldyaXRlQm9vc3RlckJ1ZmZlckZsdXNoRW4gZmxhZyBpcyBzZXQgdG8gb25l
LCB0aGUgZGV2aWNlIHNoYWxsIGZsdXNoCnRoZSBkYXRhIHN0b3JlZCBpbiB0aGUgV3JpdGVCb29z
dGVyIEJ1ZmZlciB0byB0aGUgbm9ybWFsIHN0b3JhZ2UuIElmCmZXcml0ZUJvb3N0ZXJCdWZmZXJG
bHVzaER1cmluZ0hpYmVybmF0ZSBpcyBzZXQgdG8gb25lLCB0aGUgZGV2aWNlCmZsdXNoZXMgdGhl
IFdyaXRlQm9vc3RlciBCdWZmZXIgZGF0YSBhdXRvbWF0aWNhbGx5IHdoZW5ldmVyIHRoZSBsaW5r
CmVudGVycyB0aGUgaGliZXJuYXRlIChISUJFUk44KSBzdGF0ZS4iCgpJTU8sIGZvciB0aGUgZmx1
c2gsIGl0IGlzIGNvbnRyb2xsZWQgYnkgZldyaXRlQm9vc3RlckJ1ZmZlckZsdXNoRW4gYW5kCmZX
cml0ZUJvb3N0ZXJCdWZmZXJGbHVzaER1cmluZ0hpYmVybmF0ZS4KCmhvdyBkbyB5b3UgdW5kZXJz
dGFuZCB0aGUgYWJvdmUgdHdvIHBhcmFncmFwaHMgZnJvbSBTcGVjPwoKCnRoYW5rcywKQmVhbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
