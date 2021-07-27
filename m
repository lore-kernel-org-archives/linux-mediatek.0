Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FADC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 07:52:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EFBA611CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 07:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EFBA611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ykg0LTHofIPWG9H6z1sCIPLusV1Wm486GfeH48dJ2A=; b=yZlmbhbi60OyxP
	yCEQbW0ethUdw2BD86gwvMwpt5gtANcNYX7lStaMnIQZN+HeXhjHBFJoOjuZ52ss9Wl5qdMwG4Qdu
	iS4xPdRj9evV3Wwv6IT4Fx2TOXxcB/DgW1nm0FO4HZx7LRxqs5tOm1JyJr+y23fwhQqDg+AA6+wDj
	ycTZVIKXslb0OuhEVCjl1nKPOwZMxQjrpG25Bez14CMRNPMJTJT8rWUUJj12nswPGSVjtMK4rV57T
	ypvgONpdBqHNVtWqE9inkUlFGuoiqizuk0jJ+ijzsyR6WXuhIDX3s2iT0c+z0V2nNO0iF13azXJv7
	H9BO4xNmfAqT1ijIlovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Ht5-00Dvam-OP; Tue, 27 Jul 2021 07:52:27 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8HOq-00Dnf2-QW
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 07:21:14 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 68-20020a9d0f4a0000b02904b1f1d7c5f4so11598883ott.9
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 00:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yQhhZe+MXmpfkLnh85/Z8tkXEKIvw/AuYXzOfTRKZJE=;
 b=PZr5f2UnPFBMoWR1tobduCnk9rwIYH0AijHubObKP5CcIUo3ugfnpdz8aVEMsOP23K
 Y2TcJTFda7LwyNcdNmPEuuatoLOHYMFBp2l57/E+W7SnNQbsFDxhBY3xolhgqQLVpLK2
 tqh88JtVCKyHcU5COG4k7DTjKfZtpF9i63jgeht4qDJBACzdSN/jgRETxx6JWIM7jYFx
 TtYLW0uQjewgHIp4TmrFS2DH68l5DIfeQgkF1k8OZxujnje6oJG7+iADiYrt86fgOJg5
 Zl//iEWZqJJyRiz77b2rLlQy6pgL1QWy6/xXQK8wSCDPDlwC/RcSjV/FHf5haFD243yl
 lgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yQhhZe+MXmpfkLnh85/Z8tkXEKIvw/AuYXzOfTRKZJE=;
 b=jvkbUQ0xNjisKAfEQYSwg+dKcxLhl2aJFONH7tKZeUR5GHDVNoZCZfRqK25CqQC1d6
 wORplH4av8I2RsoSI64es68G/7ROlZ8vcOVUsCzajCb0Zngh2ZWpHjJ5orHtJnYfv14m
 2R6vC10I6rB/zNY938Ph/xx5rHfEsszBrw1/ZoTXT+JenppWSWkmPM4scCm/8uf586t4
 5lUAjPGmIALcuTdO98SVBr+qxxTGMIpa5lDQkPtSWq4TkjZspcm3abxjM3kMf/KZjEia
 AJNHBIQbbljkuunCzs+boZiM+lnrT9uzPXAoSyogVBa1imn+Sv2y8GL5J59F6A+NS3ps
 cx6g==
X-Gm-Message-State: AOAM530DPBm7i5w3Tv6+Dhyns+ueaB74tEUVpKmj6Tu2i6mVpZoInbb8
 oSVCeuCyYGIX4FukmmMgloNPooO6+8sQpaUpVz9+iw==
X-Google-Smtp-Source: ABdhPJz4sT4HTIASRu0q2t8NdjaqXI6ESVvlLRb0xkzVD7J1pd9jPoZvaxTYZ/B5e777xfunN9Qvkpz/1DYXmfkKJTY=
X-Received: by 2002:a05:6830:23a7:: with SMTP id
 m7mr14536006ots.17.1627370471381; 
 Tue, 27 Jul 2021 00:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210727040021.21371-1-Kuan-Ying.Lee@mediatek.com>
 <20210727040021.21371-3-Kuan-Ying.Lee@mediatek.com>
In-Reply-To: <20210727040021.21371-3-Kuan-Ying.Lee@mediatek.com>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jul 2021 09:20:59 +0200
Message-ID: <CANpmjNNOkCspsf4=gPLLw=29vtv4qEDaErB1i1sz-p+bzLxNKg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kasan, mm: reset tag for hex dump address
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: Nicholas Tang <nicholas.tang@mediatek.com>,
 Andrew Yang <andrew.yang@mediatek.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>, 
 Andrew Morton <akpm@linux-foundation.org>, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_002112_993064_7AF76064 
X-CRM114-Status: GOOD (  23.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 27 Jul 2021 at 06:00, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com> wrote:
>
> Text is a string. We need to move this kasan_reset_tag()
> to address but text.
>
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>

This patch also makes sense (I think), thanks for sending. But it's
unclear what the problem is. The fact that when the address is printed
it still includes the tag? Or a false positive?
It'd be good to clarify in the commit message.

Here I'd also use a more descriptive patch title, something like
"kasan, slub: reset tag when printing address".

Also, I think this patch requires a:

  Fixes: aa1ef4d7b3f6 ("kasan, mm: reset tags when accessing metadata")

So that stable kernels can pick this up if appropriate.

> ---
>  mm/slub.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/slub.c b/mm/slub.c
> index 6dad2b6fda6f..d20674f839ba 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -576,8 +576,8 @@ static void print_section(char *level, char *text, u8 *addr,
>                           unsigned int length)
>  {
>         metadata_access_enable();
> -       print_hex_dump(level, kasan_reset_tag(text), DUMP_PREFIX_ADDRESS,
> -                       16, 1, addr, length, 1);
> +       print_hex_dump(level, text, DUMP_PREFIX_ADDRESS,
> +                       16, 1, kasan_reset_tag((void *)addr), length, 1);
>         metadata_access_disable();
>  }
>
> --
> 2.18.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/20210727040021.21371-3-Kuan-Ying.Lee%40mediatek.com.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
