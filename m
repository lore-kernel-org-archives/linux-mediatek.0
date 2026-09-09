Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1358AC79FAD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2026 08:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+AMEHPfgfNjqHmUbcG8IHBJQwLJWm0A6vsCsHD9A7Q=; b=2GWxs9ZvXp3bokEErIdi+COA81
	0U88ikRVZ+LjmUKxjRLwn9copDRbNboJDYmr58ToqdISe/p4UnVdaajzu24siaSGhrbmY3SbnIihl
	XOM8SeA7DfH94+xE8xd8Bf474wurkDKYvoOxVRnXcU2Zu8dD7Ot4E+f26PeGA4i7O7xIojl/c6175
	8+uI84Opi4egNU3icWoozkYwJX6k2KsGzwYlx/V4ymJyQo/bqHPaZc5ePsdnOvmcYf/Ukx4jMrK8p
	kKKky8SrW0ZYiIupVf7oHhbfRq9YyQ0NwCHGNwyyieblEkBlvzWLGm32yyEfuCRLctgm0wx8MLzqS
	fcfrNYfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DUL-0000000B4sq-302f;
	Wed, 09 Sep 2026 08:17:01 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DUJ-0000000B4sJ-3Q3q
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Sep 2026 08:17:00 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-476ef1870a1so1873597fac.0
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2026 01:16:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788941818; cv=none;
        d=google.com; s=arc-20260327;
        b=qQ1OYs2EK4Uk0+HZOxbCvBoZKSwjDim4HX3dD3/eBRFtiKYjbuK6XqZbW/vn3H3Ods
         P4txhlDs+0NJK61ag7+6E/1jk15+7AUfSwigC9w8gAHtpYHuNx6F3T+gPQdMUO/GMey4
         Twbr3J/eivu0GLWs30Hp2PmN7r8pYft2T90C+m7fycHunPswx7PvfC2Xh8xfnigswWJA
         kpSicGv1cLmUANYr1fIQFO2O7M+HrxIPWgdbwZyeqDIhKqACQjJsQ+17nhluTqU+uwGV
         D8UfIDFnzh/mB8GlXfmvhcZO0x15KMsqvG7EkctGYeGPskLSkLviVDWK+uzZLPfYU+li
         paRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q+AMEHPfgfNjqHmUbcG8IHBJQwLJWm0A6vsCsHD9A7Q=;
        fh=q7s+UcEKhc9ADpBmVDklq2sgv7C9LZT/iLTCcnJ86Jo=;
        b=Ip3nyQ6/YbebJQ5mGYCqdwgOR/egBX+GnzZ7/NGUWIy8i9U6tNdX+Ff1nP7ZWTV8VL
         c1Y2n9Vn62XlligzXAFV3Kr0NgrkqITWcFQ82KPY1CGEkiNYJyvt/uKFpOe+mbEYWFYZ
         hms/pNKQRXPOVOYAt8QCE9cSisu3FnZGK8Wh2t1AdRM0LNFcS0hzqZcElhrq1jxydhZv
         yhsyqVUIPw5/+DiAdVTaMvg6PL88xiS6Cp5AUhJ3JO88BhKoq7bE8WFnA1uk/T0dMPU2
         UjXHxRQ/5ujtLeuRGH9vB1QZ6kMf048Zi91ygYkLpRAA1rmQvp3vTPKIyi0NJfMBB8xk
         nx7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941818; x=1789546618; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+AMEHPfgfNjqHmUbcG8IHBJQwLJWm0A6vsCsHD9A7Q=;
        b=LHXOLWqnxoLmligs6eJ5aP+omVbYObj8tdihgsXX6N14xdeGAv/VqZ1thQm0ac+cDr
         vwAuCAC/sA8qD2ww6VO6pBsTf6GuUl9ciFqSW1MF6GhSKq88tgJu656fEo7iUyUFOfO6
         pwpHd+JRuOrMdXSRvMYUySkFv/FcGJY0CZ0sAPZ5WQ5/muamKZ6Ma7zGZV1OcGO0u+W0
         SXSNkl5Qu2YF4iZKprREbINYQTzfEIQkjJqMO0Fgx+GpV6KHXTr/U7DDLcjGkzkm6edG
         y2ibWtYyRoy1jMLLo8ZtOI00vyjGSZthJIlgQxA7UJl0nOd+IJV86C+8nl97epBtbzJD
         cvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941818; x=1789546618;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q+AMEHPfgfNjqHmUbcG8IHBJQwLJWm0A6vsCsHD9A7Q=;
        b=qSHhQ+1PQ1wt88LHj7mf38fW26Xme6pXuw17pVZvgrs2+mEbVysAL3/6N4WhwhjZYN
         9sZBNc82iY/YEw7H0SbWs64SJZ/hC+hvFUs4YQwAB0SV9ZpkdQleODbfSquYQUkOZyBN
         bKbzJT80cIfFW8VQnZNzTwTt9Qu1QGZQu0hMARMDbB8kTTbXxIq5U0wNe9y9s37Xj9oF
         1o/AyfLsJtgqwcHN0t74nsuuj3q1HyvL1liSxRX0A4ifAtjqNgfXK90iSmmpLFR5+3Ul
         4GOHjhWVLxqQNZ1S50MHN8W+wxzoxuRmhkj992KyW8JLliweSqA0+xs8tm06sJ22tpwi
         tu2A==
