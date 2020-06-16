Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72210C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 13:18:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 429CD20FC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 13:18:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nx/EbEzS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VTqbi7Ag"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 429CD20FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRP2ILuaA0AvhfK5gJ0dhYDIK4oKOY9mUXF1Iv1kbLo=; b=nx/EbEzSmrXDPU
	+dSJRvPPQ5hwwYQrg5HPlERJg19de+f+aVnrWs2Pq4mUI+Qr4XJxCa9jqBgJpRyu9OO8GETX7VPmz
	UYlbSocyLDnzZgA3sMQ/KJpO0Td2M7inXZKB+Eqp9G/IzsqUYtNnP6NNs+0PiFlMq4OlCzKA2d+xq
	3BjnXikypN0yeKjbkqAeKcrV3r54k57mc2IvRwLj6wSJ3ILwhJitW8M8T34OnS6IYvBZ7CqAgPBRy
	FIYCa66mwwBXwwF0pxBAn4J5RZ/OX6YWQrhuZU9YFZ63s53U/4+1Q0c8Tml1EECpwWUFWNzycv9F5
	RKik52MPH2Yu1eqgNojA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlBTl-0003Vj-EZ; Tue, 16 Jun 2020 13:18:17 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlBTj-0003Uz-1W
 for linux-mediatek@lists.infradead.org; Tue, 16 Jun 2020 13:18:16 +0000
Received: by mail-wr1-x441.google.com with SMTP id p5so20715671wrw.9
 for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2020 06:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ze0kyZ29y+iARyCZx88V33Mi0dNrmrq4icVH7Auu/rY=;
 b=VTqbi7AgunRcG+Rhou6MsFpBPw37VdaO1Z5DHr86KTYHz/+QoM+/Z4dtJg4mE1WP8x
 oxVDKAwoZE8hafGZnNu/7K6lOsnqBcddM++8NGwSboB6CbNMJQSplGWwXnE+a0Z9hOVX
 ZZRqyh5R2a8cCTouoCGXGYy26/UpuFEYpYGpPMYmLFEntOu814hWWVlpxhGC5QhOo/8q
 afdxO0Jd1AfdDqMxYQM5qiby4xeKVEjxze7THZg1YjN5SZ5Ea1KaRo2rZ8dq3ze9NJHL
 pVG3JVU0oQ5h4WRvJ/RpAiprCC4SybB3tmWIMWjeukItMxYrcI6aNCe+Cu6BzXzzjfeW
 oFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ze0kyZ29y+iARyCZx88V33Mi0dNrmrq4icVH7Auu/rY=;
 b=FBJeitz67pDsBPRfC6UWGJXujRmloDhJkkF9ofJcpB5CQHOT9/UmOUw8e48HQErgzq
 SM2fP6EHVawhxt/G37M9r2B7M9IZjKUUBmGbticiGwfszJcYE48mk297ZvJUoDScR8M8
 MWTQZ6g/wG3ulQnZxvW4kOfCq5sjsajp3Fw7IEc0K2BWlIXXL2iPNow8hjWfLqTD86Wv
 MfouvJhy5ao33kROLGlg8p1bX8kJSxTlPRcq95wX7DSgTZ9YtKORuIrgfy3fo++KsTjU
 X+ovTCmuNTkrWhgz+Pn1DQAnF+Aa4Nx4VugcNTRCRb2Q0JS4tC0pZwW/H50dD096L8I+
 r4+A==
X-Gm-Message-State: AOAM531RaBzJD/DZgsVQCWoJDhUKCarj91bOk+a9botLeC3i85uWLfYf
 ihjTyVppMzpqhtx66uEsf75FUQ==
X-Google-Smtp-Source: ABdhPJxqpKqsKZ/O9m5u2HJ1sllXpsbw+K74UxHuOlR2UOWeLkd2rY5NgIlELrm7Vqn3XEPpgKRt5w==
X-Received: by 2002:adf:f0d2:: with SMTP id x18mr3022162wro.250.1592313493614; 
 Tue, 16 Jun 2020 06:18:13 -0700 (PDT)
Received: from dell ([109.180.115.156])
 by smtp.gmail.com with ESMTPSA id l1sm32956809wrb.31.2020.06.16.06.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 06:18:13 -0700 (PDT)
Date: Tue, 16 Jun 2020 14:18:11 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Wen Su <Wen.Su@mediatek.com>
Subject: Re: [RESEND v2 2/4] mfd: Add for PMIC MT6359 registers definition
Message-ID: <20200616131811.GR2608702@dell>
References: <1582252746-8149-1-git-send-email-Wen.Su@mediatek.com>
 <1582252746-8149-3-git-send-email-Wen.Su@mediatek.com>
 <1592301485.30613.7.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592301485.30613.7.camel@mtkswgap22>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_061815_083902_60A7EE67 
X-CRM114-Status: GOOD (  13.11  )
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxNiBKdW4gMjAyMCwgV2VuIFN1IHdyb3RlOgoKPiBEZWFyIFJldmlld2VycywgCj4g
Cj4gSSBhbSBzb3JyeSB0byBib3RoZXIgeW91LiBIb3cgc2hvdWxkIEkgcHJvY2VlZCBmb3IgdGhp
cyBwYXRjaCBzZXQgPwo+IFNpbmNlIHRoZSByZWd1bGF0b3IgZHJpdmVyIHdlcmUgYXBwbGllZCBh
bmQgZHJvcHBlZCBiZWNhdXNlIG9mIHRoZSBNRkQKPiBoZWFkZXIgZmlsZSBkZXBlbmRlbmN5IG9u
IHRoaXMgcGF0Y2guCj4gCj4gV2lsbCB0aGlzIG1mZCByZWdpc3RlcnMgZGVmaW5pdGlvbiBwYXRj
aCBhbmQgcmVndWxhdG9yIGRyaXZlciBwYXRjaCBiZQo+IGFwcGxpZWQgPyBQbGVhc2UgYWR2aWNl
LgoKT25jZSB5b3UgaGF2ZSBhbGwgb2YgeW91ciBBY2tzLCBpdCBzaG91bGQgYmUgYXBwbGllZCBh
cyBhIHNldC4KCkJlc3QgdGhpbmcgeW91IGNhbiBkbyBpcyBzdWJtaXQgYSBbUkVTRU5EXS4KCj4g
T24gRnJpLCAyMDIwLTAyLTIxIGF0IDEwOjM5ICswODAwLCBXZW4gU3Ugd3JvdGU6Cj4gPiBGcm9t
OiAiV2VuIFN1IiA8d2VuLnN1QG1lZGlhdGVrLmNvbT4KPiA+IAo+ID4gVGhpcyBhZGRzIE1lZGlh
VGVrIFBNSUMgTVQ2MzU5IHJlZ2lzdGVycyBkZWZpbml0aW9uIGZvciB0aGUKPiA+IGZvbGxvd2lu
ZyBzdWIgbW9kdWxlczoKPiA+IAo+ID4gLSBSZWd1bGF0b3IKPiA+IC0gUlRDCj4gPiAtIEludGVy
cnVwdAo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZW4gU3UgPHdlbi5zdUBtZWRpYXRlay5jb20+
Cj4gPiBBY2tlZC1mb3ItTUZELWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+
ID4gLS0tCj4gPiAgaW5jbHVkZS9saW51eC9tZmQvbXQ2MzU5L3JlZ2lzdGVycy5oIHwgNTMxICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUz
MSBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZk
L210NjM1OS9yZWdpc3RlcnMuaAoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVj
aG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3Vy
Y2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRl
ciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
