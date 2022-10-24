Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE6DC38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jLzWTJgQOtlVe+72Zg3h4fi2g2V5ar4l63Y1PCLPjc=; b=TI4+o/pVBr05UZBmh3d7lqg36d
	r3ANXYCQolxaOmqE4GjWlB38GupHx9zjt9jKtCy42qQTT+TYRXdbF+RkG7F3VPv1TOcCJBdo1hi2I
	DYoj/Cm04WuhHDSuEogGtNWZLzFW/A9scLh8bXxZ6lVnE6PEyqPamDXJ7QXpwXUG/i5AgmYreed1z
	dDk2GNIobWAroLAgm8im1tRp8jKPsQ1V/VB19qYbiK9/k2vLh4myyCNFr9BSp4PTwGjEMqkM8/IiG
	3TiY3AU0ZQZSBjgVWELG6yajs+mXxlwbSNzkb3mF/tvIdSdfvmjJoY9tvbJEU+kUV5WjzXAba+8vR
	HsYrbXiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omxRd-001hF7-94; Mon, 24 Oct 2022 13:24:45 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omxRQ-001hA1-N4
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 13:24:35 +0000
Received: by mail-lf1-x132.google.com with SMTP id f37so16688313lfv.8
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Oct 2022 06:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jLzWTJgQOtlVe+72Zg3h4fi2g2V5ar4l63Y1PCLPjc=;
        b=Z42jI/gXhcXG5YxoueNeDtIC3JesqUpHJU8cD7xjqdpFe/r+2T9oqnaaDn/+VCsi8+
         7nv6qZR7KznLY2jF8bhwMHq7P2w5ZoLClauIm6K2swABZF28/nRRVphkYBlqNrI5p+hD
         B1qoWm8NR+r79EtsEM8ogTfNZhOQtQCK7lNx0axp6JDqRTeHm3Bvgd6DfkGHL0bOuqP1
         dICzUk7rly8w9FubrYQmbfogXHNIRrel9h/z6IF1n4sm1Sa0ecfWGuW1Nf5OuViMEKhA
         QApQJlHPCSbXoOyTMuLWi7ERjPCpf2ACGcJep+PvEl4m9Tp16dGSFEqNX36ivjvW0InD
         zklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6jLzWTJgQOtlVe+72Zg3h4fi2g2V5ar4l63Y1PCLPjc=;
        b=vCMGr2+pCkaHweTN3cfRP6MCKVSabkeObvZy7vVJEgsOzJwv8rEblm9d7lT/GqMDWd
         8p2SfsV2CscNDYhsdsYuOq0YbNWNavBrQH3VN00WdbXbNoV1T+VGcKBbqL6LCYTg4xjH
         r+R7HGcKaw2IId5b5ujb6yE6GpQH6p8y+KU9e2MVIyoDf75dcP2e28Lw+2S6Qqh5bJXm
         gx6qFSaWLOdkN9iFthYTHfXU/J1HHd5j/NwcYvKgPi/zkH0OYrm5DVtjrLTCxhHDDDS1
         oYYaOFc49ZvIFUKhy6XERvdKi8o3ybULX8mUqW6pEHNMoZEbUruFw29M+MNxuXMM/B6x
         zuEA==
X-Gm-Message-State: ACrzQf1DFaxRk1ZjLgAiTlh+7ISlawDdsI8DPshk+SHCI9pBGV/9AsNY
	2HiswsoRAULSjtLHhG/uH/IjPNTdBFbeiuEi+mkjHA==
X-Google-Smtp-Source: AMsMyM7GEkmV9v4atHnaNyKsdWev7GfMxpVpWKrPHXn2WJtejlHSWRanZiQZYYiLQFAsWnFgfPu5INCphD8i9o7t760=
X-Received: by 2002:a19:c205:0:b0:4a4:60e5:5a25 with SMTP id
 l5-20020a19c205000000b004a460e55a25mr12642060lfc.139.1666617869321; Mon, 24
 Oct 2022 06:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221020130957.25197-1-fchiby@baylibre.com> <20221020130957.25197-2-fchiby@baylibre.com>
 <aaf7d4a9-c767-6a63-691d-e3ae00b206fc@linaro.org>
In-Reply-To: <aaf7d4a9-c767-6a63-691d-e3ae00b206fc@linaro.org>
From: Fadwa Chiby <fchiby@baylibre.com>
Date: Mon, 24 Oct 2022 15:24:18 +0200
Message-ID: <CAL8gX1d53p3WQkmFrpxLZ6AUg+x_ZtBxUw08eNbkCBMRgj=jQw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: add MT8365 SoC bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Johnson Wang <johnson.wang@mediatek.com>, "Zhiyong.Tao" <zhiyong.tao@mediatek.com>, 
	Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Tinghan Shen <tinghan.shen@mediatek.com>, Sen Chu <sen.chu@mediatek.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_062432_955643_D6C492B6 
X-CRM114-Status: GOOD (  10.38  )
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

Le jeu. 20 oct. 2022 =C3=A0 18:19, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> a =C3=A9crit :
>
> On 20/10/2022 09:09, fchiby@baylibre.com wrote:
> > From: Fabien Parent <fparent@baylibre.com>
> >
> > Add pwrap binding documentation for
> >
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > Acked-by: Rob Herring <robh@kernel.org>
>
> This is not exactly v1 then. Please use patch versioning and add
> changelog (to cover letter or to individual patches).
>
> Best regards,
> Krzysztof
>

Hello,

Thanks for your feedback. Everything is fixed in a new series.

Regards,
Fadwa CHIBY

