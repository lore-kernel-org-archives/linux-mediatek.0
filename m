Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F9FD0BB56
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 15:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XR/4Fvu0tMyoCCtOc6mB1xqHO3YtOWoM5ClealtuxgM=; b=s8zgtrYvp4nEkqfODAEGZT8slc
	PsVIgk0Im06+qNliCOMyfadFZrL7R+wKsvhe2cRiYPbtig7Vi7nBDq42fJ45sXjtgKLWs598NAXKu
	C6UN6eqNQEvS8qIZxOC2M94x13icE1blBfym7NUpaPfqLaXsslLa01dsUmNhOPCcMX3bfi3glI48m
	vZHA3t0/oeX/Ud+fQYM15BYJbpDUjRkRnxw74IAk+3nA8M839x5cyZ/l/4Q+b8tiWQbyShSYOZRS8
	ets5bObPx2G++juFi/uLTZCxfdgsgAQFNrZsBZfcv80onqsEy+SXl4mJByt5HLxKHwMTWlGqgpcZ0
	T6VM6gWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4M2A-00000004Bqd-3iUN;
	Fri, 25 Oct 2024 15:15:26 +0000
Received: from mail-ed1-f53.google.com ([209.85.208.53])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LfR-000000045ay-2Uqn
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 14:52:11 +0000
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cb6704ff6bso2781427a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 07:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729867915; x=1730472715; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XR/4Fvu0tMyoCCtOc6mB1xqHO3YtOWoM5ClealtuxgM=;
        b=b2RonpxwZMV2aCc6M+JGEFqF5Kf14mwouTvLcTCDUnMHj9KGYViUle+40gYa89gEK7
         ILaT0NAlArM1Zp3CV9BRtFpmZE4uP9Lt436unznIVcGQOm2tEzrdPk7hX/ggMRAz2hmE
         j/xD+SZWVivMc3mcFfAg6Soi9iQKOuALedVeoYqs6cBS53GfaHmpUhV2oIFv7Fvs3i3a
         WpQ+odHI3a/0r5itaBcqrYUUCdti7ujzKy3VZKSu4kRzx4L5BwipUE7J7Naz5Oi+jIzD
         n17JAkl8GHxECKWf+gmuviQw5XDHHdeZclsQLvyeMpRFnTYLvwJ+725Uq8/QXFvsTOOi
         uOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729867915; x=1730472715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XR/4Fvu0tMyoCCtOc6mB1xqHO3YtOWoM5ClealtuxgM=;
        b=NTyBnvnGdAI7oIRvWw1PnfLnXyrPB3wE/xx8FIa3YaJdZ8A8s6wG7BvIEXM6jcdzLQ
         Ib6AYam3HPvmYbzH8sjQvKjYz0HD34DIQ1ujcmA7CWXVmSboMnQ9ZVNgf1yxNE1m3mC9
         eNqLf9V+O9IWrQ5eOHjGeWEumaaM6OQJozZ/ag5TC+07oXMQ1J13e3+Svj4at6wihx9D
         siwfjoUi5/exjOb4obf3hgzzxuDzKoNjms8oU4IygpIt5ovgvcjl+dM4FuUfzgWiUGJk
         AtKn2ZmIjVR7q98jTMp57/fLHQzFh8vpJD3sd3kshrvvFFZFEsFvI9y+M1Mxv3XeOs4d
         FIZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWti0fyFNUegmtxV3Xl+dj1rMhVgCRbfHelgUtzqpl5r0Dno4RVbWcanyMLJuCHDTwbDox0p95I8nL15mWHeA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0r47ISTwrVwQOOqrNsfs8h0dcgTxxlq6eIW0F57MUP6rHmLDc
	m9LOs6W1xHL49/TxjCNe+SXVnfpazksBm9jV77IhumKlF7Y4lltc+jAxd0KtGkpJLTyyo6MC5tB
	5PPvO6xlDX9eUNt6s75A0TV1pKNmzR9lomIYBnA==
X-Google-Smtp-Source: AGHT+IER6oLuLAmMqy0L4qN7TusuZBghOustjiSV8015jNjOqosSq06NJ/Zu1YsQk+kV8Qw7CqO4h9Ex1wfPvyXxJpM=
X-Received: by 2002:a05:6402:1ed6:b0:5ca:18bc:8358 with SMTP id
 4fb4d7f45d1cf-5cb8b264348mr8002531a12.24.1729867915170; Fri, 25 Oct 2024
 07:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241012143826.7690-1-linux@fw-web.de>
In-Reply-To: <20241012143826.7690-1-linux@fw-web.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Oct 2024 16:51:16 +0200
Message-ID: <CAPDyKFp192dy_OXXYk5zqJQPUvrTwkQYPaMoFVsHHQiO74U1eg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add mmc support for mt7988
To: Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_075157_817296_51F0F739 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, eladwf@gmail.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, john@phrozen.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, ansuelsmth@gmail.com, Chaotian Jing <chaotian.jing@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 12 Oct 2024 at 16:38, Frank Wunderlich <linux@fw-web.de> wrote:
>
> From: Frank Wunderlich <frank-w@public-files.de>
>
> Add MMC-Support for MT798 SoC
>
> changes in v4:
> - drop minitems because of dt_binding_check error
> - explain mt7988 compatible with mt7986 platform data in commit description
> changes in v3:
> - use mt7986 platform-data with the mt7988 compatible

Applied for next, thanks!

Kind regards
Uffe


>
> changes in v2:
> - corrected minItems to require all 4 clocks
>
>
> Frank Wunderlich (2):
>   dt-bindings: mmc: mtk-sd: Add mt7988 SoC
>   mmc: mtk-sd: add support for mt7988
>
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 22 +++++++++++++++++++
>  drivers/mmc/host/mtk-sd.c                     |  1 +
>  2 files changed, 23 insertions(+)
>
> --
> 2.43.0
>

