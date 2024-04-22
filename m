Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9D4C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 03:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cl5iDmcU+vdD5ORuT+ZmSbv78xBtfXPu+m5CHFPkBDg=; b=hdA2y66gMWH9GM+DIN6rmBbPf/
	k4emtPJOJzS/2opH63wIVpYf7D0+lltBeZ7H1z8qUB2y+YbQ4RsrERq+YX3/rV/XX7pLD/oEvrqZG
	ANw1CE1FgJMSLHc9cslOrfrVpNze1DjOhw94xwrBuFLZC/NdB+kv5lmCDEy/ah+y9n3V/zZNcDt/Q
	vJGJx4ft2shCZQJBWrCJRvMtlMKJlDlrQv8ZgW0ZklUuD2xHTVlOHsFyowi4QUtuCAvzNxpbnS5K8
	tk/jWVTS9VOuObNDCrT6Ya1aGFzXVE7gfGbxNE99laiwNHJEu+j76FQmkA3SVmY2Zsb/5k638jRSi
	aE1yAckw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rykYR-0000000Bsh9-2bIp;
	Mon, 22 Apr 2024 03:41:19 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rykYO-0000000BsgM-3t3i
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Apr 2024 03:41:18 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-5aa22ebd048so2799786eaf.1
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Apr 2024 20:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713757274; x=1714362074; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cl5iDmcU+vdD5ORuT+ZmSbv78xBtfXPu+m5CHFPkBDg=;
        b=z18yQ3CsJpiOCuw6/elmlyPg82kfDlnalJqCjWbqb7j2j9Gv/fc8rw0N5+UJD6yU9d
         DbeCp/JYwT6oxC17RD81NXIVINgjWRyG2HPTWhMl+xu+nBh/uGiKF8ITI/ol8qclQI7C
         auqiXxBbYT/BLEKY9XgwbN33VO3mUT/bOPguLCfnixvwLN6EMHBcjk/UyqqXUSWwTgDM
         Q17kdOvu7hBw5B4eIYmd5i7/pGj2Ekkw4OuxwPtTy8CLFw9Js4iwlX8/K49uS+3ukMUr
         wb2aAZEHx+nu21xk5mmH9Kb6ykpnvmkSdlihVVeEIGfedk4Qv40x3Nkds2w+DYh8svkw
         N/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713757274; x=1714362074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cl5iDmcU+vdD5ORuT+ZmSbv78xBtfXPu+m5CHFPkBDg=;
        b=Ub9w1Ibsx4w442Q04en7WzKG7ZGuWHWTq6SusoB4wu6AbkJksaWmKZhNAvuKfUXm8E
         OG6AIirKxKyJPKRleucIsQX9WKjLAjQMnQFSCy2Ytd6Icruripr6qn/np9fYCb1pxMlg
         vqOkHbddYWoW5c5bGG9gGU3zDIMCdVZfdm1mDD2qX5ef8A9dqRuSnmwyuJo51lM781JF
         KnFB62IMCB7RUHgglYPja6fCbkWlZRbb29Qk2ikV3YGd2+Yr6F8ZvA+Vqax9rLO/XBHF
         mWEn1BCRLejVpILe8DCLsM3HZW9lC7M+z7jXGLsgmIE2dl6OYVWRMinaYLdcuZSe03aW
         3oBg==
X-Forwarded-Encrypted: i=1; AJvYcCUu1wn3OjaaeveWB4osucwhZJcTCR/ra3ZPNMawZsSlj1iY0BbUHpVM9i6CN4zrzxIIYCY0v06MhgaC61Dh2bbQxJNQNEBCXwSZdUySCQBR57Aw
X-Gm-Message-State: AOJu0YzOVTUViEDXIBOkRXDy0jPeqrjBnqNex/6EZGBvq8zQieNJApgp
	fF2Xch9IAoJsAkbPfBeDn9P4648YsAKoMgFOnlVMP79ztIDl2WoOuhB6rEQC01I=
X-Google-Smtp-Source: AGHT+IGk4VpEttqtX7wmUP0DjSs0Hnai1BKypHYXOPdM34VHuqvCdINyqmTAuf5HKKeFHylZBh137A==
X-Received: by 2002:a05:6870:c352:b0:222:99cb:2215 with SMTP id e18-20020a056870c35200b0022299cb2215mr10754338oak.28.1713757274492;
        Sun, 21 Apr 2024 20:41:14 -0700 (PDT)
Received: from localhost ([122.172.87.52])
        by smtp.gmail.com with ESMTPSA id m19-20020aa78a13000000b006e697bd5285sm6803551pfa.203.2024.04.21.20.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Apr 2024 20:41:13 -0700 (PDT)
Date: Mon, 22 Apr 2024 09:11:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek: Add support for MT7988A
Message-ID: <20240422034112.rugixkqrbeyq44zq@vireshk-i7>
References: <acf4fb446aacfbf6ce7b6e94bf3aad303e0ad4d1.1713545923.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acf4fb446aacfbf6ce7b6e94bf3aad303e0ad4d1.1713545923.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_204117_038672_A39842B0 
X-CRM114-Status: GOOD (  12.47  )
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

On 19-04-24, 17:59, Daniel Golle wrote:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> This add cpufreq support for mediatek MT7988A SoC.
> 
> The platform data of MT7988A is different from previous MediaTek SoCs,
> so we add a new compatible and platform data for it.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Applied. Thanks.

-- 
viresh

