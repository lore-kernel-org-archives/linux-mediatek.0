Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5412FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 16:04:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C6660FDA
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 16:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10C6660FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Fds+WxLalJsnt88suXm7W8WmmmO4graPknXCoA5YLOE=; b=nSQEIN8o+xcFIaWZ+HVSs7P336
	BnTBKRCbCZRttp1JN3BtkfobVHRtHmJLFdACdAez2QLKniab0578kKfKid+SM8oRFrTHGrpXEvd8f
	a5ayo+zsM86DNBW89GoGWbgwCsYqu1k7VAgY3Ga0lBBTinz8QVpoQJcBImmmiQaAFQfsTEXFNNRiX
	yTHGTDULv/+UocYqc0hTZQQU4SG4gUwhasJb3vIGC1RX3JhGCnFd9g7RRoum3K1CaElglAOYq9vt+
	eYL5WNhU2atc9MVKZ/cJkdYtZrHGVaBdCAb2OoIywWn8M518hYtmPL1oD04AlrCW+6LPHF6a7J2/Z
	7PwCy8Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcV7A-00GS8G-Hk; Mon, 18 Oct 2021 16:03:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcV77-00GS6r-5w
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 16:03:50 +0000
Received: by mail-wr1-x42a.google.com with SMTP id r7so42395126wrc.10
 for <linux-mediatek@lists.infradead.org>; Mon, 18 Oct 2021 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U+OIiOCMy27mbGAVIQWKPL+EskS0hM/mO2G0dhzOV/w=;
 b=jvI5XDF/reW/lpq7AGNTSHhH/RptkMOZEnZr0m2g7jEJB8NC/GMARXVIORxhGwt1Mw
 +o0kFqxpPGJ6aS5C8AAq4g03pNPwx9Mw7IyGBjuwyG4RoLlPfxTygaPaTqEC39VraXYa
 M36mwhnX5wGM+lFGhylCkNeZY+2CCj3D6P8teKBcjRGsVU0mTU3J4y/ZpJ24FJHFo8dh
 XekrGaczuX1zRfdUFw+6xqz8FPi7d4pb2dpy6kCWQLDFQ7Pri0itsDw6zcjn/pCADJ26
 A8UmzJ/2cb2s4gZXMgAYWS25NAPkfaHhaQ2Ilcr4L+b58QdXl3n/C+z31kwYfjJzR5o9
 kSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U+OIiOCMy27mbGAVIQWKPL+EskS0hM/mO2G0dhzOV/w=;
 b=5KzoLE/NfI8KOxCeNvnN16dstSfsg3eKWziQm6DeFKDVys4koFvFNlkmsGp6mgsyuB
 QwYdt4otPHdutdEyp+RXmaLJiUsLROqcPh2o+CRLpVrlNZGrNT6+L8wzuQzhjfvAqnkG
 4frVLZPLrt2160TXQaq1ALwKtSH+h0oPIFsfdsdN0XRNcicTTfZ9EA5PIHGplefiSGmn
 4Hyn1d0e76AWV8+W3E4uVdh9VPid/AiCJVtli5w0IPw/7/ZuyH39zGPFZL5fv/OkcFBG
 8+JHJSWwPoyl+bpaqrVMFC7glPB2UlE+Mwx7TkjOhcK8gbCvHk3ERuZKN5QTGxq8NPw2
 20jA==
X-Gm-Message-State: AOAM530hK7X4yz5QxsvpdcLzOFyDtH4dsetVIcmIH0ZBvwjDnlTtjR38
 oDDNSY9xW+jLmC3Y9c3hrsFYdw==
X-Google-Smtp-Source: ABdhPJyQuCKOS0zcwDTms53/DFCPp1vNgudJJWPlT53tuVhpwDzWhLqnggucx92t2Vco/MSTf8WIXA==
X-Received: by 2002:adf:e7d0:: with SMTP id e16mr36332036wrn.283.1634573026584; 
 Mon, 18 Oct 2021 09:03:46 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:c590:9206:d20a:23bd?
 ([2a01:e34:ed2f:f020:c590:9206:d20a:23bd])
 by smtp.googlemail.com with ESMTPSA id d3sm14437830wrb.36.2021.10.18.09.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 09:03:46 -0700 (PDT)
