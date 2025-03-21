Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6337C35FF3
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 05:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jU1uq3ftdFeUBHBrd4FxFBQmvi/x+JX/MfO5OssoYEQ=; b=PEBPbNnRywHlXVnIE62WMw0QDQ
	viXFvopUKfZCZ0xO20rY1IdiNvY4zciAp/UeIeDL9esMY78x9X5LP5gcpPM3q8yazKC/El226TdGl
	L54R+w5VRE7eUk6V2ApxPOAuV7BiScItq+z79mDf9J58CNnu2z2AbMBDz4SxX8NftGsqh6cOWR+1o
	TLSp04UE2d0EbxWYH4cnDDZUroe2lxvkcIJwrK0muFbOEQElmVjMttgM8GQ07oUFxCEXPY7jnXkj1
	jbgUuymLfpApANgI/vj/BZ3HpM5mQoO7jRsdyB2UQcPrdN87YfkwvnyH5KgmVvQoamzJB+TG7sf6+
	eWKG0q0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvUVd-0000000Dr8S-2tDm;
	Fri, 21 Mar 2025 05:01:29 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvUTt-0000000Dqqd-2fbX
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 04:59:42 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3014678689aso2309022a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Mar 2025 21:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742533181; x=1743137981; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jU1uq3ftdFeUBHBrd4FxFBQmvi/x+JX/MfO5OssoYEQ=;
        b=g3LdDs0nt7QSk6qCXm+fJQ+1xH0VEHT7ifls4Px1hcX5R7swzViOuP+K9Ek5mFD4Nn
         I/97/AmTK6DnEC+jQLkIoQ+HEYGSQDhg23CdWvJUZj73OCOKFdTqy7U0RV6EfPkbMJbc
         BTLbah1zLhVeOPO5sOZ8rMJiTj3x3YJhvi3FDZNQZm5oh6iAtq7xpBPwbpjRY+VgpJfy
         uXlZQmGPeIrSblNKWhlML8slcpMjja4ggJy8oo9PAdzAKk8sSOsNNhI+85DudoMXruW8
         7QMYDTDstGtkEEmz3QAAI2L+hhhce8M1RQ2A7AdXvwg3GjRM9/x/SfXxmPFI/R0jY+vz
         rhoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742533181; x=1743137981;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jU1uq3ftdFeUBHBrd4FxFBQmvi/x+JX/MfO5OssoYEQ=;
        b=HJyw+8qn/46y02pyajEA3ze1jvJmsMsB96gb/GhorqJNX5P7QgRsF3VLcQwFJDQmk+
         gi17mFOQ8OBEyuc+DsCpMDqeZvEb+bc2D71kU22HS5HKGdHgy3sBhswP/1mNVq3ltYQv
         IW4VBQrcCU1Eb4Z1IHKoIn6nlKCir9rYgoxiD0zNhhCb/1bIXuQvkBK1FrpOLD7NcS1o
         2AlLoLZvT/i641ko9pLPrIidnKZ9AT8TVxr5RXo0uu+zf2gZvrgdXiBafVlNBY8Qivc/
         e0dy0ebVP5R+4xErC9MLs03yi1FrpnzIcS/uwUpE+RHjQiAd1EkgtxnKwGgGbTs+rpG7
         WWYw==
X-Forwarded-Encrypted: i=1; AJvYcCVoJhWKwyki9XJnxbC6O8tWiarqY1uVZFj4PhExlEGngvJrVFjXMzf5SRaxN9IQ6WaV/yICI64khuPXqQVSmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV+Fz83tV2n6urDyPUsED537kcnZcwtfT/x66By+xVbcdpxZ7m
	Sk3qXDqBn/AQacNy9HnAQk/XlkWzYfl6NV96cY0pg1BVGe7PAN8Ov9kYulMjpFc=
X-Gm-Gg: ASbGncve3LMH1mqHpaB+KCyzs6WmxepT4ffCyeiQXD19IOfbVURs5WaoUpdP+crX0A5
	Sm/ctAH/i4xtdDHRdwJimzAt67vroFdTA022eRrNzata5jtIwde89UP217MaZpTDxV8MuQ74Ym3
	l5wHwdetQ99GfPdY6leKA5oNxrQ9bKmQ8/o5s9DINoLsX+V3tdie139o81560QxwB5v6t5mOjYl
	1TvSRL+nE1EZqUHIjD0r+XKiI2JiAdn8PjAqG0cPHwV/eSBxWOWFmdbi9aOJdHgAdUvMZyAEMp9
	k7fxQOPCVPHcNX5oJ6ryE8qdBlEGE/AmIkuRO9ACAp7+Mg==
X-Google-Smtp-Source: AGHT+IE1MkhF+eIlYdPjXH6Mh2gvQg0KSwaX+hGGWKTe/5F0qYgaHVHgqtmttCIIq/1Wqtv32WWi0A==
X-Received: by 2002:a17:90b:3912:b0:2fa:e9b:33b3 with SMTP id 98e67ed59e1d1-3030fe56ae6mr2439451a91.6.1742533180745;
        Thu, 20 Mar 2025 21:59:40 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf59e2desm4949374a91.23.2025.03.20.21.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 21:59:40 -0700 (PDT)
Date: Fri, 21 Mar 2025 10:29:38 +0530
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
Subject: Re: [PATCH v3 2/3] cpufreq: mediatek: Add CPUFREQ_ASYNC_NOTIFICATION
 flag
Message-ID: <20250321045938.6gnmtlbdcx2i6gmw@vireshk-i7>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-3-chun-jen.tseng@mediatek.com>
 <20250219054543.4xt4tixsauwoqpst@vireshk-i7>
 <21e1b622c2968a5549b2ff37e4ba329a557968b6.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21e1b622c2968a5549b2ff37e4ba329a557968b6.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_215941_674629_52BE1339 
X-CRM114-Status: UNSURE (   7.40  )
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

On 20-03-25, 08:34, Chun-Jen Tseng (曾俊仁) wrote:
> For CCI and ARMPLL in different driver, I need to change ARMPLL first
> then use cpufreq notify CCI driver. it can avoid CCI driver get wrong
> ARMPLL frequency and choose WRONG frequency.

That flag is only required if mtk_cpufreq_set_target() isn't able to complete
the freq transition. Which isn't the case here. I don't think your patch is
correct.

-- 
viresh

