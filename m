Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E17C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 08:35:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB8A0611AB
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 08:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB8A0611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e7nAuFBozzW97kWQ7SUZV0idoBwi0VGWDhAjy5qJ3eQ=; b=FHIVAL2HjF1cHvA+Z0O8+HnSj
	h2oNqMWiQmhpoPpzZh6uCHo3qYrC1y3mfPswYm1bnSnM+EILfYHWvbRGtGXa6oy393NFzFBJSQ23f
	++W741OCl/WpDdzktsm50y9PFKrTu6war99gb7Eynno18kt4PEGw4mbfnf2lK+4onJZhM/jmwvtHJ
	+fZNkUCgBBZ5nRITKJwKxmnx0UoQWX4gc2YRyHSk3wyO8ysoZ3LqF9Bn06zu8UBKAKfFuYjzsvHIt
	r/oCIdfB69NZkebru8ejJ44E6mul5WykeCzCHfO4FJv/hSz5wML3y06Lkz3cCWsSodo53TmUBeE70
	uL69o4QLg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUmbO-000462-8Q; Fri, 09 Apr 2021 08:34:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUmbL-0003sZ-EM
 for linux-mediatek@desiato.infradead.org; Fri, 09 Apr 2021 08:34:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=KwLBWMBZRdz46SUCvmDH9Z5zZXCHk+G/HINFfQ17P4M=; b=oy/Hu832TzBFcLG9DYLf78ZAyT
 P0mSrTApfeCsm1SQmVBVY22QpAUl99vC+KHnApId13ahpVSglgDy0XKNocxjocDi3+AFMtCG9q6OG
 hUzDmu0iRK8gNDqg1G9nRvCDH8lR4lzjmijnuRLZdgZkQt7RJz4+WKZDaIO4SrTE5lB4AxWRGLYce
 Gp1JKoQTABNXlcFft3VeSWgd3EGferhZs8Qhj/NtVUmzMhOeFTul3IGKXDzGYyUthkDhn4wH3Kbl6
 TIlul+mHLhf9wCHOA9PUcKY4M41qcHsbxRRTSNqXsxzDvK2SbkHbGm5Psz51mH4Ip/r8qrcwlh+iU
 5fYVRTog==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUmDQ-0001nu-QS
 for linux-mediatek@lists.infradead.org; Fri, 09 Apr 2021 08:10:24 +0000
Received: by mail-wr1-x42b.google.com with SMTP id e12so4681931wro.11
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Apr 2021 01:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KwLBWMBZRdz46SUCvmDH9Z5zZXCHk+G/HINFfQ17P4M=;
 b=hNhtj/aNpiqdIzZxP30CSRrlHSEJ+O8XRNC6jWPo79WZV4eucvGfZoZkKIdlEF6Khu
 N+SQeipigjG2DjlfUvoxpdaaHARK2jibT3Ojl+9fBLq90YpUiKiJZAFS1RkH4ZC07h/u
 p+WxjHZXM1FPv+9AWnAjECvuHh4dW66akPp3V7i2jJAzYNGjBOq8m91JKig8nHsDClHA
 wDszXITwkUa3he/ggRpNIGHI0P/qgrs0BYF4MpTe3Zf3zHBbK0XaSzRZw0rM1XdDtJmW
 MPsTCb833ukTW1aPV15PJuTaQOEw00OlZeSqY3JBQ3ltR1bsHn5hpL+mZzdfzF3fyw65
 Ebfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KwLBWMBZRdz46SUCvmDH9Z5zZXCHk+G/HINFfQ17P4M=;
 b=BHsRZe5CoSwd0s6vIaSlGDxzTUiFx0/KdJ89cNJPzpiU5fKPrTKEkW4wUddDUHPEuQ
 Wsv4xaBjTWZ/7hpbamfjw8mKMdGUqsDO0o26x5JncnxObO/7uU5JlD+pdfnHPTl82q15
 gFuJkszVgvJGPuIoCjh10QUAGdV7iBHbSXbfHRGn+feDxmAmsgc9akiZY8NR6qby4FEZ
 ggHGu8jc27A5287BLL7UzrdB9StOK5vDWy2ub2BCEAauzOIELOiBrHxCWVyZy/ehoqfl
 fyqZJsc4AMTKKdbVxn0A+xWN6xcU9gSJSk1FMHTDMVVlbaQvoGjefDOc00HEnL/jt9pT
 BryA==
X-Gm-Message-State: AOAM530qxqxEmjYfjf9cQop8w1VD7eJrAqzamca8gGic7PJnIJYdR07m
 fPp+jRonsSzGIxY30yJXFhC2CEk9Ijo9m2jX
X-Google-Smtp-Source: ABdhPJy4XQCBVWHdPm5wWRMqkGkFiEZh0CiXWdXcPLlAZvt02L7wI+v/m2X3FQwQNaQuzsiZpcriMA==
X-Received: by 2002:adf:dc4f:: with SMTP id m15mr16484222wrj.420.1617955801641; 
 Fri, 09 Apr 2021 01:10:01 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:5d29:55c:ba8e:9bff?
 ([2a01:e34:ed2f:f020:5d29:55c:ba8e:9bff])
 by smtp.googlemail.com with ESMTPSA id u9sm2677419wmc.38.2021.04.09.01.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 01:10:00 -0700 (PDT)
Subject: Re: [v7,1/3] arm64: dts: mt8183: add thermal zone node
To: Michael Kao <michael.kao@mediatek.com>, fan.chen@mediatek.com,
 Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
 srv_heupstream@mediatek.com
