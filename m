Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9257E68147
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Feb 2026 17:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zXuAzouuRg3toFw3pm0e1jWSf/XIYid2mK4BdyigN9M=; b=aA+QNpc/SeWul+z+A7K0Jt5gmv
	NcJOEoShR/BEuk40JS4cybsCUOzC6ff8YWJhOqlhQRsPSXNhlucImHF/7iISepsgmw5BYRNJZ/o/Y
	k8vtmhy55PCVdm0fhGcGzFCJox1N7qP83aVxXmlZfvDfgN6gxc/0YFNC1d1GogJQMwlNrFe2W5CgA
	Y2mRQacf7kRKplGVRSlCmJ5LEtqwnGr9PT8GBsrmrm8I1bY41Il26NVc++6pEnyWC3yhiJ2aztZVr
	soWM02UjUXqq4BuIDuh/5dP/uVmVr2uavjV6kLlmvAadQ/CFwhwwvhBT9hWM532v96G0RiNdI0DcV
	kkAxyqtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOWR-00000008d9R-0ijm;
	Tue, 17 Feb 2026 17:06:03 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOW6-00000008d7b-1h5O
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Feb 2026 17:05:49 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6581234d208so7466893a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Feb 2026 09:05:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771347940; cv=none;
        d=google.com; s=arc-20240605;
        b=d4FTSmsN3/BAemz6wdWF5SG934fi+fzYu/8N3TPoijqDYgiymazBT9N943CCJJKe8b
         btKDRsqtiJSoN9w1J9lhR+3LbRpSmNUgEIki4iDQUlBdCgw5jgTWwqmY/oJNt7YwRTA5
         yy/7vsqqyW+MuCyyl6nwktwV3oUdyKB785vznJLKyKR4cM0PZOouwr2u3oVeQK3rKCzI
         tV7syIWkVRW1AgFOMh1R9et0G2eIwpkj5sPg6nLrOAcjyPsTccNK1xCjH6riaQQGWP9j
         QJAPTpOOYKozHr6VWlCjshXQQCqeKHNiJxtWCJHZqlQAN3G6jSYWVZwxCc3IiOWPENpL
         Wviw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zXuAzouuRg3toFw3pm0e1jWSf/XIYid2mK4BdyigN9M=;
        fh=t7YDs3VWtm38BV9Kd2inW8nqop/mAv49ZB1Rb032AwU=;
        b=Nmmx9k//H3yI++Mf9fCsV1gVkWnrDbjndqxxizBqlh7Dk6PvtY4Mo/Mg+q/THvEAdg
         Q5tXNtD6asZB0npG9PgeVmecFiB/sGCjrmRy1+8GHhCzSGgDxGKjuRz/yUDZM7V9HTqS
         ETLsjyBBBrKv6oO3SVJEO39Ybn1d7wYN3QDzgGUIRijrhM7DYaXTY+N3hh7RkpeCNQ16
         U/pRPVRsWULUFd7mpsz9+Eueh9PNhwHbZk8qlzjvhGazHYghUHySR2FZLDoCX5rlhLHJ
         8toBcSFDd/bFw88D3ha5yyi7cXztE/YlRN6K0+FX0YwwEAPs8kEtJ4G5uHR7oKOPXgWE
         NDaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771347940; x=1771952740; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zXuAzouuRg3toFw3pm0e1jWSf/XIYid2mK4BdyigN9M=;
        b=abGbMoK5Q8svfnm42sM+D/yHw6Ta1IFEd2LcOGdPjUugiweo+BDgHuq6RzlJXxsuaq
         HlqAqrLcpfHtgTW0L75cXDh6MhU4CRVFimy6lbK8RbN6gZbfcU+qDOksDzUl3LvdcpHc
         g/C60jSMfM5Oq+GBV3GJmneAh6hikQ2tdWEUlUSUix5/waloKiJ/1S9r0erhEzUtC5P7
         0KceBHK14z08Qx4fHaNYafaIFBwWkoLf7ANzJL50AMhLXCB/7AvKckiQLzo3tqV0/3CL
         7GoNtguYnypQGgo+cPjhHyVCsJs7Ar3YaGGzQsRQH/fyliNo/WaAM1i2+p8pC2ihETgs
         9aEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771347940; x=1771952740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXuAzouuRg3toFw3pm0e1jWSf/XIYid2mK4BdyigN9M=;
        b=rvCgajpLewzX1n++Vp52TOng3JrotycNiYnK9DSaEn9e0LgLw/pYBVkQMMz//tJCzn
         xWVc5FxRL3MaTMZEm1BCYrTG0OETD15k6a4vD6RInBVcBqD/ZTnQifOOUeetyK2lQn81
         qv3sYvzWYldvYr0tsQiBVfRFt4uqTDK1fDSuWlvqS2fgquJmHLtQIYTKAHSReUWUR4mF
         87SM3VS8n6i0ZXPUenIYyAPEGBdvowc6MIBUdqREBHe0bNaLGWNWt3IEzV1b9OOMhAj7
         g871OS4r2OhA275ueZCgYTV6Kb8PP5mOGUpRklFjtIEmhWbiGIWayVWXndTpMQ6tdwsw
         U2RA==
X-Forwarded-Encrypted: i=1; AJvYcCWxcUOO/xBFVivbCvaQ5UXGTYZNRz/dBj5pwBLk2zmjj0Bu4TNyJ3rpqIgs9CguREW/WVJbDJI5W+zv17etKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDLuS4YVMfdtMNKBFBOn9v1GRxHP5XUaZRjOCD+isgR84Bon7n
	atjsxvXwqsolQdFfWIcjOP9wa1Ouuk+BS2f8j+mqyJE/zpSiCYpF5+6IHiR90hjbllc2y+KMprX
	wKAuafKr3dV+Z2uW4OSS1vZUKHb+jDxw=
