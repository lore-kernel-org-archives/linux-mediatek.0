Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C988FC004D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 08:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25UwbnVsrXF2XOi/rzL1DlQwNobgAwu6Gm3xehAhpEg=; b=rtgdA62zFwX4BcmQXjvvnN7imD
	q4c4BdvMqC/e38GuMQaW+NVNgyNrj+CMo68Yie65S1F9D//VLiQNwZIZKfwcwtVV0adJdK0tNt3i9
	Rs/9fQsi/V79lAIHERlDgSW6cGZ9fDB+84VMWazB+kApE9oyIoIqj2kmz4F68l38Kvvjx1Ee/ZUV0
	WKHEuzJON0ucccIlmXaNgLPPety0Mq6Yi1BfsnSn7Zx/+xW5DgoboaFwMFmGwdQb6NQ9QrtMLBYbz
	42Y1RVKfZBEbnpO1Oktna2cCS2L+xSnqWolGXXxt7VtGPDSFEbzAbS7zRHR88tMsrvjaTfXEVJCNj
	wYNNFLJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3ws-00HUym-Hg; Wed, 18 Jan 2023 08:37:34 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3wh-00HUvn-2P
	for linux-mediatek@lists.infradead.org; Wed, 18 Jan 2023 08:37:25 +0000
Received: by mail-yb1-xb34.google.com with SMTP id d62so21102164ybh.8
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Jan 2023 00:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25UwbnVsrXF2XOi/rzL1DlQwNobgAwu6Gm3xehAhpEg=;
        b=7STNftU56FeuGXCbKpxA8SkAyftYHoh2ddBxJLrGdwEMF2wSLs4242bL3ea7idm5Y4
         ZVQ/xvgum+hHgSjspxs86GNktGzef1nXS6Mo89JmiQa5yugKc3EeVHltuwxL+WF/pNdS
         +K37nonpOv3TdxAAYtLuBz9afr/v5GEmecEAozwXbxje8N+rYtBYhjqK1SY1832d17C5
         RSydKm1Znlri1UHuFga/UcmMn1Y2pX9kmXQ4HVHhy9Hmn9TBDGz8yjVny/4VHzBOW7pc
         rO9LAg34p8wTL1M9PSKiR0CRlB1B2GuzGZUvri8SOBxJz08Zt8e4Jc5lcosU1Oc6lIme
         L7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25UwbnVsrXF2XOi/rzL1DlQwNobgAwu6Gm3xehAhpEg=;
        b=J42GqvWVrWAwZHIrxXP1e45eC0GSoApm0105Jfo/DelGwoJKoj8guaioVvKX4AERLm
         TTs694yOx5BZfLSXweQg0CiZUTRFSUq7/SDmkbYPRYpqUZKdxg4IZ5Wu5MP1ndrJgpU+
         4S8bwM8KiDIt+IN/fPRpXYTp64JwGQaS/iXhkm1xJHa1A+FBCWlb2vGRtjqXugLftXxO
         mKoqIbGD9CRP0saAWHnNIeQEFn/GzE8LNHszIHFLlbMtvqSe/V8KEClGn4AfiD637Ree
         x9VgZn7N5z1dIBPSbZyUIecnr55OEwSjj/N/fo22mJL20Gs8mZxtbqaPJUEQJgT+p/TE
         DGaQ==
X-Gm-Message-State: AFqh2kp4rHSbOCr8KhrOq7qEf/gskA2bxXUFi585fjsEf+EPkhGlQiDD
	kiz90gWc3OHAlMxtiU+QgyHWLSJhVUBwhRh4uerVEA==
X-Google-Smtp-Source: AMrXdXvkAjgZueXUsTbnjRyYgL573SkSrK6hKqOKoelBS/6ldk0KA9UsmaJzrb/I41AEghUW3nnSomU38BecAKrN5lo=
X-Received: by 2002:a5b:4d2:0:b0:707:473f:b763 with SMTP id
 u18-20020a5b04d2000000b00707473fb763mr812592ybp.158.1674031039739; Wed, 18
 Jan 2023 00:37:19 -0800 (PST)
MIME-Version: 1.0
References: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
 <7hr0xe56uf.fsf@baylibre.com> <0fc0217e-f1dd-d64c-d43c-cd47a8acbfd4@gmail.com>
 <CAFGrd9qZzpxPWpiEOJacc9m2WDFB8Mgr5U5too89mZmqqFir_Q@mail.gmail.com>
In-Reply-To: <CAFGrd9qZzpxPWpiEOJacc9m2WDFB8Mgr5U5too89mZmqqFir_Q@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 18 Jan 2023 09:37:08 +0100
Message-ID: <CAFGrd9q9aMZLH71HuyDfCxca65bdeSnkO4Oe+PTsYq=+qNAWjw@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Add MediaTek MT6357 PMIC support
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Kevin Hilman <khilman@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, 
	Rob Herring <robh+dt@kernel.org>, Fabien Parent <fabien.parent@linaro.org>, 
	Tianping Fang <tianping.fang@mediatek.com>, Flora Fu <flora.fu@mediatek.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-rtc@vger.kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Fabien Parent <fparent@baylibre.com>, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_003723_351257_9D2E3AF6 
X-CRM114-Status: GOOD (  15.77  )
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

Hi Matthias,

Gentle ping to merge the v8 rebased on top of v6.2-tmp/soc.
https://lore.kernel.org/r/20221005-mt6357-support-v8-0-560caaafee53@baylibr=
e.com

Thanks,
Alex

Le lun. 2 janv. 2023 =C3=A0 17:10, Alexandre Mergnat
<amergnat@baylibre.com> a =C3=A9crit :
>
> > >> This patch series adds MFD, PMIC keys, and regulator support for MT6=
357.
> > >> MT6357 is a MediaTek PMIC very similar to MT6358.
> > >
> > > The regulator driver (and bindings) were merged by Mark.  Could you t=
ake
> > > the rest of this series via your mediatek tree?  The input driver (an=
d
> > > bindings) are ack'd by Dmitry.
> > >
> >
> > Yes I can do that but 3/8 does not apply cleanly. Could you please reba=
se on top
> > of v6.2-tmp/soc?
>
> Hi Matthias,
>
> I've pushed the V8 rebased on top of v6.2-tmp/soc.
> https://lore.kernel.org/r/20221005-mt6357-support-v8-0-560caaafee53@bayli=
bre.com
>
> Thanks,
> Alex

