Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3884AC77B73
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 05:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ik47P3Etu0ZN7dEwfdNxUGGecWtWJVtJjhAgZY4CeRc=; b=evtziORfuiCzbtlvRgURi1qw3/
	uBySP48ldDgQ0hbEiZEPY61sH8YNqr8k6Bm/hntmQtLwrmA+eNW82ylItAUhMLwUH5hyosg2D+p6Y
	6uKMvcijguPDB0zbIu8t+2Z6IjJdDi3ay43a8UK0TorSVJJP5690UPkV7zfkWefD9mf3HfynnFZWf
	52+ZQcsRSeSrNsuQ1DNh1mTNNpOxX5pt5PDUopkmbHJ+8Q3y4JDb3h7RUb2+eUayErpmG4BNqSmys
	0Twah6MkJu6/mbZSDQ+oERp/lSVtFqjhCNEYoQFmmEvKvhFFyiuFH8a0Tcu5S5dXv5TZgfWVw9Em2
	aQHsBtkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3rfR-00CRYF-1G;
	Tue, 30 May 2023 05:13:09 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3rfO-00CRXC-1A
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 05:13:07 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6af873d1d8bso1607387a34.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 May 2023 22:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685423583; x=1688015583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ik47P3Etu0ZN7dEwfdNxUGGecWtWJVtJjhAgZY4CeRc=;
        b=YBJDvUW7xmWLjhCphDFiJsZ7BKZ4DFusSLlejhEBsqmHYdyZpDFC0EoUSdHDLB3F0a
         c1G+/7UfFEsTdBqBNvw69gAtwuP8I0iLVoQAPn3kdocaOI4wRVpLsrkprJQaZy7SdvBx
         0qDNXLhg0Rjr9NgEcs/WHSEM3QxN+AgSIHHz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685423583; x=1688015583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ik47P3Etu0ZN7dEwfdNxUGGecWtWJVtJjhAgZY4CeRc=;
        b=F3tdhsidrpZPNwSVzuNaewJEbuGy9mj32t9HN2dPYZrTlmF2pH9BCM35909Z/8IFZ0
         hH87gUGXJWeg/GpnZAXteolIQroVYcqNWjm6xEn0QUS0SHoEMFsqUS6CT9IKNjPfEMxv
         vo7TPyOXKMVrZPM8lecBzgoDq389JqrYOzNVjb1c7wWZopzs11sFwCqWB96ZYEUZ5O1W
         SBS0P900IwvJNqNu5B+ZKPc1mjBKmwyKjR5qVvIltZ/0VKHiiF/8pW6QTmaVPfj9w/mD
         txobBwZUPYY7wnsABGadqBtrr9y6oQ++2Kjfi/lOl8Zs5RVRgcSvh0uFlnarKkkX76u7
         qApw==
X-Gm-Message-State: AC+VfDwBsVroc0jKkyc6Ol2PkI1xAjZvel0AygTkz28G/+SUCADhfhYQ
	yWF5i3G0Wh1j1bdEnylZaTUsIYBLzjRJOtdwi8HgKw==
X-Google-Smtp-Source: ACHHUZ6D3pnibJwrsrNe/P7w8YfHG9D5A4Pr78OnB3gLm1pFudeiYi7fn3Wi3/TlXT8sOlauUIcLPY87SO1MD2I+Mpo=
X-Received: by 2002:a05:6830:204b:b0:6b0:66f5:2817 with SMTP id
 f11-20020a056830204b00b006b066f52817mr518098otp.34.1685423581739; Mon, 29 May
 2023 22:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230220093343.3447381-1-hsinyi@chromium.org> <CAGXv+5E4_k1jKTnninYkuT6Tf=skB00AowHpM+hc8j_VFM-RfQ@mail.gmail.com>
In-Reply-To: <CAGXv+5E4_k1jKTnninYkuT6Tf=skB00AowHpM+hc8j_VFM-RfQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 30 May 2023 13:12:36 +0800
Message-ID: <CAJMQK-hnK69iVJhqW_8UtKHHLQ3608Cb74Jk_b+xHH0BBu4yVw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: kukui: Add scp firmware-name
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_221306_418470_CF450057 
X-CRM114-Status: GOOD (  10.45  )
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

On Tue, Feb 21, 2023 at 11:25=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> On Mon, Feb 20, 2023 at 5:34 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > The upstream SCP firmware path is /lib/firmware/mediatek/mt8183/scp.img
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

hi Matthias,

Kindly ping on the patch, thanks!

