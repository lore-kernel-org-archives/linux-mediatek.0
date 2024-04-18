Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FE8C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 13:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bVyPUZzpnAkaHf5uIez6yP0jHFtLyERSTeCCJwCmVdY=; b=Mi+CDNDaGDyp6CyUhQ2ZrswWaB
	4YlpzQtlVpy6eHMrzc1Te+CKYgA5g7O4lYoI7bzrl2opl72hhWswMMjV2G5pF62gTL0ehEj0m9v62
	Gavqc89zvVdTObjIaLVH+4znQNOTBaufDT3I0PcxiBZVHCv5AwvuW0nqnjk7VWJj7TrIJ6VPhXs8r
	I0NCFuHuc83jyHzhbDMO0PXAs3JzwxnSmfnK17h2DhM6qTQUGe3/5mFmJyVFLcU69GYjH6s4jsyg5
	Adab/0Y6AqBm3d763J0alz0hbwRZ4Hf+LcRuhsF+NHydR0kkj3vRYDv9ns5Wc45ulbYKa7Fj8caT+
	/mk7jTMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRPc-00000002ISZ-2BOy;
	Thu, 18 Apr 2024 13:02:48 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRPV-00000002IOt-0BZ6
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 13:02:46 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a5557e3ebcaso148679066b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713445359; x=1714050159; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bVyPUZzpnAkaHf5uIez6yP0jHFtLyERSTeCCJwCmVdY=;
        b=uOW5p0DEMi5ucTkmTiQk5oU0AXpVjh4dpXCekFd2Cq+q2gkygfAwfeQq1NFvmECXFO
         nhaAr2zpDBJplZccKPJJyXyDE63joyszgO/BkSZQOOXlV0dgFbNOPP5bXSuCONhShaWe
         Ge38fLydcscQMDIvd2upYTFnuTtgfC9qGSERZ4azUJBPWW127Gt3OFB1uQzyfTeb6B6C
         S21lK7Ddg9EMnrVppDpI/FGvNCsIbIlfMxR90GKGtkUEatW4tPFycvrSKD5okZHXlTO2
         PMdsX0Ewgk6zHFuKBl20sNZPEYt/jHyPcicN7yxjtRvdofaJkBjxyvJnx3BcQH1+OshT
         vAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713445359; x=1714050159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bVyPUZzpnAkaHf5uIez6yP0jHFtLyERSTeCCJwCmVdY=;
        b=CF7o4FErDvydxJ+X7d/DMaqVEdjW0GXRYNbjZOGYULuvz2WS/rWfAZ44zFhjJbxWV8
         dxVb5UUJJDwAJYiQH7bw7ZYilLBzaOa5BiDWI3BGz2fnGTiruqcoSTWoJKLY8MuuhDk/
         1BCkCezdFmlBGNiJWF7Pcnqenc8IT45WiVZtYur56dcz9dbZDTmJKHOItkiZaGATQUuU
         zqkFxWR9wvuYP9JBVs2BLssEGdG5JQcVbpq/I1uR4Aw2Y5ebkO6VmQ9MZm0ek4qRUBAW
         jUppv8s8yLsQWL9+exMSoYXyRT1shWuO4SW5dF1VklzglAuS8XIu9+iELE/TnPaJlTwv
         4akQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+FgF/rsYqSROctcQugXIHdESQgnrysWz2QSC/fYfU09Cxna7Ulq2w4SQj6s+RL9MAWDsdF8Gjjn67KVxOt29Xus/VQlTzUvDl1v3T3YjbyOzm
X-Gm-Message-State: AOJu0Yxvbbq/bwxz/TLfxkgNU9vM/CMd0Vo171QTOx0QQJPMSPX2/+nZ
	TczBfkeMerz9bu0UtLnglvOANMFNQUAaZWnvZBdGjkNbQAdCwemOtW+6V30SCU8=
X-Google-Smtp-Source: AGHT+IH0N89eEQyHSFCXfRykybkZDOZuDp2tJqO99tXBPvhuSPwv2IlxEhe/EsNO/07OXybXEnBOWw==
X-Received: by 2002:a17:907:36c1:b0:a55:6135:7ab7 with SMTP id bj1-20020a17090736c100b00a5561357ab7mr2297200ejc.6.1713445359195;
        Thu, 18 Apr 2024 06:02:39 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id w23-20020a170907271700b00a556f2f18d6sm794633ejk.57.2024.04.18.06.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 06:02:38 -0700 (PDT)
Message-ID: <57d55af9-33d1-45de-b8e2-ff9ab2e74e4f@baylibre.com>
Date: Thu, 18 Apr 2024 15:02:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/18] arm64: dts: mediatek: add display support for
 mt8365-evk
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jitao Shi <jitao.shi@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-18-33ce8864b227@baylibre.com>
 <ee8d0a32-b4fb-4fc4-83b2-300f7453d95f@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <ee8d0a32-b4fb-4fc4-83b2-300f7453d95f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_060241_510438_56F5CD70 
X-CRM114-Status: UNSURE (   7.89  )
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



On 17/04/2024 12:27, AngeloGioacchino Del Regno wrote:
> 
>> +        irq_ite_pins {
> 
> Did you run dtbs_check?!? :-)

Yes without error, here my command:
dt-validate -s Documentation/devicetree/bindings arch/arm64/boot/dts/mediatek/mt8365-evk.dtb

Also I've done a "make dtbs_check" just to be sure, nothing wrong on mt8365-evk.dtb.

For you, what is the issue please ?

-- 
Regards,
Alexandre

