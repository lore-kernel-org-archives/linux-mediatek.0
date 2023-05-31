Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B64AC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 08:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ha8WXDq7F6ehlGZN4Wnm79SzuKrgIbv9GmD5p3/ciq4=; b=vIXK9hy6U9kO8CT2zUbjVZbDJG
	jNHPUmTF5bVF9N541LyQy0yyCHZyXE77XDW+a8srsgKkntKhne4ur7IN2i6UAGolBF9rIUEqFRsWT
	c6COU4zJRZGn+YQ4Wv2vCGCtdQKR3VKoj1WP/wuezU8A9/caPPG5DmJOWm3GPUm0xnd4udTQNKMRB
	pHnTM1RiOog8vDQd8jdTDr00S79gnhHPsaacY3Ybdr8BEY7TQ5T2cjcivsGApKulpGZlkqHoMWrBn
	/IULg7QWQ/dz9tm7bqw6KU46vbQm0B+WR7IgBpLhruHLdOESCCrPzko1SBJ1p2jY0pdoB9XYiodPL
	KJpvzM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Gue-00GZef-0z;
	Wed, 31 May 2023 08:10:32 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Guc-00GZe4-14
	for linux-mediatek@lists.infradead.org;
	Wed, 31 May 2023 08:10:31 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6af6d8687faso4220513a34.3
        for <linux-mediatek@lists.infradead.org>; Wed, 31 May 2023 01:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685520628; x=1688112628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ha8WXDq7F6ehlGZN4Wnm79SzuKrgIbv9GmD5p3/ciq4=;
        b=DgBV7q1iFWBDxiVHk9JUFMK901wD1MP+icEW/zcNq51kchIW9/fmxP0NskfzKA04e9
         kTop/smn/jjdxZnRzBEiyWP2WMy0SSyrLpcoG2hW8cO7XgbPfZ8aSYBZLEQ0Vodxjgvu
         7bLrHj8W2DAz+pgxbvT9/QzRwEeDcvRgAIb2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685520628; x=1688112628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ha8WXDq7F6ehlGZN4Wnm79SzuKrgIbv9GmD5p3/ciq4=;
        b=I2rCVjzl3Iiiuf4XUDKniah4sftwHW+P5rv/1mTC0y5FiF75GMoLIaOuDXwR+brP01
         hsqN6PQxBZBxm5fcRJTaeSA07IhlG9A9q/nLYbVyp+Ed1Guy80py6j3LAXiQuyn5L7Q6
         Qn4b0xaJm2/cGax2FCiiQgK2lM22MOVqodsBvH+QQRn2iUdpC9CdHJD2rTX+SVjSS//Q
         dCd7xWwM10OpZgYchHzz0UghxxMV/JYV0mqRv6QvU9MtsK8X28ijcpL5mJTHeqMgeCra
         IUW2Pm2a0wKCL4YYLQ7tFOKCYxmNnvdOGKVnIfe0C7yQ42aeBvNUI4UpnMtxeZVpFSOi
         0gjA==
X-Gm-Message-State: AC+VfDxHiyM9N4AhHkhKSpX3ZVlT26VS0bp10xFFsr9yVeWwj6Hum4y4
	6qVODk5g57nIRkc430D+VOajG2JRTOoAEbzCDSilR0YIK1sQazsR
X-Google-Smtp-Source: ACHHUZ7rqg56DAcPJ9jkQZEWk9382a7L5h4RC6wgNI04P1u6bH0gTq4NfXck/bmoQRGPPXVH2knI7dLMyJlEpKqSWtU=
X-Received: by 2002:a05:6830:1d6f:b0:6b0:c54c:8247 with SMTP id
 l15-20020a0568301d6f00b006b0c54c8247mr949912oti.24.1685520627954; Wed, 31 May
 2023 01:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230220093343.3447381-1-hsinyi@chromium.org> <CAGXv+5E4_k1jKTnninYkuT6Tf=skB00AowHpM+hc8j_VFM-RfQ@mail.gmail.com>
 <CAJMQK-hnK69iVJhqW_8UtKHHLQ3608Cb74Jk_b+xHH0BBu4yVw@mail.gmail.com>
 <d39b0e77-e013-fe7e-9523-9bdbaacb5853@collabora.com> <90ad9b86-e03c-8e80-88d6-d514bbe9cacd@gmail.com>
 <CAJMQK-jmT1YDf0y6FYUUFHkQ0b-ZHD9S4X2zpkrmNoz5Dz4ctQ@mail.gmail.com>
In-Reply-To: <CAJMQK-jmT1YDf0y6FYUUFHkQ0b-ZHD9S4X2zpkrmNoz5Dz4ctQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 31 May 2023 16:10:01 +0800
Message-ID: <CAJMQK-gWQUgY7NRhkSuk7KMf8XZEBfJZEEXo0S+8ty7Ms7xZ9w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: kukui: Add scp firmware-name
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_011030_391316_E309FFEC 
X-CRM114-Status: GOOD (  17.00  )
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

On Wed, May 31, 2023 at 3:47=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> On Wed, May 31, 2023 at 3:30=E2=80=AFPM Matthias Brugger <matthias.bgg@gm=
ail.com> wrote:
> >
> >
> >
> > On 30/05/2023 09:12, AngeloGioacchino Del Regno wrote:
> > > Il 30/05/23 07:12, Hsin-Yi Wang ha scritto:
> > >> On Tue, Feb 21, 2023 at 11:25=E2=80=AFAM Chen-Yu Tsai <wenst@chromiu=
m.org> wrote:
> > >>>
> > >>> On Mon, Feb 20, 2023 at 5:34 PM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
> > >>>>
> > >>>> The upstream SCP firmware path is /lib/firmware/mediatek/mt8183/sc=
p.img
> > >>>>
> > >>>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > >>>
> > >>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > >>
> > >> hi Matthias,
> > >>
> > >> Kindly ping on the patch, thanks!
> > >
> > > Agreed. Matthias, please pick this one.
> > >
> > > Hsin-Yi, can you also please send a version of this patch for stable?
>
> I sent a patch based on stable:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20230531074421.=
888652-1-hsinyi@chromium.org/
>

Archived the above patch. I'll wait for the original patch landed then
send it to stable.

> > >
> >
> > Applied thanks!
>
> Thanks!

