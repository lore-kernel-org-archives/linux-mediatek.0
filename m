Return-Path: <SRS0=CwkH=6H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 799DCC54FCB
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 15:29:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CCAB2071E
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 15:29:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AakEWw7q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f3HaI4v7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CCAB2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=loNhISo4SHL+ThJFoyFqhJ20hlNPjU6XHX+K4W4L4RA=; b=AakEWw7q2P4cJa
	33ImUaoCbBAewLfgtSVgXlZbyJSHW5x7Bllv7QcUV6V9mEOcBud0B+eQReO5zxc/qrA/sh0n/ZYDN
	ccGQz5eW+Eyh0r29nvjPyF8Z4zPK/Wc6Dw9gUIlFncv8GCneDIJAFIo64uPb8xsIgIy/2PPH3Jyyp
	oG2Dn8f+LQRHNwczodENe/fo2C7I6E3NrC2EO60RRpW0ObhlSjbjK5YdzBjsPHH99CJ3awS66/7xr
	HLBIKZWrIYvAloMVXk71x87ZRrdU0NU3aMjA4mYiennuYb0UQBk+ah73gBd8d1hZh/kPQ7L82PfX7
	KqvxmD2ZKrn0SmrCXeuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRdmn-00037O-Gk; Thu, 23 Apr 2020 15:29:09 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRdmh-00030q-H3
 for linux-mediatek@lists.infradead.org; Thu, 23 Apr 2020 15:29:07 +0000
Received: by mail-wm1-x342.google.com with SMTP id x25so6871347wmc.0
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2020 08:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=K0XwhvnZ5fHku+zX8bB/tqMgI8KM65JG7UKJ1LIe+hw=;
 b=f3HaI4v7q0s0ma9brDtDfqbZ273js/4jOfpcLSe86Rdc4863/LFECt156kdpFRFuFU
 /qAg5B9O+PLzlWP3310ATVRODsMIrhzfM6FRjI2ZfFrQh4TULq2AHJGPyPOzharxZjGs
 7nU7Xz0r39aTzO4K1n1DPslhQOZhvyuKKyIbf0lq4Ckrwalxc66TSGtchPiX+in6/vCG
 TN+C9llUiHzgI7809zQxurlbhQHWjyyCzDT1ymd5TPr0DGAHiwg0sY3T6f3iwZEMaYMz
 GyZiPpsxXPYpGo5h9qA9IliuLqsreuoUyXoDk50xYzX1M3L64josfqN4NbTZNRwbZFey
 lCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K0XwhvnZ5fHku+zX8bB/tqMgI8KM65JG7UKJ1LIe+hw=;
 b=ISERkjMQyni5BCLW8ogKCkvzNAol2dvhyquncvLGDcBUTHov/cdYZSk5K/Yvi78gaa
 9kD8voGymjIQ0cjZXoxF9QB/QikZk1mgOyfsaGMzY/Ty+syPhRgS2dsTJiycXy3tDfQM
 Qj/CqPLovvpv4EohQYv4EhZQrFJMY+6Rk+f5QirljgcrA5LPgBA5EEwHKPmb4sRCTwxA
 46cOPbTMdOEtXG83TBSO5+78Sze07WNVqGSVosYGBOXvX7cZjrYabHQE9bTf8vbO70vP
 vqY9xhzu+LT5kH+qzGFLBCM3GFUcviOhNwcnmtZyjmW8dXpBxtiyBD6L6ZIADkJ6hv5X
 t5oA==
X-Gm-Message-State: AGi0PuazvM728TGC2PWanqbidnE74M/ia94JyLAVpj+AtrIVSrKp2k0U
 4NoeYc2DKMWMFaFnRLlyIEEZlw==
X-Google-Smtp-Source: APiQypJgzi6SD42pIpK5DubH9kPf+0CuGHiKBJHzVOd+VDHdvOQf8wEqsCDznBChQjiLenoFM3eaig==
X-Received: by 2002:a1c:a794:: with SMTP id q142mr4732427wme.4.1587655741551; 
 Thu, 23 Apr 2020 08:29:01 -0700 (PDT)
Received: from linaro.org ([37.167.216.250])
 by smtp.gmail.com with ESMTPSA id j13sm4361278wrq.24.2020.04.23.08.28.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 08:29:00 -0700 (PDT)
Date: Thu, 23 Apr 2020 17:28:54 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v6 06/10] PM / EM: change name of em_pd_energy to
 em_cpu_energy
Message-ID: <20200423152854.GD65632@linaro.org>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-7-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410084210.24932-7-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_082905_010982_5649B77D 
X-CRM114-Status: UNSURE (   7.10  )
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

On Fri, Apr 10, 2020 at 09:42:06AM +0100, Lukasz Luba wrote:
> Energy Model framework supports now other devices than CPUs. Refactor some
> of the functions in order to prevent wrong usage. The old function
> em_pd_energy has to generic name. It must not be used without proper
> cpumask pointer, which is possible only for CPU devices. Thus, rename it
> and add proper description to warn of potential wrong usage for other
> devices.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
