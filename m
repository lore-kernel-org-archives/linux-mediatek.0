Return-Path: <SRS0=CwkH=6H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FB4C54FCB
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 16:07:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20DCA20728
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 16:07:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nlWFIxW8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mu5AJ++c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20DCA20728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oE9BdOIsxYAFvZ7NOCZM60qWxzBqau9HU2copPjl0uA=; b=nlWFIxW8jiYo1z
	PR/kkWWxIdub9HMpj1El1Nhs89T5tAC3Bq6Q+pDiEX+64PE0jX8gILtIgxTdZXOdMd6op0/ezIZh+
	j3sIjYLavwH9Rw2Z8CXGOg0D2wxKIakDXNrus/jSHYl1JNcaEcuZoaIHyrHAUNo6bq0pxehYXEfyv
	DyKOJQvDIQ5A0TNtoE12kwkUoBoD1t6G+cWbaVONUIBPbhb4G2eItw1EQJLVfXWk8sSXaDNtYOPPT
	xDO8CeA8TnRZorThgUcvGh6KIK/tRW1t4t0Z4FTCLG4xDts7/juZr6Tjy1NBsKvOvdj+YYZnsm/jm
	6GgdlHzVoPwpXxf9E5tA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jReO4-0003Iw-TT; Thu, 23 Apr 2020 16:07:40 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jReNu-00038B-GQ
 for linux-mediatek@lists.infradead.org; Thu, 23 Apr 2020 16:07:31 +0000
Received: by mail-wr1-x443.google.com with SMTP id b11so7488441wrs.6
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2020 09:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JilRdq2BDhA1AKoin3Th54s1noQnrS50Fz/y17AV1jA=;
 b=mu5AJ++cQsxccfAWV5JOLI/SgRQB86tng7pTsdRiA0kz/jrOGnc32OzFYt/7FPwzzB
 +RKxvAWyG3Fhb/LTxr6iLFG7Fqd7cKZchlM4nPOFnCKoCRxMGn7M5oQDMCMFbxxLhDGe
 5X2igq6lLyFRp4YnVVxEseuIDVoFkyq+mdHi+Zisfd8Pp3LapzbK+KzPaARkQ4AAAyz7
 bNs+1FaBot8KfjfQNqxRFuFjrp9Rx7gmbOUG0SjUisIrkJPmKAomEWKkRNJRPC7bZciu
 H7JBYPscd6A7+6TIJnHQSIdrfBlMdUZgWFGabEUO3JDAeXaryLKlgvKAiL43TvO8v1SR
 jQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JilRdq2BDhA1AKoin3Th54s1noQnrS50Fz/y17AV1jA=;
 b=U945vhO8GxZEjF6DMD3TlfXzAdxb4IkRbxMZo62RvqcHXAr91rPXMG2JFS45VxsGcK
 gza2d4bxKAyi64va+bjGtEn9jVikcJtauPjgsn3/A2/0pqhR71ogrt94YlWhgEF4RZWY
 uIFcreUyDAGyZVXOrG7l4tyJZIfEsm66nrGz3tHJ/Yaz7oZQv5yBBa/D83EMPdB0HKcu
 nnZ0CGFJDTG1bU9D/P1/0uebXYLEKhc+bIiR6fUwzb55/CAQgV6oE29p4o9EHq6lgLrL
 CcqGUlOVIZeTPj7sGWhbu+zo1xcV2JV8ihGr8D/ByCRVblw0+i0Fr/cDoHu0SgDXE1+w
 nREg==
X-Gm-Message-State: AGi0PuYGj7+9HbdtSkNbaOl5KtKmH/OgYPl7PLX5BDJBQsESSGZzYaVP
 AHgQc7JEq6mrDk7GeeGaxO4A/w==
X-Google-Smtp-Source: APiQypLW+PKkIM2+wwd4rW8a0Cu+5yfXB9aOs7exzbNq/9IiN/eo7uFJ35wUPd5bS6ATZyaoXdBIzg==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr5482028wrs.22.1587658048446;
 Thu, 23 Apr 2020 09:07:28 -0700 (PDT)
Received: from linaro.org ([37.167.216.250])
 by smtp.gmail.com with ESMTPSA id g74sm4308279wme.44.2020.04.23.09.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 09:07:27 -0700 (PDT)
Date: Thu, 23 Apr 2020 18:07:23 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v6 07/10] Documentation: power: update Energy Model
 description
Message-ID: <20200423160723.GE65632@linaro.org>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-8-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410084210.24932-8-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_090730_594298_BB14ABD9 
X-CRM114-Status: UNSURE (   6.01  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, festevam@gmail.com, mka@chromium.org,
 robh@kernel.org, amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 b.zolnierkie@samsung.com, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 10, 2020 at 09:42:07AM +0100, Lukasz Luba wrote:
> The Energy Model framework supports also other devices than CPUs. Update
> related information and add description for the new usage.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
