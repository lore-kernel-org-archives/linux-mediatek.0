Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64858C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 18:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6Y6IjnB/7GXBq23acV5syGhC64cBXwxU4OuyhZd8CQ=; b=wfEggj1Kg4H/3QBb0wgSkN4vlO
	tL7i+5D8RFp14OHTLL6GKj34WiQa09CtFAQTguJWWM2ErS2W79f2oJoIx19HDeB4xoc1A3/eUtB/c
	9FXhWS67ULeQwcxGXgG4+a7vYlMjAV1TRZ7f88OjaDgrllL0AIDUrkWrL92GPugj2ZJaC+pvqiNGy
	7GouiPSAa9LkCypyEuhGnAu+6pO60eBzcJmy7xxnSmo+p0kRYcoNxkOShT8RJfGIq5ksesDirJhA+
	a7ZMvhO3ZHbyksvEPYKiYgHq7OnENxMp6A1pmolyrMnBokJiIHVPdVHgjftOVJyOAMYqITnTY15zK
	sX2Njfnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYO4-0080Ft-0V; Tue, 23 Aug 2022 18:12:28 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYNt-0080CM-7t; Tue, 23 Aug 2022 18:12:18 +0000
Received: by mail-pj1-x102e.google.com with SMTP id x14-20020a17090a8a8e00b001fb61a71d99so2866833pjn.2;
        Tue, 23 Aug 2022 11:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc;
        bh=w6Y6IjnB/7GXBq23acV5syGhC64cBXwxU4OuyhZd8CQ=;
        b=IaP7cFBpGcNi3/hhyxFebsnvxJsMy54QTl7EkiYLgJCebOU1/sY6ya+8Jj7s9gc5zJ
         m96Jd0oUB9ii7t+kjHWa0AYbqnMm5HXw9j51y4fR0GTSjpmruV6mcpR1pH2bNOo7Eh9J
         1+m93Urk2CcVD+dQQvvEOgbAJqBAErrzKbUqYPqCFKfnC9JQXmYBIYNVyoJZVAbB6LO2
         5fvVxUuzhxJTX2ZCcqC78LL+jJzs7uc6dP6iwGIMRwK76xIIh3W8VDmSaT8p0QyXPYzZ
         WxnHrnIHJWsGCnNde81/z4kR2sB4563gvDfugD+mJi4dvRasMOT9T+3eMQq+GiKhQ+Kp
         xOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc;
        bh=w6Y6IjnB/7GXBq23acV5syGhC64cBXwxU4OuyhZd8CQ=;
        b=s/w7Vc0kp7bRT5gKHHVIbF3MAJLb/Jj1rPvUtoJwPLNmPQyv/z+zDMsV+iyHeX4Ueb
         ICGSCoYwvMWSujW6Bz4nTgxi0gCKPdes6QQMzMfhMo1FZUVoT3pDjtmdQe3wvQAAJLKD
         mH30qBi9Lp367uQ9YfNcq4fMmagimWOqiJnSbyLfInrI1cmziQpz6ewfvc6EbutyYqPN
         bBl9jHPaU6zp1sazAYTj6BODrgZ1+RdXwXCoYL9eEs50cSOvovYsx87WHNCDmXBEMNNj
         EqMotM7pI46b9h9MixhomFiXTyrWguSVMqu3ht0ehqvm5Z5UO7vDNifWJ1CKNTIE6je/
         658g==
X-Gm-Message-State: ACgBeo0/57kObmevFh2Ky5KcOIVo8vWNxprlu71kugUbpNJ6ravkX6P7
	GGzQey9eGij8NrAmoR3SZsc=
X-Google-Smtp-Source: AA6agR5OMzXPWSEia1ICuDVxlmd5kDRtjxcPzDjzeIQnJSzFFes7fZNXVlt3vyVCqQga04y7fD0YmQ==
X-Received: by 2002:a17:902:d712:b0:172:e2f8:7f02 with SMTP id w18-20020a170902d71200b00172e2f87f02mr11541384ply.26.1661278334213;
        Tue, 23 Aug 2022 11:12:14 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:90fa])
        by smtp.gmail.com with ESMTPSA id l9-20020a170902f68900b0016be96e07d1sm10712480plg.121.2022.08.23.11.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 11:12:13 -0700 (PDT)
Date: Tue, 23 Aug 2022 08:12:12 -1000
From: Tejun Heo <tj@kernel.org>
To: Jing-Ting Wu <Jing-Ting.Wu@mediatek.com>
Cc: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jonathan.JMChen@mediatek.com, Lixiong.Liu@mediatek.com,
	wsd_upstream@mediatek.com, Wenju.Xu@mediatek.com,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] cgroup: Fix race condition at rebind_subsystems()
Message-ID: <YwUYfNEVIOyQXP8d@slm.duckdns.org>
References: <20220823054148.29346-1-Jing-Ting.Wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220823054148.29346-1-Jing-Ting.Wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_111217_302940_25FA5F90 
X-CRM114-Status: UNSURE (   9.08  )
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

On Tue, Aug 23, 2022 at 01:41:46PM +0800, Jing-Ting Wu wrote:
> Root cause:
> The rebind_subsystems() is no lock held when move css object from A
> list to B list,then let B's head be treated as css node at
> list_for_each_entry_rcu().
> 
> Solution:
> Add grace period before invalidating the removed rstat_css_node.
> 
> Reported-by: Jing-Ting Wu <jing-ting.wu@mediatek.com>
> Suggested-by: Michal Koutný <mkoutny@suse.com>
> Signed-off-by: Jing-Ting Wu <jing-ting.wu@mediatek.com>
> Tested-by: Jing-Ting Wu <jing-ting.wu@mediatek.com>
> Link: https://lore.kernel.org/linux-arm-kernel/d8f0bc5e2fb6ed259f9334c83279b4c011283c41.camel@mediatek.com/T/

Applied to cgroup/for-6.0-fixes w/ stable tag added.

Thanks.

-- 
tejun

