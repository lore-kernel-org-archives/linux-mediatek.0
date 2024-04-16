Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD36FC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 10:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zm6MGDUL0CYtN0eVBnWYXSq+qBMUlxWdujWqgjIPSpk=; b=xKPQjuTPD7roqqZfW8LGreoFDQ
	XNAhpr3TwJtXr2lxTuDkv26ufbJMLmS20n7gAJKk1maG4agqCm3iMuLln3tld05cxTnPFaDyeWCD7
	AwYWWC1j9jv/QN6wiMXF4dgjeQ4vhMr2WzZmI8zZAR9R2QzcR3eajUTluX0/xVLXIKsQzN+FRTKf3
	+9v+sZT1DKnATeE5QqZQitHwD+/dxTvlR+Herdyn75A8I0S571IPoi0dVFjdDcBz7IV16/7aMRIPi
	JtLhJk5xVHfnSM9Rf3pAzqUoCKML8nkJl3XMsubEK00JhiTmJ36zAns9FKCJ8ccz4QYK0ANDl6fVY
	i4dDZ4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwg2c-0000000BmJ5-073Z;
	Tue, 16 Apr 2024 10:27:54 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwg2W-0000000BmEz-0dwb
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 10:27:51 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a5544fd07easo60547266b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 03:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713263265; x=1713868065; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zm6MGDUL0CYtN0eVBnWYXSq+qBMUlxWdujWqgjIPSpk=;
        b=XhwcI8Phzqrkal07nF6otoXWyNzw6rihVoScxfxfIs0j2Nk+bnmqJIaBt6HkuKOZWj
         l5G2XuuaVwzXupRp4X4jNtdBxhKnAikrfR/kQ/wC6qDuq6mDNjViDzlVJUtS24Pm8p1p
         U9ilF3XGiGT+26wl1r0MnNbuJJTijOGFQXY4866Odkzle8QZmc5YfCzyiOO9DEILptO8
         L3uDEsrEu/d6UF61IMW4nQACZw01hAoN7i3magTBiT6N2JYIIY05Fg+6ppEBp2RgdZr3
         +UNoJZKv3j7QQ+FUxC9IdtRZoZkUnCwCUx2w3capHbPU5D2A7R/oA8X/CMjQ2T5Zr+pM
         WTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713263265; x=1713868065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zm6MGDUL0CYtN0eVBnWYXSq+qBMUlxWdujWqgjIPSpk=;
        b=HrZi/hEuJBQFwOpT59z9dMowHLiE6mfVn4FV2DyPj/muUMJQw9UKiXNOJihhGMQscI
         sP3XicKnRzEaJ1q0qsh+PC0KWvUHxYl/f9/VXJ/RXtEHys3zcSdZcQTwm6PBZltEwqG8
         cM2Bww7OSvtHvDxmu6wxvuPnKFZlCdYJS+KyWh1nVX0meNrGe9ssZuYwTIkg77Eqw8KL
         QzlJddPrgN/ggl9vmCHuVkUrVlny7rdTNz4/Lncxiu4egmWbkB2Dgaf7yZzV/pHCWCEg
         Jnmf5ulbVtMYw5GSTabYhH9RZsEqW4uqur6hmoSc//3czBBlmn70JQ+J5WyV0otL0z4h
         4Gog==
X-Forwarded-Encrypted: i=1; AJvYcCXJATbJ1lTi55zgYMWEwTxt7geLtVw2j6KZ6GUxuX0Csq1Jz8svVKEMEWkU/5nH0OKvGtk3DPUK+Z9Pke+7n1q/tec4BqrmBmKTq5tJzV5JfKYv
X-Gm-Message-State: AOJu0YwYR8R9cpJu6Y4v62PfvVGYc/W4JL5Ys1yjq9lIcEZEMR6uJjft
	limvmyOOWCzWeUQL/V4ssdlNv/pzfrE72dbrUGo/+vUkK/5bq6dFVe+mkSMHWGc=
X-Google-Smtp-Source: AGHT+IHeCLt5rGanImY7XpLmlFa8tjPTvv3rQXuFC3a0/nphBsid89J0+cxErThPuG+j2psO/RLVdA==
X-Received: by 2002:a17:907:7d91:b0:a54:1c55:7123 with SMTP id oz17-20020a1709077d9100b00a541c557123mr3390435ejc.73.1713263265187;
        Tue, 16 Apr 2024 03:27:45 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bz2-20020a1709070aa200b00a51a9eccf2asm6665593ejc.125.2024.04.16.03.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 03:27:44 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:27:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 23/35] media: dvb-frontends: tda10048: Use the right div
Message-ID: <7a8d403b-8baf-4eff-8f9c-69cdcb8b2180@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org>
 <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_032748_461036_435D8BE5 
X-CRM114-Status: GOOD (  11.97  )
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

I have created a Smatch check to warn about code like this:

drivers/media/dvb-frontends/tda10048.c:345 tda10048_set_wref() warn: unnecessary div64_u64(): divisor = '0-u32max'

regards,
dan carpenter

/*
 * Copyright 2024 Linaro Ltd.
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see http://www.gnu.org/copyleft/gpl.txt
 */

#include "smatch.h"
#include "smatch_extra.h"

static int my_id;

static const sval_t uint_max  = { .type = &uint_ctype, .value = UINT_MAX };

static void match_div64_u64(struct expression *expr)
{
	struct range_list *rl;

	get_real_absolute_rl(expr, &rl);
	if (sval_cmp(rl_max(rl), uint_max) > 0)
		return;
	sm_warning("unnecessary div64_u64(): divisor = '%s'", show_rl(rl));
}

void check_unnecessary_div64_u64(int id)
{
	my_id = id;

	if (option_project != PROJ_KERNEL)
		return;

	add_param_key_expr_hook("div64_u64", match_div64_u64, 1, "$", NULL);
}

