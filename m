Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122A6C7EE30
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 10:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F71E3UpzmFBCRVZxJQMTTJKMF0O4a9h4QSsqieYJImE=; b=wuCEKPHGVEvkMQhjaEjm1LtXsz
	i7o+jEj35+TnNmGR954BcO6XED4vdhoXcuMntHD6RdfmMzxl+cI3BMzAnihqMZPXOMzdSeogNWnL8
	O88GaGXeTrLoe2Md4PfFVET4GyrqCrsZFKC8jb3JH6l2br0jaD82vY+zlkeorFEdYAujOOUwHtMik
	dMQUNXzQfewi9APMoww693s2/uI2KMY+iGU99boE/D7RHji2s87CfvjVj9TDG7s/UAi4HmWYAqw1N
	mT352TnwTrXwruC8eSi0GZyS00uqkL3RxiqJgN/oqI78wfyJ/szOuxrTT/QsiI1l4NofDv+E0zdGS
	rjvAyYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfuT-001d68-3H; Thu, 02 Mar 2023 10:11:37 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfuQ-001d4L-BP
	for linux-mediatek@lists.infradead.org; Thu, 02 Mar 2023 10:11:35 +0000
Received: by mail-vs1-xe30.google.com with SMTP id s1so21901317vsk.5
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Mar 2023 02:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F71E3UpzmFBCRVZxJQMTTJKMF0O4a9h4QSsqieYJImE=;
        b=g7ALksvYo4Y5TKYfVAoELDzniyk2kdOpFdcDy2wZYcUYgF9B0YYZ3EyzZEqklxFZfz
         /VbrBKfnf7SnMn3mLYBREX3gCLeuKepHs6Zfsz1fPQuEMd8OWru2wisGo0LiM5n7cC4L
         SKNQs/B07wKJAUVfe7KGVeiiNvs7Qw0HN4f1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F71E3UpzmFBCRVZxJQMTTJKMF0O4a9h4QSsqieYJImE=;
        b=cJODBPEjeLse8iiwMINxJ/gOY96zcye2zFYOevvlhsSEuizl0EIVVdtsqYgOmZhMyZ
         tUVNlo3g6l2pOydjjYe4bm15y8cXpmm89fVdBjocX7ZVyyvFqjXNybp9KdJj7lWsa1ds
         36BW6WPUyJm98m3cpDCDLZaW0axHBTWw8dZ5yT1sY0O5tUGx7DlxwoP+N9eG2mCCOhDe
         5U+K0iO7Znr/2DuHt0MZ8blxxysVQb1U7bMr+s7osIPyFBY/wJ1TH0wXqauuwBdOKmaM
         dyeqD0rAuQU4qBacqEEIUKWX7mmfg3JyGGAWH8PuWnNmzobNkwSFORiEOrdsFx3sZpmy
         Et8w==
X-Gm-Message-State: AO0yUKUyLXJJffBu93c4mKJk2avAtOXB95SRhPjuHQTNh/GOzUathvIb
	BtGR1dTCKPkfEQSGz/WzMPXQmJmIeN7iiaSe4Bf+7GqSYTKAXg==
X-Google-Smtp-Source: AK7set9brXVjcK69n8TTB+vu5Ng4CHXF1hEN00ewd4DqV5LxyIHLb/HguPNsiBvcQP9E8DbdbmwQRPaCB8g2Nb+SMLk=
X-Received: by 2002:a67:dc95:0:b0:415:2063:e403 with SMTP id
 g21-20020a67dc95000000b004152063e403mr6316315vsk.3.1677751893351; Thu, 02 Mar
 2023 02:11:33 -0800 (PST)
MIME-Version: 1.0
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
 <b4fc6bd8-e300-0f40-4216-8b99589c21cc@gmail.com> <895abaa2-5fd3-9928-4e53-86ce160fbad8@collabora.com>
In-Reply-To: <895abaa2-5fd3-9928-4e53-86ce160fbad8@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 2 Mar 2023 18:11:22 +0800
Message-ID: <CAGXv+5EPVhH-O+ZdoLeW4OZVcEtS824oracmu3jHTa8k-tEU0A@mail.gmail.com>
Subject: Re: [PATCH v4 00/19] Enable GPU with DVFS support on MediaTek SoCs
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_021134_478871_A7FCE5E8 
X-CRM114-Status: GOOD (  11.00  )
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

On Thu, Mar 2, 2023 at 6:10=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 02/03/23 10:36, Matthias Brugger ha scritto:
> > Series looks good but from my understanding has a dependency on:
> > [PATCH v4 00/12] Panfrost: Improve and add MediaTek SoCs support
> > (https://lore.kernel.org/linux-mediatek/20230228102610.707605-1-angelog=
ioacchino.delregno@collabora.com/)
> >
> > Did I get that right?
> >
>
> Yes you got it right - without the mentioned series, this one will do not=
hing
> at all (and will also fail binding checks, as the bindings are introduced=
 in
> that other series).

Please also let me test them on MT8183 and MT8186 before merging them.

ChenYu

