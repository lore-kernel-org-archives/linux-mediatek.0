Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE3460A2625
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 18:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qbBiJ3e2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LOn77Q1Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=52NDmUlT/C1NnGu+Dq/AZOz+hWzBvu1Wfp+thafpfXc=; b=qbBiJ3e2YOz1Yf
	+uyhahZnHRKf22ubuA2r/+ZKLzsiko4ZQ14P6XrxmR0ioLmrRSBXmCQaTP397ictHUGRCm8b+jsRX
	AN6QT59Xb+nVxQA1oypbQT7NexxDIB12SiJWUcPP3cekHNhWdc6EW8reHvxNBLk/wvLnI88bKrsE6
	RLwFHSB+ePgNFJKQFeLTcgtdHExzldDlSLjpd61OiZSHf//29XXafGD11PwEWB6tRWxgYg3RZf0GJ
	IzWhyHnvn3lZS2JAXIbn6bT/7Ysd2nQZrXSfFtVmLJcp8gPSgBrcNTVPKaBXePl+/S3spMHvy/A71
	2qN/X2VlKblZDbyNhPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqzY-00000004qwT-08pR;
	Tue, 10 Nov 2026 18:54:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqzW-00000004qvw-1VQu
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 18:54:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 23CE6472A2
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 18:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AEF1F008A1
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 18:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794336886;
	bh=52NDmUlT/C1NnGu+Dq/AZOz+hWzBvu1Wfp+thafpfXc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LOn77Q1Q4FdQNPQHTCyBLDRVJc2OVxlu3IQSi3abYY96Yq71PSG7F/TEVoy/NyWzb
	 6ZZ8JMgypJzK/cI+aPJQtG8QxRq27xYLoUexcHQhssamVujEko5pL2j8l9Xk5r1UDF
	 fg6EMW/hpUVwdlWj7P/7r/PpqnxM7CCUEq2B3KCS3fXmKrU0AeKB0kcNol6YvVtkWD
	 EFe51t8kzprPyw9dxOkb+SBmRlpAFlmtMn1G2VVZLzW8IioMKG9Lg58zzRg3ECHbNw
	 U2ea60g7BU9XProPMSBPhJSPrIB34HlnYgmh7yz/2ywg+yhLuIaLkQP2PocVVzj3fq
	 vxNvvUWxQIgJg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3accd1ff4c3so18424611fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2026 10:54:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH1//POfln74b0KR/3P3Shh8+BVTfcFavmaGOJKhY1af5lXMEQLZ5lOsH9+8w/eZfNsGNox4MJa98sWBqS4HQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9xPxs8ncg+zD5MQV9LNFkR7wPcTsyU3AQVcHLfNsY0dxyeVUGe
	RQdtzWVFcxJ5yiG/hxcEaS+YsLSbH+owBQysGLrskvaiVnRXvgcd5TaT7yEWoSm2fWelpSZOSxr
	DA2wG0YXomoI2N5iSsVYSB8Qqbi6bN6U=
X-Received: by 2002:a05:651c:1606:b0:3ac:4da3:864f with SMTP id
 38308e7fff4ca-3ae0961bddcmr8184521fa.4.1794336884424; Tue, 10 Nov 2026
 10:54:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110135814.621355-1-zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261110135814.621355-1-zhongqiu.han@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 10 Nov 2026 19:54:32 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hHLdd0X-r7HG24TrALGccHNZ37JUyeu=rHg9-6YAR7gQ@mail.gmail.com>
X-Gm-Features: AclHuK9AWEuL5vf0QrXIUa41RCa4KBaWPSXD-wUP0068_a0rEgmBvhB9KueRF5I
Message-ID: <CAJZ5v0hHLdd0X-r7HG24TrALGccHNZ37JUyeu=rHg9-6YAR7gQ@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: Skip inactive policies in cpufreq_driver_target()
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-sh.cheng@mediatek.com, 
	rex-bc.chen@mediatek.com, jia-wei.chang@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 2:58=E2=80=AFPM Zhongqiu Han
<zhongqiu.han@oss.qualcomm.com> wrote:
>
> A policy obtained with cpufreq_cpu_get() may become inactive before
> cpufreq_driver_target() acquires its rwsem, which may lead to a NULL
> pointer dereference:
>
>   CPU X                      CPU Y (last CPU in policy)
>   cpufreq_cpu_get()
>                              cpufreq_offline()
>                                __cpufreq_offline()
>                                  ->exit()  /* frees freq_table */
>                                  policy->freq_table =3D NULL
>   cpufreq_driver_target()
>     __cpufreq_driver_target()
>       __target_index()
>         policy->freq_table[index]  /* NULL dereference */
>
> Before commit 2372784542cb ("cpufreq: Drop 'freq_table' argument of
> __target_index()"), __cpufreq_driver_target() returned an error if
> policy->freq_table was NULL. Since the offline path clears it under the
> policy rwsem, which cpufreq_driver_target() also holds, that check was
> sufficient to prevent the crash.
>
> The race has been reachable in-tree since commit c210063b40ac
> ("cpufreq: mediatek: Add opp notification support"), which added the
> first caller of cpufreq_driver_target() that can run concurrently with
> CPU offline.
>
> Address this by making cpufreq_driver_target() return -EBUSY if the
> policy is inactive after acquiring its rwsem, in analogy with the checks
> in cpufreq_get(), refresh_frequency_limits() and the sysfs show() and
> store() callbacks.
>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20261104153042.3987338-1-zhongqiu.=
han%40oss.qualcomm.com
> Fixes: 2372784542cb ("cpufreq: Drop 'freq_table' argument of __target_ind=
ex()")
> Fixes: c210063b40ac ("cpufreq: mediatek: Add opp notification support")
> Cc: stable@vger.kernel.org # v5.19+
> Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
> ---
> Fix the issue discussed at:
> https://lore.kernel.org/all/a4b320d9-ade6-4f39-9e9a-e9a82b13152e@oss.qual=
comm.com/
>
>  drivers/cpufreq/cpufreq.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 54dde8419bdc..352ee4a1f085 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -2403,6 +2403,14 @@ int cpufreq_driver_target(struct cpufreq_policy *p=
olicy,
>  {
>         guard(cpufreq_policy_write)(policy);
>
> +       /*
> +        * The last CPU in the policy may have gone offline after the cal=
ler
> +        * obtained it, in which case the policy is inactive and must not=
 be
> +        * used for changing the frequency.
> +        */
> +       if (unlikely(policy_is_inactive(policy)))
> +               return -EBUSY;
> +
>         return __cpufreq_driver_target(policy, target_freq, relation);
>  }
>  EXPORT_SYMBOL_GPL(cpufreq_driver_target);
> --

Applied as 7.4-rc material, thanks!

