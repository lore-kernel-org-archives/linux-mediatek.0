Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB20C35FF3
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 04:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ozUpcCEWntr3v7+jvGD7rSS3mGlFfqxCVTsgZ2wgtA=; b=SKUywTl4/psd1y+1+VzpuVMwyK
	IVOGo60fH/PKqOAoQaWIGY0VH3nLjBvxHXY+VT4v3Z8ZJ9l2BGlssdbrhSNZmCYjCZKbfHG1I+xdP
	SxF1GlCF4Uw1H3WM0qbsZYxDlLtv9MacWpgUWqnkoOq4G8Ws81Gsmtp5svSYc7nSU1N6g8C/H2Aq/
	tgQhP4CjvA4NNU6ed1Osx7f2EgAR+X2ajOEGfh7aq7cUTluo48g6VX7oegQY4POC1AWGwT4OWgrqH
	Bjfpof1FrmrkRpTTN0T59I1Ic89HiyhdxacFop4LJEMpwgl2hxLLClwAHZiWnFUvsJ48CVHQi654i
	A0F8FqEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvUQo-0000000DqRP-3to7;
	Fri, 21 Mar 2025 04:56:30 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvUQm-0000000DqQK-2yi7
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 04:56:29 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2235189adaeso29582785ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Mar 2025 21:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742532987; x=1743137787; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ozUpcCEWntr3v7+jvGD7rSS3mGlFfqxCVTsgZ2wgtA=;
        b=y+ggMIIA02TPGvHXq5SwK7nM5LDZ4he5Zz6yajzu6hvbmuken4/uFnJT6nmw71ky3A
         2tWbIR3atZ1kOds8nWy1+Xj9sFRFypl0gR4FxpN9xjvjb2hyz6E5RT0p9rwkUAMTfOAi
         //u5mMdttwaQylAm24xLPU6faC1uXVHXmBhHnj5XdJ7LIgnT/N9JoHANo2snqGAR+qx9
         TVVgAfHOhfxWn4QtcKGs0ysX3+SOK6lN8D2kf3sd9eWvA7dl16BZDLCTeD0M+DkEvrrz
         0N9xm2pf0In71Xj9zgt+eUrnl4MFxoGsbZYkfRxTINhlgj4snEma4+IsIaqnTJjJ2K4f
         NLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742532987; x=1743137787;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ozUpcCEWntr3v7+jvGD7rSS3mGlFfqxCVTsgZ2wgtA=;
        b=pSgq5pFh9GN2nAheUmlOI2iDP7LX7QHtDQJNLNF1lS0asj9YWjxcLX3Gp5xmNUniWU
         fbauh6rhK57QoHwSAqk8Msq1LjkYg6/bOo/qZrC6Xl5a/LC+PF8RR5O5YOkP1dU8mY0s
         1TQEb7ZJAu36y5GB690xxL0pdb/KdjadRoLRDIB+KHhRtWsRAWUvFx9s9/5fIxduJS1N
         G11EAqFMxju0mdsczF8OiuiUKh+9+gK3glvFYFnFgvrsRjuiGILBOaKk2G7AY+5wbJDz
         pN8EVF7sQ4k6PCLMVFer4kmsUxMDGQXMWdawG2y7yTuPYtTPRbT8G5EptKjeJLED0kAG
         69gg==
X-Forwarded-Encrypted: i=1; AJvYcCX+LcafZsrJWhS0jlF3oKG+CHyaPoQlZCEwnzYsJP/CDCFn+/OXuYLOQHYR5Fxv1uC5ouK3f2ry0G6iUA8Qyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YylmSWxH6c7YCux6l0ATaghY1utNtAI6uG4EYkIJbF+oprvwDij
	UgiYMsQIpiRqKwwduyL6VUeFHv2XJXAmEvNoLvxmm/HY1di+G1xuLuyyXq2zjWk=
X-Gm-Gg: ASbGnctUNnjYh7O8OvQOQxW2Y90laZKJIgx7TgfGl0llnWgIH6ELjQFTqgNSyQ8RFru
	VzIcoa3dY/uljmB9JL0+HzIp2ptKaBaEpBvJ5DdKEc+57zhkIpTJQte/ExshQNpwRHaQH/pTLBo
	5VHcC8EtN1K2bqQnjR4CZem7oxw80WDio90Knh5wTPoERPWMMQp/ovO8dhKFvGSM4B3KUNaxWOH
	1QwkZZaOUSIx88d1WvhHZXJTzC927xof8xQajKg6u7pYo1ZKPA5J96dP4IcxIEoQ5ZPNR5kiDaH
	7PyMG5XQ4HHD36Evu1Bz4hoR/7tS31GDKtR/G7dNyfJiDA==
X-Google-Smtp-Source: AGHT+IEfZE88rs+io7iiRT/X8wJSM3aPVySwMLCiKFphdme5Nr2cI1Z/rOArrzthb1zZgjhHnKW+8w==
X-Received: by 2002:a17:902:f646:b0:223:807f:7f92 with SMTP id d9443c01a7336-2265e743880mr104023345ad.20.1742532987264;
        Thu, 20 Mar 2025 21:56:27 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4d5f5sm7225665ad.79.2025.03.20.21.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 21:56:26 -0700 (PDT)
Date: Fri, 21 Mar 2025 10:26:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chun-Jen Tseng =?utf-8?B?KOabvuS/iuS7gSk=?= <Chun-Jen.Tseng@mediatek.com>
Cc: "cw00.choi@samsung.com" <cw00.choi@samsung.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race
 condition
Message-ID: <20250321045624.mwm2mnkqeow5uids@vireshk-i7>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-2-chun-jen.tseng@mediatek.com>
 <20250219054209.erwfp7sgzchaiuds@vireshk-i7>
 <e8337c5eee0cadb797bacf26b00f1ca303c5147f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e8337c5eee0cadb797bacf26b00f1ca303c5147f.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_215628_737771_0E88EC47 
X-CRM114-Status: UNSURE (   9.78  )
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

On 20-03-25, 08:22, Chun-Jen Tseng (曾俊仁) wrote:
> The struct mtk_cpu_dvfs_info instance is per-policy and the reg_lock is
> also in this structure. when I have two "policy-0" and "policy-6" use
> the same mtk_cpufreq_set_target() function but the info->reg_lock 
> is from 2 instance(policy-0 and policy-6). when the policy-0 and
> policy-6 call set_target target, the mutex_lock is locked by per-
> policy. So, I change to global lock avoid per-policy lock.

Yes, that's what you are doing. I am asking why a global lock is required here ?
I think the per-policy lock is all you need.

-- 
viresh

