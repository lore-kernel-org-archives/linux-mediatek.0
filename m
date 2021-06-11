Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2672C48BD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 11:08:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FCC761001
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 11:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FCC761001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z/is6r8V79ltAvRD0QaKaOv0I40tXdTjNuVpY/0CCAM=; b=Jsps37l/Jmbvq3
	lj099GO1m1fxyZnP0z4RS+7kKbDkCAwpZUuXjzQmnXQfznLPh4rua3dde8eRuIBBYYZI3uwCpnNas
	A4BxppNnvvxBsARDczW2sNd6re6VSuuSJKafMvBJUQTGesOBcEHt6Tq5WfsAnUHNXnx/UlHRCz+4l
	aRjkO0CUpjZ9ri2fZkSxYvA+0+vL1mJhmi69zJmzwSJw0I0tX3SeHw/kkpRNoVg1Yh/rR8fX0EijI
	DV7V2dYXaupXi3BtGiYbkm66C3DMm3ugzMQHRgahdm4SWgr855FzSCLK4yxmVk9uKu5sdci+PDznG
	oFSTQTVhHmPZZYCST2yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrf0s-004upr-4O; Fri, 11 Jun 2021 11:07:46 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrexF-004tYi-A9; Fri, 11 Jun 2021 11:04:02 +0000
Received: by mail-wr1-x42d.google.com with SMTP id o3so5602099wri.8;
 Fri, 11 Jun 2021 04:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=MT73zUtjj68+uwBZNhc5O5dywAeEwkLpcCZIt6YIhUY=;
 b=RouWaMJB15WJr8pPxfhTQcAgQfyT6hQFWIVK3Ut7Pza3dUsHd1ZbA7A5kCqOexZcuC
 cmEVuZ5zoifeD29MtZDeZHFRGnDxre6sc4vkqZaXkgRhYb/cAoIDua5i4TCNpE1XEVSr
 qH4H9LDBzUa2QHgxHUBZ3OHl5l+j3qCmymwoiUHEBWy+Y5UysDxdQ3snFX2mjUqk9iLh
 D+Hacoan2AcmhYybxVQLi/zj9qjvgxvqAr6Xr2jYMm9duEARvKh0KGMeppPulz94yvqT
 QQFfJXY+6B2L4Uov90jAEML7Yev+ISujQUQJoHpHtMk4gWPRXiFJYGC6JcGKUQbQFgdN
 C8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=MT73zUtjj68+uwBZNhc5O5dywAeEwkLpcCZIt6YIhUY=;
 b=ej+n3ggmokI6rwO9Jg1uRKJ1Jz8mV2dcvf1M/IrXFio+o7Ct2NzSizRYsZIBzVvyI4
 zslOZh+cYnuinpxU7g8N3GQAgVNxGg1DqXz4qUfbtlCcERU6+6MQaffwmT2uSEVDMY59
 WfZTvJRoyn73sB/O2MNzIvL5koNA76vdxsiRZH1sNlAxbrw6H87sLw3aEXf9wh3j6jy3
 p3+sPlktjHsoyuc8X6u2iIWu7gIsjQkk33bj+LY+lcqRyliUrAf2o3PyIZFe9MfWKHW7
 yD10q8ZxuX7Z8R90SSSXhKFH2Cf3FakfFHFa+HHIuCmVE19l47Ss+OKCVMmuZ5XNoT3f
 tIiw==
X-Gm-Message-State: AOAM530V1XI4CnbOi1nZS8P4+xuswhUfWssHJGZk9vy2LwnMpdCedrws
 rsjzMyNO9GuF90MTZSlsOoWoxNpWzZ9+1Q==
X-Google-Smtp-Source: ABdhPJzNRH15C/Rt55bk/ej3Fvi4o/EwrYfsEtCgwWJJHD5yiDmyp+zlrbscjMOivJzV0nEAEvgiHw==
X-Received: by 2002:adf:8bc9:: with SMTP id w9mr3322743wra.378.1623409439399; 
 Fri, 11 Jun 2021 04:03:59 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id k36sm5506155wms.30.2021.06.11.04.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 04:03:59 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: defconfig: mediatek updates for v5.14
Message-ID: <ad6f7f4e-7e4d-08b9-8781-71bd78444929@gmail.com>
Date: Fri, 11 Jun 2021 13:03:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_040401_390039_A01E5A82 
X-CRM114-Status: GOOD (  11.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arnd and Olof,

Please have a look at the defconfig patches for v5.14

Regards,
Matthias

---
The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.13-next-defconfig

for you to fetch changes up to 6c2cfc947607dc8de338377479939893f1288f37:

  arm64: defconfig: Allow Mediatek boards to boot from the mmc (2021-05-14
09:41:28 +0200)

----------------------------------------------------------------
- Delete MTK_PMIC_WRAP added twice.
- Set MMC_MTK as built-in to be able to boot from MMC device.

----------------------------------------------------------------
Enric Balletbo i Serra (2):
      arm64: defconfig: Do not override the MTK_PMIC_WRAP symbol
      arm64: defconfig: Allow Mediatek boards to boot from the mmc

 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
