Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330C5C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 23:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m5T81GSSj/wSOf+YVbJPz4KUR22Bs4BrhvMeXrh10+A=; b=LKchT1ZZpz9rdM
	fYsPAHd1caSfBtae7CJqgQkEHmEZPGUO8lSJo9AFdEBKyhu5l6hQALleXg6q3o+F53qv6w9pJJASC
	vwn0mC68gJTdPqCcegCeXxcA9dX5G0kXGkcDrT/PU2pPVNDfweJ/F/vE/fWzFy61Yt+RPHYokZCrb
	bacHO4qD1GodkGNhXgT6i3NCvwT0hUUqZ50Dam4/vrcYOgR1zFBIfoFbStOaiwEsn3FSPfRZAAZny
	XiYsiaows14h7sarXzRNtM6qKfuC4q+ASUCcNxdjAaPgf46nw1YE9KwuHIO99MoIDDK4gLXV8g5XN
	zEws47ewu4nOmBJ1AAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n74ZN-00E1VS-JZ; Mon, 10 Jan 2022 23:59:21 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n74ZA-00E1Pd-ER
 for linux-mediatek@lists.infradead.org; Mon, 10 Jan 2022 23:59:11 +0000
Received: by mail-pl1-x62e.google.com with SMTP id e19so7836886plc.10
 for <linux-mediatek@lists.infradead.org>; Mon, 10 Jan 2022 15:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ncMyS/M82TAX0XzN3Es3I6cPGmtlnCCuAh/Ld4ihDGA=;
 b=vsiJy2tmFD+8MJJl47N74HWMFB9qYdMh05Faacv/sNB+9szwwAe4GfWQTcig28Vtgp
 FvxsC8RbBbnBWJQiO2Bjdq0jU3L19hSVqWYqF+Q1t8mYKcvq9xrD9htGhd0xQqiEQekT
 OE0HXNk+VnaU3iOGiDGPHhkB8nsPpxtV8Yl4Xe8kA5SE1Cht6FwpsMv3rw7jxVEGc5LR
 92a6i8Vh40IZvUyGvck4uNX2DXM5jo3A6sK0snbPh1dGiYEzt21kW2eANAjoftbb9ltI
 nRPjHTyuoSe6iq4/kh6lG4NjCrGRPT7mokzFhryePmirBqH6sgYaWwZK4IDlcFMITSwx
 CCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ncMyS/M82TAX0XzN3Es3I6cPGmtlnCCuAh/Ld4ihDGA=;
 b=ldASczcpEm99dFm1HM1lLo1NZFXQlMf1ytFNRWe2TD/3RrPYUmYKFLz5zknBA4ToxT
 2RmIAwmpkYvVvuI6ZqpH1WJwvvAeLX0/NKP+hpXHFxiyRZ4UeF/aGSu41sNaXthWttP7
 BSIEGH1S6zAbie2HTfUvcPM2RV3NJbkKP0s+3TpFzZ6gO5urdduCvxltwf82Z0dtu3dq
 56FmciXjmkiHF+a8qyK0+pLfWHVdyfL2wB3sVyGp4TFGIWSWxRyVtf29+c2zcOZiXLWd
 Hd9NkO1eLPwsVyIrAseNfdRag2/JlOriIzH8PAg9WQ3QBYAPer7eB/6841ubmWhrqDxO
 GJig==
X-Gm-Message-State: AOAM533E+jKweW+O9ziXMwsnHCjmqdiD10O9+ZJghXqSM8M4dbdxBm60
 hb/ChXEkxsNI789Rs5ztJgZb+A==
X-Google-Smtp-Source: ABdhPJzN00U8cjIpP1EbJq7jDhQEN28fmWpurMfRCDK/PSD00fjf1an6Mt7OpCWls0X5r6EEidcmYQ==
X-Received: by 2002:a62:cd41:0:b0:4bf:3fb3:82a8 with SMTP id
 o62-20020a62cd41000000b004bf3fb382a8mr1938401pfg.66.1641859144297; 
 Mon, 10 Jan 2022 15:59:04 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id pf6sm159173pjb.10.2022.01.10.15.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 15:59:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Nicolas
 Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v6 0/5] Mediatek MT8195 power domain support
In-Reply-To: <20211116025045.5401-1-chun-jie.chen@mediatek.com>
References: <20211116025045.5401-1-chun-jie.chen@mediatek.com>
Date: Mon, 10 Jan 2022 15:59:03 -0800
Message-ID: <7h5yqruoqg.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_155908_523059_A5E278DB 
X-CRM114-Status: UNSURE (   6.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Chun-Jie Chen <chun-jie.chen@mediatek.com> writes:

> This patch series adds power domain support for MT8195
> and is based on 5.16-rc1.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
