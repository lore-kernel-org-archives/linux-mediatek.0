Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB11CD5BA6
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 10:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xd6tRDcBI6nT0vpG0+47dCoixHmT48y9ZIC4bv5qVFY=; b=XeQnjlTlaLB7B/Af+FfzNjlsha
	pyDr9GupLMeuMycxtLTnuAKQKlzgLcn54qnLszIVVt16Uc+34xbYak44fFJYbPWJUYdFyhivBzk/7
	FIeP4F8hMTm6dxZyHO6Tkz+45dWoPnOEhrqosQRhfPiV7i1lygxZJ8MXzK3BI0svDjaauIfn4AfWZ
	2PyPrTruYjdoS3HTnpP6tyzvztX1TBXpm5/4gZRQtNLJF0ijVWUdXRKqlEDoL3Jzqh+fwk7ekl04x
	0F/Qu5pp//y9BARFRR+sP0XMWZN6+afVrNME8n/g9jPSG6ubXu72HIgjt3HqWguxj76BdyM/Y0Qbe
	O3GLaerA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm9Xj-00000007uir-1jCm;
	Thu, 05 Sep 2024 10:16:47 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm9XZ-00000007ug9-2MvL
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 10:16:45 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e1a7e54b898so691936276.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Sep 2024 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1725531395; x=1726136195; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xd6tRDcBI6nT0vpG0+47dCoixHmT48y9ZIC4bv5qVFY=;
        b=EJ9SEMg9clSRO1Fo/N2fGGtaxql7c1gP8U5IbbYXW4iCCpxThVyu/bAgTke6pu8Ods
         g6RmJmqah15ZK4LvUItQRqslZGujjmMec1ukv0yf0C6jfIHRZd6ZW3JyWefTk6KYjvaK
         1MwmNBjFZXZ2Qb7VxPGG0nobfEW/YpWa3dGzYZbeFOFX0fL7K0jaVTDNP0C0/mnkzbWW
         JH23Tpqi2vGaNEBneDZ0A6rK4kn4KT8fmEASJGnp6lPHIJlRUJGjYq097IgYrBONhr8+
         u0SzcoYccb/6Qt46Jl3d82DYMk+exBBExPQLBHTZCUs+RGPeuqqLSpw0zRJiExPDvGN2
         FN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725531395; x=1726136195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xd6tRDcBI6nT0vpG0+47dCoixHmT48y9ZIC4bv5qVFY=;
        b=DJJFAQMFAh/P6whbAYHnsop8SFbnUJAWnB1hmoi0p9B26dpsaHqbOyDb767EN/Aq5d
         awi22dhWde62nBfq5Usw2UG+szW+yxjZWl61zad3KHo/HW0YyQXuHWUQL8K0ZJ1kWZKJ
         N0ytLTpNyFusYNpgkEU06uoH2aZ458rzBVDIwpEdDjKsPEgFsyfrSCtzXuHJ/iT1brjn
         5PBVngoVBFjTLN3Rt9TPK2XuREsJbG1FDRRNID4HhR2vU54v+rxuQfYmEpOx0DgWL6vt
         h7Iunovk3z9evfeFLe3qovUU7rWHUIVWAARi6eO/9HgRGqDC2WeOjDw4D7Pcw9bibhry
         40Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXGDCRO5wvfLqkEVP6XdThb89x/rs8lfst5BErHoYUqiYZ95aug7sCpGqunNweA68RD0GHpb6qkjqZ6+P6dzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzK6+6dKJ7aKvSqaQiHiCAn7MOs/AlGt8h5OZqRI/MPg7UUeEWl
	yVublDB9C0MBrJOhPLt9tT+c2hwhTHaZtnzHemo8SWPcl4e9l+ZKr2bV9ENplbucCcmGxDoD4sH
	I2o8xziDIrJ6lC162djkCzmOL5eT9doEs15gC7g==
X-Google-Smtp-Source: AGHT+IHOAa2WnFWM0m3QmtHGwmSzixacJsCBpWRBvguStq1YD37bVLj0/P6F5Iapvjw7xs8jP/X43ydPbq380G1rQQ4=
X-Received: by 2002:a05:6902:1547:b0:e1d:1b8a:ac4 with SMTP id
 3f1490d57ef6-e1d1b8a0cbemr3960625276.11.1725531395247; Thu, 05 Sep 2024
 03:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240905093935.2780632-1-vignesh.raman@collabora.com>
In-Reply-To: <20240905093935.2780632-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Sep 2024 11:16:23 +0100
Message-ID: <CAPj87rPCctE=iJKfQXR-PJdUHR+5f-t2bRA5Daq2fzUTNekzcg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: uprev IGT and deqp-runner
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_031637_778856_0AA08CB4 
X-CRM114-Status: UNSURE (   6.06  )
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

Hi Vignesh,

On Thu, 5 Sept 2024 at 10:41, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Uprev IGT to the latest version and deqp-runner
> to v0.20.0. Also update expectation files.

Thanks! This is:
Reviewed-by: Daniel Stone <daniels@collabora.com>

