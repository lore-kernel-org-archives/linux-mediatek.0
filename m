Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1DFC27C52
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJ3fzqU7zIJSZIaEHoz1dBE+4a5Pc5bbz++LUqESkpE=; b=RMerT58gHQTsiIUETY39UY1x8U
	8jmsbPdkW5177+JzCkYgPqXtuQP2u8U05ahp0bFE+fqlKjeKmito3AzpyrWfyjLrM4rL/0eSmCPCX
	+7zIMDO/SyUVdady6fyYUpLd8uRUzURHdR+JGl1TKL8ah7tDr86Tr/ZFyHNhfSuczDCc7IRjCrHWA
	cEGM62jIHl48ySbjLqkOVf0FJrlk7sANkVmdhE4HxAagjNfaqhl/gEKiZdEUyFuMPG8yAIhDxW6yL
	f8FxzW08BeQNO0le5tyhgu8s9sqXoLKUk8/mNSB36JIQDCJb/CL8D+4bCMj431qN3tO/F9YIUWRvY
	qa746SrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEX6a-000000039CS-0yJH;
	Tue, 04 Jun 2024 16:33:48 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEX6V-00000003994-2BPB
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jun 2024 16:33:45 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-794ab20699cso298429285a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Jun 2024 09:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717518821; x=1718123621; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJ3fzqU7zIJSZIaEHoz1dBE+4a5Pc5bbz++LUqESkpE=;
        b=tfAQ0tdzEuj/Ai/ukiqpNc4HEqgpeOH2fvWW19otXBYH8fY774AKwKtYRI6T21X/iW
         tTHvKERIvW/hQsj7amd6uVQLhCJrlhOUpq138aPlcCXicjg+JfMR2Xe02F6CE3K4k+6G
         eXC7fsWLYX0K5UAMGKtqZcwIDMAI1Uo21gHokwctx93p6phbiQLQakY4XHQk+cjFRdIC
         Xm5IkYHxbbmCap2hO8jtgcSQqgkxuyF+jMSn3xETvT8oRe/xXmri718lb4RkXTbEyo92
         QdQpomEaZiQBw0kpyCtnB0wato+m4O6ABHFmWRZMRwAAADLJJMWRhrk8N0z1mvCvJvoj
         cRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717518821; x=1718123621;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJ3fzqU7zIJSZIaEHoz1dBE+4a5Pc5bbz++LUqESkpE=;
        b=JYyGBDDRrlHgnbP9r0KNpL6GbzFCOAk71qIAuxxhKRuwifqFaswoGCNUmhTTgPZLor
         ZPueqTpRwqG9CqZ65ZQG7XX3VSMnwX3nIbfekiEOv9Dr/6gp3Su1S0KKycLyrX5Brjgz
         l486qZ8TnJeO6F5glj9c7/KgRBeNeisIQXEsFlyxGpRqsKjKJUKyKZ+pzGw8YhF6S10z
         6RCdF8W1lwOKP4g8+7V8k0VWkGLQk6067VaL/LNh6C1sYV9hSqKsBBnLVy9F/dsR2HNO
         D2Q3LGguDNwv49GGRzL2aSABKLkGHstX6i7V9h5JNdblnfUSYSg6+hE1iiAJ7BJkenjA
         ws1A==
X-Forwarded-Encrypted: i=1; AJvYcCXwhWbty5u/VPFAKDrjUzoJxwZMhQAc8yDygZhXxXhbatUjOcKF/i0droJFb/4z6RRAo0aJuzpewD51otQYFWONHc7K1IsB0ct7lKLImXivmytw
X-Gm-Message-State: AOJu0YzKWSMOTH/nX7KA8bDHlIuYo32O7AmE4t8/IFGDwoqo64BaFdZ0
	KwRmMoZUO4b1xNIIv7o+50l7M8py+/+H6kPpCBj2yngRN/DwyYw95N18DL3+1ek=
X-Google-Smtp-Source: AGHT+IHd2opDiMK9J56b4t8UYsWXPdl+c252CiMlGiyJylrxgyVHd1pODis8mm4KS0VPSIQYkVKiLw==
X-Received: by 2002:a05:6214:588a:b0:6af:4fb6:22fd with SMTP id 6a1803df08f44-6af4fb62450mr95965726d6.3.1717518821099;
        Tue, 04 Jun 2024 09:33:41 -0700 (PDT)
Received: from xanadu (modemcable018.15-162-184.mc.videotron.ca. [184.162.15.18])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ae4a73dfa8sm39997536d6.23.2024.06.04.09.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 09:33:40 -0700 (PDT)
Date: Tue, 4 Jun 2024 12:33:39 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
cc: Julien Panis <jpanis@baylibre.com>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
    Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Return error in
 case of invalid efuse data
In-Reply-To: <af024ad1-93f6-4d7a-b139-7eb2fa12eb81@collabora.com>
Message-ID: <359n7s98-08p8-177q-n51s-33rs215soqq2@onlyvoer.pbz>
References: <20240603-mtk-thermal-calib-check-v1-1-5d6bf040414c@baylibre.com> <af024ad1-93f6-4d7a-b139-7eb2fa12eb81@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_093343_606387_A4957A77 
X-CRM114-Status: GOOD (  11.02  )
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

On Tue, 4 Jun 2024, AngeloGioacchino Del Regno wrote:

> Il 03/06/24 14:06, Julien Panis ha scritto:
> > This patch prevents from registering thermal entries and letting the
> > driver misbehave if efuse data is invalid. A device is not properly
> > calibrated if the golden temperature is zero.
> > 
> > Signed-off-by: Julien Panis <jpanis@baylibre.com>
> 
> Fixes tag, please.

What should it refer to? This is arguably a robustness enhancement for a 
defficiency that has been there all along.


Nicolas

