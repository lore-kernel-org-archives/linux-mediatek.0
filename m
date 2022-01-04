Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EF0C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kloVqiP8mctMzIo6XC5suoH/8M9g6n+53GK3L2grIwQ=; b=gQejO0q3rdDlpK
	+Rahp2w7wfVCGyaQO4dMYosYLx5yAGen64RtyUCjE4c3MMwrKEN08AjCsnKBZOGxhJCGv00rWZlPU
	pdmTHAI74PQEtalstfV9/1HxYSVtjeCIuRQqiUS8KLRS5BnRhjhjnfL1JEl3jBe8j7Gq+NyF6rmdd
	0W1YdaG2U0gWPXq4XrmDKj/IP6qvdyRT9eKYeTAczEoa8vDiOmvqKCQvWYfRFx5BC2LbYrd49B21w
	4/zk44uPW2I+eNEs/4uUL9kpZhDR1+hEM3I8bVKNbn9QbvFJTN4F1rghmesGeI+rkCmJ/CNweU9B2
	Wz+jzwzud2SxJL9T8mow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4n49-00CK1t-CW; Tue, 04 Jan 2022 16:53:41 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4n46-00CK04-Fe
 for linux-mediatek@lists.infradead.org; Tue, 04 Jan 2022 16:53:39 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so3816285pjw.2
 for <linux-mediatek@lists.infradead.org>; Tue, 04 Jan 2022 08:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TR6Cu/+uQ4xcHjIjGjwETyTTXPP8JtD9qNRslKv4f/0=;
 b=vdNlWBcvqr9GUl+R/98nLAfw+u2Ra7et3aeVbTuhljHhbWNXb/s8lAH+uTP42OEn/H
 yQqDdCP0YOdOP5+E2C+CcEn1H/ZTblFPmHWi5s9OBOVRuovSqWSr5uJoXCj5QKOOaP+8
 i7qj+yUKwyIE6VCEkdX4bd9x+umWGTC2L9MFOnW2+zFTmhyB3sJo9pvepSFVu+rj2AM6
 c/O6OmReomp0ml51dLGKbjP+o+T7HgKM82v6Gt0IFiCh0ibmhPFnwybrDDRwylRwfrBQ
 gdJa+IhfhI779z8IWuu9x+6tJqXXTEdLJUvfFrcWEzvkpdsYCZPNINHR1RG5zfnSqCzn
 b2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TR6Cu/+uQ4xcHjIjGjwETyTTXPP8JtD9qNRslKv4f/0=;
 b=j7AAvZ0bBm3XyQJlMQwHYxc92wF1x/nwYMysBqhMVNdeB/ZC2o0yt7WJNpwiVcz28L
 goV693gppbwVgl2hFqgU89nyUEs8PJmqbgMchSFPjCc8HpICQPgn0kzVWITVAaBc38J9
 3BEN9gtYu04rCsA64akSkPrmzSJeHGkK4vgO7zHeE9kSF22O25dE69I0CXl4GhRoxH/P
 qruwXsa0SJD8cei2rbQ00YQjf3QGN7X7YQbuybkAEkevADd7C/finSSj+hdHGf1zIVr+
 23PNadNA5Lgo0xPByHkj0gKFZyyV3fRe5zhB6JlcGMGvnbFvR/8NwDNpG8fHPpUdKQAC
 bL7Q==
X-Gm-Message-State: AOAM5334QpiEO0EhZtVlPsr7g5lAhywumlM2yXiaLWqY2aPctr471FLO
 JaaIqyeAxI50ZDhg8fHE8chwGA==
X-Google-Smtp-Source: ABdhPJxxmHvZgGCzzsPyI8u0TckTilqGSoSSh4At+XAfLQ5zRVilq2nw4Y0oNP+piBnf63zHvwW7gw==
X-Received: by 2002:a17:902:ed52:b0:148:da08:9a6 with SMTP id
 y18-20020a170902ed5200b00148da0809a6mr50131155plb.89.1641315217634; 
 Tue, 04 Jan 2022 08:53:37 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id e3sm2062480pgm.51.2022.01.04.08.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 08:53:36 -0800 (PST)
Date: Tue, 4 Jan 2022 09:53:33 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/2] Add SCP support for mt8186
Message-ID: <20220104165333.GA539868@p14s>
References: <20220104114706.27461-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104114706.27461-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_085338_548687_F8162FBB 
X-CRM114-Status: GOOD (  15.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Allen,

On Tue, Jan 04, 2022 at 07:47:04PM +0800, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> changes since v1:
> - use mt8192_power_on_sram() helper
> - add MT8186_SCP_L1_SRAM_PD_P1 in mtk_common.h
> - add MT8186_SCP_L1_SRAM_PD_P2 in mtk_common.h

It is quite hard to follow the evolution of this patchset.  The second revision
had a "v2" tag but this one doesn't, which can be confused with the patchset
sent on January 3rd.  Please send another one (v4) with:

1) A cover letter.
2) The right SoB.
3) The right version tag.

> 
> Based on v5.16-rc8

This should be based on rproc-next[1].

Thanks,
Mathieu

https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/log/?h=rproc-next

> 
> allen-kh.cheng (2):
>   dt-bindings: remoteproc: mediatek: Add binding for mt8186 scp
>   remoteproc: mediatek: Support mt8186 scp
> 
>  .../bindings/remoteproc/mtk,scp.yaml          |  1 +
>  drivers/remoteproc/mtk_common.h               |  3 ++
>  drivers/remoteproc/mtk_scp.c                  | 35 +++++++++++++++++++
>  3 files changed, 39 insertions(+)
> 
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
