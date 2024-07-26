Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D71DC3DA63
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jul 2024 07:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=avcZ0XeDvxhFCHHWnLz/cvRXaQLXwQeaSCVLcihXW2k=; b=OfCKN9dIybDFXyuUzHlnfV6WHG
	GJzn4fmFzRqTOzxTJ61mLcYF+0GcifUcAnwhTBYTMEkS2xRhbX0+zMKtMAe9bU2eAa+2BJZHXTrcX
	aKN9EWKulss7RXWRYEpspX+ZRF+Cjt2N7v6p1N/987by8EVhgpuHsByR7IyNAS6AZDv+K9pMUMRMH
	eAbxot4fGcYE3TuOGlRuBuWGnrvEbWnJXLL0zN/1duM0CYYiY71/8F4rG3fi9YO3XUGMNF6uXhwEo
	FJaqB9ESz/BtPNuE9BK8hWni3n6Q6/p5rZzyGqhttJdgbVRW/1HmLmSQEEJ8J/ULc9Ax1Gvem2a3V
	mTbcR2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXFK9-00000003Ar9-3acF;
	Fri, 26 Jul 2024 07:25:09 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXFK6-00000003Anb-3UQ4
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jul 2024 07:25:08 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7a1dd2004e1so24304585a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jul 2024 00:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1721978703; x=1722583503; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=avcZ0XeDvxhFCHHWnLz/cvRXaQLXwQeaSCVLcihXW2k=;
        b=yeRLeeKHrdgOouIGieWLZA9Rj8xjy6UZ8opUxySb6GAtp4MaRB3qjr++/SW+hqKK69
         B+f6JF7Tw20fW8qpPyEcn4zd/IaVbOGNeWpbxrVEdlciY4WFU70wjIo41NdabuMDkdWt
         jAX/ZZbnEcfBzvqhbUkisInKiRG4i0eeCiJfhzHUdyaZUsD9YW32XvdONOCAEQ4Cbeo2
         2zq2W/RiaLHL+z1MEUOnEp7s35Hs3E84o9tlCIruTGpYobtvsfkqzdnViB/FY0uaoXdo
         o0w4DVPMbIIJlxljoM11yLc8r0LGgA0+EqdRRETrIARqP+v+ceUOrXJmngXUGIvjwVly
         JfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721978703; x=1722583503;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avcZ0XeDvxhFCHHWnLz/cvRXaQLXwQeaSCVLcihXW2k=;
        b=j7p6JyzoCzrafl5KAYQmpF5tu08U1gzgNVGwJJKWKtrLcDj/4HasvyLz4qpqsshveg
         /IADaIeOOpEu8QhRXWCSNLkHsJ9fa32Vf3H4ThHfwcVWz0MdSd9KcLMkpikoQJ3p1Bxi
         PyAqR0YKDQ3GPBDQ98wrO1eRuQ/+pfDDeRI0Hfi5yXoGxX2pJYSjNT4mtEBECwZBJjGf
         nRd275nV7sLF6fzvUWxPtqAhFnuzMeh9Sqppy6qyC2aXsY80k7ksFIhBEpAQzcpUQuLy
         lkSkdU53Ybogskc74aqlpuTOanHh7vLyRr5VSh5hGaCJa535+zU0rmWyn1zVs67zd4BS
         d9bg==
X-Forwarded-Encrypted: i=1; AJvYcCUiBdDytJM9wXTC+0c/OywFiiAXRoSSVwbBo3+eH4kJMdOVn5SjUdaLEqzTR8FufK+wklPirXQjPcZQE3DWufPNs6WcM78EH1T1h63wGVUekTS3
X-Gm-Message-State: AOJu0YzWLNUfiyKMJBg14z3eRfNfDEcRf/1ByQXiFeSKH+LuujFaRPS4
	25iKJaKWMleK3mK7JU6cz9FPGsEXwap5NH1UAgXZrnzOOTH3mXvHT1wORWPwh/UqbgzmSjPaT4a
	PD38xJrGidpJUYfBkCMSw8UhFWLPU/RaTaZXVtg==
X-Google-Smtp-Source: AGHT+IEQMpCGcCv6MJDs37LwNfhYJ/aHQOmhySiSwOE4b8vVqH4/XnV6OaZWgrzn4PNCU6z/pjfP9qGkBv6/dQosuiY=
X-Received: by 2002:a05:620a:1a15:b0:79f:c9e:6269 with SMTP id
 af79cd13be357-7a1d7e8463cmr446035485a.37.1721978702356; Fri, 26 Jul 2024
 00:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240724101015.523535-1-vignesh.raman@collabora.com> <20240724101015.523535-3-vignesh.raman@collabora.com>
In-Reply-To: <20240724101015.523535-3-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 26 Jul 2024 08:24:50 +0100
Message-ID: <CAPj87rMfs+_EMyJT1PoLTXmrosDiqQy_N4VYSA+M3R5q4sit5Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/5] drm/ci: mediatek: add tests for mediatek display driver
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	deborah.brouwer@collabora.com, robdclark@gmail.com, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_002506_898967_27022C2E 
X-CRM114-Status: UNSURE (   5.75  )
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

On Wed, 24 Jul 2024 at 11:11, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> +dumb_buffer@create-clear,Fail
> +dumb_buffer@create-valid-dumb,Fail
> +dumb_buffer@invalid-bpp,Fail
> +dumb_buffer@map-invalid-size,Fail
> +dumb_buffer@map-uaf,Fail
> +dumb_buffer@map-valid,Fail
> +fbdev@eof,Fail
> +fbdev@read,Fail
> +fbdev@unaligned-read,Fail

Please skip dumb_buffer and fbdev tests for all GPU-only drivers,
because those are testing display functionality.

Cheers,
Daniel

