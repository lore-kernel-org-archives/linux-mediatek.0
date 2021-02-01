Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7B4C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:54:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E276E64EA6
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E276E64EA6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=29iwnmlxx1nJzN4xrTMadJiWPXdeAszql2U6W6VNxxY=; b=zNjXYGMXZcoK/UoOra0bP0l1xd
	r005vxKkuLzwtnHBOp8jo0ieSFZ4xheQMD9Kkjw/kLbc2+HC9nnNxxGekccYcNeKl1rHGxriQRn3r
	DTOQ1KqTIZS+wo6Nsab2zrBAOVcFhCvQry8/0df9UdtsFC6sDOgYKNSYaYqTeDKNrhp9DaZdYJG2Z
	URXow4ImOvMuA+E+SxK4cAEsBHvoaNgpWDNDtINxtJMg41lkCDTmoUO+44KOdYzVKah+s6nQfGQY9
	kUstd5YJNz8qJXyw6DqQxVVUmELSbRtZ6Y3j0FvVsDPB8iEC26OtoIgSGH9mMJZq/3567HZ41za1F
	V2+n74wA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6VuG-0001yR-9r; Mon, 01 Feb 2021 09:54:04 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6VuE-0001xx-Bh; Mon, 01 Feb 2021 09:54:03 +0000
Received: by mail-wr1-x42d.google.com with SMTP id l12so15860597wry.2;
 Mon, 01 Feb 2021 01:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=d30/WqC5Sr8iUYYqfq19zQKJNZP17PGn+43sKEWUOrs=;
 b=pAJu87KNgZ/rko5hpxYAYXP6pIDxuv7dayJ4dxt8Cy0jqob30WTeRO39Oq2nt9cQpZ
 5VGDieD5mSuCkUclZu79RiBTVYfr/7WqqlnLmQEJvFFpG2EAF376UGosWKyFX1vqg9BF
 FlcZDYMnlw2KDhl8huT17Bj0rIllIlkSynRkPdOAPC1yhocCVGLiwCBtA4XyFXlfPIi+
 +IRHk/kDGXJagQFTcwGT1i7/2Ll+Tog9qT769Gwxyvlx5LV4YZhp+2umDfVaNLzY/pQG
 /5/ywA1kyxG0aiN517UmvN4prhDNrHxpuZ9qZz8pLdL8bkNe1ORtZnRWdhba1TFmyUIw
 7byA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=d30/WqC5Sr8iUYYqfq19zQKJNZP17PGn+43sKEWUOrs=;
 b=hspYALuVOeGaGtSjF8J1t2jwqxv4UxSQnWXVQtikLAwIjt1HCknIVyyih0KN79zlkC
 iI06s2H1r3sFALzNDEzL3SGXd7PY1VgsSssC9sBOu7vlOjmGxcfN4zErxZCIxvVy6fxB
 NHJNHtLSqy4UlhBQV0LKl856+1XJ5B/EpimlqDGhVdB7RnPKtKzAWLqSFkFD0XhJq2yW
 JOI2AGshOfjaRwDmMInU5inypHiLWncyA7a/efbfFlq881XG0ACmHimGEvImgnr4p2tR
 PkbibXfDaF822o79joT1aOhkzlNGbCzmtR00VIjBMBZBLUKWISLsz9KX58CpACcXybqN
 Gdfw==
X-Gm-Message-State: AOAM532t/qUnBSYQqN0Rg9L/xGl+5bDmbIlSS8XXuOVHkl/tEL1iWCyZ
 FWsDeKd2cvdW0ySTBtpfhBg=
X-Google-Smtp-Source: ABdhPJzx6z8Sox35xoBAgnXigMReq9/U391Zebk6MofU2hDdrRQ1+NkEbHV3m69ux9L1udtsw1L50w==
X-Received: by 2002:a5d:4574:: with SMTP id a20mr16892144wrc.201.1612173241221; 
 Mon, 01 Feb 2021 01:54:01 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id t17sm9190627wmi.46.2021.02.01.01.54.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 01:54:00 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: updates for v5.12
Message-ID: <5faa52c2-0ddb-b809-7444-ce6f6ff6d8ad@gmail.com>
Date: Mon, 1 Feb 2021 10:53:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_045402_478458_EB33B577 
X-CRM114-Status: GOOD (  15.47  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arnd and Olof,

Please find below the updates for the mediatek SoC drivers. The most outstanding
thing is, that we now support also the MT8167 power domains.

Regards,
Matthias

---
The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.11-next-soc

for you to fetch changes up to dd65030295e20338bbb8238454c2e9546b6e5e17:

  soc: mediatek: pm-domains: Don't print an error if child domain is deferred
(2021-01-31 15:59:16 +0100)

----------------------------------------------------------------
pm-domains:
- add support for MT8167
- add support for regulator needed by a PM domain
- make error message in deferred probe case better

cmdq-helper:
- remove arch specific flush function, use mailbox rx_callback instead

----------------------------------------------------------------
Chun-Kuang Hu (1):
      soc: mediatek: cmdq: Remove cmdq_pkt_flush()

Enric Balletbo i Serra (1):
      soc: mediatek: pm-domains: Don't print an error if child domain is deferred

Fabien Parent (2):
      dt-bindings: power: Add MT8167 power domains
      soc: mediatek: pm-domains: Add support for mt8167

Hsin-Yi Wang (2):
      dt-bindings: power: Add domain regulator supply
      soc: mediatek: pm-domains: Add domain regulator supply

 .../bindings/power/mediatek,power-controller.yaml  | 11 +++
 drivers/soc/mediatek/mt8167-pm-domains.h           | 86 ++++++++++++++++++++++
 drivers/soc/mediatek/mt8183-pm-domains.h           |  1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c             | 32 --------
 drivers/soc/mediatek/mtk-pm-domains.c              | 51 ++++++++++++-
 drivers/soc/mediatek/mtk-pm-domains.h              |  2 +
 include/dt-bindings/power/mt8167-power.h           | 17 +++++
 include/linux/soc/mediatek/infracfg.h              |  8 ++
 include/linux/soc/mediatek/mtk-cmdq.h              | 12 ---
 9 files changed, 173 insertions(+), 47 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8167-pm-domains.h
 create mode 100644 include/dt-bindings/power/mt8167-power.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
