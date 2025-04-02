Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44659C28B20
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Apr 2025 09:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyRR7YwcTt1RVUuFWFxexpTiWgrITNp4gvcysQ5tmtU=; b=PWpCYz32S7XU5zOKOoMdweKJsd
	dFawHc+2lrof8HniMo91vHqIM/IbQTILU/xoi7sZTXDOWTSVcGOYBxUjRPQGWqFrh0nSw48XpxdCJ
	45CnKTKs5wedasHk0ST6DBQrfGmw021rrIBB+JHWMRE/7eiIopIxjMXVNVPiOokTX2AeiXxgN3F7m
	0imjSeZTqlulAR61Pv+D7gR2upf+JOU6hysp+v8LkRQF+aHustU7qQi+NGcbp9n9JRmJb2PoM2lkH
	kZDyfQyiDtZZbMFAeEkc3FWjNo+fUryHL2HYLmpvviiMSEJ5FGATJnNdZoIcehDEitlMUGPOhN+Il
	v2TWDy3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuJ9-00000005fpK-18FG;
	Wed, 02 Apr 2025 09:22:51 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuHM-00000005fXl-3xvK
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Apr 2025 09:21:02 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so717780e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Apr 2025 02:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743585658; x=1744190458; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyRR7YwcTt1RVUuFWFxexpTiWgrITNp4gvcysQ5tmtU=;
        b=NyRfCJ5T1o4eAFjiFlUgvw4TysLsmut9hqOBIGv6EcUaAJLjg/WvyYMJXTaWcGubQ5
         FwDRh7N3XsX32NuWv9l0gzzYKEjyJCeeyn4WzviQtKL/ZSnzirHP9h/ADCIHtbHtEhDv
         6SQJtqa44aosywE+bpeLpiSxKQiK3+I3rQ8zU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743585658; x=1744190458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyRR7YwcTt1RVUuFWFxexpTiWgrITNp4gvcysQ5tmtU=;
        b=b7xD9K1q0WjvhoOZyH9EgBoJanThkBajM+Tsf1L3tERHgQTED5sAUxeOXlVJq/8Zcv
         Ubj9zxHjMDG7/Lv+B1UCp08GtSGU2k9RciM6FXTD57M/e4HNRTJdLXC5pvHVsrn5+Xww
         O/vJWOw+895V1OoWFWcw0Jzh7bNEikrqe6Ho+4/9Y0YSntRb+cOMiN2jrUuCdt7WCIrK
         R4lnRz16Fj60+HyS/Q427V/hw+3c5Hse3r5RK5ISmG/NFsCZGakqUxqOiAxLulLvf7q4
         HWz0Rat/unxMz6Kl65MJ0AvJjwYJTqS0FwUXtLLcz6K23WJllwpOSaMt9YKoeghGv9Yj
         w8Dg==
X-Forwarded-Encrypted: i=1; AJvYcCX3+OH5vUdpDiu2UJBFJ/H+lMFUaXKkMBwEJHxa6ug4tS5KwhHjSLSxsnToFrcQfivux6Kn+qECUHCkibTcAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwO5KlmnI+p+GrPDDKgwzk4mFnyCb3rk6tC79NsBjXq4XgxmN8P
	SYXk1JXjWwyMBfqApiTeG0tFmhkcgtAsUHxRxOY1JI4yIp//s/C0bOKQmnemmnT0AZ+ts68LHHK
	gRCQS/OKFUdltUsSJUw/7xMEtxTHOs9oJ2FS7
X-Gm-Gg: ASbGncuyaDkNoJA/IteK+C3mQvkLThmgUYFRtndOCvmQ880dQH8LBiUeBRSueIoeXQX
	Df67Rdj0Cm1VRtnDsv1AbFm0KFLz2IxsjJWQxcxUpyQukGjg+r/m2OPyqosuQbFCqz5mfEFZF5W
	OppPzeDCrGzHiohND0Amm1QFPGo3ns+EjtERbC/2vHa0ZMJECorLBg
X-Google-Smtp-Source: AGHT+IFNQ8rh8uohCED3FsKCQuotU4QQf82Ifu/wJJpZo0zeWoQri2IhxtJ24b7PrATskKr8lE3tJp/lmcDLayTcKSY=
X-Received: by 2002:a05:6512:1582:b0:53e:39e6:a1c1 with SMTP id
 2adb3069b0e04-54c19c81f80mr468673e87.43.1743585658589; Wed, 02 Apr 2025
 02:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250402083852.20624-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250402083852.20624-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 2 Apr 2025 17:20:47 +0800
X-Gm-Features: AQ5f1JrBOnaeLpNxIHL0qnzLitrLXH_ivJZiH5ry-mQ9PevMkY1uBQey-dy93ik
Message-ID: <CAGXv+5Fo3-5J1Tyn1JGP0+aTeCnkUJhwxiuLt71MLUp-zVSCkg@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts: Fix debugfs unregister on failure
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, npitre@baylibre.com, 
	jpanis@baylibre.com, nfraprado@collabora.com, bchihi@baylibre.com, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_022101_007900_D0807256 
X-CRM114-Status: GOOD (  11.45  )
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

On Wed, Apr 2, 2025 at 4:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> When running the probe function for this driver, the function
> lvts_debugfs_init() gets called in lvts_domain_init() which, in
> turn, gets called in lvts_probe() before registering threaded
> interrupt handlers.
>
> Even though it's unlikely, the last call may fail and, if it does,
> there's nothing removing the already created debugfs folder and
> files.
>
> In order to fix that, instead of calling the lvts debugfs cleanup
> function upon failure, register a devm action that will take care
> of calling that upon failure or driver removal.
>
> Since devm was used, also delete the call to lvts_debugfs_exit()
> in the lvts_remove() callback, as now that's done automatically.
>
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Therm=
al Sensor driver")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

