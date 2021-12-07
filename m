Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63181C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ehjk3eL93wTqoj62bK9KeQx+aZCIcsFdPvk7oRNVAwg=; b=wCBUwTRqgPt9cI
	IBbsYZJ9z7qvZ8c2m9EngDHg0dgY9bEHQp73aZj736JggVLvCekG9uuQZFyBlypp7qqJfCbhYgRrl
	n87TCJzDypW4N+E1wT+1yRNcFgvoaZrLjwIBVRRaCSZvbqq9be3BAVocIRFRp9YeiCbVvxasTJ2UP
	2fPtyFScz3FEFoeRKHcjUSsgK5ozjVIIpcxE4LFdTc4M6XFnj9KeVXUgorPo5i0zDOpc7GtqiGm3C
	Q5KtGmDGiyStNX809jTVfLl60S6QEbUs91ozEtDxdBi4EuAlUrSjiClZzziyntZORF2mBH73akRda
	U/PYt1kuaphDrZoLEwNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muZtd-008WaW-GZ; Tue, 07 Dec 2021 12:48:37 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muZs2-008Vs0-QJ
 for linux-mediatek@lists.infradead.org; Tue, 07 Dec 2021 12:47:00 +0000
Received: by mail-ed1-x534.google.com with SMTP id l25so56290750eda.11
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Dec 2021 04:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/xq6H3+Gju35XXL9JxKNpaAa8BNxCgs3E1gWrMLGFY=;
 b=lbM1p/y1iMGtUPc/ZRGftnmNQ4xf7kzFNEXCCH5czc3tsImvVr4O549nFcX0I6xBl5
 WNhRZRK+RvejAwQnsBEbSNq6Yfwz1m0IPgZOds3Mj9Po9Zb2KwrszL1YdGjOhTm7S24U
 n5FGaXYDCuzT94MVSl0GFK17PPVJqE6XPD1+Y8CyytOCq7tf//hsFck2aam+DiANtTwx
 aAft+fBSp43+Wh57XGr2cs8f1JbhdJ2s+/3ty5Bo0i/tGvUUBZUYUVOeWgLPMVKYTqjR
 oOs/E7lV7d4050nMGuCfMc78sC67r9MPeUSNiCfKetb/3uGQdHPwVX4pbVOPgHui+oDh
 kUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/xq6H3+Gju35XXL9JxKNpaAa8BNxCgs3E1gWrMLGFY=;
 b=wcXhyHmLWiOr95GfJqPfoiROEjDqxX47OO7U2fTWUgBAF365CxpvsJYbUfbv3BFPNy
 K5Hjx7ZFE1kBNhbwPxMYLwblrCIvCOD0q/Jxe68V3hAcU5uuoWY8bIbVY03OqSwzrrBk
 /LedGqcNkVpmihP/5uBaQN6UMNYLvY5MR69NqKZEyIRRNEDhdQct29ZkgCIdMR2BUAWn
 fmiwwjGUGgCSKOgdU4flqDBbCgCGUKD7q51i1I1Le/dGbMcn7YzMG0IIiQQ1dyYAHiv8
 OcmxxGKekFt1ggRP+hGT1rZV/p/euDJj43x9KKd2FnsH4I3WljVCuKzV7qQ3staERU/g
 yDIQ==
X-Gm-Message-State: AOAM531bUkZDgKLovSzXJ4YqKyzGJ/x1MJUUG34/i1jp7/okNrTQOFDX
 A//DAMqd+XOYjyydcM962a5YNrJGDYX5N+PCO7gyxw==
X-Google-Smtp-Source: ABdhPJw03qJnubMJy1q++3pwo7aYIWoOdaeknS4l22gDeU0RBVT4dOMGDF0SN4xhH5Q0iALJ5Y62jw6SC7JtlLqBeM4=
X-Received: by 2002:a17:906:3b84:: with SMTP id
 u4mr51654598ejf.310.1638881215471; 
 Tue, 07 Dec 2021 04:46:55 -0800 (PST)
MIME-Version: 1.0
References: <20210825063323.3607738-1-eizan@chromium.org>
 <20210825163247.v7.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
 <CAAEAJfDNDXdJFfB-bHhFcqnnKZ0TY--d_wLGddKRymQOLQY4TQ@mail.gmail.com>
 <fc309940c9e59f80397b90c8b11424fea344e1b5.camel@mediatek.com>
 <a0b3a10d-9313-7ac5-692c-822aeff50858@xs4all.nl>
In-Reply-To: <a0b3a10d-9313-7ac5-692c-822aeff50858@xs4all.nl>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 7 Dec 2021 09:46:44 -0300
Message-ID: <CAAEAJfDOU+tCjm=B8Mg0esZf=e99MM1cv+8SUN6sCBKq0hVvZw@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] mtk-mdp: add driver to probe mdp components
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: houlong wei <houlong.wei@mediatek.com>, Eizan Miyamoto <eizan@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>, 
 "wenst@chromium.org" <wenst@chromium.org>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 =?UTF-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>, 
 =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?= <Andrew-CT.Chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?UTF-8?B?TWluZ2hzaXUgVHNhaSAo6JSh5piO5L+uKQ==?= <Minghsiu.Tsai@mediatek.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 linux-media <linux-media@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_044658_879159_52023ADB 
X-CRM114-Status: GOOD (  29.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi everyone,

On Tue, 7 Dec 2021 at 09:37, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 9/5/21 6:23 PM, houlong wei wrote:
> > Hi Ezequiel,
> >
> > Thank you for your attention to this series of patches. I answer partial of your questions below.
> > Regards,
> > Houlong
> >
> > On Sat, 2021-09-04 at 20:34 +0800, Ezequiel Garcia wrote:
> >> Hi Eizan,
> >>
> >> Sorry for seeing this series so late.
> >>
> >> On Wed, 25 Aug 2021 at 03:35, Eizan Miyamoto <eizan@chromium.org>
> >> wrote:
> >>>
> >>> Broadly, this patch (1) adds a driver for various MTK MDP
> >>> components to
> >>> go alongside the main MTK MDP driver, and (2) hooks them all
> >>> together
> >>> using the component framework.
> >>>
> >>> (1) Up until now, the MTK MDP driver controls 8 devices in the
> >>> device
> >>> tree on its own. When running tests for the hardware video decoder,
> >>> we
> >>> found that the iommus and LARBs were not being properly configured.
> >>
> >> Why were not being properly configured? What was the problem?
> >> Why not fixing that instead?
> >>
> >> Does this mean the driver is currently broken and unusable?
> >
> > This series of patches are supplements to another series, please refer
> > to
> > https://patchwork.kernel.org/project/linux-mediatek/list/?series=515129c
> > , which add device link between the mtk-iommu consumer and the mtk-larb
> > devices. Without that series of patches, the mtk-mdp driver can work
> > well so far.
> > But with that series, it seems the device link only can be established
> > for the device which is registered as a platform driver. That's why
> > Eizan adds this series of patches to make all mdp components to be
> > registered as platform drivers.
>
> Hold on, so this means that if that iommu device-link series is merged,
> then the mtk-mdp driver breaks? I posted a PR for that iommu series, but
> I've just withdrawn that PR until this issue is clarified.
>
> Is it only mtk-mdp that is affected by this iommu device-link series, or
> others as well?
>

Like I said before, I think it's a mistake to introduce the component
framework in V4L2. This whole idea looks like a hack to me.

If we merge this, then we validate using the component framework
as a way to avoid fixing things properly.

Regards,
Ezequiel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
