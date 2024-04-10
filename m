Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BE5CD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 11:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ra8MqABUlOl1F1GvYEqoIx/qdULUEJYa2n0fQ+JiEh0=; b=0mE9WajeTiXyQxrYV98yd+jBKK
	oa/ENPMtIUdbI2iDbT2LjQgv370I/wdh4qAFQQHHQ7F7s4g+lEbFrFQfCODZLVmgUYPgjW5g03pl5
	xgUZRfL4jTvdx1LIKiAz61rJFOXIKZoT+c9oGYi340h4KjAXBt8C8UIdQFZ610WtgJVTiK4Vx9T1A
	TC0KhpbVw7Z0ANUWHaXHlsAIXgTk6zSrsY0YrhE7zJ5erpqvplQiq8nPuF8s03ouon442fASjzU/f
	wQASgTpaxDVH3hQSN6i2qXIV2nkKGQR/P+hFRwsZBIyAsKOqT4FFtcC+eWFuPSl3xd/rA+pSmZXBk
	El9MpnWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWPb-00000006hvd-0b3h;
	Wed, 10 Apr 2024 11:46:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWPX-00000006hu1-3gcQ;
	Wed, 10 Apr 2024 11:46:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2460361B20;
	Wed, 10 Apr 2024 11:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD838C433F1;
	Wed, 10 Apr 2024 11:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712749598;
	bh=H+ltWJTrCo8dAkDLOHCnfTU9X055aYq6FerReJVEQU4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=un79bBkjQtiu4AXFOuqBWUqWrKE2NrFzeGsyS95un8gsOWKrNwi68LyD3QDVNt0IO
	 EtxnioyHKJTNi+5XwUcsKAKNx4S6INPg19wpewkK1a6UHsk5l4BCmJE8MUMEEdYdHg
	 71J1gt37MMHtRoxn4moutl9B4nae+Jyyrra8Q6JF861KLQKyoFPiWJoltflnZvJzDx
	 UEOayzkdtu/4gwD8IKI7MSn8rhZRSZE29K8YSIsxXZ7fA3P7vI6e4bnPbT8lHJDiTP
	 y2b6plHjubqUgyymeXg0zsTpx8jq1CP5Npw17xRmIE0CSSMQ8vBjPUXYaB8rGzdtWm
	 58uTyM+gbcW9Q==
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc6d8bd612dso6791454276.1;
        Wed, 10 Apr 2024 04:46:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnD6kEiFAtVPBpzOc586yCtgmKLohoVig6wR30yz33Q/2XygJx/nywKEfuxdeAwWgg2C/ojBoAsUh81t6qimV8QXrT7oorqFnodp58Oco1uV0ltkJ2Q+7PgkncX+MzSEW54SzvnIecgpEg4s/5+XxMnV8H3+32LZs=
X-Gm-Message-State: AOJu0Yygi+YYLil7qgVoQJvOhY3kQRBA4gEtf6hLsssqtSIh9bfPu+Qx
	7SPMz7NAuru6PCkxGAY8R2+vyU9ND/KiwO+kMcn5yiNzGrSCHRfL6iPRQKnQ7O5xckPzMmGe4Hx
	OJ239g5PVMzw15AzTuu5HtCsrbsQ=
X-Google-Smtp-Source: AGHT+IGscNHInYs7CDsYy2rc+vs9zCMcROj27SxAQkw1qt7RRPJGJSIVkFJXaWYP64UZtB4m9xNghw6GJ6q3quU9p9A=
X-Received: by 2002:a5b:94a:0:b0:dda:a9cd:59c5 with SMTP id
 x10-20020a5b094a000000b00ddaa9cd59c5mr2464288ybq.40.1712749598059; Wed, 10
 Apr 2024 04:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240410111416.2204-1-irui.wang@mediatek.com>
In-Reply-To: <20240410111416.2204-1-irui.wang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 10 Apr 2024 07:46:26 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5xfwVvLbKYNPKWJAqOw49VspoVnmHaZ0r2c4jBKNW85w@mail.gmail.com>
Message-ID: <CA+5PVA5xfwVvLbKYNPKWJAqOw49VspoVnmHaZ0r2c4jBKNW85w@mail.gmail.com>
Subject: Re: pull request: linux-firmware: mediatek: Update MT8173 VPU
 firmware to v1.1.9
To: Irui Wang <irui.wang@mediatek.com>
Cc: linux-firmware@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
	Longfei.Wang@mediatek.com, Yunfei.Dong@mediatek.com, 
	Andrew-CT.Chen@mediatek.com, tiffany.lin@mediatek.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_044640_057923_CB3EFA7B 
X-CRM114-Status: GOOD (  14.03  )
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

On Wed, Apr 10, 2024 at 7:14=E2=80=AFAM Irui Wang <irui.wang@mediatek.com> =
wrote:
>
> Dear linux-firmware maintainers,
>
> The following changes since commit 1addd7dca2d953a5484c3e3c08dbd7dc253058=
dd:
>
>   Merge branch 'rtw' into 'main' (2024-04-09 12:30:28 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/irui-wang/linux_fw_vpu_v1.1.9.git v1.1.9

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/191

josh

>
> for you to fetch changes up to c81f094c847d934c0ffe0870fa5cf861c62e3451:
>
>   linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.9 (2024-04=
-10 18:36:10 +0800)
>
> ----------------------------------------------------------------
> Irui Wang (1):
>       linux-firmware: mediatek: Update MT8173 VPU firmware to v1.1.9
>
>  mediatek/mt8173/vpu_d.bin | Bin 2977184 -> 2977184 bytes
>  mediatek/mt8173/vpu_p.bin | Bin 131380 -> 131380 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)
>
>