Subject: Re: [PATCH 3/3] thermal: mediatek: add MT8365 thermal driver support
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Zhang Rui <rui.zhang@intel.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 fparent@baylibre.com, khilman@baylibre.com
References: <20211014135636.3644166-1-msp@baylibre.com>
 <20211014135636.3644166-4-msp@baylibre.com>
 <33815817-0f64-836a-5417-c614e66e231e@linaro.org>
 <20211018154001.sj7nc575hln3jkel@blmsp>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <1844fd1b-d3ff-55c1-a98e-54219c3838df@linaro.org>
Date: Mon, 18 Oct 2021 18:03:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018154001.sj7nc575hln3jkel@blmsp>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_090349_251123_2F54FFE7 
X-CRM114-Status: GOOD (  14.75  )
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

CkhpIE1hcmt1cywKCk9uIDE4LzEwLzIwMjEgMTc6NDAsIE1hcmt1cyBTY2huZWlkZXItUGFyZ21h
bm4gd3JvdGU6CgpbIC4uLiBdCgo+Pgo+Pj4gIAl9LCB7Cj4+PiAgCX0sCj4+PiAgfTsKPj4+ICBN
T0RVTEVfREVWSUNFX1RBQkxFKG9mLCBtdGtfdGhlcm1hbF9vZl9tYXRjaCk7Cj4+PiAgCj4+PiAt
c3RhdGljIHZvaWQgbXRrX3RoZXJtYWxfdHVybl9vbl9idWZmZXIodm9pZCBfX2lvbWVtICphcG1p
eGVkX2Jhc2UpCj4+PiArc3RhdGljIHZvaWQgbXRrX3RoZXJtYWxfdHVybl9vbl9idWZmZXIoc3Ry
dWN0IG10a190aGVybWFsICptdCwKPj4+ICsJCQkJICAgICAgIHZvaWQgX19pb21lbSAqYXBtaXhl
ZF9iYXNlKQo+Pj4gIHsKPj4+ICAJaW50IHRtcDsKPj4+ICAKPj4+IC0JdG1wID0gcmVhZGwoYXBt
aXhlZF9iYXNlICsgQVBNSVhFRF9TWVNfVFNfQ09OMSk7Cj4+PiAtCXRtcCAmPSB+KDB4MzcpOwo+
Pj4gLQl0bXAgfD0gMHgxOwo+Pj4gLQl3cml0ZWwodG1wLCBhcG1peGVkX2Jhc2UgKyBBUE1JWEVE
X1NZU19UU19DT04xKTsKPj4+ICsJaWYgKCFtdC0+Y29uZi0+YXBtaXhlZF9idWZmZXJfY3RsX3Jl
ZykKPj4+ICsJCXJldHVybjsKPj4+ICsKPj4+ICsJdG1wID0gcmVhZGwoYXBtaXhlZF9iYXNlICsg
bXQtPmNvbmYtPmFwbWl4ZWRfYnVmZmVyX2N0bF9yZWcpOwo+Pj4gKwl0bXAgJj0gbXQtPmNvbmYt
PmFwbWl4ZWRfYnVmZmVyX2N0bF9tYXNrOwo+Pj4gKwl0bXAgfD0gbXQtPmNvbmYtPmFwbWl4ZWRf
YnVmZmVyX2N0bF9zZXQ7Cj4+Cj4+IFdoYXQgaXMgdGhlIGdvYWwgb2YgdGhlc2UgdHdvIGJpdHMg
b3BlcmF0aW9ucyA/Cj4gCj4gbXQ3NjIyIG5lZWRzIHRvIHVuc2V0IGEgZmV3IGJpdHMgYW5kIHNl
dCBvbmUgYml0IGluIHRoaXMgcmVnaXN0ZXIuCj4gbXQ4MzY1IG9ubHkgdW5zZXRzIGJpdHMuIEZv
ciB0aGlzIHB1cnBvc2UgSSBjcmVhdGVkIGEgX21hc2sgZmllbGQgdG8KPiB1bnNldCBiaXRzIGFu
ZCBhIF9zZXQgZmllbGQgdG8gc2V0IGJpdHMuCj4gCj4gV291bGQgeW91IHN1Z2dlc3QgYSBkaWZm
ZXJlbnQgd2F5PwoKTm8sIEkgdW5kZXJzdGFuZCB3aGF0IHlvdSB3YW50ZWQgdG8gZG8uIEkgd2Fz
IGp1c3QgdW5zdXJlIGlmIHRoZXJlIHdhcyBhCnRyaWNrIGJlY2F1c2Ugb2YgdGhlIHRtcCB8PSAw
OwoKCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNv
dXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5m
YWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20v
IyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxv
Zy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
