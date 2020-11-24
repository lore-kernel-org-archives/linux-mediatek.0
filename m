Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30E0C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 08:25:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30A262073C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 08:25:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ErOPK/Dt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ITNkjmgb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30A262073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xeTTEFPXdLqF4xMxcqcqCePJlAu7WEThhTUG0FOc48Y=; b=ErOPK/DtdFD8LJ9AVMhyTYE8H
	sZgcqzvlNTeoMNfSSwDSTtYOkuYbYg9VWjSGBikoyAEBtq/TcfJqlNY4tYB8P3ZgDesOEKQnTRLdA
	1c+LlCsQMraWrLx0/G4WOM5S06UwNrtCjJcIKA4+tbifRcOv/3EzR1WgKo5dtIerGzexiZmAtdi2h
	BT2z6oR92VQGzcoErJDQmXVAWKAgPsresG0+RIIxjI+08EmGyAcLSQl+3tydCZrK8//XjIxxhH368
	XJROVYzjhmM8ihfHr8Jgz5bcmidp5rz7bO13z0RSaHT9CGbMsk9efN2OdM6ljm7bxL5uU42VO0cfM
	iGUvjxbfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khTdq-0002oi-LU; Tue, 24 Nov 2020 08:25:38 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khTdo-0002ng-0g
 for linux-mediatek@lists.infradead.org; Tue, 24 Nov 2020 08:25:37 +0000
Received: by mail-io1-xd41.google.com with SMTP id i9so21037702ioo.2
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2020 00:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KMNdadd9ZvFWTuVoNLHMWm8n/oEimDIAyR8rcds6pZI=;
 b=ITNkjmgb/YsTR2TlPkZnlmXo0uqq5uhiwHqyCtKh9zv2302HUv0EOxTI6zIuX27HOF
 Kj33WUb/MHzZGMRvP05GlvHO/yxIvW2dofPEUVo16ucBZLNJ300vkO7ksi0OMvtqhp58
 pQBKHdVHP75bsR9+H1njI04/dgI2F8y8ocIpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KMNdadd9ZvFWTuVoNLHMWm8n/oEimDIAyR8rcds6pZI=;
 b=s7U+L5sKEe2RKm5MUkG6qZKyivIcnWp0AckClHpmjlzUdu37VK0D8ZaP2N2NRJdCFu
 EX43vMxZbo+pJbaPATynHrqWQRo1DEmTV1SG1ShuR48q06Ddm0MgyCgLxLD/Hcrk5ErV
 WFzN7GtAV9YV4zPwF35XApAa0x3SU1PQBfBJIRnXPZWKinDxoUZh9W+09UG0ggi2SbNO
 3xydt+rTnFdiL2PAJgghseVhqQTl9TjiEPvzgMlgf1oSMlVYhs5GWDJiB02gBlbSFQuS
 3ROUEuqo/ENvcFueI3VNJ/LH5jkUJK1nWV/QA8D3kJI1KvJkCmw24Zluacq+2tPkquIK
 HhLg==
X-Gm-Message-State: AOAM530DCXZC9GvMkGYhhPNZgEu+QHAF3z9r3OiyuyKixgwJzDknTzbp
 CY3ZQQaE3ib6YP3egwn5uGfu5WBvZzxCkk9SnzgNzA==
X-Google-Smtp-Source: ABdhPJyva+3URDRSrpHxrcTh7uFP7kWdZNum/UXJ9zFv+P/ZN3AGrq1Y/T6jPrsBuSoVIiiqRr8BGnw2YdEdTuRhZ1w=
X-Received: by 2002:a05:6602:314c:: with SMTP id
 m12mr3172286ioy.100.1606206333961; 
 Tue, 24 Nov 2020 00:25:33 -0800 (PST)
MIME-Version: 1.0
References: <20201013102358.22588-1-michael.kao@mediatek.com>
 <20201013102358.22588-3-michael.kao@mediatek.com>
