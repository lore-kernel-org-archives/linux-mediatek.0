Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0429CD4F24
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 14:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9fWAJmT4duqKNhGpNJ3D/Pmzw/4WJS1enftLK5nfnA=; b=lu3oo9YamZETc4eoXlwz5KBluX
	7pPyvmrBkPCvtnrDI9uY90O5OXYCPQfQI4Kcobd65wzMyGD0e6yUaIR/i8o3g7hO0X0cPn2xaxxgg
	fOyO7pcNpZ+leSjyKN5FqoQkSsieAUERs9aW0GJqKZy1in4vO7Rz2wYWPn/uqUXeGKcY8+BB1Pg7h
	urG5fVaKgHnBS9w0XZSggTyfwkjz1wyKZh47ZrMJ+WsSQLe8FC1nYFkVDGvltHPdiSeZCaLwliMt9
	VSJmJOUStktIkFtF+IJpbo28KTEFbM7KfxnxiltYtsImUXjQjMxtp/tcsVSRVZ8NKnTNXqPcQsR4y
	PO5fv0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNApA-00000002xql-39x8;
	Wed, 13 May 2026 14:44:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAp5-00000002xoT-42rW
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 14:44:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFA97444C8
	for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 14:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C3DC2BCB3
	for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 14:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778683470;
	bh=AcQajWoyianxBFqe9+pwgEA3+MQbwflajHJBLxqkzsU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ej3HW4OBwPIi6rJmznPSDxDaw7Cb4pzfnyS5VzLoN8nWrOWAoEZQqBnyG6+xEn+D0
	 7yQ+0yN0qvgc8YDVK5iwmHHmsRarF1KnWXlq5HRNnhf7FVJxsqatR2ZfNZ+bAEASX7
	 20w9peYQWVBPhZVdOSboBcbVaxQJoNTGnGylj4nMQmItWMJ1zYAhV1GnO1dy83mqoG
	 oYneIX9I6M1IyEGummRuPudQ4xwc2UdgaUrUuieMxPESU59WuaYuxFNEAQLkLAa21b
	 zhtZklZgUnYEhUzZaiKi0bKGFtnqx742GrBbwSeN6oxk78OHZxBMrye10FYGKq1u0k
	 /Dz8Lcjt0vzzA==
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c1a170a50so9396360c88.0
        for <linux-mediatek@lists.infradead.org>; Wed, 13 May 2026 07:44:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/7BughCZZ8eKGk2iJX8erXf9OZ5NHd8QKy0Qxn6Z+p9xAxHOdHsL2ucxp1do74u+na8R4RuKd8BST8qdGGRg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+y8++PTlDKH3yg5g+BZqgWylFhjhMNGr2hT2pz0RLSiEBB8kX
	2I2+Bpejt49iatMHCQfYbMDGt9L0zswPfg64+Axsajwl2RjNIq3f1qMGLVWdsBXdzi2c3nt7BhR
	vMUyLkMdj7pxhDFBlHocHb7u4OqZrFg==
X-Received: by 2002:a05:7022:45a5:b0:130:a257:f723 with SMTP id
 a92af1059eb24-1349a703b38mr2163136c88.2.1778683469857; Wed, 13 May 2026
 07:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260420064544.266478-1-suryasaimadhu369@gmail.com>
In-Reply-To: <20260420064544.266478-1-suryasaimadhu369@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 13 May 2026 14:44:17 +0000
X-Gmail-Original-Message-ID: <CAAOTY__-A_LAaDG5QBMVAaWh0QYiNETvF_uhVevGLQr0cfxV6w@mail.gmail.com>
X-Gm-Features: AVHnY4KoaT4lFur0qX9u_4-uJObxdFb4r8bJVHNWvz9hHmWh3RXQFM5ONm8Jba4
Message-ID: <CAAOTY__-A_LAaDG5QBMVAaWh0QYiNETvF_uhVevGLQr0cfxV6w@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: hdmi: Convert DRM_ERROR() to drm_err()
To: sai madhu <suryasaimadhu369@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_074432_012943_4991DA7C 
X-CRM114-Status: GOOD (  14.09  )
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

Hi, sai:

sai madhu <suryasaimadhu369@gmail.com> =E6=96=BC 2026=E5=B9=B44=E6=9C=8820=
=E6=97=A5=E9=80=B1=E4=B8=80 =E4=B8=8A=E5=8D=886:45=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> The DRM_ERROR() macro is deprecated in favor of drm_err() which
> provides device-specific logging.
>
> Replace DRM_ERROR() with drm_err() in the Mediatek HDMI bridge
> driver and pass the drm_device pointer via bridge->dev.
>
> No functional change intended.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: sai madhu <suryasaimadhu369@gmail.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index 1ea259854780..4ddcdbf7bc8c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -981,8 +981,8 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *=
bridge,
>         int ret;
>
>         if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> -               DRM_ERROR("%s: The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR mu=
st be supplied\n",
> -                         __func__);
> +               drm_err(bridge->dev,
> +                       "DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\=
n");
>                 return -EINVAL;
>         }
>
> --
> 2.34.1
>

