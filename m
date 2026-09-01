Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542E2C61DD6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 08:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHSbqtb63+WVJXZL+2bipMbSfoPG86BNGlDDfyVTiGE=; b=j/XzYr6luADLUol6VafTuFhiBj
	ufXvY7vwpUXHlkWOFM1FALE6Y7ZSMVT8cZb0+ZhfceKpnFddnrFslvpOtSrqqbgI7gHPFUKxUKlMd
	UOSwVVtt+nEq9T860ZwzWsQ5miYer5m03kpah2Pkmrlw6cxIakgZHXsQdavWzP4ogaxwdgeHTXx5G
	NCJEFWdOec0+hDfha4T+IN8T+qjUp0xf0x+203Vvv4J43c9iZnl7BSpLtyooOz85ZHBkZGjvkL4Ht
	5KqvVefmlTdakoY6wWPcJqU27kWspJqO2MGFojh3gLiczatY8nmKVxYTrv4mYDWgX9E/tTKHef32n
	dT6EDPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K30-0000000BJQt-0j9H;
	Tue, 01 Sep 2026 08:40:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1K2x-0000000BJPd-0WF8
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 08:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788252046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xHSbqtb63+WVJXZL+2bipMbSfoPG86BNGlDDfyVTiGE=;
	b=MTr67RGHgplbfP4HgmIq+3CwETkBVcbMYyrNOzt7akq2RtpTQv1QydwFkg6pdw2iiDLMQq
	fgJNr1Iusj2LI84yI4g16nE/rcmp2H4JMgaHI5HHPa40ODU5G758H8d72QhICgoxQbrVuh
	dSdYc02nsNztxSPWOhpoAgMEpK8HAjs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-hGXfcQShP9ipb98vdWucLg-1; Tue, 01 Sept 2026 04:40:39 -0400
X-MC-Unique: hGXfcQShP9ipb98vdWucLg-1
X-Mimecast-MFC-AGG-ID: hGXfcQShP9ipb98vdWucLg_1788252038
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-496bbcf7d1eso5065765e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 01:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252038; x=1788856838;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xHSbqtb63+WVJXZL+2bipMbSfoPG86BNGlDDfyVTiGE=;
        b=l5NrHoGC2KhZLh9S0GBdch2OWkPodO8nsbc2jCCx8ThSgRzJGdFRzOKr5puV8k3q4y
         ONzTwnuOqqjHF7HTNf+Er30zbD8KpFzsDb+WjElWRZdEJIdeIaPggmj447WLNXQphWq+
         /880nuvxH3K/RsbTM90pPxBK8ybXY0u8D5COExiSaA656DgU3FEGd07o9XsUKEQji3My
         OJfq4HpMhaoOFfiZk8lw6Li02ngdR+wt8PM/IKfcTEtgwJGP9v+UC1VF5ZcTlm5ydoRt
         KkZmC7AEFa9zqWJ19A1tBlIK1A8n5NP1SKkL0+a37AEwfv9pan6frQIrEsMBntSI/vZH
         pMFg==
X-Forwarded-Encrypted: i=1; AHgh+RoSA93/LL5WkybSpFOku2vTS0E/lnmiW/5Q94KiF+rO0lM4YvPHXdkSlGIN60ZkI22ihfZ8YwDuMse7iPXN4g==@lists.infradead.org
X-Gm-Message-State: AFuF++lhwGPLLdfx5elPx5aafNlY7/MlFIpALTHybavTl/ECFTITa4+K
	hC/fePGM8fTh25m4l84Xkp0HXvQi+Yug7SwriZcrziSVhhsgrgTI9vjMIZ+8SXFPYkzBPvX2kWh
	JOH2uLwAk0FGAnZI/JZP66oADW9frl8ScAF+qqeVtHtAMQ7XtVczlVsDbnE9/VCUrCBzzj3ZvBg
	==
X-Gm-Gg: AR+sD118iEGSootFtJAixhNscm6Ys3pNvWWaqZKyCEuohcUeOmD+5xp4QO+JAgNSgNx
	pGdlXuj+U2gn5eXL+Kz1omzX5ttWFlXP+x9fTabt99QR1cI5wF7H+jhajGgpbr3EqZ5yzj/nolF
	+2BqtX9mL6d4HOL77Oo6wqhNZ4pZgZ65aO8uUY6KtkpE4nQIVzlUMOlNBG+aeykHae0uOXwEl4z
	oIEOl2nJL5ATYg8p5/TbSGzsO2g3hCuBLGLm+TIdVN8Vi33S7w/tmwYQ2ArcNGCg1PQUz+Wnf+n
	ZctdKEJM2QuCguH6KuF4CtlzqtpxkQM7oT7ew3x4nk+wQd+hyIUxaG1cFkoZsMmECf1G07FVsbv
	tQlcs9iZ5i8IDPXQiT6CudQ60D+mC0zlqcLGMYdSQcbK9ArEV/dDyILMiboohg0pzhT0DMCwvkg
	==
