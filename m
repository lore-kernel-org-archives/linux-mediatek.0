Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4E6C88E56
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2026 19:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=; b=jvbmsr21Jv4VqSHK9s1QCT6fl6
	2i816A8KJiNxAn9b/qHGSWQI+u3m6oSERI8zHhLObdWRvT4rcVJM4G+KqYA0ZA6yVd5+kk8uCqhSY
	0se46cZIcysk3LB2Fq+Sg4/6CcpqepKHEVzvzTEJkzGzTxHkgmnaH3eWSxG7EPTK77AIXQzxksFyc
	cgFVwuyGQ7T99ZBLX11GgRZxn1mqkimwJyNFZFAv37N6Sw6z9jF6Lj1w7eqLsbKCzah1WuT7nE37j
	zARJQXOnbYjqLsrEKlbRMC43Kw6DUrbJFRHgFrmsBq1lOcz1SyWnKSucwsd7o1bRd6VcvYtmXpt/d
	nFM6nnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T4x-000000015Uf-3BY0;
	Sat, 12 Sep 2026 19:07:59 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T4u-000000015Ty-2w9D
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Sep 2026 19:07:57 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-857ff9fef54so16191907b3.1
        for <linux-mediatek@lists.infradead.org>; Sat, 12 Sep 2026 12:07:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789240075; cv=none;
        d=google.com; s=arc-20260327;
        b=YXqkNK/v1BwOYa/Jdkh4i/2BNcsjPVSEq6N+wPCsCOo4Xt2TTfDNElh+v3Xm3xDs+R
         PD2Sop9wgkCkn6PYIQvW5XG1ykZ4+rZ1XzMKLwsM5cV8i+BKKqsQLJkShOc3Lq+avC4Q
         3ki1O0uPfxKkdaN9dlbq8Uzl1ZrRB78XhQKIqmdCtIfXKFOSXdfxNbLnu9lFpyJ9An0Y
         FWxLXAFoo65IT34ACWDzsqZcCtH/aL2Tlk1S4hy2NU2YESO0Yvse+60VQewDsAld0SY9
         78Oa2yPUlmyF+kVOi+wPSZhxtSv2PejotvGlXHqO/IuGf1skp5il0MG6G6LcvsUpXeNn
         pDcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        fh=zU3tIbCcjEari7OT1WcGlUKIZSbFaOjT+1CLD5B3kiQ=;
        b=F+JDCFQBOnwu6HN8UOIyInQdNYMF2/Gc6GCpP98nCfak3ub1cDX5+qow5zX3gKTBTs
         mNjHR0PTso3o53E47ej1h8Gl6/9FCPxdtWbACdmhOyZpm4YP0VxpgnBIHKpMipW+dhay
         UTfZZctMcM3EuzK2OcCBlPnUOAoNbkVCuqqGUvHcW4ytZ+Y6GvYIBgoIu5J0iiyjU90z
         8p1416YIM5x3yF+PeOy9xYjWZbR2oIJvOsAUjtO0ztXWU4k7dQJlJQiRollba1wZi8XX
         s+0AQ/Qt2aH2CqQmqOkT/ZGc8VoXiMvDqu8aqqdf6ybBPTjNdq0PJoobYYN6SgiM90Jy
         jbZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240075; x=1789844875; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        b=hLdi3uB7/ngvwNIWqlhNJrGsXwAhdMTW/S2nTzMLw17pt84Qu+YAtlG1j9fQuLXjv4
         +nw2e5wBis4K91nbsCyJQC7Mv9f3eRpRwWyETrYFnpbtUSkTionIlkkGSGzuCoRFsNie
         0BMpCwoHcFJgDDdDB5AUy4mwMNowhNnFFIiQcmwRC67TfLAGqmeN2yk4vG6qDATYzOtC
         8Gd5aQyT6rpaUPgetc7G4FgaloSl4sOI+VoAzX97icMYTsVR0f73MEXYQFyZTlw4NfVJ
         VDfRlzKiTNLA0ETk1QfGdWZkL25BKwcIFDbwhPRQULGplwQ+HIJA84MSd48F2UqvEl4y
         UUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240075; x=1789844875;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        b=Ipq356EN5g7QIAi/6gBcJPx5ocYhL62QKGJAX7ONJYdfsl+eGpyoth0dUJzo9XocGT
         qP7dUQV3ZgepQ9NGyraRJ3yA9ocvws72ZfN5tWOivD3/XHau9+zMo2AJSqZfNs/2Ohvh
         9qD/QM4tHelmCugBQppuXD2AVleeJDLkvsXu8RF95w93k0XfI5aLMN0SJSkdrFSofXIH
         ITp+RfztqVcsXib5isjsB01bCIvFOBgDylKf/7bAEmLFzTU4K6NmM/JnfakkqfvcQRT8
         FbfZOKPVyxg1tLxHQ252bfeEnXIZgrK4R4CZkePzJaeY4wcrfGC91c2D2lfRFEuMY+mN
         KPDA==
