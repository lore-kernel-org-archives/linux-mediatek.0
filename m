Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC6FC88E4C
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2026 07:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=; b=JdzEsdeq0d9O3D7MoYGWVP7QA9
	wq1hKPVOg8ANLeXpTJYnn+aoCaxUmrxsTakQQe5OtiOGW062Jymk/Dl7QReOp4BknAVkasYGbClj2
	Ml4rfWh9HEgJAAdsOab0kH2WkdlFQDMJtDfizkc+tE3km1PzrY2b5jwad366MHe569TbEr16ugbXS
	wG+Fuw8qlKedTtrENuSbE4mmgzkLhLKpLuCXdC+6ydQT9gvl/r5WMUA/Xi465R8da5YPP9R2vG190
	GvSd0jskKZglOm/lajikJKxa2/3ImxUq6JF3AqOQU67jAuCj2k9z4ruqab/Lu+og7WqjJEgiOdkMh
	zoi5haJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wAq-0000000G5Dw-1rIm;
	Fri, 11 Sep 2026 07:59:52 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wAk-0000000G5Cy-27Oa
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Sep 2026 07:59:48 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cc891373e0so6311205ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2026 00:59:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789113585; cv=none;
        d=google.com; s=arc-20260327;
        b=BmMc2MsZioF77IqeeYtVf2qNnh4WOKAEKWfGXZnUJfd0GN5rhKEm+ZlsysHuZH8TiS
         ek7dfjG1shyTG828fTE4RoxlMlOTA6Eg2yqtFx4OEeNiq+k1yt6hlLOgNf3Z4A+EY7sY
         6xnWh5Ewr0IHsoyZfKIx0fqoXk39FrwqE0r80pjDiFliPKeaj+QSFJj2l8ysTXRLVYWr
         9Bg7uzM8m1Zj6bJ4MDVinPMdvgQXDXc5nlWUZTgFZIVMSXnRvX+HC72HcxuQsLJwEz00
         4FQXpwR8e7cIumItq2jt1P3njbX8HGYvcTdmPt+Yh8BdfuhJU8PHBhw83Kvy1DNrJBDk
         rCiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=;
        fh=WMooLWomec+a/RtmSQPg6tRBHLpc56KVyJY30XDBNSc=;
        b=oic44F3ed8c3V1apINja+Fw1/34W9dIYiDvBmIwuWobN3i005OVefTRzYJblUCwilf
         VmTNhXPM64IEnTUME60d+fY3OZh2bKQVF+IXZ6rW/gJl18QkNPlaa7q1EpYLzjZFwFgp
         jz8/AZgIAjZNMEJVrgGnVswpncBL6p+LSQiZf4/YKrbIqqQOHlHwUZNc75qp5Ft0WnY/
         dv2sUiAnWJK9OaIjzc72WIghdZ/MKBJ6VntG5SIYGFWnbYwm+JcL/LJiuVYfhqsf3WIM
         a5t7R0Z0U99BATLEwCnouYuUtbvONev6/UK0TvDrkU7rmBgGEAcA0z/TelIqXsHB0RBe
         Av/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789113585; x=1789718385; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=;
        b=YLHx6eJjdc6zWjkhL6vEFft7ArUsl1Lj2zkQE+K0tKJ3xO7CJaXZrhSSazSdEyU4/7
         kQo2HEscvieTwUMxxaF6Sf4cK6Up7kEHSDWA6KdmRkIotWVyMbiBSKI+3zgBs66cW+Vj
         iO2EA2VavsqqCS1grVg6wnVQnnjeaVBY+IMBenKJoJ9RXCg9FsqfCt/Atz6rAqZhGQKk
         3CPt1OstBhYMEhdocLJLOKzYsvFc5UTqRnFoJ3HeY+DVpWlwW3y2+X17nyuUv/h+mYjS
         dozjPAogwvEsY0cSzMmIZf5b8FILP4fnmSQisjxIFoy43SAXj5pUJXn9186WqNeKdklA
         rgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113585; x=1789718385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhsZxDO2Z8X2pi0uJMgCQyML9vz9sWK4s5OtsZHAckg=;
        b=ETUX2LOaabijIjM//DVwYU7FJJ+HBewdBQlM0YSrDNhmP+JuNHq8l71q/h3A6EI03M
         BXyUbVP8B2RrK+FRGkLDH+OgBP96QF6LVPYrhbG0CenzyG8vYGLWU7PeaIvDiB/AJCUb
         Rj5rHdE4cvvljJXSO9tf5yAnBJfA8NBjzstqksI/qtYI9jB70s2BxvzArpjD9NGloX8m
         Br4MuRJE3mQfjeDkaosuww1TvBZF42UgNpYQk2n11s39jaSfUKPHQkO1kvE96zsG7epO
         Q35CxYFiWBhRq0kcs9o/bt98z0TJQrFoyVJ1kTj93tKEudUsrV2x4AJ6oq/50ZVV959b
         uGMA==
