Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFC5C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 19:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ddmRIb4i/h+sjn7hQWE5kAmGSnaaAcWeE6O6HXJcxs=; b=mzUZOp/f6XQ4EODLIYKJ288g70
	b4ag4hhdRWrqQUqLlNqc67a7DSdUCm7N+UnxTNDhw71gukVfujm9MBD13TKbytHP0L5SS9MYFZF7B
	PcD6Y2/Q2iCpTd4ya4w4DDRyAAmqpSK61KBEpvHuu3DE0gChkjLzO0ohdw3zEUXS72NCiI0qjI8yD
	DM3ziuD0DrbN7FCxgtKOFi1D6GT4cqqzv1wbdtU0iah4QfW8XfIpitWBdpSJqnCYk5N12IKqtnwsa
	vYnBoAkSYtUUVYt94jm8Z/LMYnfrCGK4P77fvXsDyKuPMhMMRK1NlSGMY3OjpAWmxQgoosOyTykhL
	HuadQ5KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOkRS-00BPwK-1L;
	Wed, 26 Jul 2023 19:45:02 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOkRO-00BPuo-22
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jul 2023 19:45:00 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-563de62f861so81786a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jul 2023 12:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690400695; x=1691005495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8ddmRIb4i/h+sjn7hQWE5kAmGSnaaAcWeE6O6HXJcxs=;
        b=gTgJOOjmXViRqVB8PWx1C9q4AcB39FhekgiPKuNA8kB2Q71Pde1NI4BKgUScEtJCbe
         kl1eJ9ksh/y4Bc8/B+WEPxrDnblB+nBEJakz6cAwRMbZboK6ar/+R3frF0nxEp49LRfw
         Gz7HRVS32tML0iuoV1fu3mDU6YJe0mbE4rISg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690400695; x=1691005495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ddmRIb4i/h+sjn7hQWE5kAmGSnaaAcWeE6O6HXJcxs=;
        b=HpanVZT90mIboE+9bgM+8xpcjlWchFzP+ZNDmPmyhdxs29Ys5TxexLGDCUuW8N+Ch+
         PwqdurkOJiUWknWe/DfpCoGHm4/D7jRk/zod2ScAtQzvlC6NMy3KxUO0lWjIkFP7NNZI
         3x40gbGiVTIElbEOeXDSYSuBOEkncxH1u145OlMNGfMQYdVnJX5CmWZlUh91w1KWuvWW
         9i7u7Xzl4Odrw/Kp6LgeHKpQ3qxIBJyk5Deu+w/7ZyP8Iq0VqAjVNXCxAeLoAl5L5Nj7
         W0Jug2vuNwP+H0t1X46DT6DYyxlCosUtssY6Ny7YDmwgsVQut5agVvV8l6SwEZ6snaaB
         K9Cg==
X-Gm-Message-State: ABy/qLZ2WWn+DPE3E/rfesx4PnE93PXKSf7EipWLMFFzqfXyXE+Zipfu
	fwHCfoIaM+9ZmB9JysJkL1Eh+bDeq+b3ilx0cCQcVA==
X-Google-Smtp-Source: APBJJlEJiBzzS/3WnvQvdTP3lCShgQFzMzH77QVBiBNzQKo3iuikMlbL7E6NEzCyaiK8QlkeUFF4IkacY/8lgbRPL08=
X-Received: by 2002:a17:90a:542:b0:267:f9ab:15bb with SMTP id
 h2-20020a17090a054200b00267f9ab15bbmr2317243pjf.14.1690400695143; Wed, 26 Jul
 2023 12:44:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230724175839.675911-1-greenjustin@chromium.org> <CAPj87rNJa3CNWekovSMjgfGyduJ5BZtcqAumKfDdooW7Ocs9zQ@mail.gmail.com>
In-Reply-To: <CAPj87rNJa3CNWekovSMjgfGyduJ5BZtcqAumKfDdooW7Ocs9zQ@mail.gmail.com>
From: Justin Green <greenjustin@chromium.org>
Date: Wed, 26 Jul 2023 15:44:44 -0400
Message-ID: <CAHC42Re3LoQQOzPww7SbYTEK2MLHwtkitvEtV6uBnkQNST30tQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
To: Daniel Stone <daniel@fooishbar.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, 
	wenst@chromium.org, angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_124458_695468_23B4553C 
X-CRM114-Status: GOOD (  11.75  )
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

> Would it make more sense to commmonize function mtk_plane_format_mod_supported()
> and call that one here instead?
I had considered that, but mtk_plane_format_mod_supported() is
required to take a drm_plane as a parameter in order to conform to the
type signature defined in drm_plane_funcs, but
mtk_drm_mode_fb_create() does not have a drm_plane to provide, since
the framebuffer is created later in the function. Technically we don't
actually use the drm_plane in the implementation of
mtk_plane_format_mod_supported() today, so we could just use a null
pointer, but I figured we may one day need to add per-plane logic.

> This is not DRM_FORMAT_MOD_INVALID. Please either explicitly compare against INVALID if that's what you meant, or against LINEAR if that's what you meant, or both.
Ack, I meant to use LINEAR. Will update for the next version of the patch.

