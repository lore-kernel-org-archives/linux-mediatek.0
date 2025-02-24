Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1370EC021A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Feb 2025 10:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9ewN9UcK/O8IjxS4nzCWkIr6XMGt3xZkhfiGiwkBrw=; b=nMd6VFYs+KP3qTdXAfkuLMS4xI
	/zxTiYAAKH7dnf4Fza3CYfea/hnQczeNdLCTstoIhxdNLDK0x9mrmxmjGHNIweAK54kL07h0etkrA
	lC0gbBhRPWpE4DTOqmZFLZGzChed6decpUvvNeCCRZSvCANo7nCGNWWiKZoxmj2QRyNb6v4vpkAeR
	ztbonlB+Dsp+W6HR/ORyoiV7O6FEhg6YFCWmjVooQPi2SGHNlVIuEANz2WmGbgMMxZsyUM/ASksqT
	C6oEYTCgcjvZ9JqnVVYLWfIekC0d8dU2z9Sjkg9Exnv4Nww46fOKo068h7RlsPNr/HCnI3aFH1Z9v
	dABPhpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmW6x-0000000DELi-1E9y;
	Mon, 24 Feb 2025 10:54:55 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmW3I-0000000DD8y-0nE4
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Feb 2025 10:51:09 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54524740032so4466098e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Feb 2025 02:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740394266; x=1740999066; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9ewN9UcK/O8IjxS4nzCWkIr6XMGt3xZkhfiGiwkBrw=;
        b=YFWua4ZURvROpAXbHSfcn+cOQY3Ib5nepMcOjwZPobvKAo2uTuJnkiIpsLtcsmear6
         Redf3hfx+/9vLPWVi+mbD7SK1GcdhpTwnLfrHQQ50Iz59fSnX2GXtKX9lZPKsRE1ZOUG
         apSmx0BqujtzorxPbmyuQYAWbafFXdsL2xgHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740394266; x=1740999066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9ewN9UcK/O8IjxS4nzCWkIr6XMGt3xZkhfiGiwkBrw=;
        b=wcayg6EyUEHzMG+sDoWLb524xBtiQauu4e/obHJpG76ugH5v9VeKeCqTYULQ+yYVc2
         PwPUHNpkUARQK2TOP7gBjeFuo2XQ1g9czzum/f8ji5av9AjUZdmeh06ERjIuBhovOH48
         EljG7SEEOhOQzirHkGsCt8vZE7PHuyRA831eVjln9X/FJXyc9x7zXCPsS4UvkZNmzeIw
         1rzNDvGhLmDmB5I4Hi7r3DzaD0MN8n93IJVtXmMnN2+su1vxLvreGDroJGMBKxdI+gwu
         up10oZLRR7TxTkN5fCckZvPpl0rZpgVjEB6N2nDV5/2Rt4WzG36UGkXJ0E/xfciXj9bt
         DyXA==
X-Gm-Message-State: AOJu0YwCabcGmowv3IgfScyLJmeVOUngztqaEO258D65fnu7oveGZ8og
	rzTF3hXd+l0qpmplB9fUSzg0iTESy5PnMFEkYecaDdn+DLQ06C/mUMpfgu/56cNtHCdgAZMwN64
	5SA95McGBVs44fuDSmAo5gjeVDmp/RcJytNtg
X-Gm-Gg: ASbGncvIvd/EQZuH5xk1T8AIg8qaXzNgffziE6VyLqvcatIAYo6pxgKFWd4R7oUIqcn
	K8KF7QDpP8/NiJTclzwMoO55NhNbaxvCVh5bZAZHxdWPY0IjOMPpeu7h0GFEod8RKQQPeJ4xhC9
	yrK1k+3fAKVfcXmw79UCEv7+6OqV7GqHXd9dY=
X-Google-Smtp-Source: AGHT+IHt7LwH1FhfjAD5OKjp2mvKbAZ/8l+aQ1Ipxz03xtQO7zWSEdSFIHFgBDAxXVoiGz8lGaTL7HUC1kS6yhy7A7E=
X-Received: by 2002:a05:6512:3e08:b0:545:1d25:4604 with SMTP id
 2adb3069b0e04-54838ef07c7mr5016745e87.13.1740394266393; Mon, 24 Feb 2025
 02:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20250220110948.45596-1-angelogioacchino.delregno@collabora.com> <20250220110948.45596-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250220110948.45596-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Feb 2025 18:50:55 +0800
X-Gm-Features: AWEUYZkS0SprGNFPq1iPBVTH9fxdvLxcztVS14fJMBAWX6iv5wuTONgtw46vcv0
Message-ID: <CAGXv+5GwY28s3m5jXX_CqKfK6iehJRhrwbEvd2=7Qn3u=L=mLQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] arm64: dts: mediatek: mt8188-geralt: Add graph for
 DSI and DP displays
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, pablo.sun@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_025108_226363_9DF6AFE1 
X-CRM114-Status: UNSURE (   6.66  )
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

On Thu, Feb 20, 2025 at 7:16=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The base SoC devicetree now defines a display controller graph:
> connect the board specific outputs (eDP internal display, DP
> external display) to fully migrate Cherry and make it finally
> possible to make Chromebooks and other board types to coexist
> without per-board driver modifications.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org> # On MT8188 Ciri (int. and ext=
.)

