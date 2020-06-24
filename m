Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FA3C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 16:22:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E67DB20823
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 16:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kwJMwfUX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="GDbX4i4/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E67DB20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PP7y7o+RBwuzSz2MESQeEk5bh7hK7ttjDDYKWpTfRr8=; b=kwJMwfUXyoxdZItWggatjSbzF
	7q+CxUCm1qrupFbRwikFQbAsRToQOrdLfqKqJDzM8EFlS81B0syYaHiVNwDtxsBSpqQ2jYH7UM1xT
	WxlBLWdO8YVEFPS9DUOpwQE4NpONtWl6ZkG9i8uG4IWKL0FxqOeLoy1v2KJqyz/UhvPdTkoVjm8Nu
	4cL6ubvsp6jcLJQoBnEBvl5IprwPmKYqCCIFBMsu4aCQb60umAs+jwFsQldlllxiLn67HS9DmUcck
	pZcJ8ZWLXBoFz8u8NcFOVZtBhTkOBmTtmPR5u/3uM2z/v8lkB80DU9Hn4MSi4/0l9OusIsieK9oC4
	yR+Aet0Mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo8AK-0005op-Gv; Wed, 24 Jun 2020 16:22:24 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo8AG-0005mQ-Q2
 for linux-mediatek@lists.infradead.org; Wed, 24 Jun 2020 16:22:22 +0000
Received: by mail-il1-x141.google.com with SMTP id c75so2595079ila.8
 for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2020 09:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=STD7qLvWtpSzAtO1gXjXJztLXOvVuvn065ZWjIwBzm8=;
 b=GDbX4i4/9sFa2QnOyFKV3sAmgpvbd4H9sf69kAM0V93uCHV4aw7EViw8WQGFnmGhGL
 RCC+okJfghc3Wz2bz8HZeO7YwxG7/oL/0OfQHSSw8KaxqyDX+3pN+o3xIH3aODH5BQjK
 vTgBiV68m+YydOFw1YZbI/IzAxH09eBSYoeOnD2WwMhuNy5dRivxMDq8sxhdaJcPIFVE
 xpNn8lwne15R7K3Ux72CJTplglE9cuR4bjD2TZvXf3CiAqo230jAdvO8oHmtF2Psgl2p
 YadWLDh4Bl411uJHkly3hQX/7NFaklwQk0TAShizwVTPmjXzGeqZOsMfxFNXOJwnROdt
 D35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=STD7qLvWtpSzAtO1gXjXJztLXOvVuvn065ZWjIwBzm8=;
 b=r5dqeOtqxK7OZJFbXjA8XflIkmX+mA10U0R9DqRRsJJHwXqsE1hSs1J2wFOjCMcg7g
 AERNSg0YxIUAIlUR+YfLAi1qFURaqJCZm9+FKe401rDslvxXrZPMxXynMV5S5tafzB3J
 D/59c+acRVa+gaAP7LXoVfWHlsbTRJ3Z1A5Nq2b4Yhl174w8kBD6CP21EVrgqmWmp69m
 M55v5BtO4JHCyXB6iNHeeCORJq9jFSuvsaGU47sgfd040Rk9LxW0ePTb7I4iwNrnw44G
 LKid6Wl9n5fq8mcd2khJ7y3b4b8sCb7CUDGL7SXg8zZEH3xH5yj5PRXZdPq0u5Dq5uMS
 pn4A==
X-Gm-Message-State: AOAM532yLopbBFjILzWMS34dn5lhWFqfMsb74ttwOXd/6v+TCM9SGMbS
 BPWNiNtgr2coRYetvZrM3A0U5PV8H4ngH5gCieFPzA==
X-Google-Smtp-Source: ABdhPJyCu6OdPyGuzSe1OJNhDF0LoYbiaX834HuGofRmFkCh2g6eAXaOlNsVAMtygwLHq1VOlmz7okN+XaK4lvMSMqk=
X-Received: by 2002:a92:c509:: with SMTP id r9mr28062372ilg.189.1593015739191; 
 Wed, 24 Jun 2020 09:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200622093744.13685-1-brgl@bgdev.pl>
 <20200622093744.13685-6-brgl@bgdev.pl>
 <1da91144-076d-bf1e-f12a-2b4fe242febc@gmail.com>
