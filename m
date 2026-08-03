Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14109C55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oz+46xoU5Ps+EiowJN5fDiWs3w3cNh/2x67ul7cY68U=; b=a9RhhSjkzpsF9qRsfQo2SPh7dQ
	gCYkN+b6PdogndMPLN4NIEGekF+HMQi3XMudB7fUsAlH9bL9Y21nNGLCZUpMrTaQuR3kagsMXGk6G
	ZiDOGmaCSWptqIyuyaDYOnKXRqT3Ke1IOEpnZgwrS+HQyG/2NrTlX4pZgU3TotSOJg1s/TuwYlJEt
	uuXQsPJOwnLldAgP5v3B+iMAHbD9XKeJRhImyXCScTdwXXASBcvFVO9hBGMVvevNyssQmLmWrfDm7
	eAUD56aRe0YPKD9/w8BtTL5Tadk1N42jwDgA3yKr4vqI+6+blmkxh6iA2ah8ZmbwzHev+WPV+esbq
	tLL60W9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtmy-0000000HPAW-00Kz;
	Mon, 03 Aug 2026 14:37:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtmv-0000000HP8p-0LUF
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785767828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oz+46xoU5Ps+EiowJN5fDiWs3w3cNh/2x67ul7cY68U=;
	b=SVCJjWgJSK/eJeixlO/gb8HULcanStg88lLvUbdmUU8/yrv6zheQKLs3EP0mdRpvvoCDPw
	v0diAq4mS8YAfS+I4li1EyQAI8F0nqkm/K5fszHD2/a3MUN3hulW7Nhc9f6kEkgrmZZTRY
	AjMBBpAjdWX0kcQvUTBw8AGnoBoo2zU=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-6I3mi96WOti32skwJB3vJA-1; Mon, 03 Aug 2026 10:37:04 -0400
X-MC-Unique: 6I3mi96WOti32skwJB3vJA-1
X-Mimecast-MFC-AGG-ID: 6I3mi96WOti32skwJB3vJA_1785767824
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7f582244e9eso134661007b3.3
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767824; x=1786372624;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oz+46xoU5Ps+EiowJN5fDiWs3w3cNh/2x67ul7cY68U=;
        b=R9Ilw556Yw9h9rszgE+Q1FIbCCKp9MrrOzDPvHDq9zFy7Go9okGZZb+8mHqoY/F8lG
         bikvCPyr1yBbwTO534+CKhZ4IKsSm/UhkrNv1ghWAxW0PKtRJGLlClIIPQAAL1oohwl7
         WhDF6nUzpq86g6plo8eCJqtN/dRglrNMr1UDGh7xSCdNYteCx1NAHHj9Vmz723S5JKOR
         DHzpj95iU4E+0LhdaNmi11HzDjdB1WTNBtXyhor04Xcu0jrqmrraHMCvs+t0BADI8+Q8
         Br1RPr2w0Os3MsEKD7rbJeTsrX8UWblleNGfqXsVMTTiBvb2O2EqRYsECF/f9pmdICMF
         /Tgg==
X-Forwarded-Encrypted: i=1; AHgh+Rri2txHdm9ayP2zo5GCbfNDaB98aZiG5DRUggY4MuYp5xIFOWtJRTxfqLqkQJJao9z/kmSuZUv+jAf/18cZ8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoSW94K9Qs6evvkElZXByHdiig8s1Gjf2qzssomwgPGwbnupGy
	sKq47RS2dVImrerTg23l5vBXQb04q1K2xJht1LbeVzE/HIG5ecb/vft5USHoDx8I0YB2rGIuS2f
	FEREV54nAr/UXNWBohHczrac1CAg5kKE1q7L/7RYwgT8WUIiebw7IakcBuOkbjPVlvhzL3L3vSw
	==
X-Gm-Gg: AR+sD13SvDv8slDbTW/U4YiRwFV14xuNWQ15z989JlEh2kct8cZNGfS6/ExaCa4W1bj
	U/+y1efIh0Gt3QzcLRQ5QaTDh1cRW9Hl7A/unssPMWE/MOivh+W1Uuh8+knDGAKvgV43qXOAdUs
	hvEe+h5XHWTIDrPJ2Z1qZbi7b3AfQCWjP485lRcNdGl0Ro7+YvDz1j3TqB1iPYuOsCwV8hoPfXK
	/TiG9sq5KG+ZhKAKc7A3bbIwt8WHCOhIqHWwVFF+Iw3Lp+ES4pQAeS47tdt/cnM1bi1EpgMJYXt
	ofQsPF+2Rxc/Dq3FDT0gTbUqAT+NFVlsCWPOoy/B/E0iKDHJRYSnsIjVWnoA+qV5T2sc/SgApkR
	74dcallH6WJdRVRIqwLXCp4JaP6IWKQxgHy4=
X-Received: by 2002:a05:690c:4d83:b0:80b:9f4e:a70 with SMTP id 00721157ae682-81fd4ba6936mr134850517b3.26.1785767824051;
        Mon, 03 Aug 2026 07:37:04 -0700 (PDT)
X-Received: by 2002:a05:690c:4d83:b0:80b:9f4e:a70 with SMTP id 00721157ae682-81fd4ba6936mr134850157b3.26.1785767823526;
        Mon, 03 Aug 2026 07:37:03 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d70besm54676927b3.31.2026.08.03.07.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:37:02 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:37:00 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 10/25] clk: mediatek: pll: Add BAR reset register
 offsets
Message-ID: <anCnjHectpXOqQku@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-10-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-10-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Qpj5w5Ekxzpu5h2E531mJAfDWGpesQui7hW3l4tZbXQ_1785767824
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_073709_186932_9FC56A61 
X-CRM114-Status: GOOD (  13.03  )
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

On Sat, Aug 01, 2026 at 01:20:56PM +0200, Louis-Alexis Eyraud wrote:
> Currently, the register offset to handle BAR reset, for PLLs that
> support it, is hardcoded to CON0.
> On MT8189 SoC, there are separate status, set and clr registers to
> handle this, so differents offsets are needed.
> 
> Add the new fields for offsets and addresses to the MTK PLL data
> structure and modify mtk_clk_register_pll_ops function to compute the
> new register addresses so they are available for clock operation usage.
> 
> Also, replace reset BAR address computing by its computed address
> from MTK PLL data structure in prepare/unprepare callbacks.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


