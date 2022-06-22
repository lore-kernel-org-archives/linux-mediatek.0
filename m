Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC896C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 16:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpFArprwk0TkPy/pGPVCCVmZogRuc16LacSSmJOSjTc=; b=hLQKPkQOzbdW34HPyfvLmEovvh
	yQqxDHpSzNFQSQSBWhbcAOvXRvDwBYrtm9b5ebcHe/3gyCwmNGEBBEbBw67R+jggfkv4QCP8m+6nK
	79z8skQfLRMIl5QPRsIfhDWIF9zl6nYNaGngu8UYHg+XF7j2+gXMjmMmm4zD8r71HDkT9rjcwMTmn
	+Wm+i9rusEpiPEUxwfJUVatCHzDO53xgdrnkiIJ2PTCGwnioQgFRx9iO+wRYWA0amSRTBDSQpoeXX
	+OV7u9EQvJ3EAqsy2WcKTA9dx5HYB8mybfwpHiKZojWbfSc67gPJeAwMbySlO2GUwINhClBRUt8lF
	sfbnBP2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o438D-00BUBu-6G; Wed, 22 Jun 2022 16:23:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o42iJ-00BJ0Q-Q4; Wed, 22 Jun 2022 15:56:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E385D12FC;
	Wed, 22 Jun 2022 08:56:18 -0700 (PDT)
Received: from bogus (unknown [10.57.36.82])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F00FA3F792;
	Wed, 22 Jun 2022 08:56:15 -0700 (PDT)
Date: Wed, 22 Jun 2022 16:55:04 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	daniel.lezcano@linaro.org, amitk@kernel.org, rui.zhang@intel.com,
	viresh.kumar@linaro.org, rafael@kernel.org,
	dietmar.eggemann@arm.com, nm@ti.com, sboyd@kernel.org,
	cristian.marussi@arm.com, matthias.bgg@gmail.com,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] cpufreq: scmi: Support the power scale in
 micro-Watts in SCMI v3.1
Message-ID: <20220622155504.bcggz7spw4n2ehyj@bogus>
References: <20220622145802.13032-1-lukasz.luba@arm.com>
 <20220622145802.13032-5-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622145802.13032-5-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_085619_929070_B898D84F 
X-CRM114-Status: UNSURE (   7.80  )
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

On Wed, Jun 22, 2022 at 03:58:02PM +0100, Lukasz Luba wrote:
> The SCMI v3.1 adds support for power values in micro-Watts. They are not
> always in milli-Watts anymore (ignoring the bogo-Watts). Thus, the power
> must be converted conditionally before sending to Energy Model. Add the
> logic which handles the needed checks and conversions.
>

Acked-by: Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

