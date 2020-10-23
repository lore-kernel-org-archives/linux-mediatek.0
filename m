Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02301C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:30:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46FCA2192A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:29:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rGj9llv0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQ2AKoRw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46FCA2192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tXSoLAJptVDcTU4kPx1Do5NOElEzUAZopw+S9Wq/0qo=; b=rGj9llv098cZLoqHhunnKwLTS
	tGhR02zKKuc2PKcoyXoJa3tpodQfq2yRYJ/IcZdd7gvwQAb/hUlldZiu+RguRiBARDmEjrVoOh9Xi
	7gZSDX79H5z3WWAUcDHhFTKxOG2ogb5Y0TvQC9fxpBebCMQgnZhC8mNTgXGxK6A5rHx60GV72HimO
	/VdJ1dz/6LOOeUeN79hl8KWaPDeCrxBmGzTynF1KXTwAqg42MIMwL16+DtJyJzXEdYoonjwzW+RYj
	HBbjzDU7MPb8lkLudkqLsAmU9p8JkV8RdlM2oVIYiAWR8WJp1uoRDUcuwkQXIv3jVUdhVIBEOUz9U
	ospx1HYig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVsSM-0000uS-Eo; Fri, 23 Oct 2020 08:29:50 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVsSI-0000ss-Ok
 for linux-mediatek@lists.infradead.org; Fri, 23 Oct 2020 08:29:47 +0000
Received: by mail-pl1-x641.google.com with SMTP id bf6so477751plb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2020 01:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MMav+PtnWA8e0lc96loqiE6mTzZH6xG4l/t4zMITsAk=;
 b=YQ2AKoRwpkty0tvJPPA8WCCIKDOr9TT0bTWA5t2FhKzhb8Ss+jzt3G3AS/k5guH6wq
 tI72tb/I4pZzAHl9BKirKz2Yage3lUKgCDS8DdgzH7cpUBIh3Ad1oYsmvnT7tobdj7VG
 dkhy0/7q1cL2Fzl3+y6xUeWAGbtcUgE4nPH+nKbpSj2OE05m9gWZn/K1ObetheeZob0x
 yafIFMf9P8AYz8MCi8WnOob24dMArObcFn1ZIZ41wCSgzyGdtfo8iuFPNkNM2ciLFX15
 B8iaKwOQQJUJMCdm9o7EHXdgn7Gp8jbdSGwwFZMuWuXWDIbPes52ML1nZVpUMvOGfiTz
 pV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MMav+PtnWA8e0lc96loqiE6mTzZH6xG4l/t4zMITsAk=;
 b=qVyihGJykAN7CofzRY+rywwyat4zTcjhPSz3RAImW/MYfbTpPNUYGe0FQrLFV87jPQ
 elOTMo0DTgIMwrhi6WY5/qq+EBja14weLwctngYaeLt8qwA1TqprRqVYwuqOimI1+uTf
 D0s2LTxAgH86RHcqsCNPpvN81hacsTDTY81TlNm41vDf4WPXQhuPbd9oy0hH9WhNOBJo
 QqI2DQTOShTv2W4lMmvt1lzkCtE9CvZwtT0QaFgz6RG4O1n2lU9C8foctu23z1xxWFZL
 kZVVTjd224bEYf1haXE0gtgsyEblDTMyAjJaWaWx43+UnHMS8YRLbg/0937cRiPDvqa+
 Pa+A==
X-Gm-Message-State: AOAM531uQIZR4zPLWPmRFD7Vyu2F4ftilFKxiqnxgNiyPWCJlmsxZjgL
 Qd77Ent4l8Yd88mA8tMWABI8EQ==
X-Google-Smtp-Source: ABdhPJzWK1/wuqJtRsFK0GxzZn3Rmp3+fNzvootOjfC35/ce5xHXdauekDAiOnFpGysDl/EFqjHNZw==
X-Received: by 2002:a17:902:6bc5:b029:d3:f10c:9449 with SMTP id
 m5-20020a1709026bc5b02900d3f10c9449mr1154917plt.54.1603441783714; 
 Fri, 23 Oct 2020 01:29:43 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id e2sm1021057pgd.27.2020.10.23.01.29.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2020 01:29:43 -0700 (PDT)
Date: Fri, 23 Oct 2020 13:59:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v1 2/6] dt-bindings: arm: cpus: Document
 'mtk,freq-domain' property
Message-ID: <20201023082941.yfjewzdsnspug7by@vireshk-i7>
References: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
 <1603441493-18554-3-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603441493-18554-3-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_042946_876313_6BFF29A2 
X-CRM114-Status: GOOD (  18.06  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Dave Gerlach <d-gerlach@ti.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Amit Kucheria <amit.kucheria@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 23-10-20, 16:24, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add devicetree documentation for 'mtk,freq-domain' property specific
> to Mediatek CPUs. This property is used to reference the CPUFREQ node
> along with the domain id.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 1222bf1..06a6f5b 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -255,6 +255,12 @@ properties:
>  
>        where voltage is in V, frequency is in MHz.
>  
> +  mtk-freq-domain:
> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> +    description:
> +      CPUs supporting freq-domain must set their "mtk-freq-domain" property
> +      with phandle to a cpufreq_hw node followed by the domain id.
> +

Name should have been mtk,freq-domain I believe. Rob will confirm the
rest.

>    power-domains:
>      $ref: '/schemas/types.yaml#/definitions/phandle-array'
>      description:
> -- 
> 1.7.9.5

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
