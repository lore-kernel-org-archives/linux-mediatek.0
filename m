Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA94C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 12:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0kKvU8VcjZDCawm1uzpgifPJsmcOM7ycSUxGftpKlg=; b=SJfKOjOUD0jFmr7bsaUu73gIwj
	35JN38sSAxhId/72Lr/xtQQ1O3D7Ac6Wiyx6SxFwdeEka5tyDxA2y08FEubIlXdB2JcTyEbBn0E3J
	kWf7NA7t0VDRFmiDR0vlFrEqDk1TCxDHOy0C/xnpCD2Up7t57qx7bwAhGKH/cLDY9KL1KI9+w1ukH
	h+5zVfZNqIAPPUOkimuKSvVXjLMKeT1foJMdtrnXG7cvNmkZHOp0Akjdg64qicpTNYHwkcrUL7Tok
	IpLJA0n3ZjSMuC4ApS+MjkKIMSDIe8zGmhxUddC2qR0iTwV83RznsCvZ7oY+4qMIiz6SmOZ/Bji4L
	ThJjtYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyXhL-002AiO-0R;
	Mon, 15 May 2023 12:53:07 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyXhH-002Ago-0p
	for linux-mediatek@lists.infradead.org;
	Mon, 15 May 2023 12:53:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-307a8386946so4925928f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 May 2023 05:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684155179; x=1686747179;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0kKvU8VcjZDCawm1uzpgifPJsmcOM7ycSUxGftpKlg=;
        b=kQQkiCuyGeHXbQ20FCvkY01rdbA3aktukV5cOjcESX8wfW/rZ9oJjouqt5mIKEhqsI
         PJV3ds2mEk2TUyI7S7xOG+4APL9bxRIQGGDfOGHCLXx/wbQf0HbDlF4S51t0R8rChBKH
         d9m6yO0N+aWBZYSJAaCBUHqxbji+yORNy6AVsQtBcQpb+YkgtPu2jfzEWkUOw2bUgvcH
         tc+1OBd1m8fNLUxTv9Hddv/qCLeu3pccjYlVoWzSnTAexzFijNJoVYW7XikJU+pQFyvj
         GAkyslBQvJrnQrtJNWwZOusXwsr4qvsZjC3TYxdXi/XFnD4nCcxvchRnqQeamGQFp3Oz
         HO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684155179; x=1686747179;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0kKvU8VcjZDCawm1uzpgifPJsmcOM7ycSUxGftpKlg=;
        b=L/d1Ah1hT4B617zqMoOyMdmRGi+YthlVS+G0/jKL5v719cIcF/8Z92oFyRP1CkXHru
         UwAyauLitFu91Xar8HDlBEwMBklTCiIY7nqyCenxG0NFTeO5cQ6jjoZG61IuPAVzetpw
         AgTqIeam6MBGKQt++qInVIvJFkC+jTiVSq9UiktHBQU3bxinWr97gimZ8WLRkcxhKybs
         c2LnqDEzMwxdkg50LcYHiomb+k2uIXLafrFJkWlQihuCneieaBhsUnbDVPxg9gZipBa3
         gfbzzomIzFbvSsb2pdxpkqfBNxy4AmQ6asYJU+iSU+F/oAXTr64VpOQamDwqn2NCgp5L
         9luw==
X-Gm-Message-State: AC+VfDyQU+YkfYN4p4B9UH4roci4BwFslzcavVAp/W+BCccY16Ahdd12
	nUG/y1vbN+B7QpVaDG7c68ixVA==
X-Google-Smtp-Source: ACHHUZ4pr0OZs/JDMmps+IUMP9qKK49qZJW95shiWiZOKkfFhc5PHKAymSNXqXTfWXrzamNqen0KYQ==
X-Received: by 2002:a05:6000:1b8f:b0:306:2b31:5935 with SMTP id r15-20020a0560001b8f00b003062b315935mr19376409wru.55.1684155179018;
        Mon, 15 May 2023 05:52:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d6650000000b003062c0ef959sm32197342wrw.69.2023.05.15.05.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 05:52:58 -0700 (PDT)
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
Message-Id: <168415517821.3264861.11690266641021902230.b4-ty@linaro.org>
Date: Mon, 15 May 2023 14:52:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_055303_433992_738FA831 
X-CRM114-Status: UNSURE (   7.44  )
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


