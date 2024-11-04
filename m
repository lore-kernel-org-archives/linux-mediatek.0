Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D848D132BE
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Nov 2024 12:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUT2MUhoOe9iu2p2kd8BI2aLF+LB/mKyYJdsiPsn1AE=; b=b9e5VWdkJUEZ2xKeoijyXJaV9X
	kmAU15TVCSHKNIRpFYPel2lLzKSZ2IoK0H0xhQbsbkCRQN/e0JSb2PTO276KTk0dl1Prw9eUlUeoA
	qWFYOPX4BzZLJKTfCryZdj8P3c/sIYE8l+1C1zEurm+e/6qITmkaY8pxCoaUvlAMFfgS6NTyQYMCz
	MQ15x2QzVrAH9V2K8YfXv+aYj6DHiPRa0IGcRAD1eJKbkbH4tHIjyGUabfu+iqRzRq/mwRZBa9dbp
	MkxWj39F/WMELxLMySp/DWA+G3JXbpEZoGqDNe7dgD7ZgSwMkp46hA7RmgzOdpTRYYRYiXJ7Gp6G/
	1xbhCqlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wdw-0000000DlF0-1V8o;
	Mon, 04 Nov 2024 12:57:16 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wcE-0000000Dkzz-2qNX
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Nov 2024 12:55:32 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2e56df894d4so3243767a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Nov 2024 04:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730724929; x=1731329729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUT2MUhoOe9iu2p2kd8BI2aLF+LB/mKyYJdsiPsn1AE=;
        b=I7ds9tkDuqu4jJ5BhU0UUHPciVmyBBbcSmlILoKcylQtKTAW46Hu0X+6iloyjlhxc+
         iPgPtJjVS8wkgsH2j3RN6XNRqWRLbq5Vp/gOWvRBpnaX9MdvdrevwJzyyw9YkU/eVMHC
         MsbC4LtKbXpwOl7FpXhf/ApZZMa+OBCO9uYUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730724929; x=1731329729;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FUT2MUhoOe9iu2p2kd8BI2aLF+LB/mKyYJdsiPsn1AE=;
        b=s3v3VCxs6jpiF1Omnli6Bo0zbcQxY9XtL0auuK55CNAmcdwVEUl6HrNvx+3N6YOfjU
         64vPbL+r6N3w1J7Ssl5zSe6iz103xOVU6klD+DOctJv3++Yxf0cac9H14tAydyWaF8jM
         F8AkUSWJNTHyOHSwyjRCn8EkNYTBri4LZzm9nMnJPgBMfiBOrhp97V4RUMtvjv/3NYMw
         4LDiY18S23stiNKV7nTUqT8Jtc6TgRZPKY6RcuiYBqbEy6qAFtES5MerGosv6RpJJIYq
         YjluTNdmAyXSjIxm4LI8CpCdn5mWhoa6VMNQgGLVcCT/BzB3XfmHXpfzHwlOuwQf05rj
         dYyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTScvf61gloVa4ocOs++LpDZkBXsIpkNPaBwwexGHKRdQv2VIoxG86o+6PXED5ocntVXuRYUsJvfW05cuX/g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1IM+ksMGlpNv8toWhAO1OzR3MpR3mX6xxNi/iC7fWS4HAp0Xr
	aTfqaY+g4TUA3x1Ab7R69XP7NnVrmWMaVuEbSkCJtGSqPJRWf8pGgmZ/bBU2+g==
X-Google-Smtp-Source: AGHT+IGw2My2dH4dIXYJt5UAfh9QheTuaxvz/yW07aa/c8zRoSfhpBhW/1Yv0E1txryL8w9UJYPxAg==
X-Received: by 2002:a17:90b:250a:b0:2e9:5e21:24f7 with SMTP id 98e67ed59e1d1-2e95e21257cmr10927134a91.38.1730724929339;
        Mon, 04 Nov 2024 04:55:29 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:f5f8:ffa1:d9e0:6eab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93daacb4dsm7534611a91.24.2024.11.04.04.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 04:55:28 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 stable@vger.kernel.org
In-Reply-To: <20241029095411.657616-1-wenst@chromium.org>
References: <20241029095411.657616-1-wenst@chromium.org>
Subject: Re: [PATCH] drm/bridge: it6505: Fix inverted reset polarity
Message-Id: <173072492636.262894.11094550143215575349.b4-ty@chromium.org>
Date: Mon, 04 Nov 2024 20:55:26 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_045530_785427_C8EAAF82 
X-CRM114-Status: UNSURE (   9.39  )
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


On Tue, 29 Oct 2024 17:54:10 +0800, Chen-Yu Tsai wrote:
> The IT6505 bridge chip has a active low reset line. Since it is a
> "reset" and not an "enable" line, the GPIO should be asserted to
> put it in reset and deasserted to bring it out of reset during
> the power on sequence.
> 
> The polarity was inverted when the driver was first introduced, likely
> because the device family that was targeted had an inverting level
> shifter on the reset line.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: it6505: Fix inverted reset polarity
      commit: c5f3f21728b069412e8072b8b1d0a3d9d3ab0265

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>


