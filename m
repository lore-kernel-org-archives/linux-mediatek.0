Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE38C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vVaK5fa/4HYATIX0W7bJf4mZCzOtRFjIhnuFvVhvfeU=; b=QuyaN12uPeUvlRkk/BEQD685D5
	C90hWOubRcU9Ao96Z/MiQKwgYlSU19kwvj/0JtZcxNkhM94130fwfxEMn4bBfY8evKAaAagUNf5j3
	0uabT2Ki0ExCiVPW5hr05FVYt7P8tNvf0t7y0Lk6Yuu0YRz92UN7z9PGCXMa1zieX9eSdKgIiMFtD
	22/yMJr7EUD/SALGn16L4oTuD1mtB8w+4IwQQAIsMqCY0VfeCalCJxslURWctbcMPJMwWqq8gUyU/
	SzZy9S2FIRGOG6j+oEOlATu/QRQL+NiRVmDxxsSkQXDfTZAvyyHB9Lr2QDtP6Ot6QdqiRiquCL/3w
	24ebO07Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZU2O-00H4Kx-6u; Tue, 07 Mar 2023 09:55:16 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZU1M-00H3i9-DE
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 09:54:13 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id o2so11765622vss.8
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 01:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678182850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVaK5fa/4HYATIX0W7bJf4mZCzOtRFjIhnuFvVhvfeU=;
        b=Dl6wcGCiDkifqDwLsKfdUBlG3DuYQB56oycul9KEjs6Iszio/Yz5p1mDGhWQLucvtU
         h6fVddwe5sMWsgC/St49FnnZmOYUMLgFX+Yi2T/+TI4/xtlfn41+d2Lge3uOZqT6EMqs
         aH6wpLE2W9Hw7LTc82Zv3/s+vGzj3ipPp0I9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678182850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVaK5fa/4HYATIX0W7bJf4mZCzOtRFjIhnuFvVhvfeU=;
        b=3vI2dSN7oKv750FNWPHqzMnhC8w6W7vhQk8hoqMIqV5SlYF3klZ1Lo6x4PQu99ClXj
         ValBE7TfUId6UCGSggZ8kyzaJFMj9veJASV2SnXc0qU9TvDhLY44T52XBtAIx2W6UY8M
         62mZ7OjJrwVURI4aQY2P9AM9Oy/7tPf2DruTqb/70bttnzWKF5BJL977WpMSdMLAFiHC
         yB5f/A2kAaEQgv04cSIU7KRiayvDg4WEyjQ+9nZTT5DR1/1XGH74pjTMztU7A/A9HjGo
         zya6lhahbVlpLnopSu1l0Bx611IxWCq7QpWi+iPhkwlFwlLzgY6a0BM4ylPZ+w8YgNl9
         VboQ==
X-Gm-Message-State: AO0yUKVnJwz8D+sJfJYEgyVe7LfxuscQBqqEzp6JMWMUXmNlRuTtoKZW
	NrMX6hhOu7LgAB1ZaoPC/Z6qlL/ze9niUDWIMzYodg==
X-Google-Smtp-Source: AK7set+M+YbqM/phaVs9YXbp6uwuxjHLfZOSgI3fcVyoRwVBzUTftmT1tmU6GP/gFzeZL546fwapyRfVwBFvBG+dKU0=
X-Received: by 2002:a67:db97:0:b0:412:2ed6:d79b with SMTP id
 f23-20020a67db97000000b004122ed6d79bmr9257239vsk.3.1678182850374; Tue, 07 Mar
 2023 01:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com> <20230228102704.708150-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-8-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 17:53:59 +0800
Message-ID: <CAGXv+5GfT92mGRetF_m2BSyCbx6zArrhwBYV3U=JcMDEN0P9cw@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] drm/panfrost: Increase MAX_PM_DOMAINS to 5
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_015412_481441_C1F77A67 
X-CRM114-Status: UNSURE (   7.98  )
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

On Tue, Feb 28, 2023 at 6:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> Increase the MAX_PM_DOMAINS constant from 3 to 5, to support the
> extra power domains required by the Mali-G57 on the MT8192.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

