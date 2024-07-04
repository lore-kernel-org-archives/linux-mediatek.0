Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F82C31D97
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 03:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25KnsUopkysIBr2uTdSPXmQMFBU4Udb2z4yjgTYdwpg=; b=ygE0Bf7vr6yqHV5Cqt2aEQegAN
	ll41l4p1hfr//HayhdS/xPEcEtFoQtTLq/HRzESp11+RggddLHb3N96nRGthHEeapukpyWFLxEZKk
	8SmcCmsozFX8oPIIVjDCtAAJdJmwQpHKuq9x/0QFleyhrDNNKBGxQMSeTcZlCijVHVlYfeH8LXoYs
	Q9I0tP3fhGN+fOEP8S1bZe/h8NioiOE64agPnoK2GU0Mja+bsqtb/6OdlzVi5oul2s9wswm5/yljO
	lhww7KOd6iQ2srKUfl/XxTWRI1/kZ8QsV5G4jkDgkAfvkx7VI6O3ko6Xkhe46G2UFpHhY6VqYrGt7
	dtHYhQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPCrR-0000000C08O-2CVy;
	Thu, 04 Jul 2024 03:10:17 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPCrD-0000000C06A-3Vfd
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jul 2024 03:10:05 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3d55ec570a7so128583b6e.1
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 20:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720062602; x=1720667402; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=25KnsUopkysIBr2uTdSPXmQMFBU4Udb2z4yjgTYdwpg=;
        b=JkjJAPH2FLOgpTwAHUvnPQcPT/vNJclnczPq7Z+YZ17Ig2rBA+KK73dg7oPnhyU9Yc
         WJEdOKlwzZMY2EmNmrPtC1/qHb/qBykt/2hqQPiyZltWbZJwl8HiGTPdKvlhAwPhslA1
         e0YGC1bQjblrSpEh0JvX7yS8SHSicIiVCt3jLP8Izc3xO0KEKXCFzV0qf7iBjifF2p8J
         Vz43Vf9fMduBDuTgkPRY9twpKxX8Gwt2J6XdNuF2EOi7Up9bdn85OXJMeTkGTHDzs0su
         dq+Xmjg8lB4F0a1wxlgcnahQy0Erfu3ecrw8YtM59heRc1vXYuiZeLo+XFPIUzpWdyMF
         SsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720062602; x=1720667402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25KnsUopkysIBr2uTdSPXmQMFBU4Udb2z4yjgTYdwpg=;
        b=RN3Z5d8i9rX98DPX7QuciqTZGBlFF8az3V1jJ+p5o+HgL1aAhBvdN6yEIixhkWtiGf
         BS0KFs+kzZIy3bggSdPiLM3v3mN7YT+q1YS6dKx5/wo10NEzN6DcNQFl86eQpJyHKn4n
         8SY/U0CDO1jtTNVtSrwwyaj83AJOVzXr7zhC6lZUmwlth8FdpHgXGmoebKlX0lWApGXw
         sMF22n5/Vhn+1v18ruERCvSBZqM2XiB8Dr+aiVrqt4OxcWeVeYieJcpaJ2uc5ryuuI5j
         1Awi+dH8HuCGyGIDcqZZoKtAOKMgGcvCbpkntJ8Ibcoqy1bJdR8jQdG5u1Y+RYBIqqWI
         WCUw==
X-Forwarded-Encrypted: i=1; AJvYcCVJgWt0nXRlr+L3zTPx7l3ANCR94WWAAucUR9cbL5fZ4S2TjcKJlFyXIRtfmg7mc0P4rnXw4XTEiyK/TGJOhdmnNKij9Ur4DCdVmOv6CJxStNMV
X-Gm-Message-State: AOJu0Yw4ELFjzbg2fWni0+qMRVQP634mrRHYGWgHwiN/gN1th4ZrZ8Ko
	LUeHtKUuZk8/E6gxXR0P5cqdYNkgFKBkI0CuI57DNlyO/DEr6PkeHWjmuhwpddg=
X-Google-Smtp-Source: AGHT+IEihQyj4XFSMtMz5vsZU/RQnANpLyNp++2hhEn7OAX/jkTUQw8/zL/gyOLuMPNkWsj4ueRh5w==
X-Received: by 2002:a54:4888:0:b0:3d5:5bd4:75f6 with SMTP id 5614622812f47-3d914eb1089mr411097b6e.55.1720062601232;
        Wed, 03 Jul 2024 20:10:01 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6d41655fsm8773138a12.92.2024.07.03.20.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 20:10:00 -0700 (PDT)
Date: Thu, 4 Jul 2024 08:39:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek: Use dev_err_probe in every error path
 in probe
Message-ID: <20240704030958.h2m4t7qgk3sp33tn@vireshk-i7>
References: <20240628-mtk-cpufreq-dvfs-fail-init-err-v1-1-19c55db23011@collabora.com>
 <20240702055703.obendyy2ykbbutrz@vireshk-i7>
 <aa6e93bd-aba2-4e4d-bce9-04e818ac25ed@collabora.com>
 <20240702084307.wwvl5dchxa4frif3@vireshk-i7>
 <d6994f56-57dc-4a66-ad7d-1daa04788b22@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6994f56-57dc-4a66-ad7d-1daa04788b22@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_201003_908095_EA4171B1 
X-CRM114-Status: UNSURE (   7.59  )
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

On 03-07-24, 14:43, AngeloGioacchino Del Regno wrote:
> Yes it will, but `ret = dev_err_probe(dev, -ENOMEM, "...")` is still kind of a
> shortcut, as that will effectively assign -ENOMEM to ret, so that the error is
> still returned like before ;-)

Ahh, my bad. I missed that you are assigning `ret` again.

-- 
viresh

