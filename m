Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C0FAC54735
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Aug 2024 22:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZgyQZttbFN6Mpv5C6Zqi3PHF1KkrD2jrO7egIws/+I=; b=avADwOUKSpSTuffrRpwf7r4NQp
	Oyl5e2A0apRzzLx9B+VXlPZOSiKyrbJ3l3qlBlIZ4p5FGh5fQTt9sSSMGnasaPtqRiRZ8vWF6IVHK
	4TPd0nk5bwKwSC1o1u5sWdrCv9BfEOVu82RUU1MvYkLawH40yjTlezi0aL2Ua38ZwDMWkZts+Ajc5
	+gseucV5x5J3yY27AgkrByWWAO3+Ue/nhYQ3sdO5kGsSDqFWKo+XTc24PSM6eBivFSArRwiYIGszo
	/zfGUc2AhwcP+CTzIcKVXTzFF6yspguYy2hlhLyofbWha7Vs7TeMn+4WBH2OH+laqhW055fy3gQhl
	SGaf2qIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj4J8-0000000Cysq-2MHS;
	Tue, 27 Aug 2024 22:04:58 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj4J6-0000000CyrS-0zFG;
	Tue, 27 Aug 2024 22:04:57 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-371ba7e46easo3503551f8f.0;
        Tue, 27 Aug 2024 15:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724796294; x=1725401094; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZgyQZttbFN6Mpv5C6Zqi3PHF1KkrD2jrO7egIws/+I=;
        b=l0SVfxEC2mqU/y6uJhmirzJTdNoIaUFiQNaSuRb8kwow4NM0STdUh5Y9GREt6LcSm5
         u0QxmC1hcw54OZt5QgnJXowntoovou6Vf6WXJfVWs6Ytcq6eefPd1J8T9OJkVRocld7D
         fFWNhJoqHmTDkPiZ2UsWm3vy+6XTSDJ+WYzrdFvRGJ1jXr0SexZ3FWRbf8Y7QfnxpX2G
         5PpIhczYFYuudMU9K5D0Da0ZMeIXlG2jRgF0LsZn7codDUp6ae1hsR9M3E97y3iZqWiO
         AiOnQAOcFvOfqdHdnAnv5kb/A9q7iRPfqKxBCQGY1QHnDQ0aKo0NJuPLOUlwZnpjYgQx
         lpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724796294; x=1725401094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZgyQZttbFN6Mpv5C6Zqi3PHF1KkrD2jrO7egIws/+I=;
        b=ZFhooBA/rsAOI179FPWLAhOvTbg40duv68O1BAZjwKC0uB6G8bTlWlBjZ5jrrF0kCx
         JFmhu+iUJeywaOw/+hzN+IskESwqqBS5tolxyXsUG7nkj4LjpxTQjtruer9WXH7tk6Ae
         wIbLgX99IWC0RiK2VdJSzdNMuPR7Qlk63SRATyejrfzGtj9CMIVhdNkGIbs4IYMjE3nq
         Ss9TKJfV6doQAgNDxuuxBKFgzVYGr/AMUrtZJtR3Ou42pmteI1c8N4zZHMhUlsXEnQWT
         A+p1Xr1wSjvlcQhBfyeILuu1eK7V7LtleMOHDGpyyHUjNi2FkyLy049AqvPE3IUeMKFr
         FyuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDdouDZNq+G8HPBvkywSwv3KancXtltHBPyaS+uq/txH2kFsvGiaXe4s/59TX+x0VAuigeMQyYbE9MnoHN@lists.infradead.org, AJvYcCXIR+g8SWxOgx8aRXSo1K8JZuyjFNbuP0fH+14JoM3C8KAzEYpe0mzv1n1vZ4FauuztKiezhreWPwYcxtLGnFs=@lists.infradead.org, AJvYcCXuojC6YVNUZroh2UkVhHdfPZCTehWSJixSfPigS18OTy7SkdW6b9CWnR5u2wVd8UWyztM8+pdCjT4B+sJFAA8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBR+1Smy+/b3uAR2oPpaa6zBqOExGF0gss0v2ZvNHmeZ5Tt7/L
	tLOolmn6s5eaP5gTr8eRagVNauU8IpowCgo+x+mnwXV6NKd8n9d+jBbnfsUHxSJublAAW+n0F8g
	ldWR1dUWMvoB3w2L8ZKZsoYe5Wz/B9Q==
X-Google-Smtp-Source: AGHT+IHWk+OQ6gg8FUjgV2v4vECfE0Fa9RJ/6lK2GykuDqzWb1DzW5pw5cVNOpUVhtAQtCWvfc0gKwWGbXHqNy0EXDs=
X-Received: by 2002:a05:6000:8d:b0:368:747c:5a04 with SMTP id
 ffacd0b85a97d-3731185ad48mr7748341f8f.25.1724796293984; Tue, 27 Aug 2024
 15:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240820070818.1124403-1-vignesh.raman@collabora.com>
In-Reply-To: <20240820070818.1124403-1-vignesh.raman@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 27 Aug 2024 15:04:42 -0700
Message-ID: <CAF6AEGu-T4=3jPRcnq3BFBtfb_yhmWE2b8EgxgTm5Q0bqSv04Q@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: increase timeout for all jobs
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	deborah.brouwer@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_150456_293533_5AC7075E 
X-CRM114-Status: GOOD (  14.07  )
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

On Tue, Aug 20, 2024 at 12:09=E2=80=AFAM Vignesh Raman
<vignesh.raman@collabora.com> wrote:
>
> Set the timeout of all drm-ci jobs to 1h30m since
> some jobs takes more than 1 hour to complete.
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/ci/test.yml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index b6f428cdaf94..09d8447840e9 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -10,6 +10,7 @@
>  .lava-test:
>    extends:
>      - .test-rules
> +  timeout: "1h30m"
>    script:
>      # Note: Build dir (and thus install) may be dirty due to GIT_STRATEG=
Y
>      - rm -rf install
> @@ -71,6 +72,7 @@
>      - .baremetal-test-arm64
>      - .use-debian/baremetal_arm64_test
>      - .test-rules
> +  timeout: "1h30m"
>    variables:
>      FDO_CI_CONCURRENT: 10
>      HWCI_TEST_SCRIPT: "/install/igt_runner.sh"
> @@ -215,7 +217,6 @@ panfrost:rk3399:
>    extends:
>      - .lava-igt:x86_64
>    stage: i915
> -  timeout: "1h30m"
>    variables:
>      DRIVER_NAME: i915
>      DTB: ""
> @@ -414,6 +415,7 @@ panfrost:g12b:
>
>  virtio_gpu:none:
>    stage: software-driver
> +  timeout: "1h30m"
>    variables:
>      CROSVM_GALLIUM_DRIVER: llvmpipe
>      DRIVER_NAME: virtio_gpu
> @@ -436,6 +438,7 @@ virtio_gpu:none:
>
>  vkms:none:
>    stage: software-driver
> +  timeout: "1h30m"
>    variables:
>      DRIVER_NAME: vkms
>      GPU_VERSION: none
> --
> 2.43.0
>

