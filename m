Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5CFC531FC
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 14:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sjxi0sQi0TP4rOMmNMZaggGGPh9+KGnMQPNHWuRXro4=; b=dyjheDgbamt3oqYNYx0riLH9ta
	We9uiAXph8S6+nhvYtB1d/sj8G02a3n2tFFwAGqodDlu/Un1dplIZs1sYY33+nx2zzPJg2YHaf9H+
	KBgqi/rJeFcf9lCvA8fa/3lpRtvDDqE+dgejwraR1DKbef18GyVrCeJlMJnwiViypYp5TZ5nYaXQA
	F4ixEBJC7xevi9E9uX/JLR/eSgnYmlFvX2oQso+nk5le332LMDY6tVI+OwVyovnJYdM7WXtFWdovx
	hBq95/pR0wIfP5zSgvNqjgUU1MCBlSE75Df/ngFeE4Rj9aPXJghSYpR4TpFgMFYPgWa1iQUsOlEOQ
	iSGQlBzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMct-000000034cc-3YDa;
	Mon, 27 Jul 2026 14:48:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMcG-000000034Vx-3y66
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 14:48:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlaee3905424
	for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 14:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sjxi0sQi0TP4rOMmNMZaggGGPh9+KGnMQPNHWuRXro4=; b=fg9OMB4Rp/B/Bd1a
	GrpthF/QtlbaAJU2PpzNOItCg991o2X9dkm5yrkmtr8CrowFIn+Shxou5cw9ZP7f
	YBtFbT2KvY2lq9c96rvjO/2EIDjJt2lbb9plwY/K3twlDZA3rJFxfLdsUa9/kGix
	VUIpfzBZjXlKlmZMocc2sQ6hP60Zi4RApif2RpmpxUDCD1RsSFuZqMqdNn+rGXqj
	vJ5HQMGmBwNovecawlleETMT1Jif2YeucA3R3/UFe+nml0LZaOW2CO2DfzNrdQLE
	ueC64Nnn7zgHHMamZcQvOaUFjH2mTu8jbBI0zfvY20wrI8nO4jw/cSnPDwpFLWN7
	cRTbcA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4uks69h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 14:47:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso59323201cf.0
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 07:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163659; x=1785768459; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sjxi0sQi0TP4rOMmNMZaggGGPh9+KGnMQPNHWuRXro4=;
        b=DKhvoDmvEFjkM4xqnOGlR22O3JsBhK5On7+tZ+Y7SWLzqLA4hGZNcd+SmNhT34CHHh
         FGPMmdrlHE0NZJvtypZHEi5yTpabjh98jYyhPqZNiXwxWLJlbcWqu/0YpZ+ZyRBMzMUE
         T2kGu2TlCFcdux4dnXuwprF1h3dnaAQZMTPXeVl/dVndxJkxhHj3Vfusxdh6cxpkdVF6
         Mq7IDomy7VEIAnhlMHr/yVv/dAZLlSZS1sJgMN0txWHystXHsDxstkJN3LOWO3DhCMpH
         oV/lDCJwY0IM/cuRRwfSs1NlneZCejCSbWAGyTuHkr/bsggo4cylh38LfXqfItvvcPD2
         CoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163659; x=1785768459;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sjxi0sQi0TP4rOMmNMZaggGGPh9+KGnMQPNHWuRXro4=;
        b=GHQeFzuKKilRKF0bLHeVt+yvgTUrxqeHT1nDwOz/mZS7RHiWRJyyqe7ebblOU5ho5V
         67MaU9yG19F2VTWlQpzWFA0vzWJp9u9aiHUjFmof6s13/8bquyodWFTQF6Nc4GfVMbQR
         2HUjZM300OzPKfBaeeJfI7J4G2yx6hTBz1fLSpk0mDREgp0gJFARs90Tv2wYoZC4+rnN
         nKWgniM6gZWvmkINvQfU0fNQGaIeSsscY4suXZgSeHUqVle6/eKSCVIfZ/zX3j2bvkw0
         02IOnBYCjZo7oeQ/QjdiNVPACjUvxQwZ888xG0r8e9aOQMSUqQFKlpI1mCupBEYuYi+c
         FO4w==
X-Forwarded-Encrypted: i=1; AHgh+RpUfbDPH5GNGgA2shTPlLD+6Md2+TuYgNTAcXY2ElsijQB160Z2lws+sl+PrmJSh2mZJuJ98Psu9nLPzN2X0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPSuboDYmdL4z+m2ulwQAFltQrdL+75DJPYYSUabSe46o+m/Vz
	tsMQcTne+eTOIVwIQs6LXnTrBgJpdzNWfp5XrVdA3+s/9HE9vBgKtxB8J49qINkY6LxxCfI9mH7
	xiLof4tvYi/peTp+WVy+7J4WD6uv7xM+vgbkJxJPkKzy0b6aIkyuTfNr1IO1506IQKLNsyZu4dr
	w=
