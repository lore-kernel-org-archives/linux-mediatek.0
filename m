Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56423C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 09:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PF3gHQwvejOjPikUtJbdWgq8SsCjuPc9IuWhp3aRor4=; b=ZjU/e+lF9BSP6xkS8AQQbgO23J
	j54oCuS5tdLvAqvMtUzeArwoKY0QJNndJMYfTCigh4RbmwPrJz33mlNY/5keu09Fcw87paujgy6ji
	WOW5Gj1SL8xtZR/sAlCQG9prWtWJJMUfi/mlU5Q/dwEzAuMYlzXKDn9Hcw3K5SqgC8A2RJYhmlGsq
	30iFYHVj97hd8bStJdIfocl6qVxJ6bIbn0lg/HYld0Kmb2/I3vw7ih793mgXVZvagrQWDJdF3NgoH
	tFNHE6MDazCYt3ruzQl9VLeRb43XjWlEnRuJrbsAiMFPkToruXt4B11UAWldtCVAPoCXIaGo+bwlJ
	EAJBvd8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Zyp-001mMf-4o; Wed, 12 Jan 2022 09:31:43 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Zyl-001mM6-KD
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 09:31:41 +0000
Received: by mail-wr1-x42c.google.com with SMTP id e9so3070888wra.2
 for <linux-mediatek@lists.infradead.org>; Wed, 12 Jan 2022 01:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HHiZYhE79k1sBF2oLIK2NuqiDzQ4Rp7gKFX5X0YEjPo=;
 b=kzsLpi+mBQPB6AdzmOIAbGkmOFzfOVUsyYSJL2qfQvrQUQ4hHib8wkqCiFzLz6d0nI
 LGp14pihQkvSCQk/qvutd2SJQ/uV541NY7YHkZ7hHkvfxHoNnMzOpqE2iBjdOhz2vKgG
 F9XfelclKZCDMaGflhGdZQse7O7/D+R7dDt008g9HrgDtYgIXeS0IOpe/wjOt/o35XTu
 lMpMnIWSbmroaybyFf8OWr0cNJiZQZVpU4GrPCAJ9qsgl0xCPnEFNuEq1Aqn2BCzn35+
 FQ8xvcP1yqrOUzI0MhbAoux3ajVEsAS/VJX3t0fabNWvlYEm/p+3WABJ7YTyyh/r/UNP
 tAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=HHiZYhE79k1sBF2oLIK2NuqiDzQ4Rp7gKFX5X0YEjPo=;
 b=qpwSMj5YyHrcUzFGS1oufODCEJcrOE9bgzUpoTTqLEFJwcj7+XHFZ0uzTsMKRdWJfP
 MQK/98O6j1ulKQGi0Q9EflgtKBLjEBE6dyS7OcOMXMjXdh1GorjmV5pGWsJVOfAAWEct
 os10PgvtvVVxLhekX3yuMX4PRTXTFwy6g29Zxa5oZth7XVPIhj9AN1cOTRaGKKBI0rUV
 2lfom7aQVZIpsiU/g7idNNeavuJ3bCMkoxxVj/WZb2+m4lPmNCYlPoKla1r2OiT58MDr
 s70D3ZxWLyjR4pRYfU9XPIMHjWtQIbh9plj3IKLJ7xGm8X1zkCCHgCn/3VSBxPnDDTcK
 PkbQ==
X-Gm-Message-State: AOAM532cq1Zho6DHzwSdMrJlBVTlXnAKCkhoSDIQqOYlBeQvOROxn0sO
 /1tiAEW+jupOdKL2keO658xBvsbt5AiX/g==
X-Google-Smtp-Source: ABdhPJw+wQ73sm86XdksHrK8EVuUmHjoE98fvd0YYIAzZZ/OcX9kwLi4ITnfqsYfSpPDVmxT5xi1nQ==
X-Received: by 2002:a5d:688c:: with SMTP id h12mr7384125wru.421.1641979897599; 
 Wed, 12 Jan 2022 01:31:37 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:381b:6e50:a892:5269?
 ([2001:861:44c0:66c0:381b:6e50:a892:5269])
 by smtp.gmail.com with ESMTPSA id g18sm4703765wmq.5.2022.01.12.01.31.37
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 01:31:37 -0800 (PST)
Subject: Re: [PATCH v7 0/3] force hsa hbp hfp packets multiple of lanenum to
 avoid screen shift
To: linux-mediatek@lists.infradead.org
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <e7124006-4ef9-1b0f-5cfe-1d849b33a233@baylibre.com>
Date: Wed, 12 Jan 2022 10:31:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210915223117.7857-1-jitao.shi@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_013139_766643_29E9EE01 
X-CRM114-Status: GOOD (  14.16  )
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

Hi,

On 16/09/2021 00:31, Jitao Shi wrote:
> Changes since v6:
>  - Add "bool hs_packet_end_aligned" in "struct mipi_dsi_device" to control the dsi aligned.
>  - Config the "hs_packet_end_aligned" in ANX7725 .attach().
> 
> Changes since v5:
>  - Search the anx7625 compatible as flag to control dsi output aligned.
> 
> Changes since v4:
>  - Move "dt-bindings: drm/bridge: anx7625: add force_dsi_end_without_null" before
>    "drm/mediatek: force hsa hbp hfp packets multiple of lanenum to avoid".
> 
>  - Retitle "dt-bindings: drm/bridge: anx7625: add force_dsi_end_without_null".
> 
> Jitao Shi (3):
>   drm/dsi: transer dsi hs packet aligned
>   drm/mediatek: implment the dsi hs packets aligned
>   drm/bridge: anx7625: config hs packets end aligned to avoid screen
>     shift
> 
>  drivers/gpu/drm/bridge/analogix/anx7625.c |  1 +
>  drivers/gpu/drm/mediatek/mtk_dsi.c        | 10 ++++++++++
>  include/drm/drm_mipi_dsi.h                |  2 ++
>  3 files changed, 13 insertions(+)
> 

It seems this patchset hasn't been viewed by DRM maintainers & reviewers at all.

Could you please resend a v8 with :
- a more complete explanation about this "hs_packet_end_aligned" in cover-letter and patch subject and why ?
Most of reviewers don't have access to MIPI spec, and we need an explanation about what are
the consequence of adding this flag.
- drm bridge maintainers in CC aswell, because almost only bridge maintainers/reviewers worry about DSI
- fix typos in subject & commit messsage like:
transer -> transfer
implment -> implement
These typos should have been fixed way before a V7 patchset version.

Furthermore, could you help us understanding the impact of adding hs_packet_end_aligned to these
bridge drivers when used with DSI transceivers drivers not supporting this flag ?
Can't you simply enable aligned packet whatever ? is it an issue if packet are aligned for some receivers ?

Neil

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
