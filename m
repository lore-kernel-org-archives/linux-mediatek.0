Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C83C5DF81
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 11:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DplQ14TFElXbQ39WaDvUzcCzX+hFbqRbBlASoiLjzDc=; b=0ifaNDLrqijrZoL0ttJV1GOJdD
	1oalr5T7gfXK3R+xGstFl2a5fhJ+5XG3OnVj73RjmSJHSm0BYq/CwNDzsYa1SoBtmhXp3sUhKWymt
	L0PPAikEdaqa0hZOUfhcxWOTNCxAEDS01Qjpp/xrEEr8g9hLohsWcVVO2nNpEMY625qKCeHpLBjzu
	POJUPNaSKBK+Tl6q3KaQuvaPtXD0GGIT1bnxO2emYX8dUaVxmiP0ooKfdLL/5CQYYu0jBtICPtrpV
	4ZLTu+Dj4QtN/xZZRcmp3zSd6wZSSPTo+VBsic9fCVvDXQ7v/umfsgBy+q4u1oxcPvu2mDwDg+TG4
	O8DXt6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0qY-0000000BRRB-0SuC;
	Thu, 20 Aug 2026 11:22:10 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0qW-0000000BRQY-03U2
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 11:22:09 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84a2c90e383so556261b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 04:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787224927; cv=none;
        d=google.com; s=arc-20260327;
        b=G/+uorJvYoE7EyFm7xnkz5CA+ayZOJimOn5g/egCykLeWtoEr+GhDpYkfc6kZv5rVA
         0X/P4kybSh5Y5sHzebRXFp9mfoQuj/HkdK1juZ8Lns7UWsBs6UderIQsmQ5OlL2He1rW
         zWvLZRZNAKZSwUBZOXv2bxX7kCKaSJjESi7i7IvVCGzFxYkjeHoNqKnkMRwBknNrSJtB
         gF327KiTJs4WSaCdJTg0Bw3BQCTRCUjAAfej7cYgAg3uJ6ROFYA3zF63wedwe2//70ag
         vyoJ4h432A62aprPB30SCjBqP/U8+g3xSO1PYlXleobm6WWL3KQBpifNJp44PjskpaYz
         egOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DplQ14TFElXbQ39WaDvUzcCzX+hFbqRbBlASoiLjzDc=;
        fh=rQIxY7EEDwFKp4TlUx2rzfxPtMOjkWnlhSTfRBm6IuU=;
        b=mPZYTc+KUEoyYFpET5SXxqA1d9NLpjkziT/ONJuTrdeFiiG4UYHOx8CNbXi+DO2x5i
         ogQCq6W0rs63+MNgk/hb9E5PN4mjTmXzHRgzUMabjD0zq2oyMnqdc9rsIrT/N2Mtdtoy
         G7sH0gAfLS28vrefBXZXnZOOPLKVCjx2hhKHi2bGWxHYhSUacE4GqzownT3yXkFaiWea
         2DgnAGklI4IX9s99smV4iBYuvQIlDKQweci7SOYmZvmWxkrP1DMFNKYRy9SAAQbppHoh
         MuRQ/BlzwyD11WBADknZ1C1Ve0Qk6mRvQgmDIxNgVM2v2ZN+Kanrmci+LN5J47AJEt06
         YFmg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224927; x=1787829727; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DplQ14TFElXbQ39WaDvUzcCzX+hFbqRbBlASoiLjzDc=;
        b=r4ImFo3bnR9n+Y+xV5G6OdZJ6fxYcPlLHmoiQSgax4J5GqqN9UwI/8k3864000ofRS
         PyTu0RPJdGYJNp6P15rz9Tx8wtqeenbH6YwGB/QfCjg0Qb27tWqnMzWM3xVb4U45jAjT
         kMELZRPLUQtDi5M2zSzvR6Y7KT6v532Z8f7AVnlNo5oUVamvzjh57JyEnYJ2nD7nWhUY
         R7dv4QikG8EZ/bQ8slxR5g7jPESBF157FfNu9UBGAArWsSeLRVyKKUzLi37mL6OuVQBb
         ugL7dEfdlYAIMV3d8caxJoa9mxJuGkxmTCKbPFtnhNOd3Lhi5qMvdNNtkvwuYojvptUb
         AamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224927; x=1787829727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DplQ14TFElXbQ39WaDvUzcCzX+hFbqRbBlASoiLjzDc=;
        b=Wl/qLaogVpSTqX5dK+vaBlzoa3djPXQxIXd3+DOB/KZUuM4RJj2kuCkw+lqiOZtpvv
         2049H7qIKvd4zGI2zfvbqBNa1xL3vwJWF80CAsnAI8eaRziylxtrWFzWNHIgyHVykftd
         rToGtMY08OaR9ccKc87gMnG20aevGsLof/45KXk1Cfm4KWsaEv9ex1YxaXbXI5TzAtz1
         2Q2D2NBZtbFWm3h4BL9M8VqmtTkn5xrxaMF4qng39tYYtRN1NC81mcCF7ERRc2dgsRBG
         s3DH37KwE9zWz3MLJB9GDLaOwP2D4Og5mGpBImCAqzWkPPkRZMlfHJBJmwceYiyMxgV+
         iaLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr6/ha+c57o0pxLMXVk6KyMSExkt//9zdzBXpttaxTQcVXez8dk+Ofmc1TgHA6qzG/C+9Vw69YCmB99dzyZNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyU9802Djdkhh1scozZt/S4prDKt9mMZkEvaXJK3gdW1nFnCteL
	krruqvf6z9NTxH0Xo0m7vs/VjbWH6ApC+g3VGCf/zo2Lorfci8FYnylHOz6Uxj2/KGknh55Jur4
	1togrFiLjcXb2fdkcaDljnbEdvDVdXhE=
