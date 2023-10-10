Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE77CD68E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 02:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vwMzGrLMGnIP6xTSJsnj/5QIc3+rjUCw5fQXzXRcINA=; b=IcFmZFzkLNpVnlKB+EE5UQRAcA
	S50sU5zy5Wc1YHkBMcrEBGx8SsXwTBavYeTxachGqB243AED+NYpqlmIwdcfBIntBQR8mnh4OX7hQ
	xerBGMCAJToAt4M522wyNwc7zDOMn2B7ehi8AHXQzW2UJWppyUR5Fkf49HC/ZVBAGjCtjW1BI3S6p
	6fN5qxNoD0+atjPxFDVX+S0bjDuCsuAsZzuiu4jJQFZAZXheebVohufjOzMggRwTpuKeaLGsSnHbv
	aug0XR0P3aAXZa2+5cQ3+XEXrX+PTLsIBYhoMw7Pt8JDw9C4ds3h71L2gvqOXBKuPpon806UPSxe6
	qPEUxWdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq2d9-00C8DH-1y;
	Tue, 10 Oct 2023 02:37:55 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq2d5-00C8CQ-33
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Oct 2023 02:37:54 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-584bfb14c59so3205748a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Oct 2023 19:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1696905468; x=1697510268; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwMzGrLMGnIP6xTSJsnj/5QIc3+rjUCw5fQXzXRcINA=;
        b=byAN1ipuvrJzrDMHfwVGD1/XrtWCLQ9M9JNVtwoz97uQRwMZIze0dyHx3KJ1SQZzv5
         jnL5oq8II6fG3lPtJbIQ2WD+5aBH+yaNv8bghvKxja2JctRKAOQvwYgj+T2kii1xEVor
         TbvDyuXaLzr+8Fb1sk0HI6nDNYOnZqPLnx2MO+pN+FpbNE4MGZPZh9WAmdbnkHD0Fdo6
         Ygr4c43grIxTjbfci/5YbCt8AU2fVzQRsLnKopA4C9lcUs8Wbh13HWdJ9v+E6Y5FVQFA
         37JXOwvlxSEtvtUh/xB4Xi7mtSdZnuPJmv3Z7JAv3yiF0yuP3aB+AKHCH4DPYVYOk/DV
         9DKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696905468; x=1697510268;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwMzGrLMGnIP6xTSJsnj/5QIc3+rjUCw5fQXzXRcINA=;
        b=FwthYrYy7zOLSK3zhoWZ6U2WdAEc9Mh9P6rGxqZcKxnfT8GPiK/om3mCavDQRFZ1YP
         C3VGxZVogc+9Fm58m/DTlaWe5tcJglVDjf/u5Vd6uuXFd/AMaTxgtit5RBUw0B3hk8ph
         8Q2lhZo39pYnGzSwRC4fL+cMbCwLXc6U58TsDDaO9jpXtsEo3oMh/nWMW/SYGx6V3qA/
         pFdNddWO+Nf1tKPqBzisB56PW56JFoyP6bzg8ay94ZCQOKUDSvvbr10b1WAoOgBjkQQM
         lBKcDyAq8bePMXr4VLqZntLSqgEQ+AHWIAvxlM8hT6UOwAfb+qWZkoQqrA19hJCmE3vn
         x7+w==
X-Gm-Message-State: AOJu0YzXDYiyKOM7/1M2n5HQITNBjGkzOKSRqR5j7hJtvjIrcGAx5Boy
	wT9GWT5tNUzW7V8E7JbqNXqsig==
X-Google-Smtp-Source: AGHT+IHSUXpQekZePLA7IXZaVAW51VjZy1d1Xx5XdaJ+xX3W8eIPKm5wLCDKyhQk4zQTrVQpb/XnCA==
X-Received: by 2002:a05:6a20:8e29:b0:15d:684d:f514 with SMTP id y41-20020a056a208e2900b0015d684df514mr17489451pzj.6.1696905468506;
        Mon, 09 Oct 2023 19:37:48 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id e1-20020a17090301c100b001c613091aeesm10269039plh.293.2023.10.09.19.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 19:37:48 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	trevor.wu@mediatek.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v5 0/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Date: Tue, 10 Oct 2023 10:37:36 +0800
Message-Id: <20231010023738.8241-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_193752_304865_14C88950 
X-CRM114-Status: UNSURE (   7.66  )
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

To use RT5682S as the codec and MAX98390 as the amp, add a new
sound card named mt8188_rt5682s.

Changes in v5:
- PATCH 2/2: modify asoc_rtd_to_codec to snd_soc_rtd_to_codec and make it consistent with the latest revisions
             remove common struct definitions like rt5682s_jack_pins,mt8188_rt5682s_widgets 
             and mt8188_rt5682s_controls.
- Link to v4: https://lore.kernel.org/all/9c28b84e-2d4e-7bc2-88f3-ad5b30d2c727@collabora.com/

Changes in v4:
- add more reviewers
- Link to v3: https://patchwork.kernel.org/project/alsa-devel/patch/20230927033608.16920-2-xiazhengqiao@huaqin.corp-partner.google.com/ 
              https://patchwork.kernel.org/project/alsa-devel/patch/20230927033608.16920-3-xiazhengqiao@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 2/2: modify mt8186_rt5682s_i2s_hw_params to mt8188_rt5682s_i2s_hw_params
- Link to v2: https://lore.kernel.org/all/20230926040901.20338-3-xiazhengqiao@huaqin.corp-partner.google.com/ 
              https://lore.kernel.org/all/20230926040901.20338-2-xiazhengqiao@huaqin.corp-partner.google.com/
   
Changes in v2:
- PATCH 1/2: Modify mt8188_rt5682 to mt8188_rt5682s
- PATCH 2/2: Modify all string "rt5682" to "rt5682s" and merge code 
             in mt8188_fixup_controls
- Link to v1: https://lore.kernel.org/all/20230925083847.1496-3-xiazhengqiao@huaqin.corp-partner.google.com/
              https://lore.kernel.org/all/20230925083847.1496-2-xiazhengqiao@huaqin.corp-partner.google.com/

xiazhengqiao (2):
  ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S support
  ASoC: mediatek: mt8188-mt6359: add rt5682s support

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 122 +++++++++++++++++-
 3 files changed, 122 insertions(+), 2 deletions(-)

-- 
2.17.1


