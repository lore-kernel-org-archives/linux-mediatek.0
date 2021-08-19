Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 147FAC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:15:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB2ED60E93
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB2ED60E93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaNCs8YJPWXBZVbOUz82t8XQp3PEklRqhg/w0nmuJfQ=; b=jU6Un6wZyY2bna
	qsEVn0HP1nEAT1zWI9zM3YcQtNGbOZ/v3L0OwBWOSwd4QWcCiwW9NTZ8zUmQpvERXlStljK0z9kbi
	d0nj8UXDy0oG9LTZW1GkO80a6QljBGPHw5niUPoc5qi9MKP+a6Smr/ncNbPxkif9QUC8WgBGbKTTs
	P0+hYSL3gusRjlka1/gKTqTlwOyZ8q8728mi4glMQjITOcobCc/nwYj33wXw0QQjwSGBgyxeSOifP
	GwAB2c47XZeEjLMB4DsiI/qhjNYUuqMyAkPLW5Ppsbv47B0q/gQdtvmw7iHUelm45tQ5g5+LpJ/Ui
	2tALfTSVoJgQu63zjlDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGjl4-008lhm-CE; Thu, 19 Aug 2021 15:15:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGjkP-008lKW-1z; Thu, 19 Aug 2021 15:14:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6DE6460E76;
 Thu, 19 Aug 2021 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629386064;
 bh=6RbiCLR/J3ApdDbLsZpuHB3TvFLX+SWaJ1+NjJtMJY8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AHyPiVBoomZwv4Xo5tk1EFmp1N/E2HBfNMARLkELCOYJ9dI/EEsPG4CveHebEmUmv
 zvGhAgXRHaBBmkfo8a1vMdTSuAvstN00YmTIeiWZJ0qgZLWyn1dJ2mBNLq88xZLYaI
 2616jUShd6FjuLGxuGAcmuiZWR3OtByJ82LOxqWjacg+E2fC1xTUzKuxpkzqifCPP2
 S36iBh6O2H5PpME3yMtr9quGFHjxB/MYPxCAu1zGZo77fOso8S9lUmkgOGyhloQsge
 LhkW3QGVkkVQGqdxg2GNLtsvgof3RZ9kAf887waxUrG6aZrISLmIIHyERyuCsMM2oX
 C5ls+WQ3ef9nQ==
Received: by mail-ej1-f45.google.com with SMTP id bq25so13589646ejb.11;
 Thu, 19 Aug 2021 08:14:24 -0700 (PDT)
X-Gm-Message-State: AOAM5307Rz4wnaBVab5BX3LafvyPJty+1GLYYPMV9gCPDojKCHqQnx4D
 h2mtzlteFTd+mAg1G2afbMGUtNOHbIcxVSR74g==
X-Google-Smtp-Source: ABdhPJxNW1csyeYOicQ3nM6PcDuxFbu6S4tmvu4KMqvNMAFuMYOi/tLANBBPh57govVIbwsYHsNcG7N9//UyPl43KyQ=
X-Received: by 2002:a17:906:f43:: with SMTP id
 h3mr16507585ejj.267.1629386062976; 
 Thu, 19 Aug 2021 08:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-9-jason-jh.lin@mediatek.com>
