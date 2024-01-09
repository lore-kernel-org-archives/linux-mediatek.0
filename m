Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80691C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 13:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mDLa1lDA9I4zsDt/vUi7Q5DM723KSTf2pIxDEMdeEE=; b=oBtdOuy/AOmkvhrxBCpS8N1Dn+
	d2rQiuYxNFZOoLWzgTZEVE4lQe8I0I5UlD0Jug85TmfLvwWbSnxbPxdgTl5tPT5XE32leqZOkrA6Q
	cp/oBTiVbc8qhAIyrUVCL2w4dyS3nMvqgXlQG9V73HlRoWlcK8bXiXcwN5UUkVZeOepMnl28hgnDt
	7mcXUHJ/GUl6t72A+kzk4noeRuNK5ufR4rdc63KfwkRott5APdovOBL1Z8KAqigpQlD4AJwi7ahmh
	hWrS1ugsR1hK4/zJfPfAqsbNIsjYJC0shiP5oIOycXC8qj+jjCB7HpORnHXCwbRFsHn50/lLDpeuX
	z92sFpmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNCJI-008OVd-1c;
	Tue, 09 Jan 2024 13:38:28 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNCJB-008OU7-2G
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jan 2024 13:38:27 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3bbd6e377ceso2751952b6e.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Jan 2024 05:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1704807499; x=1705412299; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7mDLa1lDA9I4zsDt/vUi7Q5DM723KSTf2pIxDEMdeEE=;
        b=qKfT9Ns23BC8nz+0XwlIdVUH3aVT4Yl2lOY1QaDiSelbf+GLc/vRTXyt6w/g2hWl3W
         iUc+eLnONK11UuLx4rO3zV1DMdB+p/izhaZp1ekw+bFr8IEjibAbBYOGLEUXshkMmrG2
         XnQjPsGp/I0qwGJLbApBgBxbfV9SdGwMjd2IodpX3tDsj4OEC9YNMTmdfhCHs8B9226u
         vy4A9xnuQxDsHLNmkAcICK8DNqc31g8weZyL0GQnovBdna+rq3olPO2nDYm3OCvtRJyo
         Af8rcamW47lIeJ189eecOMGN1OnDWGkxgvRy+2l0wO4tXZ2B/CsoDD7We+S+U0aEeSjd
         /+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704807499; x=1705412299;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7mDLa1lDA9I4zsDt/vUi7Q5DM723KSTf2pIxDEMdeEE=;
        b=hKG0epVvJiqlENa4v334U1u+a+3y56ESF13X8iWoax3y4a8s6iEbMfHPz/grZENwHi
         j0uRzeCaRS0/dO102sJZztv2KaPm67yzrVyIYRydMZolY4Q57nmCB2Qp+EHivF5VTHt3
         sqF0j6TmlcIsWuZCqylf7M0Wwqp4poNMERymdysrwrWpmWhVOPQe1eFhISjl5JYLJMy2
         muEqkpaNAqY1YZzNyoc/9gw7Zwn+NNAwe6J+Iz+WQh/YSy8AfCR4Wvf8Im23+/U5y1Ay
         M6cmgB9ojju7vXj66xlxXcTBSjEyC3ElNsZEApPGHAzkwrjFgyuvM+F/lfIntl+eG4b9
         UZSA==
X-Gm-Message-State: AOJu0Yy1mCewgA9f0IawekYOyjJr0+yW9Ad0jT8lupQ9n+flxi74FODa
	q8DyJh9j6+IMuWns182GeZhed60Ax4q2K4kl7FILSgNzzmVj5g==
X-Google-Smtp-Source: AGHT+IEiIF+TOwHH0WeGea/W9p977jXEPA2RPNa5wHtj/r0Fwo02EIRShmM0F605PcR5+mNqG3weRRapKtHQAzzaPtk=
X-Received: by 2002:a05:6808:3185:b0:3bb:d83a:99a8 with SMTP id
 cd5-20020a056808318500b003bbd83a99a8mr8896956oib.58.1704807499107; Tue, 09
 Jan 2024 05:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
In-Reply-To: <20231220121110.1441160-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 9 Jan 2024 13:38:08 +0000
Message-ID: <CAPj87rOMPioOK0r74vcnVkXusm6Nah6KNUWyxYgpVLdkMNtW2g@mail.gmail.com>
Subject: Re: [PATCH v1 0/8] drm/ci: Add support for GPU and display testing
To: Helen Koike <helen.koike@collabora.com>, Dave Airlie <airlied@gmail.com>, 
	Sima Vetter <daniel@ffwll.ch>, Daniel Stone <daniels@collabora.com>, Emma Anholt <emma@anholt.net>, 
	linux-rockchip <linux-rockchip@lists.infradead.org>, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	David Heidelberg <david.heidelberg@collabora.com>, Rob Clark <robdclark@gmail.com>, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_053825_857386_A4C4528B 
X-CRM114-Status: GOOD (  17.03  )
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

Hi,

On Wed, 20 Dec 2023 at 12:11, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> Some ARM SOCs have a separate display controller and GPU, each with
> different drivers. For mediatek mt8173, the GPU driver is powervr,
> and the display driver is mediatek. In the case of mediatek mt8183,
> the GPU driver is panfrost, and the display driver is mediatek.
> With rockchip rk3288/rk3399, the GPU driver is panfrost, while the
> display driver is rockchip. For amlogic meson, the GPU driver is
> panfrost, and the display driver is meson.
>
> IGT tests run various tests with different xfails and can test both
> GPU devices and KMS/display devices. Currently, in drm-ci for MediaTek,
> Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
> This leads to incomplete coverage since the display is never tested on
> these platforms. This commit series adds support in drm-ci to run tests
> for both GPU and display drivers for MediaTek, Rockchip, and Amlogic
> Meson platforms.

Thanks a lot for these. The patches need to be squashed to be
bisectable though. For example, patch #2 changes the MTK job names and
adds more jobs, but the corresponding xfail updates only come in #7
and #8. This means we have a span of a few patches where we don't have
useful test results.

A better sequencing would be something like:
  1. add ANX7625 config
  2. refactor _existing_ MTK display jobs to use YAML includes, change
the existing job name, and rename the existing xfail set, remove
IGT_FORCE_DRIVER from the script since it's now set by the job
  3. add MTK Panfrost+PVR GPU jobs with new xfails, add xfail entry to
MAINTAINERS
  4+5: same as 2+3 but for Amlogic
  6+7: same as 2+3 but for Rockchip

Then the separate rename/update xfail commits just disappear, as does
the removal of IGT_FORCE_DRIVER, because it's just done incrementally
as part of the commits which change the related functionality. It's
extremely important that every change can work standalone, instead of
introducing intermediate breakage which is only fixed in later commits
in the series.

Cheers,
Daniel

