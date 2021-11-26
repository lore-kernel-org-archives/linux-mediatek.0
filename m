Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB7AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Nov 2021 12:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MY7n1v5X+GRbEqDhbJ8j0DsmNEvOjemyUqRbzXkBYw=; b=P3sdsxxKdF/dGiLMplMUcBKkNk
	f/Xj2lzpOkFdx3ZC/+XX5Lq0hM9G1YUO6iIypgBFO5Eto93zzrigXQbFDJPynKKf69FybIMECXCtP
	5ipA9TA9Rui92lZZI70hWi9WgSb98G/gUOanv/+DDl3Cr3nlW6Bn+24NNwICs8InZN9IjCDbzP29R
	5TUvzOXCh2bTUsVQY3z2eaHAQHOT3x/R59becRwzH3/RwLNj9jySU2+szlXKp3XhQeNS11E0UQ4j1
	RLO4FjHureygEtk8Epfk4q6me1DVGqTCEZQjrM6uGmcu+7nzO2izP250FrMN7zSCDF6HAgOV7Rfn9
	AjSh/x8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqaIn-00AM3B-EC; Fri, 26 Nov 2021 12:26:05 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqZzp-00AHYt-0T
 for linux-mediatek@lists.infradead.org; Fri, 26 Nov 2021 12:06:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DD0601F46857
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637928387; bh=v+BYVL5p6hBu0vpWEhpJhjhC0arCV+byXn8Hl1HQSlw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BY0Uvo4bUQPw/HyfM8hQ6ZLJSlRSZNXOd+SwpCFTVq6IAzHnUBgf4NJKWzt0r3vMI
 NARz/YbFWAWxtrDFAk41jV6bC8E6Rv4nOBmWbNgmYGNK/8AliEZ2EPoVnj+jX9+jv9
 gtx/VRyMM8GVW+JzLbpFS0LOjiLK/irJPcWi8fLEIo5F5BxHhIjjERmmxTM6ololrf
 jF+fyVK9DxODCm3vo9B/4QUEMg3Z9OPRl0tNDMjSaWeRcX6pJSLSoc904AXuEH7+TB
 VOhfrmrq2aXJmpDZjawbZKTI7PsHlIP1ZB/nxHuqVKWIM/ll5hMx68qOq5ZB7Wudw3
 4Vg766Ky+3BaA==
Subject: Re: [PATCH v2 5/8] ASoC: SOF: Add mt8195 device descriptor
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
 <20211118100749.54628-6-daniel.baluta@oss.nxp.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <ab4a8361-1686-7226-bf54-78872cdf6a0d@collabora.com>
Date: Fri, 26 Nov 2021 13:06:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211118100749.54628-6-daniel.baluta@oss.nxp.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_040629_237170_D0EF418D 
X-CRM114-Status: UNSURE (   8.63  )
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
dW5nIDx5Yy5odW5nQG1lZGlhdGVrLmNvbT4KPiAKPiBBZGQgU09GIGRldmljZSBhbmQgRFQgZGVz
Y3JpcHRvciBmb3IgTWVkaWF0ZWsgbXQ4MTk1IHBsYXRmb3JtLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFlDIEh1bmcgPHljLmh1bmdAbWVkaWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5OiBQw6l0ZXIgVWpm
YWx1c2kgPHBldGVyLnVqZmFsdXNpQGxpbnV4LmludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogUGll
cnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4K
PiBSZXZpZXdlZC1ieTogUmFuamFuaSBTcmlkaGFyYW4gPHJhbmphbmkuc3JpZGhhcmFuQGxpbnV4
LmludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogS2FpIFZlaG1hbmVuIDxrYWkudmVobWFuZW5AbGlu
dXguaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBHdWVubmFkaSBMaWFraG92ZXRza2kgPGd1ZW5u
YWRpLmxpYWtob3ZldHNraUBsaW51eC5pbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IERhbmllbCBC
YWx1dGEgPGRhbmllbC5iYWx1dGFAbnhwLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgQmFs
dXRhIDxkYW5pZWwuYmFsdXRhQG54cC5jb20+CgpBY2tlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBE
ZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
