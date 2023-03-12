Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E702C6FD19
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 20:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zx5Hx16VtrsWGIQLk9WwOhEjwlykZ68lI6lzjbPZklw=; b=Ddwg59Z0WGYc9ZnW7wpZxZt5FP
	q9R1P9jEy+vzfsOmoYGHCaXB+DOVPrTRlPH1zJdB7b4Taadp/wJd/7rnp0H5MBF8oTJe0VgG25id4
	BXvxwFDV4lkrW1EKlY1VivmwHyjUI4Zl6zlC6bgdQPHCda7GVjFRFBRVjNojTE/A9zPGIwhWqee9O
	gNjhuVPAvklBEbtSXcKAYcAcIFm/Jhh4V2Mw9KEKoWTLPqIq5LwUxXqjeLsa5MJy3OAYESqtiFGyo
	YOlNInAWoi/U22tfRyTmpFXCavVRz2x688HwK2GDqZ2J7puyf/hwRo3HGHDZMxSHF/xvXSulXyuWA
	N9PEohVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbSDz-003TnR-AB; Sun, 12 Mar 2023 20:23:23 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbSDj-003Tfy-Ud; Sun, 12 Mar 2023 20:23:09 +0000
Received: by mail-ed1-x52d.google.com with SMTP id fd5so6984684edb.7;
        Sun, 12 Mar 2023 13:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678652584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zx5Hx16VtrsWGIQLk9WwOhEjwlykZ68lI6lzjbPZklw=;
        b=Hf8bDIgSRyHgy9bXQ/Gk4nexYiqXGYoCYtQ04Ivh+iCVbpJ2b5wzrRnb++ax5WG5YU
         l1ECC7hckmqBIWK0FYKledOUlR/8oGb9iU/bprqDFfYvUnH9HXOkXMuEU7AitS1oLCXw
         myetldVYFfznoSCvDzeKhgZkcDBm8pW0l/vGCJjUPX1DzrdmVRAKk857IvrVjfQ9XSKG
         2N5oK1VtlQxJyFx4Mf99gdPkQnYe53VpL6QT66oSCLZqVHMC0inMBQbwy20+y8itU9ok
         BWs74qxV0g+EZr9O9dScl2udx1DcuJJXJz0jv3NNva7rrPcHkok53W0tVeIcIuzzmOKr
         qkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678652584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zx5Hx16VtrsWGIQLk9WwOhEjwlykZ68lI6lzjbPZklw=;
        b=BdVZ8GdX+RxEg+Ea8z5wgtQfsAeHrOJZjbXlMVx8xpj5Nz5kP9uuZjzr1t6VTUnfFb
         OF7qNJ79ZEtplCS4i3S1XLNN+cjOIa0WIKakYN4OsloRephp2CmFdTW8saWz2YY9M8QP
         0p/LH/ePZCwvoMUKLgd6Ut5eFBQSAYjFKFNvJgY0mq3OOZmfxKiuxkFI0TjpGNQZERzL
         VLo00pxelrDRkpxdb2HKe7gbUGXRXbsIEdF+yclmLkzzvuG05CcJlUQ818LuNd9L6aFr
         +1T6MPup3qlcpTuD/MAtdS6dbH8SGiign8uNwXSAatX1500xkk/O9jCl9/RJZkv148o3
         k5oA==
X-Gm-Message-State: AO0yUKXIaM7S6H++QDJqbKLJSWThvlXHVzkiv4OyNS9RQU7Q0qFrpTwE
	tDYMNBIcBjC4z/UhF2dp3D8M5RVlzuImZ6z6HRY=
X-Google-Smtp-Source: AK7set9zgGbqFrzGWxNsXVoKpAldwMmxSrIf9cZOIFv0n5RvCM/bJPrPW3NGvz9pmm0rGWW96q1mG4aHSyR0BOq+UH0=
X-Received: by 2002:a17:906:e58:b0:922:ff34:d814 with SMTP id
 q24-20020a1709060e5800b00922ff34d814mr2005221eji.6.1678652584109; Sun, 12 Mar
 2023 13:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org> <20230312131318.351173-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312131318.351173-2-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Mar 2023 21:22:53 +0100
Message-ID: <CAFBinCDTRjqLfJvs=dtQNS0=5mZSDAdR8tQNt_qLt-BH9+P7MA@mail.gmail.com>
Subject: Re: [PATCH 02/28] media: cec: meson: drop of_match_ptr for ID table
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Wenyou Yang <wenyou.yang@microchip.com>, 
	Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Yong Deng <yong.deng@magewell.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sean Young <sean@mess.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_132308_118705_FD078016 
X-CRM114-Status: UNSURE (   9.91  )
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

On Sun, Mar 12, 2023 at 2:13=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
>
>   drivers/media/cec/platform/meson/ao-cec.c:711:34: error: =E2=80=98meson=
_ao_cec_of_match=E2=80=99 defined but not used [-Werror=3Dunused-const-vari=
able=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

