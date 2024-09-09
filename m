Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45655ECE577
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 19:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ae/kPQ7qJTsMpU1FP3tvdogFejQsPDBzD/3o1TvUWsE=; b=VP5fQLB2iKe19Peo0NDXVoqwsO
	gpl7674PHLL2lM2/EWc2CCdX1NQmco2rfoDLR/dmmT6soPoDaIA1I7EVFzA5Un0BRGKGy/gGUZFAm
	e+U4klfzXJnqxHiV+EFNFGpEI468x67v2tUbb84HeGBK1rVTtgpoiFQVYEJT2NSZjTk6qRkcmfI34
	91Y2bgwpChG582tDCU4x/Soh4nhKs/Co2FyyU6uO7jMe2okF+j1w0K8bmUq4PYZob7x6lV3U4CbYe
	152h/as2njXq2M3mgx7a7Ag4m9KBhdMDooUZV5Pujv7n79WLmofl7Ienj/JmfXdzC9+BqG9jkVwo1
	ejfhSPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjil-000000032T3-3Eo8;
	Mon, 09 Sep 2024 19:06:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snjha-000000032MC-2u2P;
	Mon, 09 Sep 2024 19:05:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42cbe624c59so1082775e9.3;
        Mon, 09 Sep 2024 12:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725908728; x=1726513528; darn=lists.infradead.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae/kPQ7qJTsMpU1FP3tvdogFejQsPDBzD/3o1TvUWsE=;
        b=VOuukzfMAD/cKw+9JKQQJPEA3hDkpExYRhAMs8GXes12Ud7NSX6HOEDxkk78aY0Tvl
         nYG/QxXKiHW+LZLJFr3VN4W0dAo4DDrZ8iA1QXPqq+NTyGCRwDk2ucOunqzKfvnqwKVK
         Twl1h6XEcdADnfdV0BLfQJP78oyknCk4uhsePnKdpJuAwDcVqoPFa5qbvWPe/xP8yvVo
         GyrZtu2GBAu3S5sAk3n3vbXifM57vRSP4uWNMYKF86jIn0TVESUJkaQsmuQZQ6B/gjBe
         v2dZtG4BTs15qyDfZ0Y7OKjD0nKYEvZBu3yKI3jsDTdV/WJBbk92Rek1/2GoV24URSyO
         YvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725908728; x=1726513528;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ae/kPQ7qJTsMpU1FP3tvdogFejQsPDBzD/3o1TvUWsE=;
        b=jkjePYdCnoU/FTrDNLrAI03AjdSaAfqS1fO7yMIe3/qP+WFNqJanTEVl8vt+EbSxM4
         q+Vr98qzS6kbpL/4BucpB8BkJAevMsPJuBxELrdCTj6Mdv7v3JNOuCRViwoNlI+cqD4o
         TUSfl+IYLjYDMYszIzWMgn8qyQWOy3JGaV76UFyOX6OB1MWsIQT0HCxii10kJxZlWqj4
         2FpnOsN7aiGaTSbeC194EzwuXW6d6w7uaBfOi7FDsuKB7pZD+yO0pDMgVQ1BOBAzN3sw
         0uj3a/BATjKcPpShRAtcPz9Ug2WAH9XpdvZlG0JQ2NLkDAbdcK/lB+fKhlgXfJS+Dsgk
         UFPw==
X-Forwarded-Encrypted: i=1; AJvYcCUUblkUeCpNbAv5S5ouSb3MA4FT1tacAp8z6A2y2MIfYC2r2Nd5b4CQjc0j2AZwOV0kPYX16ElxRBvGw66Ph74M@lists.infradead.org, AJvYcCVCmpq6Z8xQpImjePDIzw9tat+27/tyMHak+pVXOyBLg3yJY/GlgXkXc9nn+IltgE34sJuy9vVuFGE0fcvotVc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbqFv+oUu46i1ILLBRMRitTNWxOELpm5hDt/2mo907TmuR5sIv
	JQVskb4X0VuDHQb16giyIFT/uVLjqjSCEHtlNrli8/UR9Dd7SqzH
X-Google-Smtp-Source: AGHT+IEHbN8o1/wGfS3QC6fhw9Tt8arwZjvY1P0OeSVSggmEyjLvMw+LUtcZLk6S4CuS6OGV+yobcw==
X-Received: by 2002:a05:600c:35ce:b0:423:791:f446 with SMTP id 5b1f17b1804b1-42c9f9790edmr87080565e9.7.1725908727804;
        Mon, 09 Sep 2024 12:05:27 -0700 (PDT)
Received: from [192.168.2.177] ([81.0.7.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42c9a5eed16sm125075245e9.0.2024.09.09.12.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 12:05:26 -0700 (PDT)
Message-ID: <ea168bd6-b54b-47d3-ba5d-e545a9b406c1@gmail.com>
Date: Mon, 9 Sep 2024 21:05:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ca-ES, es-ES
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek config updates for v6.12
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_120530_772284_36259B6E 
X-CRM114-Status: UNSURE (   7.61  )
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

Hi Arnd,

Please find below the one and only update to the defconfig for MediaTek.
Sorry for the delay.

Matthias

---

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ 
tags/v6.11-next-defconfig

for you to fetch changes up to e6be129f4c1865ad6985a853439a75d1ad6fad78:

   arm64: defconfig: enable mt8365 sound (2024-09-09 16:46:58 +0200)

----------------------------------------------------------------
mt8365:
- Enable audio handled by the SoC and the PMIC codec.

----------------------------------------------------------------
Alexandre Mergnat (1):
       arm64: defconfig: enable mt8365 sound

  arch/arm64/configs/defconfig | 2 ++
  1 file changed, 2 insertions(+)

