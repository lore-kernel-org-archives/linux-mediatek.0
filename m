Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BDE2E77171
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2024 00:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqZWstnvS5M7KlsauJVlhYbS8zK4ZfCAjPX+o2siRvQ=; b=0x1c/Abz4D3OfoIJ+a4xzuqAN5
	5LC1Tewvdl7QJGNN3C0PHiF9ED+4A/Hl1+bNw/Y/5JGc5hDEPv0q9rD3nrVHLUyghdmnPDa/qnQs4
	Asut1cMaePt9s8SbTd5Ui5Er/kQKyiBPSa8rasXiJ3jnXJBoRlk+ggUpjPHasWA7ONFf4FCq152sr
	wwyQLfstVhXZInp3t007ivhOvUzaa07/n+6J5vP07xV7RnijpvO9aTD4OH68PizgoXrwVVjOkihHC
	5ufx0ZuvBb3cA67f4EJqYz8Xg7vJw1KgBeoqCBQR+EGxqWgfV9hfMf5pywAXf8nyLwsAXZPjnHkwO
	B7LCMEMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLtk-000000002Kd-2spb;
	Fri, 06 Dec 2024 00:08:44 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLrl-000000001r3-1pJu
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Dec 2024 00:06:42 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53df1d1b6e8so1456435e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Dec 2024 16:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733443600; x=1734048400; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqZWstnvS5M7KlsauJVlhYbS8zK4ZfCAjPX+o2siRvQ=;
        b=hJoCitNUs86HeJTfOkeU7slctauFzPmfx/Pd5JBeg8DvmqV4zYj6HFvIEdlvB9mWsK
         d3nvRsPCg+639+zj4518DrUX6SbzfnouWbDYtiTLrcRCWZDMm0qRnrHxhmDHGSWQzhny
         fmUuYHHTy6oBEAVGrwyWpreqYmVyixTmgh+GifggK6ZLczRoFvFLXLLOWCmTBPXy7eyV
         mf8qfCeCG5f4LjBopx3n07gbo+olkgXLZkbZWzZRKPAbCE3jZBXsFHxTmKDk0+3w1CuU
         NL9jQh0sV+5y/7HBoFdJsP+pTnXOLqhpqQnuaH74u7rEUVVx2owNUSWvQFGymvie6Ik4
         9j2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733443600; x=1734048400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqZWstnvS5M7KlsauJVlhYbS8zK4ZfCAjPX+o2siRvQ=;
        b=PGf7ZldvadYh8v6btRtiRT6lWg6qnHeBag3WPEMjNWcYji6G460pYnsMrMTnenslps
         0hNpG30bNwbl09hrpjLV2yisS+jsLkOvKZ+9WUEiD4f2pK5OVDCI8YR12WHFcmPj2LFK
         BeFp+YAOvZi7BZdlSU47WbKSBqsxlT4zv6lVoStljur1zUd9aXNc69icNOt487mSAVih
         V2omItwMBSG/vgQuexRYZTd1/xYRWGCVRHhkgeCvKuRPs6Sr2pvgBsDE2AcwegJ34Xk/
         Y/CVu+W76JLLHuh8wRDFDZduizAm8Bqrh9QH8DmpXddg6ujQpqPnG8EH+meWmKmtBGkU
         IFRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2fxP/Q5GKUbxgJ9oM6w0FpB8z595uYoVr07Gf//1x8SlCAGufp+CcdJxEqjbRAt+qSJfEgLBl8df2vv0LlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkWJnNwI51ugYbcTzdknj9MC9/jZbtsZpJOTqMjW26IN/Bk7L6
	PuuWSLSHU1QqlEznIMAmH9zEx2SKoLEILAybV/Ux/U4z3Ct+IyJvc0eTdbCk5DdYStPfjKc1+JZ
	eq6GrMGl7OHY34RoBdK/KR4lNjswwRbmjFM8E
X-Gm-Gg: ASbGncsZQaDp3Smbo/3XIUMAWaOdGPAPju8Dc9HNiEsBDMBgQprS/cimq2/UuUJOUcm
	pjVDxml9BRE3YYkiJEi5XIki8Y6HTUg==
X-Google-Smtp-Source: AGHT+IFMKCgNjf7EuTIfzy1U+mxlTHH4A6RijBLU54vNTWXHVXJQWJqIB/kHPOOCzpMc5RVjG0prBUt0JknyJqn08+E=
X-Received: by 2002:a05:6512:4024:b0:52f:ca2b:1d33 with SMTP id
 2adb3069b0e04-53e2c2b8f76mr213110e87.20.1733443599437; Thu, 05 Dec 2024
 16:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20241204221726.2247988-1-sashal@kernel.org> <20241204221726.2247988-8-sashal@kernel.org>
In-Reply-To: <20241204221726.2247988-8-sashal@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 5 Dec 2024 16:06:02 -0800
Message-ID: <CAGETcx8bhzGZKge4qfpNR8FaTWqbo0-5J9c7whc3pn-RECJs3Q@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.11 08/15] drm: display: Set fwnode for aux bus devices
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Thierry Reding <treding@nvidia.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	matthias.bgg@gmail.com, elder@kernel.org, ricardo@marliere.net, 
	sumit.garg@linaro.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_160641_469180_4BBF5F92 
X-CRM114-Status: GOOD (  17.01  )
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

On Wed, Dec 4, 2024 at 3:29=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> From: Saravana Kannan <saravanak@google.com>
>
> [ Upstream commit fe2e59aa5d7077c5c564d55b7e2997e83710c314 ]
>
> fwnode needs to be set for a device for fw_devlink to be able to
> track/enforce its dependencies correctly. Without this, you'll see error
> messages like this when the supplier has probed and tries to make sure
> all its fwnode consumers are linked to it using device links:
>
> mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) wit=
h backlight-lcd0
>
> Reported-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@=
notapiano/
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
> Link: https://lore.kernel.org/r/20241024061347.1771063-2-saravanak@google=
.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

As mentioned in the original cover letter:

PSA: Do not pull any of these patches into stable kernels. fw_devlink
had a lot of changes that landed in the last year. It's hard to ensure
cherry-picks have picked up all the dependencies correctly. If any of
these really need to get cherry-picked into stable kernels, cc me and
wait for my explicit Ack.

Is there a pressing need for this in 4.19?

-Saravana

> ---
>  drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/d=
isplay/drm_dp_aux_bus.c
> index d810529ebfb6e..ec7eac6b595f7 100644
> --- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
> +++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
> @@ -292,7 +292,7 @@ int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
>         aux_ep->dev.parent =3D aux->dev;
>         aux_ep->dev.bus =3D &dp_aux_bus_type;
>         aux_ep->dev.type =3D &dp_aux_device_type_type;
> -       aux_ep->dev.of_node =3D of_node_get(np);
> +       device_set_node(&aux_ep->dev, of_fwnode_handle(of_node_get(np)));
>         dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
>
>         ret =3D device_register(&aux_ep->dev);
> --
> 2.43.0
>

