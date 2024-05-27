Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1329C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 08:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7yJQzgp3LG9+SqLWr6zTQsXw6qv741M/Rp6MjNbH1tc=; b=gXE78NQueFVjr6uorEVviKOMpq
	m5pOf3alPuqfGaqiOY5h9kzQPuGiegIIIuho2vokYmDhy2E+9oWdOZ5jQ1ICt11TpCIqYLhrfsWZ/
	foM1c4cUCXAcoWzqi9xEZaIvvhCvkf1EsbdhvQRRvJu0ZPf6KXyhWhMmNoh7XFhGVcrBhQ8RgnhRq
	qrJO8Hd88zhk1DG3mTI5Z2BvWZpmojAizoLXNaElbeqbZmAE6L6+l/uDtLvCII5MIi++1Uoogcthv
	OMDlkqQ3avWtIM/TmLPxm34BHKUPEyorYaVyJbq+L9gNBKgFqv046xQFdnURE9cNzkHa/gBn3s4bm
	xDDo6Uqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBVrx-0000000EGOv-3Tr3;
	Mon, 27 May 2024 08:38:13 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBVrq-0000000EGJv-0mwy
	for linux-mediatek@lists.infradead.org;
	Mon, 27 May 2024 08:38:09 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5786988ae9bso2211420a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 May 2024 01:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716799083; x=1717403883; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7yJQzgp3LG9+SqLWr6zTQsXw6qv741M/Rp6MjNbH1tc=;
        b=yB4FicwsxMHwjz0F/K55t5RVzEXrl16p58nYX2a1j0+ElP7NxSEhQw/T38hzF88o34
         pKOXyWXruDzLn1WVuQdDBSwzrXqTeDnLhsQdqMhDdPOQzqd3Uoo87pPKM9ZkVgkoOuRQ
         kdF51yoC/69+3KeEKFaJ+geZKJ7tvkjqQttef8WQ3+hsugcPulxeXDg/4J5s9jLn81er
         OD7t7JCTWtnH73H4LrqREmC4hpPE9QMci7j7m69CtdWoF721ZKmG1JL/xJ/E2J9arUEL
         GidDcVolcKrU50YmqvP3YvsvgIvceiioiS++bm/R+4oupMfBZtDvP367TNp6bwp26DEl
         TxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799083; x=1717403883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7yJQzgp3LG9+SqLWr6zTQsXw6qv741M/Rp6MjNbH1tc=;
        b=LwIhUAMRBX4wPSlc2jQTj0T6OAGvh0Ih8Z5fUPQA0AxorESBo91ISbbfIlNyjSHbyh
         jH6TKKYOcs716VukEdY+Cd/yWtjSjYemkjJXpGHA124yOYzbjqJCvR6uYh+HgFrg+p/K
         yHQy2OKTxgiVsoEcmqNbp3hHoyoLDyqy97G/rXK2AXR0wKJuwNVO/gtPZRavekeoJDvt
         YxBG1ojoxXH+z7fj5eC2DYC1KjaV8xkT/yHb9NUXdrv2wvKSU/0Azr6utJ+gVvZlEcOL
         SJiD4yjOkoZZBzcGlbLnZidoQuRP5g2+DMwknl8jkTU7FWwok8hp9RF1ZF+gCwiwcB89
         HPfA==
X-Forwarded-Encrypted: i=1; AJvYcCU+cMdS6w54LnKqcUnBz71ToUEBpzFKJGAQ+OZaR8P4XR3vtHPKeBIG6OS9vXQs1EHAOgfC0AWmlHZcZ9ElIyJc8QVwvL7Z9l5mJQXY88OQccXP
X-Gm-Message-State: AOJu0YyfgR9jK/rV1AZm7h6guRMrY1AI4MqR+GNj2ILz7oWywq4PFljZ
	tqdZ1ZsnckPSvei7e3FTrY6Hzjch07QA+5FQzA0uwI1rA7ssCcIFmAv+ZN9kwlY=
X-Google-Smtp-Source: AGHT+IH/iXqC+L+EflTfnXDHtTdQkCcD9jw5SHF9Siu1D6pQ5lqCI6PA/ta8ZY/9nEeZbep4X6uIoQ==
X-Received: by 2002:a50:cb8c:0:b0:579:c4cd:735d with SMTP id 4fb4d7f45d1cf-579c4cd75d9mr2691205a12.11.1716799083189;
        Mon, 27 May 2024 01:38:03 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5785233bb04sm5483333a12.12.2024.05.27.01.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 01:38:02 -0700 (PDT)
Message-ID: <455d12a8-fefe-4593-97a9-4cbdc81b61a7@baylibre.com>
Date: Mon, 27 May 2024 10:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] Mediatek thermal sensor driver support for MT8186
 and MT8188
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Nicolas Pitre <npitre@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
 <238nnn48-0o7r-22q2-2rpo-s3n7n62pn2q4@onlyvoer.pbz>
 <ZlDMNkdE2jmFgD8B@shell.armlinux.org.uk>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <ZlDMNkdE2jmFgD8B@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_013806_447000_B6BF7B59 
X-CRM114-Status: GOOD (  12.77  )
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

On 5/24/24 19:19, Russell King (Oracle) wrote:
> On Fri, May 24, 2024 at 01:04:38PM -0400, Nicolas Pitre wrote:
>> On Fri, 24 May 2024, Julien Panis wrote:
>>
>>> [RFC] When PATCH 1/6 and 2/6 are squashed, checkpatch raises this WARNING:
>>> "DT binding docs and includes should be a separate patch." That's why I
>>> split them in this v5. The problem is that the driver can't be compiled
>>> any more at PATCH 1/6. It needs PATCH 2/6 to be compiled. Should the
>>> checkpatch warning be ignored here ? Should I finally squash PATCH 1/6
>>> and PATCH 2/6 ?
>> IMHO it might be preferable to preserve successful compilation across
>> bisection than to appeal to checkpatch in this case.
> Or, patch 1 adds the new definitions, subsequent patches convert the
> users, and the last patch removes the old, now unused, definitions.
>

Thanks for this suggestion. I'll do something like that in next version.

