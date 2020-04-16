Return-Path: <SRS0=NHOn=6A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A40C2D0EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 09:13:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D17AD20644
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 09:13:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p4OWZN+S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h79u+RID"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D17AD20644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfJwrfVZ65oHXOE79CINUzaW90xrtBjEOfPMqRaL2gk=; b=p4OWZN+ScOHIYQ
	f0ePNdKMLQYewaL7OPr4+lQTZAaCkViETImqykIdSw83BoQyi4hbwgYt1b0iMXPcPVPEguartQ+2F
	4/00rBexjJNoQQdwJjytNlgYOCpETSlSsvv9EcIyTWIpgnh70gnh2HcpqX/c4L2WEFoEJ9ENpbPtT
	aDLhGiIZ9bzlLE+ZkR2+ZYrOq3H5UX8NPraY4JB1Mx4B0TJhH32ghIuxNpdjK2DuB/Kl/AxeURChy
	UGa4U0aPrCHMMRcncSdyEkzo1s31Jk78JeNjcYPbd8UTZEWkcCynN6tpkfXGSRS+99bFzM7tOxSiP
	3j3mCa4uOYlpqKxsl92Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP0af-0002Ce-Ua; Thu, 16 Apr 2020 09:13:45 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP0ad-0002Ax-3G
 for linux-mediatek@lists.infradead.org; Thu, 16 Apr 2020 09:13:44 +0000
Received: by mail-wr1-x444.google.com with SMTP id h26so3927718wrb.7
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Apr 2020 02:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=AyKKf2vu9ets5qQ05mKeEx+H3HJdeMhyf7LDU6EPmvg=;
 b=h79u+RID/Tw8EjEr7PzOeW67I5riBs6/JV027laFW3VtXjta4zpbT4owqSzSYadzXI
 UooqVXoXGL1A8oAByZdeXkLIJKTO01hEePh4C5fzehOrUdnbfQ1pEs9kiyqYoA/KX+JH
 1qMRtfcJSHijAK2OGm7YZmCKbHczogdEeoL22Pw+vKfPbVBWs4ymX9eJohxZQNiYHrt4
 ev6JtRiaXOHosoQtEI6ZEvp9wcTaGhtxQIVftu4d8viJsibPKXtJvkzZsh+8sFdMla2G
 mZm9iRn+HrGu+Q6eydYFxopmA1r46j4zcJCjdDXVsTQRSFhEB8VLG7f5460IgaYT+mVk
 jnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=AyKKf2vu9ets5qQ05mKeEx+H3HJdeMhyf7LDU6EPmvg=;
 b=k7L5SyfXFdSgQW6BXpjxw473HD6RDhzZ0HOVh+VX32AYI/Ia4tK1tlhl9gsUPz20p/
 DjrLEV+LQSWAqag5DtMIkqIItnAPBRz11RToTdOeYQ1RIx+EGRRid3c0kP2OCl3DHQiS
 /xTaO33YVB1o2btMQQ3fMCf2f5qYYJLtNjqUKaX3ckmr+d8zz3020bB5wggOHrmRViaM
 hnsiSMH9sWHR8pUaJcxTMNb69/3w7RtXVFC/7rFTPiETHQ2j/bButnjpRJ/kbJ5xjazw
 Vtg9tIGOl9e43+0t/Q1yg5IdZatEZ1v63V2hSCDjFjtBEkH34Hs6No7KVBqahZb+icgD
 L68Q==
X-Gm-Message-State: AGi0PubKhgQ20msqYCXCkI1FBmgDNi6dOvTClURTR9AbCwHPnSbnOflX
 D9WDh/TJIqEQz5oHjNVoLdv1YQ==
X-Google-Smtp-Source: APiQypL6P5SXhhJYLq4NR+TEKXmQzYaSqAHnJaTlLyokBRKxP3wo+p/iZ1+/LSCv7ZJBVaCmcdxoSg==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr4801408wrw.139.1587028418328; 
 Thu, 16 Apr 2020 02:13:38 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id b4sm21818100wrv.42.2020.04.16.02.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 02:13:37 -0700 (PDT)
Date: Thu, 16 Apr 2020 10:14:38 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v12 5/6] rtc: mt6397: Add support for the MediaTek MT6358
 RTC
Message-ID: <20200416091438.GA2167633@dell>
References: <1586333531-21641-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1586333531-21641-6-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586333531-21641-6-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_021343_149886_E61B6539 
X-CRM114-Status: GOOD (  15.63  )
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
 Kate Stewart <kstewart@linuxfoundation.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>,
 linux-rtc@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Josef Friedl <josef.friedl@speed.at>, srv_heupstream@mediatek.com,
 Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAwOCBBcHIgMjAyMCwgSHNpbi1Ic2l1bmcgV2FuZyB3cm90ZToKCj4gRnJvbTogUmFu
