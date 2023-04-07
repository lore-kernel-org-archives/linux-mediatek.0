Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494EEC76196
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 09:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5FppLWQucE53T3kVXc5omQRaDshsHkdpFTYRMesBnJY=; b=JZmhq+ENqye+jYYWu4MYUrbtj3
	R9pj60aUbW2kR1YNo4hAsTNW0a+GcJ7ibBh3rcDvLK4c2mxOH//2H1lh5HDabu7JEQN5iUMyyb9FN
	w6r72Ofsuyf3FbN3b6qfxoQSg5PGVwUhROTqWu9DFzLbfoSTVNqQ6idApwzazMIFjdLjnuw+xmZ4B
	DoD4ffZ9e0tITHa1TkH7r82Gvw+OBnh9x+WixVtrOLQObwQxQewvwsfoueIYHTur0pnybxvLn3FBM
	1ccFrsr7ryEK+RzHjtelfQ5v/gddYdBp54H3NfNpGoo1u1FF1mmxHnCFJQ09lJs/pkOyobFYZ+qzS
	usDyFi8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhzR-009aBm-01;
	Fri, 07 Apr 2023 09:02:37 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhzO-009aAA-1u
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 09:02:35 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-54e40113cf3so4726187b3.12
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 02:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680858151; x=1683450151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FppLWQucE53T3kVXc5omQRaDshsHkdpFTYRMesBnJY=;
        b=XWXfbomq+a4GK+g4J603yOrle7HXbOCD0/bqXm/1K9d8zN1hDEfnng2wRGWQQHoXle
         paFjj9n5UVWz2kUKSmqiewCEgyZAhdcA/vXKSFWJDZh9E29EJ8vY+hC9hJrP5G69zbcD
         ED6LrQJitNeWtvI4H+y1I4YlF3D1ei4vwOgMZVIHjnngPPfyb+vnu89OjWpxvsb1WXmE
         YtbeKsto7G8uvQytTakqcgBjZzWf9ZehVTVs8Nz+96IvQ6GofsN/43hOzCu8ifGycHCP
         gR7/b93durtrSp3lc52tU9fDAfDLkOUMRKptTf+w0pXA5KbcDbNd9sXT04f4xWIIQDVZ
         T7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680858151; x=1683450151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FppLWQucE53T3kVXc5omQRaDshsHkdpFTYRMesBnJY=;
        b=ZVYSAEpIu/0eahfw323h415ONEZYbFBPMlDggvQ3mLhAYycAlawZ/CPveWg+dLnF3m
         PAQTud3TVCPHZCpVeTe3wcOF1oE27vGKzPACjFzcGetLJ7dMGN+vD8LiEDnVZzmIkMdY
         /pKuJrhr683klUw4ReWNYCsIqgfwKao1ejnwa6w95YiL+a+F0t6Fw2eDmm4bVn11CClb
         h9uZgVNbFuud3e1aQ9ET+dq90wJvcf8HH3NFQxGZUr0RL5PHR+TaiUh2etAH5rInuv7q
         HWxXoPZbK8g4tUy0DzgksZQb6fRTFvLZy8fsqmif/6bt2nKYD6vG13DaEpMcTKEmH/vm
         YVGg==
X-Gm-Message-State: AAQBX9dgJ1J2lmzu7j4tdO9ctp9KO2V/MQ/QVkPdhsJiq0RE728P7vzb
	20Zzih63HK/5kek+3V1+E9hHM2itP6fEEXzgE7i+PQ==
X-Google-Smtp-Source: AKy350Y/lfTR5L2LzB5ArFA2L6SsDySfhY/ENMv2I1LxVrMSWs3AzbbfRwRcz8JUhh1u8o30utGVfpOODc+PoOLxouM=
X-Received: by 2002:a81:c406:0:b0:54c:fd7:476e with SMTP id
 j6-20020a81c406000000b0054c0fd7476emr707442ywi.3.1680858151110; Fri, 07 Apr
 2023 02:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230407-smi-driver-v1-1-036d6d8e8993@baylibre.com> <796300c0-19e9-2c22-8385-1b33a92bf02f@linaro.org>
In-Reply-To: <796300c0-19e9-2c22-8385-1b33a92bf02f@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 7 Apr 2023 11:02:20 +0200
Message-ID: <CAFGrd9qQWsu13Qrraz16JEO1rZhGYZd0zk_nPQDq=Q2oRyWPLg@mail.gmail.com>
Subject: Re: [PATCH] memory: mtk-smi: mt8365: Add SMI Support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_020234_630940_276ED634 
X-CRM114-Status: GOOD (  11.98  )
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

Le ven. 7 avr. 2023 =C3=A0 10:41, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> a =C3=A9crit :
>
> On 07/04/2023 10:39, Alexandre Mergnat wrote:
> > Add MT8365 SMI common support.
> >
> > Reviewed-by: Yong Wu <yong.wu@mediatek.com>
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> > This serie add MT8365 SMI common driver support only because, to be
> > bisectable and avoid issue, this driver change and the related change i=
n
> > the DTS should be applied in the right order (driver first).
> >
> > Here the related DTS change: [1]
>
> 1. Where are the bindings? They always come with the driver.
> 2. Where is the changelog? What happened with requested changes? How a
> review tag can appear on v1?

Thanks for the fast feedback, I fix that right now.

Regards,
Alexandre

