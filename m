Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9507ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttVTobcerozJ0Qpoj1pMNzCZJWSC2cn6oDnQsoTO4Yk=; b=c3f/oA/FMFsPAcQvRfSHcIrskp
	z+sxJNr6WDtc3pdbj5MC/dro0tla83cK7VdYDMMquj3uwcO6uGK3u1ReKhHJmdFiQPbxUHMS94A+3
	JMs9ZvARotoUTH692qE7bxJXn7ctrALYpgrCPG0Crz1eedV9xxrHlreXh/wjl+pGLe1uPKHLnfs/+
	XPvIipENVsHI5FYAfMAAnph+u8YJAf4ktkkTjYwOXBvFEV6JLEK5rxhy5wpS5iwmfoWjDJCbBdEY6
	ZZ0ZoxeXZuHuiZcs5vPn9pEHqWFsfurISBpezhX6ksnb13ccWf2po6fUaDxRClyeBSVpWJarGG9Fd
	p6kC0mwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYpMK-009tTm-2R; Thu, 15 Sep 2022 13:56:52 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYpM9-009tE0-Ev; Thu, 15 Sep 2022 13:56:43 +0000
Received: by mail-wr1-x430.google.com with SMTP id h8so24048747wrf.3;
        Thu, 15 Sep 2022 06:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=ttVTobcerozJ0Qpoj1pMNzCZJWSC2cn6oDnQsoTO4Yk=;
        b=pSjYWnqqo/26XBSg9dVZ2nm15xV7jvJSoZr12r8ahlYYpQqY+8iOuXiAD0tmoP3X22
         G1Os0gc4T04ehMEV9GHG+11xHZjp5jUlm58zKxFU74XoO6H6iHYr1U//k6j2vLMpEyml
         W6aQATI4WZjAqxXcFLcpIZLW7K3xrtgBr6ggqsyIjlpevA1qwI9s2lhDoojygmBw+WyP
         CeAuR5RzdSk+T8VZjUYus2nKLFeOA0LGa65g5rJjxqdCAfwD+SQwfPwvAfjHWTyR5fl9
         9/FUM3kKWjxp6pjqwVoKMhe92t7zEKMUZlt+dpAeJKdmVw8FjudfxXWRud3ujbg2H0D7
         /Vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ttVTobcerozJ0Qpoj1pMNzCZJWSC2cn6oDnQsoTO4Yk=;
        b=c0F30l6Q9TWBQVqcNx0rBJlosm9DVQeEVcWgASQ/YZQYJeDSgZOF6g/p1kVgnAE25y
         YRtir6gI62eTxzKS/colZexeFxka5u6K4LXo41gB2xVYC4hDwtmvCbTjs4kqXOOTeBqK
         s23aA4+L6qrLet2DlCaxDuJz30jZi7QZ5yvsoxAibfuaejHjBkUAVbVCeoUKlCg8//qJ
         0aXzed+LIhCLfVYrClNtld0MCE2Mcwjg3pmf5GAWrDhUDav+PsfA9HJQ8ND3Jkk90kSJ
         h2C4/8XYqah7W/7IN6AAmu8HrdeChhXHlh1mg1bOIp4BvdDpT8R3OWMIy9GySJKKxWaX
         rTfg==
X-Gm-Message-State: ACgBeo1VwuSZ3fFLQNzrytADyxbTVw5ETouJ9ENdFVh40XCKYbXOktZT
	f2rc5UmOT2RP63YlRwh13iahkollB/RBMrMqMd4=
X-Google-Smtp-Source: AA6agR5ZTPI4AZK4A+FrjJmuKe4UDMj77dCsdAcnrftEdV9Wb+vy01c8PVlahsQwkc/FtgZV41i6mnQLg1viHqD/MEo=
X-Received: by 2002:a5d:4dcd:0:b0:228:d1e4:9cf1 with SMTP id
 f13-20020a5d4dcd000000b00228d1e49cf1mr23421819wru.182.1663250197399; Thu, 15
 Sep 2022 06:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <1663157936-5010-1-git-send-email-u0084500@gmail.com> <20220915134353.GA1168381-robh@kernel.org>
In-Reply-To: <20220915134353.GA1168381-robh@kernel.org>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Thu, 15 Sep 2022 21:56:25 +0800
Message-ID: <CADiBU3_6dXf1TUv9f7HbFfrqsfMUmT1Ejve6+O6OGnmTtxzpEQ@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mfd: mt6370: fix the indentation in the example
To: Rob Herring <robh@kernel.org>
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org, cy_huang@richtek.com, 
	linux-mediatek@lists.infradead.org, alice_chen@richtek.com, 
	robh+dt@kernel.org, lee@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	chiaen_wu@richtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_065641_522481_1139EAE2 
X-CRM114-Status: GOOD (  19.55  )
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

Rob Herring <robh@kernel.org> =E6=96=BC 2022=E5=B9=B49=E6=9C=8815=E6=97=A5 =
=E9=80=B1=E5=9B=9B =E6=99=9A=E4=B8=8A9:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, 14 Sep 2022 20:18:56 +0800, cy_huang wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Fix the indentation in the binding example. There're two redudant space
> > charactors need to be removed.
> >
> > Fixes: 76f52f815f1a ("dt-bindings: mfd: Add MediaTek MT6370")
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> > Since v2:
> > - Add Fixes tag in commit message
> >
> > ---
> >  Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
>
>
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
>
> If a tag was not added on purpose, please state why and what changed.
>
I'm not sure about the rule.
AngeloGioacchino said I need to add the 'Fixes' tag.
I think it might be important.
And I immediately submit the v2 patch and add the 'fixes' tag.
So patch v3 and add 'Acked-by' tag?

