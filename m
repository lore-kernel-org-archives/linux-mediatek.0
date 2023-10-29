Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E670C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Oct 2023 02:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8gWNO3l8fpnpIPgxgpu5uSSqh1fHCKLMt8L2nodlFyk=; b=sovmUClyLTbRn+3rhytnyuNici
	2dZxHdgVAifPf5DWN2bOoB/q/2AxX6HLuLGC45UaoV3eXGQxsHkxSWtzs4QXP0o4YgZ97+fhDorqe
	e/W9kFd6endlfJ92XyFlffd8u64l5n9CUT1E/XKV2jCS5OBfAtNuxsL/oVsbw0kiAxMaGoHGllMaD
	sGDMC700LpP/4OUCaQrt3HmxqQ1VFOftbIQxI0spjT7CviH0guKg7thW3o8KKGy6HP4/goHLN3j+n
	aVF0yeNQRO0M6rmKHiuolnpxKONX1jo9yUpNsF5URQ/XUI7m1vUylMXFSSa+8UHEx0KLimdKcOfK8
	4vsbvn2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwvYZ-0013u0-1F;
	Sun, 29 Oct 2023 02:29:39 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwvYV-0013tK-1j;
	Sun, 29 Oct 2023 02:29:36 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-41cb9419975so21575761cf.2;
        Sat, 28 Oct 2023 19:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698546573; x=1699151373; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8gWNO3l8fpnpIPgxgpu5uSSqh1fHCKLMt8L2nodlFyk=;
        b=lxOjJ2De9sTAlKBz2h5lcrcIrW/BPTXqMTkDceyIL2EtYaOM+VgbMlQWkTdb6zO1tn
         KfOBUuSo808j1rIvH8UXxHmLYCvhylAh1nWKlJYv1NIiW+FyaELyPfUcrCoeIHmLLbRS
         i2r9nAVI8mrmKsyRVQX1h0MYP6DnaO1ITrEDuCRYRIyBEC1YXBekEs1NJAZnE11Xubvj
         t6DTun2Zz3Fe3ps5NnPypF0FaFEshrXdFR4zfL5zE5kT/tgwC6tGm9XdH6u2MRbapZ85
         mFxKA6y8wWBZwWZAjvj5PSLDRk8cc94hXAp38oYEDQu7qk1jVKYZotcEhdMIYDsqgE67
         wL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698546573; x=1699151373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gWNO3l8fpnpIPgxgpu5uSSqh1fHCKLMt8L2nodlFyk=;
        b=fUZ9OhuTgOnsaR9fxd0ulsQQLhf2updxaQFJMJUCUv479AX0mpcB2HMeFYgJ7tFqNi
         BZ0gPzxz/s1VR87okh/RL5YxeAQ7Xb+c3somUpL9f61Ulaa6dobIJ5yA+mLHeWunbzvu
         K7XvEK3Tw4qe/IQHFJ8pttNnaNoK0J0jhnnN0b4XaKbAdqpoJ+Lh9ObefveQQ/E1Ot3u
         kezlu3jCQ3qx/rTKVPgv4VkvOlsSr3xoXp0lsz20NJEC2APPsBfU93gXbStZ6kkULw1I
         8CN7MrvSlFemwWCAyf76oECjqzO+DWUdXmVpAFLt0EKIYLLTYehOTxYRWokGR00qmkxw
         2g9g==
X-Gm-Message-State: AOJu0YwebTloWVmOOnQdwcp+IEhAaU15AjvHL9gemPb6S9kkmDrEOLGt
	+4VnMToGO9wGhpuGwv1yTHI=
X-Google-Smtp-Source: AGHT+IErpMIDGlNs7xe4F7SkYsIWBgQIXur/8MlOHteENWqs1PiDVQ5rzCKOA9AAhWycHof+33p9rA==
X-Received: by 2002:ac8:5c96:0:b0:41b:806e:81c7 with SMTP id r22-20020ac85c96000000b0041b806e81c7mr7553608qta.32.1698546572867;
        Sat, 28 Oct 2023 19:29:32 -0700 (PDT)
Received: from google.com ([205.220.129.30])
        by smtp.gmail.com with ESMTPSA id d5-20020a056a0010c500b006bfb903599esm3549848pfu.139.2023.10.28.19.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 19:29:31 -0700 (PDT)
Date: Sun, 29 Oct 2023 02:29:02 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com,
	ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de, gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	kernel@collabora.com, Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH v13 33/56] touchscreen: sur40: Stop direct calls to queue
 num_buffers field
Message-ID: <ZT3DbkmurIzBp7_p@google.com>
References: <20231019125222.21370-1-benjamin.gaignard@collabora.com>
 <20231019125222.21370-34-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019125222.21370-34-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231028_192935_599158_9F7EA8EE 
X-CRM114-Status: UNSURE (   9.04  )
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

On Thu, Oct 19, 2023 at 02:51:59PM +0200, Benjamin Gaignard wrote:
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly.
> This allows us to change how the number of buffers is computed in the
> future.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> CC: Henrik Rydberg <rydberg@bitmath.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Feel free to merge with the rest of the series.

Thanks.

-- 
Dmitry

