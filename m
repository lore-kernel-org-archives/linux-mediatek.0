Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B33C77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 09:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A9qtR8MfLyUro92cvio9eras0UzllKy7Sr+yZKv+eGI=; b=LOXiCx7TX3So41YKYlLTKu++v2
	5qf4XbyrRr0Tbe8kM1+NbOXD9+V33kHpc7mSSKHfgyrorfxjNU6zq/SK7XvDrYqeTOX0l+iiOUZbd
	gnPyH5Rfbu6CzZyiGJIO+pDFrdThremXSzMz9+E5G24vpMZRK+FYsEed0rL2iJau0gKnqs7LISAfb
	Da1CB8WsPl68bfT+I6a5TB0Pd/5IDr9PN4DEaNFs+Swz9d/Wd3hIffbaPpmdHZTg2koOQzd6wbC2g
	v1853r5q/E6m+8vLo6HOjuF9FW9L6y54XAKi48cNPLRAJutFSfVHNQp9AO5TOp2AYgMidHlcBV5UX
	Bd584RVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnFz1-008uR4-2u;
	Fri, 14 Apr 2023 09:44:43 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnFyz-008uPu-19
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 09:44:42 +0000
Received: by mail-vs1-xe33.google.com with SMTP id i20so1739060vss.5
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 02:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681465479; x=1684057479;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A9qtR8MfLyUro92cvio9eras0UzllKy7Sr+yZKv+eGI=;
        b=nhby+tqpg7YJ3N4OPK8KreZkbQg6ksdB/JTX68tRFhDyAoY8mLfE8+n4fUhA1he3SH
         syCBC1bzBBLpYlc3A6zC35W3pKoXnhoZAkQFOHA/EBh8KWjR/hpHC7ViDP61qU78nVsA
         X1p10pbqhmbWwu2QEn9P5BQVleAflNQwm7V1IzntisfmnxN/M7cEMZCwJVQ9TMocTEHo
         V9MmnYyG91LKOtQl49ZnItrsYJRFZY45kRDhK9g6hVxsu0PsjFTlEPrINxJbMYMkp/gO
         2r+Cldw2TYaPuiQZ++ihVAXcfiReaeZ1SA6hYyME9IASPr7mnD1wwXGdLfp1kA9c/Llt
         V31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681465479; x=1684057479;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A9qtR8MfLyUro92cvio9eras0UzllKy7Sr+yZKv+eGI=;
        b=NFSOy0Z/ILtr3Xu3PIlwBRae8Y+agoqVjyrmSBvQ+Cg7XPgzoxLqC7hpwTiIWidE5L
         JCqvxubbNSXvNsr4nVaG8gLU/UGzX2DsVuOFRnGOggFBRc/mG4PGK6a9CujhqcTb68fB
         U8XHyXyAaka8D9N4y3ayswN7HWAW4jJuTJuBhZnJC2EtcVFcETWTgy5wC1N0p5O2mlAQ
         dEy66agiGd0T/zIOWKpJk5FQ61pCwgEZxyjP9Wn44P3G8Msfyq9w1Aba3PQjVRAoI/mD
         KeY0QHBi9pPzECPxeJrC325Z0KlylhcSr0x7GFjyiJqq45f8Pwct8G/vLvYfmFNm3XsG
         vqCQ==
X-Gm-Message-State: AAQBX9f3UD+J3I4/QmsP3SvvsyiDzR0ZYMZ4M/ceUzIH1+laPvJKcHAS
	mYYsIbpOcmzxDd1TzwFcw3bVmkRd8jZ0IN/ZL/a8BQ==
X-Google-Smtp-Source: AKy350bKBwBmi6cLGqm9/lBs1aIURMXTFZrrJBXiy+LtGEE/iALnQZQfMf/HVW2YEzuMSo6l8V/a9yUF8SDrFi8kr64=
X-Received: by 2002:a67:cb8d:0:b0:42e:3b77:b77 with SMTP id
 h13-20020a67cb8d000000b0042e3b770b77mr1289462vsl.1.1681465478942; Fri, 14 Apr
 2023 02:44:38 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 14 Apr 2023 15:14:27 +0530
Message-ID: <CA+G9fYu4o0-ZKSthi7kdCjz_kFazZS-rn17Z2NPz3=1Oayr9cw@mail.gmail.com>
Subject: next: allmodconfig: phy-mtk-hdmi-mt8195.c:298:6: error: variable
 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	llvm@lists.linux.dev, linux-phy@lists.infradead.org, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>
Cc: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>, Kishon <kishon@ti.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Netdev <netdev@vger.kernel.org>, 
	chunfeng.yun@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_024441_405646_CE2C34E8 
X-CRM114-Status: UNSURE (   1.99  )
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

Following build warnings / errors noticed while building allmodconfig for arm64
with clang-16 on Linux next-20230414.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
'ret' is uninitialized when used here [-Werror,-Wuninitialized]
        if (ret)
            ^~~
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize
the variable 'ret' to silence this warning
        int i, ret;
                  ^
                   = 0
1 error generated.


--
Linaro LKFT
https://lkft.linaro.org

