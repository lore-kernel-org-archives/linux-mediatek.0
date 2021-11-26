Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB8CC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 12:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRyhy7YB8aQpjbslRFO6uHPilbSNkd5CFltorb33+dg=; b=eac8BqeaACQMF0W+HJ2ItBr4Jy
	jQPhlNF2x3VtbK27dfCJsgxHLyLZ13yADn1T2WG8N5ne+uY2F3qo31IqxoctOBK5Z8gkLyUNI6ac0
	PYOaoRWZWynDMvCT4rgHCnpZ9jUxY5rJq6eD375XsfJ0tCGWbCIjilAxWahgrRCNMwb95k1/Btocs
	E7ZBYW+e5hBduX2ck1tLqnRyI5RrCGpMb0EvPmh4naH9kRLpiEJblcds7l3gW4XS38ylQR/mVEoby
	ltzD+PaCce4s70OcbMXFic09eSXkH5xCwy0jOBi6M6lYBL4Zu0vHpj3bziZYWOGOQ06dE0drBv2nw
	VHU+LuFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqaIV-00ALvA-UR; Fri, 26 Nov 2021 12:25:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqZzS-00AHUB-15
 for linux-mediatek@lists.infradead.org; Fri, 26 Nov 2021 12:06:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 113451F46847
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637928364; bh=aM0ClwaIkOmOfA+rtGLm+e5bAyYY0Zq25jWi1025T0c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JF/U3uhAHtR6EdQ445+C0XbYA4x29h0BiVIWW8wSkx1Zgnc16eGul/QWwC1PvfyKF
 vy8D1+ng+YFmi5qvs2vouJKqMpqS1ZIEeU2akp6YZiGz61nNpxo1SY5PPRN2OV6VOu
 iOr3i+GwrhlHPvVaUh3LI1TRnqc6hW4eIDWgwjcsbEwseIp3wYEkNp1NB6CcHVhvkw
 VnTc10G1xNOGojto08EIklEGpGGg/Yq3vIvn7NBHTHmBT4dmJeUJkcQ/6IRECGv/ce
 FoOGU17fHfwanYGFx87pKEk4XqExcOI+rG0gEwoWu5h8g/79bcmJx62QxNuV4124RF
 qkKN1hv3wFtzQ==
Subject: Re: [PATCH v2 2/8] ASoC: SOF: tokens: add token for Mediatek AFE
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
 <20211118100749.54628-3-daniel.baluta@oss.nxp.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <fd9aec72-9bf8-9700-afa8-ec9860265be5@collabora.com>
Date: Fri, 26 Nov 2021 13:06:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211118100749.54628-3-daniel.baluta@oss.nxp.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_040606_247143_8F106426 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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
dW5nIDx5Yy5odW5nQG1lZGlhdGVrLmNvbT4KPiAKPiBBZGQgdGhlIGRlZmluaXRpb24gZm9yIE1l
ZGlhdGVrIGF1ZGlvIGZyb250IGVuZChBRkUpIHRva2VucyxpbmNsdWRlCj4gQUZFIHNhbXBsaW5n
IHJhdGUsIGNoYW5uZWxzLCBhbmQgZm9ybWF0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFlDIEh1bmcg
PHljLmh1bmdAbWVkaWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5OiBQw6l0ZXIgVWpmYWx1c2kgPHBl
dGVyLnVqZmFsdXNpQGxpbnV4LmludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogUGllcnJlLUxvdWlz
IEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4KPiBSZXZpZXdl
ZC1ieTogUmFuamFuaSBTcmlkaGFyYW4gPHJhbmphbmkuc3JpZGhhcmFuQGxpbnV4LmludGVsLmNv
bT4KPiBSZXZpZXdlZC1ieTogS2FpIFZlaG1hbmVuIDxrYWkudmVobWFuZW5AbGludXguaW50ZWwu
Y29tPgo+IFJldmlld2VkLWJ5OiBHdWVubmFkaSBMaWFraG92ZXRza2kgPGd1ZW5uYWRpLmxpYWto
b3ZldHNraUBsaW51eC5pbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IERhbmllbCBCYWx1dGEgPGRh
bmllbC5iYWx1dGFAbnhwLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQmFsdXRhIDxkYW5p
ZWwuYmFsdXRhQG54cC5jb20+CgpBY2tlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
