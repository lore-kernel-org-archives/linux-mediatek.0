Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A55C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 21:47:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E64B61461
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 21:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E64B61461
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3DQXd7Mst9naFhzcluBz5GeRclIzu8FZew/puahaxLI=; b=NFWaxLqq06wqX8VaUwgRiHEg3
	A/sINR/x7CGb5s0QV4Yv4aTXn+EG31KRHpSPevBg3N6tJqc1veEjbmoo91S5pOHt6IJgnZhyWHrsK
	HEf0ogeKCNAeDQoQAQQDVRPxtpynD+o1IYlMm3zNVTL2dGIaWVNyTi37aYfhuM1JQn6jQ+ijfuPhI
	vycNxGMej+dCSleAo8HUQF3eq2G6TS1r655NSh+F7jCyGSQ/OR3PELkST6DFz7Ny0SME55KVAkco+
	/wBFPaSbDR7nOldA2joFknQnxLn9ONbju5S5rjEW2T8RuYwygfDI4QRiWbxRe8GmB2eGxIhmkHqqr
	SK5oP5tKA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcEUv-006ayJ-8N; Thu, 29 Apr 2021 21:47:01 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEUt-006axf-8B; Thu, 29 Apr 2021 21:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6G39G1xHQA9UdkOOBrGZrs5TTQa10r2qAl5rnu62VAg=; b=VUWn0pjz+ehiJE2an0CXGaohcB
 T1TiMk9dDnFC8lCAvH3sW3z7x0YCrt1ErbJa7JMK3632AY5pHVVMtX1X2zQHU5m2h9t/PavPSN2DO
 jeKyO3F2kmFTr7hF/MnGqnKD7aHMo1S511INgLuhYdfpTpgxkMVx9tYfLtpR8ftdFs+0x6ViRCwo5
 qAwW6e3RwUSN+4lkYIJCpIQ22jGbYyOx99q5cMcxvY7Oyj3yCpnRxfZCAubm876FWV1Tc9iY8SPjX
 /DdYy17f/sxseP+AWxu8pP2ulAWATfSjFpgD2qsTLfnHNVm3INi3ja5U9GqGtkq40bktraE5Lv1b6
 Ce+o/p0g==;
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEUg-000zgW-Jz; Thu, 29 Apr 2021 21:46:47 +0000
Received: by mail-oi1-f175.google.com with SMTP id v24so332538oiv.9;
 Thu, 29 Apr 2021 14:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6G39G1xHQA9UdkOOBrGZrs5TTQa10r2qAl5rnu62VAg=;
 b=FY6K08lwLzpxxNfdQWx52bBRMq9SGHTqgnUqBo1AcmlgWsoNhS7Yv0YE1AiUHu6TC6
 7wak5oa0dMJEj2rLCyp6Xg2L4S2vegFKCYtWKahv+0Y9NMJfuvLMKP1PdqpUJJms6XE0
 VKi/2Adntbli2Hm6vU+UQKW4BV+zObXwvbIR90mAfymdpVEBiY/vxMACN91d1c1IckE+
 Gnjoy1B1HC/UjbL7cpYsHAMz8a13ZZUFtZdaCdXoQkmWZtHLwVHBOs6dgCHEK2+1Q6xd
 5s2X0taXlfhGuuZupUMFz0D3xdP39MvNG8zvJ76K4OAs/9KByhVgp3NjrmPBAlz39tK1
 chOg==
X-Gm-Message-State: AOAM533hksPbU66h5BypLB4ro7sMg6nYjBtXFC6ouJYTwnjKErYbHYtG
 +usU8AnLrDC1z9vlvwET0g==
X-Google-Smtp-Source: ABdhPJz6DS0O37UozfkVTmi9KY8rpR2H+AZid6mjNopmy+3v+KVTMdbrNkKvueY2vCJmTd1xdVxyHQ==
X-Received: by 2002:aca:b05:: with SMTP id 5mr1534812oil.113.1619732805676;
 Thu, 29 Apr 2021 14:46:45 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k8sm265270oig.6.2021.04.29.14.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 14:46:44 -0700 (PDT)
Received: (nullmailer pid 1833518 invoked by uid 1000);
 Thu, 29 Apr 2021 21:46:43 -0000
Date: Thu, 29 Apr 2021 16:46:43 -0500
From: Rob Herring <robh@kernel.org>
To: Wang Qing <wangqing@vivo.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V9 2/2] doc: mtk-wdt: support pre-timeout when the bark
 irq is available
Message-ID: <20210429214643.GA1833375@robh.at.kernel.org>
References: <1619315527-8171-1-git-send-email-wangqing@vivo.com>
 <1619315527-8171-3-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1619315527-8171-3-git-send-email-wangqing@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_144646_678766_369A0784 
X-CRM114-Status: GOOD (  12.23  )
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

On Sun, 25 Apr 2021 09:52:07 +0800, Wang Qing wrote:
> Add description of pre-timeout in mtk-wdt.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
