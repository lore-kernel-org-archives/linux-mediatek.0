Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0E1D15DA5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdnEF4MP3z9LmQ+YWnGEuDQLrVcu+Y+YkXjsN21Vacw=; b=SGqf88wlKE8zseDHRsZhJDBiTZ
	Wp8HHSIrd1IJx6r/+ooblA/184KmL7Bodbtal6KlPs+d0qC3fHxIeDLa7D91eXDvoU2hnpmkvwIpN
	5KyIj27zAuHk4R7PweXUYXCh2G7AiVoelnGkr4DikcwjPls0TdkNRujz3Vc7P1suRP/lvLJMulmFT
	eWDLa+QrL/6R2NLKt5sjAIQ2qEs9Pvj0RfDL5FmND0PDnrQffv9R4pmAu8BuPSxMCPf2TttZHXrmT
	1qAN6JMlhz31Xl9/AjwH/cILEySIhskbXdmckuK6QwyA6Mf2a5lpt5+SMOidmz6dCNHl3vpn1+InR
	OgLyKdrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2trz-00000007hZN-1VWX;
	Mon, 21 Oct 2024 14:58:55 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tZg-00000007e57-2G3m;
	Mon, 21 Oct 2024 14:40:01 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539f2b95775so5334526e87.1;
        Mon, 21 Oct 2024 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729521597; x=1730126397; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jdnEF4MP3z9LmQ+YWnGEuDQLrVcu+Y+YkXjsN21Vacw=;
        b=dUiXLLKRmEUZe8tCLINNIJa+KXB+/5JeBnTp2Nt4s16zRxJtC7jv++PJrpJZ3OmaOg
         RF+/XMTVL4A0rc5wmv678Nz2+z9qHr6MUm+xQfdximvqfRrcXOGoYf6p1ihFtzu4VXGK
         SSPORMCydBqeTkxpYBzXr5/7hCqTN5yC8ppqbgxcCFSa/vpu9JZYD8QoA7MKb/Z6l77K
         7K1jJpCUo7N/42DG4tG5WuVLHp6rpRU/Ez1QYYvsXEZNcs1skY3ZXEj31tswFi/bBQoR
         PHpru5YFACFhrmM3gxNK1bQnWEpf2gXtVvva2ZENiGGzCofpiHEUCqIa3KMlKnhCe9mN
         UHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729521597; x=1730126397;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdnEF4MP3z9LmQ+YWnGEuDQLrVcu+Y+YkXjsN21Vacw=;
        b=ne77rUgbOgu3zersQMreAwzn76IzrPBpgadLqkQZ/ln47NXlbpNo8RXF8PPX+GavY0
         dxiRzgyQtionT6RcEpa5TxkqBlLq1ndxwz1yUuaBSN21uHozUbOz+VaQMA1sccgrM0yd
         UKDQfgm4oaUi2I2l/8wwPERWabaJfA67Q3AS/gj5O1SD7wCzXgk+WPBtadd8GSA2YAMh
         cw1uZls6U2ZfLBN90tt3VkT3jdRkIOEFwc3T89t+J0E6ibLMO8A/ipIDW3J+Mq7w3UFu
         s5PHoCUDqE7nu4Mha29KUQv6GL3reexWq3mACXmt2geIA00s/q0O254hWVF8L9AWwJfa
         1sVw==
X-Forwarded-Encrypted: i=1; AJvYcCUtci1ro4W7aFlsq51y0v8d0HN678f/wjXgF0FI33vvaqWyyzUwwmRCLyzrIjU4oRk5c2lLoeKPrRhqo/Ub3Ag=@lists.infradead.org, AJvYcCXvcTfN5+MhKZY9fPTJX45eAHfGgUca5rAwhfo7KoRH6Q0y1B8+/xMbBgwQZUwv9coP/5dyHml+62WWyU3SiZWP@lists.infradead.org
X-Gm-Message-State: AOJu0YyK6ve7DL0l1szRyy8naR03m65TJhwAsKi73PEb8Pir00pAa+yV
	Sk6OwL8cNEbqJt2zOURrgEISWA4JSTSdiwG3liPfn3mh/+ef27xJ
X-Google-Smtp-Source: AGHT+IFL60DydO7Av+sfeNcrf7sWojkZTRh14YqR9IlCxxqK5nbQT1J0lusnZXVd2ELtK5zqE3wQSQ==
X-Received: by 2002:a05:6512:e9a:b0:535:6951:9e1c with SMTP id 2adb3069b0e04-53a15444616mr8301354e87.15.1729521596991;
        Mon, 21 Oct 2024 07:39:56 -0700 (PDT)
Received: from [10.50.4.74] ([95.183.227.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912f67e6sm209033166b.82.2024.10.21.07.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 07:39:56 -0700 (PDT)
Date: Mon, 21 Oct 2024 17:39:48 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH 4/6] mfd: mt6397: Add initial support for MT6328
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones
	<lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, jason-ch chen
	<Jason-ch.Chen@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, Flora Fu
	<flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Message-Id: <CENPLS.CE17IF58CL3J@gmail.com>
In-Reply-To: <9fbe6e8e-623a-4c8c-b6ea-c3aea8a5a56d@collabora.com>
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
	<20241018081050.23592-5-y.oudjana@protonmail.com>
	<9fbe6e8e-623a-4c8c-b6ea-c3aea8a5a56d@collabora.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_074000_602058_586F12E9 
X-CRM114-Status: GOOD (  14.78  )
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


On Mon, Oct 21 2024 at 15:24:54 +02:00:00, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Il 18/10/24 10:10, Yassine Oudjana ha scritto:
>> From: Yassine Oudjana <y.oudjana@protonmail.com>
>> 
>> The MT6328 PMIC is commonly used with the MT6735 SoC. Add initial
>> support for this PMIC.
>> 
>> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> You're sending this from another email... and you have to add or 
> change the signoff
> to the other email....

I was using that email for a while to send patches but then I started 
having issues with it so I switched to the current email. Since I 
already had the old email in a few places in MAINTAINERS and I was 
always signing off with it I kept doing so while sending with the new 
email. I had this conversation with another maintainer when I first 
switched and they suggested that I add the From tag with the same email 
as the signoff, and I've been doing that ever since and it has been 
fine.




