Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DCBC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jun 2022 23:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snp3iGaqneZhCYcg+mJvYJdoRp3WEYe5KB6c2iCBNGY=; b=QM67Tmiss6YxEQBTAEm4LY2C+S
	yjjoV45FNF1qOxY9qMaCdWT950cxAbWqAEzaP36lIwqFVj5V2yPpczkt/aKZd9iKTIpkbLHyj/5YA
	Q7L360jxZDY1hx4ztrfMCfgm6J1IIhTY8IxelfRnXv8Ef00c6ecYgHSMnz2qMms1XofB1W4rPwExp
	TGZHh/cx6MYjzV23dFr44Cyx2VzvFkZlkEpiR053FK04bzQQO2+hL+fQ6aaBM4+iSeX72Yom6GKPd
	HbrJYXW3oOy9FE3Op14FIqrkc28QG1MKMd6ZZZakEo1MkRmXcJyVh/HwS1m4phOo02e1VahmWx6Gt
	DBzKP5rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5F8R-008Oee-LS; Sat, 25 Jun 2022 23:24:15 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5F8H-008OaH-3R
	for linux-mediatek@lists.infradead.org; Sat, 25 Jun 2022 23:24:06 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id r3so10648741ybr.6
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Jun 2022 16:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=snp3iGaqneZhCYcg+mJvYJdoRp3WEYe5KB6c2iCBNGY=;
        b=mX7ki9rdSmFBpOM7J2F6TpAVrh+q9AOugB561QqMKdnnPsvj7lTxpDAjw1YZrpr/lK
         a6o/OSuXHO4aVEEvTgYx8Z4S0zLR7B7bqICfUPf4E519FKemyslijarshb7JNYNP7sF4
         U5yMjul43oUFF8uyxSxEzDyIl5zobf7y+ju6Zm8OiYxEpGcyxse7I1jKnapm3DAvHO+7
         D1aJo1feW7h5ZI6P//qg3y9oHuqPFu7gJw1rDlGPpNFDlHwPsohM0bhQaFMWRgY495qi
         pECOfUBgU/hXN7H8y2pXjMMYW7tCMCF2fTr4DbhBZuzwylronNmHSQO26HtfIPHr1k73
         x7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=snp3iGaqneZhCYcg+mJvYJdoRp3WEYe5KB6c2iCBNGY=;
        b=LTVmXIoyNg0vzRPAuXGLp2GXeYkbFQMehHczE5cBzZqbHVo30LMiJox+vgHLl8nnGy
         gzTidLaQIGic1gzKnNtdKRmeKDCgkjOpEAuaHLYkAt+7bv6ro1fxtbLS/UYXyIocYRFK
         xRBXoVCewgJKCRMYb0P5cLlREn7EKLid6vzUXUF4l94xamDbIzrR1Qh77iu/9w4ADvhP
         hCjFZZRu40bBWGwhMtB2zFuQIDU3dJHxshRJaAoYPJYRMHoQZ5yvJ6NHqQJjnauL7sj0
         kAllDso7a+e6+vJvHyqu+ycxXviDo2PFi47SlqdPegq6L5PYEajkM4dsc7unn0qW7srB
         nZEw==
X-Gm-Message-State: AJIora9xKidOBdu6GdenIOYG18VD860xYlo9FaFbt6WCMctWpY00HlCf
	gN/mHRPmQ3WTgkf8NP3Bi8LU8p9lQ5faeD2oFzbMog==
X-Google-Smtp-Source: AGRyM1v4F5AeLVv70A169NE0jVQ7LLku1NuKEEf7NHHauCphgfotPTI5cBGnpuqg7yZrgwUSLBTpBG0C9goQXoQgre4=
X-Received: by 2002:a25:7255:0:b0:668:a372:b433 with SMTP id
 n82-20020a257255000000b00668a372b433mr6460882ybc.626.1656199443079; Sat, 25
 Jun 2022 16:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220531221954.160036-1-nfraprado@collabora.com>
 <CACRpkdYe=qhUvyCw-xKRUihWiaezaEyQdHFhPt2aD6bmkWTpBw@mail.gmail.com> <20220615142349.qgxsnaln7mtbhgur@notapiano>
In-Reply-To: <20220615142349.qgxsnaln7mtbhgur@notapiano>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 26 Jun 2022 01:23:51 +0200
Message-ID: <CACRpkda1TDihnE1u+zVqn6_H6eQ3nDvRh1KTx7m_Yp+x_15Uqw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] MT8192 pinctrl properties adjustments
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_162405_171650_8264AEF6 
X-CRM114-Status: GOOD (  21.48  )
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

On Wed, Jun 15, 2022 at 4:23 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
> On Wed, Jun 15, 2022 at 03:31:00PM +0200, Linus Walleij wrote:
> > On Wed, Jun 1, 2022 at 12:19 AM N=C3=ADcolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> >
> > > The two patches in this series substitute properties in the mt8192
> > > pinctrl dt-binding for ones which have a clearer meaning and are more
> > > standardized. At this point there's no DT using the mt8192 pinctrl
> > > binding, so if such changes are to be made, they need to happen now.
> > >
> > > v1: https://lore.kernel.org/linux-mediatek/20220525155714.1837360-1-n=
fraprado@collabora.com/
> > >
> > > Changes in v2:
> > > - Dropped Fixes tags
> > > - Added 'if' blocks to enforce mutual exclusion of properties
> >
> > This does not apply on the current pinctrl devel branch:
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.gi=
t/log/?h=3Ddevel
> >
> > Could you please rebase onto my branch and resend as v3?
>
> Hi Linus,
>
> I checked out your branch locally and was able to apply the patch cleanly=
. Maybe
> you haven't pushed out all your local changes to that branch yet? Otherwi=
se let
> me know and I'll send a rebased v3 to see if it helps in some way.

Doing this:

[linus@fedora linux-pinctrl]$ b4 am -t -S
20220531221954.160036-1-nfraprado@collabora.com
Analyzing 8 messages in the thread
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH v2 1/2] dt-bindings: pinctrl: mt8192: Switch
drive-strength-adv for -microamp
  =E2=9C=93 [PATCH v2 2/2] dt-bindings: pinctrl: mt8192: Use generic bias
instead of pull-*-adv
  ---
  =E2=9C=93 Signed: DKIM/collabora.com
---
Total patches: 2
---
Cover: ./v2_20220531_nfraprado_mt8192_pinctrl_properties_adjustments.cover
 Link: https://lore.kernel.org/r/20220531221954.160036-1-nfraprado@collabor=
a.com
 Base: not specified
       git am ./v2_20220531_nfraprado_mt8192_pinctrl_properties_adjustments=
.mbx
[linus@fedora linux-pinctrl]$ git am --signoff
./v2_20220531_nfraprado_mt8192_pinctrl_properties_adjustments.mbx
Applying: dt-bindings: pinctrl: mt8192: Switch drive-strength-adv for -micr=
oamp
error: patch failed:
Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml:80
error: Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml:
patch does not apply
Patch failed at 0001 dt-bindings: pinctrl: mt8192: Switch
drive-strength-adv for -microamp
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Yours,
Linus Walleij

