Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EADDC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 11:13:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23002611AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 11:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23002611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Ih1jl+Hh/AlNzz0LP58glXmfqYVotl9Qs12MBVoXog=; b=E2dg1fFW7oQEyV
	oTjFQJiVarpwoJ3qRljTj2ziShQkW76RgfNbtitCYnOrTeJIcKRPYMBFbTmBaznB+U6ZiUG2l0a3R
	1n4fPuE8S1Zj7N27CvWqaluk+yLGV7ls2nlo4rbd/Vb+EjPs8BX0/8rQfsiktbvlUpIw4/MX2YGad
	NVrbaOzn+z/XsacyAqPEFRw5tN0r51lnfEYIS5c85rFsrah8U43ML8iPA0hgOZM2+qrJuhBidZ2Nx
	qG2MEe77NM8+zn+j0eO/b657ZQVfTjZIUApje7QS67uRBpfsrMXHLtZRWguoS+Cs320WLZDrhcxTC
	O7fJZ9pnAJbunFU/s30g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3zIl-000ZGy-0y; Thu, 15 Jul 2021 11:13:11 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3zIW-000Z9R-Ak; Thu, 15 Jul 2021 11:12:57 +0000
Received: by mail-oi1-x236.google.com with SMTP id p67so6144204oig.2;
 Thu, 15 Jul 2021 04:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G7yK9VzLEQCG6XE//c9cVdti/iHPJ3DxnhKwu9cnsjI=;
 b=NlMo7/06IiuX+CxJRiTWwRLYAECimiW0KcSKx3FPDyhg//qYD+xUnzoPnUGxdN/YZM
 L8QIWKpiGVXGMzF5Rs1pbhzfiDd0bVzRgb6E8/AAdfrIYlE/fhxV8s1Ngwmvlsrz/GIl
 aL/RlzPYC5j6aQfvfY8kkeK45rCPEJ4hTqhPn/q2dWzSGd2k18aUnDJbE7e6eLaFSpmr
 1PgjcCYt04tTWmzSvtIw0MeTyl4+C2pESNcbZ9Vi9HMI5ZmESxO85j6Jgemf6Xe6L2fV
 2D02skzT9DUri5jE0CHzIMB1Cg+ysuyMYfXTwi5W9Adrjbhtxq/GC9Dvro4VcA20R42q
 /elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G7yK9VzLEQCG6XE//c9cVdti/iHPJ3DxnhKwu9cnsjI=;
 b=mpsb+mR/+B/8ZLOcOr5TigbAqUtlt/K/goPAv5bOb5MTx3mhlO0OWiJeYSL6c+iY1G
 exnoDQbDPK87MkQOOrhUFT/w/ZO5Vw1/7iedRAdkOjyhIySdu7TkGu//c1xE/XRTMNFx
 T8fyVNp34xdgQmlBjuu6iFN1L4GaBG6XdjuQM+K5i/qTrYRksGbAq2fJ6+ae69YJlNf7
 /3Zy/416nE2Mj1zRk12LuiBbcOKh9G6Cud7WkvPDgoDp2ny08MUQaGsFOS2m7cjgr4C+
 tqDd5zSZ6cDA133y3Z23Z6lNNajAZGzUeCHWY7CoGeIjUx7acqAmHftGTneMONCETsF1
 nEPw==
X-Gm-Message-State: AOAM533ofrVaXzOX5GxuCeATTejPRx8HR+qOiK48wDpxQfZ76nEu/dU4
 Bl+ke4YaXeTOnA/AkkPB+rb6H2WU2ptuq0BytJI=
X-Google-Smtp-Source: ABdhPJzOFkRPM1F5bStdEZ0HnTr0PNZpn8ngy3uh/IeBzMB96wnzSxAwpctzKDpwPU357CBdQwPf/oPm4PKS8eRVHl0=
X-Received: by 2002:aca:c6c9:: with SMTP id w192mr3095017oif.47.1626347575562; 
 Thu, 15 Jul 2021 04:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210527074202.1706724-1-hsinyi@chromium.org>
 <20210527074202.1706724-3-hsinyi@chromium.org>
In-Reply-To: <20210527074202.1706724-3-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 15 Jul 2021 13:12:44 +0200
Message-ID: <CAFqH_50_EP_aBs3UuBNCFbgqFHS=jizberM8pZY6EhpOnWnbVw@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 3/3] arm64: dts: mt8183: Add panel rotation
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, 
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Robert Foss <robert.foss@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_041256_415231_DB23C35C 
X-CRM114-Status: GOOD (  14.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

Thank you for the patch.

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dj., 27 de maig
2021 a les 9:42:
>
> krane, kakadu, and kodama boards have a default panel rotation.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

It looks good to me, so

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

and, on a Lenovo IdeaPad Duet. The display appears well rotated now.

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Thanks,
  Enric
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index ff56bcfa3370..793cc9501337 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -263,6 +263,7 @@ panel: panel@0 {
>                 avee-supply = <&ppvarp_lcd>;
>                 pp1800-supply = <&pp1800_lcd>;
>                 backlight = <&backlight_lcd0>;
> +               rotation = <270>;
>                 port {
>                         panel_in: endpoint {
>                                 remote-endpoint = <&dsi_out>;
> --
> 2.31.1.818.g46aad6cb9e-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
