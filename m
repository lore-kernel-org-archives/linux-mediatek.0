Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EFCC001DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 08:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78OX4fId0Em709uz0mp6uxgk8bb4IwlDXBz/uTj2fjY=; b=UoIDuJzSz4yckRNWJzjiEJvfyX
	Mt7fHLPg056P5SdAotodVOJ5HziREDV5hUHok3O5IesJGW5yoXU/gPoG253eQHedOWqW46qGK5DEF
	nKZeioxaAijDmM2S6UNxzStzjVyAqKjyTU+igkn910UajZ0zbtjIB36sNN6rHWfYinAhsVfjrDhqA
	Zn6tf7HHYE2LVCizIsawr+nw3Rf9Pw5EbGV9zyEf/xVkrHVoP2CfPwiJn8WB/cHFGLLo0jzz3kIyq
	r0m5RcD5eIUvBnhc+v92lDugMHMVx74qP5ZoA4qKW3NS9mO2HjDorH8IoZQJpMgKhGymSEav6H1UG
	Zh1Ospng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0t9-006rPI-2W;
	Thu, 10 Aug 2023 08:19:23 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0t6-006rMy-1H
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 08:19:21 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d07c535377fso602017276.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Aug 2023 01:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691655558; x=1692260358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78OX4fId0Em709uz0mp6uxgk8bb4IwlDXBz/uTj2fjY=;
        b=YAetKf4q0nZa/dO71z7++J7KKpe1E1CC7O3ahafQ7APpHv5jmvyn5BBv2mwDpYC5is
         aCqkyV5eahWJcbkNVk0H4ZuATN+jOIeGgJTiNul2i5t9tXVMigNJA6VlxX/a8OMvNSIA
         YaLs/IE+usEOobqLkPYKtN3CknTSd/aP7iBrjDMEftqOkGi4Hzn8W27JugL/elhtZAtS
         lvN5G1ptPirqDO85jdOp47BWA9MJm/z4Kcuzuh6yVL2pnLpcF/Uw4mERq/Siv1vZ2eMQ
         WGKJAkQHqeDReRN5me9rxTKini4wIOwCZjirxG0wunRnpyvqVfZs1EDQzXiZjCK8xLxA
         VFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691655558; x=1692260358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78OX4fId0Em709uz0mp6uxgk8bb4IwlDXBz/uTj2fjY=;
        b=V8lD5qNTHgGA+2kYK5sAssqzA8Ww7KSVSZxJ8FOWGjtFDrMNQiIXqqvkbVRi0FmIM2
         BdZJi91KbMFDy21yeodt8/jX1LSdgDnwKcIlVBi7su9UaltpS9tk7bA90of6AHu79buu
         4VtFlZGG0WoSut+eRbN6MRJiQJOFp8Arm/OsYX6BlysHmFvrmL+gknw88mD3IlbsjwO3
         4aGb6rErblhSaC4W7uk7hon0Q/3WMcD12jVheV7S/HoH2WCAtv2lQuiVsUfIjIOVHNLO
         YLQ+LjWSLr2M4Idg76Rp6eJZ1YhKRdhRyVQu7rYDpGHxtYfKDwPBxIL/dQakV7xXTjjP
         jeAw==
X-Gm-Message-State: AOJu0YzNIzOBNUiMAOjdRX44C46+mcDkfE9BGAiKbpPfD9x2z6yxjlDJ
	LKep5IsatlKdTY16wFO6gKDaPUtLh+Ehb17wGJAeMA==
X-Google-Smtp-Source: AGHT+IG5aWoH89NQGXx33HlD2q+rxamc3JsaObqeeE5H8gH+u446bjvEEFYnXEHJg1VQn5y6v1yXRNGsOkfTWSlQZaU=
X-Received: by 2002:a25:d711:0:b0:d1a:b59c:502d with SMTP id
 o17-20020a25d711000000b00d1ab59c502dmr1894292ybg.18.1691655558135; Thu, 10
 Aug 2023 01:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org> <20230803-dt-header-cleanups-for-soc-v2-13-d8de2cc88bff@kernel.org>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-13-d8de2cc88bff@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 10:19:07 +0200
Message-ID: <CACRpkdYsdKCrQpfoXZFv1XqT-o1skX=TDY-WJ1CSpgavMb+UrQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/23] ARM: versatile: Drop unused includes
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Jean-Marie Verdun <verdun@hpe.com>, 
	Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Shiraz Has him <shiraz.linux.kernel@gmail.com>, Stuart Yoder <stuyoder@gmail.com>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jay Fang <f.fangjian@huawei.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Michal Simek <michal.simek@amd.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>, 
	Qiang Zhao <qiang.zhao@nxp.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_011920_435718_A002B8B8 
X-CRM114-Status: UNSURE (   8.89  )
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

On Fri, Aug 4, 2023 at 12:43=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:

> Several includes are not needed, so drop them.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