Cc: Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20210316070144.28440-1-michael.kao@mediatek.com>
 <20210316070144.28440-2-michael.kao@mediatek.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <f7003979-0210-882e-bb28-f24047e18061@linaro.org>
Date: Fri, 9 Apr 2021 10:09:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210316070144.28440-2-michael.kao@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_091012_601979_C4CD1036 
X-CRM114-Status: GOOD (  18.01  )
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

T24gMTYvMDMvMjAyMSAwODowMSwgTWljaGFlbCBLYW8gd3JvdGU6Cj4gRnJvbTogIm1pY2hhZWwu
a2FvIiA8bWljaGFlbC5rYW9AbWVkaWF0ZWsuY29tPgo+IAo+IEFkZCB0aGVybWFsIHpvbmUgbm9k
ZSB0byBNZWRpYXRlayBNVDgxODMgZHRzIGZpbGUuCj4gCj4gRXZhbHVhdGUgdGhlIHRoZXJtYWwg
em9uZSBldmVyeSA1MDBtcyB3aGlsZSBub3QgY29vbGluZwo+IGFuZCBldmVyeSAxMDBtcyB3aGVu
IHBhc3NpdmUgY29vbGluZyBpcyBwZXJmb3JtZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhp
YXMgS2FlaGxja2UgPG1rYUBjaHJvbWl1bS5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBL
YW8gPG1pY2hhZWwua2FvQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxODMuZHRzaSB8IDg1ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgODUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxODMuZHRzaQo+IGluZGV4IDViNzgyYTQ3NjllNy4uZDM1NTBhZjA2NDA4IDEw
MDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kKPiAr
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpCj4gQEAgLTY1Nyw2
ICs2NTcsODcgQEAKPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPiAgCQl9Owo+ICAKPiArCQl0
aGVybWFsOiB0aGVybWFsQDExMDBiMDAwIHsKPiArCQkJI3RoZXJtYWwtc2Vuc29yLWNlbGxzID0g
PDE+Owo+ICsJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My10aGVybWFsIjsKPiArCQkJ
cmVnID0gPDAgMHgxMTAwYjAwMCAwIDB4MTAwMD47Cj4gKwkJCWNsb2NrcyA9IDwmaW5mcmFjZmcg
Q0xLX0lORlJBX1RIRVJNPiwKPiArCQkJCSA8JmluZnJhY2ZnIENMS19JTkZSQV9BVVhBREM+Owo+
ICsJCQljbG9jay1uYW1lcyA9ICJ0aGVybSIsICJhdXhhZGMiOwo+ICsJCQlyZXNldHMgPSA8Jmlu
ZnJhY2ZnICBNVDgxODNfSU5GUkFDRkdfQU9fVEhFUk1fU1dfUlNUPjsKPiArCQkJaW50ZXJydXB0
cyA9IDwwIDc2IElSUV9UWVBFX0xFVkVMX0xPVz47Cj4gKwkJCW1lZGlhdGVrLGF1eGFkYyA9IDwm
YXV4YWRjPjsKPiArCQkJbWVkaWF0ZWssYXBtaXhlZHN5cyA9IDwmYXBtaXhlZHN5cz47Cj4gKwkJ
CW52bWVtLWNlbGxzID0gPCZ0aGVybWFsX2NhbGlicmF0aW9uPjsKPiArCQkJbnZtZW0tY2VsbC1u
YW1lcyA9ICJjYWxpYnJhdGlvbi1kYXRhIjsKPiArCQl9Owo+ICsKPiArCQl0aGVybWFsLXpvbmVz
IHsKPiArCQkJY3B1X3RoZXJtYWw6IGNwdV90aGVybWFsIHsKPiArCQkJCXBvbGxpbmctZGVsYXkt
cGFzc2l2ZSA9IDwxMDA+Owo+ICsJCQkJcG9sbGluZy1kZWxheSA9IDw1MDA+Owo+ICsJCQkJdGhl
cm1hbC1zZW5zb3JzID0gPCZ0aGVybWFsIDA+Owo+ICsJCQkJc3VzdGFpbmFibGUtcG93ZXIgPSA8
NTAwMD47Cj4gKwkJCX07Cj4gKwo+ICsJCQkvKiBUaGUgdHp0czEgfiB0enRzNiBkb24ndCBuZWVk
IHRvIHBvbGxpbmcgKi8KPiArCQkJLyogVGhlIHR6dHMxIH4gdHp0czYgZG9uJ3QgbmVlZCB0byB0
aGVybWFsIHRocm90dGxlICovCj4gKwo+ICsJCQl0enRzMTogdHp0czEgewo+ICsJCQkJcG9sbGlu
Zy1kZWxheS1wYXNzaXZlID0gPDA+Owo+ICsJCQkJcG9sbGluZy1kZWxheSA9IDwwPjsKPiArCQkJ
CXRoZXJtYWwtc2Vuc29ycyA9IDwmdGhlcm1hbCAxPjsKPiArCQkJCXN1c3RhaW5hYmxlLXBvd2Vy
ID0gPDUwMDA+Owo+ICsJCQkJdHJpcHMge307Cj4gKwkJCQljb29saW5nLW1hcHMge307Cj4gKwkJ
CX07CgpXaGF0IGlzIHRoZSBwb2ludCBvZiBkZWZpbmluZyB0aGUgc3VzdGFpbmFibGUgcG93ZXIg
d2l0aCBubyBjb29saW5nCmRldmljZSBhc3NvY2lhdGVkID8KCgoKLS0gCjxodHRwOi8vd3d3Lmxp
bmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNv
Q3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJv
PiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwK
PGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
