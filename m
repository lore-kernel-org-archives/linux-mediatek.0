Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97B3CE8D78
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 11:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aQ260cFU2n88Cs877yJ03XX6qLLyk2MUT6bBvDZ2hiY=; b=WaE01v9Ywt5dRw/yrULJOs2iuR
	61WcwU+wwtAjTDKURDvFPSrTZ7HJCTBAnLhrBCA76eU007uYqbnFDGd2hxPH+HfzrlyUfodv+NL3M
	qLVprtSNIvh7XuyZWgTfyob4giWCMbMhCKkpeXzQ/0YUbG4lCftolMOegdJLZ0q+5I6+WOiHbNv7V
	7A9izJQXLaJ/5cT54Dcl/tfnpqPixU86V1qEIi/KGhhK0aA0W6yD65UqWLT/b27i/hoCqs+C5MX36
	Jl0+RH+BxdPFZD4tAeAsLRGUT1jP8udew3I64f4mW0xWxudI3cDEHJVdqIWBe2eTL6ojtVnMeuvrG
	e+RusADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srFEd-0000000A91b-1U8i;
	Thu, 19 Sep 2024 11:22:07 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srFEa-0000000A90J-0viI
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Sep 2024 11:22:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-207115e3056so6625805ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Sep 2024 04:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726744923; x=1727349723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aQ260cFU2n88Cs877yJ03XX6qLLyk2MUT6bBvDZ2hiY=;
        b=m58wnCgkPHeXgMbEv+UzkVPf6bBhYRIqE08Ro7tgXkbWFkMr80NQTg6jSW5bug8Pc6
         RzFhMXr1W/2ADHfd88e6FS12TXRbiOtFNEovNCx2fra5/JtHC5Wo39pohkS/mNINw/fH
         3eXLp3D6UvnncLDTebe/r3vsw5zTmQCeSgws8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726744923; x=1727349723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQ260cFU2n88Cs877yJ03XX6qLLyk2MUT6bBvDZ2hiY=;
        b=rtTLzU5klQPAAwDKfOGtSp3/ScerBXSR1+vXWT4zyUBDAcNDNTnum5l8GqVAkcMJ9h
         DCFrpZTRhS820nkgAb/kw/WkCTsxeC54M1Fh/jxCaMdU1kyn7pdS2OKNKM4aVnKIPdCb
         HsgZh4i5eoas6QEJhWb3ll2NWAhvC8kZvPfI7G2Sa3XlOxI47XZGqGHM5zVkQH37tQtM
         EC85a0t+whcfatJapwSpXK7D1YTpn0JiknPlFYYd9UQEAWcA/jaBwwuHAmuyHigHFtUm
         3mFhVLl4aVSDIJIYQ5jCXAM+zYANeQ1f/HkbWRGnr3Ku9/Md9slUVbpiDS/o6AOzJsvH
         NdVQ==
X-Gm-Message-State: AOJu0YyA47kBuetUrt3NU23j4YrLFZyS03J9B4Dg1I9XTAUjZUtWqXBC
	7aUcjPzTdxON3Rx4tbwBASeCsDLfp4vc+lUTpCcp7TWOTNFAM6Fok8qHmlccsQ==
X-Google-Smtp-Source: AGHT+IFNsO6MH0t+u0d8Ht9omXf78SvBayyrpr2wZEpgMs/or4L27Xoz4HWkGuqF+rbIf1Jcb0XKuA==
X-Received: by 2002:a17:902:ecc5:b0:205:43d8:710f with SMTP id d9443c01a7336-2076e4df8efmr329353275ad.58.1726744922721;
        Thu, 19 Sep 2024 04:22:02 -0700 (PDT)
Received: from localhost (117.196.142.34.bc.googleusercontent.com. [34.142.196.117])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-207946010d9sm78452115ad.65.2024.09.19.04.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2024 04:22:02 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	krzk+dt@kernel.org,
	ck.hu@mediatek.com,
	robh@kernel.org
Cc: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v2 0/2] Add power domain bindings for MT8183 and MT8195
Date: Thu, 19 Sep 2024 11:21:50 +0000
Message-ID: <20240919112152.2829765-1-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_042204_292807_0909BBF6 
X-CRM114-Status: UNSURE (   8.94  )
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

Hi,

Changes in v2:
 - Added a Fixes tag in the patch 2/2
 - Also added the missing compatible string of MT8183
 - Link to v1: https://lore.kernel.org/all/20240911071722.558960-1-rohiagar@chromium.org/

Some of the compatible strings were missed to document in the dpi
controller bindings. This series adds those missing compatible strings
of MT8183 and MT8195 DP_INTF.

Thanks,
Rohit.

Rohit Agarwal (2):
  dt-bindings: display: mediatek: dpi: Add power domain for MT8183
  dt-bindings: display: mediatek: dpi: Add power domain for MT8195
    DP_INTF

 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml      | 2 ++
 1 file changed, 2 insertions(+)

-- 

