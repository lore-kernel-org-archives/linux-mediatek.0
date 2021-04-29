Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 957C1C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 12:34:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0915613F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 12:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0915613F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lCqdwNil2uazeT3EasduOO8oeKJHx9CTxURMZ2vindg=; b=H0WKrNg/zsuqDiIZ/4j8BlPu2
	AQ5aoWb76Dby/p3D3ZOQSQDcFG/waByinWH1UJNRM8+4JAFIKFvLaI/WDoflryBXlW44WOoVXGZU7
	6oETVKi0HARoWSbrzqJBCLW9JrJtM1LUcLDAnVQEjLR9vDEWOpe21ewkGPDYfAhRfkiyVM3mPvMrI
	gv6qcyfn2/VbTvsdNKzcwbFwxHVeglGTX4z7WMdAKoJ2EGT81Y1ZAsEgXBuii/Sb8v2Ciw2CUpYsz
	yKp+xIbAU371/ct9lg1k+34JZHMT7pMBm05X6oMe0LIoXlgU8HRmDYVgzMZHg3CW83cRINsa/b5CP
	dO6cVNEeQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc5rw-005dYP-Hv; Thu, 29 Apr 2021 12:34:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc5rq-005dXl-OR; Thu, 29 Apr 2021 12:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=+fbOj539U7JlJxKx94jCmhZjY1EaeG6hVLe/OeyW9BA=; b=SurKHqAdTWOLrFvlgW1Sl1On16
 GyI4tT2UXFVoQSN5Ho/sOnuHHxR7mJiYmGoaxHRbVLZPguiN1qslxF5xMxSggsDcQMoyx8JNmImmO
 Wuzb6knjvvmRSxf3BF/n+emWaWpviDDkcPVzBVghbOCfTedq/V/I20eJ1py9olXZlvswDlzI4IU6T
 ua+8nw/LfDsKIoVVGEPj4JROI+EEkYEHsoC996mqtwR4CKZsb+/bi6UPtAaF92df5jraR+PN8uZy1
 la5TDOWWSmDUrWoqOB9UXb/aw+ILDAaOGTCEDgcIzQVPJhvqizsjllHT4H7o+f0Tz28RX5Wc1pk9K
 8H8IKtTw==;
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc5ro-000cuR-86; Thu, 29 Apr 2021 12:34:05 +0000
Received: by mail-lf1-x12a.google.com with SMTP id n138so104697763lfa.3;
 Thu, 29 Apr 2021 05:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+fbOj539U7JlJxKx94jCmhZjY1EaeG6hVLe/OeyW9BA=;
 b=pSAPQilu7n+6xTr9GdEG0tb6PJM12QM070qCxvHnWCIze3Gcr+Y1X+IbvGDtRxTUgM
 EyOOFTxf9hWQBlaRIuLofOaQebEe5v0gWxDauGIRIaLBxzQZQULJfZHJUKxGdkb10gkc
 nD1wHPGKwDBP5o9agABg3XnIArwOCYPQSKMjVhR3w59xhvXls6FFml/j10Pwe9czFo6Z
 T7faf5Qfz88VW86L60gbzCGia3II+upwMhl4urxCbGztadHzxAw5ZUEZZpuSIrEqgrti
 aMKp0DRksQp+N/9uThNAeaKzsoGRnRjp6oHq0CgRtj1ykP9X5KS4ubBguxOUwo/dtsF4
 c+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+fbOj539U7JlJxKx94jCmhZjY1EaeG6hVLe/OeyW9BA=;
 b=dupxgmEMXI9qBINlZuQkzCG0O+XsPIJR0XZ1dwyjqevNUsOb2CiF6n8NhnrIlZrbVK
 Rt/pWgK0ZPgGN5/SPRs3apub1135nuMDwZbhYQCLW8midNLJkEAnCX03U2iiEqU30nLZ
 /mGy6QlbW1tfxN1Z0BtCKyCae+dQymg+1IsyFV+j48TROgy0i0QJV2aOSzQiR5u0JW5I
 8J5om/W56pplxxBBcvVcfTgWOAi+ekf9qLgEfhcl+PMZWDovsuD2R/5RV8qOOAlgmoTZ
 niEoDgUetyfmN3mlAPxEsTKKoR2sfVblg5V4h+wOdPIXHchhJGqnqqJJCqPiKjVSc3uM
 lMGQ==
X-Gm-Message-State: AOAM533GrbHcG5LZl5yG2K45MjEkaCBQKPkhVGN1mAcFUcxg16x8ynJI
 jOwf1lQh63q7NxevYfSgizQ=
X-Google-Smtp-Source: ABdhPJxNUnx9qkfhLC3V1HtbXkiFpJiCYsEDSOon3AoeX+SG0EchdE86xX8g0E/VEPlskxpayZqx+w==
X-Received: by 2002:a19:ad41:: with SMTP id s1mr24627108lfd.306.1619699641558; 
 Thu, 29 Apr 2021 05:34:01 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-102.dynamic.spd-mgts.ru.
 [109.252.193.102])
 by smtp.googlemail.com with ESMTPSA id n7sm515001lft.65.2021.04.29.05.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 05:34:01 -0700 (PDT)
