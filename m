Return-Path: <SRS0=0dL+=DQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D41C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 04:19:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91F2022227
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 04:19:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LivVWO/H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MOnbeaq1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91F2022227
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VX1xHtcwmlXWV2ZlMZnXZzS6BbiGIwUDhnt4MPTa1+I=; b=LivVWO/HzTbHI4ZI64NNY9bf7
	6Tm+jS3navWvUNAbSPMpzpZvFyb2pI4ad7niSmwaQawFiM7AQxdSLqFC2ppIbIphSfOQhL/1RZlob
	B6znLhnA6z4tDBaEb1M0/JbSuzApH8KCc7GaMjyBDlkIobS2GKHDUO6Z+y3uoNDySPNg3wUfgmfzY
	aD73lNtZ6yJqSZb6YI5x4y3o1HfZOesOOBIeNfOqwXhnjEenxiku8qE+ZXcR0vOclFK1UsdxUmbuk
	kScIvh61Xo5k+IpHYZXUMv+G46QYooCk5oGXcDD/vCDaLsDi2WJjhtm69IBM1H9cRnnoUgmndEIlL
	06qKiXITA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQjsI-0006Ac-0J; Fri, 09 Oct 2020 04:19:22 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQjsD-00069V-Ad
 for linux-mediatek@lists.infradead.org; Fri, 09 Oct 2020 04:19:18 +0000
Received: by mail-pg1-x544.google.com with SMTP id x16so6157567pgj.3
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2020 21:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+2sSjHIG8dOPiZAXe+oXr0N+ieiRQzjEGoSV/P6Yznw=;
 b=MOnbeaq1cy1kAz5S/jKS4LOB5ahZWaJg+qQvOwJnOIb83e8inibG+ODF2HH7uDVP5i
 fplFUgs4IWxPuRzurmPhJcqSqvAq46+3tSQZjV/qrVul3Q00g0k1zYXsPbDvx3wucYrb
 tVNVNBzoEa+h6c1oZuDDrzBX2fZ2tlrbPrhCn/29POB7XdFWOmSe9/Ytiloiq2MpLGKk
 kWx2xTFyGdqoDk6M50to7YNY3GbgkjrdvOwLZ2JS1dBq6/kfwYtGKZSOJRKzuFI1GCVg
 dK5yPDcbmNBpE0xTtocEXCCf3to9O9V6Ba87s9PjMdiylDce6zUCPz1ZJcj2QtT5Aid7
 Mrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+2sSjHIG8dOPiZAXe+oXr0N+ieiRQzjEGoSV/P6Yznw=;
 b=Xnzs5ZBH++BbGeud38ox4Uzh9uWZpJi8ccIO+Qh5ZXlkd4m7xuSWhY8ft4KiDqlsmd
 mVENuPk3AO3GHwaqgUm07bLcsTeQb8hMb0rP4XvBabvUETpfi5/KcRlt9oTgSpo2Q4/x
 rKGnMFNXF35VT9BEeHTlXF+Tv1KW6Y+/pAnS8VLKC5NXp4KUcy6WKKKz9YDSRsMUfFYK
 0uRuqvByzc4KwmLqxEH2CnVxs9F6uLeeoCNRp9TJx8ZIKysMFrTYDijxx0H7/Xopvsp/
 9Mx1tUspSUzY035lz6vSo9ga8n1PJmNHSHnQZ1dKSRcvw4Y6cZ6EzX7duRoe0oh/ejb0
 CfjA==
X-Gm-Message-State: AOAM531z7Lu6N3NJZLiLC+2TaXhJtjPZaTvEI13YOMorW2UvfAaZWK67
 sGCHC0gT+G0kXhEANHvv3YbIcQ==
X-Google-Smtp-Source: ABdhPJyEnLl6570MW2KAL+ArDB+3JofV5hbzqNgTbWceck5uYpjyF/d6pt5DalGfwkLIx00gqPMl1w==
X-Received: by 2002:a63:5914:: with SMTP id n20mr881066pgb.69.1602217155135;
 Thu, 08 Oct 2020 21:19:15 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id o2sm9023889pgg.3.2020.10.08.21.19.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Oct 2020 21:19:14 -0700 (PDT)
Date: Fri, 9 Oct 2020 09:49:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v1 1/1] cpufreq: mediatek-hw: Register EM power table
Message-ID: <20201009041912.nzhvubzmfox2twxg@vireshk-i7>
References: <1602159204-13756-1-git-send-email-hector.yuan@mediatek.com>
 <1602159204-13756-2-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602159204-13756-2-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_001917_432144_CA7D720E 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: wsd_upstream@mediatek.com, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 08-10-20, 20:13, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Register CPU power table to energy model framework
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq-hw.c |   50 +++++++++++++++++++++++++--------
>  1 file changed, 38 insertions(+), 12 deletions(-)

I don't see this file in mainline. What am I missing ?

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