X-Gm-Gg: AZuq6aK5C7QRVu2xsEcqnvZjp1cyAjzcM/Nb+CJVKIKCkRZBJxKNRx8c2s4+lfrh+Bw
	fRbGLMGxN7d1bn38nd20FEIYbLSsc1/3zKdBw/Z95T/Hr8m8V4O9lTEzfbe/n6sxWUOp61KARuF
	n1K0swv42WUqHI0KDIgstM+yhcFIAvLHvjPdCaiXc7As+R+Sz6jKgoCOmW5yaLG/LgqudBhs/1Q
	nodiMNm8QoL+CmqZ91vtl7j/x4HjLobTlgqS0V7I6y2YVCVS4TFZG1Aw0o1pros1myxrLqeJnLg
	xBgWEQ==
X-Received: by 2002:a05:6402:3588:b0:659:3fca:24d0 with SMTP id
 4fb4d7f45d1cf-65bc7a8ae2dmr5047427a12.29.1771347939988; Tue, 17 Feb 2026
 09:05:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1771258407.git.l.scorcia@gmail.com> <ff920a7cc94f2b0c03d4bb55142030fded30d07c.1771258407.git.l.scorcia@gmail.com>
 <20260217-stereotyped-dazzling-loon-f06e18@quoll> <04a3d18b-80cc-4d1d-8657-cb35c4b5b797@collabora.com>
In-Reply-To: <04a3d18b-80cc-4d1d-8657-cb35c4b5b797@collabora.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Feb 2026 18:05:28 +0100
X-Gm-Features: AaiRm53iuI7SH76CEM094B1BEHtAFaoag8i5brp7UnlMPcM5xtOtDulZoBRUZlM
Message-ID: <CAORyz2+MgywrE0v+_UYt8gewq_eZ=ZgTUR66tL8aBbBQU53sDA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: display: mediatek: Correct
 compatibility for mt8167-dsi
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_090542_459497_1E676D31 
X-CRM114-Status: GOOD (  43.34  )
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

Thank you all for your feedback! As I just learnt about the
merge-window patch-freeze
period I'll wait until next Monday before submitting v3 including the
suggested changes.

Mmmh. Now I'm wondering if I should have added a Fixes tag to [1],
that's actually an
user-visible issue...

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20260209090516.14369-1-l.scorcia@gmail.com/

Il giorno mar 17 feb 2026 alle ore 10:03 AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> ha scritto:
>
> Il 17/02/26 08:58, Krzysztof Kozlowski ha scritto:
> > On Mon, Feb 16, 2026 at 04:22:14PM +0000, Luca Leonardo Scorcia wrote:
> >> Remove the dedicated "mediatek,mt8167-dsi" compatible from the device list and
> >> describe it as compatible with mt2701 instead. It is safe to do so because:
> >
> > You are not doing what you wrote. The dedicated mediatek,mt8167-dsi is
> > still there.
>  >
> > And if you want to describe mediatek,mt8167-dsi with OTHER
> > compatible (mt2701), it is a NAK. It is wrong and not allowed by writing
> > bindings doc.
>
> Sorry, that was my apparently very-bad advice - and I recognize that, as a
> maintainer, I should have given different advices.
>
> Still, check below the (bad, and not enough) reasons why I said that....
>
> >
> > You just added fallback, didn't you?
> >
> > Please wrap commit message according to Linux coding style / submission
> > process (neither too early nor over the limit):
> > https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> >
> > Please run scripts/checkpatch.pl on the patches and fix reported
> > warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> > patches and (probably) fix more warnings. Some warnings can be ignored,
> > especially from --strict run, but the code here looks like it needs a
> > fix. Feel free to get in touch if the warning is not clear.
> >
> >>
> >> - Bootloader doesn't rely on this single compatible; and
> >
> > Does not matter. You still CANNOT remove a compatible. If bootloader
> > starts to rely on this single compatible, you add it back? No.
> >
>
> The issue here is that "mediatek,mt8167-dsi" was never used anywhere, and that
> alone makes zero sense as it is - by hardware - identical to mt2701.
>
> That, leaving alone the fact that nothing anywhere can make use of a node with
> just `compatible = "mediatek,mt8167-dsi"`.
>
> If it is not acceptable to remove something that was never used and should've never
> been there "alone" without fallbacks, it's ok. I'm sure that avoiding to delete the
> one line is not a big deal there.
> Also remember that we are talking about an old SoC that will never see a bootchain
> overhaul, nor will it see new bootloaders.
>
> Though, just a small note - please please please: when we see new contributors,
> especially when they're community ones, can we try and encourage them to do the
> right things, and follow the right processes, without being harsh in any way?
>
> And P.S.: Yeah I know you haven't been as harsh as you can (rightfully) be, so
> thanks for that.
>
> Luca, I'm sorry again, at this point - it would be great if you could please send
> a v3 without the removal of that line. Just add the fallback and that's it :-)
>
> >> - There was never any upstreamed devicetree using this single compatible; and
> >> - The MT8167 DSI Controller is fully compatible with the one found in MT2701.
> >>
> >> Fixes: 8867c4b39361 ("dt-bindings: display: mediatek: dsi: add documentation for MT8167 SoC")
> >>
> >
> > There is never a blank line between tags.
>
> Yeah, agreed.
>
> Cheers,
> Angelo
>
> >
> >> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> >> ---
> >>   .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml   | 5 ++++-
> >>   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > Best regards,
> > Krzysztof
> >
>


-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

