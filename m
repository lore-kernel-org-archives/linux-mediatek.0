Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB5ED13588
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2024 07:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cmwyegq7pd+RNDhv4uH4MzNeE4hWCQOLImM4aqdf6HM=; b=J5XmbZB3QtckdVKhS5lQQyc4u+
	S289qBvcnTzUVsZBRM9VDhr0zViT1ELGaSfAbpv4aEDAlI8drwad7dZWC4r7i73chda/6TojR4NQa
	xt7F9k3W5WENHDAY3tvz3VxeeoE9rH2vgVuetDMwhj+9HjeEE4qePl2z55by2xwtOXR/IGEJtq7uk
	r4+4QCQKRyJaO+B+GEKkxDE0eexM3I/xowfasOMmamQWbMPauG+l3HMj4XfrIPa1P6wuCO5BqXaaP
	v7w1wic4e1lygDP0sdqMSMq5XYnmUzKb+k5t07yaKrUxj7yMPW/ZNOvYyX/EKQAd3AE+RMEK/VS2n
	OwgKjB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5JnC-00000009naq-0VUB;
	Mon, 28 Oct 2024 07:03:58 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5JkG-00000009nI6-1ygl
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Oct 2024 07:00:57 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539f84907caso4046005e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Oct 2024 00:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730098854; x=1730703654; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cmwyegq7pd+RNDhv4uH4MzNeE4hWCQOLImM4aqdf6HM=;
        b=KHlRqjYMDcnlcnCv0o2u4InCEWIFpIULku7zr69hLr6+hO9rF62NJy/vEBk9q+UxAm
         5k+CMV36AcwZwLTrsrCjcf/10ENuqQIL7IlE1eU71YuoGhgTuj5roys7TAVGN9G8Pcao
         wY1PXV/VPz+VaSiVZLElHcol3O+3y4P4beF5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730098854; x=1730703654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cmwyegq7pd+RNDhv4uH4MzNeE4hWCQOLImM4aqdf6HM=;
        b=hA8/mCO4xtkofxyq4Z0/5HNQ0aTiYS80uXE+93Y4LGwnklxn/NeW0WcCXz7wwceWmL
         f2BaoMZxXLvpb3lqhj844k5saZVZMT9vqloP2EPlgi5hhu0urBhnb9vMfZK5M3c0kDwe
         xzo+GF1PH53zajVdtAq8LvkV0OT+3jtcLv4Tm7zB7LAdBbHXaRe2VmvRHIUtA/SpfiEr
         4cTxx0ipz6Tw1vh4EV0UZJWgEoI57FKmQIldWBJQl/x76zdHmyrUjPeLrAigBB+17T+V
         Fwd0Pvphf0bd34pqVQfRxZWAxN6HOvF/gXnUSlQOEVp4cqSR33y9zQ4JimoCS55P2+tF
         EGDw==
X-Forwarded-Encrypted: i=1; AJvYcCXUA8tTxrtn/xSejMYwcTCaU/z6JnIeFEshvdglobYf4yhuu9MQay+UrDSc21s9k7TReFohh3+QTfPt66mSkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoBuEGZMyP4ymxMSvuBpk+1hffsNO+T3pUWWi7jqcJKEpPq0Cm
	VZVfG8udVSoFBhxFVnVP+V21kIsfWdYJeoZWnXicpZ7W+Qu/xo8Sh2t0brthXigX3GQzYNGbF3k
	/SWkLAkMXyCD4AvOLN9cnFA2WF41qKGQFRz+t
X-Google-Smtp-Source: AGHT+IFCTK/9t8GApx2c313ElibGHVQt1aCzEHXMhwQB7y5ngpH9maQprAhY8bEpEJF/nzrqaJAxSEh5HOrX6QHHt28=
X-Received: by 2002:a05:6512:3ca7:b0:539:e873:6e2 with SMTP id
 2adb3069b0e04-53b348ec22cmr2169421e87.8.1730098854425; Mon, 28 Oct 2024
 00:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com> <20241011-mtk_drm_drv_memleak-v1-2-2b40c74c8d75@gmail.com>
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-2-2b40c74c8d75@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 28 Oct 2024 15:00:43 +0800
Message-ID: <CAGXv+5HAXuqxZM+CwfseXbAr2bsPgP__wc34mfmiJfui_fLOOw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mediatek: Switch to for_each_child_of_node_scoped()
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_000056_594332_3BE3499A 
X-CRM114-Status: UNSURE (   8.22  )
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
> Introduce the scoped variant of the loop to automatically release the
> child node when it goes out of scope, which is more robust than the
> non-scoped variant, and accounts for new early exits that could be added
> in the future.
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

