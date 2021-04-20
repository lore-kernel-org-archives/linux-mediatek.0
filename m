Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	TRACKER_ID,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1811C43460
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 21:23:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B860613FA
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 21:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B860613FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nxfVlCbTB3k5UvrsJPpngMBDLHhjGnp/mlHmPZMv6CU=; b=ccygXl4jxDTMvna8muoFz8etg
	jZN377gHyUolT/1j8TjoetHXuXSoEls/4b4Ho3I7/luezqvyQfcviw9s3m4sM8u3Dco2TqDVj6j92
	/nDTwAKCgoWBmBNgMvmfsAgfrbMM1FUzWbAIpd3BjnXn7L81XbQ7ovOwuUSJikud71tLNy/NdFSO4
	lRXxDBbO2O1qf4zI0cOl3pc5GJaKN7ESB7ySq6AOtWnZ1E+1NckY2nTIvW/3vDH7yf08jMyzzsYfw
	kZE83vVT+hr6zyIonPN3vsHN2pZeLtKCEgqp6orZkyrpfNZPItfb3It8ZaVcv7BPDKnJGJCFmtXJb
	YoLaAbaCA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYxpf-00D4fB-6G; Tue, 20 Apr 2021 21:22:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYxpa-00D4eK-5D
 for linux-mediatek@desiato.infradead.org; Tue, 20 Apr 2021 21:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=kQP1W0MBWimzZ3NHtFo9wJkMkPBAuGsB/TCIhzxFq2s=; b=JiVTdbbeWYgApt4g+TH+AQ4lBb
 Vvoga6f9zcrLVfo+abf52Q6aWsFmTpg42qZrdtwM/RxvbyP2wsZSJvmuCU2ute2CxsJj1LUb0L+dv
 kDGPL5Ku2SJj8CMxO89ioZ8/7Vevrpl+SpnfOiklqbIo/srvBSg7QImxWD7b5T1/ax2CX7MBTjYSu
 oAO+BFso3unG37nSNtZdpFa0sj1c3AV7GeDZsDPgYrPLm3FCjjCFVDwZVFR5beOgH01oNNLRXLNaw
 35Sf2nwigWAkjoHmitUdV/6R+rnfoCrkxv2RCQkIP27d6Zl0rKgxtEYaVuLbyitn28ZAMiYIuo9Pn
 HEfHUQUQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYxpV-00CQgx-6q
 for linux-mediatek@lists.infradead.org; Tue, 20 Apr 2021 21:22:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so78339wmq.4
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 14:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kQP1W0MBWimzZ3NHtFo9wJkMkPBAuGsB/TCIhzxFq2s=;
 b=rzuVUTTZ+oUsaLSGlch2El9svn+1gJeN2CTAM2dlFJalEknnqY8jieUoKJMandXYw5
 QZfWrO/fCtAS4Xwwq2TXM9Iy3uRy8QH+nuli3JqOjJc7EuPcVvIffhlAvN97Fz34l8ia
 WH3lI4+K1dKIYEAqzYnvbfvtHE9IR4bgWqp6+CPXN5V37w7Huz1aHSniLIckyAujhYA1
 Z+1oizpgsPEIJqHLH4PvviEpK8DXrZj0iSCkGaMlUu6Nf1knvPWqKBMcnPfoq10ElgCI
 cmqTrIXD4kaQxJBtEfEFBAW+/ocrCUe+xYqD1l7Zw86HEs4V28M5Ahw7GfD+74LC9gXa
 o11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kQP1W0MBWimzZ3NHtFo9wJkMkPBAuGsB/TCIhzxFq2s=;
 b=jhhvaAeNgU6BE1uvZnM7m66LDMO1mleCLkPmFJKFPGY43iw4PaYmZDOjl9SG5Os6kw
 MpTsVU5/L2DpjPwIfW+Okul6aOSH/WV4fZ20uHudDaalkweQenB018TZBNM4ktD8872u
 emc7C0z3rAmlGZIkDkFLORvIewJKKf7jdaAJSKWamjQplB48Erl+4BY+3veDFj7kcHlg
 QnbIhbLF2fMAX5pBAte/V6zDf5IB8CIEHCRMYXNyPOMCeQeQwKnhBh6b1pxnYoUy5nIN
 nyDQjXP60wmfg1NGD/WuhcHXF26obl9w5YaLYDe66kbSUYvlGKhrr6uy6LHnSc1B30wO
 oiWg==
