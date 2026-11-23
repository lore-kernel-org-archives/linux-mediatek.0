Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47687606A33D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NZibea4r;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XfPB5P93
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UXpd3Nh2t45ncSVSh4QPOrYvcJiFSBL00rNMi7DJgJk=; b=NZibea4r0pKfp5
	VgcvUpcuqKnCKi+69asg3Ee9KSQKu6iFLHgo9hPnUeDhRHTjwkh804cQ9pC/Bse5IjyydVRNe7MU0
	bMSh01XMi/sZp/uIAUWtxmxWa9gwrM7Zczg6SbREk6ugcGkq/WILernpaP/TKwrYD20Y2wo5o5IO4
	uNFmiN0t+LnJeJAoIXxBel+VKTMZwlQcsEL/Y7DNYEF7gTyJoBln3l1vk7jtKHpH/EwgYhaBH+hep
	ookNbMrHpq/a2UDaiLHJTFGIZsvX7ZLdSrklWkZTJFTKBpK64d8Pko5YvabkCVwuDqJxH6jEN8iRr
	9RjQHTUMjtt6XlIXZJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW5y-000000041hd-47Vs;
	Mon, 23 Nov 2026 15:36:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW5P-000000041By-0Jb1
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 15:36:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 732E262334
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 15:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 290321F00ADE
	for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448166;
	bh=UXpd3Nh2t45ncSVSh4QPOrYvcJiFSBL00rNMi7DJgJk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XfPB5P93HP4vbKYlZWXIzvsr39OBy4OsyaLsBLvVeoS9AAZ6PTkbcgp0qeWPSkkrV
	 wxzI/QYnUkCNN+zR1cYRChx0Twos7wOKJ3HYbovl51vv3hQp2J/sgIQy95EJDqeG1w
	 eEDo644Q+/um0iNAjY0VsuG9sJTu9mcn+f1HdKCYRH2Mi7+1jsBXqUTkQBpWHC5Xt2
	 PFB70kEXrhiVblbGVZu5igGcOFMWyN8HBX9vsokuGGg1aOiIYOqzOIXjR2jRtIV3RH
	 7PhUC+AYpUv9Br5airvjFVcL/Qo638f5xSffOhjyZ6wWon88bDx9D7NvKQPwYtYpFa
	 fArKNB97Aa3fw==
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38190551625so7133581eec.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 07:36:06 -0800 (PST)
X-Gm-Message-State: APuU4Z9Nj7PrhLvllH2324gLi3HTJ/pffxwRBadTwFMyXL4AB/1Z8Kv5
	+9uwI5vY6vlBnQttYo7qMCfhJOhkizuwXXzTx9w7RGMTjxg+VbGiHn9efo9B/7+Bz0gX06THhZt
	VkcrHnLdjD87imQBlANWElwuD4WFaBg==
X-Received: by 2002:a05:701b:2514:b0:16a:c6f2:60c2 with SMTP id
 a92af1059eb24-1b55689fcb2mr10673901c88.12.1795448165577; Mon, 23 Nov 2026
 07:36:05 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261010115539.9237-1-l.scorcia@gmail.com> <20261010115539.9237-7-l.scorcia@gmail.com>
In-Reply-To: <20261010115539.9237-7-l.scorcia@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2026 15:35:53 +0000
X-Gmail-Original-Message-ID: <CAAOTY__jNESf=ZofZWN8SxBMkzeRrXEJv=J0QE4guC71hvBKGw@mail.gmail.com>
X-Gm-Features: Aa3M54qi2_k27JpUO0fxBJ7jBDU5evrvHmSEsv1tBfznyzC71R2OzkCm3lxw8do
Message-ID: <CAAOTY__jNESf=ZofZWN8SxBMkzeRrXEJv=J0QE4guC71hvBKGw@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/mediatek: mtk_hdmi: Improve the secure output bit toggle
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Fabien Parent <fparent@baylibre.com>, chunhui dai <chunhui.dai@mediatek.com>, 
	CK Hu <ck.hu@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Luca Leonardo Scorcia <l.scorcia@gmail.com> =E6=96=BC 2026=E5=B9=B410=E6=9C=
=8810=E6=97=A5=E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=8811:56=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> The secure output control bit toggle for mt2701/mt8167 currently sets
> bit 0 (DEEP_COLOR_EN), 1-2 (DEEP_COLOR_MODE), 15 (HDMI_PSECUR_EN) and 31
> (HDMI_PCLK_FREE_RUN_EN) in the same operation, but only bit 15 is actuall=
y
> controlling the HDMI_PSECUR_EN bit, the rest of them are already being se=
t
> in separate operations later. Add a define for bit 15 and clean up the bi=
t
> update operation.

Applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>
> Fixes: 0fc721b2968e ("drm/mediatek: add hdmi driver for MT2701 and MT7623=
")
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---

