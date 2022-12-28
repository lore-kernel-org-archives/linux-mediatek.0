Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A68AC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 12:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LFvhTcaRZjgL74aw0ImWpDb76fTfKVSz3niY5jO7t2U=; b=fDgIbRJNl2aJYgUjYboV28ZPGt
	ShRCNLfoJLMiDMxU+T0tDfn9bkcPgqBrWPBfvI1aqkQ+zIln1p2s2FP1wRAbDueT9JK5o2LMEIrI/
	CnblvcLTPDu+Nk12W1UqiLEG6uCyFv8O1CF6CogUB3V1rWDUTZ4WUjm7QOiSUUba0URh/8K6ciaW3
	SIeZd7Ox0l5zzZVu0jgCIazOT51IE0pa68TpBIEPvaPDXCoXZJc40UlQUpmiJ39BceDpCgTUlTm/a
	1SJP0H9914ftfk2C8LTaKEmutZAE9guQ7emDeroj2P1NM7bgaYzXtHjP67SYWSi4C6Bx9N/t/6Bd7
	TQhuJUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAVSS-004lTL-RR; Wed, 28 Dec 2022 12:22:57 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAVSD-004lMp-Of
	for linux-mediatek@lists.infradead.org; Wed, 28 Dec 2022 12:22:43 +0000
Received: by mail-pf1-x429.google.com with SMTP id k19so2918956pfg.11
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Dec 2022 04:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LFvhTcaRZjgL74aw0ImWpDb76fTfKVSz3niY5jO7t2U=;
        b=6XK8iaEvevvXqDOBb77pn2jRDoRsZbUa51M+NyT8XpjYcuaxY7TVVgDTdJX44JzIT1
         6vItea01ki1fvLX8FOid6Mfm9aEGnD+ivk7GAVyKN2EyZYFut5kuce2/vz/6lLVPJ7Ji
         e4xFy50sBPkC4c6aKDAgIkSv/9g69rOW5gS+8WsG1MZuW2riLAdU+2YDVbWqtWo4WB9p
         tEw3/eL6f8YWvVdn8uAJdzrITvinPwmvvPLcGpjHCY6bO8rA0ZSgLdSIbQQLkrXpPxNT
         bNWYeh3H5gY47F0u6MG4axq5XEIRinEAlW4ZjsoNZR8nQ5z4iB+aO22ksTFhdgC8Gr3a
         p3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFvhTcaRZjgL74aw0ImWpDb76fTfKVSz3niY5jO7t2U=;
        b=vnHWuavCCRGyvTKZ+Myl+EQcsEqhwYexguurOgrhxb8ksCqvvzbYIe9cqNlv0tRnXC
         QS4LaPqag40baa3SZCSroh9Z/baRtzK+IHMXvrI8WOsGDLs+Kc+6nH+Nf5j/A0fru+km
         DlitiH/epGbdsWml7+euHADRUbzd9xNbcmurBflnntrFHG2xuUEWb4XQZGG0e6nBI4dx
         99yI937kXW1t2ge+oebI3YR5IYDzr46vaa6d7xnDT4LxrUaEpZkVAqI422wW1db4zsYd
         iIV+rat/caGSaTT2KKf0z1f/OrHf8qJh19uqQiUfjsYAx20zKBlLV1nYLoNWArRVYStu
         XIfw==
X-Gm-Message-State: AFqh2kqMQkR3ufuEOanZyPC4gY4OXexlR/t6FHp46/6ZAP6BTJQowPlD
	iqYrbnuDNrXRtFTKZN3S8RpJcw==
X-Google-Smtp-Source: AMrXdXuPM0D6h33ggS86tdoKbX4wsqChC1KyEbKeUzk2LWBE9WFxvgTxRvaU/KF9H7dMQzvrnz2Ctg==
X-Received: by 2002:a62:6102:0:b0:578:3bc0:57d7 with SMTP id v2-20020a626102000000b005783bc057d7mr24847846pfb.13.1672230159291;
        Wed, 28 Dec 2022 04:22:39 -0800 (PST)
Received: from localhost.localdomain (202.60.225.077.static.cyberec.com. [202.60.225.77])
        by smtp.gmail.com with ESMTPSA id h1-20020a056a00000100b0058124f92399sm5236074pfk.219.2022.12.28.04.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 04:22:39 -0800 (PST)
From: tongjian <tongjian@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	jiaxin.yu@mediatek.com,
	chunxu.li@mediatek.com,
	ajye_huang@compal.corp-partner.google.com,
	tongjian@huaqin.corp-partner.google.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add new AMP MAX98360A for RT5682S
Date: Wed, 28 Dec 2022 20:22:28 +0800
Message-Id: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_042242_136178_1724ABA5 
X-CRM114-Status: UNSURE (   6.46  )
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

Add MAX98360A for RT5682S, MAX98360A works same as rt1019. So, it can
be supported.

tongjian (2):
  ASoC: mediatek: mt8186: support rt5682s_max98360
  ASoC: dt-bindings: mt8186-mt6366: add new compatible for max98360a

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |  1 +
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 22 ++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

-- 
2.25.1