IEJpIDxyYW4uYmlAbWVkaWF0ZWsuY29tPgo+IAo+IFRoaXMgYWRkIHN1cHBvcnQgZm9yIHRoZSBN
ZWRpYVRlayBNVDYzNTggUlRDLiBEcml2ZXIgdXNpbmcKPiBjb21wYXRpYmxlIGRhdGEgdG8gc3Rv
cmUgZGlmZmVyZW50IFJUQ19XUlRHUiBhZGRyZXNzIG9mZnNldC4KPiBUaGlzIHJlcGxhY2UgUlRD
X1dSVEdSIHRvIFJUQ19XUlRHUl9NVDYzMjMgaW4gbXQ2MzIzLXBvd2Vyb2ZmCj4gZHJpdmVyIHdo
aWNoIG9ubHkgbmVlZGVkIGJ5IGFybXY3IENQVSB3aXRob3V0IEFURi4KPiAKPiBSZXZpZXdlZC1i
eTogTmljb2xhcyBCb2ljaGF0IDxkcmlua2NhdEBjaHJvbWl1bS5vcmc+Cj4gUmV2aWV3ZWQtYnk6
IFlpbmdqb2UgQ2hlbiA8eWluZ2pvZS5jaGVuQG1lZGlhdGVrLmNvbT4KPiBBY2tlZC1ieTogQWxl
eGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPgo+IEFja2VkLWJ5
OiBTZWJhc3RpYW4gUmVpY2hlbCA8c3JlQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogUmFu
IEJpIDxyYW4uYmlAbWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEhzaW4tSHNpdW5nIFdh
bmcgPGhzaW4taHNpdW5nLndhbmdAbWVkaWF0ZWsuY29tPgoKUGxlYXNlIHBsYWNlIHRoZXNlIGlu
IGNocm9ub2xvZ2ljYWwgb3JkZXIuICBUaGV5IHNob3VsZCBwcm92aWRlIHNvbWUKaGlzdG9yeSwg
cmF0aGVyIHRoYW4gYSB1bm9yZGVyZWQgc2xhYiBsaXN0IG9mIHJhbmRvbSBzaWduLW9mZnMuCgo+
IC0tLQo+ICBkcml2ZXJzL3Bvd2VyL3Jlc2V0L210NjMyMy1wb3dlcm9mZi5jIHwgIDIgKy0KPiAg
ZHJpdmVycy9ydGMvcnRjLW10NjM5Ny5jICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKysrKysr
Ky0tLQo+ICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvcnRjLmggICAgICAgIHwgIDkgKysrKysr
KystCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
ClsuLi5dCgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvcnRjLmggYi9p
bmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvcnRjLmgKPiBpbmRleCA3ZGZiNjNiLi42MjAwZjNiIDEw
MDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbWZkL210NjM5Ny9ydGMuaAo+ICsrKyBiL2luY2x1
ZGUvbGludXgvbWZkL210NjM5Ny9ydGMuaAo+IEBAIC0xOCw3ICsxOCw5IEBACj4gICNkZWZpbmUg
UlRDX0JCUFVfQ0JVU1kgICAgICAgICBCSVQoNikKPiAgI2RlZmluZSBSVENfQkJQVV9LRVkgICAg
ICAgICAgICAoMHg0MyA8PCA4KQo+ICAKPiAtI2RlZmluZSBSVENfV1JUR1IgICAgICAgICAgICAg
IDB4MDAzYwo+ICsjZGVmaW5lIFJUQ19XUlRHUl9NVDYzNTggICAgICAgMHgzYQo+ICsjZGVmaW5l
IFJUQ19XUlRHUl9NVDYzOTcgICAgICAgMHgzYwoKV2h5IHJlbW92ZSB0aGUgbGVhZGluZyAwMCdz
PwoKVGhlc2UgYXJlIG5vdyBkaWZmZXJlbnQgdG8gdGhlIG90aGVyIHJlZ3MgZGVmaW5lZCBpbiB0
aGlzIGhlYWRlci4KCj4gKyNkZWZpbmUgUlRDX1dSVEdSX01UNjMyMyAgICAgICBSVENfV1JUR1Jf
TVQ2Mzk3Cj4gIAo+ICAjZGVmaW5lIFJUQ19JUlFfU1RBICAgICAgICAgICAgMHgwMDAyCgpMaWtl
IGhlcmUgZm9yIGluc3RhbmNlICAtLV4KCj4gICNkZWZpbmUgUlRDX0lSUV9TVEFfQUwgICAgICAg
ICBCSVQoMCkKPiBAQCAtNjUsNiArNjcsMTAgQEAKPiAgI2RlZmluZSBNVEtfUlRDX1BPTExfREVM
QVlfVVMgIDEwCj4gICNkZWZpbmUgTVRLX1JUQ19QT0xMX1RJTUVPVVQgICAoamlmZmllc190b191
c2VjcyhIWikpCj4gIAo+ICtzdHJ1Y3QgbXRrX3J0Y19kYXRhIHsKPiArCXUzMiAgICAgICAgICAg
ICAgICAgICAgIHdydGdyOwo+ICt9Owo+ICsKPiAgc3RydWN0IG10NjM5N19ydGMgewo+ICAJc3Ry
dWN0IGRldmljZSAgICAgICAgICAgKmRldjsKPiAgCXN0cnVjdCBydGNfZGV2aWNlICAgICAgICpy
dGNfZGV2Owo+IEBAIC03NCw2ICs4MCw3IEBAIHN0cnVjdCBtdDYzOTdfcnRjIHsKPiAgCXN0cnVj
dCByZWdtYXAgICAgICAgICAgICpyZWdtYXA7Cj4gIAlpbnQgICAgICAgICAgICAgICAgICAgICBp
cnE7Cj4gIAl1MzIgICAgICAgICAgICAgICAgICAgICBhZGRyX2Jhc2U7Cj4gKwljb25zdCBzdHJ1
Y3QgbXRrX3J0Y19kYXRhICpkYXRhOwo+ICB9Owo+ICAKPiAgI2VuZGlmIC8qIF9MSU5VWF9NRkRf
TVQ2Mzk3X1JUQ19IXyAqLwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2Vydmlj
ZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9y
IEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
