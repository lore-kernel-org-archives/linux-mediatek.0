Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A3AC61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 21:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9P7IEAkLy7BcZ65gozk6soUzL4XB53L7ciN8vl0VU/0=; b=aeE1WphNSiOtk39L2YSvPPPBH6
	GAzrQN7xamypnaOQN9LF8LWLEMWL7Omktj4SxvQTTyffSyIIhiNbL97ybdkzvsPFPIu9P0Ze3t0Uh
	axqpCGgBZm/8/lvFp+AezInNKjU7rh7kaNng3/IRCABI38vVfEmLlZEE5E0mgGoqYuXuWkh1aHPRx
	mcsOD7Z6vrsrt1HaUR4ZGdUdJfJPO2nmMvuxcTjAqOdK0S702Ycjmd2Q13Pl47x54eA6VJ/zCYebt
	/IvPzmke7eDe3mIKHM1qwnS6q3pXyOETHxReodLxd/iXncOnHowmDW0hP4mq5FP7Ah19JZT/2J1zx
	mutd0rCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb6NO-001FR1-Cn; Sat, 11 Mar 2023 21:03:38 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb6NA-001FJU-5R; Sat, 11 Mar 2023 21:03:25 +0000
Received: by mail-ed1-x52c.google.com with SMTP id k10so34104982edk.13;
        Sat, 11 Mar 2023 13:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678568602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9P7IEAkLy7BcZ65gozk6soUzL4XB53L7ciN8vl0VU/0=;
        b=Mj3NdSmV6a2J+F31S5HW2+G4vNN8mcI76hOLn6I1zFjdXWXC/WZRnhOdQ1QHDp4//Y
         tWsqEHcpJ0vL77yH+bJmT9dUvyUbvpvIm2aGBWddYvljUxFx37/4Ir01a2r5j3FG+Bhi
         wAEft83BiQMHNOJfG/hyrFS3cnfWaJUrYXWxKBWLuIZ+wMhQVdU3dZMEd/Ii2PJ+Bj4v
         w/qom/IQr+gHPL7notTLZLEK+H/qF1i0KERixOqwYAciKCbfmAwHSId9JhJeXMUMlv9w
         TAROnkKZlozadKj+LmMDlngzBKq/PLKyjjV1jm7EnL6izYCIHRwb8tXc2U1lCqjM6lhf
         VMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678568602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9P7IEAkLy7BcZ65gozk6soUzL4XB53L7ciN8vl0VU/0=;
        b=wzBdlscPgA6WSbEGg4mQbgRap2CPxvGpUIXWPVxV9LJ5wA/5IhA2lnojaiOv/Q82BS
         9er4EfVckXXNs019KdwYzh369gV1l0bJamSzLpCwp4EbqSnbkPu0Cy4bZtL1l4Sh5o1c
         /ghMwJDhokxMFNwSVh4BfZ7p+ntNlrueiG/kxrz5GbyUBE34zdG17ZAvX16RTWNHZYnZ
         OeY2yPmq9Q/H8FbT0iZ0abXMq0HXdhrZixFRft1qbt/LhMqebGhU7Ukjf8AXLl/4yRCE
         /5Z74l17ysPNYJ7ZH8B5z4lppPFTQ6mdrQhEp20cZrBbiZSiyAc5SwNuFuHJiNAlyrmR
         nv5g==
X-Gm-Message-State: AO0yUKWYAGPIJRQxCMykUqzV0FIFISvrybto2HP2816KsrLOoI7xtvVB
	rca+1Ro90bF2XlW/LxIgwcJnX6SLV4mJRDwGhpY=
X-Google-Smtp-Source: AK7set8br7hTajHtR5jJ8JEX+gep6ksiKRlkfXEKJA4TcVnIPNqBQgZ3QlWHqwp9ET29p8c4umTLPKrNN3dT4z5U9yA=
X-Received: by 2002:a17:906:f47:b0:87b:db55:4887 with SMTP id
 h7-20020a1709060f4700b0087bdb554887mr14138887ejj.4.1678568601780; Sat, 11 Mar
 2023 13:03:21 -0800 (PST)
MIME-Version: 1.0
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org> <20230310222857.315629-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230310222857.315629-4-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Mar 2023 22:03:10 +0100
Message-ID: <CAFBinCBG90jOdKPubEZvOFXf5B=Ra+HxH6JTTdVn-L1cbWjNYA@mail.gmail.com>
Subject: Re: [PATCH 04/16] spi: meson-spifc: Drop of_match_ptr for ID table
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi@etezian.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_130324_232666_A01D8400 
X-CRM114-Status: UNSURE (   9.59  )
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

On Fri, Mar 10, 2023 at 11:29=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it is not relevant here).
>
>   drivers/spi/spi-meson-spifc.c:434:34: error: =E2=80=98meson_spifc_dt_ma=
tch=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

