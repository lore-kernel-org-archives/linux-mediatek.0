Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5D0C38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 18:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K1LE9PG/hhPQk5M1gnAFbkkY8T9eT40lvBxGMoA1nOE=; b=Z/CqOwkESF21dQUmVD2B2bBKLL
	ryvafRxuMttalz6IvelDAoV4yTHFRYaLCYwOJuIu5NXraBqZzmG9TWHekkBYrAxEmbQEhlh+7WmL5
	WHhMZOe3camuccKSHKDrYs97RLDbwQFXy9E1o1G/Tm4Ssri90hNfbNehklsx/B7MzsMfkGGR5kVXH
	p3DDW1cuBgRRzOPiXLVICJtuk0P+gF5g4RThyNzHsHCe1jvRP4JyYRuqtMeYjIcYfzRSAElHG1e8C
	/Naybgq38tZmZUemEC0rPhIQ6DMX4T5FPF4iW9+dPukGkh+o9rwvuQ4N+45WI8JZcSIxdyEvhtyzi
	rEnfhG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHR3-00D75S-Sw; Wed, 01 Feb 2023 18:02:17 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHQt-00D73A-Sj; Wed, 01 Feb 2023 18:02:09 +0000
Received: by mail-wm1-x32f.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so2147813wmq.0;
        Wed, 01 Feb 2023 10:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1LE9PG/hhPQk5M1gnAFbkkY8T9eT40lvBxGMoA1nOE=;
        b=fEJDwWatmPFF+U+opPCgFsR/JCUXXU6USgbFJm42DGpZxxA0p+x/rHuQen5xkw2uPv
         PXa2vYdLEMcOC5vJQ5pIyVDICnmqiEyksiQre/k6UO7IxtI6WobVbpsSBCiiEefKQRml
         649c09YH4n/6kUsPZYUJiT7TJA1fIdTtNEpv+kgQzYRiZSf3NJn4L7wAp/kIR6qeHSWh
         +i7IMyFzxa5Gb5WlL4BcZG7gGQItbwtb/6/0szI/dnJGd5Ao7Imu41l+80QRAJ7LXn98
         PiaoXNwtHBNleixQkZH3/2jBd9T/bO1E86fEM956xPV7kg4odmJMJ80RcV/a70N1Lg8m
         JNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K1LE9PG/hhPQk5M1gnAFbkkY8T9eT40lvBxGMoA1nOE=;
        b=wouhbDuNmqPn9tP0QFrISn62cByO/ICJqyWARbj5Qa8GX8nVl8WnxUxy/+t2nD0zT8
         eJlI1rGCQOrZrva5+QvQMWl21TkwhQPrxK4PXuN86hpEZKMtmDLZeTFvDqGJNyQAjHQN
         1y0ZohNJJn4GuNr4Uh+o7lvcr5anHYC9TTR29ls4+hUz6HtCT7iYJmgdZ/kYbUQrT8G+
         5+8WVkTo3UrC2gVf6eMqCgMTdORrRUhyt93pmqqoEEm/scag8KQ3FQxJt5ODn8QUrOSQ
         xHLaW7LGovA9FOueFg2Nk6MfgzoPx1GVYuwzT3sRS+wnRw2/Dsh5EhEYqZOv4+ybE8a0
         7tWg==
X-Gm-Message-State: AO0yUKVzC7bm2xw2CnQe6pmbH1MpYG7BXvZYaZvU/32CmmSy0tg7VsUd
	KXYfC48HdV2Pn1Crqv70vco=
X-Google-Smtp-Source: AK7set88hK46T6dU+hxrih4qMea7PEYKdcF1yO/BlDXzndkkA+tqsjdhEZqMYIl53qI7CspfGOXO1g==
X-Received: by 2002:a05:600c:3505:b0:3dc:2137:d67d with SMTP id h5-20020a05600c350500b003dc2137d67dmr2998250wmq.16.1675274523293;
        Wed, 01 Feb 2023 10:02:03 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p17-20020a056000019100b002bddaea7a0bsm17689163wrx.57.2023.02.01.10.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:01:57 -0800 (PST)
Message-ID: <2330b914-8a8e-8bf3-e98e-88d713c5224d@gmail.com>
Date: Wed, 1 Feb 2023 19:01:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] defconfig: mediatek updates for v6.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_100207_947550_93E64A30 
X-CRM114-Status: UNSURE (   7.87  )
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

Hi Arnd and Olof,

Please have a look at above commits for the defconfig. It basically enables 
drivers needed to boot MT8192 based boards. That's very useful for kernel-ci 
where Collabora and Nicolas has put quite some effort into.

Regards,
Matthias

---
The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.2-next-defconfig

for you to fetch changes up to 09ea26f1bf31c381faf4504774326755d8c47108:

   arm64: defconfig: Enable DMA_RESTRICTED_POOL (2023-01-31 12:28:10 +0100)

----------------------------------------------------------------
Enable config options needed to boot mt8192 based Chromebooks

----------------------------------------------------------------
Nícolas F. R. A. Prado (2):
       arm64: defconfig: Enable missing configs for mt8192-asurada
       arm64: defconfig: Enable DMA_RESTRICTED_POOL

  arch/arm64/configs/defconfig | 25 +++++++++++++++++++++++++
  1 file changed, 25 insertions(+)

