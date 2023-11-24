Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A885C61DF4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 03:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcJej9WUdZZWtLL0jZR7KWhn0SxMMquSiq9yLi1GeNc=; b=AQes5khk1GZzs1N3aQODwfsqhe
	oRLHvTGFLi1ZbYb4OkhtahDI/6u42tu5PNdWKOnt4eoCkZ1zt75Bdwk42DM1ZRfQVOuzC7gQj5+E/
	bMQCOs7D3ERty0ah4Kxk/bMc1gfEFV8br9fLTeeLumkddUYPmn7hMSeF9WRwINg4qOSF2gcNWdjmJ
	ak88d8nZybQGt4DLPI2QGXMr5G4hiIc/RAtDgTRZrtaXv26phi8I3+Bpwo0THhLxFUdm4WPgKxXdY
	Wvw3Fi+LFq19E7Od2MhqL6rXyoWCmt4/6YyIikn8a5hUcpssmcNQwvFRprD6Sr+Q/5mo4nzO7418e
	PHtw83BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6N7C-0064Xs-1J;
	Fri, 24 Nov 2023 03:44:26 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6N79-0064WF-0C
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Nov 2023 03:44:24 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-507f1c29f25so2055061e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Nov 2023 19:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700797459; x=1701402259; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcJej9WUdZZWtLL0jZR7KWhn0SxMMquSiq9yLi1GeNc=;
        b=mGB8MZnWgFGu+daDqHkRn3ZpUVVlY+DsOpvM3lqnuCMx9DgV0+BbXRj8R+ON1owkGj
         XkFjliYHuUijepvYLPgxyRi4XqDwXNynqPtI25TDXi118hqdbOd1CU2e+exGtf1d/cnP
         OvymZ7c+eye37yqaeJsBwSYIEdP12gDbK4zRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700797459; x=1701402259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcJej9WUdZZWtLL0jZR7KWhn0SxMMquSiq9yLi1GeNc=;
        b=JvHfXI6fzkx1jkz+U0bZGx1h40A9xIcfIVSzIIcL/WmOsedmR560kPHFKTF8728OQt
         /PvxWPh9YjCNGIi4q3PFBvgS8lIahLnE4nEecO3AL+r3xAoam62lH8YinUq0QLoG8NJA
         6eHtiPOrmo7B+ADRVnriVLYvACfNT7J+pQ2QSrFbH5yN0k4nGbqPUnfIP0t4BAMagwiK
         oL7IJ2wNRgfcZXdALlDV1u9yYgKCnzJB7miYz3TPwXIkdANTu+cEHhiv4MZZZ4tyWiQM
         CnWHhmnt36lYoksfYZyikziueksWiM2jHgnI9HZyT7sbp0RbEIoubDHo7G5pkOKhxEez
         g12g==
X-Gm-Message-State: AOJu0YzpyoifIBqKmua6WS1tMvP8xRoYSK8BBrApFY4GD4UGGij3K9i1
	lDCqG6wo1+mTGlY/gkaTMPP2y5YWMjJ4gerZ3QR0Tw==
X-Google-Smtp-Source: AGHT+IH7191VcJzspX2lbzBmIE7QpGIGT/USZRwoE7pZJ5nRJbeokYOjJ7hZq8T0ALMqi3yp2bhgV8yGSW2RcGOPhbU=
X-Received: by 2002:ac2:5dc8:0:b0:50a:a9e1:6c58 with SMTP id
 x8-20020ac25dc8000000b0050aa9e16c58mr703080lfq.32.1700797458184; Thu, 23 Nov
 2023 19:44:18 -0800 (PST)
MIME-Version: 1.0
References: <20231123133749.2030661-1-mwalle@kernel.org> <20231123133749.2030661-4-mwalle@kernel.org>
In-Reply-To: <20231123133749.2030661-4-mwalle@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Nov 2023 11:44:07 +0800
Message-ID: <CAGXv+5EcT3OjyaW6LkARugWZN2AE5TWRx=Bh5TqfVBG2tcs5Ew@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt8195: add DSI and MIPI DPHY nodes
To: Michael Walle <mwalle@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_194423_151476_A65EC52F 
X-CRM114-Status: UNSURE (   8.62  )
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

On Thu, Nov 23, 2023 at 9:38=E2=80=AFPM Michael Walle <mwalle@kernel.org> w=
rote:
>
> Add the two DSI controller node and the associated DPHY nodes.
> Individual boards have to enable them in the board device tree.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

I checked all the address ranges and interrupt values and they are all
correct. The other bits seem to be correct, extrapolating from previous
chips such as MT8183 and MT8192.