X-Received: by 2002:a05:600c:1c13:b0:49c:df2b:15fc with SMTP id 5b1f17b1804b1-49cdf2b179amr60516585e9.8.1788252038355;
        Tue, 01 Sep 2026 01:40:38 -0700 (PDT)
X-Received: by 2002:a05:600c:1c13:b0:49c:df2b:15fc with SMTP id 5b1f17b1804b1-49cdf2b179amr60515525e9.8.1788252037895;
        Tue, 01 Sep 2026 01:40:37 -0700 (PDT)
Received: from [192.168.188.103] (ip245-45-231-195.pool-bba.aruba.it. [195.231.45.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce18dbae2sm6966555e9.13.2026.09.01.01.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:40:36 -0700 (PDT)
Message-ID: <d0e8bd80-1798-4840-b388-05206bb72fc6@redhat.com>
Date: Tue, 1 Sep 2026 10:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 1/2] net: dsa: mt7530: populate lpi_interfaces to
 fix EEE support
To: Aleksei Sviridkin <f@lex.la>, "Chester A . Unal"
 <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Qingfang Deng <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260827211652.63504-1-f@lex.la>
 <20260827211652.63504-2-f@lex.la>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260827211652.63504-2-f@lex.la>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fAooGVrzAMO17HQSrDA0UjUhXJymeejQglKQ0fUpJLI_1788252038
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_014047_232692_6D2E1CA8 
X-CRM114-Status: GOOD (  18.23  )
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



On 8/27/26 11:16 PM, Aleksei Sviridkin wrote:
> phylink_create() decides once and for all that a MAC supports managed
> EEE, and it requires the tx_lpi ops plus non-empty lpi_capabilities and
> lpi_interfaces. mt753x_phylink_get_caps() leaves lpi_interfaces empty.
> 
> So ever since the conversion to phylink managed EEE, ethtool has
> answered "Not supported" on every mt753x port, and phy_disable_eee()
> has locked userspace out of turning EEE on. That undoes what
> commit 06dfcd4098cf ("net: dsa: mt7530: fix enabling EEE on MT7531
> switch on all boards") arranged: EEE off by default, but reachable
> with ethtool.
> 
> Leave the speeds above 1 Gbps out of both bitmaps. PMCR folds
> SPEED_2500 and SPEED_10000 onto PMCR_FORCE_SPEED_1000, so
> PMCR_FORCE_EEE1G would govern LPI on such a link, and that is
> unvalidated rather than known unsupported: MediaTek's SDK driver sets
> the EEE force bits for 100 Mbps and 1 Gbps only, and the unit of the
> wakeup timers is undocumented with the port clock at 2.5 times the
> rate.
> 
> LPI stays off until userspace enables it, but the EEE advertisement of
> a PHY that advertises it out of reset comes back, since phylink stops
> force-clearing it.
> 
> Fixes: 9cf21773f535 ("net: dsa: mt7530: convert to phylink managed EEE")
> Signed-off-by: Aleksei Sviridkin <f@lex.la>
> ---
> 
> Ports that support neither 100 Mbps nor 1 Gbps are skipped because on
> MT7988, EN7581 and AN7583 port 6 is 10 Gbps only and shares
> PHY_INTERFACE_MODE_INTERNAL with the user ports, so the interface mask
> alone cannot tell them apart. MT7531's internal PHYs keep the
> advertisement mt7531_setup() zeroed and EN7528 keeps both bitmaps
> empty, so EEE stays fully off there.
> 
> Two pre-existing things this patch makes live, neither addressed here:
> 
> - The unit of LPI_THRESH is still unspecified, as the comment above
>   lpi_timer_default says. ethtool now reports 30 for a switch port
>   against 1000 for the SoC MAC, which is a driver constant already in
>   microseconds, and mtk_eth_soc treats a structurally identical field
>   as milliseconds. Does anyone have the datasheet answer?

Clashiko complains about the above:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260827211652.63504-1-f%40lex.la

@Andrew: WDYT?

/P


