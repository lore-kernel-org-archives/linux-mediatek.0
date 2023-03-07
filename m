Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD5BC6FD1B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 10:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OjoZPsqIE5ZBDC6k5US7ft7Fv6D8y/Y9uWB8Kp8Q1I=; b=yC7J/IMBAdfmqEUqjcUyrYvgCW
	4J/MqTwjn9cf18IAH8zH7ePyGHQp1lAZxU9Xe157WRaFCmyb2r2qTkZHcr+AHxixKcRKPuvmkh2YL
	cp8Gg2JnafsHVo1rDKLFK5luvJeL9gQ0NPC4VNqCoWvdl/Y11Oj1IsviyqKwbrh7dEFxvA2q4lCWn
	nZnc9s5A6WJZC0Nad1LjUqafxhEUIGmHvABPM1BBe29fAENG7lm8N1/yMZ/WrZC27RTitQGr15626
	IMFjhLmcbPEmbLYcSgID1x236Dx/WY9MjYWwPrThgCp4MBDi/dGdWmBK59ycYGTUYZRFcXrWFLiHj
	A0E7LGGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUYu-00HGwi-1S; Tue, 07 Mar 2023 10:28:52 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZUYJ-00HGZl-F1
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 10:28:17 +0000
Received: by mail-vs1-xe29.google.com with SMTP id o2so11836221vss.8
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 02:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678184892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OjoZPsqIE5ZBDC6k5US7ft7Fv6D8y/Y9uWB8Kp8Q1I=;
        b=Z+U2URwv5RAFmBuO1fEg8c71VhnLa2jYsgXMkp5j7Drw4naK5n5cxgxlNKPgrzSMyM
         FQzNREXnLmEfxBfWr6zvUaR2Ht1/1Agw21HatM5/ytBEQiNUbxJJ3cQXusQVS7XcRkr9
         OOzLIIWoz00nm4Y+rTN7eCzBboE0uhw5g0fq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678184892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OjoZPsqIE5ZBDC6k5US7ft7Fv6D8y/Y9uWB8Kp8Q1I=;
        b=W2QhBoWPnnWEu8/y/9FYYbDb7qmTZ+JeDD/jzNSvPR4Frjtu+P416ztgDA6qcMchEn
         /5uajBm2U1sNZkKzaVLqqwMjwCUGsSuThxL2rDNltYztLBo0Lh8GgLpOF5ONty4unVMO
         eV12AEkow2D6ecSCrQ7IDsAp+maS2s3qonlimmBCunZlaB17RSmmleStdwt/lQWwJGce
         7/W0Q/7dvO8WGJG7WLCtp+R9kBwr/38AKiYEpbWD4DsBAZUzGVTj1Wznf14hNoYtCmXb
         skZdaiefhDfRDv0X6/gliUbsOvYHypwLbiAHTA9S9IYdYmf+/aAoL2SLzGdeNPPa3a/p
         jSOQ==
X-Gm-Message-State: AO0yUKXZP9K8xL/KvIq+ssw4Qg4FpbS93E9AGC2UHN+wWJv0Qf6sqQ/1
	l8H/ua8Ox8Suj0PP/oQiwm+RByoi3Nei34PaZGWeusZCCWioOmrE
X-Google-Smtp-Source: AK7set/ITkAjaSaTIwYUailNdnAEo1658Tu042kqe1qbbCjUu+Xu1rTiwAP1U/AG7z8p4PHEwOzJI22d7OmcVvhg4Po=
X-Received: by 2002:a67:e2c7:0:b0:412:2f46:4073 with SMTP id
 i7-20020a67e2c7000000b004122f464073mr8850110vsm.3.1678184892533; Tue, 07 Mar
 2023 02:28:12 -0800 (PST)
MIME-Version: 1.0
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Mar 2023 18:28:01 +0800
Message-ID: <CAGXv+5Fv7AbvMzZdfwvZXvRfLmmKSpPLeAJUOKWS_VSzeVE0wg@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] dt-bindings: gpu: mali-bifrost: Split out
 MediaTek power-domains variation
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
X-CRM114-CacheID: sfid-20230307_022815_527604_D24A0E99 
X-CRM114-Status: GOOD (  12.17  )
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
> In preparation for adding new bindings for new MediaTek SoCs, split out
> the power-domains variation from the `else` in the current
> mediatek,mt8183-mali conditional.
>
> The sram-supply part is left in place to be disallowed for anything
> that is not compatible with "mediatek,mt8183-mali" as this regulator
> is MediaTek-specific and it is, and will ever be, used only for this
> specific string due to the addition of the mediatek-regulator-coupler
> driver.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
  with `make dt_binding_check` and `make dtbs_check`

