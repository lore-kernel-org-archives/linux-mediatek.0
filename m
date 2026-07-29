Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83038C53219
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 04:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uA7NG5Dfr4VakgJXB94YnH6+2nDpY+bBSoINVwagc6U=; b=z8HFxWzVe6qxOANVBtZPAztttW
	gTclkhG+Rw/XpPSsZVGyUnlVQpvTxuS0CZvyHgOE5ZPAdERYqQVBKIiNKuV5Zq3zbuzfuWEogu3gX
	tnJzi9XowfZPKrO1pJYK/bf9UiaubO6FVPSpHskcHxhIW2jeml/YCtCq+uLLrHPPdomWPyN3kgWIz
	od+ZRMxORMugLpbJU/c5lUd61afdwngT7fBEDJP2ytZ356Un+kGeeA33UsOYCFbHr8XfgQixtLldZ
	DoXTTsBLma/+QjFrvGydXw5bgS/IFgjCQbc9nVCABd/vVAoWRS6S9vbTQWHcQTcyCI49QEo40ldLc
	9QAGAlbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wow6P-00000006rUG-1NnP;
	Wed, 29 Jul 2026 04:41:09 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wow6M-00000006rTH-1zev
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jul 2026 04:41:07 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-66807ba2f0fso600795d50.3
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 21:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785300065; cv=none;
        d=google.com; s=arc-20260327;
        b=kkNrBQURaamOYFnl9INdjy4sl3rqc1+u6p6GtZO0Pnqz8tblj4l7MKmMeqXmDYfluF
         jfwSzycV2OFHmzFwDwRxBztJBtB5djbkO3/vwM781SCRuLRe1NAFfM3p+Y6WWNAPtcEQ
         eJi+QlV3iPvKM+mURsgG3c9BqaVzmmAwmCHTjgC7kG0veFcjlpRIL2c1Qz5p4Zx97viS
         vx2IUdKWbWXzYfNXgCTgAV5QUPi/GsLyPLC4HETlSpr3UHGG7pq4ymJxnCs6iSYuHpIz
         0bf2khorOWxeqHwEEf206yRgjRcrOwvQ71LPAkIsek0ErDc0aU8m9Izxd8hQCoJ6PcMT
         j09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uA7NG5Dfr4VakgJXB94YnH6+2nDpY+bBSoINVwagc6U=;
        fh=Yt31IliU2ZHCZCdzOBiA+CavM6Wp7Y/Kp4xHuKei5Ac=;
        b=cUrto7OmLLQnBTxIuPsdefHl62LehSSPqLlkw3CoeW4BI2EegvYhBpFXnuDcg56Ufo
         q+4/HDw06NlHE8LcNQ37VylIQD9Y0+GMidD5oQYZIT8BQs9fBJfDSkbZLi9aXVqm9btJ
         ZPI9vGVNPH3ES+uKsw4/CPLSWHSs/OBjHRiTy5SrPBX20iUuNGqqj8dAeaIYzpL0mjrL
         ayuTFgeF0fP78w6Zm8aZvM2A9SXY3ZIOK1GBxi6bSTDHAVBY7g0H87slXEsE4wK+EVav
         i9XHj+Y49yJk0DSIEfp2qNotW/OkLKBg9H8+RxikiR0O4w6kvdB6e9rerGaS8hrC7OSD
         OCTA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785300065; x=1785904865; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uA7NG5Dfr4VakgJXB94YnH6+2nDpY+bBSoINVwagc6U=;
        b=ZNCAn45yDe903ya4dZXdeHAkTl/H2xkqvkbsvJUQexbp8WOWVT+iB29ee1dWLK7YY3
         aDsBwRulYdCCqk+qS90WCBLJitXgY2thYxFsgvOAoE/dp4Lqor56p1YSKqq4qnT6VG3L
         XgLMxBWY8GOTIGLPrKqR1WUjkED3scU9AXq7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785300065; x=1785904865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uA7NG5Dfr4VakgJXB94YnH6+2nDpY+bBSoINVwagc6U=;
        b=R93q8qSu7dSja6Jv31n4Ro3DX/eK95P7UZm0fb/nFmbauiAgcKMaNmS+CP7cu9jJEQ
         7KYsOmUOtiHhxb0jnlB9U2jGmyh3O7FGWjsMxCyyp+fibuoOeE293dgLeYjAjedvfsH7
         2AD28BIOYqU0m3Hi3IwHQjcRlBCeaHXLryj7bmtWIkBdYvEljd9pYFucGFXKB3MzJhEh
         R3PPWj9yqvr1PFWJsMr+ReaJFmv3uAA8u9bLTW0ezk7wZ35H1LAqwOCMSBKxufXLqa7d
         iRV2CbCeLJka9xIZuH3CRcI5IpKo+LiQG+OapiE1pEynSIxZZgjZW0vWIs9ZMV56+hy/
         g6Hg==
X-Forwarded-Encrypted: i=1; AHgh+RoFlHAnC/DgkZFvLcy1SEkOcMxXkvE2vbiq6G9rkBKg5astczvyss9sqsT40D8qffI8anCcgGbLf8CYUWC5RQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtHtDVXYoeuhuNmuF9BLfJXTaO0lAAe7G2q6y+Jmyq8Mp7yI/C
	ED8oT13wv4wTmLntvgIvCon3Pi4CBe9S5Jl5swAXWgfN84By3kvxn+xEefwx103fNwMK4fu8pJm
	j6rsUqONOH8QILHSzmjbTdepy2sBPTWmRs17GgAZV
X-Gm-Gg: AR+sD10LaP+arVyZPzbv4HzVn2qwChrwZKlAx1ZBrrJUJyqE3c+JT/FZVb6Ldshs5Z+
	dJuXMg9L3NsaIlQxu7+c1ClgcrHlu8lF2DMODdc8jqwPxQgpgzFYdhgQfBC85EXl7Q1PlQlUW19
	ChYB+KAU9wo/DeEPOviDw7UTfx+CBuVutfjCbQPZ/vNZl3AtdlN43kIxBkvVZ2tWf+goxspbF8G
	lWEJCfYst57jjJBDHBJiww7FJQDO6HQWCVP4HhsJhd6/B8HJdrSvnwvZvmlWROgI42lq5LYJ85e
	HUErkRvqf+uOHH9Zxu8LftW7cyhhwOr8PP6jjCNTgOQ+yNRQvzfLS4VwdNGG8UU6gfdyHcO7I2U
	=
X-Received: by 2002:a05:690c:4c0c:b0:7ea:809c:2af5 with SMTP id
 00721157ae682-81f9935399dmr26755907b3.37.1785300065323; Tue, 28 Jul 2026
 21:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260728212438.54078-1-rosenp@gmail.com> <20260728212438.54078-2-rosenp@gmail.com>
In-Reply-To: <20260728212438.54078-2-rosenp@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Jul 2026 12:40:54 +0800
X-Gm-Features: AUfX_mycg9wolGjQePESF--FJZRN09rHxCnfAnS_fOgAk4-5gb4BJmW1LYVjLVA
Message-ID: <CAGXv+5GfUGRsGkRAWyX+GnJC8GOREqgkXeN4sVxE4+Y01PG+hQ@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] Input: mtk-pmic-keys: use of_device_get_match_data()
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_214106_728818_A0729FD6 
X-CRM114-Status: UNSURE (   8.82  )
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

On Wed, Jul 29, 2026 at 5:24=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Instead of open coding it, use the proper function.
>
> All entries have a corresponding data entry so a NULL check is not
> applied here.
>
> Remove of_device.h as a result.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

