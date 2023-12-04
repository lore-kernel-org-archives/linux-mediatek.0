Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB48C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IAe9GaCJ0H5vY1B6g7SXdKDaasEFIEo0v3Vb6EsU02M=; b=Yn5VmN81/7YhPuahIgW9GlEtcj
	iIJyQThSykgjnpFL6qGBOJ5tJa27tpTQZ9jP+Okl1SZLMyu/i0ln71hfOBaAZJ0/hOIp7bH0OLH1T
	gHetbF9yk3JBTxLJurhB6aiHTN4XOgVdcZU7HPS7oe7IWKIaQ4491GV45ESVlyYX1Dp7Id9p0DclR
	RwyrLMk/9npmFKMjHLcFsbw5pRWyZkjcQvmFPgwDm3X2eMC66FjHyK23FhveIqFzUGxKXnd1HgWOn
	0Kr44Ebinni2iAtkU/f1jlEGY80viV7oCUAQrv3E3oA4LD3zi1HxqaQtMjzimpf/ioKlTHA7ioAxv
	ODEWugbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA7kr-003oM4-19;
	Mon, 04 Dec 2023 12:08:53 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA7ko-003oIH-12
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 12:08:51 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6d81faeefc4so2372877a34.2
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 04:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701691727; x=1702296527; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IAe9GaCJ0H5vY1B6g7SXdKDaasEFIEo0v3Vb6EsU02M=;
        b=Enz3rD5N/3nY7N+cECcLFJ1K+ac8v0j6ELFAlCuJiSAniBlqbXQIhJ2314Zl288XrM
         9lYAlor6WgQXVBMwXo6wSP8DnWG15J5pnpBR8V5AFKcMhnoxJjFJc3U2JPmPF5AI8llu
         09lG7pF/VnnM4T+rYLw3cUONuzXi82hWu7GBL1faDy01djJsTRYEEf1biWUU4I0q7Xcm
         IEOFO8uHA7LcO02UeSifY9g3kLu//PKvc9urafDbRe2KzCb2L9sukBw/TbodDgtS+CIg
         Arsk/zimVTzkuZy8An3PXvZrNgadzpNV/6oY7s+NoJ/vRMbhpgVxgYic+3FmregTi27k
         vypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701691727; x=1702296527;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IAe9GaCJ0H5vY1B6g7SXdKDaasEFIEo0v3Vb6EsU02M=;
        b=nXKPiMF2AXqybnrAqyzQBoR/LdhAbadzkSVfkH/nJxnU1dAGTUEGvtBbehrK8Sicsr
         IfeWtOuppvFou47INBWt0lFavgslZKGfm6IeJaXV8PwPJgy3FI5saGqgSivzJs5qGRNO
         B6dCMNeQU9+IsiJBQqScHmdjRZ4HFWUbj1j8wpWJCidHcSTfGCtEcc4frTbqrzM2pQme
         nSYJDUVD54LFVdmrGFh399M2+pPhlStfpB5IRPqDbZQo1NdqOzjxmrM1u7X/eDc0sN6l
         j7nMtce0WzZHqLWbDRalJk7T0IkXsJ7dxEAsyFh92qeWitDRKLt2AIpFBe6MhMxChQjK
         wTbg==
X-Gm-Message-State: AOJu0YyioaNT35DK3iaKGGXVYi2jSRaTj6ot+n+c9qgjPXahkp8Vgw+9
	5AspRSShjjW3G+HQ5haNan5fMydTDPcjuAsvjNyt/g==
X-Google-Smtp-Source: AGHT+IGpxhG9ncEHtpz4tZmgtmPIk7IOrxR6wBSf/VSlVIlLP3HqVCGl9n1/Gfb0hG0y3KjTRRQ8IEEqRzi+yhZ9cYg=
X-Received: by 2002:a9d:75cc:0:b0:6d9:9e2f:e743 with SMTP id
 c12-20020a9d75cc000000b006d99e2fe743mr1360919otl.16.1701691727048; Mon, 04
 Dec 2023 04:08:47 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 4 Dec 2023 17:38:36 +0530
Message-ID: <CA+G9fYs1g2Pt=DQeaJC+3ZJTeMwKAs9GuGJ9k6BcwKwEXcn5kQ@mail.gmail.com>
Subject: arm: gcc-8: drivers/pinctrl/mediatek/../core.h:211:21: error:
 initializer element is not constant (struct group_desc)
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, sean.wang@kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Russell King - ARM Linux <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_040850_357233_D56408C6 
X-CRM114-Status: UNSURE (   5.32  )
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

Following build errors noticed on Linux next-20231204 tag with gcc-8 toolchain
for arm and arm64.

## Test Regressions (compared to next-20231201)
* arm, build
  - gcc-8-defconfig

* arm64, build
  - gcc-8-defconfig

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log arm and arm64:
------------
In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:21,
                 from drivers/pinctrl/mediatek/pinctrl-mt7623.c:11:
drivers/pinctrl/mediatek/../core.h:211:21: error: initializer element
is not constant
 (struct group_desc) {      \
                     ^

Links:
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2Z43zPIMN6vxVKd9rKJFdOKXpox/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231204/testrun/21472198/suite/build/test/gcc-8-defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231204/testrun/21472585/suite/build/test/gcc-8-defconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231204/testrun/21472800/suite/build/test/gcc-8-defconfig/history/

Steps to reproduce:
---------------
# tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig defconfig



--
Linaro LKFT
https://lkft.linaro.org

