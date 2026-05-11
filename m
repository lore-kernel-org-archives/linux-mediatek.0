Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E087BCD37BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 20:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTrWXUpjsMBBWpS2gSQWCp6gw+QRYwM+oHQqfF71dnw=; b=NnX7HPPlPy6h4EYP8AGFiGpaad
	csZ0uZJoIYm+cc38zONoWcWo9L4MdqU5H2XjwWhC8T1wNXavjOp8O7SX+NjuSM2zuxRK29WeNT6lu
	hOn5dT4mkq79f/SAovAV7gy74hxIImOJo2pyojMYKZO46TeM7SR1A66Zq9UQ52GMGRVX5qQeacS1L
	vGr2kN7gQKEJlfP8L8axlggBS3FOYTXxNmgjNsS/kaRCeyKE14u5xRe7V2obEzzHofd2U3gKo9RCp
	Myu3mprnW6EwymsV+XrrjqqLR397+7U8Rv2glqpoY0mO8D7aALJOf2e1zr7RYhYat1PHKfQvpKFe7
	2SdssSKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWxe-0000000Efs0-49kR;
	Mon, 11 May 2026 20:10:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWxd-0000000EfrL-1OSU
	for linux-mediatek@lists.infradead.org;
	Mon, 11 May 2026 20:10:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E451560103
	for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 20:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D519C2BCF6
	for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 20:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778530239;
	bh=lTrWXUpjsMBBWpS2gSQWCp6gw+QRYwM+oHQqfF71dnw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PYMGQ5SICzh6TMtYZllVYQ8mBoIBVyiWE6JyluRB+fj637AkoKx+rg9N8OVu6yBXd
	 2SCyWuajfyCbsIHOpZmp/sHCjqcSv56Bjr0Uvs7c3q6lTkY8f8mJuW+2K61WOB1ry7
	 piTykdQYp8a1vNDiN+OY/JQqhmlxRSBUa5lsOZET5UK2mWVb3o5n7+MeMtJx0GF0nI
	 TJhqHBpyOcoBv9yAgW/ts+hGEvg7CsBvZM8OEM8iA62u7O9NEgOr6RJJyWz0Je3QlW
	 5WMvLYHulsJKdEMtfcDcT4e4yQsOLwPa3zOvlYIEUR71RXH8PDFxjZp9Q9II8I89Yw
	 9o6hmQccGnPsQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a86bfa2a4eso5362037e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 13:10:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9CZ7E5abkVbC8GydRImOCC01SlIYV09/MJoWyBYZKJsmHTG92x0n9suehQurWKI8i11f17n8UWG41cIoHIOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyG1ZbIed5K9Dg7SsQKwbmbA14rA0GeMr8gBdfFwHHJUO91dgpk
	vDHfw9zIuyUBXTDpMe0LoOMXYjWxyvSi1XbWUPbPL3iPMI4aM9TQnKHKeTI5Wa28dIMdkqfeKEO
	NAOlzUsMC+oXW/5zSyShN95+rAQkZyus=
X-Received: by 2002:a05:6512:1149:b0:5a8:757b:80ff with SMTP id
 2adb3069b0e04-5a8e30cf5abmr22518e87.12.1778530238394; Mon, 11 May 2026
 13:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:10:26 +0200
X-Gmail-Original-Message-ID: <CAD++jL=-9-Oq56WEsBgTJsS3WR=wn4-utawnkNoq__rCSff-eg@mail.gmail.com>
X-Gm-Features: AVHnY4LZZFweJ9DX23kB3j5AOHEOM6q-LmnCTtTxpeyXfj6_HN_B5gNoCZt9TLE
Message-ID: <CAD++jL=-9-Oq56WEsBgTJsS3WR=wn4-utawnkNoq__rCSff-eg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: mt8188: allow gpio hogs
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Liu <hui.liu@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, May 4, 2026 at 9:28=E2=80=AFAM Icenowy Zheng <zhengxingda@iscas.ac.=
cn> wrote:

> Add gpio hogs subnode rules to the MT8188 pinctrl binding.
>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

This patch 1/2 applied to the pinctrl tree.

Please funnel patch 2/2 through the SoC tree.

Yours,
Linus Walleij

