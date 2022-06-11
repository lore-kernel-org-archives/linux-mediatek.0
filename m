Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB343C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 14:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+5FcMqiMC0V1CIO4V0XJDqHkU1kvzw9UQwm9M3ILyo=; b=XpO6UEFtMdl2xo
	ngV2GjpPi/eKuvVt2dkN5D5+eBYhlcLi/3du5Ib7aB25oCCywrje1JxVA91k4p76dB07xDx7amUK+
	p5WWme2Dh31sGEF1uThya13QE6ybwv3gTM3rfusHSoBjNN+8UlHaGvfYKIORsaDr+NWjM2kk6sOwB
	JRrCSC6zR7oADuqbT9sFE01J3kcFEglHDS7vRgIXGoYxkc3CbbfC9HV2Uz9h3FrFmXbokRORZM/D8
	6Xs6H5jQd/cZAyRtY8lu2lGfDRbiuf5VjQyxY58wqJu3RM6njmADUI05Td2vQBxWcBLYw8RLfDppR
	9OkwQsURgMW/HmpiKR7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01hv-00DCUE-PF; Sat, 11 Jun 2022 14:03:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01hr-00DCTJ-NH; Sat, 11 Jun 2022 14:03:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4ED2DB80108;
	Sat, 11 Jun 2022 14:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F738C34116;
	Sat, 11 Jun 2022 14:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654956192;
	bh=yVjUIo9j/8SDHnpOVBqCt3yY9KttJoBoglfxAPDEQ8M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i4dm3ic0/BsqVRnsZxWFgneqFvzt3SMz+ny3u9sPogWoJ+XJKo6EEua8lNvaWjnlV
	 aYSCIgXZQOTh3OBj+zbacHRKpDokEgH97jPJiEzZ5WOGHCckB9IcMjFBrnON0zCHql
	 AhcXd6UgOQSGoD/mqYGoWiq42LxCA1OO0yFGpLTGZHpTiP8nj/0qEYb8g794Z18067
	 UX5yjFUmUOoeQMH25nWwSgzL9JiudXmZ7A02TcTs18PgBbupBzEmqu4dTgdgA+eLSM
	 Lo9enUnFFZTUPGJkL9eNrT+q8bMOtvc7jhpZ1I22A2xhGEk8JPW3KgymvDWULY7wF7
	 RdWOMJD/XMJRA==
Date: Sat, 11 Jun 2022 15:12:09 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>
Cc: <linux-imx@nxp.com>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>, Cai Huoqing <cai.huoqing@linux.dev>, Benjamin
 Fair <benjaminfair@google.com>, Jishnu Prakash <quic_jprakash@quicinc.com>,
 "Linus Walleij" <linus.walleij@linaro.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Amit
 Kucheria <amitk@kernel.org>, Andy Gross <agross@kernel.org>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Haibo Chen <haibo.chen@nxp.com>,
 Benson Leung <bleung@chromium.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 Christophe Branchereau <cbranchereau@gmail.com>, Patrick Venture
 <venture@google.com>, Arnd Bergmann <arnd@arndb.de>, Nancy Yuen
 <yuenn@google.com>, Sascha Hauer <s.hauer@pengutronix.de>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, "Gwendal Grignou" <gwendal@chromium.org>,
 Saravanan Sekar <sravanhome@gmail.com>, "Tali Perry"
 <tali.perry1@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul
 Cercueil <paul@crapouillou.net>, Thara Gopinath
 <thara.gopinath@linaro.org>, Avi Fishman <avifishman70@gmail.com>, "Lorenzo
 Bianconi" <lorenzo@kernel.org>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, "Nicolas Ferre"
 <nicolas.ferre@microchip.com>, Zhang Rui <rui.zhang@intel.com>, Shawn Guo
 <shawnguo@kernel.org>, "Guenter Roeck" <groeck@chromium.org>, Fabio Estevam
 <festevam@gmail.com>, "Olivier Moysan" <olivier.moysan@foss.st.com>, Eugen
 Hristev <eugen.hristev@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 09/34] iio: adc: npcm_adc: explicitly add proper header
 files
Message-ID: <20220611151209.7f5be10d@jic23-huawei>
In-Reply-To: <20220610084545.547700-10-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-10-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_070316_076043_8C7973DA 
X-CRM114-Status: GOOD (  14.11  )
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NToyMCArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gRG8gbm90IHRydXN0IHRoZSBmYWN0IHRoYXQgaWlvLmggaW5jbHVk
ZXMgb2YuaCB3aGljaCBpbiB0dXJuIGluY2x1ZGVzCj4gYWxsIHRoZSBoZWFkZXJzIHdlIGFyZSBy
ZWx5aW5nIG9uLgo+IAo+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGFjdHVhbGx5IGRyb3Agb2Yu
aCBmcm9tIGlpby5oLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxv
Zy5jb20+CgpBcHBsaWVkLiBJdCdzIGZ1bm55LCBidXQgSSdkIGFsd2F5cyBhc3N1bWVkIG1vZHVs
ZS5oIGluY2x1ZGVkCm1vZF9kZXZpY2V0YWJsZS5oICh0aG91Z2ggdHJpZWQgbmV2ZXIgdG8gcmVs
eSBvbiBpdCkuICBUdXJucwpvdXQgbm9wZSwgaXQgZG9lc24ndCA6KQoKSm9uYXRoYW4KCj4gLS0t
Cj4gIGRyaXZlcnMvaWlvL2FkYy9ucGNtX2FkYy5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvbnBjbV9hZGMu
YyBiL2RyaXZlcnMvaWlvL2FkYy9ucGNtX2FkYy5jCj4gaW5kZXggZjdiYzBiYjdmMTEyLi5hMjQy
ZTc5OTM0NzYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9paW8vYWRjL25wY21fYWRjLmMKPiArKysg
Yi9kcml2ZXJzL2lpby9hZGMvbnBjbV9hZGMuYwo+IEBAIC04LDYgKzgsNyBAQAo+ICAjaW5jbHVk
ZSA8bGludXgvaWlvL2lpby5oPgo+ICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4gICNp
bmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiArI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJs
ZS5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