Subject: Re: [PATCH v4 00/79] Address some issues with PM runtime at media
 subsystem
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Johan Hovold <johan@kernel.org>
Cc: Shawn Tu <shawnx.tu@intel.com>, Ricardo Ribalda <ribalda@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, linuxarm@huawei.com,
 Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Leon Luo <leonl@leopardimaging.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter
 <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Shunqian Zheng <zhengsq@rock-chips.com>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devel@driverdev.osuosl.org,
 Jacopo Mondi <jacopo@jmondi.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, linux-tegra@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Wenyou Yang <wenyou.yang@microchip.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Steve Longerbeam <slongerbeam@gmail.com>, linux-media@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Benoit Parrot <bparrot@ti.com>, Helen Koike <helen.koike@collabora.com>,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, mauro.chehab@huawei.com,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
 linux-arm-kernel@lists.infradead.org, Jacob Chen <jacob-chen@iotwrt.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Hyungwoo Yang <hyungwoo.yang@intel.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Dan Scally <djrscally@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
 Shawn Guo <shawnguo@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
 <YImEMN/POW5C8lG7@hovoldconsulting.com> <20210429121215.64a7cbdb@coco.lan>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <de636a0a-3fd7-d61e-c361-fa50a6d34f17@gmail.com>
Date: Thu, 29 Apr 2021 15:33:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429121215.64a7cbdb@coco.lan>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_053404_326843_0C42D6E8 
X-CRM114-Status: GOOD (  14.86  )
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

MjkuMDQuMjAyMSAxMzoxOCwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiINC/0LjRiNC10YI6Cj4+IFRo
aXMgaXMgcGVyZmVjdGx5IGFscmlnaHQuIFRha2UgYSBsb29rIGF0IG92Nzc0MF9yZW1vdmUoKSBm
b3IgZXhhbXBsZToKPj4KPj4gCXBtX3J1bnRpbWVfZ2V0X3N5bmMoJmNsaWVudC0+ZGV2KTsKPj4g
CXBtX3J1bnRpbWVfZGlzYWJsZSgmY2xpZW50LT5kZXYpOwo+PiAJcG1fcnVudGltZV9zZXRfc3Vz
cGVuZGVkKCZjbGllbnQtPmRldik7Cj4+IAlwbV9ydW50aW1lX3B1dF9ub2lkbGUoJmNsaWVudC0+
ZGV2KTsKPj4gCQo+PiAJb3Y3NzQwX3NldF9wb3dlcihvdjc3NDAsIDApOwo+Pgo+PiBUaGVyZSdz
IGFuIGV4cGxpY2l0IHBvd2VyLW9mZiBhZnRlciBiYWxhbmNpbmcgdGhlIFBNIGNvdW50IGFuZCB0
aGlzIHdpbGwKPj4gd29yayByZWdhcmRsZXNzIG9mIHRoZSBwb3dlciBzdGF0ZSB3aGVuIGVudGVy
aW5nIHRoaXMgZnVuY3Rpb24uCj4gT2ssIGJ1dCB0aGlzIHNob3VsZCBlcXVhbGx5IHdvcms6Cj4g
Cj4gIAlwbV9ydW50aW1lX2Rpc2FibGUoJmNsaWVudC0+ZGV2KTsKPiAgCXBtX3J1bnRpbWVfc2V0
X3N1c3BlbmRlZCgmY2xpZW50LT5kZXYpOwo+ICAJCj4gIAlvdjc3NDBfc2V0X3Bvd2VyKG92Nzc0
MCwgMCk7Cj4gCj4gYXMgdGhlcmUncyBubyBhZGRpdGlvbmFsIGNsZWFudXAgbWFkZSBvbiB0aGlz
IHBhcnRpY3VsYXIgZHJpdmVyCj4gYmV0d2VlbiBwbV9ydW50aW1lX2dldF9zeW5jKCkgYW5kIHBt
X3J1bnRpbWVfcHV0X25vaWRsZSgpLgo+IAoKVGhlIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSB0dXJu
cyBoYXJkd2FyZSBPTiBieSBpbnZva2luZwpvdjc3NDBfc2V0X3Bvd2VyKG92Nzc0MCwgMSksIGFu
ZCB0aHVzLCB0aGUgT04tPk9GRiBpcyBrZXB0IGJhbGFuY2VkIGluCmJvdGggUlBNLWF2YWlsYWJs
ZSBhbmQgUlBNLXVuYXZhaWxhYmxlIGNhc2VzLiBUaGUgUlBNIHN0YXRlIG9mIGRldmljZQpzaG91
bGQgYmUgcmVzZXQgYWZ0ZXIgZHJpdmVyIHJlbW92YWwuCgpJdCBkb2Vzbid0IGxvb2sgbGlrZSBh
bnkgYWRkaXRpb25hbCBjbGVhbnVwcyBhcmUgbmVlZGVkIGJ5IHRoYXQgb3Y3NzQwCmRyaXZlci4g
VGhlIGRyaXZlciByZW1vdmFsIGlzIG9wcG9zaXRlIHRvIHRoZSBwcm9iZSwgaGVuY2UgaXQgc2hv
dWxkIGJlCmNvcnJlY3QgYXMtaXMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
