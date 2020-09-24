Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BCCC4363D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 15:28:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF9942311A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 15:28:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JF7LTzyT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVPMJ1vP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF9942311A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1SPFr4g4RC4r6ZModMhWylxN41HmQEYeZaOOjhhr6DI=; b=JF7LTzyTIX0Mf0GDyE1P9kJv7J
	azGicZnThyA+877SiljopFv3a1ZlFTq1BCx0vtAPZk0wPpeEPjj+3Rk2/+Hz50doYEO208IiB0uB6
	HRV2JqbJgx9c56yrWurG85MC7wHYblt+0ye0U8hQ1oaZq9k4w9guC5chXIUTrsHu6fDLJeV558k6F
	547GQuV7IEUWQiO7EPcQR/4JDhiKl9ukU6p5AFPosHoiYI9HsSCwrY89dRtowYy27/jT0pv5OPTr6
	gHk2ay2DhrlBA4x6eAqKal+LfCa6FkUa0+XhFRWt01Q5Tm6MYoBikLbwT0R+LsAVtewtjo/BwL40u
	KQqedFyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLTAX-00039Y-UL; Thu, 24 Sep 2020 15:28:26 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLTAT-000382-U6; Thu, 24 Sep 2020 15:28:22 +0000
Received: by mail-pl1-x644.google.com with SMTP id bb1so1869720plb.2;
 Thu, 24 Sep 2020 08:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gXVI8blrh+U0tOoKV0mzGc0cowRQ+kIzhBwCV8XERhU=;
 b=AVPMJ1vPOCO3zjmw8Z7m6/mYNu1KEe1IgzVGG93jFNEPlOOjvSfwl0AxUFHapGBpOF
 s4FMD7faMFWHKWoC5jxD3E7HVVjNCsAU0D/aIJ0B5bPkaltCoLnI/9Y4biHsMPNKRs1H
 VSjswkMr+P9b7bq4azdNAPTqv17a9ZeKKDaPH4QS0zp5fcJkCPAX+g9WPc3T55Fovqz6
 o74EVuFmwTUdmzpt9EeFMYl0g6jXMDtSmqByozYqgYI/SUOKLJpCYqxs33c2nS7OJpB6
 YSq8hGuO4e0c415/rz/pHb8bl2++PhugN3Nq2KHszvHIguiUPsjk99+Zr98MM/C4caqy
 YDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gXVI8blrh+U0tOoKV0mzGc0cowRQ+kIzhBwCV8XERhU=;
 b=d5t5pfEUbMHF6ovg5pHF5rQ2LKWY6UZnI4KKFw7qt62/cfam0+yaxmtzdVXOwUea5M
 fKlDnA5BI2XJZGUywrFSfQk2IMax7Kg9AgmcOJL1T8NHpwPrxNnIQcI/qvQqq1NHXjv5
 4eZ5JS4Ppku5SF579IdCt3BMz1+yDLeAkLCQsijBGW3fKSFL9rbFovVrEbncBBJ4+f7C
 UrAFb8kk4ZQvQ9yzCD92JxM8szL8OsrM+6usE1E/prA9Tu1otCBDYfLhX4pij3WUyApz
 X+PMcBbihAZFTHqlQobffNLCqCBdtrvxjvAQDvBvKP1C53hg5DPeaOMWB1oiA+NcerDO
 wPjQ==
X-Gm-Message-State: AOAM531NJMM79CA02k0k2PNN5sqpyaacKXtmSCA9bU/uCCi3DMaXFlJj
 Wx1GlFE7L5UA1DsPaq2F4Ew=
X-Google-Smtp-Source: ABdhPJxsPVRDdPOTyqtqbRcrA2IdHghcS1WT940rlN4wuDV2SJzU2u+ErsOmLk528OoV5ouzqGN8uw==
X-Received: by 2002:a17:902:ba90:b029:d1:e5e7:be6e with SMTP id
 k16-20020a170902ba90b02900d1e5e7be6emr4990145pls.72.1600961299775; 
 Thu, 24 Sep 2020 08:28:19 -0700 (PDT)
Received: from guoguo-omen.lan ([156.96.148.94])
 by smtp.gmail.com with ESMTPSA id e62sm3233212pfh.76.2020.09.24.08.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 08:28:19 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@vger.kernel.org
Subject: [PATCH 0/3] spi: spi-mtk-nor: make use of full capability of program
 mode
Date: Thu, 24 Sep 2020 23:27:27 +0800
Message-Id: <20200924152730.733243-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_112822_013426_EC1058B7 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: linux-kernel@vger.kernel.org, bayi.cheng@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

"program" mode on this controller can trigger up to 56 bits of data
shifting. During the operation, data in PRGDATA[0-5] will be
shifted out from MOSI, and data from MISO will be continuously filling
SHREG[0-9].
Currently this mode is used to implement transfer_one_message for 6-byte
full-duplex transfer, but it can execute a transfer for up-to 7 bytes
as long as the last byte is read only.
transfer_one_message is expected to perform full-duplex transfer,
instead of transfer with specific format. mtk_nor_spi_mem_prg is
added here to use this extra byte.

Newer version of this controller can trigger longer data shifting with
shift bytes more than PRGDATA_MAX + SHREG_MAX. This patch is implemented
with that in mind and it checks against both SHREG_MAX and PRG_CNT_MAX
for future support of new controllers.

Patch 3/3 is a fix for:
commit a59b2c7c56bf7 ("spi: spi-mtk-nor: support standard spi properties")
which breaks supports_op logic. But it can't be separated as it depends
on patch 2/3. Fortuantely the broken commit isn't in stable yet.

Chuanhong Guo (3):
  spi: spi-mtk-nor: make use of full capability of prg mode
  spi: spi-mtk-nor: add helper for checking prg mode ops
  spi: spi-mtk-nor: fix op checks in supports_op

 drivers/spi/spi-mtk-nor.c | 179 +++++++++++++++++++++++++++++++++-----
 1 file changed, 158 insertions(+), 21 deletions(-)

-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
