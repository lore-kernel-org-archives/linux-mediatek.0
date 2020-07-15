Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0914C433E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 09:19:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D5E92053B
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 09:19:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YLHf/aju";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZTSEyblP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D5E92053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iMK6Q/OGBMP/MJgyVVaHjtKAbTAYmF7he4/mtFaaJEI=; b=YLHf/ajuiQK53R/2dNeY3e+K1
	rUTRnkXD5KpyyZnGfyxQ9M/7/T7uotIbf4JYlixT2OU2f/xWf4X7EPL5ycfVrIJJXzyPP39o4aOhg
	QHracxh2Dr/2pn2+gXC0/sgaSnKCIEkYi14G4CREAHcRFklVs2qFwErvUGsmVOgWrGeL9/ewRxtAG
	Htr8D5Y/lQSCSm32HG5WHGMkLAC1O34SU1JfcrZtp9a69TjBdr5zrj2y9jwuLgvhv35M/Dz1lIo5I
	LtNQpEazDU3Y0RjbXDcckV+PQ5jO50Lv1tbsoYkN1ihNVUYlb4jVGkg9t+6X2SCIVB2YSqBHJL90Z
	86TYB5yTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvdZL-00010K-Jx; Wed, 15 Jul 2020 09:19:15 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvdZI-0000z8-Sj
 for linux-mediatek@lists.infradead.org; Wed, 15 Jul 2020 09:19:14 +0000
Received: by mail-wm1-x342.google.com with SMTP id 17so4836226wmo.1
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2020 02:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6S4rQcbbTZAnnQ2mAS4yWMNRrJk1s3+AGlDrxLO8KXg=;
 b=ZTSEyblPv2P83EojiNZREKOaW+HEbHXuQwZA+qzHoDEeevYBXsbb/m7Cv2JKaRUPSC
 OMB2+0GdNF/GhRmuYrohmDcZPNviTo39lIFcOjNItuFg9iC6sSjI/0gxJSYjOA64Hnp/
 V0VP57wQFxu+O9su7OIDG57xbfzaTmscPLBmK+zp8eVmLJ/IGvHVlj1ENw7MdYwUmKz0
 3+zmUDmRqQlHD1KpGX7yMHc/YHXnDZUAQjUG1Nh03TgiZAinVyQqrl+RG0RoAOfdwKSo
 /XLiw9utxk91lHgTqrPuKUYEs1l4gC+Xw7ZQRa8Mb3Gaf72hktg0TmZLVm29pQWo+44b
 Yemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6S4rQcbbTZAnnQ2mAS4yWMNRrJk1s3+AGlDrxLO8KXg=;
 b=Zd/pIUmPiMDmqCuouMyMPDi+dHmwpsx6uZrLeImf7UoGZ1tUMhhQ9BPIxxvLhnCf9Y
 mys8pcY1+fW+n+WYUoyNqNu1uUMTbxdfA5dvvUqUve6FDMZmfJAF9etfha41R364ioA/
 xzgmbOUXFK12VnkF935zGq8U59pBOz7annrDZnKPesZVKlNs3XcHy8G94dVe3ddhXIvn
 /Ub01dTlvgN461WIqJbISfkIN3NBWUolgQ4WYbpFVkj0ry1xxxR3PFMgf0INUtUcggYR
 q+J8In6lf9IK+fhTBg0OMZvVd9uAO4jJ4LeFmDl/cKbKJzc+MoH9AS3AdLGQ2JvIoNUh
 XF5g==
X-Gm-Message-State: AOAM533ENo0KfjPawXZBnFX7a6PiNyVme5+qqgKhrB3CdzqW1k40wcRi
 hPYXaZCuo4xpG+pmnwaAEaOmiA==
X-Google-Smtp-Source: ABdhPJz01iAz6XrxpaOaf1z0Na2lpWh6FhP27ILMosYGk50ZrcsrE3mRryySLa/rmuI3t6DXkfpSwA==
X-Received: by 2002:a05:600c:2295:: with SMTP id
 21mr7477060wmf.87.1594804750107; 
 Wed, 15 Jul 2020 02:19:10 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:814b:c0b2:8c76:b6a9?
 ([2a01:e34:ed2f:f020:814b:c0b2:8c76:b6a9])
 by smtp.googlemail.com with ESMTPSA id q3sm2371916wmq.22.2020.07.15.02.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2020 02:19:09 -0700 (PDT)
Subject: Re: [PATCH] Revert "thermal: mediatek: fix register index error"
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20200707103412.1010823-1-enric.balletbo@collabora.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <7aa6c0a5-3fc4-fd27-ece8-d062078c6faa@linaro.org>
Date: Wed, 15 Jul 2020 11:19:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707103412.1010823-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_051913_062521_8EA1EF17 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: Amit Kucheria <amit.kucheria@verdurent.com>, drinkcat@chromium.org,
 linux-pm@vger.kernel.org, Michael Kao <michael.kao@mediatek.com>,
 Eduardo Valentin <edubezval@gmail.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com, Zhang Rui <rui.zhang@intel.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMDcvMDcvMjAyMCAxMjozNCwgRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSB3cm90ZToKPiBUaGlz
IHJldmVydHMgY29tbWl0IGViOWFlY2Q5MGQxYTM5NjAxZTkxY2QwOGI5MGQ1ZmVlNTFkMzIxYTYK
PiAKPiBUaGUgYWJvdmUgcGF0Y2ggaXMgc3VwcG9zZWQgdG8gZml4IGEgcmVnaXN0ZXIgaW5kZXgg
ZXJyb3Igb24gbXQyNzAxLiBJdAo+IGlzIG5vdCBjbGVhciBpZiB0aGUgcHJvYmxlbSBzb2x2ZWQg
aXMgYSBoYW5nIG9yIGp1c3QgYW4gaW52YWxpZCB2YWx1ZQo+IHJldHVybmVkLCBteSBndWVzcyBp
cyB0aGUgc2Vjb25kLiBUaGUgcGF0Y2ggaW50cm9kdWNlcywgdGhvdWdoLCBhIG5ldwo+IGhhbmcg
b24gTVQ4MTczIGRldmljZSBtYWtpbmcgdGhlbSB1bnVzYWJsZS4gU28sIHNlZW1zIHJlYXNvbmFi
bGUsIHJldmVydAo+IHRoZSBwYXRjaCBiZWNhdXNlIGludHJvZHVjZXMgYSB3b3JzdCBpc3N1ZS4K
PiAKPiBUaGUgcmVhc29uIEkgc2VuZCBhIHJldmVydCBpbnN0ZWFkIG9mIHRyeWluZyB0byBmaXgg
dGhlIGlzc3VlIGZvciBNVDgxNzMKPiBpcyBiZWNhdXNlIHRoZSBpbmZvcm1hdGlvbiBuZWVkZWQg
dG8gZml4IHRoZSBpc3N1ZSBpcyBpbiB0aGUgZGF0YXNoZWV0Cj4gYW5kIGlzIG5vdCBwdWJsaWMu
IFNvIEkgYW0gbm90IHJlYWxseSBhYmxlIHRvIGZpeCBpdC4KPiAKPiBGaXhlcyB0aGUgZm9sbG93
aW5nIGJ1ZyB3aGVuIENPTkZJR19NVEtfVEhFUk1BTCBpcyBzZXQgb24gTVQ4MTczCj4gZGV2aWNl
cy4KCkFwcGxpZWQgZm9yIHY1LjgtcmM2CgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBM
aW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8
CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cu
bGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