In-Reply-To: <20210819022327.13040-9-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 19 Aug 2021 23:14:11 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9_YwZH4dLyVXmW7irQ8WJaKFzT+72Pgczu1X3u4jvnbg@mail.gmail.com>
Message-ID: <CAAOTY_9_YwZH4dLyVXmW7irQ8WJaKFzT+72Pgczu1X3u4jvnbg@mail.gmail.com>
Subject: Re: [PATCH v8 08/13] drm/mediatek: remove unused define in
 mtk_drm_ddp_comp.c
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, fshao@chromium.org, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 singo.chang@mediatek.com, DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_081425_195124_6F4922D9 
X-CRM114-Status: GOOD (  12.51  )
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDjmnIgxOeaXpSDpgLHlm5sg5LiK5Y2IMTA6MjPlr6vpgZPvvJoKPgo+IFJlbW92ZSB0
aGUgdW5zZWQgZGVmaW5lIGluIG10a19kcm1fZGRwX2NvbXAuYwoKUmV2aWV3ZWQtYnk6IENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IGph
c29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDEwIC0tLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gaW5kZXggNzViYzAwZTE3ZmM0Li5hYWE3NDUwYjNlMmIg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBA
QCAtMjEsOCArMjEsNiBAQAo+ICAjaW5jbHVkZSAibXRrX2RybV9jcnRjLmgiCj4KPiAgI2RlZmlu
ZSBESVNQX09EX0VOICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAwMDAKPiAtI2RlZmlu
ZSBESVNQX09EX0lOVEVOICAgICAgICAgICAgICAgICAgICAgICAgICAweDAwMDgKPiAtI2RlZmlu
ZSBESVNQX09EX0lOVFNUQSAgICAgICAgICAgICAgICAgICAgICAgICAweDAwMGMKPiAgI2RlZmlu
ZSBESVNQX09EX0NGRyAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAwMjAKPiAgI2RlZmlu
ZSBESVNQX09EX1NJWkUgICAgICAgICAgICAgICAgICAgICAgICAgICAweDAwMzAKPiAgI2RlZmlu
ZSBESVNQX0RJVEhFUl81ICAgICAgICAgICAgICAgICAgICAgICAgICAweDAxMTQKPiBAQCAtNDIs
OCArNDAsNiBAQAo+ICAjZGVmaW5lIERJVEhFUl9FTkdJTkVfRU4gICAgICAgICAgICAgICAgICAg
ICAgIEJJVCgxKQo+ICAjZGVmaW5lIERJU1BfRElUSEVSX1NJWkUgICAgICAgICAgICAgICAgICAg
ICAgIDB4MDAzMAo+Cj4gLSNkZWZpbmUgTFVUXzEwQklUX01BU0sgICAgICAgICAgICAgICAgICAg
ICAgICAgMHgwM2ZmCj4gLQo+ICAjZGVmaW5lIE9EX1JFTEFZTU9ERSAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEJJVCgwKQo+Cj4gICNkZWZpbmUgVUZPX0JZUEFTUyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgQklUKDIpCj4gQEAgLTUyLDE4ICs0OCwxMiBAQAo+Cj4gICNkZWZpbmUgRElT
UF9ESVRIRVJJTkcgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDIpCj4gICNkZWZpbmUgRElU
SEVSX0xTQl9FUlJfU0hJRlRfUih4KSAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDI4KQo+
IC0jZGVmaW5lIERJVEhFUl9PVkZMV19CSVRfUih4KSAgICAgICAgICAgICAgICAgICgoKHgpICYg
MHg3KSA8PCAyNCkKPiAgI2RlZmluZSBESVRIRVJfQUREX0xTSElGVF9SKHgpICAgICAgICAgICAg
ICAgICAoKCh4KSAmIDB4NykgPDwgMjApCj4gLSNkZWZpbmUgRElUSEVSX0FERF9SU0hJRlRfUih4
KSAgICAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDE2KQo+ICAjZGVmaW5lIERJVEhFUl9O
RVdfQklUX01PREUgICAgICAgICAgICAgICAgICAgIEJJVCgwKQo+ICAjZGVmaW5lIERJVEhFUl9M
U0JfRVJSX1NISUZUX0IoeCkgICAgICAgICAgICAgICgoKHgpICYgMHg3KSA8PCAyOCkKPiAtI2Rl
ZmluZSBESVRIRVJfT1ZGTFdfQklUX0IoeCkgICAgICAgICAgICAgICAgICAoKCh4KSAmIDB4Nykg
PDwgMjQpCj4gICNkZWZpbmUgRElUSEVSX0FERF9MU0hJRlRfQih4KSAgICAgICAgICAgICAgICAg
KCgoeCkgJiAweDcpIDw8IDIwKQo+IC0jZGVmaW5lIERJVEhFUl9BRERfUlNISUZUX0IoeCkgICAg
ICAgICAgICAgICAgICgoKHgpICYgMHg3KSA8PCAxNikKPiAgI2RlZmluZSBESVRIRVJfTFNCX0VS
Ul9TSElGVF9HKHgpICAgICAgICAgICAgICAoKCh4KSAmIDB4NykgPDwgMTIpCj4gLSNkZWZpbmUg
RElUSEVSX09WRkxXX0JJVF9HKHgpICAgICAgICAgICAgICAgICAgKCgoeCkgJiAweDcpIDw8IDgp
Cj4gICNkZWZpbmUgRElUSEVSX0FERF9MU0hJRlRfRyh4KSAgICAgICAgICAgICAgICAgKCgoeCkg
JiAweDcpIDw8IDQpCj4gLSNkZWZpbmUgRElUSEVSX0FERF9SU0hJRlRfRyh4KSAgICAgICAgICAg
ICAgICAgKCgoeCkgJiAweDcpIDw8IDApCj4KPiAgc3RydWN0IG10a19kZHBfY29tcF9kZXYgewo+
ICAgICAgICAgc3RydWN0IGNsayAqY2xrOwo+IC0tCj4gMi4xOC4wCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
