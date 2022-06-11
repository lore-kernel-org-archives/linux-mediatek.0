Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F88EC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jun 2022 14:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJCoxsEVHwgDLozKGel1sMdwjj/lWRX4/kLzhaSTtio=; b=tRkxeotvyGya1D
	UjgdPU1KzHEW/wnr5DwYmug0sgZETIQ6A0F6I5tlbRSK8UCpsrntLhFHY/2n34rSeIkA8MxTqaf/1
	PIbQVT4uBEygXccF7bCgCK5XKiWDPbwP70G1cNBBvdl1mfDLUdBTqdCmEPn3FCooL7/Wl+d1hhhYd
	sj+bLF48HAWK0qJjClh/nltm4wakrHNKAfdxh/Yk7nKLJx+DDvc08NFTsUiVo+4xgEKlHZ7lbDDOD
	nVON0l1FzMGqTiPdVipALf/wDb/aUsGffBeYK8eHJAYq6AeWupmOP+uMAYgaOg9aicKizZTdAvQ0i
	5C3Ju09F+qsKk/mS3m6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01kZ-00DCze-G5; Sat, 11 Jun 2022 14:06:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o01kV-00DCz9-DW; Sat, 11 Jun 2022 14:06:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A95F560F31;
	Sat, 11 Jun 2022 14:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9E0C34116;
	Sat, 11 Jun 2022 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654956358;
	bh=OmUfGkRF4xL7PgWSrSTnTjbph9RD9p9o9gWv8vjGSHg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s/NwO96uBMX+o2nM9eGSnt7eVSX4jqvSEZqkM27RqMGCzysNXsmCNSfHKYk+2w1DX
	 xW62AVOwiXdjLZYAD4tkKKX1EOq8YmkjNrD09fdjwNuWfawr0w9HEgLV0u11un8IoI
	 jiXlPZJ/OoqzgbhcnXWXzKJ1Al9KVFSJxpZaUaRMO3rYoB8DtHOQhRTmIqJF5Wq1Ls
	 DHdq9fD+W0XqUUNJdDNRMkgK/FuVBkEolBiw1uQzLdoAsIaasmVFhCt0fIophTyLSD
	 XbSJyDSBJ91XzayfJgSHvIrQYXIIoFAU7WtAnId+BDpo4Md91AZg3TKvCuxbHrz1aG
	 YELoLDy88lQ7g==
Date: Sat, 11 Jun 2022 15:14:56 +0100
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
Subject: Re: [PATCH 11/34] iio: common: cros_ec_lid_angle: explicitly add
 proper header files
Message-ID: <20220611151456.24c66aa2@jic23-huawei>
In-Reply-To: <20220610084545.547700-12-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	<20220610084545.547700-12-nuno.sa@analog.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_070559_576045_1BC3B82C 
X-CRM114-Status: GOOD (  13.28  )
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

T24gRnJpLCAxMCBKdW4gMjAyMiAxMDo0NToyMiArMDIwMApOdW5vIFPDoSA8bnVuby5zYUBhbmFs
b2cuY29tPiB3cm90ZToKCj4gRG8gbm90IHRydXN0IHRoZSBmYWN0IHRoYXQgaWlvLmggaW5jbHVk
ZXMgb2YuaCB3aGljaCBpbiB0dXJuIGluY2x1ZGVzCj4gYWxsIHRoZSBoZWFkZXJzIHdlIGFyZSBy
ZWx5aW5nIG9uLgo+IAo+IFRoZSB1bHRpbWF0ZSBnb2FsIGlzIHRvIGFjdHVhbGx5IGRyb3Agb2Yu
aCBmcm9tIGlpby5oLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxv
Zy5jb20+CkFwcGxpZWQuCgo+IC0tLQo+ICBkcml2ZXJzL2lpby9jb21tb24vY3Jvc19lY19zZW5z
b3JzL2Nyb3NfZWNfbGlkX2FuZ2xlLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2NvbW1vbi9jcm9zX2VjX3NlbnNv
cnMvY3Jvc19lY19saWRfYW5nbGUuYyBiL2RyaXZlcnMvaWlvL2NvbW1vbi9jcm9zX2VjX3NlbnNv
cnMvY3Jvc19lY19saWRfYW5nbGUuYwo+IGluZGV4IGFmODAxZTIwMzYyMy4uOWY3ODBmYWZhZWQ5
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaWlvL2NvbW1vbi9jcm9zX2VjX3NlbnNvcnMvY3Jvc19l
Y19saWRfYW5nbGUuYwo+ICsrKyBiL2RyaXZlcnMvaWlvL2NvbW1vbi9jcm9zX2VjX3NlbnNvcnMv
Y3Jvc19lY19saWRfYW5nbGUuYwo+IEBAIC0yMCw2ICsyMCw3IEBACj4gICNpbmNsdWRlIDxsaW51
eC9paW8vdHJpZ2dlcmVkX2J1ZmZlci5oPgo+ICAjaW5jbHVkZSA8bGludXgvaWlvL3RyaWdnZXJf
Y29uc3VtZXIuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICsjaW5jbHVkZSA8bGlu
dXgvbW9kX2RldmljZXRhYmxlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RhdGEvY3Jvc19lY19jb21tYW5kcy5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
