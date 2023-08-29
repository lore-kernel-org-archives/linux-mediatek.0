Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDAFC83F14
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 08:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXu9S/AlFix/yXovuYXYyWown8pXs4G9/o2rQqvLXEc=; b=piBuXVRXHX67f4MJzrJuaBJ3I9
	zpXHnwtLfFqG4qro4A4Mv4X/un6Zo5yAIedsycKacqyv8HIDbNkVdudIBoFi8mh4LDjAm5Sex7oeK
	Wpe4F66Z9EUMisvtFBzxOjFbMvpOmkg09z14HVOQJ+ehTH8WeaEDVf5wRKdZKNTbRHSD6ZyLGTP99
	Kn4qSr8X8i84wDiBIzgdLs7PMWt4HH18hV9herlWxaCj15Gxv+m23e4hVaXjElyeR6QDyAzRQTQFL
	+onuXVP2DE+rvhsFI+BmAr2m4o9auX2pXqS6YzItxfBd2H58kRUibpUKvY+R5qgxJNJybq7E2V7br
	vucLBBdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qauCA-00B2nZ-1V;
	Tue, 29 Aug 2023 08:35:30 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qauC7-00B2mu-14
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Aug 2023 08:35:28 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c1f8aaab9aso7755665ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Aug 2023 01:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693298124; x=1693902924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pXu9S/AlFix/yXovuYXYyWown8pXs4G9/o2rQqvLXEc=;
        b=xtn+f9n7JkMpbNlw4BvM8/pHcGCB155ZgJFUvAof5g6dcnmc/DSKGPEe6Un/c4vdIP
         F39yXeIGWaAXk0/DcXkWJhWR+ODo1Ru90pEjpbOMBbf1VpMCUOaJi5iLKjkLGsjgGfnW
         aavuN1+jhiB/nETrdD61Qvyi1y7eTiyvdwVL4AwrzC7/ah9ae82rqY/4+pr55zvAp0eN
         kWxBZUq7YbnHgAcpg/Z+P7ToN3dQKrOBfBrss0K1pG8460L9RkuyQJB2+1VGkk0YqoGA
         MFtKVy3zqLwRZJ0VP5HbdegC0s18xCza7pQD1PE1eilTjeQL4agYg3+ReLDov1lYLaZv
         SD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693298124; x=1693902924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXu9S/AlFix/yXovuYXYyWown8pXs4G9/o2rQqvLXEc=;
        b=fLqn/3eTgSMqcgfuLziqEOcNlNuOQ+4SkMcw1Hcwt+v7y9+xnoUVnNBDOgJEHfitnz
         5qKpJuVgvMKvALn74Yu8RmRNBzQkeljzrp1jukGy/smo8mgGCq1MOzNsmd++TR9ghHsE
         r3QaJxXZ9hy5vu6IXHbWp0HXgpESIyMxb/HaVmrJxocOFB3D0iXjJI/+88ixL41vG1WC
         v7HtunxWThCxbhZepfTX9sZqC+G/gDeZvGbGtEfzlZhI6YwcbGjB+Qjxx99LafoOv7Yp
         0ij3hY9ppZo8yDTfOnpJVnqOJZD09GiVqzQuGuLHOSbSCyTZbs5wYtdKi6L8OfhzCCJA
         y1Sw==
X-Gm-Message-State: AOJu0YxT7iFfsRPMjEULh/CN+YFK6wGQ9QkM0J58gZXPnTWP+ocHjJDV
	x8BjEQHWB7QcriEBCZACAGseTA==
X-Google-Smtp-Source: AGHT+IG5T83K0W6KstE98X3Y5HO7B5EQWBAbQkIAQDRtjvXz0qrzINfcG76M1L2nByrIYzfZ1/0sDg==
X-Received: by 2002:a17:902:e88f:b0:1c0:afdb:1e6c with SMTP id w15-20020a170902e88f00b001c0afdb1e6cmr20688639plg.8.1693298124327;
        Tue, 29 Aug 2023 01:35:24 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id y1-20020a1709029b8100b001b86492d724sm4331852plp.223.2023.08.29.01.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 01:35:23 -0700 (PDT)
Date: Tue, 29 Aug 2023 14:05:21 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chun-Jen Tseng =?utf-8?B?KOabvuS/iuS7gSk=?= <Chun-Jen.Tseng@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"sumitg@nvidia.com" <sumitg@nvidia.com>,
	"sanjayc@nvidia.com" <sanjayc@nvidia.com>,
	"rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] cpufreq: mediatek: change transition delay for MT8186
Message-ID: <20230829083521.trec3rjjmscqp2dw@vireshk-i7>
References: <20230818020616.4748-1-chun-jen.tseng@mediatek.com>
 <20230828063904.r7huxclehlblkkjx@vireshk-i7>
 <86f49ce84f32941185c961da8a5c671e7aed46b1.camel@mediatek.com>
 <20230829071022.n7wubb2dhbt3ukyk@vireshk-i7>
 <d0745e1cee9fae33252bb8d3db741c2a463983d6.camel@mediatek.com>
 <20230829083154.27ckyuwnqk4zpejs@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829083154.27ckyuwnqk4zpejs@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_013527_397463_0D834547 
X-CRM114-Status: UNSURE (   7.68  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 29-08-23, 14:01, Viresh Kumar wrote:
> Why exactly does the kernel crash here ? Any idea ?

Also note that cpufreq core has enough locking in place to make sure
two ->target_index() function calls don't run in parallel for the same
policy.

What may be happening in your case is that you are configuring a
common entity (CCI) from both the policies and there is no locking in
place to take care of the races.

-- 
viresh

