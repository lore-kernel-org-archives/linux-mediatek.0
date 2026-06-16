Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9A5CD98E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfw1ICkm7+kbiLyNwGHlM24bHrY+azb4TocUjKCxBR0=; b=KdIA/4kXZxSCi5Kz70Dxr7bMCg
	GTt02dnPJ5mNMs5tZ++TF03PIAMVdMl9tNRbLGUVh2JcjNRGMuDLrW+r4UAdo+sIcZ/BRH1flU+SV
	QX+Wed6rFAFTbyP9bgkkaSd/TIyRE3FoDtRDEmLAp6OeEvCl8DG9i9O1O1S8sp/SAH6pz6Vqjeup/
	/Lafi1zuSJG0X+4an05Sv/NWTibFgXQX4S6fZ87x2UN5iJnGWieyvB0I/jbCdwgEt+cVfb7EL/yYD
	hD7Y4TEauy8Qzm9CH88SQxLmSJNrhqEdIW7Ny/hz5WOkZs4BqbObfGBaeHj+1SktSd/zRgawRPlkC
	28jXEviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVme-0000000G1Oj-3aQG;
	Tue, 16 Jun 2026 15:33:00 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVmb-0000000G1Ng-30jy
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 15:32:59 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-68d23396ed3so8003845a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 08:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781623975; cv=none;
        d=google.com; s=arc-20240605;
        b=O0I6QyFeBSQC2G6GrOqJO1o/FGnNEsKKSjX1Esr2e28iWCV1I9zFUHZTJT/JvARWTv
         Oja3ayTx8wqIl8ChO0u/zngBFBj5a51wgxJqZgh5phIiStbVtk5Ywrl3gnptv1qjjbPm
         Eb656L7r806qT/Korg+vGDEAt6DThN492oC9EfOaCWxdD4nQEEgzx6chxVeWR0/XTCEG
         MKIugmYOTUvUP8CpSup8hAXWNLtRrpn3jnzYvxWmdp0T6WNnHQK1nmhjBMi74/kk3/fC
         r05GufkwEV2BZICZ/XnyXZE8CFL4fsOaqZAtNmXEIDpqicgF/ORJkM22xhnUn2FImukI
         4Q/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pfw1ICkm7+kbiLyNwGHlM24bHrY+azb4TocUjKCxBR0=;
        fh=bgkIKfJoq0jw6ON72pDwGAUaa6jhLAJN2HtG3sCxtfs=;
        b=QnkoWIkuf48bETZRMDLaElSnAz7aQ49WJHj5LjxatnJ6xFB8hviaoPfUSr6bC+1Oh+
         rkOoa593Sl1vmoWbvE1PRkLi+r/Fv1vxAJEkxymL/E2aRDTBbCNqt+H0+YoGNZ5pbIjR
         7cSerkhdqnusDix8vtB8waXWgAU/GQ3aBme/HMgW0WuBm1zORzfkX3Wb34TxYNYSe7w+
         IrPIlFKWHLrdabu9EZplGo4R4ZVRH16SqFl4nK/SfoEPx/1CwLkXzJu+VA9Ynp1IBaMY
         aVuiSd+Wi3fE5kspCP5C6enFx9Hvm7RW4H4XR0TMGlg5uDSuGfZBd7JV6CkxUpeYLiYH
         H+eA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781623975; x=1782228775; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pfw1ICkm7+kbiLyNwGHlM24bHrY+azb4TocUjKCxBR0=;
        b=mN1qAJjIIsJynl9XPOlMKA6I3N/2NU+k3/xn3PztDCdYgaMqRF0jRNti5n3H93PM5/
         GnDmfY1dX8I6kxcbfxDfs/3KKaXcU8yip/ZGRg/iTBfYl01w7QftAMUJGU0sDOBzT6P9
         uuHvpdxMIjyTA+8mm0bi+rM0GfADpZE6dObgitAQ8jQ3qnew9jNtA19r5aQqbe0L4nep
         3qPQWtvmzOOLMTcBftH/WPRjs0RwBGkxq4CF05l+4P0PKsYpYHa51ajX61rlly7FGc7Q
         H3c28Yp3gXq5+QuWCMAtNAmcoJzpx7M9uYQYfxueoW+67bpPi3fQUL3AItdf/yVVuSWe
         0uJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623975; x=1782228775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfw1ICkm7+kbiLyNwGHlM24bHrY+azb4TocUjKCxBR0=;
        b=hD4ZYic5EYDQublH0VUwp/HiskqLx0HvcJVzE1Wq8xpfJqu2bOKMma2Bavoe+j05YN
         ljeajHkvlhJqOJ53g+mVAsZkkaF8oDGRNIKjqW1yhxau6t7gB4I533RpAdLjk3GhzoOW
         VJ9v32KoMOL95VnD7PKbRjPtzJenOTRAqGOXVhIsMX9qypl5I+znv4p72HdH/Y0zxdtY
         zqd1/86t4yn6LTU1XVJ4oW26OE9spwjV0aBREJjhG9oLibYhw86MXsgVnATV6RKiqmyy
         V2wVgvJYh6Oqsp7llf4wDhrmEtDV1ElVEjs2IMogZuCSc8g0tqf9Yy+8XDubWwRJmGXt
         tziA==
