Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2C6C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 11:12:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37FFB206F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 11:12:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="edOVlPP7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=luisgerhorst.de header.i=@luisgerhorst.de header.b="qIrPPVsb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W9Z+DKjh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37FFB206F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=luisgerhorst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=do7hh2zcjVI8JW2L7gVt3ptw2cqg7vstUMPTpT65r40=; b=edOVlPP7s4a1+G1WM0GHkLiHp
	3XXWM8e8xCy8OOqcoZ5t8la3s/jQUhwB702oRh2PgNeZgIZRDVZiyvfrctcWRbGlUBZWISgP5dZEC
	DIKUabcPgnXO06q38+W4WWYXa5TMg3vELrB9y7BKNgBeJW3BaBfn3NWwHOXQNmvNXcU2GetBZmATn
	Qs8+BigBDHHj2b4N/BGr/Qgg7rC1yseKLDOu1UBJeXaa3EqpjdkZGYJUyQQONQXsPcJQZcmapCAIg
	wuOGevGHuOPUmUWArCF0XjqJCR74k+2gB9reDGWyb+JEe6zQp1TFCacCYVQrf0N+O2KMCQ4gyC2gi
	+JAjzWtgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMrag-0002SP-6j; Fri, 10 Apr 2020 11:12:54 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMraY-0002LR-Ov; Fri, 10 Apr 2020 11:12:48 +0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id D0C895808B7;
 Fri, 10 Apr 2020 07:12:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 10 Apr 2020 07:12:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=luisgerhorst.de;
 h=references:from:to:cc:subject:in-reply-to:date:message-id
 :mime-version:content-type; s=mesmtp; bh=1XCTRzA4r6t+aW/YmemVZF7
 K9mMd/HGoO3EIq2+dA90=; b=qIrPPVsbiwtiPCG914yDDwQbRVGekh653wn5tFg
 3OXdht3GDey5g1KxO9bQPKJBaZjXrLahuzs7uwHaDn1hha4c8tqr9U6h/enmMfmq
 axrVJWAkDeXqxnz5S/s0WX+23JNsmfvxG76MaCu5yoZ/10otB8aw6fJY8I0RJhAL
 UKCE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1XCTRz
 A4r6t+aW/YmemVZF7K9mMd/HGoO3EIq2+dA90=; b=W9Z+DKjhWSrSdyvjUXQWV0
 Ht2PBs1Ju8IyieMn6zSkkE0Ul7b4auQXJoekqKJj2FzKU9A+TGuBoFK1SeMMbtzb
 8oMu2rI+B4LzmSkiLSgoieRYIg+B8B0W2HubEz8VgtrlMAXtwwV8LwPnsaNl7ENf
 Hnjisw0YwgMkCsP9gyq9jSxPZWrZ9Ts2HPNybosCeGMKZtC5AH9R3c92CP8iSrSH
 gHS5Yf6zBUWVLj0ZbW7UWf0jF0G8RyBbIZtZRddWT5nYI7Y5ITHyhHNZMoDcYH6U
 Tdhl71Pqk4drxYS2/9BHw9I+ui37vmZMPZYDw+naFkx8jWWMgcUvkw4fFivbpqgw
 ==
X-ME-Sender: <xms:o1SQXtej93cVqf0lMq7BjSBnI80YT6WTnh_bM3bafOgyIiQWYNJntw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrvddvgdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpehffgfhvffujgffkfggtgesthdtredttdertdenucfhrhhomhepnfhuihhsucfi
 vghrhhhorhhsthcuoehlihhnuhigqdhkvghrnhgvlheslhhuihhsghgvrhhhohhrshhtrd
 guvgeqnecukfhppeelvddruddujedrudefiedrkeeknecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomheplhhinhhugidqkhgvrhhnvghlsehluhhish
 hgvghrhhhorhhsthdruggv
X-ME-Proxy: <xmx:o1SQXsJqEEpdAVlBBNOrPjECiypCvsioWJAkkkqB7OV1k6G1cJ037Q>
 <xmx:o1SQXm3GbM5jjQeq5Fw3vlWvqURZgDtwUCKygupmqpZPjSWL5fF5KQ>
 <xmx:o1SQXlY0lL6nr4XO4VhiScv6QkQfeTRa26Q3bZiNQCcnAlci-1NBaA>
 <xmx:qlSQXgnwI9ZSlZ3EtewA6ucmkah78uuNHQkFyCGi-HgqJe16QWXm_g>
Received: from luis-debian.fastmail.com (unknown [92.117.136.88])
 by mail.messagingengine.com (Postfix) with ESMTPA id DA33E3280060;
 Fri, 10 Apr 2020 07:12:29 -0400 (EDT)
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-5-lukasz.luba@arm.com>
User-agent: mu4e 1.0; emacs 26.1
From: Luis Gerhorst <linux-kernel@luisgerhorst.de>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v6 04/10] PM / EM: add support for other devices than CPUs
 in Energy Model
In-reply-to: <20200410084210.24932-5-lukasz.luba@arm.com>
Date: Fri, 10 Apr 2020 13:12:28 +0200
Message-ID: <87ftdboaqr.fsf@luis-debian.luis-debian-domain>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_041247_130741_DA1554E8 
X-CRM114-Status: UNSURE (   9.45  )
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
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 b.zolnierkie@samsung.com, kernel@pengutronix.de, sudeep.holla@arm.com,
 patrick.bellasi@matbug.net, shawnguo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Lukasz Luba writes:

> +/**
> + * em_dev_unregister_perf_domain() - Unregister Energy Model 
> (EM) for a device
> + * @dev		: Device for which the EM is registered
> + *
> + * Try to unregister the EM for the specified device (it checks 
> current
> + * reference counter). The EM for CPUs will not be freed.
> + */
> +void em_dev_unregister_perf_domain(struct device *dev)
> +{
> +	struct em_device *em_dev, *tmp;
> +
> +	if (IS_ERR_OR_NULL(dev))
> +		return;
> +
> +	/* We don't support freeing CPU structures in hotplug */
> +	if (_is_cpu_device(dev)) {
> +		dev_dbg_once(dev, "EM: the structures are not going to be 
> removed\n");
> +		return;
> +	}
> +
> +	mutex_lock(&em_pd_mutex);
> +
> +	if (list_empty(&em_pd_dev_list)) {
> +		mutex_unlock(&em_pd_mutex);
> +		return;
> +	}
> +
> +	list_for_each_entry_safe(em_dev, tmp, &em_pd_dev_list, 
> em_dev_list) {
> +		if (em_dev->dev == dev) {
> +			kref_put(&em_dev->kref, _em_release);
> +			break;
> +		}
> +	}
> +
> +	mutex_unlock(&em_pd_mutex);
> +}
> +EXPORT_SYMBOL_GPL(em_dev_unregister_perf_domain);

Ok, so em_dev_unregister_perf_domain() does not support the CPU 
device
and a subsequent em_register_perf_domain() will fail with EEXIST.

Is there a way to unregister/change the CPU's energy model during
runtime without restarting the whole system?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
