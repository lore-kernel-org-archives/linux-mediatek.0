Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB03C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 09:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KP3fUTyMybxgWttXPM/YRNz1NTtNbAM0PqEpXEZLz7c=; b=0/sG5SG1rAfMbboCUgSCB43Cen
	Revm2zrvtIvu9Z9nnmwcmZU1gRsokedCkwymL6SlO41kcpYhVOF7FlEWBGt/QkXzL3XL3S3tMgs2N
	r8ZEoJLH4p5Q1gsmFMwcKzrfUT34s7y5jlOtu5DtFRVXn36YGjkQX+7ENDDtPJYZOYD546NJzJLFz
	RiSNruK93KoHRcDa/q1SwT8F7nSPMUOXgnHYb8CuhNYUUe/QmIQft7FwAsuB+/kXfix7INgBbVBo3
	CIjPmqCrA1qUyZVsN7KiwKnXk3sJpIqlBhgOp6kiyW87W98K0D1gUCkqxx8wk/IlJmuaqE6t7RfUY
	apj3xjfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UP2-00AoyQ-7Z; Wed, 29 Jun 2022 09:54:32 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6UNg-00AoHT-6D
	for linux-mediatek@lists.infradead.org; Wed, 29 Jun 2022 09:53:09 +0000
Received: by mail-pg1-x529.google.com with SMTP id 68so14809688pgb.10
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jun 2022 02:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KP3fUTyMybxgWttXPM/YRNz1NTtNbAM0PqEpXEZLz7c=;
        b=ntA7j9Cl/DWRky+1M/dkgSnk36GNGlzhY2GKWi1LRGfbKwwXWq+zu1HdLsfanp1a6x
         FHxTUbZBzP+PtS4V2EZrTOeBn2jUS4SX9s1w9HQFHiZqwLvzZg+WPs1A6VHw9bKqNXQx
         8Mp4kIFmfOwv8IxTeaz+ufoIv61CTt5r52dIfwAqdj5gJMSMrUGtKCg9QTOlfkFfM/Ye
         uXO1jA8w7RVFtuEDATSc4DKy2Wz3I6wjkDXiwfgxnFPJPz8QlofbWrkLkuHX7OjYaJTy
         oh5i+VMyMeoq1iOgGEtNmSqEvszJTMEG7ftA1sH7Tbz8zT3vpaKWIJjhTa959Fk7hkJ4
         U6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KP3fUTyMybxgWttXPM/YRNz1NTtNbAM0PqEpXEZLz7c=;
        b=pV5qE70xQlyjc7BPv3E51YE2tNZXDP9EwmzSwrNwQDatIBz/rMNO12YhflLgetX1RG
         fDO+CfnW+TcagjtQ35PCZ8axn/kpPYbRyBjn2PhbNC5DlE6R+MYaqXlv5bvl4twbRiUX
         +11Kb6lkDnZG8iUFXIv87T48MJA8BHmiROhzj/BSPUF+TzJWHQd0tvzOv5zMQaAk97Bw
         C+TMZqzY4+pWqt7se7+zg6mBQ2lx52cfDmYXHBtX1JaTc3WVKY7xiTQk1CcKCnKpP+fw
         yrX9xbAneN6ybp7JcTF+b85GzTY2X3xvmhmXcC1wHBrnaAtozJhT/hjFbaj1OeWM4CG/
         /5yg==
X-Gm-Message-State: AJIora/r/dSD/5HziSdU6LP/ZPZven51pmgVs+rlonhBql6BqQJGW1jQ
	SR36Chy0uLi56rlW8HAb9dgv+g==
X-Google-Smtp-Source: AGRyM1trCTcCPBGGjudqgt9dfnfvoaMrWKGbiucA9M7RkpihgFrxiiiyoBP+0Cw4+jlVF4BRJmG0eg==
X-Received: by 2002:a63:6943:0:b0:40c:3020:d0b with SMTP id e64-20020a636943000000b0040c30200d0bmr2333956pgc.34.1656496385621;
        Wed, 29 Jun 2022 02:53:05 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id h24-20020a635318000000b0040dffa7e3d7sm5417918pgb.16.2022.06.29.02.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 02:53:05 -0700 (PDT)
Date: Wed, 29 Jun 2022 15:23:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-pm@vger.kernel.org, daniel.lezcano@linaro.org, amitk@kernel.org,
	rui.zhang@intel.com, rafael@kernel.org, dietmar.eggemann@arm.com,
	nm@ti.com, sboyd@kernel.org, sudeep.holla@arm.com,
	cristian.marussi@arm.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Energy Model power in micro-Watts and SCMI v3.1
 alignment
Message-ID: <20220629095302.bi3xx6yicsnjeff7@vireshk-i7>
References: <20220622145802.13032-1-lukasz.luba@arm.com>
 <be793e51-0d89-7afd-e122-ec929a1130e9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be793e51-0d89-7afd-e122-ec929a1130e9@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_025308_293085_19C96444 
X-CRM114-Status: UNSURE (   9.75  )
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

On 29-06-22, 10:49, Lukasz Luba wrote:
> I would like to move forward with the micro-Watts in
> the Energy Model. We have feedback from our partners
> that this is a limitation. Also, as you can see
> this uW is part of the new SCMI spec, which we
> have support on our roadmap.

Should I pick them and merge via PM tree ?

-- 
viresh