X-Gm-Message-State: AOJu0YyzD7CXyCZzA50qd7Xx1WsjBnz+wHlixRFdVH9vf9SbFk0/mM/Y
	LXAfQTUigcPuakjATT/+S7uQ+p4zwNEBOpGMydjdL0J0qKa8wXD0SXf3jJLl+aPBpB8y+H+hwzo
	xgaoKdC2ZDpcchnecRJxBtHxm3HwZ6yg=
X-Gm-Gg: Acq92OFuvGyeSlocAS7avLzZWilGf2AUTdXLFcb47jwm8pZidUjeVbSmENCo1VsJ9rN
	Ze5UJXAH07wuWZf9JQA3MsG3cEi1IJtQAYO5f0cCFU/wzb/4HghzWW7ilaeP2yLhV+dD3JhnwS0
	L/Xa5GEC4W0HkOM51v0Y6tbyLh2c6pUIkRFd5wbDw2wC4QFgpu/Mr9qh7fwAn0OtjlRVLs6ToHd
	9oL1oEsda1rlxcrOIrT47I57ePFcsF4jIdOHLL3O/qWQoDoRgBpSuohit3W+k6YH/jWcg+ai+ML
	N/3K+Q==
X-Received: by 2002:a05:6402:3488:b0:68a:c8c8:bf70 with SMTP id
 4fb4d7f45d1cf-6950875d069mr2423072a12.26.1781623973864; Tue, 16 Jun 2026
 08:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260615071836.362883-1-l.scorcia@gmail.com> <20260615071836.362883-10-l.scorcia@gmail.com>
 <20260616133918.GA2335264-robh@kernel.org>
In-Reply-To: <20260616133918.GA2335264-robh@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 16 Jun 2026 17:32:43 +0200
X-Gm-Features: AVVi8CcxGgSJDcwyWDi8AM7eUTYUD6802ufCx2_1yb4EtV-skFio6HexhMd5f18
Message-ID: <CAORyz2LiMHnaTK6QnsLxJDtw0fZ_N9LELw0iCorOZwHuWXus0g@mail.gmail.com>
Subject: Re: [PATCH v7 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
To: Rob Herring <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_083257_774436_CA8FF888 
X-CRM114-Status: GOOD (  12.25  )
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

> >  arch/arm64/boot/dts/mediatek/mt6392.dtsi | 75 ++++++++++++++++++++++++
>
> Nothing is using this so it is a dead file that doesn't get tested.

Hi, it's not referenced as the dtsi inclusion was removed in the
original patch from 2019 for an easier merging of support for mt8516
pumpkin boards [1][2].
If you prefer in the next revision I can add another patch to readd it
to the existing pumpkin board.

I am working on a few boards with MT8167 (Xiaomi Mi Smart Clock,
Lenovo Smart Clock 2, Sony Playstation Classic) that reference it and
these have been used to test it locally too.

[1] https://lore.kernel.org/linux-mediatek/20190323211612.860-25-fparent@baylibre.com/
[2] https://lore.kernel.org/linux-mediatek/20200229170401.1287324-2-fparent@baylibre.com/

Thank you
Luca

