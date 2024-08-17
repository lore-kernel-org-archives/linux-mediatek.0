Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE97C52D7D
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Aug 2024 09:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGF9YJkO5A7YVtlAJixymINWnO2oLXUTJ5Rdb0OiTlc=; b=rYWkDh8vjoElx6u5hloqeIlFqB
	ExiHuVdm1wFhSOrfdZRD7cHOg/aZXAh6L74umdHTKhyE1A5zBVDoBTdDgiCwICjvgU920siOhJ/6r
	uW9+WeY3RZq8mMHnnYwXoudje6qqhuMfL9ab9VhFivSx2e7qPR3OMX4BzkeSHOugec5N3j4U6ctQc
	98W4QF960qjMyu5C70S+/YTdMih7A/FxUQ73GiluaAF2g8PJWZZDgCNtMMwUeDGaL7sWwPBGJy8v9
	fitJl+fXMTP5F6RLwvr/MGjIWc5v730/ne1pvFD+bSka/WX3JTT0bm4wKuf/Pd19iB4+hJeKbn4mG
	S10HJ88A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfFQV-0000000Eyap-188P;
	Sat, 17 Aug 2024 09:08:47 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfFPo-0000000EySd-35OS
	for linux-mediatek@lists.infradead.org;
	Sat, 17 Aug 2024 09:08:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-428141be2ddso19044875e9.2
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Aug 2024 02:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723885682; x=1724490482; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kGF9YJkO5A7YVtlAJixymINWnO2oLXUTJ5Rdb0OiTlc=;
        b=MNrR0Pfx8+fGngYHh10hg8PO+2Ceh9RZjWv8gxnJxFu51k71mrcfnHGHno4Ng6VSqy
         drEYBzDkG1pcjFOYpa5xS8BH+x3abXUONlg2RuU1fG5em1NalHgJe7OUUdh/68dSGUUH
         jzFuxd6Cvu+LF9HWuEMIjj5NeqW2AXK6iPyhUhBwY50cqx6Nq5P/SOOM3jG4Mjje+zGI
         spvQlnq8mBZRBiIEcIp0bWtVsiXVS+UrGtut/r2//AZtAgs755Fg0hBfEipMkdq9hr/V
         yeWOUMGA4Yy3jyfFUOismEoAUB5g+Jbyq45loViyU89EYm2tQPdwzsMxuzP7py8NRoHj
         NKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723885682; x=1724490482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGF9YJkO5A7YVtlAJixymINWnO2oLXUTJ5Rdb0OiTlc=;
        b=CTb6jYAqSV1fV/BOfvpvw4p5Zg2aWQ7jlyR4wPFnCKXLeAl0cwJuaBjY0Mh+2YCtU0
         ZPzmteHQY0WeD8KvH9os70wktAbpQLiKJwmS1hVG/A7O160lPnEznZ90b0Msxra9oDcV
         TTHvYZBi7ft/eG6VbbEPzNjvp+cl9ls4+wL96Ldy3wpL5ow/m/cylaF47O/uhXwz9Biy
         E8MW/Fj+1mCrmGfqTrNSC52EmMwqBGEZQrPEVLmlwaYDAvtStZCwE1HrYKWBq7SfARYd
         Yyvc4MTMrAoVjGOhKviAOSohyHrbl5ezKj3H44wCIf52JNlzgxDZk+qvbI0L2TzXv4LE
         BlXw==
X-Forwarded-Encrypted: i=1; AJvYcCWOzzGSu8pmwrFbbtg1xxtPJHEwCR52HZfEYMsyxZSUGU7QW5tgdejEGC1nIjjIOY1214aCJkMv/FZOW0Dw5aGN88o9tKmoI7pUT2kYDGVo+8w1
X-Gm-Message-State: AOJu0YztTbEkYNbhBl3htQSd94C6Wos1hRRRku2OFlc1C0uaCwuPUYVk
	PFDLES8JjqpCCQfkoa7ZsamdlNTs6m2mv9OOwwfOPUkxRAbbarrDuQqN6P37fpM=
X-Google-Smtp-Source: AGHT+IFqPK78U4SliOQYt4MFyXyezxY5YXxZuEpRIOtN+fnxyD4VwFBOGWGb/VPGGTvD3eHpkc3FQw==
X-Received: by 2002:a05:600c:3145:b0:426:62c5:4741 with SMTP id 5b1f17b1804b1-429ed7870afmr31694215e9.2.1723885682237;
        Sat, 17 Aug 2024 02:08:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7cfbasm97704135e9.45.2024.08.17.02.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 02:08:01 -0700 (PDT)
Date: Sat, 17 Aug 2024 12:07:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amit Vadhavana <av2082000@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	ricardo@marliere.net, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, vkoul@kernel.org,
	olivierdautricourt@gmail.com, sr@denx.de,
	ludovic.desroches@microchip.com, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, wangzhou1@hisilicon.com, haijie1@huawei.com,
	fenghua.yu@intel.com, dave.jiang@intel.com, zhoubinbin@loongson.cn,
	sean.wang@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, afaerber@suse.de,
	manivannan.sadhasivam@linaro.org, Basavaraj.Natikar@amd.com,
	linus.walleij@linaro.org, ldewangan@nvidia.com,
	jonathanh@nvidia.com, thierry.reding@gmail.com,
	laurent.pinchart@ideasonboard.com, michal.simek@amd.com,
	Frank.Li@nxp.com, n.shubin@yadro.com, yajun.deng@linux.dev,
	quic_jjohnson@quicinc.com, lizetao1@huawei.com, pliem@maxlinear.com,
	konrad.dybcio@linaro.org, kees@kernel.org, gustavoars@kernel.org,
	bryan.odonoghue@linaro.org, linux@treblig.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2] dmaengine: Fix spelling mistakes
Message-ID: <070cc3e2-d0db-4d50-9a64-6a16d88b30df@stanley.mountain>
References: <20240817080408.8010-1-av2082000@gmail.com>
 <b155a6e9-9fe1-4990-8ba7-e1ff24cca041@stanley.mountain>
 <CAPMW_rLPN1uLNR=j+A7U03AHX5m_LSpd1EnQoCpXixX+0e4ApQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPMW_rLPN1uLNR=j+A7U03AHX5m_LSpd1EnQoCpXixX+0e4ApQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_020804_792692_1EE4F98F 
X-CRM114-Status: GOOD (  10.47  )
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

On Sat, Aug 17, 2024 at 02:11:57PM +0530, Amit Vadhavana wrote:
> On Sat, 17 Aug 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Sat, Aug 17, 2024 at 01:34:08PM +0530, Amit Vadhavana wrote:
> > > Correct spelling mistakes in the DMA engine to improve readability
> > > and clarity without altering functionality.
> > >
> > > Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> > > Reviewed-by: Kees Cook <kees@kernel.org>
> > > ---
> > > V1: https://lore.kernel.org/all/20240810184333.34859-1-av2082000@gmail.com
> > > V1 -> V2:
> > > - Write the commit description in imperative mode.
> >
> > Why?  Did someone ask for that?
> No, I received a review comment on my other document patch.
> So, make similar changes in response.

Ah.  Okay.  I was worried someone was sending private reviews.

(There wasn't any real need to resend this but also resending is fine).

regards,
dan carpenter


