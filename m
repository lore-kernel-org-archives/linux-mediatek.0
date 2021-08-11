Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B36C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 10:15:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0536D60D07
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 10:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0536D60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=48xpLWmdoehjj1yj0UviW3QA6X8XhpjfDOR4eUxhTcg=; b=2KvxHppqVB2N5n
	kCsSyl/ZpjtaamiHpxtp/AveMMys0poyn+PgsVDGHCbTBB7boiJEpJjRNgTCRpj3VaQelEcB2rQj8
	ysz2Ba0++RDXBL28Whmxi5bXXtDOAivo4Bm8kgsQIn9S76cEN15/nrbzv3bv0t7WrEGRvdebai8SS
	kvN+Xg+NUKJHojdUkub+aVtbauAH1MrCNl753nC7zSWsgW9XbpSfAns3uKnd3zT7fmgjuxeDLOWgQ
	y89VQrR+Twi2mgmB/BC/wiSrUwrDzhMbuK1UXfR7+DIC8O3kt5ghaSkjvOMv6RR+i49bkO5Ld0ZvB
	UQz3OfOubsT++6Pz2GoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDlGj-006abK-FR; Wed, 11 Aug 2021 10:15:29 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDlG9-006aIL-6b
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 10:15:00 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so8739205pji.5
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 03:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Rg+nfqNpN4KVS6P5Kg2kgnadiI4aRZsAUMlE7w6kB2k=;
 b=ac4casP3kUB13OsUJQcv38FKO7pVIq50bZ6uPGU1NEdpQ0ASqnp8urXzheGfF4JgZJ
 F0GBVqBxpnRY7eoErIyp2IabG5QIpaejNKNbwc0aQqxzw6oZgMJeXCdM+On3gP7GcwAm
 Ze6ZM7NUk6+K3utV/jdB+12kqYzQTqBoRF8pt/wvWMKT0t0AejJqeovqCSNaOQMJbO1L
 dD5NFrhUjhU22SWOPidIBz2QfpP5F/XNnFPgeAwhtmB5nt6HWk+7H9MN4LVZKKuaHvyE
 KiuTQa4lU4FT+xPngVH2NJUbPObjZ/HoPrBwxQiQRHH+/uoJ61KSOscQQ3Qen6LcUrLD
 YtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Rg+nfqNpN4KVS6P5Kg2kgnadiI4aRZsAUMlE7w6kB2k=;
 b=S605hyAkmwF/aVwaarkcRkAO1gnRXode1I14kBqOyFuIqwWxEUdBnzxba1CV0teL8h
 emYcgC+sQ9mRXIn++pQii7aa136bOytv139yE1jO5QhbJok8GGMhjmW4eHb2c+dCjQgL
 FH+Vi633dMmlFmWRb9OvrssAVjERkLmWBc9w7LYQc6xdEUJyuF7cFIAY0tgltmdTSCfv
 V2n/LOckl244UJ1Whj6zZEKPS7/J7NYLpmIfPnGvd0xfU+uAYyRB8BEASEozo6pNjJ29
 Tq5nNzfiYf2wyhUWivbWpmm0KxpdTBGm0eEn5DrZ0MAH2aWqnLZYhEai8L7an84R7vTo
 r34A==
X-Gm-Message-State: AOAM5315WCES9CN7JNSwrAOBQNBQtoXpf1ti8cOhK54EFcCEZw9WCLL3
 KgruulUPbWPNExaDY78Hry9Kuw==
X-Google-Smtp-Source: ABdhPJzXjMW9vKhvdq5O6Gt8ct98tc27N2TMRTz0kLhqKVJ5iHf/FGC7+T3yYcwqi1noPFO5FkhCyA==
X-Received: by 2002:aa7:9f5b:0:b029:3be:2a1f:ca58 with SMTP id
 h27-20020aa79f5b0000b02903be2a1fca58mr27592438pfr.46.1628676892055; 
 Wed, 11 Aug 2021 03:14:52 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id j25sm27085750pfe.198.2021.08.11.03.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 03:14:51 -0700 (PDT)
Date: Wed, 11 Aug 2021 15:44:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Quentin Perret <qperret@google.com>
Cc: Rafael Wysocki <rjw@rjwysocki.net>,
 Vincent Donnefort <vincent.donnefort@arm.com>, lukasz.luba@arm.com,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/8] cpufreq: Auto-register with energy model
Message-ID: <20210811101449.c2533ediwboeplqj@vireshk-i7>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <YRJym+Vn4bbwQzzs@google.com>
 <20210811051859.ihjzhvrnuct2knvy@vireshk-i7>
 <20210811053406.jqwextgtnxhgsjd2@vireshk-i7>
 <YROc95YKA1Y/TfYI@google.com>
 <20210811095311.e6wnma2ubkqdtuic@vireshk-i7>
 <YROin5WudmmEPard@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YROin5WudmmEPard@google.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_031453_280803_29C88E9A 
X-CRM114-Status: GOOD (  12.09  )
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

On 11-08-21, 11:12, Quentin Perret wrote:
> I think using the ready() callback can work just fine as long as we
> document clearly it is important to register the EM from there and not
> anywhere else. The dedicated em_register() callback makes that a bit
> clearer and should avoid a bit of boilerplate in the driver, but it's
> not a big deal really, so I'm happy either way ;)

Yeah, I think just the same. It is better to have register_em as a
separate call. I was just wondering if it is the right choice :)

Anyway, I think ready() will get removed pretty soon, so register_em()
will work well. I will redo this series and send it.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
