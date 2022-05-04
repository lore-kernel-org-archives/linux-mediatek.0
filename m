Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EBAC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 11:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1GI/Hn4UV27lWvEr2ainbhLiC8L9Zh0dCgOItAZCqo=; b=WM5g7oMZm3QKGB
	8QmM2tdyuqRGYXcCltXWtvbhMXHF5K13P6hINj5ZyyWuVucVzs11abRxAS1XSg+T+hIjvk9BTcvZO
	x4VmpWDdo0tkMh6Dkt1fhYwwBhAUFMW5AspgPf17HPJBP51VsdG8RPNQUNQH5PNlL6gMmBUC6VG/d
	4eAF+4LyHtyiG7WVC7ls8V/GQiejtyjzBx0WhboqMDui4OFSo3q/D5JyneBxjnG/ZIkXgp64rpp1P
	pllLTBJS0pxfL+7P0kT7d3SzpQcHuNHgmcDHp1i/HcN1bBvc6b0e4O1I2JEZ9mUhY15PZovAh/j13
	MI3bYEtED61ivfgcwCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmDeK-00Aatl-9f; Wed, 04 May 2022 11:58:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmDeH-00Aasi-JN
 for linux-mediatek@lists.infradead.org; Wed, 04 May 2022 11:58:30 +0000
Received: by mail-pl1-x629.google.com with SMTP id c9so501412plh.2
 for <linux-mediatek@lists.infradead.org>; Wed, 04 May 2022 04:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gkcv1QpvPBRPgCr2aRkAhYilhFBiQKVHreIJFm+mm9g=;
 b=kLckMQH6fBJiqE70PoR0Fycg0urB8qU1NOckAq8yQJUTCtPjHWmsxGMpSVrt9yaVDT
 9Tti/VPIJE+996dMKlk1UqsH9LRXg5qwycGgFLI0VzgZVaglcB9+wdupWuNawF95KfzV
 Z2NweVX7HZIJR10CLXF3aqDR8ZaJxC6b2X42C9kGPkQm2LDR40w6Vg2opEAEnEJQP9fJ
 cXyhZNIFKikc+vAkH3ea8Q5CFfxxcMgZMdVLVlx7E2aUn/6vkqf/Z9OsZ2WvCl54T27K
 1uFZ4X1uuJGOBv+St5/8rVXe/G2IuBeqarfh865HEugYC/TXU69Y5zkkSNDe/a1BlYpZ
 h61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gkcv1QpvPBRPgCr2aRkAhYilhFBiQKVHreIJFm+mm9g=;
 b=pMv7/CrV7fSaRoQp0+YKOH+IEx14lZi9Ic7dSvBmR8RhbDqrhwBGkFiXui9i1RJLwT
 KOcytg2TbeSBsYlRkKgWSIIJHZ2OxLVZgjVNp0juwuzJLjejGsz962vuMshVoikwiWjD
 IhJbI4ebqSIrAUG7drel1Neu6EzqQ6+4wYtEPt6Zc2r0QPngYSMyhH/Zdhiv9OJiY2Sg
 0VPFZ47fy3iRVVHZdsLLMG9InnoE3JhTjg9TfoMsqTp7nAps5+tlJfjnnnYR0ZkeuH93
 3+rqUmhs4yNT+QqD7vkgQ7kg/HBRS2FRq4Iyc1ZD94Z5kxgT7El7m0PX4iir11yB9Ee0
 Xrdg==
X-Gm-Message-State: AOAM530A2muu4xXGONFKzAibC7gWQNoZVLQZfWrWtlD+FN/Iim4RUbNI
 BFil7yTApdyCM7YYO6WhLoFR+g==
X-Google-Smtp-Source: ABdhPJx1Y8Ca1NZ/5dZjBxdSqSmXQCapxMhGjnPRQy4QecF4OQuOtBaKE7gjrz72aZcN6jTYFs5pDw==
X-Received: by 2002:a17:90a:530e:b0:1db:de96:dff5 with SMTP id
 x14-20020a17090a530e00b001dbde96dff5mr9924965pjh.22.1651665508834; 
 Wed, 04 May 2022 04:58:28 -0700 (PDT)
Received: from localhost ([122.162.207.161]) by smtp.gmail.com with ESMTPSA id
 p11-20020a1709028a8b00b0015e8d4eb297sm8134943plo.225.2022.05.04.04.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 04:58:28 -0700 (PDT)
Date: Wed, 4 May 2022 17:28:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V4 07/14] cpufreq: mediatek: Add .get function
Message-ID: <20220504115826.5qqj22x4c7jldfxz@vireshk-i7>
References: <20220425053548.72w2jh2g6lpzgz6g@vireshk-i7>
 <64c690e8edf493ec0a4a14e0fdaad2d8e88e6da7.camel@mediatek.com>
 <20220425100058.4kbvmpi63ygni6k5@vireshk-i7>
 <078b1f9b39690da98cbd3c4528ba28374a097083.camel@mediatek.com>
 <20220427031141.or2owu5wrh2cadfo@vireshk-i7>
 <346736a339bed576817179ded3795d61f71fa06a.camel@mediatek.com>
 <20220428114835.3ktimyz2tzzqdcbg@vireshk-i7>
 <27a5dddd91b3dcbd69f08c10108cdec808237ace.camel@mediatek.com>
 <20220504082249.anrvkf2ssbxyzz5m@vireshk-i7>
 <332f8adec6601f97ab2814d06330883a251e41ec.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <332f8adec6601f97ab2814d06330883a251e41ec.camel@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_045829_695469_4DA25A40 
X-CRM114-Status: UNSURE (   8.28  )
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

On 04-05-22, 19:57, Rex-BC Chen wrote:
> Thanks a lot! It helps to fix this issue.
> And I will drop this patch in the next version.

Please provide your Tested-by in that thread then, it will help.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
