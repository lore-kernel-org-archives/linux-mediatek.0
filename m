Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC163F532D8
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 05:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ESEAu+z9qQDpWKYSwQTMrWov5dMVmlm0gnO2s95QVs=; b=TAD6caMITXivW49o35to2K48ie
	hdZFJQ49jRTzA+q3P25Tf0yzugz0kf5DuFBPVNB27wdmtYZ61Cx+pFZbcbRSvioDDC5fT5ulTc4UN
	/v4Bv9L4rKUqfX1HYN7SxFTapkvD3K821+TTpcWjU3bpM/I6Vlk9oKEbO+Bl0atg0co6RO9K8CCn0
	4JNU+MNl+s/SFaxu1PP06w0ftD+QWutZfb2NhOrCn4wz26XHIUc/GollvWOUpmZy01kYdrxRXMNPm
	qZIbrJVZalQ7La1n/7dxRVALsrFC+WMok5J6m9iXtdvf4MV5pTSHb2M0jruIVcAnDYGaCHNogYQ2p
	4Xm6sqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uLp-00000000aPj-1gzj;
	Tue, 24 Mar 2026 05:30:49 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uLm-00000000aNg-1a6O
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 05:30:47 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so2541647a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 22:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774330245; x=1774935045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ESEAu+z9qQDpWKYSwQTMrWov5dMVmlm0gnO2s95QVs=;
        b=k7EzNXiOtLyBDGeRcOc8dnvBJ5RTgWEucdV6VpACbW3jXfuEr/samo1fKtUHsPlbKA
         7id3Tj6INLkLEaCWt2IL52mOxt8j65jBmhcoMErrjf0HnkKpzI+Y2ktKZViBPevR95wH
         +PM9ihjEWPKWfDckQ00l9sc4wzQwys61Qzj+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774330245; x=1774935045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ESEAu+z9qQDpWKYSwQTMrWov5dMVmlm0gnO2s95QVs=;
        b=UUNxssnk9/ZQnAvpHvqXuPbjTTj4vVnPPx5REOlbVDf7OqXQ7haoaCucnVMMMJIWMb
         sMBg9+YsrPLmLod9U+DhyB8LnTki8RtIBEMU34uwHYrWZ76lxFHNmW9Gw0AJK+yMonc7
         6O9sKZ83W2UqyemMajEvpoo9UwdDAI6/gEReNuoSs37Xd/5pKPHk/xHM3CWsCiJMf0Zb
         JlCddFpT5S9Bvin8uLBDNlnLoeovyjVUd7nJJ12NA5K2YJMV1S4yt6oIcU36N/A2Tfz9
         02hDTZEurE2iUQqPXqgG1pq1JnYDwZvQP3Vds9EjKJOACeSgrm5k0lwYBaHbtvzNsQtC
         q2fg==
X-Forwarded-Encrypted: i=1; AJvYcCXQ7HhS2UUdHBm8pQSwmEb8s5NHnGni+N/qwOUUbB0Nherljnxs6oquc02Nb4RUG2xuNTMFUrlH/3ettneo9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLZ0ijlZcMHCfL6OH4EqSo7LyPKdkkOFVqQcJT4cJhCZKzJMS1
	b+smHzxefE0ponGG8bxtQenWrBUZAaykYcolIL6KdL2BMUelIhZ2iLZqifT2PljWlQ==
X-Gm-Gg: ATEYQzy7fnZad6MRtMlGaNeLhbzgzgtLVu+1hLGj65bFkRv663+tB+aiA/yAvCvXGC+
	cR3vE7KPvk0mJGrVIhAGZF7NUoSWsCzSJosePLHwrchscUlVm2O2Tl3IQq/DNtIt+KZ95hEHFYF
	/5Ndkrm/1r+13aC5Ntk1b1SdZRfX7kauW12hR5OA+Lm5XA1Dm2PlN9o0imsRhgpgAL33vKGE/Se
	nlUSqMOlaowzSwQqN66UxNbdmx8QFV4RgGE0SqPyfNcoREA/0aFJlkWM6xxJH91UPZGy3Xm5LVO
	Cd3YFQ9wr9VlBU0rcTaWrO+Z61PLjuOxmaClBVN1EYVBDwRBPLz6N5eBsSv+DUnzsi60nmK1D/0
	tlQT408O+DeeF6DUtRzqZWT03n4UnZuzPIQ7/aDxyiCPhbu1ZVVY7RJtzspxxIL6ecE7E93TpKS
	2uZ72BwVQuF8xyrgS39b5N+OjIZ6vjvt2/72DCEbho9uaMkFrLhbFaYy4Ttv3i/hogP+Ml551MV
	D46YP5A
X-Received: by 2002:a17:90b:3a4f:b0:359:85b0:4023 with SMTP id 98e67ed59e1d1-35c008e2fc5mr1410367a91.16.1774330245449;
        Mon, 23 Mar 2026 22:30:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03211351sm953507a91.15.2026.03.23.22.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:30:45 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH RESEND 0/2] regulator: mt6315: add regulator supplies
Date: Tue, 24 Mar 2026 13:30:27 +0800
Message-ID: <20260324053030.4077453-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_223046_453418_5379EC24 
X-CRM114-Status: GOOD (  11.80  )
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

(Resent with correct subject on cover letter)

Hi,

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the MT6315 PMIC.

Patch 1 adds the names of the power supply inputs to the binding.

Patch 2 adds the supply names from the DT binding change in patch 1
to the regulator descriptions in the driver. This patch has a
checkpatch.pl warnings, but I wonder if it's because the context size
for checking complex macros is not large enough.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (2):
  regulator: dt-bindings: mt6315: Add regulator supplies
  regulator: mt6315: Add regulator supplies

 .../bindings/regulator/mt6315-regulator.yaml        | 13 +++++++++++++
 drivers/regulator/mt6315-regulator.c                | 11 ++++++-----
 2 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.53.0.983.g0bb29b3bc5-goog


