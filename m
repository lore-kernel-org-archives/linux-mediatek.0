Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284CFC76196
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 22:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GY3XURVYWCIcemLAr8O9Wiej+aFCql/3yCAZTzhHcSs=; b=gS0lCKnMZ7iE4hTRj1iHLbzwdg
	DlU8WZQPo2cCqcS2c+29vTqCtmtcU/cUdl9aljOrP3ufE+zKe4d4+pInTUwDmEigPr4sQs5fWd/ca
	tpgTXiKN1FtV+yNifmqiXmgv3RQgVPjarQbfPG6/XUynUlAgctWMVWsjcoRXgRi/yvRL6u0PoqV94
	2yc1ou7Egl36smYanCm6CCt9Ytz7Zxygg79LmHqJv6pqENlBhtDaAymtxZDZArS10+IuaOLqeZSm6
	J7RihoiWN+U9lYhDtaOMHzBXWaMNzeiKBDN4gAKgntGc4DGjJs+KgLuv9fLY6gVL0k6NuF269Urbw
	OartHzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plzsf-00G0dD-39;
	Mon, 10 Apr 2023 22:20:57 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plzsd-00G0cQ-1M
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Apr 2023 22:20:56 +0000
Received: by mail-yb1-xb34.google.com with SMTP id a13so6196427ybl.11
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Apr 2023 15:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681165253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GY3XURVYWCIcemLAr8O9Wiej+aFCql/3yCAZTzhHcSs=;
        b=VNcMwyYOH9xebcPuWV3dFdUJ5t+c0vlfeyFbDGAu53qPX29fh9SVStP0ZvJlPO9b0N
         HGUPWUOezP7UdaQQly+jeaBFl4E8qA23Xz7uxqiFVJjVk06p7HvPKC4HpaDgA8hjHlBi
         xJBgoAeN9xkOU2PpC0BwJVbfKvDVoS4lkBYBu7KCqS9MyWvrgGRFOUMaHfjuNdMcBmlB
         t5whbFRg6wPG6/IAA0+edaA3s7DXYbZij5R1ZQaaXIj+Tt3Udi0gJGEY7J1uyw+DDF44
         bqlj3OBWyJdp9QC/BJ6N+JzIVYy9nIQ6qdWDa2V8vJT4WNdbz4w5/eAIynxyAnLll+gS
         mBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681165253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GY3XURVYWCIcemLAr8O9Wiej+aFCql/3yCAZTzhHcSs=;
        b=5rCwLNTNYedpqhLLwXi0i+TzrkCe+LWpGiZCJNKk27QxfUqQE9wT7c8uDSrQekyEhY
         PSkqV0RgTxoKRimedN/MdHnw/XsYmhPNdOsR2Thcfap7205/gzWrq9Fen8l4JQ4hECiJ
         B4kOphti2Xeq2w8pyXrcMhWvf6gO6P/3AOJO2QNa4QiqOx9geEeGh0gIuLoQUPHsz8jZ
         /QqY8Upg/og5ShkCdZ7OMW/4qV9kYANtv/C/daZXy6cbqiPdDahKbh/j1IB3yCZh7NCo
         4GxZ7DMBSPwtx/ha4EmAil6I+JsDcFTnhpNk3/4yhSZ0AH0TTfHjPFJKzMFGpXRNu/Sq
         PgGw==
X-Gm-Message-State: AAQBX9coj6ktIDq0MjKtcs06Efdq30a2Eb1Vwv5sRkrvQFr65vNlv3wE
	m35N+G2/2/rjS4FOSIiTYR+fMb9RXt4kGhUkSziT2g==
X-Google-Smtp-Source: AKy350bXiLysNcV+Q+/hru2MCd67dq41AQdoznEw88BUw2uC8Wa1FCc0rGVz3dTyK37BVHXOUEC94ofML1oMScjzdTk=
X-Received: by 2002:a25:d994:0:b0:b8e:fbcb:d6ef with SMTP id
 q142-20020a25d994000000b00b8efbcbd6efmr2648692ybg.4.1681165253591; Mon, 10
 Apr 2023 15:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230327-cleanup-pinctrl-binding-v3-0-6f56d5c7a8de@baylibre.com>
In-Reply-To: <20230327-cleanup-pinctrl-binding-v3-0-6f56d5c7a8de@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Apr 2023 00:20:42 +0200
Message-ID: <CACRpkdbXvMsa=suwEZ64b1Jn9Tp2mD8CqhmwLhSHdtdAOBzN-Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Cleanup Mediatek pinctrl device tree binding
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_152055_465683_F5FA52B3 
X-CRM114-Status: UNSURE (   9.77  )
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

On Tue, Apr 4, 2023 at 6:30=E2=80=AFPM Alexandre Mergnat <amergnat@baylibre=
.com> wrote:

> Deprecate properties which shall not exist, leaked upstream from downstre=
am
> kernels, there's no reason to use them. Here the deprecated properties an=
d
> the generic properties which will replace them:
>
> - mediatek,drive-strength-adv =3D> drive-strength-microamp
> - mediatek,pull-up-adv        =3D> bias-pull-up
> - mediatek,pull-down-adv      =3D> bias-pull-down
>
> Another commit has been added in v3 to make it easier to merge. [2]
>
> Thanks AngeloGioacchino Del Regno to reported it. [1]
>
> [1]: https://lore.kernel.org/all/6e08d78f-ef4c-b228-f7d2-d63767ea87b8@col=
labora.com/
> [2]: https://lore.kernel.org/all/20230203-evk-board-support-v4-2-5cffe66a=
38c0@baylibre.com/
> [3]: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl=
.git/log/?h=3Ddevel
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Patches applied!

Thanks for you excellent attention to detail!

Yours,
Linus Walleij