X-Gm-Gg: AR+sD11vwFaKmOuhhtVE8FLkogU5/Js2G8EoJRuHGucDeOI2iOMB+HN1xlZ2jzbj0LO
	WxNlgY0ysdfezvz0w6sVWD9UPEZMppkqAYpHiKzqu9uI8YOkD2JC8hxNGlqpHHvvRyKTY5aZcXl
	PQKonSNfB4jco6QY2FCzenVuW3QdOatJqZMBPnfxsSdUdYVOtFRhrEpSXlvvd3dfvBWc1z8Txxc
	ELTWzXESFMJnRhAftQr1K+8nMKdtFU+vDm63SPlYNiyx0Z187NXTmFbMIrxIZJBKSFJdg8TzqMm
	HSaC9SPyO2OYvafjLUG0FeLbpS00rT1By3an4aOMoc+GEiA58XohRbgB5zu/dhjofXhBcAQ1VRe
	r1tcnFd0wZB5NfGrf18eJxGcUloiKTGHSHWHccnP7znCrJez4HG2IdhTyOvV3+jT3YTU=
X-Received: by 2002:a05:6a00:7603:b0:842:446a:4cb5 with SMTP id
 d2e1a72fcca58-851df6bca8fmr5910456b3a.0.1787224927100; Thu, 20 Aug 2026
 04:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260819101736.67632-1-phucduc.bui@gmail.com> <b85a7eff-10bc-44fa-96c7-601e80eefc3b@intel.com>
In-Reply-To: <b85a7eff-10bc-44fa-96c7-601e80eefc3b@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 20 Aug 2026 18:21:55 +0700
X-Gm-Features: AcwNN1Xqmf4X13xrwyEUJ2fuZQQM6YMt4gy6bjJzPbQcjJLgXb_ufsHBtAfIWEQ
Message-ID: <CAABR9nFcw+hZhUKCMkgs+L0JHJqFSKw9OQRFUm9e3pmNqmAg0A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ASoC: mediatek: mt6797: fix wrong unwind order and
 error code in enable_clock
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_042208_072969_3125B633 
X-CRM114-Status: GOOD (  13.47  )
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

Hi Cezary,

Thank you for your review.

>
> There is no changelog in this series so reviewers have harder job
> analyzing the v2 patches. If there is no cover-letter, you can always
> paste the update here, after '---'.
>

> In regard to the patch, the fix looks good - given the number of errors
> in the existing code with invalid return code on top, perhaps someone
> wanted the function to be permissive.
>
> Otherwise it's just bunch of untested stuff and your change should be
> tagged with: Fixes: and propagated downstream.
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

I=E2=80=99ll add the Fixes: tag and include a changelog
for the changes in the next revision.

Best regards,
Phuc

