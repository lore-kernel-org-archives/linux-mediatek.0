Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC04D13570
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2024 07:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oXeJH9+dd3cazFRcmOcTf4KQwEKjtruutzeaxtbL0pk=; b=JRnT6H3u7VNXY/RkdPp5grE/Ex
	/gZ3+HywxF/CS9a22G4Bcx/y+64dQpO/yt6HAkPfL6/UfxQWksL1TucLhPdCjXheqa6z3jOhRhGlY
	dS//lSlWY47bfMR1SCdCqVCCJokAGu1PdqV8SeH88dVAYe6XbtLMgryYn0J7TosvIpEnbLGwCezpY
	/FGQx2E1RU/XpL+nBoedm7LDmiSRDFq6V3UnAvvu4qLKSlGTLnKWOJSBKzfJmbngPErE7bL2qhKT5
	JAruAPrBBF+Q5xq3rwixp7M9jzNun+Fv2eZx0jb8kFXtlDPm5ylTXF4q5WLdEFyBdS7Gn1HmJzJV6
	P1Hu+sKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Jle-00000009nSi-3H4J;
	Mon, 28 Oct 2024 07:02:22 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Jk3-00000009nFD-00fn
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Oct 2024 07:00:44 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so5213129e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Oct 2024 00:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730098841; x=1730703641; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXeJH9+dd3cazFRcmOcTf4KQwEKjtruutzeaxtbL0pk=;
        b=WE8X3f+WklR0C5Hb+Uh7q1vNKmOLJGm81GuNBDU5g+zl7qwYJ6+QOsBA5V7DQaOAZi
         YQPaC63Ofjl6tuLwHkVP/2Qtapy3AcCUzp8q3QXizYfsU+PVtaKowCf0NEuXG5qH/Z2D
         pgnK6SNHGKMSGVsf5dX4tkO3SYF1MsckTybtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730098841; x=1730703641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXeJH9+dd3cazFRcmOcTf4KQwEKjtruutzeaxtbL0pk=;
        b=NHkYirkxHrbCE76/xK7Ekf+mZkjeqqeEw0nPtbrqtHO8GLsYpiuYvmz79F8+O94av6
         3s0SRQfIwixFPg5LDSA0RfdgbTZkZkux7aS4k0Kuis9YWv4YSnOUh2jgvaGVo3AU4dh1
         j/GS3HSGMRlvLwjLrwkD5USioDkvyUjaIB4+5sYmUxaNru433LnNpBK3va8Wqd4UyxZW
         1K8HcUJG01HxevUXYJc4Vr1oW4NnWia3qApPCvIw1bYbP+Zlm/7NSeaEczLS8hYa86of
         CNBNM6jlYI4Io6qhHrE9k+VGixZyLu3FBQba6wvb5ZdTql2Hu0jYsXT3oOOKZ3Jp4Pjy
         CDug==
X-Forwarded-Encrypted: i=1; AJvYcCWcw7qEuGtjok82ZgKTBGHdjAWB7td750nHmzQ6rrJr6kT+ZoMXXHJeIgic1trNEtQuoW4gow5ekl3m2m5AnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxD3joO+KbpuHdqZ4bcsXHC/oG1h7aCZtPJPWaqgkB+3omfDT+/
	Ud3GATaX2Plm89bInRSek74O4fNdMctBK5+oFw/bMfv+ow22hAJvIQKIR1uMGOzxhznKYW3moiL
	b4V0mMsfjAUZrsldHlpcOLpT6qJqo3o4/49U4
X-Google-Smtp-Source: AGHT+IG0bSkKwUt4vIe/DSFsd27a0aZcM775T78oioXCX/0ert+iimxun6TtbNvBDPU5UOHkKZf2rc0Rt4hi62j6fcI=
X-Received: by 2002:a05:6512:3ba3:b0:539:eb44:7ec3 with SMTP id
 2adb3069b0e04-53b3490fabamr2408370e87.31.1730098840615; Mon, 28 Oct 2024
 00:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com> <20241011-mtk_drm_drv_memleak-v1-1-2b40c74c8d75@gmail.com>
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-1-2b40c74c8d75@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 28 Oct 2024 15:00:29 +0800
Message-ID: <CAGXv+5Ge_qcXaSBQ9d8QZOWe3x_9-6r9LhDGvAbUHNKYMwevUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mediatek: Fix child node refcount handling in
 early exit
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_000043_045627_41479C62 
X-CRM114-Status: UNSURE (   8.95  )
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

On Sat, Oct 12, 2024 at 3:22=E2=80=AFAM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Early exits (goto, break, return) from for_each_child_of_node() required
> an explicit call to of_node_put(), which was not introduced with the
> break if cnt =3D=3D MAX_CRTC.
>
> Add the missing of_node_put() before the break.
>
> Cc: stable@vger.kernel.org
> Fixes: d761b9450e31 ("drm/mediatek: Add cnt checking for coverity issue")
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

