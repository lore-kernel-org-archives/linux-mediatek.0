Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB49C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 02:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=; b=kquRV/sqG3CWDxrIVxldwk643o
	Cmgxnso3Ga82Abu55znhtmgbMtdC+CwwVSZ01uu5CGB9emZFtWVPC07eTd5ofRgd8NVMCvuvcre8A
	yUGLwMzLJMglv9k9FuwbIHDXtxzVe2JHAOiJsKYMTGehSsDlKDJ0gslDCV2EDIXIpoW2q30MYhOWM
	oxHzHp7ZhMZ+PPK/97jpa955I9fCmVKLjK5QV3UXD7fr160Lmvmu/xtlUlvFcOkac+h/nKba7yu0+
	cF8xPWJP/zr5T3rdbl9gyA0WAxAg1Ldxr4GJglHGUJYycSMSuQvz/T8k6N2FFoZtC2Jvqw6Asu0Kq
	u6aeBV+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheaU-00000000pya-1FJZ;
	Thu, 09 Jul 2026 02:34:06 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wheaS-00000000pxl-2Md3
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 02:34:05 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cc73e322dbso12923465ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 19:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783564444; cv=none;
        d=google.com; s=arc-20260327;
        b=K6aVtLqlK6eJXvsQKWM+RRUUsAm0EXMbYIzz7i/6hhTe/I4vYrB9O8fj6DupKeCXDh
         9ZWRpyQGJNMuMHQBQ2lmrycPHutEe6zQvARxRZZYWb1NM9borwmNYituxXgRNfCOFCRE
         coVcd2/lzBW35saCVMxPMcZi3AozwT4qrtjMSlW6PHACWK4HBZ6TBiFN36NiwG1ChB7I
         IRb/phVK0i9+oy2fnterwBLgM+ci96+cXwidPzuNANQoAXhXTsHiULN6wo4IMAD9dtid
         fi09j9Ptnn9Is0Qs03R5laiNP56avXsSxZ7e6kGj1M8OCjcqVcFwYTHCfG3K9jSwBQAq
         W+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=;
        fh=mvV9yzSm7/mG8HQBgLEdSlPU06nn6RpaERro9xFny7w=;
        b=Yo5m57qoAskHAzCethCIZC0+g9Ij6KIlOzhB94WwqP1OOxVr3dnKwRttDa0ZeCRag/
         UgVuEFLYhtMCpJSSHnfpKzD4/FSP5mXMgFv8rJgl+CxQsjNWW4ZFkjxLMCYsze8GMk8h
         AVSPna3qLrhJYDJecCFgdZzNIItQd/hOF/iKIsHx4W3RfzD3DEZM4LshqdBJHycgaZNq
         GYhobGXJuPwwI0Tti8dAl7vsifsLJIEzd94fNx8RXbc+npuYHvqwyispkOCHFnQJRUNM
         lMxOCCK028ZSTbjlud13QpqAYs3B0rDSVad135NHJIf3SNfdOGsW1QoEVeKMuqOqFnwn
         XyPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783564444; x=1784169244; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=;
        b=dmfb7M6HFIo9jCH2WwcdZ1XZnQAZGc0Voar+j9ub30OJovKsamzu/xbem0BwYSjORd
         tiFWDDNQ1nYR8t1NKKoNsAoEbihZYowizD/V0cTH+v29Rz8Gw5sUx889kgT/FKfu2/p5
         dO3d/vZv0LX+uwAJpbH3XbDJThBGvRz8rJQreIxEGvMOiwairsxqdNq0vGv5W60w5s0i
         dEF942p1n56gYIEVZEYS/lch7cABcWkY4erjnxOPOJY8lWi+zYSoD63NzQ+ci1ef+UB4
         OjQYmUCB4VGnUgaGywIAq4p04vukrdIuq6sgHTRaLf+aQantz3vxRj0ZYBKcYC9fap4C
         rZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783564444; x=1784169244;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9RRwQIJh1889dCPoOcbcg16JSZb+Bt3uDLhus1mbDjw=;
        b=Mqg6toQGsFPGM1N27++vAdkFU65CoTqCrXwWscGwYKwi/8ArmFJbtWxhvtFb0bdcSm
         sB/bYduBTT1JRnPcNVR5HVfWcvO1w2wG4ieFdJ13EGXMMiO6xR8puGf7WEj11cXV0GZh
         EAUuoYH2YiYKbqMvG6MXPZk6Ugf9soysLxb6zfN4qq6pYM5fISjg5JBP/vaKg/6nDUDP
         wPX3hMiXJIcLImx5AAYBDWsj+Qpp4C60hXAT4KHqu3GRmOzJJ9cK+w3canvee4+l676q
         OZvt75Vy0COr0IGGduzyxvNpqguXYLnKwMqtyuVEa0S1ZM+0kpjT/hYK+ObcY0ZGhfIU
         rwJQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQsjoHc/DAQmBumUZTJVLw/k8N7L8P5F86VWHcJX7h0ornWZkKG/h/aH9aMZxDRTWetDSl03d8jSnDMYthwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzGwk/LxHp9gY/oC4cxEzqQ8us/g1fdSAgkq13xw9m1+2f9UnI
	4z9MNnGpGV/gA9++/8RnRPb/4PxqXm119MW3AdjFnI0aMbmi5RD7oH/79ZfjfBmoVjfR8CnIfng
	DmxG8akhWwNBbz5RQdeylKFw/SmyTffM=
X-Gm-Gg: AfdE7cnkogaQslVVrLX5enzuUZTU36hlDUuxfAKCrVdWIqWdfGJbApEuqTHU9zB8vrz
	5VvNwIWMtRQWwrKCWhe7/G0TCWGWyigREAwdpFMTOUbHYYjiRUoIg4A20VlucdKNB4+3edOx64E
	75J3xbYv7tRWEIW0xHcAwG5NgGzwbDjCh4MhZmzETk+iGko0xk/X1G6Mx7t5QXUfu7gKHV1CrNQ
	oqPmze2+dz3XwYSm8jBT/uU2Qh98Mbc9iX2WI6IzlPsafiKmSQE0jUqCxlCr6qJFRwq6jHvbJ9f
	ytUmtFtqhrGHWm6IsAoxateVQ+I=
X-Received: by 2002:a17:902:ce91:b0:2ca:ec6f:aeca with SMTP id
 d9443c01a7336-2ccea3847b4mr47728935ad.8.1783564443676; Wed, 08 Jul 2026
 19:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260708141734.578926-1-phucduc.bui@gmail.com> <c9f7eaac-9bf7-408a-a4a6-56f3ec6177a6@sirena.org.uk>
In-Reply-To: <c9f7eaac-9bf7-408a-a4a6-56f3ec6177a6@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 9 Jul 2026 09:33:52 +0700
X-Gm-Features: AVVi8CfyewtsE3QT1H6Qb0mhvtRsc5zTxpasaNVBWAckYMH2ZTVpwhyO0FrCTdA
Message-ID: <CAABR9nEjwXufG5FyWm=ExiDEmpO50U8Tnr6yg=CSFPo3SWrJJw@mail.gmail.com>
Subject: Re: [PATCH v2 00/27] ASoC: codecs: Use guard() for mutex & spin locks
 - part 2
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_193404_604697_6A56FBE6 
X-CRM114-Status: UNSURE (   8.19  )
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

Hi Mark,

Thanks for letting me know.
>
> This doesn't apply against current code, please check and resend.

I'll rebase the series on the current for-next, check that it applies
cleanly, and resend.

Best regards,
Phuc

