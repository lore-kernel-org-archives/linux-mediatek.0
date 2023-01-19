Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46968C46467
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 19:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+U4onQw8J6//2ZhGgL02cz4dornnJ3jQwTHu/4YyLg=; b=VCiK5rdkFQzDJdSNJVM6v1LERA
	cRo5uMEReepPFTZOn9xdwTckFkw7+1Sxqr2bisA/Xfa6U6B3qPc5Sn9rtE7ljLIH6AmfW2a+6zMZo
	+UG6kVTXPXdmh3W3ssUBfaOvA+QTf/s1/m4Y4rB/QpUqp5TucT2TflTirwGO7AJ75BycVY3jql/HX
	ZN3Q+7IUyCim4yvOXyCDlAD//bflDHXt9cnmxjPeui9OlauueUFCdh9M0JHUgT+euHrIr2jjRx9qd
	FNp6d57X5DQsGRJT7YDW7jCooCV7PK1KCIVEvi5+EcfcDBL6eulhp/1WYAJ8qGQ/EFpaat+6lWsqD
	ZCxhp1Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIaVT-006ulA-Nd; Thu, 19 Jan 2023 19:23:27 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIaQm-006sQB-GF
	for linux-mediatek@lists.infradead.org; Thu, 19 Jan 2023 19:18:42 +0000
Received: by mail-yb1-xb30.google.com with SMTP id e202so3832244ybh.11
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jan 2023 11:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+U4onQw8J6//2ZhGgL02cz4dornnJ3jQwTHu/4YyLg=;
        b=latVkeTlJC1MhsTEw4hyUxoaOwZlYA8HI1VkQBSq6KkesQVhFnCjpqw5kDf9mJJLZv
         pXnwqATf83GvJqs66hWsEZcS4OA5GqjN+oZlQNCkHGMFyTyVVe5FIT+sv3M7YfTGC6ZW
         ryhSBZ5aez2AHOyoS+pRZRgkBggvQCa8XLJXrbFOnOG+qBUh0PjGbN3oVzczQz0w2xnJ
         Iu3tECiPKtT9gFzobXwPFYusR66FCPjjQMbdO3f19tEAmaUI7aQ1eSsMJt5zchJMxNzj
         d49Mx2Aq4x2IvtQNFAsk6dqdgCOUHTfjuJHTzjHdt3zhmR9/e+HYjsy8P0VFM21j3eTl
         McSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+U4onQw8J6//2ZhGgL02cz4dornnJ3jQwTHu/4YyLg=;
        b=hdvdlrZwDfXQTtF7bzi76WnEFuNmKLfJD9Z1G1pWPNy2pIyVAJ/Uo0mVLv7ZdqVjun
         7mWNB0ijq5mlfduZnw4h4Eb/tgbL00wH0i/tNtr5fHOfCCgSlcBdmKNwbBO5mE+25Qpy
         0XshdY3yJ6Af7SZpUSeqt54b2iJ4EX3/NzCp87oHoxXtNnpufkJ61F943EpuslOZ9woI
         8mgbdx2x1nlxsAd78pMbKevA7Q39iBh1HXGjrr8LlYiLdMdqy1BoJUjdE9Ybq+jkFw8A
         2bYyP/LBrsBMszJcVFu1YsBZYva+P076mPqt5A/2sgpvNi0oWWd6pIxVkXc6qXMyKTZn
         gZdA==
X-Gm-Message-State: AFqh2kp9n4Hfc3dpxmvihjGsppVK5DqcDCwJH6nrhGFbpAZIZnZKuJji
	HnraBGLIhzhDhuk1ex/JAxybvq0839MzHtsW8KtsuA==
X-Google-Smtp-Source: AMrXdXvdTXiCgoRxs/AtsimpHKT/QMbNhLg3oEemY0fsJQphWe6eLtMm87GW9EyUGmLS7gobT44hzZvCkU2w4yxVFro=
X-Received: by 2002:a25:4e54:0:b0:7fe:6d35:1a28 with SMTP id
 c81-20020a254e54000000b007fe6d351a28mr291812ybb.534.1674155915290; Thu, 19
 Jan 2023 11:18:35 -0800 (PST)
MIME-Version: 1.0
References: <20230118-mt8365-spi-support-v1-0-842a21e50494@baylibre.com>
 <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com> <60766c7b-abb2-3afb-aa16-0e1385b88a73@linaro.org>
In-Reply-To: <60766c7b-abb2-3afb-aa16-0e1385b88a73@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 19 Jan 2023 20:18:24 +0100
Message-ID: <CAFGrd9rtO0B2XWEEU6gtv39PndjdjLL6tbRWimWT3RvLu1GFrQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: spidev: add new mediatek support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_111838_090172_B1F36E38 
X-CRM114-Status: UNSURE (   8.82  )
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

Le jeu. 19 janv. 2023 =C3=A0 17:49, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> a =C3=A9crit :
>
> On 19/01/2023 17:28, Alexandre Mergnat wrote:
> >       { .compatible =3D "micron,spi-authenta", .data =3D &spidev_of_che=
ck },
> > +     { .compatible =3D "mediatek,genio", .data =3D &spidev_of_check },
>
> Please run scripts/checkpatch.pl and fix reported warnings.

Actually I did.
I saw: "WARNING: DT compatible string "mediatek,genio" appears
un-documented -- check ./Documentation/devicetree/bindings/"
But there are no bindings for spidev. I've made some grep on already
supported compatible devices like "micron,spi-authenta", but I didn't
find documentation to add "mediatek,genio".
Do you know where I should document it please ?

Regards,
Alex

