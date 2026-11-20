Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD54F606A331
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 13:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t+fVTk9e;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g0msNf60
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GyVRv/CGnOjgyJQ3q5z4bGXS+biNZU7h7VocVSVeF0Y=; b=t+fVTk9eosFAxS
	Juogw4mQEw5gTTQt4gFEhjFo+qiVQcLy2SLe+IT0EVpfM4Tdm6nE4D9u4KqRKZejH6O0jvWNfl3eJ
	STM2mea5IMN0Jb87F+8Vs3tquaoV3Ph1sw54dR2dyfby+GlEacivdixB4vuIU7cJAwTCe1L+gwkED
	zXpssixZihQWK65x8Xgs+O7ZUL9H1/XIIXtz46JsTW1OxtaWNX+W8f7MFZwq/q7J9mmxPMRBirkR1
	l1om2Q+PxjQX1KyXk7CVOUcOLCvmhK/oO68N5/un3ICSROaE9XgeAoGAofZiW3D2BPUmXzv3WYGT6
	86IVYfJ9KXXACMAGVVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUP9K-0000000FCVa-0yfY;
	Fri, 20 Nov 2026 13:59:34 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUP9H-0000000FCV9-2uqN
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 13:59:32 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-4bd734cf350so332926fac.1
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2026 05:59:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795183170; cv=none;
        d=google.com; s=arc-20260327;
        b=UZ4OIcgEjHgFVTiXv8ljYKCOMJNjYOVQJKq8aFp/DRr3dPIl1k1YJWk1N1LNbQxbE5
         T9EtudFYsu26CgaY1YP2VmgYOkU/gprJRFC8FrFfx8A2afD0Nt9cGPegQISNzrwonaVi
         RiP7O7LCdg+hQgMpVOBSjTgqHiIUj0K2K5L+f9oHNxYaDxZul23FsXGw3yC3CTPRK0Q0
         vYJpq/enocJuOoL+gv1ztBLwPcG0mq4U3Dxgs5tcvPmzfegJU1j865d5g+q6nCOXJ2Hi
         YpLpO7qsh2pWJJ/qyGNeD4lxkXi5jlBHwuX9FGx40PIpgqNkHVNIqoZJ8dlC3yutO9F6
         DQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GyVRv/CGnOjgyJQ3q5z4bGXS+biNZU7h7VocVSVeF0Y=;
        fh=xzfnXe2zWBTSc2v1gbaHp0qqa4I8qWGv+mmrrbq//E0=;
        b=rMiUlDWKjGYBKyd8ZCwJDwz56gv/XYe/8aaqJP7TC/xrQflTMeOPYm+k+W+yMrQkCp
         1Cw/+1x2jDFSGv871VVasIqy1Gj7YdmjU7oj6Bis3uGRH2qtFtqsInRbr+Q6xYYPzOeK
         RHWnjZx7Ey5jGIKpus65sBMLLpZmMzNZQecHw8kyqu4L72QQZyyPezkEhAXoLR4NrTPM
         sM9K0NtFD7qQKVaOIMnPUbIIxmJsVwc9Y+pVzxsi86paK1ANF/WBqgSfE4YMt2H7E69w
         NODmH7/kHbnzd2ZYbt/w2MWLTr8itUJmXsagwxiv1Femm870rY3XTgOQuddEoqVssiLf
         Bt1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795183170; x=1795787970; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GyVRv/CGnOjgyJQ3q5z4bGXS+biNZU7h7VocVSVeF0Y=;
        b=g0msNf60G2kDlppxBWtJqfKneRY3ZxnkqYDpvI4SovfM8vf+HfmkQsumw7WTTCNdoL
         oKcX+xMdmAmiK1todJ3b7waEvUVx7HhUykbLAMAeJ7AbdTQrBPtmHWA7voHhZsLU0bJE
         ZnF3mDeQflyPxKTkBNm8H7fi3zJahcrJSPLJEAo3O5iIaGNWnclPTohhgpC2+QxHgX9h
         4tI4cseJOGF0Oy3O2LZLxj0Go4knMgu1eoY50lAd0/JkqAtPw37hJpAenJiYVLKYCfqQ
         CjxAVfzLWy/JRuLKemopHMtSmW+9HU/pc9LHE9LXECe8lDq6aQW4Sfu3pQxwyoCD2xZ1
         rxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795183170; x=1795787970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyVRv/CGnOjgyJQ3q5z4bGXS+biNZU7h7VocVSVeF0Y=;
        b=YHYbdwbPatkabay02Mn/2g60gGsbDdEnmgx/tD+zA4GH3/3m4SQKujP7ugUUUmugjm
         XgAqmYJGJtQkxQndbe60l92wVhlJfBjudwDg6hUbyU0IQNouaYCRMIGs9Mw92W685VSc
         MLfhyH6HGHWoU41LDJlX2Fm74kvFC9rhV3/VtXAp9bERwqjeCHbGhExLcy9/WpyTWixu
         4IfluLnCO+xdcRlUTHNGftTo10ysIi2qsMTqpfGOq+1OxY+b8LLcv8lkEfyK4+C9OeyQ
         lNm8WnQfZFxftwm51CDsejzG7x/QLphWVCd0en5bpSAGMe+1f51raQsP3a/xKcX8SYC4
         y0KQ==
