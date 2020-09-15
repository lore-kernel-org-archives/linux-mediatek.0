Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289C0C43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 01:03:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6F2E212CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 01:03:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UWeMUPuK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ0tAo4L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6F2E212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sRXMxDKX1HFk/eYQfOPP9FtDvd+EQj9IFDdUhn20Kmg=; b=UWeMUPuKg8zGTEWthm74pBQPH
	30GnQ9nLfRwhq+PdoU735h6gClCz4ikAm/3ohYoOvslB28tvuTipFtd+J32Z9Ai+TR/T3ZKSnJI0r
	18PPNYYoe1Z9CPoBqXgZEIZWkAPuxdkbcFgNSSX6wFOjHhULeCPXylEd1oFDeYivG8c0ouNCfcJnk
	d1p7dBGLZ3WHXNbOjLdUQczJ/y8ikYws4ZTRtDOxqJ7dtUFqrHNiL5n9gWpAPz1/tO024v4HQPj3k
	KUfYGFuYNWyUIJ0BMevU4mGaL2JrH38WDb2v9e65y01hm6ivlnUs0PVVn9FDO4McMvKXnb3Fndh1n
	zR4jRF31A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHzNf-00016w-Gz; Tue, 15 Sep 2020 01:03:35 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHzNa-00016G-VH; Tue, 15 Sep 2020 01:03:31 +0000
Received: by mail-lj1-x243.google.com with SMTP id r24so1302246ljm.3;
 Mon, 14 Sep 2020 18:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E1q14rQlgrSLatoty0jVapm3PrkVuxqei5oD9yAnTYA=;
 b=TQ0tAo4Lk8BmjNMpUM7B2v2eJgGqHIHTW2E4/JxHYLBPYEbL2GOEXa3hYcB88YPV+D
 rsXL6SY9r8ASAgE8jpvkJDHh7GmJRqXRkxR6+qr8+tk9bxXzavjg3CwjSUtf9LgQObtW
 Z+EHPWbFuFvC2eCxhz4QYvrSwCiSTExOiHWEXRxGeQE6M2sHxISOTWmc4reYPsdTqqTf
 FdUJ/4a9+XPrM3y0O/QWI4f2oR7SR4EtfK7OXk6DnUduKU/fV/k6zykUVgrBbLdSMGcs
 OguZcbCFAGKIoxi3jOmgPotq4ZsnC5XQS4jk6GvHyMXC+pkQkfjwBclCIyq+G4XyQTD1
 eiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E1q14rQlgrSLatoty0jVapm3PrkVuxqei5oD9yAnTYA=;
 b=PvqYuN8+828jvPqeRhQk6kVHtoX8+dT/Z/T2e4a4tgOEZG3yiMPAup4NZgM77I+Ro3
 dpsstEQ5Qr0hgjYN/1KoDBvuSLdN2/GHBAirjoVm48qGRPi7079NjqzKBtvrBvDbNmf/
 qdgcl8H+lZphWn27Y8zaxLastDV4PYVOE7u1HcT3gi6zLWbdPVv80USiaqyP986RGH4x
 L5ipj4D896qbqIHMvBSP5JBfUi8lUyt9bdkC81qleal/RHobgz+jcL5aNdWeTUyINKVK
 kFqRXSArZ3B/C/UsJyUZxkXE8wM+rFC+9S4sfu0anGobz6ADPR/34EdVJ4EiOD/iGea7
 bJbw==
X-Gm-Message-State: AOAM532vrR2uO/7oFglFFSXr4pUXh3sOUdGCclhmtIOq73lslTGQy7UE
 D4lMQMsWVx0CNVgtrp8kD6K7w9edqKvbGXW+lQE=
X-Google-Smtp-Source: ABdhPJw9ifkbVP+uEe2SD7R2hIj95UXfSck4Zwdz+D0V/9bCy7pHGJ86/66K1wgr6YE3PVf6c5+qVxJJUbQVva9yrXk=
X-Received: by 2002:a2e:9955:: with SMTP id r21mr1824267ljj.119.1600131807796; 
 Mon, 14 Sep 2020 18:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <1598928042-22115-1-git-send-email-u0084500@gmail.com>
 <1598928042-22115-2-git-send-email-u0084500@gmail.com>
 <20200914182916.GA4193162@bogus>
In-Reply-To: <20200914182916.GA4193162@bogus>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Tue, 15 Sep 2020 09:03:15 +0800
Message-ID: <CADiBU3-Rn9wPNh_17U9yiDmhHSRcxb5L3nqtg+qigbmiYBjrbA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_210331_031364_1C2E79D1 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang <cy_huang@richtek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQ55pyIMTXml6Ug6YCx5LqM
IOS4iuWNiDI6Mjnlr6vpgZPvvJoKPgo+IE9uIFR1ZSwgMDEgU2VwIDIwMjAgMTA6NDA6NDIgKzA4
MDAsIGN5X2h1YW5nIHdyb3RlOgo+ID4gRnJvbTogQ2hpWXVhbiBIdWFuZyA8Y3lfaHVhbmdAcmlj
aHRlay5jb20+Cj4gPgo+ID4gQWRkIGEgZGV2aWNldHJlZSBiaW5kaW5nIGRvY3VtZW50YXRpb24g
Zm9yIHRoZSBNVDYzNjAgVHlwZS1DIGRyaXZlci4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGlZ
dWFuIEh1YW5nIDxjeV9odWFuZ0ByaWNodGVrLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9iaW5kaW5n
cy91c2IvbWVkaWF0ZWssbXQ2MzYwLXRjcGMueWFtbCAgICAgICAgIHwgOTUgKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbWVk
aWF0ZWssbXQ2MzYwLXRjcGMueWFtbAo+ID4KPgo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPgpUaHguCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