X-Gm-Gg: AR+sD13iPSphk6iA2j+4bFpusyCLmTY2K83egiizkRhPkHuSYpdlA8iZSnWkQxXPKRu
	66ZoCfJjTBZH+HnHYX3daeK5q52g8YrsHjWGUNFIOemfZollcYg83GCGLrAQvfl7zfHNHYa0Q6+
	OjRoxpI6vnSzX0eqGbh/LSVGvDCt3AOrpbWRWDHEY3H2DJ0yGM8LKI7rpapNIEd7MIqtnrzZ4Qi
	owFaE6Hml8MLW/RtO2lF++RoFxU5mOjRGgioOWRmi1RziE0kOONrCPl6oweR+DiYFX5fwzs7gDa
	00+ZWwrKO3v0e1Y3+pf+zidf3/fxTOS40H22zg3E4Q8g6A7hpbzQuvfI+umSsrRC8/OKUBHgOd4
	nUerRyT5afJ9RsWukys3ppDSd6S7WMiQA3LTJx6UxzLoWuA==
X-Received: by 2002:a05:622a:314:b0:517:c65c:4987 with SMTP id d75a77b69052e-5295d37817emr113813421cf.22.1785163659254;
        Mon, 27 Jul 2026 07:47:39 -0700 (PDT)
X-Received: by 2002:a05:622a:314:b0:517:c65c:4987 with SMTP id d75a77b69052e-5295d37817emr113812621cf.22.1785163658666;
        Mon, 27 Jul 2026 07:47:38 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f5f9f8sm227610155e9.9.2026.07.27.07.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:47:37 -0700 (PDT)
Message-ID: <07d7fd69-808a-4106-a02a-dd77430bbc4f@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] thermal/drivers: Remove redundant error messages on
 IRQ request failure
To: Pan Chuang <panchuang@vivo.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Miquel Raynal
 <miquel.raynal@bootlin.com>,
        Markus Mayer <mmayer@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        zhanghongchen
 <zhanghongchen@loongson.cn>,
        Yinbo Zhu <zhuyinbo@loongson.cn>, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        John Madieu <john.madieu.xa@bp.renesas.com>,
        Heiko Stuebner
 <heiko@sntech.de>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Laura Nao <laura.nao@collabora.com>,
        Mason Chang <mason-cw.chang@mediatek.com>,
        Fei Shao <fshao@chromium.org>,
        Frank Wunderlich <frank-w@public-files.de>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        "open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
        "open list:RENESAS R-CAR THERMAL DRIVERS"
 <linux-renesas-soc@vger.kernel.org>,
        "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
        "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20260709023048.599150-1-panchuang@vivo.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260709023048.599150-1-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rQl8bqV_40Kyh3KUEKFU2mu9ZPRssEGW
X-Proofpoint-ORIG-GUID: rQl8bqV_40Kyh3KUEKFU2mu9ZPRssEGW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfXxyE0KYkJZolL
 O+G71vWITJaik3ZxGht4ruvwUAWiN92SlJlJUPE71E2wSCQyfUp+p4w66hZujmHdzfkouGAJaci
 UWaN6VYEZeMswUdDzMR/FnELyyw9TMs=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a676f8b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pSU5Y2q4KNMKwdsDY74A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX1Q46IgIuyfEm
 PLHFx2L/evfNZd5K0cA/e5Sn6/RCEWuwsbFItQzFmvB4fv7LwIuSKLmOqEfqMWYc0jb3TIsX7AP
 gJ41jIO5ldQUOp0JmSPPpD/7tyeDATm8EH/S2hukHOHMIB0Yo9ra6Jujn0NFR7vff6zhcUPguZ4
 EeBCvlf2b8Wh7g1lP5MXfV6ujf4eJXaTqtCKuyWRxQoWQJ9d9jHKe71VNf1k0m9jSXJ34X3GRyc
 Cnql9JVXFU5+og68+0GJtNOldTz6tlzUcW5mYxYFDQnbEUOZ57ExvlSH0s1xNjLCbM7WyOSoi6A
 3Y5gxvsSFhpI21YZVe6kPUnglupItNz03kqikADaTkskLewXS4yLPHoKXSkj3viHgRwFWLYrqr6
 E773m7cAryUI4l7ugnEyt8cFgweNfh10gZmW+umQDEDTRGh8vGR5QEXPb5cm8VhZklq1yTwKSRK
 OXqPo/7gc7xUn+H2D/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1011 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_074741_095931_7B2095CD 
X-CRM114-Status: GOOD (  13.05  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 7/9/26 04:30, Pan Chuang wrote:
> Commit 55b48e23f5c4b6f5ca9b7ab09599b17dcf501c10 ("genirq/devres: Add
> error handling in devm_request_*_irq()") added automatic error
> logging to devm_request_threaded_irq() and
> devm_request_any_context_irq() via the new devm_request_result()
> helper, which prints device name, IRQ number, handler functions, and
> error code on failure.
> 
> Since devm_request_irq() is a static inline wrapper around
> devm_request_threaded_irq(), it also benefits from this automatic
> logging.
> 
> Remove the now-redundant dev_err() and dev_err_probe() calls in
> thermal drivers that follow these devm_request_*_irq() functions, as
> the core now provides more detailed diagnostic information on failure.
> 

Applied, all non-x86 changes

Thanks for the cleanup

