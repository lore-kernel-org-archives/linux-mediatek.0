Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56302EA4FD7
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 09:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhNrm0av+awaDMAZE+zf8q8wvC/W86Yd+ECEn3yTbic=; b=vXAhO5GlX7FSEUgyUdolktMfmr
	6X4Z0p6hFn98+RCUC000+okZogSrAylUZ2/1Ymws1CzO0hLvUsC04qUzSmgyvhxZiq+NVbvlCMQpt
	nrFuKq2kpRURG7BUN9O/P6cqHsZ6YohYPObYek2Xqz+j13gCAtQy1vv1dOEV9F5ijtWSkn0+EFJ5f
	XSRftmByhk8ZYJxbstbChd9o/QBe2O3jNTMniS4qsws1lStkIC4InCpOPHQzoLsja0dK12IjhaaQa
	LLRRm5O04zJWPliQurnBbF+7mAsktGB9vrIFz5OOExJi9rjJYQOb2zZODc9QQwRkKzNJNdT3Z9sE0
	sSNrZnWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuogN-00000001kH6-1i4H;
	Tue, 24 Feb 2026 09:26:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuogL-00000001kF4-1XXP
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Feb 2026 09:26:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso42201555e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Feb 2026 01:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771925175; x=1772529975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhNrm0av+awaDMAZE+zf8q8wvC/W86Yd+ECEn3yTbic=;
        b=Wyvv1dzfdCTnq9O5OYpzKlD9HZofZVnRZY58aa7sTj9aSRiUA2CESdyY78+nZV3sJA
         ZmMBX6FyX4O3MxXYGxVHecQjKToY/sh7tjwov246qXV1WtGvFK81m/tmuK6vPe7OyoUs
         fIoLuv+5FGQAGo0TY3uc6MbUqrJnQRUZCJ1K2L5rordWDhkmfrgLfgvbTqgmBP08tHPO
         hTLH0M3uFq5D019a5/JpZeQ72QSmVXwCzkXUw3cKc79pfWkGQokofs1WEdArazPUPs7J
         igoFN4ziMcZKvJM9kq90O9erbLKQwyX2jOA3SN7C4wyhv1d62adzYMU4Zf2fm952gQea
         mUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771925175; x=1772529975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MhNrm0av+awaDMAZE+zf8q8wvC/W86Yd+ECEn3yTbic=;
        b=ZYbVESF+e4kcSbpq73P8uCZ1MkWhAFYqqSRH08AqXWwn3nMLWsJz1I0OPAHzgnLxod
         vKfgVbDQsa7eI5gvHT4WgTEcOVFMQFHc/u96gGR9/WdBmr8+FY3UyEG6Ebln2MGhl28H
         G+WC1x2Vx7L3gY/RgzL9Yyfa4tS8Eddi3eXG7IPAtdjCS7s+fWRX1rUnY/LhiUD/NIFV
         SQmzTtNeTeV5gsLG0CAlX50VSy/4zR/DRw/TBmm31d19O3HCD1Wi+kb+MeLAu/+gNrIJ
         AhM/3Y5shm8RoHbh49LU83YQ7sKSkg7dbNTcsOK3HTf5f9UcuTWCuqKqeup0R7njokgm
         puZA==
X-Gm-Message-State: AOJu0Yx6WVtmZ9+y/VMV8A4HPmiIVQRCinkF3yh9xStvsKq4c+149geE
	TUwgF/bx8L+hZchN0Yxzw+ZUdaT6kQyUTDLir5FSyip8LZSwqQZg19GVLsUmQg==
X-Gm-Gg: AZuq6aIFQgfhwEf8hXBOzB32TXmqmoWECFB/y5spdRO8YZdi1P7ad/MRJ1kG0UGvWMt
	HLObw3i+hLKWf31rUegj8CmLtw+wj4b0qK+LPcX83pd3zEFO+A3qzEf+jRZhkderwYaH1M2CrG/
	apRmBi/V+dibJ9IuFgXlTuxDpvU0qB/zS0ZV6d7vJp1vbV6EE9rH7ttoc68NhH8oxUUKMyNfVw+
	brnuACN4gafqkOwAGqmnWkLI4QA4Oy+15di8WkqDhzxSmCVwoE+0lgZbE2x5Xfrzyofieoj0sj8
	ZaFh7T3tgBsUW3lHYhhft4ve+Y9Co50px4FRBjFc0S6mpoNcAUvKOQS9bgXh1jaXti5O2x0foKQ
	FMxjQ2e49PE9M8Ig2Ieu+P3OYQBUbi37sPrDnQhyYBkEL8txM+U4BHQ0RM+1mwPj1pr+Wjttacx
	Cy6DJzJ2l7QtPNQ7PoAkc=
X-Received: by 2002:a05:600c:3508:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-483a95bf3d0mr215648355e9.15.1771925174582;
        Tue, 24 Feb 2026 01:26:14 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b87db57fsm25049545e9.3.2026.02.24.01.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 01:26:14 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: Re: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add mt8516-syscfg
Date: Tue, 24 Feb 2026 09:25:23 +0000
Message-ID: <reply.1171865014.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <296b000c-5970-4668-bd42-b99ca78d598f@collabora.com>
References: <296b000c-5970-4668-bd42-b99ca78d598f@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_012617_412989_EE2605D7 
X-CRM114-Status: GOOD (  17.41  )
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

Hi, I have successfully migrated the old driver to the pinctrl-paris platform.
It turned out that 10005000 is the actual pinctrl register while 1000b000 is
only used to configure eint. Once that was clear, adapting the driver was
mostly a matter of being careful with offsets.
Also there's a couple of obvious typos in the current maps that I fixed.

Before I send in the patches I'd like a hint on how to package the changes as
I hit a small issue.

mt8167.dtsi includes mt8516.dtsi as they're very similar SoCs. They both
currently define their pinctrl node like this:

  syscfg_pctl: syscfg-pctl@10005000 {
    compatible = "syscon";
    reg = <0 0x10005000 0 0x1000>;
  };

  pio: pinctrl@1000b000 {
    [...]
    reg = <0 0x1000b000 0 0x1000>;
    mediatek,pctl-regmap = <&syscfg_pctl>;
    [...]
  }

With the paris-based driver, mt8167.dtsi changes as follows:

  pio: pinctrl@10005000 {
    [...]
    reg = <0 0x10005000 0 0x1000>, <0 0x1000b000 0 0x1000>;
    reg-names = "base", "eint";
    [...]
  }

After this change, the dtsi compiler rightly complains that the pio name is
used for two different nodes.

I am evaluating the following options:

1. I could edit the mt8516.dtsi to change its address in the name too and it
_should_ still work, but I don't have a mt8516 board to actually test it.
This however causes some dtbs warnings as the mediatek,pctl-regmap entry is
not allowed by the paris driver. Cleaning the documentation would be tricky.

2. I could use /delete-node/ in mt8167 to remove the entry coming from mt8516.
Ugly but does the job.

3. I could break the dependency of mt8167 from mt8516, this would mean
duplicating some dts nodes but might be cleaner in the end. Still it's
useful to know that those two SoC are mostly the same.

4. Lastly, I could migrate mt8516 to the paris driver too. With no board
to test it and no datasheet however that's a bit risky.

Do you have any suggestion or preference?

Also, one last small question re: documentation. Would it be better to create
a separate yaml file for this pinctrl or to add a compatible to one of the
existing ones? I am looking at mt6795-pinctrl in particular.

Thanks for your help!

