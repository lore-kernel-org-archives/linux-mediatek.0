Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4199DC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 20:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOVeDn8sGMiyUFHnj/niym7+yJLePku8ZuvCvpjBjFA=; b=VGS651g/SEsNQIxkjbNjIYwgkf
	kJ8BSDHrda1z69JdiGzw4IIbkohabJoj9EFfY1GamVUm9QmSyHR75u8OYAolhLA5ZbKYaCPSlGLNu
	C1avO4ACphpc7IjbEh94F+ZXBqpUROs/vmdaOMn19wjzZgyr3ds0nX0BpzFBuB08MAi+6pZ/Crah4
	LxVL3QeB2dwVAyYND+I+MbHgu8AB80dupw7WkgOxhr+/9yuJ8lW7w9C3knl7e2QHSBs0uPpkcMoVq
	oecIwQ7fOEClw/bfqeTWDfRgzG45b70qsKV5UgkligiEq0WGl1GJUrELTSYsR+zIm4quI6hgRP1Zf
	EGIfqQvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjnJd-002p27-26;
	Tue, 04 Apr 2023 20:31:41 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjnJa-002p12-2a
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Apr 2023 20:31:40 +0000
Received: by mail-pj1-x102e.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so37396607pjp.1
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Apr 2023 13:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680640295;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EOVeDn8sGMiyUFHnj/niym7+yJLePku8ZuvCvpjBjFA=;
        b=d2PfSMqYfgsZroD2KnzQMRj0RMGsWfZOj8Pbma82DQC/fdoAL7fp4u3QRYiYy0KsxD
         7J2e/+s31Z1QQnI/qyqshLlDgu+gpXILHPK0Jdtbp3wfz5cn4ytd1IDNsyWG6Zs1qD9b
         WATap2+gj3/N62oIZ6s5sB34NSYCjItBlYteXFqgR861/Fh/7zmJzj7RjnwFpMvGYD+s
         TwK/P/yR8kLl7NVvE9VrRC860srGxgFh4X0TVV1Q2pUt3Ikfyq1u1wpY/jIXj2TyS7JN
         gNzlm+DEd4jK9eCkoSfSMTV0tHcgHYjdqxZik2z7GkUwOBDBEZeyDropDBoOwbivkXiD
         tIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680640295;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EOVeDn8sGMiyUFHnj/niym7+yJLePku8ZuvCvpjBjFA=;
        b=Q6z1SscFIaGUmzRtD/A2SyAaIL7olcszFkehMZA8lF4IL4wxSHOD0fXCMRQjzU4PIo
         J+IV0wqfCulySLiiojDW42arx1k3S6c0GUyW+TvH8EAVtTlQGLvcjVWMpxJb9Bmdq9t7
         6zkxBt5kxvAbkITSU9ht5ihj8yKeW56ep2hKYM8WBSvcLK0OAqV2KD4Bvmh1fv89kiix
         CY5tVG581cVSA/wIlXYKTi++jWYtDtCl5g0//45tLpmCEc9dZQu+vT0PVFLokRWYYO1c
         psScVbRFCXGOPQXg2NowJ0p2L3YK1XOxJsjZLFlnj6jkeVdlCnNZCtWD2/zixA+q2oLD
         pJcQ==
X-Gm-Message-State: AAQBX9e6xyLdSAgrWHlbIMDYi6gwEH+AQ0K2DGs+3Rr82iYIeS/FufXY
	8B/WGTapfiiXjEducesrSevJQQ==
X-Google-Smtp-Source: AKy350YCpPag6hyvNnZwcBiqsXWIy1NnNsjRyvNEOMoKbr9kgeRuFVAQ98Nq/oUQ25+hXB9CQPoU3Q==
X-Received: by 2002:a17:90b:3ece:b0:22c:6d7c:c521 with SMTP id rm14-20020a17090b3ece00b0022c6d7cc521mr4045682pjb.45.1680640294866;
        Tue, 04 Apr 2023 13:31:34 -0700 (PDT)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id jm21-20020a17090304d500b001a1fe42a141sm8706184plb.115.2023.04.04.13.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 13:31:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin
 Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Bernhard =?utf-8?Q?Rosenkr=C3=A4n?=
 =?utf-8?Q?zer?=
 <bero@baylibre.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, Alexandre Bailon
 <abailon@baylibre.com>, Fabien Parent <fparent@baylibre.com>, Amjad
 Ouled-Ameur <aouledameur@baylibre.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 00/11] Improve the MT8365 SoC and EVK board support
In-Reply-To: <CAFGrd9qLzcDJO_Fk_-B6XYuuxQzQoYLXmdp0Qj1Tszr0-sqNgw@mail.gmail.com>
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
 <7hy1ncydtc.fsf@baylibre.com>
 <CAFGrd9rKy9a4bUf1dkUtTogtWPFr5eu3jcsdaixi3hs_dWMwrg@mail.gmail.com>
 <CAFGrd9qLzcDJO_Fk_-B6XYuuxQzQoYLXmdp0Qj1Tszr0-sqNgw@mail.gmail.com>
Date: Tue, 04 Apr 2023 13:31:33 -0700
Message-ID: <7hr0szwfru.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_133138_839642_41C2F8B0 
X-CRM114-Status: UNSURE (   9.53  )
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

Alexandre Mergnat <amergnat@baylibre.com> writes:

> Here a build-able & working branch with dependencies:
> https://gitlab.baylibre.com/baylibre/mediatek/bsp/linux/-/commits/amergnat/i350-evk-board-support

Thanks for a branch with all the dependencies.

This branch builds & boots, but crashes because in the upstream default
defconfig, the CPUfreq driver is built-in and the regulator that it
depends on is not enabled.

Changing CPUfreq to be modular with CONFIG_ARM_MEDIATEK_CPUFREQ=m
allowed me to boot to a shell on mt8365-evk.

This suggests that this series needs some defconfig patches to enable
the new features, preferably as modules.

It's probably OK that the defconfig patch(es) come as a separate series,
but not sure what Matthias' preferences are here.

Kevin


