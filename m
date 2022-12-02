Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43057C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 10:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgZSbXK5o+bjYMnDUxSeKCoU1ZNZ3QNjnUYkpRFNIuI=; b=43hOUMY9Ne+zASrad01I5yWtX+
	QuwvCkgfYPD5fQmmDwaqrY83y2PPcFMQJU1Nzwa44PaxpDky1JtE78J/Z/rYoALIHVHqTVaFWwyrR
	xKquEKQc8WrJH/EvHzZBqs7PS54WSztjpAQljZq+iGRL8OsYGy4LtkjjZaSiE1IfEIPRQwNygZY1u
	tYhjrtAo+C5XKpBGuWa2ITDoc57zhNP6GbnDHg3+p7UpxK782p5eSmk42g5Guj77B/ZiAl6zLrGBh
	CoTCqKGiX3DrVSKQ8z91vb95NLscnb8E/lIW/suCflmypRJ2VHW1cPVei0TvZLHPqqBt9HVbD/Yiv
	fGV3lIpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13aG-00Fhqu-TZ; Fri, 02 Dec 2022 10:47:56 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13Zx-00Fhho-38
	for linux-mediatek@lists.infradead.org; Fri, 02 Dec 2022 10:47:38 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 62so4045572pgb.13
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Dec 2022 02:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tgZSbXK5o+bjYMnDUxSeKCoU1ZNZ3QNjnUYkpRFNIuI=;
        b=mX1kjgJc4h7LRgfUswxA//V9WUVhM5wGeGXf0CyYSKUjR7ge2zNybUdZhpqFbewLCT
         u36cI4CItXFWnDXJxYQVy0gRi0y24BymlYVH9WYUAr0Khp9uKO56C9hEBUPau9PMQVHj
         CxOhg4jSYeSzGgZX455R59cDvxqPVOZON0SBVmsSaMzV+D6QoJi22ciGy0O2uIK1AY4F
         E3vO+C6dXnSI3a6wSnp4Z4JvvQgyyvz9PXwCHc3JkQZoigFwlWAavsQsmvGHU5RpgsNo
         5Nvdo5Qnj2jjvZjra5W3KYPx2Nf8uGmMYcL7RT5ZkzNI4t6OLS+CKE3RKH0TctxRgtih
         TEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgZSbXK5o+bjYMnDUxSeKCoU1ZNZ3QNjnUYkpRFNIuI=;
        b=259CBRDBJ7Zlxh4EKFvgc9w9FwrHkLDnoFmvkcybaFcpyiKB+jZCndcI0wXkrqBV25
         isQt6apS8tuK3ntjH59Z8IdHbBzvHtAo2BUHodVs3Poz4Ic05XF7eW/BQE+uW4XZE/6l
         XLy2DSaonVPM4fxxlX4suep755iBzJYTyqoL3eWHfXBxjiCtYEHYWP0PMtfLAJB1qYWp
         duywGqBMWVd2lmUbpRrNBP3ao7GNYt44GMO54wAl0fTOkySuPg97aJgIh7uxo1AHZcoT
         ur25OFhFI2vy0v2WkUcVX8tR3YKVzN8gyriJMGO8dyF5vyc6i2n6X2oVRPP5VRJ4OrbY
         Ju3Q==
X-Gm-Message-State: ANoB5plplNPCRnBghFzrpwUF22j9yS3WWy47Yv91H6GADL+mlGFuZOIF
	/Dw5y+Yi/Y+bKk5qMOT6FN77VMpFIhTzCDdo
X-Google-Smtp-Source: AA0mqf6TS5g3heiZgAiv8Xg5rvRSa1KrPHqVDeAXVy5mSEkOMG6N2DK4oaYrM0TwjOP6KliKXvikkg==
X-Received: by 2002:a05:6a00:1a14:b0:557:ef5e:6db3 with SMTP id g20-20020a056a001a1400b00557ef5e6db3mr55017894pfv.13.1669978054160;
        Fri, 02 Dec 2022 02:47:34 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902784c00b001888cadf8f6sm5258938pln.49.2022.12.02.02.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 02:47:33 -0800 (PST)
Date: Fri, 2 Dec 2022 16:17:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Kernel Kernel bug caused by (cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()) on Banana Pi R64 (MT7622)
Message-ID: <20221202104731.63mfshxwu3mqlbli@vireshk-i7>
References: <bf8d2a8f-7654-29be-1104-a842c6657b5e@systemli.org>
 <02c2c955-940b-b315-0474-85d0eddad7a3@leemhuis.info>
 <Y4jHvomTrU8guBox@makrotopia.org>
 <47a4665e-333d-a6e7-a2da-96cb06c2d87b@leemhuis.info>
 <20221202052716.uj3kzkunazmgazeq@vireshk-i7>
 <0ebef1a2-6b5a-04b9-a79b-79eb3349c32b@collabora.com>
 <c76bd301-0e8d-2d2b-0d3e-a57ece9b496f@collabora.com>
 <b1822bbc3775730c4cedf9652323c7d72e663e4b.camel@mediatek.com>
 <8be3e050-f32a-6761-8ebd-49c38dfcf9eb@collabora.com>
 <c186d104-43e0-ca10-3ce2-c2f922acd8bf@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c186d104-43e0-ca10-3ce2-c2f922acd8bf@leemhuis.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_024737_170556_ECAEF11A 
X-CRM114-Status: GOOD (  10.68  )
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
Cc: Rex-BC Chen =?utf-8?B?KOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "daniel@makrotopia.org" <daniel@makrotopia.org>, Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>, "thomas.huehn@hs-nordhausen.de" <thomas.huehn@hs-nordhausen.de>, Jia-wei Chang =?utf-8?B?KOW8teS9s+WBiSk=?= <Jia-wei.Chang@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "vincent@systemli.org" <vincent@systemli.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 02-12-22, 11:41, Thorsten Leemhuis wrote:
> Quick question: is that relative to apply at this point of the 6.1 devel
> cycle? Or would it be better to revert the culprit (already introduced
> in 5.19) for now and reapply it together with that fix for 6.2 (and then
> backport to 6.1 stable later)?

I am not comfortable applying the revert to 6.1 kernel right now, it
is too late and the revert is big enough. Also it isn't something that
came in 6.1 cycle itself, so it isn't ideal to merge it as a fix this
late.

I would like to apply the fix, if we are able to settle on one, for
6.2 and let it get backported via stable to all the affected kernels.

-- 
viresh

