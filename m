Return-Path: <SRS0=YIXp=5T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D663C43331
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 16:05:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F478206E9
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 16:05:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M7fvs2/A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RMb5dqzV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F478206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JCaKKIXrUkCgyANie1/rFsWFeXQyaXa4dBHRO7LSIQ=; b=M7fvs2/APwXaCF
	3j5qUJ+/TU3Ae9T0BK8t7vKz9f7HL0s2pPurp1dcIcNHG23RK4Go4dSN8MKZZx8ZU5MPIhMKqvOp1
	odM6tQBHwFmqP3l37VIlkgzj2PvhWCbvF3oCZUHhpJufggfwfIpV8ES1r0lGI8/wqGiZKM9jJKLQY
	T4H46a01/UJc7dGQRuZcvXiAJfeY8xZAHG1x2f73Nf6XkCR9P7dW3sS1EVFzLEJla/o6xPmzwuNjo
	IX6rIXjrRwPW7frda+65Q3Dp6OND064pkMKKob7giTJus13ZtZU3twIY/yJXO85rIC5mh81JHthRU
	wW6KpyUWimdlQRMUQtWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKOom-0007KJ-VF; Fri, 03 Apr 2020 16:05:16 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKOoe-00060o-6H
 for linux-mediatek@lists.infradead.org; Fri, 03 Apr 2020 16:05:10 +0000
Received: by mail-wr1-x444.google.com with SMTP id 65so9185673wrl.1
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Apr 2020 09:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:cc:references:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hs0Zr8WZnTnP6QA5uGZABigWsl4xm1HLGUjuTk55zko=;
 b=RMb5dqzVzEpKpbcC3UUqr8R9o61kVbkm8nwzw/HPFWg+wEIJxdfJ3k+rnkkqUSUhJM
 9EvxMV2iSSDfBIFwo6KAJgdbkdEq/vHxsLNu2bgEtSQmAOpPOevBDsaagLSbPk/+R4io
 2gK3m/sXLldiBl7TtiJoTSDEa8R6nqbajnWTyjLaNa10vPHJZC361JQ7Rn8jJYBD7GcT
 QeteoxJIUpfPAs+WUwdkFQa9kPchWJBwCr+kY8X7RbjC1cQ/HDTQEiZCiPZdTSo9LmX/
 URvcMd1hv1yRNHkhtd+7QSprcYQ09Y8WFik1OKQurnFM3fMotdcRe2Ly216wx7IKuCsa
 OD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hs0Zr8WZnTnP6QA5uGZABigWsl4xm1HLGUjuTk55zko=;
 b=ebLsf4YYfwGwdZPQMenz1DPqBXaILcWp1g67DcvMWqk4f2PsaG7wJqfNCGyyF58Bbk
 FCJvS7WBxkWuQacUshKeBEjOCxQs/irxLgxSt+QEINcA6/knUbAzNYA8cnAIaNE7SOLk
 YkYohxjD3pOM6dRvNgGfdjRiWBR7HKmu1LpyfbgeS2rH6KfAowb7scU6MmKTaXq7h76A
 pb10ipyoKmw9JHPlCjCbGe4ziPY5KVoXg0EVpAtRAn1jJXspZnNJF2bMJGohWJAU3e5c
 tRgFAtrr1JUty6Acm9XPE+2CsXwFKs4iqXYVv4cCk0pe2p26sx+RKDvHq58YJ8zN+fB5
 ou9A==
X-Gm-Message-State: AGi0PuYwmB4lth2WeW2M49LcObbUUAqEIjn0Ij3ecoTW9nXzjxwOACAd
 rDex7wNSCen9eiiWqWdhtDUAFA==
X-Google-Smtp-Source: APiQypK8nMsyaQBEIkRVEiPjmWw1a8hEY7TV2tBksz5wl+xU09p0+hlwPEYhClfXWDdYmeMsP1Cr0A==
X-Received: by 2002:adf:904a:: with SMTP id h68mr9057628wrh.291.1585929906278; 
 Fri, 03 Apr 2020 09:05:06 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:cc78:8018:8980:25d8?
 ([2a01:e34:ed2f:f020:cc78:8018:8980:25d8])
 by smtp.googlemail.com with ESMTPSA id p10sm12170013wre.15.2020.04.03.09.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2020 09:05:05 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v5 1/5] PM / EM: add devices to Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200318114548.19916-1-lukasz.luba@arm.com>
 <20200318114548.19916-2-lukasz.luba@arm.com>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <09b680a5-a118-8c6e-0ae1-03ab5f10c573@linaro.org>
Date: Fri, 3 Apr 2020 18:05:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200318114548.19916-2-lukasz.luba@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_090508_781797_77F68E85 
X-CRM114-Status: GOOD (  14.65  )
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, festevam@gmail.com, Morten.Rasmussen@arm.com,
 robh@kernel.org, amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de, rui.zhang@intel.com,
 alyssa.rosenzweig@collabora.com, orjan.eide@arm.com, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, s.hauer@pengutronix.de, rostedt@goodmis.org,
 matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com, airlied@linux.ie,
 javi.merino@arm.com, tomeu.vizoso@collabora.com, qperret@google.com,
 sboyd@kernel.org, mka@chromium.org, rdunlap@infradead.org, rjw@rjwysocki.net,
 agross@kernel.org, kernel@pengutronix.de, sudeep.holla@arm.com,
 patrick.bellasi@matbug.net, shawnguo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CkhpIEx1a2FzeiwKCgpPbiAxOC8wMy8yMDIwIDEyOjQ1LCBMdWthc3ogTHViYSB3cm90ZToKPiBB