In-Reply-To: <20201013102358.22588-3-michael.kao@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 24 Nov 2020 16:25:08 +0800
Message-ID: <CAJMQK-gXFBbpmxugme3U0bJ_7TtWdibWWqQHSZLWy0jyeVuUuw@mail.gmail.com>
Subject: Re: [v5 2/3] arm64: dts: mt8183: Configure CPU cooling
To: Michael Kao <michael.kao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_032536_092643_4587784E 
X-CRM114-Status: GOOD (  15.35  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, srv_heupstream@mediatek.com,
 Linux PM <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 Matthias Kaehlcke <mka@chromium.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMTMsIDIwMjAgYXQgNjoyNCBQTSBNaWNoYWVsIEthbyA8bWljaGFlbC5rYW9A
bWVkaWF0ZWsuY29tPiB3cm90ZToKPgo+IEZyb206IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hy
b21pdW0ub3JnPgo+Cj4gQWRkIHR3byBwYXNzaXZlIHRyaXAgcG9pbnRzIGF0IDY4wrBDIGFuZCA4
MMKwQyBmb3IgdGhlIENQVSB0ZW1wZXJhdHVyZS4KPgo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoaWFz
IEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgS2Fv
IDxtaWNoYWVsLmthb0BtZWRpYXRlay5jb20+CgpUZXN0ZWQtYnk6IEhzaW4tWWkgV2FuZyA8aHNp
bnlpQGNocm9taXVtLm9yZz4KCj4gLS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsv
bXQ4MTgzLmR0c2kgfCA1NiArKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDU2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210ODE4My5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
ODMuZHRzaQo+IGluZGV4IDFjZDA5M2NmMzNmMy4uMDYxNGYxOGExZWEyIDEwMDY0NAo+IC0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kKPiArKysgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpCj4gQEAgLTEwLDYgKzEwLDcgQEAKPiAg
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgo+ICAjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQtY29udHJvbGxlci9tdDgxODMtcmVzZXRzLmg+Cj4gICNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9waHkvcGh5Lmg+Cj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy90
aGVybWFsL3RoZXJtYWwuaD4KPiAgI2luY2x1ZGUgIm10ODE4My1waW5mdW5jLmgiCj4KPiAgLyB7
Cj4gQEAgLTQ1MCw2ICs0NTEsNjEgQEAKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBvbGxpbmctZGVsYXkgPSA8NTAwPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHRoZXJtYWwtc2Vuc29ycyA9IDwmdGhlcm1hbCAwPjsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN1c3RhaW5hYmxlLXBvd2VyID0gPDUwMDA+Owo+ICsKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHRyaXBzIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdGhyZXNob2xkOiB0cmlwLXBvaW50QDAgewo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRlbXBlcmF0dXJlID0gPDY4MDAwPjsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoeXN0ZXJlc2lz
ID0gPDIwMDA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHR5cGUgPSAicGFzc2l2ZSI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIH07Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0
YXJnZXQ6IHRyaXAtcG9pbnRAMSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdGVtcGVyYXR1cmUgPSA8ODAwMDA+Owo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGh5c3RlcmVzaXMgPSA8MjAwMD47Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHlwZSA9ICJwYXNz
aXZlIjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsKPiArCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNwdV9jcml0OiBjcHUtY3Jp
dCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdGVt
cGVyYXR1cmUgPSA8MTE1MDAwPjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBoeXN0ZXJlc2lzID0gPDIwMDA+Owo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHR5cGUgPSAiY3JpdGljYWwiOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfTsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb29s
aW5nLW1hcHMgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXAw
IHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cmlw
ID0gPCZ0YXJnZXQ+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvb2xpbmctZGV2aWNlID0gPCZjcHUwCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUSEVSTUFMX05PX0xJTUlUCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUSEVSTUFM
X05PX0xJTUlUPiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwmY3B1MQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVEhFUk1BTF9OT19MSU1JVAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVEhFUk1BTF9O
T19MSU1JVD4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA8JmNwdTIKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRIRVJNQUxfTk9fTElNSVQKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRIRVJNQUxfTk9f
TElNSVQ+LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgPCZjcHUzCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBUSEVSTUFMX05PX0xJTUlUCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUSEVSTUFMX05PX0xJ
TUlUPjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBj
b250cmlidXRpb24gPSA8MzA3Mj47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIH07Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hcDEg
ewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRyaXAg
PSA8JnRhcmdldD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29vbGluZy1kZXZpY2UgPSA8JmNwdTQKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRIRVJNQUxfTk9fTElNSVQKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRIRVJNQUxf
Tk9fTElNSVQ+LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgPCZjcHU1Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUSEVSTUFMX05PX0xJTUlUCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUSEVSTUFMX05P
X0xJTUlUPiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDwmY3B1Ngo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgVEhFUk1BTF9OT19MSU1JVAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVEhFUk1BTF9OT19M
SU1JVD4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA8JmNwdTcKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFRIRVJNQUxfTk9fTElNSVQKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRIRVJNQUxfTk9fTElN
SVQ+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnRyaWJ1dGlvbiA9IDwxMDI0PjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgfTsKPgo+ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIFRoZSB0enRz
MSB+IHR6dHM2IGRvbid0IG5lZWQgdG8gcG9sbGluZyAqLwo+IC0tCj4gMi4xOC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