X-Forwarded-Encrypted: i=1; AKwUvBx4iG5U5O1dxBOpQqvL/4NWb5a6YW1p9WktZq7HOQoqwLXBpuLIlyii/pctcXfGA3RDeKdF2fQPWBXBHPpY6g==@lists.infradead.org
X-Gm-Message-State: AFuF++nM61x6idxHW40C0G52Zeexz689sCXAWNdM05NxBJOjtW3d0Fm3
	Y/CwLJfUUzpoB93/OL5wjT/EaFKYtAwJyzojbK/NmlSfRZgtSx61RmrnuToyYutJyT6X084GC+C
	unQg6MmNZ8zIX79ELta5Lm4ttrp7UyYA=
X-Gm-Gg: AYBFou1SOCIkC03qTgSqWN0GMRqNJq+FEgWjklZzNNGazkcyddm3Ja/5/89i83WbE+u
	eU+FQlELj+DEKlT7ZSOD4/AzXqP7J8uL73cFDBK3bpmWRwJxjfEzP7cOUy0O6909I8mjLVY0JYB
	KfhujMgEXLWEzVk4sKyVzgAgGE+fSTB4tQIyIYyaVWLFIxC1JSd1dB7GKso8q59tQetkIdYOOjM
	6zjy6qScIDIvpDt1Qrx80JFmJFolcMMEFkKGPolx1fs+aDYu0031oqe8UvirhTQ2v0bwZVJqyY1
	WEEdPmCFcU8AvezW9p5rDNzIrQM/B0FG0EAecjk5tafcdZ/T59JL
X-Received: by 2002:a05:690c:a790:b0:873:5bb2:6c0a with SMTP id
 00721157ae682-884b6f29b6bmr21177167b3.52.1789240070580; Sat, 12 Sep 2026
 12:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260906061755.5103-1-sumeet4linux@gmail.com> <20260906061755.5103-5-sumeet4linux@gmail.com>
 <98a0dbf7-9724-4ccc-8810-645dfe715656@kernel.org>
In-Reply-To: <98a0dbf7-9724-4ccc-8810-645dfe715656@kernel.org>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Sun, 13 Sep 2026 00:37:38 +0530
X-Gm-Features: AcwNN1XqTP8GoNHaMkR4dokovXZ0UiUGTDkYaF2EyUFt2qLbm2siHwKKSL9BVhQ
Message-ID: <CAJ9orWStxJLN-0Dk2LqmyxEagC_nH-veS7wWrN_kXvb6WEUWiw@mail.gmail.com>
Subject: Re: [PATCH 4/5] devfreq: Use %pe to print error pointers symbolically
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: rafael@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org, 
	thara.gopinath@gmail.com, talel@amazon.com, hayashi.kunihiko@socionext.com, 
	mhiramat@kernel.org, mmayer@broadcom.com, viresh.kumar@linaro.org, 
	sumitg@nvidia.com, peter.griffin@linaro.org, myungjoo.ham@samsung.com, 
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_120756_741628_E0BCA1DA 
X-CRM114-Status: GOOD (  10.35  )
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

On Sun, Sep 6, 2026 at 12:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 06/09/2026 08:17, Sumeet Pawnikar wrote:
> >               ret =3D -EPROBE_DEFER;
> > -             dev_err(dev, "failed to add devfreq device: %ld\n",
> > -                     PTR_ERR(drv->devfreq));
> > +             dev_err(dev, "failed to add devfreq device: %pe\n",
> > +                     drv->devfreq);
>
> Instead you should use dev_err_probe and drop the last argument.
>
Sure. I'll do this suggested usage of dev_err_probe in different patch
series for *_probe() functions update.

Planning to post V2 for this original series to use %pe to print the
error pointers symbolically, reverting the change for dev_err under
*_porbe() function.

Thanks,
Sumeet.

>
> Best regards,
> Krzysztof