ZGQgc3VwcG9ydCBvZiBvdGhlciBkZXZpY2VzIGludG8gdGhlIEVuZXJneSBNb2RlbCBmcmFtZXdv
cmsgbm90IG9ubHkgdGhlCj4gQ1BVcy4gQ2hhbmdlIHRoZSBpbnRlcmZhY2UgdG8gYmUgbW9yZSB1
bmlmaWVkIHdoaWNoIGNhbiBoYW5kbGUgb3RoZXIKPiBkZXZpY2VzIGFzIHdlbGwuCgp0aGFua3Mg
Zm9yIHRha2luZyBjYXJlIG9mIHRoYXQuIE92ZXJhbGwgSSBsaWtlIHRoZSBjaGFuZ2VzIGluIHRo
aXMgcGF0Y2gKYnV0IGl0IGhhcmQgdG8gcmV2aWV3IGluIGRldGFpbHMgYmVjYXVzZSB0aGUgcGF0
Y2ggaXMgdG9vIGJpZyA6LwoKQ291bGQgeW91IHNwbGl0IHRoaXMgcGF0Y2ggaW50byBzbWFsbGVy
IG9uZXM/CgplZy4gKGF0IHlvdXIgY29udmVuaWVuY2UpCgogLSBPbmUgcGF0Y2ggcmVuYW1pbmcg
cy9jYXAvcGVyZi8KCiAtIE9uZSBwYXRjaCBhZGRpbmcgYSBuZXcgZnVuY3Rpb246CgogICAgZW1f
ZGV2X3JlZ2lzdGVyX3BlcmZfZG9tYWluKHN0cnVjdCBkZXZpY2UgKmRldiwKCQkJCXVuc2lnbmVk
IGludCBucl9zdGF0ZXMsCgkJCQlzdHJ1Y3QgZW1fZGF0YV9jYWxsYmFjayAqY2IpOwoKICAgKCsg
RVhQT1JUX1NZTUJPTF9HUEwpCgogICAgQW5kIGVtX3JlZ2lzdGVyX3BlcmZfZG9tYWluKCkgdXNp
bmcgaXQuCgogLSBPbmUgY29udmVydGluZyB0aGUgZW1fcmVnaXN0ZXJfcGVyZl9kb21haW4oKSB1
c2VyIHRvCgllbV9kZXZfcmVnaXN0ZXJfcGVyZl9kb21haW4KCiAtIE9uZSBhZGRpbmcgdGhlIGRp
ZmZlcmVudCBuZXcgJ2VtJyBmdW5jdGlvbnMKCiAtIEFuZCBmaW5hbGx5IG9uZSByZW1vdmluZyBl
bV9yZWdpc3Rlcl9wZXJmX2RvbWFpbigpLgoKCj4gQWNrZWQtYnk6IFF1ZW50aW4gUGVycmV0IDxx
cGVycmV0QGdvb2dsZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTHVrYXN6IEx1YmEgPGx1a2Fzei5s
dWJhQGFybS5jb20+Cj4gLS0tCgpbIC4uLiBdCgo+ICAyLiBDb3JlIEFQSXMKPiBAQCAtNzAsMTQg
KzcyLDE2IEBAIENPTkZJR19FTkVSR1lfTU9ERUwgbXVzdCBiZSBlbmFibGVkIHRvIHVzZSB0aGUg
RU0gZnJhbWV3b3JrLgo+ICBEcml2ZXJzIGFyZSBleHBlY3RlZCB0byByZWdpc3RlciBwZXJmb3Jt
YW5jZSBkb21haW5zIGludG8gdGhlIEVNIGZyYW1ld29yayBieQo+ICBjYWxsaW5nIHRoZSBmb2xs
b3dpbmcgQVBJOjoKPiAgCj4gLSAgaW50IGVtX3JlZ2lzdGVyX3BlcmZfZG9tYWluKGNwdW1hc2tf
dCAqc3BhbiwgdW5zaWduZWQgaW50IG5yX3N0YXRlcywKPiAtCQkJICAgICAgc3RydWN0IGVtX2Rh
dGFfY2FsbGJhY2sgKmNiKTsKPiArICBpbnQgZW1fcmVnaXN0ZXJfcGVyZl9kb21haW4oc3RydWN0
IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgbnJfc3RhdGVzLAo+ICsJCXN0cnVjdCBlbV9kYXRh
X2NhbGxiYWNrICpjYiwgY3B1bWFza190ICpjcHVzKTsKCklzbid0IHBvc3NpYmxlIHRvIGdldCBy
aWQgb2YgdGhpcyBjcHVtYXNrIGJ5IHVzaW5nCmNwdWZyZXFfY3B1X2dldCgpIHdoaWNoIHJldHVy
bnMgdGhlIGNwdWZyZXEncyBwb2xpY3kgYW5kIGZyb20gdGhlaXIgZ2V0CnRoZSByZWxhdGVkIGNw
dXMgPwoKWyAuLi4gXQoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDi
lIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0
dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3
aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcv
bGluYXJvLWJsb2cvPiBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
