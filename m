Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E06FC5DF81
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 11:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/fA2Qh6VZccXsUY57cmXDESi+CqIM725cXDSiwO02/c=; b=AdzkdAwkWFSPr/FXjz7MsGeLDt
	Yn232fzAIoUqo1QM1iKZr9Kq/20+t/3h+NHUraNyQXv4hURf4N12jfbH5kPOMhZzloGaGc+ZN7ySM
	gzxiCStyYaHHOIMkNhHCSon+zgE4jF8HprmnO2ymEU2E/LUHU5Lmowmsb/ZyuaCL8TTC9DyVVrzSE
	1F72ZB7/FHpghZ4pmNcL5hHBnHGMVPxwU3TKrWgtSE0Wh71Nfh7hKSggknr4+Qk87vsLuqKlJhxeV
	EYqZEYzC+JfH5Ug2E0IEuzlBuYJ3T1i0IQVp+H11GJci/WduIEvT2MuVaEJ8uxpy58pBSLBWIxCxB
	ati2GUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0hz-0000000BQ1V-1CN6;
	Thu, 20 Aug 2026 11:13:19 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0hx-0000000BQ0U-0ozY
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 11:13:18 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso1996194b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224396; x=1787829196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fA2Qh6VZccXsUY57cmXDESi+CqIM725cXDSiwO02/c=;
        b=GApBNBrpleNz90QfJVX7jMfLz/grFiBDu33brQEIz7CHDHzRpxd2oSWb5bqRi4Aff6
         4/aq1qCXDxfx503xuLOI506HiG8UeFchE0+xLamlahR9NGboNlaugZwyien0CQHsfF5j
         COSalcIyGPJsD1oHQq9QGcyd47Uirckm9p9bPHv64wr3GVXvJs1vRIbo2UWz2jPAlKTR
         8rkQO0Q4Bk8qFU+Cx1AaowcQF2MN5XIgyZVrF92NoyNjRUruKcYcLHiSCFaz9RxevQ11
         IriatwpYOUigO82IiGxHo84y1ru/KmXJPCfZ62wnTZId5mBKqLY20ZSAQ+bHKP6ZJ/UX
         8dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224396; x=1787829196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fA2Qh6VZccXsUY57cmXDESi+CqIM725cXDSiwO02/c=;
        b=Hua5R6btZmqYo8dJu6O/yIRrzoXsbhwSMHNPKuwF/znvyQYilv8cLKbWsw7Ia/WlS7
         7EIocRrttf9CfNxlDJj748nTiX4v6GOIy5IU7LWn2NwG7W1UjPzcqbx24hzP/5x0RO3t
         mJvJmgUUpq2L9Bg/CkyvVQ2lgvr4QtKRZMm95gEFtCGBF7b6GxgEzcUIQg5sDpUfDpeR
         HkXMZLkDoZSAV+rHXTqa4fcMW5dKZ/socZPlvrsh9jibzZbVIoC1klHGuZ02OBzJdkGO
         zSyU/WEdRMHhlzd/MpsgZLxev4vB6+guu/p/tw/eUVmsD+NDFNb4xv8QgIJJlymdOCR7
         xZHw==
X-Forwarded-Encrypted: i=1; AHgh+RqxsKoMfWdrkV9q5vltFHcqljkWMXGUoKvnoXqG6vS0pqMKoudY3p6gHw0DK5OoBvaMMNi1mpDUD1xeoNYyvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbo/mo2/g7p+Enp7gv/5u/qjxIAzMNt8ThwELHGEwXa0cvomH0
	1L1RLSw9YKMLqUW2A3pCyiQ20umwpLpUVvA3PYbir83iYgMLEpL8obgp
X-Gm-Gg: AR+sD13dgxIub0D9GVx42/0+bIYzDoE0wnTKbE6IetWG2Vi2AJxDLGg8ah/oHA2pboO
	rC5oMpUKmKrHQA8hPGIHgZNQi/EMwdjKtAYLuZxD7QwGrXGLoSkf0pvgS0RMxnVrmxKiDkJpSyI
	h78gjlzI6zKpMvNhlraj1VBnupfgs45CfPcoJKWuYoqrLAXbVwb/kAZUva7YyjYMmeH0u1ge8Jf
	mr2jswLKiByXvp+es+s/14vDQ4i5Aic6E7W1LQb51RJmVId3Iqy4wFNqYDRyyAC0Z56lP+kPA6u
	ni+6eKhlw+z22ODob/ycWJKCQpKRBz1xGhoSThK/ZxZqZoTiKaMgZYKgiaZYMvDtAG6YMfQVJBo
	LfufJHmmU01YBY6PROIBzz7H99rUaMz9JiOnuPjjbrOr4fvEEYEa2oSG0gR9lY0QE1UXAKPYrwo
	UYsrh2EAgttXE6zuJj+9kuYo/GFhSlC0Kkwa1/ymR6sGyXqvFsQOCCcQgLyp0o4BrdU/3dvwraY
	QSyA6XSfREWhAP1uEUQfwlIX6jbb7lujSDSCYheD4JKRqZ2l8Y1Yl8gk3321m2Ivtqz4qkDGDLg
	z91QVazcc/YQq10=
X-Received: by 2002:a05:6a00:a20b:b0:84f:d7e4:3404 with SMTP id d2e1a72fcca58-851d3911ffamr20072394b3a.11.1787224396048;
        Thu, 20 Aug 2026 04:13:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1515460b3a.38.2026.08.20.04.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:13:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] ASoC: mediatek: mt8186: Fix clock error handling
Date: Thu, 20 Aug 2026 18:12:48 +0700
Message-ID: <20260820111253.97866-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_041317_237541_95B6D153 
X-CRM114-Status: GOOD (  10.14  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes error handling in the MT8186 AFE clock code.

The current code can return from clock operations without cleaning up
clocks that were already enabled, and can ignore clock lookup errors
while later using the affected clock pointers.

This series keeps devm_clk_get() and propagates clock lookup errors
instead of silently continuing with a NULL clock.

The changes therefore assume that the clocks used by the driver are
required. If these clocks are intended to be optional and
devm_clk_get_optional() is preferred, the clock users would also need
to check for missing clocks before calling clock APIs such as
clk_prepare_enable(), clk_disable_unprepare(), and clk_set_parent().

If that is the preferred approach, I can rework the series accordingly.

The changes were found by manual code inspection and compile-tested
only.

Best regards,
Phuc


bui duc phuc (5):
  ASoC: mediatek: mt8186: fix APLL mux setting error handling
  ASoC: mediatek: mt8186: Fix AFE clock error handling
  ASoC: mediatek: mt8186: Fix APLL enable error handling
  ASoC: mediatek: mt8186: Fix MCK error handling
  ASoC: mediatek: mt8186: Propagate clock lookup errors

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 112 ++++++++++++++-------
 1 file changed, 74 insertions(+), 38 deletions(-)

-- 
2.43.0


