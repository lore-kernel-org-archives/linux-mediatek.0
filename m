Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0AFC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 08:16:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B187620738
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 08:16:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BhhB4Sn/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fGuo2D4q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B187620738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xt2vkcc/MlTg8e4BpHUeZCZul6lBT7p3L/g7hdG2BSI=; b=BhhB4Sn/qPhXm2
	vi/BkiWwh5GiUwlbvQ493iiwxxtqY8rtG/xi84BZOeBOWQ3WjBrvmSaF0fZKa/gGMI7GVbyfrZiKY
	VrVZ1aZP3r+5X94jmBmowKDalMwTAcjl6ilXFwE3ryV0r+JOvo+5a4EHn21qxKrqqzxSou6qZ4NUD
	DZVxW2rMRwXzxosPSM+cL16RAtVCjN0VkgyVgNnNa5FvvBxl4JaRQwHgOEt62INynIRu3xt21Jhtu
	r0/O8sWObrISF24pzG9cU/osgQglsso22UsRGVonv/5PWp0xTMK6b8uXmbCV1Z1kJTlIRRir9O3ih
	QTr1ZLwPo3TXI1sMOeHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbgNI-000449-7c; Thu, 21 May 2020 08:16:20 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbgNF-00043P-GQ
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 08:16:18 +0000
Received: by mail-wr1-x441.google.com with SMTP id l11so5807334wru.0
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 01:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=KPDqb+DCYxxpSLeq6U5D/jKybkhAzjGZ8QLA5YedgMg=;
 b=fGuo2D4qqxs0LddmHxyYtVQK3DJjuNDPbTrhoeOfUGD4FH/OI2BX/z8FrTVVetWfeL
 yxSdMCpaMuE0CT59NPSdKGWvlF/wEwwbQIo/ENQXqs6MPPqzlC/hfUJ3ybypKqgN2S5M
 o/mvlR8mPiBPU+NJuQj2pwYDEzhalaTyOIGNdYlQJhhErXNjxuG9Jr41mL5qO2wLTlAk
 8jKD8MUO2AnEnULwDQ+r5sELmzj3LIdAlcvGtV/Ye4p5M8rstCcL499Gc/SDCczcfnCn
 U27GrGfii48SZIS+mbiHKcAl19InSZu9c9q8PSO1K6Rmk6MnZfOSiC2DrSOTeJm/M082
 QFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KPDqb+DCYxxpSLeq6U5D/jKybkhAzjGZ8QLA5YedgMg=;
 b=ODFhgH3CowA/6K7xbZN8TtxwB7jxhsOuVpFMZHTxSIMw0pIs1Pkue4/JGf+jvKixSY
 joMxC9xjB0zRpe2Rqdi58aMkpY31PyCzS61iJc/V97XQpBu4cY798TBOlrcyGOnJV6JV
 vesJkZf9njfPquIzgArl7tE6px88I+QD0VcM9gqyDXnQGGF6TDeYmTNo7K37DaHs7nwI
 YFPHdBF44mOyMadCQ0gYWR+NS7tRJcdy4jw3nMsJ8+moSr8+/mB42q+2cjFMOQk6/OUH
 KldPggXl6ha5GLusud/ESq5AzruciuhF6qAnM4ZjJWX1wsYj2vujlLe1S61qeXWTn+Dy
 WX0g==
X-Gm-Message-State: AOAM532qeJURAE4ufB0bFtw/35VOK5thSh///6K2GnT6M4UJsCMyDPn1
 MjLEDde+fkYmWcQbfJcIleKVPg==
X-Google-Smtp-Source: ABdhPJxUykPWBMpDxCLK97UyXMlHnRBvfRJh1k/pbvLfDpfppBXa1QMSqiirA7kcWucM6FnWvj4LJA==
X-Received: by 2002:adf:dcc8:: with SMTP id x8mr7439168wrm.404.1590048975850; 
 Thu, 21 May 2020 01:16:15 -0700 (PDT)
Received: from dell ([95.149.164.102])
 by smtp.gmail.com with ESMTPSA id j190sm5848242wmb.33.2020.05.21.01.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 01:16:15 -0700 (PDT)
Date: Thu, 21 May 2020 09:16:12 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: [GIT PULL] Immutable branch between MFD, Power and RTC due for the
 v5.8 merge window
