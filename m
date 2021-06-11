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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F612C48BE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 11:09:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8E1B61364
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 11:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8E1B61364
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SN3kcFq0unmevc/Zq5m/oX/l54AMcoQ1b9reWCOufbo=; b=xb/lQ4qyGBa9O6
	M98SVhh2uBf6I7Q2U/OGNXRsZQCssrvI3jsHJveFQF1Sn4LBfFXo9mq53Nz1Dib/cyKGLI/H0Xdar
	gRCGnWakYeqOfKLnbj6BxPFaT/bBD9tbM78OYtzFnViStff7FdWic2uFfXxOqpLDLmzqS36Eyg8b8
	1fDRMAIBnGaDhBXLQtxPuMu1ZFkaH5GRERyoUdy/3kvaV85Do1/CXutGboQuvGBR006Q1Wyoy1k/5
	dY3jvMSlM4da1RrbDLgz7JMdBzEQfpBcYcgapdqNyeTirTlLzj69scf6M4JWsjcH02w6/zsmcScky
	n8ymHTJ2NnHO6UndPDiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrf2W-004vNz-Ci; Fri, 11 Jun 2021 11:09:28 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrexr-004tm3-51; Fri, 11 Jun 2021 11:04:40 +0000
Received: by mail-wm1-f51.google.com with SMTP id l9so7880632wms.1;
 Fri, 11 Jun 2021 04:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=vCyIaGr9HdSXYbdEnNeROI14YOfKenOTdPKQ3oJ5BUk=;
 b=XdZXYxNXeZIqT1kDjEoWtLkZY+kjSFW/PBv77Uo5qw/D77t0eZPPt13/efx0fgi1se
 q0VGrzYdijD19X4pwI6ylZ08Iltzi++/KVJf9AfMM+uZ7jyONVtzFZjHNaZh+0FE+TY4
 VafzOnggMVmI+bNj4t0E+pt0anjcgM9tkH33W7/E9Z02jghoMybL90dBEbtyLPCgMeWg
 fpOdtFGz0OhFRVeFM2hapslXJ4UOCY4yfITnMjtedVhsnjCkdd9G39tQ48JVt9aBvneV
 FD6v+uBDfFnUyQHDXW8xBh4h6Hpqvvf/CzAw5ZDbZaD2/oA6bWUVIIsJ1CpNwtdXnVsf
 7P6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=vCyIaGr9HdSXYbdEnNeROI14YOfKenOTdPKQ3oJ5BUk=;
 b=Ph4gRevVQg5eP3NOwdfkxEOJc9dMzOPMrE04ahQshwkxfX+tuL7n99zQ/RS4MLhUO/
 IKtB6rHhwjK7S0jUZo+fn1QgU/uc8ZHs8VdglUMvzK57C0mZYt+rReXKFolDVD8KbDlQ
 AQj2FlQd5SADYGVuXElzNz/IIWTWp7acUTc3Tylb5FmYZTphbyIeaigHfXfTF/QnO17h
 77TaGJd1JAKAl447qDNS53gaYfb49oqXdTV9Ceg3wJR2Mds7PjCEdz8iuV9MPU0KwRRl
 LOq03yrzsh36JZ34+3Cd9TyREzqf3c6MpXr+orMBvddJbmPLqh6yUlRD+LwEzIOS6UH5
 5Qdw==
X-Gm-Message-State: AOAM53357VTcmiVDTvL/Sh2FObTk2QH1adH4+L948efa/RmENiVA15Je
 7tu31L+geBvWU69nz/qBStE=
X-Google-Smtp-Source: ABdhPJx7k6OC3naTAi4dvgfEX7Cu/9UQOk3TGxu+cv4XfIpS0y0ZlvA4xYVRKs1qikYJiZ0LImqcbg==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr3336364wmk.25.1623409417153; 
 Fri, 11 Jun 2021 04:03:37 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id c7sm6745205wrs.23.2021.06.11.04.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 04:03:36 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Henry Chen <henryc.chen@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Zou Wei <zou_wei@huawei.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: updates for v5.14
Message-ID: <479ec9ad-95d3-ce91-8243-63596c4c6676@gmail.com>
Date: Fri, 11 Jun 2021 13:03:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_040439_251226_E539B38A 
X-CRM114-Status: GOOD (  11.59  )
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




Please have a look at the soc driver patches for v5.14
.



Regards,


Matthias




---

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.13-next-soc

for you to fetch changes up to e88edc977b00cc467d598e4ea5091b8bb4a7f78d:

  soc: mediatek: pwrap: add pwrap driver for MT8195 SoC (2021-06-03 19:41:26 +0200)

----------------------------------------------------------------
devapc:
- add missing MODULE_DEVICE_TABLE to fix modalias

mkt-pm-domains:
- register smi node as regmap and not as syscon
- prepare-enable and unprepare-disable dependent clocks

pwrap:
- add support for MT8195

----------------------------------------------------------------
Henry Chen (2):
      dt-bindings: mediatek: add compatible for MT8195 pwrap
      soc: mediatek: pwrap: add pwrap driver for MT8195 SoC

Hsin-Yi Wang (1):
      soc: mtk-pm-domains: do not register smi node as syscon

Weiyi Lu (1):
      soc: mtk-pm-domains: Fix the clock prepared issue

Zou Wei (1):
      soc: mediatek: add missing MODULE_DEVICE_TABLE

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |  1 +
 drivers/soc/mediatek/mtk-devapc.c                  |  1 +
 drivers/soc/mediatek/mtk-pm-domains.c              | 42 +++++++++-------------
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 35 ++++++++++++++++++
 4 files changed, 53 insertions(+), 26 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
