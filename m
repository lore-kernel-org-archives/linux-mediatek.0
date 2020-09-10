Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0805C2BB84
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 05:04:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59DC1207DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 05:04:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PwrTS+RG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NP92OmHM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59DC1207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lMlVdczsOApM43GOmBpYei1xkUv9AU2PqZxP2/BGp4g=; b=PwrTS+RG515MXxBUzJO0XKFUh
	K4JqD00YpaOV6yMEWBOhWUk6zsuIPpWq7T+pmKPPVEKxErwAyexjwNxp5iHGqpp7DD7lE1J3mh/fZ
	me92y+fgLEOHFowZ9Ln5rJv+d9fXBWMRs9OI7ou4OCTw+WvPR4VnsVebzYeDE5I19lm0B0WxHDcHL
	IYA/uFWbmJ3tWJZPDIZS1SNaRt1rikZnMFO7rRK3cMl9FBwTvgrzBG4IDyYh1XpgFyl7tVeLWUdIZ
	z8ne68w3MrgvVcNz8NlTifqdQKa4aaUNF48z9eMsIO313fwDUJ9DCiFUwxnd2a4rjY/3mCkRLXRcD
	aXhmIIe0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGEkY-0002Qh-2O; Thu, 10 Sep 2020 05:03:58 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGEkR-0002Pq-Kv
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 05:03:53 +0000
Received: by mail-pg1-x543.google.com with SMTP id l191so3594718pgd.5
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2020 22:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZqFRgh97zYu+FiBtzR+Vdczm0u9Myix9WNoAZc4j270=;
 b=NP92OmHMm5OYxrBJAvqsBp+an2H6o2R6aDzTTLrZxaTjAhfBtVUlOpAqSqFbbQqo6X
 54MpqdxDG5zhecLsL02YcQw0qjGWRhq29kn94o2vBOUHWjJLAhLlE9Q6QFMWHrfg7SIu
 3jguHE2y4BA0rFUbFTU/uigpnhhX81BnzQg7PFFvryc+rgdzn40GDqRTXJdOjy4EC0qB
 R8hDzcEbs0y+bmKHuQgBY0dusah5bwmCME3Cb2mEIejaldbh2YLxj2W5sW+fcyt9Npjd
 8s3CpiqA43jZnXxhvbznexwo5RNsychyE1Xg0/d80mOb7KHQ1eGQRtk5a52fQdTRVu5A
 79qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZqFRgh97zYu+FiBtzR+Vdczm0u9Myix9WNoAZc4j270=;
 b=tYJSCPSjlLnUGJyGhiOZMiHbt8LQLxbRL7x0/dzNhVSyv/fDD3Dtr5fvTY7Ze/gD4v
 b+AaxyuKTO9FpCfrWgmC1Cbo7Rzb4gUoMXz+68koleqQRWqFLXqT9FSC5ulLGb06vhE6
 jWoyxBYp6+kxsTelr3LVuQBml3/WGKNU+eN1QPqH1/Zxn/ndV/BQMnhqhqBty0f/vKdR
 1P4zU0N7CUYTR0RTWrGq3Mm8cIvk28vG1OVy53pkO2DsQ4WU3wXZd/x0Xq35u22VmQey
 5pc+yP0TTxsFblNb+jKUo/IVD0QDVlhL6JdURA6qW5Sl5d68hPyKdHVAnncUraMacwLV
 stkg==
X-Gm-Message-State: AOAM531eHEoyKGWCRGZaJ8nM/x2a2pyRLlopzwzVTgOeWEww7WaoqiwT
 tfQsewFG23P5y6Px6MBMsCh+0Q==
X-Google-Smtp-Source: ABdhPJwH/JmaRVcMaXXgABEcKfk5wgZ5e88Hcz2jgqPwYhGXAf90BF9F/3AHEnm7w8Xe2lIp1WsRbA==
X-Received: by 2002:a65:5bcf:: with SMTP id o15mr3080223pgr.126.1599714229100; 
 Wed, 09 Sep 2020 22:03:49 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id gb19sm707678pjb.38.2020.09.09.22.03.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Sep 2020 22:03:48 -0700 (PDT)
Date: Thu, 10 Sep 2020 10:33:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v7] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
Message-ID: <20200910050341.pgyieq3q7ijitosn@vireshk-i7>
References: <1599712262-8819-1-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599712262-8819-1-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_010352_040984_F776D207 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10-09-20, 12:31, Hector Yuan wrote:
> The CPUfreq HW present in some Mediatek chipsets offloads the steps necessary for changing the frequency of CPUs. 
> The driver implements the cpufreq driver interface for this hardware engine. 
> 
> This patch depends on the MT6779 DTS patch submitted by Hanks Chen
>  https://lkml.org/lkml/2020/8/4/1094

Thanks for hanging there. Looks good to me. I will apply it once Rob
Ack's the binding patch.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
