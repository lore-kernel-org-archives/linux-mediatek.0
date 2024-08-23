Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8BBC531DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 16:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OCNvj/wx5yxOsb2/+mcktbpA3DNvcmR3VULCO7umQ0=; b=4EJ+aP5GTdvoRD5c2YDQAEj4YI
	7VVzua+/EmEIQM6MTJUV3vF0eVyOcH6eRqHPzJMdUhQrJlTtldbADFRmiBHNNgDpoc43UhtH6/yfg
	e9LwSO0yaUajLrk8081QURzC8aEWyTAkhqfPVF3DLrTSi+7ARVB99x84jpZq/nsJ5xzTo3801p/c9
	sQGjG0myEOsbeJiTNuKyD2Ur/vB4JL9dgT7LLTFjjbwiz5C4BT65Z+De3jigHth2LiN5xGDOMK9hx
	3IJAl47rBUXHZyNWJVjXecLLlG6qBg9qAKVlQzUNdT9cmi4pRF6wnlg7V57tIJ/504cUPruaYLbSG
	TC443yrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWpO-0000000HTAn-1eG5;
	Fri, 23 Aug 2024 16:07:54 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWpM-0000000HT9b-21cq
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 16:07:53 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5334b0e1a8eso2721083e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Aug 2024 09:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724429271; x=1725034071; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OCNvj/wx5yxOsb2/+mcktbpA3DNvcmR3VULCO7umQ0=;
        b=wE3Oi/X9uI8BsKM3ePqGO2v8XkAIFKjxUN/nPSiiYTWL3P6GvRKHS8P+XN0z6ZDVqk
         rdlhyAWBNnlGqcWQZ/VvPbuXM2sfJKJWODz+Vu4topEGewlM3rHmgBuec2QIbsWA/8f+
         C6OMrQZ9TdLYeJzjp3kg/LXzJQMyvQ7YX9WzsbjGEMt4hdM+0WwLoV0Thjrhj+FVBqZl
         SYj6z/yJbGDFVsFhRx3P4/bbgtnjfNUNnsKF7eDHF2bhHEKZhF/PlDuqR+HbS1ZFi8Bh
         9INJOJhDyAwBqzlSibJVQPbJhzL5Ct8puJ9cmF4Avy6RzFHUV0x/KZkJKEXM42lbghBm
         5HkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724429271; x=1725034071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9OCNvj/wx5yxOsb2/+mcktbpA3DNvcmR3VULCO7umQ0=;
        b=YbzXcTeLTi3H+0cBtPvsDv47XWzqWpDNHNh6tm1RB3mb3GnZNIktFzJPBBZqkdthjD
         4Vx/Fmb4OCAuGcIgUTo9Gt2h7y55kkqwPTD8zT51no9HNjM0QQPTCSjDwEtg4hkH4TDx
         JyQEwAOop2bEo4NIhWWg8Kfgny7VLlnigFHsYgZJ/Uy8Dq/mjH1CRiy+yHFi/Vg7kJjz
         zzVwsXimI6wJl78kTwnzOatvQ5oStd0pjV3g5k07dr/1wnOdtKx53GYhab9F5VEx7cj7
         5p2nivvWsftSyEfaLZzbuHFTVSQy7qiPP5U86QlHPjexQbJnLcoC+MTSh61RSZO6qTgi
         pzsw==
X-Forwarded-Encrypted: i=1; AJvYcCUzoYIhFs3jQNxG4ftpRr82sEV4lhdq1LhMk3jxDHM+fqLWu3xZ6Xymt5a5q8wWiz2UR7+ghNaaQ1AlYUdfgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWqnl8AHgK3oZ37DbAX36y79mUGRl1fGnmLT+Swri2cbpKS0MR
	k9AbXt4JX/t/p3J18NzEMzXNq+8+dIs3+CZKwnbalIlqGotZGLN1Azmlyz/ou3kN9DOFJ+9KUih
	+XWuOK4peMR2KvYjhCfpyCuGe52OlN2eXpy9I/g==
X-Google-Smtp-Source: AGHT+IGUI0PY8Ux0OZKUd+jbtCpSnv5I/wL6SIyMbObq48C6tOrwmIkWL6by381sXMMlDTaIRU35sAsSSqAQhXmpqJI=
X-Received: by 2002:a05:6512:3c9a:b0:52e:999b:7c01 with SMTP id
 2adb3069b0e04-534387bbf66mr2088604e87.48.1724429270252; Fri, 23 Aug 2024
 09:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240808-mtk-rsel-bias-disable-fix-v1-1-1b4e85bf596c@collabora.com>
In-Reply-To: <20240808-mtk-rsel-bias-disable-fix-v1-1-1b4e85bf596c@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:07:39 +0200
Message-ID: <CACRpkdZy9F-oh0sT+YhvgzoSrKQL78gK46wRbQ6d6jHYS5nzfA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common-v2: Fix broken bias-disable for PULL_PU_PD_RSEL_TYPE
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_090752_545345_6FC7F953 
X-CRM114-Status: GOOD (  19.48  )
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

On Fri, Aug 9, 2024 at 1:27=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:

> Despite its name, commit fed74d75277d ("pinctrl: mediatek: common-v2:
> Fix bias-disable for PULL_PU_PD_RSEL_TYPE") actually broke bias-disable
> for PULL_PU_PD_RSEL_TYPE.
>
> mtk_pinconf_bias_set_combo() tries every bias method supported by the
> pin until one succeeds. For PULL_PU_PD_RSEL_TYPE pins, before the
> breaking commit, mtk_pinconf_bias_set_rsel() would be called first to
> try and set the RSEL value (as well as PU and PD), and if that failed,
> the only other valid option was that bias-disable was specified, which
> would then be handled by calling mtk_pinconf_bias_set_pu_pd() and
> disabling both PU and PD.
>
> The breaking commit misunderstood this logic and added an early "return
> 0" in mtk_pinconf_bias_set_rsel(). The result was that in the
> bias-disable case, the bias was left unchanged, since by returning
> success, mtk_pinconf_bias_set_combo() no longer tried calling
> mtk_pinconf_bias_set_pu_pd() to disable the bias.
>
> Since the logic for configuring bias-disable on PULL_PU_PD_RSEL_TYPE
> pins required mtk_pinconf_bias_set_rsel() to fail first, in that case,
> an error was printed to the log, eg:
>
>   mt8195-pinctrl 10005000.pinctrl: Not support rsel value 0 Ohm for pin =
=3D 29 (GPIO29)
>
> This is what the breaking commit actually got rid of, and likely part of
> the reason why that commit was thought to be fixing functionality, while
> in reality it was breaking it.
>
> Instead of simply reverting that commit, restore the functionality but
> in a way that avoids the error from being printed and makes the code
> less confusing:
> * Return 0 explicitly if a bias method was successful
> * Introduce an extra function mtk_pinconf_bias_set_pu_pd_rsel() that
>   calls both mtk_pinconf_bias_set_rsel() (only if needed) and
>   mtk_pinconf_bias_set_pu_pd()
>   * And analogously for the corresponding getters
>
> Fixes: fed74d75277d ("pinctrl: mediatek: common-v2: Fix bias-disable for =
PULL_PU_PD_RSEL_TYPE")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Patch applied for fixes.

Thanks!
Linus Walleij

