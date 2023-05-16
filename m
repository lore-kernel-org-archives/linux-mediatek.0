Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0DAC77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 08:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0kKvU8VcjZDCawm1uzpgifPJsmcOM7ycSUxGftpKlg=; b=T21nFFvmeHZLT/MTX3p94Eyf03
	puCVJ9CAhr1kEsxD+s9U/MAC2pJvm7+3iF92WQoexloKeUze1bmWtTMHbk0VRkSI2XAGyAuG44ePm
	QV9TwwTQjmzvI1tLe03d1wMAcuAVY+hBpY/vuKECZaiZvgz9CicS8+CnHU6qLwON4aS7RrukOF8AS
	6gTIjz5/ts5OQnDDZ2DppkaxS8101VN0n0hVeunQHlPi2yYDaBmosIiUQ5QmESeIafozYBZuJn6Tc
	OKUiXKwvW33XIHywwoBjLGp4ig29h9OR5+7TZPjBhSyjrj6HHssxsawibSrvYkiKnmXn96iAYLJiu
	MeAL3FzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pypzu-004qJC-2W;
	Tue, 16 May 2023 08:25:30 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pypzs-004qHr-1G
	for linux-mediatek@lists.infradead.org;
	Tue, 16 May 2023 08:25:29 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3075e802738so12654778f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 May 2023 01:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684225525; x=1686817525;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0kKvU8VcjZDCawm1uzpgifPJsmcOM7ycSUxGftpKlg=;
        b=U9snYiuAjXyog/pObORtqBLp74KZGAJqnQBHSstncHnnEKbrGJKl08+B+62YqdBMKN
         0ubaX4H7k5IGggRg57I4qwEJQwS2vhLyOJ2FnayJLRqEVWPsSJp/24NNlIFP8qPs7NsU
         JcJEl8IXtyJLkfAMrMq8ri8qucR710Ewj8Oe8SiXX4nIZOTcFwWrU4uJP3WGI2FyNUzC
         6VryLEOtlCz19nQo6UmOQr60v1Z338VVzph+Q3ovng2XtdKn+qd1W5YAKREewjjOgEU7
         Xg2vwuL+B7zoCEsbjgr1uZdcbc7l6pQUy7gZh+UnVGh9TxnDbnSEb5ovDJKDAUOMIR0D
         em7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684225525; x=1686817525;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0kKvU8VcjZDCawm1uzpgifPJsmcOM7ycSUxGftpKlg=;
        b=e56Brcn0jNQ1LW6ZaYn5Ir7mcDjJ7FBg3CV0mzb8PWT1HtARiSXrk/FgTpibrv2VrW
         7yUaJQlIPE2kdMJhT8Is2eDwzKqJ/jlKgr3dCzI9kBgl7AnBOhybWTBLc/RK8QpVi7kI
         C01rdK7vWzPv2kH1VFxBVJ5eCobuanSf+QWiBdZoU+WDmKnONTxR/k1Z0k5y4cLDzbx4
         kwzM0bg62n9ebdK5XNdZnxkTG6KZzu5MMAbGYuHoIXOd/Jq8n6QoUkBWkcVraBq3WzuV
         ZNmQQ+Wz6GBdzgy6ZCUlF/uqp/jrkwplIVWTAFwqyixk2hbvlmz8KG6HI9LHevtsDcsK
         GtUg==
X-Gm-Message-State: AC+VfDz3r211DIIksOtM/9U3hTxxlvDx0R2Qt8MgEG5qIfxw//OvlXKC
	M6ecsmK2tEUPgT+KfaueBGsMXw==
X-Google-Smtp-Source: ACHHUZ45Ql6xlhC/ZvqBRbGxOQz1rTz/nyVnET70PNRzfh6zOHMn4ARYGPyEwcNil7BmrD1rfXVBww==
X-Received: by 2002:adf:fe0e:0:b0:306:2f91:302e with SMTP id n14-20020adffe0e000000b003062f91302emr30760857wrr.21.1684225525080;
        Tue, 16 May 2023 01:25:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r14-20020a5d494e000000b003063a92bbf5sm1727505wrs.70.2023.05.16.01.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 01:25:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: sam@ravnborg.org, airlied@gmail.com, daniel@ffwll.ch, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 dri-devel@lists.freedesktop.org, Shuijing Li <shuijing.li@mediatek.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com
In-Reply-To: <20230515094955.15982-1-shuijing.li@mediatek.com>
References: <20230515094955.15982-1-shuijing.li@mediatek.com>
Subject: Re: [PATCH v4 0/2] Reduce lcm_reset to DSI LP11 send cmd time
Message-Id: <168422552431.63953.12117354484480390668.b4-ty@linaro.org>
Date: Tue, 16 May 2023 10:25:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_012528_437333_1D2F1FD6 
X-CRM114-Status: UNSURE (   7.40  )
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

On Mon, 15 May 2023 17:49:53 +0800, Shuijing Li wrote:
> The panel spec stipulates that after lcm_reset is pulled high, cmd
> should be sent to initialize the panel. Within the allowable range of
> the DSI spec, this time needs to be reduced to avoid panel exceptions.
> 
> Base on the branch of linus/master v6.3.
> 
> Change since v3:
> 1. Rebase.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] drm/panel: boe-tv101wum-nl6: Remove extra delay
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=fe7f4e8d496552f880d7368b482d2ccac33780b7
[2/2] drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=812562b8d881ce6d33fed8052b3a10b718430fb5

-- 
Neil


