Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF87C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 16:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K54OHgmN8fzCR8nXYTAA10aWWoOdsi0wXP2XNLDX9vc=; b=qgwKtpCcP0mLYjUU4Ne8ewIHnT
	twmS2sfXtnp+pkDxhIWGte1o6xCGbCHmSm3WllknGLR1ZLPJ670Oq0WQYXjXsfuNNNFX3VWg/2YU7
	7Gr1W0wEgu7PcWf/oD4lh3iVwJ06bFy8lunbPigaMhXMQXUZ5VG0Ar87sPQieZ0JXTJMIZWH5Kilz
	ekSQHKmxJZd7A7AEZN07WqRDi7mEYb7BX6x68QxOiNLNvefLk4q3tIW60MhK0ZDoLZ5oTl5S/WXSE
	bwen8wimxCE6IZ3jQmH8gKD8S5T4u4q04R1t5mAKbIZPGW5vOTz1PIZcZIE2SJbxuYyc6RdadIZHI
	sUJuooOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb1j7-000qJh-FI; Sat, 11 Mar 2023 16:05:45 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb1iw-000qFS-Qk
	for linux-mediatek@lists.infradead.org; Sat, 11 Mar 2023 16:05:36 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5416b0ab0ecso29235617b3.6
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Mar 2023 08:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678550733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K54OHgmN8fzCR8nXYTAA10aWWoOdsi0wXP2XNLDX9vc=;
        b=h34LVM3UqmqUgwxpTXBJ/4CwnImSFFUMozqSylfyzNzIg8rEUFi/BCA/5SfPAhPXSK
         zVyg4dkH/np2nYMcxgt34KGbvvU69/pstFffIbpXSdjTuqr7mHRcatJl8wcG+ChH9+dA
         A5V6TTYkNmvyKGoj+SnE4wGxe2nzztZ+0cYdHj/So+YjENl4RPexyIQNksQlU5AqWmJ0
         wlqIaTJA+4pIrmihYkk+CWZVx2geZVmmUhYo5eOPcvWV+YR6xqVFHKFMSoocJOLnX6CR
         WwHQ52y8meSmlDKg6ykn0PXkeSs5FMhUOArFwyfH5cPvgTYIVyDHckPo68ZLvtp94miA
         EPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678550733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K54OHgmN8fzCR8nXYTAA10aWWoOdsi0wXP2XNLDX9vc=;
        b=NTaMTNpqP75uW242nB29iDM9K52DvaPW/TdjzR6JkTF4e7t3prXqDufnuP3ewUv4f0
         ohgO6Nhe9wffoLb9VLBQqf/pUrNUaasHwc35yAblmW0qigdCN6nOoZkvlnSMtYne9vGj
         jXIdp/GVmJD6LJ25bd3pz5m+wQrBLP2I12o3g8XvJdTkRxmT+qg/353g/oXhsxG0kgNQ
         4SJECgqpMMp9D/oE2WTOWmK8BLuA7b6a/B3wP93XShD91W4070/hPfxJ1U/ZAWowkDmd
         VoZqy/56pFEqN8Nu1VvipdW9AWhwqdBYCr2QJFzI6a83KclgmN+bXUGioRKmYkdvnzDe
         c4TA==
X-Gm-Message-State: AO0yUKXzeVONds98BvKCIU5bDiiRkmtFfo63gj986HI8Kwex9thKAAtV
	OKZbVs/5uLZ2kv5L2XsF92e7pxes2XkIEVch7EwizQ==
X-Google-Smtp-Source: AK7set9ic8NaN+kdm7NG2bG/3UThQQCFa78uyAWSZO+HX+TKv1qILKSdYFavvGkzUkH3l060xAj5J+UbUwRtinZAjtU=
X-Received: by 2002:a81:400c:0:b0:540:62be:42b with SMTP id
 l12-20020a81400c000000b0054062be042bmr2285636ywn.6.1678550732657; Sat, 11 Mar
 2023 08:05:32 -0800 (PST)
MIME-Version: 1.0
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org> <20230311111658.251951-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111658.251951-2-krzysztof.kozlowski@linaro.org>
From: Guenter Roeck <groeck@google.com>
Date: Sat, 11 Mar 2023 08:05:21 -0800
Message-ID: <CABXOdTePJ_gcBYcJ7fE2pX5E71oBmq41KzxiMmVJ_GcDRi7MGw@mail.gmail.com>
Subject: Re: [PATCH 2/5] i2c: owl: drop of_match_ptr for ID table
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Michal Simek <michal.simek@xilinx.com>, linux-i2c@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_080534_912299_38118740 
X-CRM114-Status: GOOD (  16.82  )
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

On Sat, Mar 11, 2023 at 3:17=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
>
>   drivers/i2c/busses/i2c-owl.c:510:34: error: =E2=80=98owl_i2c_of_match=
=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/i2c/busses/i2c-owl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-owl.c b/drivers/i2c/busses/i2c-owl.c
> index 98882fe4e965..99ddd8894964 100644
> --- a/drivers/i2c/busses/i2c-owl.c
> +++ b/drivers/i2c/busses/i2c-owl.c
> @@ -519,7 +519,7 @@ static struct platform_driver owl_i2c_driver =3D {
>         .probe          =3D owl_i2c_probe,
>         .driver         =3D {
>                 .name   =3D "owl-i2c",
> -               .of_match_table =3D of_match_ptr(owl_i2c_of_match),
> +               .of_match_table =3D owl_i2c_of_match,
>                 .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>         },
>  };
> --
> 2.34.1
>