X-Forwarded-Encrypted: i=1; AKwUvBySxN0Kxgq5WSb/hkFjxwi2pwwGPiCaqPJGZxdaRXDr4u2zrxBzD0YIsORIwFL9bgaOvE9PfwjyrYl5ktsHaw==@lists.infradead.org
X-Gm-Message-State: AFuF++kKQXrsoR63KJMBzs2awLt4o1LB33KfZ0yKnHvWyA1whrt9lSMG
	BI87wlN9XwfVd4+lNS/TJnDWtjYRZVVB/HdLlAhFdvOlzrKwcHIWXKaO5KmpokKn63FRfQ9XjLC
	U3MUG1E6zMXomCBzIo8Vy7lWa96srmwY=
X-Gm-Gg: AYBFou2Hlm6/N6pmGKTjakJ0aA+pKXajFRlh143tyAh7p6ASJBce8CIfB3MxEg5BKiu
	jObXp3HnWyGLfxEljgxfopxA14sO/wlPMfDpOUn8+sXCiMN4ktnw/KSOusxnREjndhoXnS+/sVc
	H8O/8NHdmKQacbHXonZzqaOyivM4yrdw8dPalBoqIBLHDAAj7OcQ2gDhWayjOys0Ke1QSV1xqN3
	OnaZO2gRByKt36IRCSdiGpYu70xntEQXuFEr/eDYcK+5HqyvRJBHeQEtrKqio/JIGer/GaMKk7C
	Ogt4eVpmvIuhggeMni/BdHEzm1Q5Fxp6Z55XLWmiMvzjTFeGhevNX/Z/WANNY5ZHIlaOMuKU4J6
	mUwgncBKQACot7lhqd/BMAX5DoxLxGSY8i9nkmYyWPVbvsjXOekPEbO6G5ixHcoJvs9vYrorLMU
	DAiw==
X-Received: by 2002:a17:903:32ca:b0:2d6:f6ba:263d with SMTP id
 d9443c01a7336-2dd300d2dcamr38221965ad.7.1789113584990; Fri, 11 Sep 2026
 00:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
 <20260910125742.150902-3-phucduc.bui@gmail.com> <aqKxadkfX9Tqx8JR@stanley.mountain>
In-Reply-To: <aqKxadkfX9Tqx8JR@stanley.mountain>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 14:59:33 +0700
X-Gm-Features: AcwNN1Wl0GTh-Z2Qm9Mk1VLPm1ruxloX7-jtdmf-ROLjbwYmLn7UVqKFYyP_TdY
Message-ID: <CAABR9nHCK4X5iZORmHkN_jH62e34H2J_rBLiWLkwcg+5JAJJVg@mail.gmail.com>
Subject: Re: [PATCH 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
To: Dan Carpenter <error27@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_005946_572684_2A49FC7F 
X-CRM114-Status: UNSURE (   8.47  )
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

Hi Dan,


>
> Better to name it err_clear_mux_setting or something.
>

Thanks for pointing this out, I'll rename the labels accordingly.

>
> Since you can't test it, it's a bit risky to start caring about
> errors.
>

Fair point =E2=80=94 though ignoring all errors isn't ideal either.

Best regards,
Phuc