X-Gm-Message-State: AOAM533we4IkU/cGKrpcAvu4DQTVccb4Hl3bwaUYAiOJ+DfUy9XhpTvM
 wByMqjr213/IlEMVP3dH5yLVNQdK66KlbEjY
X-Google-Smtp-Source: ABdhPJy16FwFXiDGc9r0CAAjvwJ8hNKS+OrtXiZvmcPPiEFLV6whPzFusug3HluJUQV47Qg5SULmPg==
X-Received: by 2002:a1c:4089:: with SMTP id n131mr6389622wma.77.1618953763027; 
 Tue, 20 Apr 2021 14:22:43 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:d985:3a3b:ec32:bdfe?
 ([2a01:e34:ed2f:f020:d985:3a3b:ec32:bdfe])
 by smtp.googlemail.com with ESMTPSA id z15sm267741wrv.39.2021.04.20.14.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 14:22:42 -0700 (PDT)
Subject: Re: [v3,1/3] thermal: mediatek: Relocate driver to mediatek folder
To: Michael Kao <michael.kao@mediatek.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-pm@vger.kernel.org, srv_heupstream@mediatek.com
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20210312034018.17437-1-michael.kao@mediatek.com>
 <20210312034018.17437-2-michael.kao@mediatek.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <836581c1-0738-8e42-b168-b54d0bd078a5@linaro.org>
Date: Tue, 20 Apr 2021 23:22:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210312034018.17437-2-michael.kao@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_142245_307847_8E667EBA 
X-CRM114-Status: GOOD (  21.04  )
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

