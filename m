Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158C9C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Oct 2023 07:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OS97Gly969hAZsKV6Q2Qngs0Z2OBQT8NYeJbqEJuAuQ=; b=UDW3UUBnE/h4IWCFPHT4D18Z9E
	yWuXRslzE8fxxGrqnLw1hasHKLsT243dGmzR4Rnn4vn2htSbFB+D02VYDWAoSqn/gvdn2SpKjFK7o
	wqZdhIVcVQsQnlVYrhl/PPenCJ+MN74hc4r8Rr8WrecwvTgGaSeiMAxd5HMI8YohFXpYMD+HZQj8Q
	B95QtwXBpm/Z1MhjV4dMUdxkfSvyZYUH7kevXecdc581A92iJd7gmd3UxjCDWrM/D91kN84IWSCHG
	fJW2UzLbCX84CDd6jzT0hLiyDfavHD+QcN9uHQu0neOI0zXrrqUxBirhHF0J1l/9c160P78yCHrCT
	fMOcpUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxMld-002m3v-0H;
	Mon, 30 Oct 2023 07:32:57 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxMla-002m0U-0j
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Oct 2023 07:32:55 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6ce2fc858feso2438798a34.3
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Oct 2023 00:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698651161; x=1699255961; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OS97Gly969hAZsKV6Q2Qngs0Z2OBQT8NYeJbqEJuAuQ=;
        b=LKw0AADGqPe+zcAM/UUZYyxHWk2dLmvFIZPaSvzIpFFzb3UZTelyap+mPNgPCTMqeZ
         REAwrgXBhAOAIdMBQIH5BPyYAglT6EnzPSWffSgFDxIrOfjEUPhUTinTefiCwFE1IIC7
         Mekdk0FcjcmyZ5z8uAvk2u9R1O05x9Gyl45fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698651161; x=1699255961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OS97Gly969hAZsKV6Q2Qngs0Z2OBQT8NYeJbqEJuAuQ=;
        b=YzNGGHwAAhCdRqeUQUZqrQdSbntl5ax1ca1F63DyjXwJfPe41mdf89Cmh2GiVnjxH7
         dB33XgbPGPMZ+l0Jbqe8sEVpW4nszovvxHdQMv+oDoTdHF0gd8/qTcWPtp7UPkI4xXIt
         e465VeawZBnki66zsb4mPMkDO0wgn4wzj+GcIH+CBiq2kHzlkiH0wA47pEs9ZS0BvuK5
         bkYHsL9QzSrLz/JnuGL2nPRWvnMfzq18wccMNJlTsWee6Jxp6bTc6UOXwNjIrI8RZL7E
         GpkcSnK5XeQELO2RiKAgNEsBVwV/ynrVqVCBm22CVPts3FnG0AT4xJBK8jYSFbvEtMHN
         gCpA==
X-Gm-Message-State: AOJu0YxJoMIxsmIRlW9iWEb/KX17jkkUsy7uL/wXl6qW7jih/FqJ47QD
	bZBzrZM3tctKBXeGQi2FsJeLoj17XfUiZvUIgglbKQ==
X-Google-Smtp-Source: AGHT+IHL77UHTDV9OUWcsYurFmch++YSkIivuvKwbAT5lRWUVjbYbXkzJwGr33gA4/ptF3SP0jdxYIFIU1nbetPUscM=
X-Received: by 2002:a05:6830:4ac:b0:6ce:25a2:67cf with SMTP id
 l12-20020a05683004ac00b006ce25a267cfmr7644490otd.26.1698651161064; Mon, 30
 Oct 2023 00:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231026191343.3345279-1-hsinyi@chromium.org> <7b737537-38f2-4404-b469-c67005cdaf83@linaro.org>
 <CAJMQK-jQUHz8-hEx4DzNU3cOnN59JG1xFBPH5mUndLV-rbk+Jg@mail.gmail.com> <2a29c027-4431-4693-98d4-ba09ad46591b@linaro.org>
In-Reply-To: <2a29c027-4431-4693-98d4-ba09ad46591b@linaro.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 30 Oct 2023 00:32:15 -0700
Message-ID: <CAJMQK-jNa2ZTV4mSjMoPasM8TJVetExrWqZ_+6t77rVeAqqSCQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add a few mt8183 follower boards.
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_003254_264194_68768288 
X-CRM114-Status: GOOD (  14.21  )
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

On Sat, Oct 28, 2023 at 12:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/10/2023 23:22, Hsin-Yi Wang wrote:
> > On Fri, Oct 27, 2023 at 4:17=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 26/10/2023 21:09, Hsin-Yi Wang wrote:
> >>> Add makomo, pico, and katsu which are mt8183 followers.
> >>>
> >>> v4: based on https://lore.kernel.org/all/20231025093816.44327-1-angel=
ogioacchino.delregno@collabora.com/
> >>>
> >>
> >> Where is the changelog? It's already v4 and still no changelog...
> >>
> >
> > v3:https://patchwork.kernel.org/project/linux-mediatek/cover/2023102521=
5517.1388735-1-hsinyi@chromium.org/
> > v2:https://patchwork.kernel.org/project/linux-mediatek/cover/2023102421=
2618.1079676-1-hsinyi@chromium.org/
> > v1:https://patchwork.kernel.org/project/linux-mediatek/cover/2023102400=
0724.57714-1-hsinyi@chromium.org/
> >
> > changelog with previous version are in each of the patchset. eg:
> > https://patchwork.kernel.org/project/linux-mediatek/patch/2023102521551=
7.1388735-5-hsinyi@chromium.org/
>
> One would think but:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20231025215517.=
1388735-7-hsinyi@chromium.org/
> https://patchwork.kernel.org/project/linux-mediatek/patch/20231025215517.=
1388735-3-hsinyi@chromium.org/
>
> Usually expected is in such case to wrote "v4: No changes".

Got it. Would add this notice next time. Thanks!

>
> Best regards,
> Krzysztof
>

