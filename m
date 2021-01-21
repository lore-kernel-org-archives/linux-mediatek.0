Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BFBC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:42:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DFA4206FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DFA4206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=teWmkdc94heZZYG4s47JMCUcjEX6HlujvlrP1c+/nA8=; b=PJSGvREIFeUqFF5D+1QEiPxYXk
	r+FUR0JJuFtYPr+Q0F9RdIZM71A+LGGRqO6b7CzVK9axQ3vsZl0hr7OiEaCkQ3827Xc6hgucMibcr
	UFvsKg9UERrq0x6nQN12r4IAvCkba+seqB78cYBUcpGhRflO9z9Vq3xCMmADXsvx9bQ9NlV8sG/tV
	4VXpvDy/nxjd1mdfVKIM5UwZTJSnyi/FqCNQlylVBBrN0lKejfJu2alRlkXBZqxHa98RGzmDn5cb5
	OZgUWZE07bQUSNkkA+P1tZBwS/S8IYEdtq+U1RjaCQlsr6mmw0OO5ABMYsShubQHAKkIliPdTjXjW
	zYFfcPew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2RnF-0007N5-B8; Thu, 21 Jan 2021 04:42:01 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2RnB-0007LF-5q; Thu, 21 Jan 2021 04:41:58 +0000
Received: by mail-pl1-x62b.google.com with SMTP id e9so600081plh.3;
 Wed, 20 Jan 2021 20:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G6oushXlU8/JCreEqr43J1ZyQ49iIsjnXql3SR0zTgQ=;
 b=V4HmS+pH+pLJFk26hyU66R+rmnP2beqGFGjqdPk9FuWtDmlJDWr4kZH98+KgHhv7Ga
 RPA7Mr2b3Nijoh13iOBPH9ro83W5pkA7ZlLMsPBNE8S8zTHhBhijZzCLCRNvLVRiSTxw
 jcg7IZQ9ng670NwwC94FORu2Z9248Zky+xIV/Dmm5nah8Dq9CNY777NldJlsRiFJdvBE
 MRcZ1sciB9airBCKh480cCWUg9vvQ/aesoYCNey5/0dZ68byYdgEcjpAtCfA0Vs59v5Q
 /YFN7Me1W/MJ7PbfaoEByS8H7wu/X7IubsM2b1yVsble0T92RSA+swdomsE7WMLuY5vd
 SO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G6oushXlU8/JCreEqr43J1ZyQ49iIsjnXql3SR0zTgQ=;
 b=dgF3/Ke1F/aXXiK6zGhLBQqJVN58Yc9zG8zv9xW9e5y0XeFONovBqs2tOPolmDlwIu
 dBHy0KhZZnBLqFEYrWrybSmWsktlWSeRwH2LJOhWl565k+H2FU8vHRC+FaJ69KvSdn5a
 p0q6pUYxuW3Jy9gy2/ThlGNxIWELdeyq/zPFtxDh/x8+8+46oeGKLFRAqxfcUW46ANlI
 Rn6n0Tz3ZahibLnIy+gyaqLYmEnq2C3UX51mvNXvHSVEjjaXV0CLg+N5WCX/l46bc4Cc
 XxX9oqKf62yZj6MPonebuORU05IChHNu4SnMyev8iLcb/SzM/EUR/zFBZZyXe1gQsEbV
 SHGg==
X-Gm-Message-State: AOAM5322NlXURHF5fNYmo7irq5nDCmn5GNF0YrK5uROEK8Tht121D7zC
 tZ7eIgL5a+WOS74RHaI+xXM3Ubeclu8=
X-Google-Smtp-Source: ABdhPJyFD6wnC1KYu+9K6XpUwh/1p7UXubKQt0iWRFV1Dfffo1znTuF53UVoEutnmzvIJRV+LiSs/g==
X-Received: by 2002:a17:902:a501:b029:dc:3e1d:4ddb with SMTP id
 s1-20020a170902a501b02900dc3e1d4ddbmr13233027plq.60.1611204114069; 
 Wed, 20 Jan 2021 20:41:54 -0800 (PST)
Received: from localhost.localdomain ([49.207.210.174])
 by smtp.gmail.com with ESMTPSA id jx15sm3916014pjb.17.2021.01.20.20.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 20:41:53 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v4 00/19]crypto: convert tasklets to use new tasklet_setup
 API()
Date: Thu, 21 Jan 2021 10:11:07 +0530
Message-Id: <20210121044126.152274-1-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_234157_310198_B93747B5 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: giovanni.cabiddu@intel.com, alexandre.belloni@bootlin.com,
 aymen.sghaier@nxp.com, heiko@sntech.de, qat-linux@intel.com,
 jamie@jamieiles.com, jesper.nilsson@axis.com,
 linux-samsung-soc@vger.kernel.org, horia.geanta@nxp.com,
 k.konieczny@samsung.com, schalla@marvell.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, ludovic.desroches@microchip.com,
 thomas.lendacky@amd.com, arno@natisbad.org, vz@mleia.com, gilad@benyossef.com,
 gcherian@marvell.com, linux-mediatek@lists.infradead.org,
 lars.persson@axis.com, matthias.bgg@gmail.com,
 Allen Pais <apais@linux.microsoft.com>, john.allen@amd.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 linux-crypto@vger.kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Allen Pais <apais@linux.microsoft.com>

