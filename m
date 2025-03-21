Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418CEC35FF3
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 06:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmB3zEarsAJrwCcZCi/AJVx4uS/XYfMGLk5IAPZ3kC0=; b=36jxh3dKYbeQMkTknWR57GfTfy
	L7aJGL6wxMVUVqyq+3p0XRITJtK6CJamGqTFsb+x+mGApwgBHOr4U6aJdR3rgP/IFmedgxhR3/hSX
	d1PBIdRy8xP3vyPg187Fi0bVG1bkgqBDqwzf0AO7S5Gp7L0BdyQXbn313NCoP7LGdF/LN6ENkHdkc
	8mcCFILZELsm8eM8JBWeO2mOzinHsMOLN9IExeaKELpZcO9QVzS8sp31RReC6qU4fzOocWxfXxId6
	z7Tq7OqeUNVxQOCpv832BVFf6kmUH3iCWzPB/4+D4NgryWkAT3jr0LYQm/0b0++ufkA25hLvgWLU8
	d/dB2gdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvVS6-0000000DwOE-0fkh;
	Fri, 21 Mar 2025 06:01:54 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvVS4-0000000DwNF-0sB7
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 06:01:53 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2235189adaeso30209195ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Mar 2025 23:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742536911; x=1743141711; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zmB3zEarsAJrwCcZCi/AJVx4uS/XYfMGLk5IAPZ3kC0=;
        b=BN0HQa2IaCfrfhfCJcFRGyK5zEV6H3ERcBoitR8SOLvMdPVwASWxif45x5MCXZHp9a
         dnaB8xW9TQbGImieP2XX/8GP+yu8ixsyUbm6ohsCJiq9SBKOhVvkOLfNjo6nwsB2d5Tf
         PklXWUv/yLjyEfIlNJZA/PBEP30ZTExuAiitewhzw65Ecx6GP/YuLvJxYZM7I89rZus6
         o8IulCJ+Pg46mSzHKqX76IiDw/OceuIwiw48mhiXzoHfiX2kA1sX43/d/lKaszCIc1p1
         s6cjBKxrpAZmm8Bxj4rXiiT82x+H/zXXcJUJdSDXMX6eMzHOGQr2mOCVEPrTW2GI0qHN
         bkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742536911; x=1743141711;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zmB3zEarsAJrwCcZCi/AJVx4uS/XYfMGLk5IAPZ3kC0=;
        b=jSOQBYsJnWeIEHCWMpAL450tu3c0HnjGTB2cIEPG7PxToxNxcxJ7Tq75oiabBWcjbN
         LbqYGC4id9SoqSDuQChcdkCFDfgI6kUZVUCTT6jrBffycGO6Z+BEkMfZn8O+f55siIg0
         lY6sUb6rem9GZ1WtqQloIwCFyG64uOHIRzHdokHb7/fJ833wGoPcyzFlST0Js4hU/s6K
         OGV8hUKBsO0VikNjaPvoqgQYoiixZl0Ir2TuqUX1tLDAMYjvz/iyjkTEN8rtbSxfPeg6
         2dD/qsa3lnxwXZxu7vkjOKtIlelDt21vwuIV8apY1h6+J7CudXq9Uetyny8VXiJc9ked
         hwyw==
X-Forwarded-Encrypted: i=1; AJvYcCVjHTFDG0rMfNlIHAUaBwRw8QyGbiQERrcTa+C1PoGAKBK4MQEn9Lx4hUjAs3Mq9eSVtWBgZARmi3MIqmEbXg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yybvh6BjeQmWW+VlDgC9jYnrebvABLI05Um0vE7uhAmVjs1K2lQ
	Q5y7wqnDQdIB5tUWDiVTZmF9i/CFDA3QaVV4I0f1y4uWIf3bXasAEH5ktieBxTU=
X-Gm-Gg: ASbGnctDh/PVJinJvNheKtC+WJFjAGv0n64jU5VWfh9LqGwGELb73Wzrw99pEAB46kh
	tDPiMXW0gM/0xRWCGNqsPtkGr8R+hG6KvJuaYbKZIOy/NUHDlY6W8wkTts5mUTKlOLO8oNys2zm
	/5YnNkDYlEI/7yMkIhwzvQ5EYVATc2GvT4LnxnTKaNrKUi3jOjzsFOC9qGnwaiV5aUYeXxOKcW3
	zSh9AmnXS82fn7HEUQM7ZZrkg2zcK+70oj3MWaGNPYzw5byKgbKXY5JBhScUdeKOGYLRS2219SO
	jo4w2MGAlnKvCB5RSOvWMpXxzc3fqFKcvB82Z0FeyHXa3mAvbYEWB3q/
X-Google-Smtp-Source: AGHT+IFtVqF1ORKmDSsfR3TArM9faGSxKWG+5TBHlY+RPgM/7ilFPFIlu4kDkXwHLe/srNdTiQnoFw==
X-Received: by 2002:a17:902:ceca:b0:215:58be:334e with SMTP id d9443c01a7336-227806b8e47mr42530375ad.10.1742536911081;
        Thu, 20 Mar 2025 23:01:51 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811da89csm8204645ad.193.2025.03.20.23.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 23:01:50 -0700 (PDT)
Date: Fri, 21 Mar 2025 11:31:48 +0530
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
Message-ID: <20250321060148.adhxjexpnm4dkpnt@vireshk-i7>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-2-chun-jen.tseng@mediatek.com>
 <20250219054209.erwfp7sgzchaiuds@vireshk-i7>
 <e8337c5eee0cadb797bacf26b00f1ca303c5147f.camel@mediatek.com>
 <20250321045624.mwm2mnkqeow5uids@vireshk-i7>
 <2a73b5ca35692c8ffa68c9ff0df73e24a592967d.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a73b5ca35692c8ffa68c9ff0df73e24a592967d.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_230152_253925_1AF2D752 
X-CRM114-Status: GOOD (  12.01  )
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

On 21-03-25, 05:32, Chun-Jen Tseng (曾俊仁) wrote:
> I add a global lock related to the CCI driver.
> 
> This is because the CCI needs to obtain the frequencies of policy-0 and
> policy-6 to determine its own frequency.
> 
> If policy-0 and policy-6 are set simultaneously, it may cause the CCI
> to select the wrong frequency.
> 
> Therefore, I hope to change the setting flow to the following:
>    policy-0 or policy-6 -> set frequency -> CCI receives notification -
> set CCI frequency

Can you please point to the code where this race exists ? I am not
sure I fully understand it as of now. If the race is present in
another driver, CCI ?, then shouldn't it be fixed there instead ?

-- 
viresh

