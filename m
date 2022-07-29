Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D36C00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 02:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VrPTwHjfC5QxsVG3vayD8eV3MqvBjr0U91L8fruvcYg=; b=SSYbCR4knBWdq3gmGL5u/5zCO6
	YmmK6xm6c8+KPzPdsVEjmqp8jMsvdgE9crbtxd7EL7BB8zV6i0twjFTw+iyytL5grxxVBpEJMf43s
	4fseor53SFRqT/HtmlCvqBfytFKNKpt3fHdOUEHi2m4rMk83QpyIIuh3l3MgJEVweZPVgnGWlzn2h
	cJucHRwBdpyzOUlZWyI2ZGWo4uTcwUMVPCQl0V6O78DdFEzfF+f2XQu6HKFJVnGwcDMCvlEIVmz9v
	MBYJr7/tg3SxgNycNyx7YuP3abjXgoFPQ2HgHj0fFCeE8DewUL3vXG/49zyeQhiMhRFz3LfqpyK8c
	5k7axdXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHFNf-00H02o-6V; Fri, 29 Jul 2022 02:05:35 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHFNT-00GzcJ-Ik
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 02:05:24 +0000
Received: by mail-pj1-x1031.google.com with SMTP id w63-20020a17090a6bc500b001f3160a6011so5120311pjj.5
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 19:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VrPTwHjfC5QxsVG3vayD8eV3MqvBjr0U91L8fruvcYg=;
        b=aJhskqxfHu9Y2ZpoWFbtIeFpB4Imk6JZOVzW4D8S2y6DMUoufx0RE3fq/be6nFU2au
         wb6GvuodPNYVan8O0B3whcvlFn4/n8AhT2jZkHIEoTkVg7fSan0w+KAxcqCGumWgdZKq
         Y8yHiqpMBrxaF5Xp6vWy4dcZrEmkbsuJo0bbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VrPTwHjfC5QxsVG3vayD8eV3MqvBjr0U91L8fruvcYg=;
        b=CSrqfWXyvgkMoy5TaA00/2MifMFvdxks1XAhWeDqnPrqk1DvfJiQu8P9331E7ZhAeG
         XZFEldjMf38KeGguxhiv/SrEbYSHHhSmg+08RCMeGdVGwSh6uHBW4GkAc4y4fBAQxnJQ
         /qMcrH93NF/D68AA1zLPYjS+iRmfGHtJixfiAaHTGt6pC/GfFoKBs587ABDOLHBkOXMK
         iESN17504MQ0uAdiPPylIC9Mk4YVCtn7pBOUZWAn0pI830iUGtd6hncecITeDlhnJ2P9
         fQ7UAtEqTEgi6h8ajFWzcmLh4u2IIYGVUbEppK0DhhBdYwF5h9iJCzNondXgTL+6p/PV
         3uBA==
X-Gm-Message-State: ACgBeo2N5RljYxgjt98eXqndPfs621I6ghxD4Mzd56bP0cAA5ou2juh3
	nAm9Qz9hywSKraoa5mXbpAAlfw==
X-Google-Smtp-Source: AA6agR4yg+hJT2sTUv6xIxgwqftaALBJ1dWWW39BU5Dsu1TjnAGWtGgfMYa2Uq/BoKZakwmgeNMCPw==
X-Received: by 2002:a17:90b:3e8a:b0:1f0:4157:daf8 with SMTP id rj10-20020a17090b3e8a00b001f04157daf8mr1583417pjb.222.1659060320809;
        Thu, 28 Jul 2022 19:05:20 -0700 (PDT)
Received: from dlunevwfh.roam.corp.google.com (n122-107-196-14.sbr2.nsw.optusnet.com.au. [122.107.196.14])
        by smtp.gmail.com with ESMTPSA id y124-20020a62ce82000000b005258df7615bsm1571901pfg.0.2022.07.28.19.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 19:05:20 -0700 (PDT)
From: Daniil Lunev <dlunev@chromium.org>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniil Lunev <dlunev@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andy Gross <agross@kernel.org>,
	Avri Altman <avri.altman@wdc.com>,
	Bean Huo <beanhuo@micron.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Can Guo <cang@codeaurora.org>,
	Daejun Park <daejun7.park@samsung.com>,
	Eric Biggers <ebiggers@google.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Sohaib Mohamed <sohaib.amhmd@gmail.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-scsi@vger.kernel.org
Subject: [PATCH v3 0/2] Expose UFSHCD capabilities in sysfs.
Date: Fri, 29 Jul 2022 12:05:06 +1000
Message-Id: <20220729020508.4147751-1-dlunev@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_190523_669911_7758F5D1 
X-CRM114-Status: GOOD (  10.37  )
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

The patchset introduces new sysfs nodes, which userspace can check to
determine support for certain capabilities. Specifically the patchset
exposes Clock Scaling, Write Booster, and Inline Crypto Engine
capabilities.

Changes in v3:
* Expose each capability as an individual node
* Add preleminary CL to align checking for capabilities
* Modify documentation to represent new scheme

Changes in v2:
* Add documentation entry for the new sysfs node.

Daniil Lunev (2):
  ufs: add function to check CRYPTO capability
  ufs: core: print UFSHCD capabilities in controller's sysfs node

 Documentation/ABI/testing/sysfs-driver-ufs | 39 ++++++++++++++++++++
 drivers/ufs/core/ufs-sysfs.c               | 41 ++++++++++++++++++++++
 drivers/ufs/core/ufshcd-crypto.c           |  8 ++---
 drivers/ufs/host/ufs-mediatek.c            |  2 +-
 drivers/ufs/host/ufs-qcom-ice.c            |  4 +--
 drivers/ufs/host/ufshcd-pci.c              |  2 +-
 include/ufs/ufshcd.h                       |  5 +++
 7 files changed, 93 insertions(+), 8 deletions(-)

-- 
2.31.0