Message-ID: <20200521081612.GO271301@dell>
References: <1587438012-24832-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587438012-24832-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_011617_555032_8739FC2E 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, drinkcat@chromium.org,
 srv_heupstream@mediatek.com, Frank Wunderlich <frank-w@public-files.de>,
 Josef Friedl <josef.friedl@speed.at>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Sebastian Reichel <sre@kernel.org>,
 linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RW5qb3khCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDhmM2Q5ZjM1NDI4Njc0
NWM3NTEzNzRmNWYxZmNhZmVlNmIzZjMxMzY6CgogIExpbnV4IDUuNy1yYzEgKDIwMjAtMDQtMTIg
MTI6MzU6NTUgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoK
CiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2xlZS9tZmQu
Z2l0IGliLW1mZC1wb3dlci1ydGMtdjUuOAoKZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRv
IDI5ZWU0MDA5MWUyNzYxNTUzMGMwYmE3NzczYTI4NzlkODI2NjM4MWU6CgogIHJ0YzogbXQ2Mzk3
OiBBZGQgc3VwcG9ydCBmb3IgdGhlIE1lZGlhVGVrIE1UNjM1OCBSVEMgKDIwMjAtMDUtMjEgMDg6
NTU6NDggKzAxMDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCkltbXV0YWJsZSBicmFuY2ggYmV0d2VlbiBNRkQsIFBvd2Vy
IGFuZCBSVEMgZHVlIGZvciB0aGUgdjUuOCBtZXJnZSB3aW5kb3cKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSHNpbi1Ic2l1
bmcgV2FuZyAoNCk6CiAgICAgIG1mZDogbXQ2Mzk3OiBNb2RpZnkgc3VzcGVuZC9yZXN1bWUgYmVo
YXZpb3IKICAgICAgbWZkOiBtdDYzOTc6IFRyaW0gcHJvYmUgZnVuY3Rpb24gdG8gc3VwcG9ydCBk
aWZmZXJlbnQgY2hpcHMgbW9yZSBjbGVhbmx5CiAgICAgIGR0LWJpbmRpbmdzOiBtZmQ6IEFkZCBj
b21wYXRpYmxlIGZvciB0aGUgTWVkaWFUZWsgTVQ2MzU4IFBNSUMKICAgICAgbWZkOiBBZGQgc3Vw
cG9ydCBmb3IgdGhlIE1lZGlhVGVrIE1UNjM1OCBQTUlDCgpSYW4gQmkgKDEpOgogICAgICBydGM6
IG10NjM5NzogQWRkIHN1cHBvcnQgZm9yIHRoZSBNZWRpYVRlayBNVDYzNTggUlRDCgogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9tdDYzOTcudHh0IHwgIDE0ICstCiBkcml2
ZXJzL21mZC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIGRy
aXZlcnMvbWZkL210NjM1OC1pcnEuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDIzNSArKysr
KysrKysrKysrKysrKysrCiBkcml2ZXJzL21mZC9tdDYzOTctY29yZS5jICAgICAgICAgICAgICAg
ICAgICAgICAgfCAxMDEgKysrKy0tLS0KIGRyaXZlcnMvbWZkL210NjM5Ny1pcnEuYyAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAzNSArKy0KIGRyaXZlcnMvcG93ZXIvcmVzZXQvbXQ2MzIzLXBv
d2Vyb2ZmLmMgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9ydGMvcnRjLW10NjM5Ny5jICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDE4ICstCiBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNTgv
Y29yZS5oICAgICAgICAgICAgICAgICAgfCAxNTggKysrKysrKysrKysrKwogaW5jbHVkZS9saW51
eC9tZmQvbXQ2MzU4L3JlZ2lzdGVycy5oICAgICAgICAgICAgIHwgMjgyICsrKysrKysrKysrKysr
KysrKysrKysrCiBpbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvY29yZS5oICAgICAgICAgICAgICAg
ICAgfCAgIDUgKwogaW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L3J0Yy5oICAgICAgICAgICAgICAg
ICAgIHwgICA5ICstCiAxMSBmaWxlcyBjaGFuZ2VkLCA3OTkgaW5zZXJ0aW9ucygrKSwgNjIgZGVs
ZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZmQvbXQ2MzU4LWlycS5jCiBj
cmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9tZmQvbXQ2MzU4L2NvcmUuaAogY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL210NjM1OC9yZWdpc3RlcnMuaAoKLS0gCkxl
ZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
