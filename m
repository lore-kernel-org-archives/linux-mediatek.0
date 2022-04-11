Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34083C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 03:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IU+zTBEBB9Nr+fRksRt1jviIMBwqLvJw5ui4FLy01E=; b=GnY+G3FcG5pRfZ
	B5tEE8zmoPjJiKC6U8CYoeQwhPiVTdyj4x3iAtWa2j0LNyVz/8fZEM3S+Dt/Nl3QlBo/g2IKo+9ir
	4OSrzVRDcE2ZuTUhOruiovxZNH1KVZxXjEflMCeX/1ZEWiXr2KvNQCqDAfQCFDWru21KPSott2L2H
	wMWeZdlGuGDHOOxUxbF+lOR/WqgnMINPW05+BiSLXMIJDp88JDAUUYMwC1QzXMk/k9ymIc84FwqYR
	sM6DKX7HRuSe7M3TyEaXfdSOFonC5e/NCSyKXb6rIAaJKrXNGKShWrdHRNB3y9tLkeweLJAl6M/t4
	BzlaHgTaTmdjWI+d+DSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndkZN-006QnX-Sj; Mon, 11 Apr 2022 03:18:25 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndkYn-006Qdb-UB
 for linux-mediatek@lists.infradead.org; Mon, 11 Apr 2022 03:17:51 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d15so12715416pll.10
 for <linux-mediatek@lists.infradead.org>; Sun, 10 Apr 2022 20:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Dc09Mr/cRd+6iXXPVvE/h653BCcb5B6zFZqdYQ/noeA=;
 b=rzMBqfjbH13GjkNd1tBmKo8aloT92MH7r8uQkdBA376vb9LAQ0PHIrhQbqJkYk5siW
 qETuqVGhOBNPDjVkS55FB1P6dcHmapNUBDi9MJ5mE/YdpnNxwZ08J93t2/I31LjcdVWz
 xapIz9qLKpPnsXJ/On+QC8ZN8VL2nCh6e11OcpggkVKa+4009UNF5LxyjOoz3XRfUZYM
 4A983aYwACy9/4W3EUdP4eHBa/bg/ElgS7VMWJhew/XQDk+HaTDb39opLgiHsajsHNLF
 287aoOu1OEIuevlxZKmCEafIbE+fMwRYw42aARJMeYcKbqIPKX/9u1i7CNns2cBkuHI9
 F51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Dc09Mr/cRd+6iXXPVvE/h653BCcb5B6zFZqdYQ/noeA=;
 b=E/1tBTTYDZFwJLF5rCuMvMiIGEYhhIZ09r69mxA4G0FFV792qBdG9gabYX2KZR7jbk
 WKIhJuzc94an+CdnR3VxRNqpmvs3B0+vWC0yMZbXNFzgCxdru/q5d+58HCBxqkgV47rV
 g43OslsSdZ9Rx/FGcIjC2EMouQg7YHEBr8nf04+ix//QetYv6gLHDjWQVDFbCrxZ9nUS
 tyADxYfMcGPeO8Peo8gUJLMcyqC2xYVz+HuGO2HXTLGN0oLs6zSlDbqMNKd1HIFKPmMF
 NZt/F3R4v9K5ovfcN9vvpcar3a3E8C9YAcl6bgsi9hyeL3ciz1BoCCf8DDb0sqR2eSOg
 9zeA==
X-Gm-Message-State: AOAM533Dp1hN+BUCXUOPpRy2zWefriOctAH3/7JDo5B9kPkT/d2ek+5I
 B53EuColpD6w+/dgxSXUM4EYnn7KXGTOwQ==
X-Google-Smtp-Source: ABdhPJyZOTvJy00/iB836UyFTnhof3BtvKwJ4OR28/djCJgk7YRRuAcgMOQaw3eMSXkioq1mIoheSA==
X-Received: by 2002:a17:903:41c9:b0:158:52e6:343d with SMTP id
 u9-20020a17090341c900b0015852e6343dmr5509730ple.146.1649647067276; 
 Sun, 10 Apr 2022 20:17:47 -0700 (PDT)
Received: from localhost ([223.184.83.228]) by smtp.gmail.com with ESMTPSA id
 p4-20020a637404000000b00375948e63d6sm27214717pgc.91.2022.04.10.20.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 20:17:46 -0700 (PDT)
Date: Mon, 11 Apr 2022 08:47:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 jia-wei.chang@mediatek.com, roger.lu@mediatek.com,
 hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V2 02/15] cpufreq: mediatek: Use module_init and add
 module_exit
Message-ID: <20220411031745.eumhltqjldryp6rb@vireshk-i7>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-3-rex-bc.chen@mediatek.com>
 <1e3338a6-d1db-6ae1-2cd2-d45a4babc844@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e3338a6-d1db-6ae1-2cd2-d45a4babc844@collabora.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_201750_006986_045D6679 
X-CRM114-Status: UNSURE (   8.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08-04-22, 15:36, AngeloGioacchino Del Regno wrote:
> Il 08/04/22 06:58, Rex-BC Chen ha scritto:
> > From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > 
> > - Use module_init instead of device_initcall.
> > - Add a function for module_exit to unregister driver.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