X-Forwarded-Encrypted: i=1; AL+hErGmMDyg6DJZVMzTDuJxFkIJi7RxMmEs9pCM01X15hB4a55tlyCLl2AVdl0lv9oGsTvhPmdroe7KqWtRE8tMMg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+yq+xz4BUM/zrQ43l209Rdhk1h5nIihu1OR5SXPAjvgOKvVlbB
	jH0OiUFDfhvUanI4Lftu1O4szG1Zo+vjLx5GYe/9cfYmwr9JgLe9OyzEIrp/7yBUFMPQXm558P6
	AyRlfaNvTGY6VwkR4g/faMD6G8c2i5n2+8Hpk8+Y=
X-Gm-Gg: AZFdTZflYYUx/LsLY7JzToMReDTW8zs8433PE6FwonoL37TrLkd6amdTTCf6d3OtSjf
	IPHkYW4PwdWDw6JEeayjuJdq4ruCsxd5xeGjeTKjIW4tNBsUreiKruwnUINOCuauHt8FWVPFAA/
	2d5CYclvaFDg5V+bs6piAK1qRniuN7sdoFFFtqVQHwK5DSXb6xMdT3bAcQNzYZn8JzQVczdIMgq
	TqNoHzD7ZGJcfJlvCwZjyvy3WhrRmdEetaNmPuQCNPmnzuf/cqDHaxQo8MZfA0ZU01Z9Q9s7R3x
	39mOgSKGQQa9FBCDuQW+e4M5ieCh695o4nRn/PNTSxjg872JOhpG0h/e7Oe8f8Tq0TRNIRCuY3Q
	iZ65r1KdV895nXxdrWtI/OLYpoSr0Gp5mxzBkYDY=
X-Received: by 2002:a05:6808:16a7:b0:4f3:890b:5fee with SMTP id
 5614622812f47-57a0a4053acmr3862923b6e.16.1795183169924; Fri, 20 Nov 2026
 05:59:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023175710.19181-1-vikrantyadav4802@gmail.com> <CAD++jL=0E8+H9A6M4r=+_P5Q6BDyL9J0A6DDZborrMt0ioAZkA@mail.gmail.com>
In-Reply-To: <CAD++jL=0E8+H9A6M4r=+_P5Q6BDyL9J0A6DDZborrMt0ioAZkA@mail.gmail.com>
From: Vikrant Yadav <vikrantyadav4802@gmail.com>
Date: Fri, 20 Nov 2026 19:28:50 +0530
X-Gm-Features: Aa3M54psM_pWxs9m_9RKrfNWpbmCodZhUW7rZuVIdUL71nTkadvLxIio0x3fNP4
Message-ID: <CAHjiWjLdHxkq=1wxM-ai5fOkNW5r1GuvEnFwhAS=y5h4O2q+Fg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: fix bias readback in airoha_pinconf_get()
To: Linus Walleij <linusw@kernel.org>
Cc: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>, lorenzo@kernel.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_055931_741172_9AD63BFF 
X-CRM114-Status: GOOD (  14.63  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 4 Nov 2026 at 18:58, Linus Walleij <linusw@kernel.org> wrote:
>
> On Fri, Oct 23, 2026 at 7:57=E2=80=AFPM Vikrant Yadav
> <vikrantyadav4802@gmail.com> wrote:
>
> > In airoha_pinconf_get(), the last branch of bias check
> > "else if (pull_up || pull_down)", has no check on the requested
> > parameter. It was meant to reject PIN_CONFIG_BIAS_DISABLE when a pull
> > is enabled, but it also runs for PIN_CONFIG_BIAS_PULL_UP and
> > PIN_CONFIG_BIAS_PULL_DOWN. When the pin really has that pull set, the
> > earlier PULL_UP/PULL_DOWN checks do not reject it, so the execution
> > reaches this branch, which returns -EINVAL. Reading back a pull-up or
> > pull-down therefore always fails.
> >
> > Signed-off-by: Vikrant Yadav <vikrantyadav4802@gmail.com>
>
> Maybe Christian can ACK this patch if it looks right?
>
> Yours,
> Linus Walleij

Hi Christian,

Just checking if you got a chance to look at this patch. If you want
any changes, I can send a v2.

Thanks,
Vikrant

