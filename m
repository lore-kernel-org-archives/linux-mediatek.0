Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFF5C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/ZRpXTlLlCdQZ5522ZX7gE/3G390UHZnv+R0mDij9Q=; b=esZErDDYqw0w+a6s+tTfIiVjT+
	VcZGd8N0hNaFQxpfi/lBUBnFQQ6NuP8emB/TMBmiTRbvlvHXlwaGTvapstLp1a/dts5WyhNzVJb6u
	c0o/PuyyfPz2XLFzahho+1kqqZinBIERh/gSYdUxWXQ7w/YVKzYRrc4HYeBsV9gaEXHrh2K605O6m
	93hAvFoefPb+QScPhIxUkbiPmRMp2OMJlzu+rSvb6hTuQBKTlWOkL7ZDas1OzEb4kDiB9F5CTF5LD
	lEPrDJNvzkJGZjGRoD4vqUMT/vr9qgCDLmeWj5NYnyCvmMhxYZ4WC6XXG4UDchlZiDjniUWdjAKvy
	6cD0p4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqaId-00ALyK-Qo; Fri, 26 Nov 2021 12:25:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqZzY-00AHVi-6V
 for linux-mediatek@lists.infradead.org; Fri, 26 Nov 2021 12:06:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 36BA91F46847
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637928371; bh=738bSYdyIdigXLlMxFXudb2N3jgQ0UIt9fKrjECy69U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FU8lv0z9NGgwj9+kpWcIN3FKFFwt7cjEI+yXFe7Tge/Rd3PwlcGxwzJd+A9UQ4ON6
 dox+v3LpD+H7Ab229W0BnXpnucW635tPD+8I5y1iwX6b12fyVBw4BZew6JWAJFSWN1
 AWmKBUQ2NXUWA64gDGqOLYPPdan1qsnXdg8bcFabRI3L4NDVaqnN12fJiS6ldU2BA7
 DrgHmjVZzRpNEc49WqtzMbSWGZy9N2uk/lUORzO/GjdfGgneZRjlehPPiMz/UE2wXd
 HlF9cGu2NGcQdDTtHCF7zuWIV699vcPPp8146snJr1Wt++F64cU2SNWvPrHGdCeCGS
 cQDD9V1uFr7xA==
Subject: Re: [PATCH v2 1/8] ASoC: SOF: mediatek: Add mt8195 hardware support
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 daniel.baluta@nxp.com, daniel.baluta@gmail.com,
 linux-kernel@vger.kernel.org, yc.hung@mediatek.com,
 linux-mediatek@lists.infradead.org,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
References: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
 <20211118100749.54628-2-daniel.baluta@oss.nxp.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <5e4e1153-a503-5889-efdf-242766554967@collabora.com>
Date: Fri, 26 Nov 2021 13:06:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211118100749.54628-2-daniel.baluta@oss.nxp.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_040612_428557_879B0CD8 
X-CRM114-Status: GOOD (  11.00  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SWwgMTgvMTEvMjEgMTE6MDcsIERhbmllbCBCYWx1dGEgaGEgc2NyaXR0bzoKPiBGcm9tOiBZQyBI
dW5nIDx5Yy5odW5nQG1lZGlhdGVrLmNvbT4KPiAKPiBUaGlzIHBhdGNoIGluaXRpYWxpemUgdG8g
c3VwcG9ydCBTT0Ygb24gTWVkaWF0ZWsgbXQ4MTk1IHBsYXRmb3JtLgo+IE1UODE5NSBoYXMgZm91
ciBDb3J0ZXggQTc4IGNvcmVzIHBhaXJlZCB3aXRoIGZvdXIgQ29ydGV4IEE1NSBjb3Jlcy4KPiBJ
dCBhbHNvIGhhcyBDYWRlbmNlIEhpRmktNCBEU1Agc2luZ2xlIGNvcmUuIFRoZXJlIGFyZSBzaGFy
ZWQgRFJBTSBhbmQKPiBtYWlsYm94IGludGVycnVwdCBiZXR3ZWVuIEFQIGFuZCBEU1AgdG8gdXNl
IGZvciBJUEMgY29tbXVuaWNhdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZQyBIdW5nIDx5Yy5o
dW5nQG1lZGlhdGVrLmNvbT4KPiBSZXZpZXdlZC1ieTogUMOpdGVyIFVqZmFsdXNpIDxwZXRlci51
amZhbHVzaUBsaW51eC5pbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFBpZXJyZS1Mb3VpcyBCb3Nz
YXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6
IFJhbmphbmkgU3JpZGhhcmFuIDxyYW5qYW5pLnNyaWRoYXJhbkBsaW51eC5pbnRlbC5jb20+Cj4g
UmV2aWV3ZWQtYnk6IEthaSBWZWhtYW5lbiA8a2FpLnZlaG1hbmVuQGxpbnV4LmludGVsLmNvbT4K
PiBSZXZpZXdlZC1ieTogR3Vlbm5hZGkgTGlha2hvdmV0c2tpIDxndWVubmFkaS5saWFraG92ZXRz
a2lAbGludXguaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBEYW5pZWwgQmFsdXRhIDxkYW5pZWwu
YmFsdXRhQG54cC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIEJhbHV0YSA8ZGFuaWVsLmJh
bHV0YUBueHAuY29tPgoKQWNrZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdl
bG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+CgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
