Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2FEC3271E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 06:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1FcWtX9vaZBCwduln3dpe45i1fpCK57rnuMSwlu6aWA=; b=POJ/oddVFczcUgf6hmcBnEZuqV
	8VKjxTSB3RCp946+Nn2kbaJ6csPvofPyOfhbJwL6hRr0Fkm8XxK3MjIKmQKK8VcG+y/GkTOLOo3q8
	/kVk313EEWPRP3SOzkjjDX5IWGofvy5TVkFJTD9bqlSFly2irvPbrONSPK52qvgqz/1gFDzZ2uuX5
	yv9JcRxxoiUkxGQWceyNZsBtWUrhHlWwb1SWD1nNkiJum7XZPYzX9H0vyeTAX1HZMUkCVwwLHHZCG
	1C68iVDuVqcztfcibB8mRvQc8M9Koc40+7jq59qeY0+XYVPc/8z0wVp0QcGvoWWv2s3wOwASjpQ5E
	oQvbCOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQi5U-00000002unm-1qId;
	Mon, 08 Jul 2024 06:43:00 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQi5R-00000002un4-0MpV
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jul 2024 06:42:58 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-25e16380bc9so1754741fac.1
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Jul 2024 23:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720420975; x=1721025775; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1FcWtX9vaZBCwduln3dpe45i1fpCK57rnuMSwlu6aWA=;
        b=y3TFWs6CyTiEj6fipEk3LXfuBEzE8jOWK0EFPy/YwW8yzjoFCYPwPnzi4AXckuN25k
         MkjSyGMVuGS7rEkbrZZlFE/1plVrCIx9Xne7o+ktEQos2r9qZ4RLcUcaI5ygUuPliGS8
         nwVAB8eWuH/crBo28BbmCof+koD14R5QoviBxWOEzYyTfcwl+lKgsbVpRQ6B+9feODvD
         qt514eaCmaTRjXzM/a9qDO1pCKQxawJD9MS4xNscAPFQc1gWU2AJcbOiGvDecv4Qheup
         taLfgT4dJMEdFlUKgKww0TNpkLjnjpoR3yDulj8551N2N/ceFYTpmHFCkLcIQRHsB1us
         Unrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720420975; x=1721025775;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1FcWtX9vaZBCwduln3dpe45i1fpCK57rnuMSwlu6aWA=;
        b=UO8+ALs6DWQ4SMFea+eqhTJHrr+Dqx8v2kb6d5M3un6ABhX6BsNfh3/rlcP+hkyZHp
         5cYNQM2UCs3Joel3AbeFoOxldnuEESTtywfS2E965SPWs1lHOiW6twX5lSKbV5WVCci6
         JRdqSJH4EkmaAkxN10bQ2w3UttT32zXMyoP+ea7BQNkrBOTK6CPLy5qS9+gzTrmp//Zh
         4V0BUxJ4HXhIY+cbRWDQOLlkLSOuvnk4LyiFutpBOXJCAdO4+6jgursQQTK4subkOHJW
         aNqiduoJhv03mCGv0C48TQ45mVdqc2s1djbkT9iz72+3jBKQeO8+YiA6HOXO1k5YPY5t
         pJDg==
X-Forwarded-Encrypted: i=1; AJvYcCXkx694772VjkJ7FY9w1IYAuDv8HJDBviOXKXFJO0qacTEm1qzpPGEt72gudI80GgLr82MjHDIcVF1W4wKDYmI7oMy5afyKjsnaoYj0wQTo6v2Q
X-Gm-Message-State: AOJu0Ywa/CKAjw4Ap2PrA1i/fOiLvT9JPYVo+NaaAGlhxX+noD3ORBmw
	iSHI4K7HqcWbDEEzrXn0lH9qDrodiJq5jwU1eJNlPeskDaVAjNQ8boaoAiQ0IiY=
X-Google-Smtp-Source: AGHT+IEpqAis6dJIEMNcexBdNxU9+uzyMP+q55/0m9GwePwrj4Gs0P9PuuQDc9r/zZs34DMwLSdBrg==
X-Received: by 2002:a05:6871:688:b0:25e:14f0:62c3 with SMTP id 586e51a60fabf-25e2bd878b7mr9528568fac.33.1720420974988;
        Sun, 07 Jul 2024 23:42:54 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b116e43f0sm5260455b3a.101.2024.07.07.23.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jul 2024 23:42:54 -0700 (PDT)
Date: Mon, 8 Jul 2024 12:12:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek: Use dev_err_probe in every error path
 in probe
Message-ID: <20240708064252.sydvhfnmx3akafql@vireshk-i7>
References: <20240628-mtk-cpufreq-dvfs-fail-init-err-v1-1-19c55db23011@collabora.com>
 <20240702055703.obendyy2ykbbutrz@vireshk-i7>
 <aa6e93bd-aba2-4e4d-bce9-04e818ac25ed@collabora.com>
 <20240702084307.wwvl5dchxa4frif3@vireshk-i7>
 <8602bf12-1b8d-4249-8814-52ecaa29d0ec@notapiano>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8602bf12-1b8d-4249-8814-52ecaa29d0ec@notapiano>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240707_234257_398766_A7237152 
X-CRM114-Status: UNSURE (   8.52  )
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

On 05-07-24, 11:13, Nícolas F. R. A. Prado wrote:
> That would only run once during boot and only in the error path...
> I'm confident in saying this won't amount to any real performance gain. So the
> usage of dev_err_probe() everywhere for log and source code standardization is
> well worth it.

Hmm. Fair enough.

-- 
viresh

