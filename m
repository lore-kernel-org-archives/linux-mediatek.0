Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7D3C4743C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 18:29:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E38F6120D
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 18:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E38F6120D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bg6+lqbBthWCAn2jmeamJ2pTYf0+PjE7t6tS2tuxB4s=; b=jii18yallHdEVRnomLc3x0J5kA
	fH2tVC5jHLMsenbzyb1ypTOYhO65D6WQDocTn/umpVbpi01tqRLVE7C2xAAo9a5ArLAWutm6kZRbM
	IsnDXAOlupW2Z+GoYtQXk6bjpu9jkUNBpkk1YDUMHc074j30lVMxhMe4LWpaskeSydqVxxUDTorcd
	2BBsmqHA/C2OzHad98FZ5KpA0lEPony3uAuiag017thf+5Ale8bbSjHhnAoDc/T6wTrZAV+cibWd8
	tnjsgHUDzkPriazwUobbOPIcEr1RYQ9eZbWX6wJfvJsLNyY86cGVEeDXZsmOdZYMkIvOUDAprMRvE
	mXAzNIYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvOg2-004bFP-CK; Mon, 21 Jun 2021 18:29:42 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvOfe-004b9Q-UN
 for linux-mediatek@lists.infradead.org; Mon, 21 Jun 2021 18:29:20 +0000
Received: by mail-wr1-x433.google.com with SMTP id n7so20765841wri.3
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Jun 2021 11:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0h7qTLw7iVbT8QbSsm0zBOuy3gLWBPfMMVwH84B0A6E=;
 b=caiwhYlEUQbVaBms76Ua1Mcy5TQCvcHwN38R360aXilH1yWBuoBB8JY8yyujL7w+hg
 VOImO6JkzqlIgksrbB3BQMozaFUGQt9EYsVrMPVnIRtlfx8aVEA/SwmskHMol70MZ76E
 oKCuZzxhLaJR8vlkVWhkQsFJC2gsxDNuBeGZsVDobXcjHtuqKJQrUsehVro3YvlgMo4H
 WlW9QIF3GPIyHpV4+IpxTRU/wUX0SCKEKGdahd9sEGndFurOZztjbZQIhcUW9b8HUJZq
 0+fdRjvNgsMi//qVrnjuhIiW11BZulbBkDiim3gaUL4TXoZzA1rU5PUMMtOzEzz7uHTP
 0fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0h7qTLw7iVbT8QbSsm0zBOuy3gLWBPfMMVwH84B0A6E=;
 b=RQRMw0KKt756+tBQpdjmnSilLQyAlCrnxaLcTCiiVNqi7qIJMPMIkJ+fi5EvHBA2rO
 h1A0NH0qYL0QMdXvpcMw0/rcPBYycBnQH56IdGHhbgmZbeccaTyfT933V4Bqqg59R1lF
 DGpF8G7gjejFVscLANjJ8J+0aPvulzqH671BxSI+0SKXnXcfusIR53ZOM6G7zQ1sJf3W
 XiB44QgtlPwGc8KqCGjJqn+0QMamuMu1oY9QEsLWAnYdLUsZ7otpJM+Qf6FA916him+z
 DjWYS1Pse/8u61SO4z8rl0bikvliswzkL9FHiFPJ7Dxbn8somzaDGD/lr8Qz0KLDHYAy
 GUDg==
X-Gm-Message-State: AOAM531CF1A4D+ZGRTU/Nih6jMQ5rC3O573F424qubfqDc8RI2YKUbGH
 XjA9GF4Um/0gb+eKmloin7HBkg==
X-Google-Smtp-Source: ABdhPJwPxfVG4w0Lz2q4SXNxbZfRCeQ5g1BryLvFq3XRveWZT/82P4U5rh+6QPi4nV7uOkjbCWj7eA==
X-Received: by 2002:a05:6000:50d:: with SMTP id
 a13mr29289561wrf.130.1624300156936; 
 Mon, 21 Jun 2021 11:29:16 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:5ebd:8bd9:d549:4211?
 ([2a01:e34:ed2f:f020:5ebd:8bd9:d549:4211])
 by smtp.googlemail.com with ESMTPSA id k2sm18235911wrw.93.2021.06.21.11.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 11:29:16 -0700 (PDT)
