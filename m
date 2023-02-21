Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7408C636D6
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 03:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UR3Xvq78uQp5wq4siQlq6Jxdo9xg2xftO043/9/2BQ=; b=2FPzkiOstLf1o1G3N03gte0CiT
	SnUTZdgS0SUt0O2PLsZ/4exJzxEE8uXYIAz8a71Re/5Ie5Efko/kzbsliQffE5kbcRppIro2nglNq
	aiby4zNWb3CEc0r8piQ7Mw0zcpOitQ/upSqrPQn+64/TYDklXFVnSxqaof5+DxINPtxyd2FIqUG4/
	n2douh3nrlEwjzuXFqHp++bVniJjK0w0ykVPxLmVQ2BgCBPfuxulVgPHQYJcmaX5ECarfBso0cUli
	DbRAy0TxdolzbpmJM+Re3zhcxAK4rPVc4W6knf1pL537+vBvinXfzT5X8pw2Mg0CeLAjMS/g9arK1
	FkbHm1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJHB-006Qdh-Rx; Tue, 21 Feb 2023 03:25:09 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJH9-006QcI-MG
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 03:25:08 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id o6so3173172vsq.10
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 19:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676949902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+UR3Xvq78uQp5wq4siQlq6Jxdo9xg2xftO043/9/2BQ=;
        b=ZQj3zbnB6E4cvZ4tXYCyS5ZTMxonUzLr/4MAMI/UltY1SuQc8DsxavGhftmcqqKLe8
         x+SH6qeW2NyDf56WncpwNVMp9mZx3DckqQT+TVqegixj0bnIViRSmqfTFBRgLc01vBeD
         iaVgezIc7Wb1uiurVTdMJbukTHOEXO4ohFGpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676949902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UR3Xvq78uQp5wq4siQlq6Jxdo9xg2xftO043/9/2BQ=;
        b=FuZSmwl3D+TN08CcsBFbdaAP/8JE32k1kxNaQ6TIU6PYzTHH6upBotRPr3VdF8chgH
         PNr1O2PVPSjY4HYbpYFMjDUnr8z4ttuZdxprFsLRw8/ipApkbHnBlAWsJICneYL881It
         xD8Ays1zpa51LMRiEihG63AmdEEqlc8Qt/x/uXfwrtGB1jp4Ck6ypW4mLA/yakPSgrrP
         0SIeTEcopFdKB17D0pn9x5NYK2fYYmu0WsEKshkjV027Pt1ZIBKqONG4P3tQfMvNiVtJ
         459dX77500MqErJU1c4G47TaQ+wfd0BBgJXqAHdgK/AAmGjtZZsm2D7+PJ/ZZmCvOMrh
         6QEg==
X-Gm-Message-State: AO0yUKWNCuHE8XrE9MCRZQQxAQj2+unzMx7+H9ssLLQLuSjauVunrUyp
	RCQ1Zu9lQUhgAnxWO9CaeQoUdAft0tHXy+g9H3lpog==
X-Google-Smtp-Source: AK7set+1aQzZuQeeKCDIsxkASzIMVCJfgtPqOEM4H6n/OAIRrb66ahir0RSw9gBclNHrmJwj6oTSGXqUKOxxpFXRqCE=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr823493vso.44.1676949902247; Mon, 20 Feb
 2023 19:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20230220093343.3447381-1-hsinyi@chromium.org>
In-Reply-To: <20230220093343.3447381-1-hsinyi@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 11:24:51 +0800
Message-ID: <CAGXv+5E4_k1jKTnninYkuT6Tf=skB00AowHpM+hc8j_VFM-RfQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: kukui: Add scp firmware-name
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_192507_747793_A78713BE 
X-CRM114-Status: UNSURE (   8.06  )
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

On Mon, Feb 20, 2023 at 5:34 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> The upstream SCP firmware path is /lib/firmware/mediatek/mt8183/scp.img
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

