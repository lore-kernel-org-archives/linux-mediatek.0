Return-Path: <SRS0=2/VK=DO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E1CC4363D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 00:02:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C50B02054F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 00:02:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="swaopywM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zGOcAx3i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C50B02054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mr3W7gGIgIRquf8mOw+kDZCMmwUUxfaPrOLkGFoy8Tw=; b=swaopywM6J41M36K8Vupn345w
	8wRkL1JjX5V6UyeOmXMFrLGOwfl3uu8M3bOBOfgUM/NFaVPtgYkp4bLAlieokxoLSCYo5oqvlhtq3
	RJwLLhtxPm/MFwZI9SIDVVU+/M3W2uxVuGnxbXnmPJx6TVnD8+hGnOBN8k3IozkdB3UpM1WjUbjWu
	6/aD6xIn1V25ITLgHvQ0cD8MhruySoq53krHc0UyNc0DrZBptkQwpRQ+LN5WZK3G1zNqYL9Z1zsEL
	ebdWHMFTiExLLlCiL7xYL8WpNjxjNDf3ULoJGy334HjAlOL+Al9qzhqK6kl4XLs0Bor4OVsyGa27J
	5tGxbxwuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPwuh-0001Eg-S9; Wed, 07 Oct 2020 00:02:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPwuc-0001D5-Vm; Wed, 07 Oct 2020 00:02:31 +0000
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3E7820739;
 Wed,  7 Oct 2020 00:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602028950;
 bh=tFASekccPs0uwtl2alfNzpZUiMaOcFfZ7JluNg7mEA0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zGOcAx3ib718MRD2RusoZpw7CLWDysskCpjbMp/zPQMDTANZ9ugFs8eixKxbeHFpr
 mYlTcDyp19X+py+ph+AiO1aiw9ZXnJ4L2yQlVz/5V5D2U0lwO627vw2WYIX5d3Z6Hv
 xcpov2M8GpwsEiPrqkMlJHSk1Kz9FfPwKKaUOlOU=
Received: by mail-ej1-f53.google.com with SMTP id e22so395036ejr.4;
 Tue, 06 Oct 2020 17:02:29 -0700 (PDT)
X-Gm-Message-State: AOAM530RtAlSg0FwDeyoRR6gvm4vME3hP9xLwuuDIomEeNCq2BisCuas
 3OHZArWjom0dg+aGAWWLVTGE8FPGQcCw+GCOlA==
X-Google-Smtp-Source: ABdhPJzI0UQRn161pSh9DvK7aC7kX0LiTZEqKOHL2UdsgF9XLDlxe42OFso0BYlFjTvNoWRyaboTRlzMmZrRdV7tVV0=
X-Received: by 2002:a17:906:3716:: with SMTP id
 d22mr538107ejc.267.1602028948530; 
 Tue, 06 Oct 2020 17:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
 <20201006193320.405529-5-enric.balletbo@collabora.com>
In-Reply-To: <20201006193320.405529-5-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 7 Oct 2020 08:02:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8R=aOx4y6=fenA_hpm4A6-zqiiyrM_S3G3AZHLzUppoA@mail.gmail.com>
Message-ID: <CAAOTY_8R=aOx4y6=fenA_hpm4A6-zqiiyrM_S3G3AZHLzUppoA@mail.gmail.com>
Subject: Re: [PATCH 4/4] soc: mediatek: mmsys: Use an array for setting the
 routing registers
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_200231_092704_500AEE40 
X-CRM114-Status: GOOD (  11.99  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4g5pa8
IDIwMjDlubQxMOaciDfml6Ug6YCx5LiJIOS4iuWNiDM6MzPlr6vpgZPvvJoKPgo+IEZyb206IENL
IEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4KPiBBY3R1YWxseSwgc2V0dGluZyB0aGUgcmVnaXN0
ZXJzIGZvciByb3V0aW5nLCB1c2UgbXVsdGlwbGUgJ2lmLWVsc2UnIGZvciBkaWZmZXJlbnQKPiBy
b3V0ZXMsIGJ1dCB0aGlzIGNvZGUgd291bGQgYmUgbW9yZSBhbmQgbW9yZSBjb21wbGljYXRlZCB3
aGlsZSB3ZQo+IHN1cHBvcnQgbW9yZSBhbmQgbW9yZSBTb0NzLiBDaGFuZ2UgdGhhdCBhbmQgdXNl
IGEgdGFibGUgcGVyIFNvQyBzbyB0aGUKPiBjb2RlIHdpbGwgYmUgbW9yZSBwb3J0YWJsZSBhbmQg
Y2xlYXIuCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5v
cmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJv
cmEuY29tPgo+IC0tLQo+Cj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jIHwgMzkz
ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIxMCBp
bnNlcnRpb25zKCspLCAxODMgZGVsZXRpb25zKC0pCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
