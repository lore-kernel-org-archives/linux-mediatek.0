Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75739C36000
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Mar 2025 10:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6XBFDQAIe6jgF6F40xRB15uQkrbHzlxj9SySg4AP08=; b=kRMPrsE0YPdXdapbtcSDkuWtxp
	NJWe9cpuL+yLbHPFVzkdtAU8r9INugNi41TmZcr8jLHjDaAEna6dQbCmYGtkbdvRiz3X6cXjZFXc3
	yFUVJMe/sEuv7ux2sshbvow25i/3lUnx651P+IFe2XeiEQPUGxP/GgVJLoXaplo7YGgNRNkSQUaYp
	2h4QzDgxj8sAbksRhkgDYDM2u6b3d8gxElvMgk4UURJkqz+XVbfqV04VTfh8PPzq3zlJR1ukvmNPx
	mimaS2IarwA08LDaU+wUvvlKsIPOsqFgP1iJj2TGQVN1SlqX+0vb3CgM8QLOfTu9aOzFkR4KKI+A+
	JR/BCNNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZmr-0000000EYFk-23dR;
	Fri, 21 Mar 2025 10:39:37 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZai-0000000EWLK-3w4h
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Mar 2025 10:27:06 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7c53b9d66fdso244303685a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Mar 2025 03:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1742552823; x=1743157623; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C6XBFDQAIe6jgF6F40xRB15uQkrbHzlxj9SySg4AP08=;
        b=LmNfEBZZml1EDYYkD0nWv72zHMf49uMTytRkxAVxsm27xEadylgYHZy/3AivwuscFY
         IEbKRWTKqPcSHUdnHRUPNGQuLPxA3mELcnV3ZMSjpMKKX85hzF/dpFwkFlfd79FBgN41
         9MX+kYT2KGA2iVSgB5Ogn7wkkAoEidsKzjMnVmTs3yDR/7ACTRtkKEu2AcR2gxQUSNQS
         6juEvxgpOyRN6dZENP5Rt17a/F7LFwKJMOkmGLm57/8twHdwgG+Rhxwzi+hZqLMmwy4u
         i1QUQFboZ70HOOCv3OP9Pd1WHmY+CTPF+U+6htpt2rizcPbNEXHYwaejyvUqkdIs7kBr
         myPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742552823; x=1743157623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6XBFDQAIe6jgF6F40xRB15uQkrbHzlxj9SySg4AP08=;
        b=Io+Gy3KrIlSAVPaJMfKDOtPB2iKTPkhxGV9da1aC5PvW1WWe4v5LteVKNUpZp/H4hf
         i/lEaV2KHUOYA4pKn/PuAhhwJZ+pGIQ2/F9mU+d1ZsBP2cm/IttVqjG7KG/FJ4G4CQQ3
         cduhhwvuj+KhN6SBIJvptmxzD63NiRTUuDXYC34L7Mbb75wqszsaFEYI87xLmWASYE0J
         Wr5tiWtyaKmXx9BP25KLWYRJp7xbMaPJhH2w0LGcRvLyIDr0oMJdUUV2w3OvYt3lli0C
         dLox89tgX5bIJnijUbFGpHChXBI6lozJ/vIap8pCIWTv8TYeO9fBQcxKDHhkKFCQ+wo7
         QG2A==
X-Forwarded-Encrypted: i=1; AJvYcCUwyY2sAGDWzBfrwmMn2SfoTSlu37YdNDdionuLebgbcMSusGoSY5dhua6yhIegqR2G90Es7ua9twBTFWGTlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJGCgsEAZCeXQk23IbepGnr8yuzESCEJnEv+FjzLBjNOinr0Ii
	JK/+JnuWdRUr/ObblclbGJvASoiFT0FtORoQZa+lbHnwgV9fnYpXd5ahaiN3G1s4tkJVlXVxWqx
	mEIh2jcIWJPs19grkzreCg8PH7E8+eYDzKy+8+Q==
X-Gm-Gg: ASbGncvv+Xl1+ShYODIT/sgMcakqdHuGjZ2HERlYpKMQVoCr983DjlsjGJhz0wItVYD
	6fTHjf2PXPs98ElYJB1uH8ZjDyyxupQSkrHEZsRndwTZpcVhLDSDNvhNLR5M6ikiT2vuj4N+2KE
	Cwc+HFqS3tS/+1X/CtuuwyBEAo
X-Google-Smtp-Source: AGHT+IGtKZxKAoZgtR0aBlIVmyFJdz4vLgELnLl5z6u4LuYLjXNoyuq0UVrTF+CIIc7xPDTVRmAHZ+SRVPvG/7TyZXI=
X-Received: by 2002:a05:620a:4055:b0:7c5:a423:f5b0 with SMTP id
 af79cd13be357-7c5ba13361dmr406693385a.7.1742552823192; Fri, 21 Mar 2025
 03:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250314085858.39328-1-vignesh.raman@collabora.com> <20250314085858.39328-2-vignesh.raman@collabora.com>
In-Reply-To: <20250314085858.39328-2-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 21 Mar 2025 10:26:52 +0000
X-Gm-Features: AQ5f1JpymW7UP78_0g_Z-sNByprYGBFX-xYqr_OlbVrsK0-Hob7Zk88vIu6Znbc
Message-ID: <CAPj87rMjF84yyPqBshuGu=8qx6Xhq9Z-HgEnQe=tRtbu3E8OtQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/ci: uprev mesa
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
	lumag@kernel.org, quic_abhinavk@quicinc.com, mripard@kernel.org, 
	jani.nikula@linux.intel.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_032705_135411_41B1AB42 
X-CRM114-Status: UNSURE (   6.81  )
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

On Fri, 14 Mar 2025 at 08:59, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> LAVA was recently patched [1] with a fix on how parameters are parsed in
> `lava-test-case`, so we don't need to repeat quotes to send the
> arguments properly to it. Uprev mesa to fix this issue.

Thanks a lot; the series is:
Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel

