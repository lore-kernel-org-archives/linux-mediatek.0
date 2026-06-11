Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18680CD98D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 09:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/z2DCk4dynGP3EOhfGPH5RufQFwqe2sDUjasxzmGDhc=; b=ltXpWZWMpLFkay6mHJhaUc3fgj
	/Q+pStjTuyTwHbvclQdGl+lZEG4orD+6StRQLY1+N1/637qdkeTkvhvxTHYJHcWSUYb6XdSflqpUs
	uIG2aV3sZLGXQWX1BUozQzF9QcrGaSIYiIdgZOodDBogU9D1bZFbpqpYT1aTqLbOKVcyge567sB04
	+FtNXk4EsNjS6I7BjvkffOIIlQ+XFUbqNuJ2NTUOBMh6ksz17/Zd+tVg8B1aqnqmIR6+4wQrVkXYL
	uX8F7Lz4cfdO7qNtGr7gwIoqNtE1R5LAUQ0eNCN4QLpgqO98KcDtFFGWPy6frDX8JF4GFE7up06HP
	EPjrRTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc7j-00000009B5s-0fwu;
	Thu, 11 Jun 2026 09:54:55 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc7g-00000009B5D-3jjS
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jun 2026 09:54:54 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45eec22fab7so3959574f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781171691; x=1781776491; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/z2DCk4dynGP3EOhfGPH5RufQFwqe2sDUjasxzmGDhc=;
        b=oYNMuxK70xijrEOXdfo1++OuK7hB8n1QC79UFTu11fYltC7vbjRrdxUQMAptyoWJHL
         dtLV9sZNjT5jbZmH+1BTAVa6pno2W3EbMymVT5f22t8rQH4f0ealRKQyAG4ncly50blE
         bir+Kz3x+shpdlnA9tTxrPsQKrLwDTHP3tj6+Pb7OoaI5EPVLddDgktcQw+sGNtxxyju
         5u/ai4OKd8SKGCV2WL46YNHF5NL4WHunt8exK6fOB6WVKmFZxni0N3STi9AXyH3fLgLS
         +cY1aLgnQohevDmAdoIAVABFKHt1QpzRuOm6StJdxU6gDjpBjDEQywM1VEU7ETLMP0hB
         yUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781171691; x=1781776491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/z2DCk4dynGP3EOhfGPH5RufQFwqe2sDUjasxzmGDhc=;
        b=gjbq1kBKNctePqNK8VyEP+DJlS69F9ijArYxV14XrqmDy5stH4VyBrMeRy4mai92J9
         jsRxvfwGbDAammI3DDbA5+r3veVZvfTzkSQl+bJyxiaJYAMK0vDyqXxL79fsa62Hg3P/
         +ufG8HCV/soLpDSwzbJYkvcdb8mxo/AKkqWKU95zw8KSkAui4HUkwX2aR4+bKJ3USvak
         blgaAYwCPSc8pziXu13Itds36kPTenJhwt7qllsE0jPCrG9sl3kNlpuTTia5KcfjlpQD
         f4pkxD0dINMBms/S5ePVa5l0vVKl2xBAN5Jv5s5ocONjEUu7rCYTLgZoEbRcSmDZ3vx+
         0PwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/sTAQ7ToNbzUqfNtmf7+xIbaNw0uodnU2vbtGIUm3m8LuQ1GIltufIP+6ppf9p0e4yvrTaOku333gdmK8MQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyL1olZgFrnjC09SyoWBiT8bHcgebnY5MqDvUUOBsUy//1Imqo6
	PwL6XuxxyxgstlSe2ZxJRbhvSW7xT8l8BGCTFARhgNiiGwgJ/WgBmw0Ty8j47LK13Tg=
X-Gm-Gg: Acq92OGb9ZgRVl8G7dunbGsU4VEcajXds1WbbNq1wT7pRPwyDtNqasFCa4MmCauudPy
	qs9iUvA7mY8GcLNM8RULaVyycc06T6WarWgg/pE7qTsknFLcqivhNVIbgQZ/Z2JY80JePyzFAN6
	/j3wzIaRcJFqDasSMc4VFG4ATdNCbFWYxTTOeqLaFcRcZdpoRlSAqct22Rh0UJWT/G2xh093AkH
	eA1YwzthrMk46VxiNbFOpJSa32OWbj41mgl6IOADKcYvW+4lCreig7ss0arw4FlSwJWP0Lckypz
	Tu6bUq5ghOXLuQU9M9hJ51Dchv3djIBohxuYW8C7qqm8PfM8lYUk7wu7L12E1QHoQ9M404Lw+a3
	creRD33ws38rU1WoEHVgLcPzVgiZP3GikpPrqABWJL5jvrXsSPSMk3ErXTAV2RCxaTJbm/fXW/J
	Mp1j1U2ECkWyES/Z+1WNjruj6T1S1diegIdCLdOim9cFC/qQ==
X-Received: by 2002:a05:600c:c0d5:b0:490:44eb:c1e5 with SMTP id 5b1f17b1804b1-490e5624838mr23357035e9.31.1781171690745;
        Thu, 11 Jun 2026 02:54:50 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:7bb1:6476:9114:cf39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e52ac9aasm36942655e9.4.2026.06.11.02.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 02:54:50 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:54:46 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <aiqF5mh1PvWpH3L5@linaro.org>
References: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_025452_947020_62BCAEC6 
X-CRM114-Status: GOOD (  23.48  )
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

On Thu, Jun 11, 2026 at 03:18:51PM +0530, Mukesh Ojha wrote:
> On Tue, Jun 09, 2026 at 01:43:17PM +0200, Stephan Gerhold wrote:
> > On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> > > If a subdevice fails to stop, it indicates broken communication with the
> > > DSP. Continuing to stop further subdevices against an unresponsive
> > > remote processor could close rpmsg devices that could remove the memory
> > > mapping from HLOS and in case if remote processor touches those memory
> > > can result in SMMU fault.
> > > 
> > > Change rproc_stop_subdevices() to return int and abort on the first
> > > failing subdev. Propagate the error through rproc_stop() and
> > > __rproc_detach() so callers are aware the teardown did not complete
> > > cleanly.
> > > 
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > 
> > But what would callers do about this? If you abort the teardown sequence
> > half-way through you now have an inconsistent half-stopped state that
> > neither a new call to stop() nor a new call to start() could recover
> > from. That doesn't sound much better than the SMMU fault. Or am I
> > missing something here?
> 
> SMMU fault result in device crash while other is non-functional remote
> processor. From Linux side, we do not know the state of remote processor
> when the timeout happens..cleaning the subdevices can result in the
> debug data being lost for hung remote processor.
> 

Ok, but how do we go from here? Do we expect that the system would have
some userspace monitoring daemon that would collect the debug data and
then reboot the device to make the remoteproc work again?

With these changes, I don't see how you would start the remoteproc again
without fully rebooting the board. Calling start()/stop() on the
subdevices again would lead to crashes because some of them are in
started state and some of them are in stopped state and we don't even
know which one is in which state.

Thanks,
Stephan