Subject: Re: [PATCH] Fix mt7622.dtsi thermal cpu
To: ericwouds@gmail.com, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210619121927.32699-1-ericwouds@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e30a2d01-a200-80cb-88d9-6aea62dd49f1@linaro.org>
Date: Mon, 21 Jun 2021 20:29:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210619121927.32699-1-ericwouds@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_112919_057435_89B04C41 
X-CRM114-Status: GOOD (  25.26  )
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

T24gMTkvMDYvMjAyMSAxNDoxOSwgZXJpY3dvdWRzQGdtYWlsLmNvbSB3cm90ZToKPiBGcm9tOiBF
cmljIFdvdWRzdHJhIDxlcmljd291ZHNAZ21haWwuY29tPgo+IAo+IENwdS10aGVybWFsIGlzIHNl
dCB0byB1c2UgYWxsIGZyZXF1ZW5jaWVzIGFscmVhZHkgYXQgNDcgZGVncmVlcy4gCj4gVXNpbmcg
dGhlIENQVSBhdCA1MCBmb3IgYSBtaW51dGUsIHRoZSBDUFUgaGFzIHJlYWNoZWQgNDggZGVncmVl
cywgaXMgCj4gdGhyb3R0bGVkIGJhY2sgdG8gbG93ZXN0IHNldHRpbmcsIG1ha2luZyB0aGUgbXQ3
NjIyIHRlcnJyaWJseSBzbG93LiAKPiBFdmVuIGF0IHRoaXMgbG93IHNwZWVkLCB0aGUgQ1BVIGRv
ZXMgbm90IGNvb2wgZG93biBsb3dlciB0aGVuIDQ3IHNvCj4gdGhlIENQVSBpcyBzdHVjayBhdCBs
b3dlc3QgcG9zc2libGUgZnJlcXVlbmN5IHVudGlsIGl0IHNodXQgZG93biBhbmQKPiBzdGF5cyBv
ZmYgZm9yIDE1IG1pbnV0ZXMuCj4gCj4gY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9O
T19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPiwKPiAgICAgICAgICAgICAgICAgIDwmY3B1MSBUSEVS
TUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+Owo+IAo+IFRoaXMgc2hvdWxkIG5vdCBiZSBz
ZXQgYWwgZXZlcnkgY29vbGluZyBtYXAuIEl0IHNob3VsZCBvbmx5IGJlIHNldCBhdAo+IHRoZSBo
aWdoZXN0IGNvb2xpbmcgbWFwLiBTYW1lIGFzIGluIHRoZSBleGFtcGxlOgo+IAo+IGh0dHBzOi8v
d3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy8KPiB0
aGVybWFsL3RoZXJtYWwudHh0ICBsaW5lIDI3Mgo+IAo+IEJ1dCB0aGVuIHdpdGhvdXQgdGhlIGZh
biBhbmQgYWRkZWQgYSB0aGlyZCBtYXAuCj4gCj4gTm93IHRlbXBlcmF0dXJlIHdpbGwgYmUgcmVn
dWxhdGVkIGF0IDg3IGRlZ3JlZXMgY2VsY2l1cy4gQXQgdGVtcGVyYXR1cmVzCj4gbG93ZXIgdGhl
biA4NywgYWxsIGZyZXF1ZW5jaWVzIGNhbiBiZSB1c2VkLgoKNDfCsEMgaXMgcmVhbGx5IGEgdG9v
IGxvdyB0ZW1wZXJhdHVyZSBhbmQgdGhpcyBwZXJmb3JtYW5jZSBkcm9wIGlzIG5vcm1hbC4KCkkg
d291bGQgbm90IHJlbW92ZSB0aGUgcGFzc2l2ZSBtaXRpZ2F0aW9uIGJ1dCB0cnkgYnkgaW5jcmVh
c2luZyB0aGUgQ1BVCnRlbXAgdG8gNzDCsEMgYW5kIGJ5IGNoYW5naW5nIHRoZSBhY3RpdmUgdHJp
cCBwb2ludCB0byA4MMKwQy4gSWYgaXQgd29ya3MKZmluZSwgdHJ5IDc1wrBDIGFuZCA4NcKwQy4K
ClRvIHRlc3QsIHRoZSB0aGVybWFsIGtpbGxlciBpcyBkaHJ5c3RvbmUgKG9uZSB0aHJlYWQgcGVy
IGNwdSkuCgpXaXRoIGEgNzXCsEMgcGFzc2l2ZSB0cmlwIHBvaW50LCB0aGUgc3RlcCB3aXNlIHRo
ZXJtYWwgZ292ZXJub3IsIEkgdGhpbmsKdGhlIG1pdGlnYXRpb24gd2lsbCBoYXBwZW4gc21vb3Ro
bHkgcHJvdmlkaW5nIGJldHRlciBwZXJmb3JtYW5jZXMsIGFuZApwcm9iYWJseSB0aGUgZmFuIHdv
bid0IGZpcmUuCgo+IEFsc28gc2VlIHRoZSBwb3N0Ogo+IAo+IGh0dHA6Ly9mb3J1bS5iYW5hbmEt
cGkub3JnL3QvYnBpLXI2NC1vbmx5LTEwLWNwdS1zcGVlZC1hdC1hbHJlYWR5LTQ4LQo+IGRlZ3Jl
ZXMtY2VsY2l1cy1zcGVlZC1ub3QtaW5jcmVhc2luZy1hbnltb3JlLzEyMjYyCj4gCj4gU2lnbmVk
LW9mZi1ieTogRXJpYyBXb3Vkc3RyYSA8ZXJpY3dvdWRzQGdtYWlsLmNvbT4KPiAtLS0KPiAgYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaSB8IDggKysrKy0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaSBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3NjIyLmR0c2kKPiBpbmRleCA4OTBhOTQyZWMuLmI3Nzlj
N2FhNiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210NzYyMi5k
dHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc2MjIuZHRzaQo+IEBA
IC0xNzAsMTQgKzE3MCwxNCBAQCBjcHUtY3JpdCB7Cj4gIAkJCWNvb2xpbmctbWFwcyB7Cj4gIAkJ
CQltYXAwIHsKPiAgCQkJCQl0cmlwID0gPCZjcHVfcGFzc2l2ZT47Cj4gLQkJCQkJY29vbGluZy1k
ZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPiwKPiAtCQkJ
CQkJCSA8JmNwdTEgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPjsKPiArCQkJCQlj
b29saW5nLWRldmljZSA9IDwmY3B1MCAwIDA+LAo+ICsJCQkJCQkJIDwmY3B1MSAwIDA+Owo+ICAJ
CQkJfTsKPiAgCj4gIAkJCQltYXAxIHsKPiAgCQkJCQl0cmlwID0gPCZjcHVfYWN0aXZlPjsKPiAt
CQkJCQljb29saW5nLWRldmljZSA9IDwmY3B1MCBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9f
TElNSVQ+LAo+IC0JCQkJCQkJIDwmY3B1MSBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElN
SVQ+Owo+ICsJCQkJCWNvb2xpbmctZGV2aWNlID0gPCZjcHUwIDAgMD4sCj4gKwkJCQkJCQkgPCZj
cHUxIDAgMD47Cj4gIAkJCQl9Owo+ICAKPiAgCQkJCW1hcDIgewo+IAoKCi0tIAo8aHR0cDovL3d3
dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFS
TSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xp
bmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRl
ciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
