Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FEBCCD195
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Oct 2025 12:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3tSr4HAvbS0zz40z1XcCEFjgrGlF3qXMnfs2AVWb3Y=; b=NZ0KApXD9hC1ablhdpZDYtKBS7
	sxF4ExGasH9sQYucyTOER9RY1Qq+VA+Kfjmmvy0m7yA5ePgV0uIEjTtaBsNmqtqUxAqHMYENOlgUM
	da+58w2op8xOVxwMa6wASW6cT1+MprAuGSus8QZFFbd44B/eb7Kc9Hr0SepfC2ozIoGnt+xEfOkTX
	Vrp9hgKxa0c6Q9QO39MKxOgm6yQ1WdjuYMD9HJ5XQV1zv3hxdFDbom22Rac0a1Bnqi84uv6D0tA6u
	zcAMDBppKkxZ8FrBvrFqtY1jIVd+zDQOtfPFfzkq4cE0nkisU9H1pvvhXn+eZTblI2RZvsMTXPlGe
	cWfTgHKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90Ej-00000001UqC-3VbR;
	Wed, 15 Oct 2025 12:04:09 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v90Eh-00000001Uon-0Oas
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Oct 2025 12:04:09 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-85e76e886a0so728334985a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Oct 2025 05:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1760529845; x=1761134645; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X3tSr4HAvbS0zz40z1XcCEFjgrGlF3qXMnfs2AVWb3Y=;
        b=CmjKMQQxalohCKa19hLFu05BC9gR+hUoogekzbPk7zzbE8jt66LezCjoG3TrRXUsLN
         ronbv0i6EzQJ7PK2Tq77C0/5Wg2JBdJSZ+hZW0rrwTKjUBKfGyCnOrZmdwAwU1ZdUp7n
         uke1f+XNu/cnzvzU2uvNoytYO0HGU4iLzDFLcr098OUnmcNwJgVKf+ZUrV7YObTwBlEW
         jNDSRvVZX2/ArVk9KNUtUOZkvoJkzjw6dlwykynPX373YLH47WuVt79qDJMFkI9nUZjw
         p0Voo3xKPCLjvAx3YVvk7WRVm1mO1v67l9HDuROG6boD11oyJx4E28WCvDqEald9NFgF
         7hzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760529845; x=1761134645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X3tSr4HAvbS0zz40z1XcCEFjgrGlF3qXMnfs2AVWb3Y=;
        b=gm/VkzR2w7rHRpQJZEwsCF4chZZFKkRGOT+tLOLXrGrR9yJGKe3LrhqKxXIZ6eLPEH
         7nGPgF5UO1gOdCtL70mEFBmDNqgZVP4kaI8Z7TAc5PxakChnZA6Bjg4iUdPRUIC92xws
         3JaOKosueNRiPb54cQxqzhPZYyMZP13YCxw/sM+L+YPR7+W9qy/k6fszmysfOIZ3bBCA
         etebtWEvqZFiaMLO9rTMN3yGMS5Jtpk9V23AMJbgipzdfjKBd7txfdzov6Ge9EBIv/bG
         1tXMoRQdbhFnCm0znBiBCdvcVC3apzd08/FWLRsNv0qenhWjKdg2jvnLaJ+RKIpSTcm9
         coQw==
X-Forwarded-Encrypted: i=1; AJvYcCWqqIzTNzVpKbWUC2+91VVO6qXkYjQVZ+coOqNdLmwJkFlnIpZP9jFJ32yDejvjYlcxuy/iJRwhPTxXiPKJXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyujQRN332YtVr4uSxXjR/K+KZ6CVbJ+Ri4C1WMFKvvqEsvUkz
	SsdetYYxSXc3YQI0ehU9CY60Wkfq2HPXGxOLkjQlc0fG8bRLeN10ROuuCSbS2T1+FaFTvJwP+Q0
	cuDm9Ok+qPw2e7rEAkihwTFvnBPDugEsZZV2/PfRLLQ==
X-Gm-Gg: ASbGncuflLzzgNUv/RDRlKAkw6qk8ZRi71FL1W5wJJAYi1+MwjUQ+28neFsG6dubArH
	jMmcFXiaFLW/42wa96MylN5mC+KxAYJM5yeoQjpZkWswWF319fRGM1B/v2u2auQQyXpYzWP5Nf3
	ZSdtV9dxd32ms1092eqO+1Jqa2LhDIjMFHX0zGzd7ZaLKMStrr+fW+2CnxSXmoOoTR2d/rPQ2f2
	Nz8u6IN1/3RUNIa4JH3Jsxmu2oPJQIwOg==
X-Google-Smtp-Source: AGHT+IHqCTndsaW9mNNOpEoxqpK+g671TVftkJwHJncfJRnISWrovh6jkW0GrLsJk4LzlYEdY/SfnIetRnQxqll+9N8=
X-Received: by 2002:a05:620a:d89:b0:859:7e5d:efb0 with SMTP id
 af79cd13be357-883521dbdb5mr3978297485a.43.1760529845105; Wed, 15 Oct 2025
 05:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250718105407.32878-1-vignesh.raman@collabora.com>
In-Reply-To: <20250718105407.32878-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Oct 2025 13:03:53 +0100
X-Gm-Features: AS18NWCXawAF8rrUemNB4cY6pOyINS36FA1C_QZssu58BBI9i4GnKsHpaQ9lquo
Message-ID: <CAPj87rMRKdm4BvfD8gMmSF3jjeMK4nurzTKPOFY15V0tBr4pyw@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] drm/ci: add new jobs, uprev IGT and mesa
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_050407_132039_4A7B7BEF 
X-CRM114-Status: UNSURE (   9.33  )
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

Hi VIgnesh,

On Fri, 18 Jul 2025 at 11:54, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> This series introduces new jobs to drm-ci for testing the following
> devices:
> - rk3588-rock-5b
> - mt8192-asurada-spherion-r0
>
> Other updates include:
> - Uprev IGT and updating test expectations accordingly.
> - Adapting to recent changes in Mesa CI, such as:
>    - LAVA overlay-based firmware handling
>    - Container/job rule separation
>    - Removal of the python-artifacts job
>    - Use of the Alpine container for LAVA jobs
>    - Various other CI improvements
> - Disabling bare-metal jobs for apq8016 and apq8096, as these devices
>   are being migrated to LAVA.
> - Updating the runner tag for i915: cml (switching from hatch to puff)
>   to improve device availability.
> - Adjusting parallelism in jobs (sm8350-hdk, amly) to better utilize
>   test resources.

Series is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

