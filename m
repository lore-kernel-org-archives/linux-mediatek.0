Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC0EE95A91
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x3J73euIEV8eyB2wmuVgatH6Jh9dGNNNj6rdYQeMksc=; b=zCW1wAJ0DHGxWVTEeW9zXfgsWM
	T3M4KJsg4HnL+cf3E3VmKKckpiJBqXkAf//W4JqlLuXxHw6t1pIVv/+OTnQM6p7q/lZz556Gl5kCa
	IR1E4Nmc8lhHx2S+WDlI3AndXeg5lq0HBrn9QMDIXoeiMeRIcwtedoJxK09t+j5WB3CIkXRVuJ1Jf
	xPno5D9HPPY9bpIBUuHbiB9oeTi2hk6ew+ptEY6b2D99Sh0YYOWrwuHHO5xDjziSRG5l+jN6e+rXM
	Zfd+XrS33A/0r+HQPes0Gqv9Np+kN95vO4R/lknCGLBs/vcc/ujCsQ9ztakc7lCGj/kWJH+oTugQK
	Sos2u45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpneu-00AHNU-16;
	Mon, 09 Oct 2023 10:38:44 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpneq-00AHIC-2H;
	Mon, 09 Oct 2023 10:38:42 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9a645e54806so744593266b.0;
        Mon, 09 Oct 2023 03:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696847917; x=1697452717; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3J73euIEV8eyB2wmuVgatH6Jh9dGNNNj6rdYQeMksc=;
        b=nT/oBLSFVhwFX3epcrDPMl44qpPRrwP477Fn0GScYSHBVd464B3GEqMBzOe2kb+hMx
         aEQqLugHtljWApdQidsrOesC7StzBbseM4dFkrJ7Zmt3yWsfRHmTSJw1FRRV61VLFXWB
         yMRFhlqCD0AelwhrzWtz2xqyrAKhvV+ccA58I8Qnihz8Wh9ymejW3S/szLPfWWOE8Rx5
         9OJVdWRqrgKBwciKjsYEk1ZJZBva9zVTV1NUOP6oTrWZtdugclCJqjYS9qeS3mWvgh6O
         p+6bxw7oRksfc41NOHxPTlR/VrzaEjDV4AKx5CYtvM4fyeYrFcMkunREFPlFZQ9V5fV7
         kdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696847917; x=1697452717;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x3J73euIEV8eyB2wmuVgatH6Jh9dGNNNj6rdYQeMksc=;
        b=gvhDScutX8kgexwmL6zOJSZHpYXLwxHjnZrBupSV+22WX8ERQyCtrJCi0vXa0iJxKx
         A7CcppoUkEHlH0HZJxkQhqJeao7qFMDWjhKttJC+DNfLbhYri1iEtTjb1Q5AwWc2h6pC
         rQhgybI9KkGr/CmnAN4hHQnu1V8VdL/lC2JRG5g+3a558Hdlk539AY+PxS/9ddULHR+Q
         m7ih0rTCnLEKLz4+yKLgZNFnUb7ehJWQjy0XPz4ORbg9rxZy+djp9ZuT2BaKB1/lJuJ1
         4XvVTSiWMR8KG7/1l0yBh1BeXwpgmVYsOfMoVuxVmBm1jrKS3QlOddkhp5wdKJB42cyV
         qnDg==
X-Gm-Message-State: AOJu0Yxd6tVziEIdcbVI1hlv5gkOnsceC55CqwakTPEDaUIYx+B+0aS6
	JuR1QkA4wnEXDadzBxMtJAE=
X-Google-Smtp-Source: AGHT+IHo12kdAU1akvWTEeAq1UVmtpvo/cS3/aj5gnG4bA0846pnpYavyGYEoQTf7pfIsIuedml/hQ==
X-Received: by 2002:a17:906:3156:b0:9b2:b71f:83be with SMTP id e22-20020a170906315600b009b2b71f83bemr13022049eje.1.1696847917145;
        Mon, 09 Oct 2023 03:38:37 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id jp20-20020a170906f75400b0099bcb44493fsm6624599ejb.147.2023.10.09.03.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 03:38:36 -0700 (PDT)
Message-ID: <d25ccd90-277a-fd05-8605-f7d1d129d4fa@gmail.com>
Date: Mon, 9 Oct 2023 12:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US, ca-ES, es-ES
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Tseng <chun-jen.tseng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: Updates for v6.7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_033840_744742_E0281BD5 
X-CRM114-Status: UNSURE (   9.43  )
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

Hi Olof and Arnd,

Please have a look on the few changes for the MediaTek SoC drivers for v6.7.

The patches were collected with the help from Angelo.

Please have a look and hopefully: happy merging :)

Regards,
Matthias

---
The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:

   Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.6-next-soc

for you to fetch changes up to fa095fe0ab3589109dc5add3f34e16a053d90260:

   soc: mediatek: svs: Add support for voltage bins (2023-10-05 12:14:47 +0200)

----------------------------------------------------------------
MediaTek drivers updates for v6.7

- Added support for Smart Voltage Scaling (SVS) on the MT8188 SoC

----------------------------------------------------------------
Mark Tseng (3):
       dt-bindings: soc: mediatek: add mt8188 svs dt-bindings
       soc: mediatek: svs: Add support for MT8188 SoC
       soc: mediatek: svs: Add support for voltage bins

  .../devicetree/bindings/soc/mediatek/mtk-svs.yaml  |   1 +
  drivers/soc/mediatek/mtk-svs.c                     | 184 ++++++++++++++++++++-
  2 files changed, 181 insertions(+), 4 deletions(-)

