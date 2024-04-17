Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C07AC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 08:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUPDHuJgbEhcxGrf9RO0YvQKRqZaKvY08c3XMxThMtg=; b=l0wc/toj4fS5coxg67i3DjQg46
	Z6UwBgYFReDgqO9elqImEifhVw870n8kWW95OaYzU3LrmrgzqWR3Zdc9b4bKemR1ikMyYMDlOPiaq
	yPgthBSVbcNwf2CUh/GX1jSBaw4bltEKcFFqPGPudZmcehsHHdU7w7HaAjS165Wn5O4YiZZr8G1S1
	RTKY1a/k/T+HI7nESwdbY7WQTKx/PFR0aaHhKe6XXPchHbl5IHnj3ZA+73KEiuR6DsJJfTYrRe21a
	wS3aMRNny/42LyJYooeXe6GQvblCZ2+MzUPcitdXPCK6zIEjlBdc/YGeuDnO6vugQgjAGzb0SkAuB
	veAOEnqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0uc-0000000FGRD-3ZXn;
	Wed, 17 Apr 2024 08:45:02 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx0uY-0000000FGO6-2tVd
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 08:45:00 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso4990334276.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 01:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713343488; x=1713948288; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUPDHuJgbEhcxGrf9RO0YvQKRqZaKvY08c3XMxThMtg=;
        b=vlBnT3OFlCCfA5M3fPwu6VoXewty4GFWwX2b97WGNna/Mf1YyNeH4gxbtHOBpqhn34
         Ms+GU5M7BTVjFjZxe665+SyAzXYHF4z4WA9A1C+0zR8h9RRehBOs4UzAGZ8Z43sA12Vs
         ruvHRzVAN1M3nWwqAUw9t6o1wSI5u8u93Bk8nDYhORUT8TXrVNIqapmkqTxdLTJv5ykB
         jAhtsUFiH2vKQ0ab3eSlLbkVIeqH2hL6I9R+Kc/HkwZIeSOInPbiylEWyxIOdVonEmjq
         oxG/8UBJUd3DVPVyohCrMRiSFHIbdBpoSC3YNH8sEs4xY2cN9ubK72YrHyfMlsmp+7pZ
         s+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713343488; x=1713948288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUPDHuJgbEhcxGrf9RO0YvQKRqZaKvY08c3XMxThMtg=;
        b=k3IwOBcLcIPKXAPVp/Z+32Re1o1YQBevf2xrfmoPbmtKEAz/sWZpKwAtjjr0M7sYZK
         kOPXUx+ktYljfSmDrb8OwOfLRzvBeAOUaZIV88xRpIyWZ9uIlBFm241pvb5qfbZDRCEc
         l8iDdZJNxCwT9ZnNTyTyzoxQqk1Q/hnSau6zSPtvEhggbhjY2+OJNqEVNXy2mNP5GecB
         T3mUTP1w8ibWaY9Oxw7JhHhhgL6QrdLcoyUaw9iWBB59FuhYsg0T+qGdVq6XyadUqqzP
         RF3lOUreyOSjpKayh2/T4D2CbLvqWgp1T+39/wZ8Y80aG1U4shNWwvvttmi8a7krna0n
         1T+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwrJLK2hMWsJph5pdSXkS40Cgwtsd4WQObtnot+7JJ2IKwfyA3Q9NhLrayYSQpGfJ1tvDz3W1op+T7Rm31ZYK2AN3tjOx0Ox8+8ZazIQBwAZss
X-Gm-Message-State: AOJu0YxGhsmSbP3TWQxw+Il8XskguY8LJsUzwO7VEGmSFN3CvrwiLwdE
	3yILXbgOMbGQnq7byfD9SF5PmFjwKCJ2fIXUSL3Uqt5sOU9hpgpAGwMalWHEIzNqI2il2ufPIkc
	5mFWwuXC0E405/VdguM7CpXVky5A5dw+yoBiqWw==
X-Google-Smtp-Source: AGHT+IEqHMRvom0iWLGcDMIX6MMDmGJuXm9C6a6p3VWgXb1lMC9v99HG9mosDP74t16pkkQoXUvXtUBwwTi6W1xBvYw=
X-Received: by 2002:a25:ae97:0:b0:dc7:140:8c0c with SMTP id
 b23-20020a25ae97000000b00dc701408c0cmr16434750ybj.23.1713343487742; Wed, 17
 Apr 2024 01:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240411064614.7409-1-krzk@kernel.org>
In-Reply-To: <20240411064614.7409-1-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 17 Apr 2024 10:44:36 +0200
Message-ID: <CACRpkdYDDJ9g5iSZvi_4pPdH3LWNd7PHS4QP5mkt2q+O+t_FAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: freescale: imx8ulp: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	zhanghongchen <zhanghongchen@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_014458_764121_1D562E63 
X-CRM114-Status: UNSURE (   7.70  )
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

On Thu, Apr 11, 2024 at 8:46=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these
> can be built and used as modules on some generic kernel.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

All five patches applied, thanks for fixing this Krzysztof!

Yours,
Linus Walleij

