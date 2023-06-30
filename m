Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54274EB64D7
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jun 2023 11:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBi2xn+NWrUQzLbxhPhUtfNKTaMAus8XdZkjy6jHSNM=; b=4IIn/1xD2WD8xi1ZXp1wy0UB8q
	HhXeCv8dTAWWxNWeL6spTwgboXH5yadKqqA0b3DvlilRYxDZgxcoknwPnAnNrSkIB0QVdOKZBpHme
	xbGudo3+7BJSSillR8gx0DBzPbNjWwAyDfqIeUJaiKNHyuZ4NMKcraodI0MRkIJUvFV0dX+JLJ6I0
	q3mzq41dea0Ok6PnjLry+JvQ4PSpijrFvFAOGkCZQk5iChCmiL6CklRPeDZym3pmaggiLVY4LcGOS
	jK8vdehUAOFOxYQNq6d5zifmRNg5I8f+30BmjnmuyHdPgLnGdmW/K1KrtPt2P+d1sADRdPlwFmopF
	D7io11ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFC2a-003ZLU-0I;
	Fri, 30 Jun 2023 11:11:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFC2X-003ZKg-0M;
	Fri, 30 Jun 2023 11:11:50 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1688123506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBi2xn+NWrUQzLbxhPhUtfNKTaMAus8XdZkjy6jHSNM=;
	b=418LKbfzErO8aWbRiCy6RicHEfWmrfLoIcdhuAdqKEQ/ZbLyV5fOr9TL2jgmxbiB1UJ3bl
	L7RSNcul7PGGKtMoVG58xOTYMswwl0fvl2x6Gy3oeK78nmBEYbydnR6FVElSSy3QDkkQS4
	aNdClghzIVSlb1kIYZa+lxNsG6dKqXTENfkuKKK8H3fwdANqYJnMII3qHGkdR7RslbGNzH
	rMZSPPYA/DaN+m+jbNSRocp1b1dwjRh2NBrN92RDYtVGXNSXIAHcc+RtRHjhZQcR/LI027
	/C9gb1mFySWZHISgYn13LNhN7Izd0dCqTTysj0/z5qIQHqLoTPKk/6VDB9l9vg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1688123506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LBi2xn+NWrUQzLbxhPhUtfNKTaMAus8XdZkjy6jHSNM=;
	b=jVPJlwFMcCzb0wYuBYE9xW6cZEwUMtJR24us2ZwmMLiYkh/Ya8FPIpIwdTH1G8h/qMJoP9
	yy6W7RPJnQ28ZkBA==
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Yangtao Li
 <frank.li@vivo.com>
Cc: miquel.raynal@bootlin.com, rafael@kernel.org, daniel.lezcano@linaro.org,
 amitk@kernel.org, rui.zhang@intel.com, mmayer@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, thara.gopinath@gmail.com,
 heiko@sntech.de, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 srinivas.pandruvada@linux.intel.com,
 DLG-Adam.Ward.opensource@dm.renesas.com, shangxiaojing@huawei.com,
 bchihi@baylibre.com, wenst@chromium.org, hayashi.kunihiko@socionext.com,
 niklas.soderlund+renesas@ragnatech.se, chi.minghao@zte.com.cn,
 johan+linaro@kernel.org, jernej.skrabec@gmail.com,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 01/15] genirq/devres: Add error information printing
 for devm_request_threaded_irq()
In-Reply-To: <20230627110025.vgtplc6nluiiuvoh@pengutronix.de>
References: <20230627101215.58798-1-frank.li@vivo.com>
 <20230627110025.vgtplc6nluiiuvoh@pengutronix.de>
Date: Fri, 30 Jun 2023 13:11:46 +0200
Message-ID: <87h6qpyzkd.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_041149_303357_2B300F0A 
X-CRM114-Status: GOOD (  16.12  )
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

On Tue, Jun 27 2023 at 13:00, Uwe Kleine-K=C3=B6nig wrote:
> On Tue, Jun 27, 2023 at 06:12:01PM +0800, Yangtao Li wrote:
>
> While I assume changing to dev_err_probe is a result of my concern that
> no error should be printed when rc=3D-EPROBEDEFER, my other concern that
> adding an error message to a generic allocation function is a bad idea
> still stands.

I agree in general, but if you actually look at the call sites of
devm_request_threaded_irq() then the vast majority of them print more or
less lousy error messages. A quick grep/sed/awk/sort/uniq revealed

     519 messages total (there are probably more)

     352 unique messages

     323 unique messages after lower casing

         Those 323 are mostly just variants of the same patterns with slight
         modifications in formatting and information provided.

     186 of these messages do not deliver any useful information,
         e.g. "no irq", "

     The most useful one of all is: "could request wakeup irq: %d"

So there is certainly an argument to be made that this particular
function should print a well formatted and informative error message.

It's not a general allocator like kmalloc(). It's specialized and in the
vast majority of cases failing to request the interrupt causes the
device probe to fail. So having proper and consistent information why
the device cannot be used _is_ useful.

Yangtao: The way how this is attempted is not useful at all.

    1) The changelog is word salad and provides 0 rationale

       Also such series require a cover letter...

    2) The dev_err() which is added is not informative at all and cannot
       replace actually useful error messages. It's not that hard to
       make it useful.

    2) Adding the printks unconditionally first will emit two messages
       with different content.

       This is not how such changes are done.

       The proper approach is to create a wrapper function which emits
       the error message:

       wrapper(....., const char *info)
       {
            ret =3D devm_request_threaded_irq(....);
            if (ret < 0) {
               dev_err(dev, "Failed to request %sinterrupt %u %s %s: %d\n,
                       thread_fn ? "threaded " : "",
                       irq, devname, info ? : "", ret);
            }
            return ret;
       }

       Then convert the callsites over one by one with proper
       changelogs and justification.

       See?

Thanks,

        tglx