X-Forwarded-Encrypted: i=1; AKwUvBwS826VafxO/pa+oPVVDqEGCzMl7PoyIZ3Tw5ubU3lKcx7NTlATuGKE0OrE/ihuMBBxgFq9AGCMAJRtURnzfg==@lists.infradead.org
X-Gm-Message-State: AFuF++mXX/yEVArvfLsKkaH0NVjDxvzZDs7XK3GTF7KRs2HQnuiaQ8qc
	7CJzvEqnd2iiDkFj4RQzL7jUtzSBTu3ULhLq3lFwvyN5jAFNmVeTxKXKKrh2tjYpnzHHGXOU8UV
	pJqXauAva61K0W4vlDLxLnjZqlfBKZcc=
X-Gm-Gg: AYBFou03ILBr2gj37H4gh7Ujx/6XZ92fm0EpqexzdVCFfqftowrgIrmkL236ZXw0poB
	bV/PtWS+MEZgklFA/6LsHIeTQs5dIlszo/43ESlx408J0bf1FKpr8Wuj0kXCawKrh7emzHzNCD/
	96bzOX36PfyFFfWzrUjpEc4W2gdHcrkDcofziAaFxzCUoB0yNcoeGjAHiOF6rnoDC5EhSCUjeHE
	29k+HcGMAudqHNU+n2Zg5Z+6fdwVN9fleIFIzn5UN1izfDzDtTTmMWTiqNWq9CgPMs0Rs78I6YQ
	kDYZ9DgOEldhXygw5lxYxo5FJnymYm1kDqjoywDhx7D7GLKf/sVxJw==
X-Received: by 2002:a05:687c:418e:20b0:456:bebb:a894 with SMTP id
 586e51a60fabf-47801f0fcfcmr13266895fac.8.1788941817673; Wed, 09 Sep 2026
 01:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260828150227.1062217-1-khurana.ridham222@gmail.com>
In-Reply-To: <20260828150227.1062217-1-khurana.ridham222@gmail.com>
From: Ridham Khurana <khurana.ridham222@gmail.com>
Date: Wed, 9 Sep 2026 13:46:46 +0530
X-Gm-Features: AcwNN1WCK5pqFslicnAE2Tiwfm5AldxOvhq7qzmoOZmdii5H4B6WhszyAfNnHIA
Message-ID: <CAOu+XQJjYeeRUc+9rj1ckLQ6+UcEtFJzM9Pv_8-v8t+_qbKVVQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7915: validate default EEPROM firmware size
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Jori Koolstra <jkoolstra@xs4all.nl>, Brigham Campbell <me@brighamcampbell.com>, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_011659_859331_49826935 
X-CRM114-Status: UNSURE (   8.72  )
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

Hi,

I sent this patch on 2026-08-28, during the 7.3 merge window, so it may
well have got lost in the noise.

Do you have any feedback for me?  Is there anything I should change, or
would you prefer a v2 rebased on the current tree?

Thanks,
Ridham Khurana