In-Reply-To: <1da91144-076d-bf1e-f12a-2b4fe242febc@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Jun 2020 18:22:08 +0200
Message-ID: <CAMRc=MeCTNuwY4-h=OhVVT1RHWYfi-VwEZMvm0RNrS_qNu_EPw@mail.gmail.com>
Subject: Re: [PATCH 05/15] net: phy: reset the PHY even if probe() is not
 implemented
To: Florian Fainelli <f.fainelli@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 devicetree <devicetree@vger.kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Frank Rowand <frowand.list@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Salil Mehta <salil.mehta@huawei.com>, netdev <netdev@vger.kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Pedro Tsai <pedro.tsai@mediatek.com>, "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

d3QuLCAyMyBjemUgMjAyMCBvIDIxOjE0IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21h
aWwuY29tPiBuYXBpc2HFgihhKToKPgo+IE9uIDYvMjIvMjAgMjozNyBBTSwgQmFydG9zeiBHb2xh
c3pld3NraSB3cm90ZToKPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3Nr
aUBiYXlsaWJyZS5jb20+Cj4gPgo+ID4gQ3VycmVudGx5IHdlIG9ubHkgY2FsbCBwaHlfZGV2aWNl
X3Jlc2V0KCkgaWYgdGhlIFBIWSBkcml2ZXIgaW1wbGVtZW50cwo+ID4gdGhlIHByb2JlKCkgY2Fs
bGJhY2suIFRoaXMgaXMgbm90IG1hbmRhdG9yeSBhbmQgbWFueSBkcml2ZXJzIChlLmcuCj4gPiBy
ZWFsdGVrKSBkb24ndCBuZWVkIHByb2JlKCkgZm9yIG1vc3QgZGV2aWNlcyBidXQgc3RpbGwgY2Fu
IGhhdmUgcmVzZXQKPiA+IEdQSU9zIGRlZmluZWQuIFRoZXJlJ3Mgbm8gcmVhc29uIHRvIGRlcGVu
ZCBvbiB0aGUgcHJlc2VuY2Ugb2YgcHJvYmUoKQo+ID4gaGVyZSBzbyBwdWxsIHRoZSByZXNldCBj
b2RlIG91dCBvZiB0aGUgaWYgY2xhdXNlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3og
R29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4KPiBPSywgYnV0IG5vdyBs
ZXQncyBpbWFnaW5lIHRoYXQgYSBQSFkgZGV2aWNlIGhhcyB0d28gb3IgbW9yZSByZXNldCBsaW5l
cywKPiBvbmUgb2YgdGhlbSBpcyBnb2luZyB0byBiZSBtYW5hZ2VkIGJ5IHRoZSBjb3JlIFBIWSBs
aWJyYXJ5IGFuZCB0aGUgcmVzdAo+IGlzIGdvaW5nIHRvIGJlIHVuZGVyIHRoZSByZXNwb25zaWJp
bGl0eSBvZiB0aGUgUEhZIGRyaXZlciwgdGhhdCBkb2VzIG5vdAo+IHNvdW5kIGludHVpdGl2ZSBv
ciBjb252ZW5pZW50IGF0IGFsbC4gVGhpcyBpcyBhIGh5cG90aGV0aWNhbCBjYXNlLCBidXQKPiBp
dCBjb3VsZCBjb25jZWl2YWJsZSBoYXBwZW4sIHNvIGhvdyBhYm91dCBhZGRpbmcgYSBmbGFnIHRv
IHRoZSBkcml2ZXIKPiB0aGF0IHNheXMgImxldCBtZSBtYW5hZ2UgaXQgYSBhbGwiPwoKVGhpcyBz
b3VuZHMgZ29vZCBhcyBhIG5ldyBmZWF0dXJlIGlkZWEgYnV0IGRvZXNuJ3Qgc2VlbSB0byBiZSBy
ZWxhdGVkCnRvIHdoYXQgdGhpcyBwYXRjaCBpcyB0cnlpbmcgdG8gZG8uIFRoZSBvbmx5IHRoaW5n
IGl0IGRvZXMgaXMgaW1wcm92ZQp0aGUgY3VycmVudCBiZWhhdmlvci4gSSdsbCBub3RlIHlvdXIg
cG9pbnQgZm9yIHRoZSBmdXR1cmUgd29yayBvbiB0aGUKcHJlLXByb2JlIHN0YWdlLgoKQmFydG9z
egoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