T24gMTIvMDMvMjAyMSAwNDo0MCwgTWljaGFlbCBLYW8gd3JvdGU6Cj4gQWRkIE1lZGlhdGVrIHBy
b3ByaWV0YXJ5IGZvbGRlciB0byB1cHN0cmVhbSBtb3JlIHRoZXJtYWwgem9uZSBhbmQgY29vbGVy
Cj4gZHJpdmVycy4gUmVsb2NhdGUgdGhlIG9yaWdpbmFsIHRoZXJtYWwgY29udHJvbGxlciBkcml2
ZXIgdG8gaXQgYW5kIHJlbmFtZQo+IGFzIHNvY190ZW1wLmMgdG8gc2hvdyBpdHMgcHVycG9zZSBt
b3JlIGNsZWFybHkuCgpXZSBhbHJlYWR5IGtub3cgdGhlIHB1cnBvc2UgOikKCnNvY190ZW1wIGdp
dmVzIG5vIGFkZGl0aW9uYWwgaW5mb3JtYXRpb24uCgpFaXRoZXIga2VlcCB0aGUgbmFtZSBvciBn
aXZlIHRoZSBoYXJkd2FyZSBzZW5zb3IgbmFtZS4gSXQgaXMgYSBkcml2ZXIKZGlyZWN0b3J5LgoK
PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEthbyA8bWljaGFlbC5rYW9AbWVkaWF0ZWsuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL3RoZXJtYWwvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgfCAx
NCArKysrLS0tLS0tLQo+ICBkcml2ZXJzL3RoZXJtYWwvTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL3RoZXJtYWwvbWVkaWF0ZWsvS2NvbmZpZyAgICAgICAg
ICAgICAgfCAyMyArKysrKysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvdGhlcm1hbC9tZWRpYXRl
ay9NYWtlZmlsZSAgICAgICAgICAgICB8ICAxICsKPiAgLi4uL3ttdGtfdGhlcm1hbC5jID0+IG1l
ZGlhdGVrL3NvY190ZW1wLmN9ICAgIHwgIDAKClsgLi4uIF0KCnZ2dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2
dnZ2dnZ2dnZ2dnZ2dnZ2dnZ2CgoKPiArY29uZmlnIE1US19USEVSTUFMCj4gKwl0cmlzdGF0ZSAi
TWVkaWF0ZWsgdGhlcm1hbCBkcml2ZXJzIgo+ICsJZGVwZW5kcyBvbiBUSEVSTUFMX09GCj4gKwlo
ZWxwCj4gKwkgIFRoaXMgaXMgdGhlIG9wdGlvbiBmb3IgTWVkaWF0ZWsgdGhlcm1hbCBzb2Z0d2Fy
ZQo+ICsJICBzb2x1dGlvbnMuIFBsZWFzZSBlbmFibGUgY29ycmVzcG9uZGluZyBvcHRpb25zIHRv
Cj4gKwkgIGdldCB0ZW1wZXJhdHVyZSBpbmZvcm1hdGlvbiBmcm9tIHRoZXJtYWwgc2Vuc29ycyBv
cgo+ICsJICB0dXJuIG9uIHRocm90dGxlIG1lY2hhaXNtcyBmb3IgdGhlcm1hbCBtaXRpZ2F0aW9u
Lgo+ICsKPiAraWYgTVRLX1RIRVJNQUwKCgpeXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXgoKQWxsIHRoZSBhYm92ZSBub3QgbmVlZGVkLgoKPiArY29uZmlnIE1US19TT0NfVEhF
Uk1BTAo+ICsJdHJpc3RhdGUgIlRlbXBlcmF0dXJlIHNlbnNvciBkcml2ZXIgZm9yIG1lZGlhdGVr
IFNvQ3MiCj4gKwlkZXBlbmRzIG9uIEhBU19JT01FTQo+ICsJZGVwZW5kcyBvbiBOVk1FTQo+ICsJ
ZGVwZW5kcyBvbiBSRVNFVF9DT05UUk9MTEVSCj4gKwloZWxwCj4gKwkgIEVuYWJsZSB0aGlzIG9w
dGlvbiBpZiB5b3Ugd2FudCB0byBnZXQgU29DIHRlbXBlcmF0dXJlCj4gKwkgIGluZm9ybWF0aW9u
IGZvciBNZWRpYXRlayBwbGF0Zm9ybXMuIFRoaXMgZHJpdmVyCj4gKwkgIGNvbmZpZ3VyZXMgdGhl
cm1hbCBjb250cm9sbGVycyB0byBjb2xsZWN0IHRlbXBlcmF0dXJlCj4gKwkgIHZpYSBBVVhBREMg
aW50ZXJmYWNlLgo+ICsKPiArZW5kaWYKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90aGVybWFsL21l
ZGlhdGVrL01ha2VmaWxlIGIvZHJpdmVycy90aGVybWFsL21lZGlhdGVrL01ha2VmaWxlCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmY3NTMxM2RkY2U1ZQo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL3RoZXJtYWwvbWVkaWF0ZWsvTWFrZWZpbGUKPiBA
QCAtMCwwICsxIEBACj4gK29iai0kKENPTkZJR19NVEtfU09DX1RIRVJNQUwpCSs9IHNvY190ZW1w
Lm8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90aGVybWFsL210a190aGVybWFsLmMgYi9kcml2ZXJz
L3RoZXJtYWwvbWVkaWF0ZWsvc29jX3RlbXAuYwo+IHNpbWlsYXJpdHkgaW5kZXggMTAwJQo+IHJl
bmFtZSBmcm9tIGRyaXZlcnMvdGhlcm1hbC9tdGtfdGhlcm1hbC5jCj4gcmVuYW1lIHRvIGRyaXZl
cnMvdGhlcm1hbC9tZWRpYXRlay9zb2NfdGVtcC5jCgoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8u
b3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpG
b2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFj
ZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRw
Oi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
