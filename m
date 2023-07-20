Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83782EB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 03:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSjRK2q1L9TAgulU0uKFfXHGPLF469L5iIGjDG8jzbg=; b=2xxwK9J7o4FVGI1GqRfW4PUIwL
	0UVDalYgbCkfSdncJ/0B07v1bKqJrLGmOGmyMJrVF+QYWze7glKVI1dFRiAZAIwZqLxPRCh6UOjz7
	Lz44rGdo0t75f68VrZAPw2v2YbRogXs8yNVW7J5B3x9DvhXurWgIGZ3JcjOX8GxkRUhAkWk1Q7s5F
	T8t3/PHptCzpX6od3aerVRMd/pw4y5g5y2Trek39iHrk3WPjSMtFw6NvluVrxdv5Hu634WJvHGhRF
	fA19IP2dxsY6t7jXfVJ8zibcV0zvqgpSpzsOLsfibNamYt++gea3rjkwIgE+zKBK2NAnnEvfZ0o7r
	EzVdpC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMKWg-009fH0-0H;
	Thu, 20 Jul 2023 03:40:26 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMKWc-009fGB-1Y
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 03:40:23 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-481389cd087so120207e0c.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jul 2023 20:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689824417; x=1690429217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSjRK2q1L9TAgulU0uKFfXHGPLF469L5iIGjDG8jzbg=;
        b=A1C8FiYaGFUhOBe4OExpBOhr2up13GqZwONd0apG8WRrOE0u82/9QweJR0RirVCU5m
         iAIP14/mrlnZs26gc6oPj/kR7DPbAGbc8G9scwDO2g8UjPxdupPWQUxyeK8VirMMMdS9
         TFhPquxXvCppdgKp2QUkdEk1T8e+oc2MR6xQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689824417; x=1690429217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSjRK2q1L9TAgulU0uKFfXHGPLF469L5iIGjDG8jzbg=;
        b=TVWRgdoxQ4PhKikZrL0YvJjLhig/OTCdb1epCtM4x1Qb55U1wrfsn0LQn+fUFgt7PB
         GDE6GYdTrj0goYjjS7ZX+8oefL17J91O4Am7JefQFJzBkwbgl2fMkgVTZGp042mkvkWq
         tcF46ZQgDGj9zz+BwCE9k4Ebn4l6BNxsOgVUQXPPhtkfZR+4W7LyYQHr/2vTHoRSCe8s
         OboZGCCU69KPN3CY+JBYgT1i3E/DhCWwmyY/mzEHBQNjKhPnip4CqPgaYnbKXDBAg0cP
         vGoVashxR8sxw6ApXkB6XxrwvXlMb3F/i2HKsZdD1o7zI1CYHvmcYRio3235y/Ry1RQo
         3dHw==
X-Gm-Message-State: ABy/qLZr+Vm7QT/5gmdbEgraN4dkCtK1XwDJwAKLIxCe9TjmsWEHh1h3
	zzblZjYwTT2BfQj7Bbz1RQrWO5QHty7NRrzLYFAF/A==
X-Google-Smtp-Source: APBJJlFNX7ga31HK628CC6mrALekyrNpX5VHsIamGWWzU5anyG2qAUaYHqYQELEJ8vJVk/lcPOgf7qx4IpcShRxdv2Q=
X-Received: by 2002:a05:6102:387:b0:443:516b:782 with SMTP id
 m7-20020a056102038700b00443516b0782mr1896634vsq.33.1689824412895; Wed, 19 Jul
 2023 20:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230707092414.866760-1-zyytlz.wz@163.com>
In-Reply-To: <20230707092414.866760-1-zyytlz.wz@163.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 20 Jul 2023 11:40:01 +0800
Message-ID: <CAGXv+5HjLdZO7mCJyBYk_Kj9SFUJrL3Z4VbxSsPb2qK-mbwkaQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
To: Zheng Wang <zyytlz.wz@163.com>
Cc: Kyrie.Wu@mediatek.com, bin.liu@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Irui.Wang@mediatek.com, security@kernel.org, hackerzheng666@gmail.com, 
	1395428693sheep@gmail.com, alex000young@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_204022_516555_F39A23F8 
X-CRM114-Status: GOOD (  11.37  )
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

On Fri, Jul 7, 2023 at 5:25=E2=80=AFPM Zheng Wang <zyytlz.wz@163.com> wrote=
:
>
> In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
> and mtk_jpeg_enc_device_run may be called to start the
> work.
> If we remove the module which will call mtk_jpeg_remove
> to make cleanup, there may be a unfinished work. The
> possible sequence is as follows, which will cause a
> typical UAF bug.
>
> Fix it by canceling the work before cleanup in the mtk_jpeg_remove
>
> CPU0                  CPU1
>
>                     |mtk_jpeg_job_timeout_work
> mtk_jpeg_remove     |
>   v4l2_m2m_release  |
>     kfree(m2m_dev); |
>                     |
>                     | v4l2_m2m_get_curr_priv
>                     |   m2m_dev->curr_ctx //use
> Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decoder=
 Driver")
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

