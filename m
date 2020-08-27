Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14046C433E6
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 21:33:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D32B520737
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 21:33:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SOcjwzCs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CeuV59MD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D32B520737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cohW7BVzb/hcJwAYhAOcD7+0bVTF3OB5QzH/UWXe7RA=; b=SOcjwzCsEvr+DbSOfLI/oy/m+
	tTcQn+3oMUrPCP/X+VrQKWbyPuhyxJQLNubN6hRkoItwkzZZooJlfXhu4VyodGiTF1V3qeK+iHRNR
	qZ2Ojs9QLrpqBUg/wZdewIqCtIFcmemupA5Xl836OktVS9s12+Zo7jS2LFqylI3de/jzH6Ld+wvUJ
	lMk/ZRboIN/owgDI6tzDUule6Tcl9M5qMgrYbzFia+rt8/xBsqZCBx9/cR4F0nGO9lqjywIeXd4As
	e40Gcklg6CdguJcbd8ED3FFyhieSKtGPqin1RaVJ126QlUUHuJoaBpLKprQ+Db2dH4Xv6e976yt6F
	z+TV3D6dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBPVu-0004uW-HM; Thu, 27 Aug 2020 21:32:54 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBPVr-0004t9-JN; Thu, 27 Aug 2020 21:32:52 +0000
Received: by mail-ed1-x543.google.com with SMTP id f24so6202940edw.10;
 Thu, 27 Aug 2020 14:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q92TxcF2bF3OBrhpEZ4r/j4Ss+4Z6EqFXSY8+h0zQ58=;
 b=CeuV59MD5wT4ZeW8ysub9lGWmMUhVQwM//kZqZV3p9gBQfufzzq1j+LUA+jVm2u6vc
 Q8UlrOMKO4bE2afAFTWz9qmtpoibOm0dSoxFTxrGocEurWsF/vHy/cTQcAAAeIooEg/7
 iQ+IHjRwsA8wmPoHJaK5NoYbSUezA8jKxlwIX97raFXV+/FmO335SB+epy+7c9do2GVk
 nXINmE3N6eHNW5qinXgjUg2+cdwm0e4JjzifQ/+JnuJuNu+Nedh8yKYHLT6urRtpKZPm
 2zkzlcS5f6RO59BkRmpHnlwp4KL6pBGJRw61RUvmyAuIOmzQ2paKta8VtuD7g6CwgeOn
 XE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q92TxcF2bF3OBrhpEZ4r/j4Ss+4Z6EqFXSY8+h0zQ58=;
 b=MfCnh5bktiijtDpdfmGA0QL6rieL5ZMrcRX7DX58B859nIWB+KyfB4TBEqnMLmebja
 h63NMDaUjRqs1Dgaz+DW0i0hYCaVjizDsczx//EeGs9boqtAQXwIsfTqGjBnrU6SlF6c
 BUrmjn9IUtllBK4Ojt4rKSgfXHCcS/P3Ky+k4ykUccA4yMCtd3TjNm3l8F1e1FZLAtun
 jXJU3b/N19+nLReuOYdWxRwnoJup4mGPCvK4tUu67PDdHRogws8cClpVLzfJIZjdE/8t
 gNejOTJO0fM3akZKfMVynSEBaAT42NUzdgowQo5QZYV2+gqxYni8/nx5goaM/ZDNsw5k
 IN7w==
X-Gm-Message-State: AOAM531WOPYbpMXYqGpEn39NX4k8LpYiPvBfA2LGkZ18v32dKWB4m0uj
 kWiRbpkbkBsQO31SXs36Dmk=
X-Google-Smtp-Source: ABdhPJxmpwB7LortCu0lNKqMMPjr/mVyTV3HwYYddAcM9JnoMS8TgfQ04DFMAgvbi1if/WT7NtcOfA==
X-Received: by 2002:a05:6402:2:: with SMTP id
 d2mr21864641edu.221.1598563969143; 
 Thu, 27 Aug 2020 14:32:49 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a137:4925:7b50:2e1c?
 ([2a01:110f:b59:fd00:a137:4925:7b50:2e1c])
 by smtp.gmail.com with ESMTPSA id i35sm2345152edi.41.2020.08.27.14.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 14:32:48 -0700 (PDT)
Subject: Re: [PATCH 0/2] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 matthias.bgg@gmail.com
References: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <8ec2100d-7156-b8a3-b730-1ec48f88d610@gmail.com>
Date: Thu, 27 Aug 2020 23:32:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_173251_703021_742B00F7 
X-CRM114-Status: GOOD (  16.05  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org, dmurphy@ti.com,
 linux-leds@vger.kernel.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

He Gene,

Please resend the set with updated version (I suppose it should be v3).

On 8/26/20 1:37 PM, Gene Chen wrote:
> In-Reply-To:
> 
> This patch series add MT6360 LED support contains driver and binding document
> 
> Gene Chen (2)
>   leds: mt6360: Add LED driver for MT6360
>   dt-bindings: leds: Add bindings for MT6360 LED
> 
>   Documentation/devicetree/bindings/leds/leds-mt6360.yaml |   50 +
>   drivers/leds/Kconfig                                    |   11
>   drivers/leds/Makefile                                   |    1
>   drivers/leds/leds-mt6360.c                              |  680 ++++++++++++++++
>   4 files changed, 742 insertions(+)
> 

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
