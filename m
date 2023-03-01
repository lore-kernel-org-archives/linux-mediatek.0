Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0717C64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 04:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JvFH86Wx5RN3SI+RWTx88o9Hq2BKwJTQQWbayEx0CcM=; b=SUBDBw8mU3B2puonnGTZ9LGq5V
	YXrOPAm02K74PWH7UJ2Zfw+XUnqwYxEnHGW5UMVnlXoK2rlKYJuGcmVaxaHZU5Gfbq/HLzmx1BECR
	l4xZSpXZhIMIoqH+73Sa/UEbr4rh6VThO8qMOcGvlS8Wgsop2bEFawXPGQ5EnXGAfIhzqKoiw0+mf
	kv/OUGmjmbOxud33R7sDPud5uZdWVeyccuq5ooMDLVbBp0CsfdFD9cYOULpw/ocs3D0TYmOBlsRmW
	H/n3hfK0jMvTq6E1mlJ5B9JCVPglJw2+C+fCtGopKM7TjIGQmVj6aAfHhLMyo8F7vorIV5akx+37c
	10UQYlWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXEU4-00F8PJ-JB; Wed, 01 Mar 2023 04:54:32 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXEU1-00F8Iy-L9
	for linux-mediatek@lists.infradead.org; Wed, 01 Mar 2023 04:54:31 +0000
Received: by mail-ua1-x92f.google.com with SMTP id n4so2853670ual.13
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Feb 2023 20:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvFH86Wx5RN3SI+RWTx88o9Hq2BKwJTQQWbayEx0CcM=;
        b=ZxaXtuNLzBhH5mOpcCdHHrxhSSkg3a6KgAkqv6gPCi/zvpxMijDYgKJ+q+pBqNHmFJ
         2pBzHrrmZqbgpSCptSqsurYJ/zG2ZQd+JtVAf2T6AOK8jix+Zphv691UlgwiPVIdVyXX
         b41vtyIfK3DVq3w8X4atBBuiJSOGJUZS6I1E0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvFH86Wx5RN3SI+RWTx88o9Hq2BKwJTQQWbayEx0CcM=;
        b=DXKlSp5ICbbDFiqWFYIbjBg/KGhoNogBA6W1VVY9MDHHhh99E50naTRM03z+Dj+beA
         IsyZB9gFZVGyWuYI26xGPmZBThUOxKK7aHJsYC+/IG3FfHV8gYGaNX/PYIsVszhsG5Vp
         oyIhU5snNbB1PQR8NvGe3rnmbOvvikjbS9qmyh+kLhpizvdYkAxZUeyysWaMgQrZBn3R
         u9rLTimatgU/+qE2mDmRJXuLrHwFcD7pmuQKgZo8i6R/11ErTSUZXrYD8PIfnMZSsfW+
         W2923ZGNup2Ex74YPRixavIhZzCJVRjVNeIZYARns/gm4Z+CBP64WYBrYMkTp+5rXmRV
         23/g==
X-Gm-Message-State: AO0yUKVUA85xfnB7Rz4t+aka8S8akjfyjUNWgb1vK+ZU+Lx7aJ2ZDP+1
	h8nHLS1YUEvYyCTMmk75l17+cJYjgEZyIOhS6MiUgQ==
X-Google-Smtp-Source: AK7set+THPJY0r+gq7j9HxAaYo15eWTi71Mf/1BMofHghCC0pVVWU1UG0wiC50b7oxUVS3QUrM4pEGGHHFx8WM+5gnk=
X-Received: by 2002:a05:6122:1884:b0:406:1fd2:bb76 with SMTP id
 bi4-20020a056122188400b004061fd2bb76mr2867651vkb.0.1677646469249; Tue, 28 Feb
 2023 20:54:29 -0800 (PST)
MIME-Version: 1.0
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com> <20230228104741.717819-18-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228104741.717819-18-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Mar 2023 12:54:18 +0800
Message-ID: <CAGXv+5HpKhmxALPiGQypV8b6q_E_Q59eVf6fGLzqkknCb-M7tg@mail.gmail.com>
Subject: Re: [PATCH v3 17/18] arm64: dts: mediatek: mt8183-pumpkin: Override
 vgpu/vsram_gpu constraints
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_205429_714739_AEE96193 
X-CRM114-Status: UNSURE (   7.53  )
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

On Tue, Feb 28, 2023 at 6:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Override the PMIC-default voltage constraints for VGPU and VSRAM_GPU
> with the platform specific vmin/vmax for the highest possible SoC
> binning.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Suggested-by: Chen-Yu Tsai <wenst@chromium.org>

Chen-Yu Tsai <wenst@chromium.org>

