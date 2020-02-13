Return-Path: <SRS0=7p0Y=4B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBEAC2BA83
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 08:03:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D267E2168B
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 08:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O2ETpvhD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="VrWi7c2d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D267E2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJx4Nk/w7uMgU86pIbCh+diLNeieBB2vIXzLMa1/zxk=; b=O2ETpvhDphVnak
	OVBsyWGA4f8V/BniUm8AMa/7Nr/oTv+PolNuLLqnLfLxZ0ufIkxt8eZcFaV9qFKA3ncZYTACxxqxi
	9PbSHyQE3TQ41EhPwnMJzgS0JoxzpZDi4y8jLGu9VcLFt7PVnndNuUKG8zzsIsRnVqBn9Sd872ieC
	AxJykdi8SA8OGJ460LaxIlON5mxir28nZKjpFsq1NVdluKj5eEnX1j6GndbHRJyIpnlLSdVrhIAH6
	hAA9zq2Qsv1njiPXz7piYnsOLyvF/OP8/yROishMveguWkMmiOw3jORX8qjWjMiIpixgAjM77vPwV
	c3oVFLNVRdkEOo+nrCbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j29SV-0002iN-9j; Thu, 13 Feb 2020 08:02:51 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j29SJ-0002Zz-QM
 for linux-mediatek@lists.infradead.org; Thu, 13 Feb 2020 08:02:41 +0000
Received: by mail-il1-x142.google.com with SMTP id g12so4201981ild.2
 for <linux-mediatek@lists.infradead.org>; Thu, 13 Feb 2020 00:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=10gKpQZri/82cKq6/v6n1q70/ykUGaRsAC3tbxvLKNg=;
 b=VrWi7c2dKzqZsYHKurZTdMgkC4RFCLz8pRQXKliNxIOnXIQN+w/7W6XmD6fSAowzQM
 ioOh/SrY3dOutMvt3wb5cGoy9CCd2hq9e+XJfPgkt+l6cd7VhjlSGIwQXuLnco2uNsYC
 UypTXDK4eCxQ2pS4z1F9tocVzjWyCYt5twKT2tGFFb0FupN3d1FiybANMraeI/WOAHuO
 Vbh4+aY3BmlkgOA8BGZ67TXc1X2ej6xK2B6Xe6W65hODbjUpqhOCOYwGzk3H7J8Q00Ki
 OVjdyTUPZ8P7QlU9e6592dew2zas6uql7ZoBeMEedlHy4AhNyucuGZdfqAR9pwlXQ8jB
 AoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10gKpQZri/82cKq6/v6n1q70/ykUGaRsAC3tbxvLKNg=;
 b=pRGNFGfpUtSHwXJJmjOfBBQ7eD7nJ36B6teRtqIcpb7nhK2zFMqqifdEtPLoHcW/V3
 WS1Dqo9s/s5tYs4qd47moFcevlCH6kSxk0yFIZgFmar1mZfVxSPp2AAU5HTViMsUHaJm
 8cp4EZHhLiIJDfleaDMCOQudoEwh89WE2DfsjvI5DSihHMliUubaTt5sEW6UqoXH+yVi
 o9J0ajqY9SheIu+sEyeGjT71ZkvdRL0qsaR/Z9y8OdWroAqGfI5/OunaRg4DgcKUQBIz
 Xwfwx5aqU3G5fIJuWytLBQzRI6o2lMs3rsZnQdisinayVAajbiwwOM/fY1lWjpqqh0i/
 rMmw==
X-Gm-Message-State: APjAAAUU8A4CxNPcyQ/Y+8skEFdAtMwJgW970TOZZsMi5XCqvKfHYM9m
 1FETH9zj4spPaFOOojC+F02K63iVnZ9HeDiSoIvBsg==
X-Google-Smtp-Source: APXvYqyyqulvy1f+tDe7AmP1JblcXRQSp7dWSy72c8KxhM3n5LgVfLKIkT420HK+MTxArT2iueFQFfyI3z7Ky2ifzjI=
X-Received: by 2002:a92:981b:: with SMTP id l27mr15162000ili.118.1581580958517; 
 Thu, 13 Feb 2020 00:02:38 -0800 (PST)
MIME-Version: 1.0
References: <20200206031752.193298-1-tzungbi@google.com>
 <20200206102509.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
 <1581495554.22603.2.camel@mtksdaap41>
 <CA+Px+wXjC1rchzUGhYYCJVyEbm7RQNFnqf-sQNaky6d82DyLyw@mail.gmail.com>
 <1581559033.14792.9.camel@mtksdaap41>
In-Reply-To: <1581559033.14792.9.camel@mtksdaap41>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 13 Feb 2020 16:02:27 +0800
Message-ID: <CA+Px+wWAR3E8TWnPJEa62WjXQQ1Y-Ni9g1rqvPq0f_HPYYynHg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/mediatek: support HDMI jack status reporting
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_000239_861917_BA9E3CD5 
X-CRM114-Status: UNSURE (   7.35  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, p.zabel@pengutronix.de,
 Dylan Reid <dgreid@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 13, 2020 at 9:57 AM CK Hu <ck.hu@mediatek.com> wrote:
> I'm not only consider the race condition of plugged_cb and codec_dev. I
> also care about the atomic of mtk_cec_hpd_high() and hdmi->plugged_cb().
> If these two function is not an atomic operation, below is an example of
> problem:
>
> <Status disconnected>
> 1. Thread A call mtk_hdmi_audio_hook_plugged_cb()
> 2. Thread A call mtk_cec_hpd_high() and get disconnected.
> <Status connected>
> 3. Thread B call hdmi_conn_detect()
> 4. Thread B call mtk_cec_hpd_high() and get connected
> 5. Thread B callback plugged_cb() with connected
> 6. Thread A callback plugged_cb() with disconnected (Bug here)

Another attempt: https://patchwork.kernel.org/patch/11379979/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