Commit 12cc923f1ccc ("tasklet: Introduce new initialization API")
introduced a new tasklet initialization API. This series converts
all the crypto modules to use the new tasklet_setup() API

The series is based on v5.11-rc4 (19c329f68089)
v4:
  - added acks
  - fixed checkpatch errors(Giovanni Cabiddu)
v3:
  - fixed rockchip driver(Emil Renner Berthing)

v2:
  - added acks
  - addressed comments [Krzysztof and Gilad]

Allen Pais (19):
  crypto: amcc: convert tasklets to use new tasklet_setup() API
  crypto: atmel: convert tasklets to use new tasklet_setup() API
  crypto: axis: convert tasklets to use new tasklet_setup() API
  crypto: caam: convert tasklets to use new tasklet_setup() API
  crypto: cavium: convert tasklets to use new tasklet_setup() API
  crypto: ccp: convert tasklets to use new tasklet_setup() API
  crypto: ccree: convert tasklets to use new tasklet_setup() API
  crypto: hifn_795x: convert tasklets to use new tasklet_setup() API
  crypto: img-hash: convert tasklets to use new tasklet_setup() API
  crypto: ixp4xx: convert tasklets to use new tasklet_setup() API
  crypto: mediatek: convert tasklets to use new tasklet_setup() API
  crypto: omap: convert tasklets to use new tasklet_setup() API
  crypto: picoxcell: convert tasklets to use new tasklet_setup() API
  crypto: qat: convert tasklets to use new tasklet_setup() API
  crypto: qce: convert tasklets to use new tasklet_setup() API
  crypto: rockchip: convert tasklets to use new tasklet_setup() API
  crypto: s5p: convert tasklets to use new tasklet_setup() API
  crypto: talitos: convert tasklets to use new tasklet_setup() API
  crypto: octeontx: convert tasklets to use new tasklet_setup() API

 drivers/crypto/amcc/crypto4xx_core.c          |  7 ++--
 drivers/crypto/atmel-aes.c                    | 14 +++----
 drivers/crypto/atmel-sha.c                    | 14 +++----
 drivers/crypto/atmel-tdes.c                   | 14 +++----
 drivers/crypto/axis/artpec6_crypto.c          |  7 ++--
 drivers/crypto/caam/jr.c                      |  9 ++--
 drivers/crypto/cavium/cpt/cptvf_main.c        |  9 ++--
 drivers/crypto/cavium/nitrox/nitrox_common.h  |  2 +-
 drivers/crypto/cavium/nitrox/nitrox_isr.c     | 13 +++---
 drivers/crypto/cavium/nitrox/nitrox_reqmgr.c  |  4 +-
 drivers/crypto/ccp/ccp-dev-v3.c               |  9 ++--
 drivers/crypto/ccp/ccp-dev-v5.c               |  9 ++--
 drivers/crypto/ccp/ccp-dmaengine.c            |  7 ++--
 drivers/crypto/ccree/cc_fips.c                |  8 ++--
 drivers/crypto/ccree/cc_request_mgr.c         | 12 +++---
 drivers/crypto/hifn_795x.c                    |  6 +--
 drivers/crypto/img-hash.c                     | 12 +++---
 drivers/crypto/ixp4xx_crypto.c                |  4 +-
 .../crypto/marvell/octeontx/otx_cptvf_main.c  | 12 +++---
 drivers/crypto/mediatek/mtk-aes.c             | 14 +++----
 drivers/crypto/mediatek/mtk-sha.c             | 14 +++----
 drivers/crypto/omap-aes.c                     |  6 +--
 drivers/crypto/omap-des.c                     |  6 +--
 drivers/crypto/omap-sham.c                    |  6 +--
 drivers/crypto/picoxcell_crypto.c             |  7 ++--
 drivers/crypto/qat/qat_common/adf_isr.c       |  5 +--
 drivers/crypto/qat/qat_common/adf_sriov.c     | 10 ++---
 drivers/crypto/qat/qat_common/adf_transport.c |  4 +-
 .../qat/qat_common/adf_transport_internal.h   |  2 +-
 drivers/crypto/qat/qat_common/adf_vf_isr.c    | 11 +++--
 drivers/crypto/qce/core.c                     |  7 ++--
 drivers/crypto/rockchip/rk3288_crypto.c       | 14 +++----
 drivers/crypto/s5p-sss.c                      | 13 +++---
 drivers/crypto/talitos.c                      | 42 +++++++++----------
 34 files changed, 152 insertions(+), 181 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
