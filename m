Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1597606A883
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dTuaCKJu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRqIr+h3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Dyq7CXm4eP3CnlrPx8cI2jgz3Z98ATLqm3BZ7cAURRk=; b=dTuaCKJubhpL1m
	lTrTIl+86OvHUOn3aoUh73xs3Kfr75/7H/KQhVa6tergTJM6V0D4AraYJ2CfJ1/xdcb7QOh5TDugS
	YDR/Qw/00VErYEVNPtcR22KBcq5PB2dsUc2uyMfJpEYEbxPELCmCyxPebrJYuMLZ/+2V3XMr+eulo
	OuuUqgbz6bgjGoxHDZ2GhXCVWBx7f3Natzix7e10L2OI5kECy1PLYt+0O9S4tmLosXBpqR2Wzv7sh
	C987OBgGPwfnr6ePIfMB8SjH40qsGOS1ArvGorF5R2GNinZOJ9OVXJTtriHVhXoQv/wknLGPr/RS/
	3l7IpTGF+6tr0dawBrfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxEk-0000000EHO2-18S4;
	Fri, 13 Nov 2026 19:47:02 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxEg-0000000EHMi-41RJ
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 19:47:00 +0000
Received: by mail-oo2-x05.google.com with SMTP id 46e09a7af769-862a1dbb516so897a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 11:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794599218; x=1795204018; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dyq7CXm4eP3CnlrPx8cI2jgz3Z98ATLqm3BZ7cAURRk=;
        b=QRqIr+h342dAAs5jdXhEFGPdYpLSGMtyjtJk3Qxu9BvQKnC2o9ixnBrOyVZVX5vWv4
         aIFtr1abOYNG6KqyhLWpwsNLAv8JWZ90YwsK/vkvu31utvHLVdjT9nXOXFzS9e9mlsHR
         0xhbzw2dHuzpSNt3meYul8K7CVxBOYOBprDyNk06HN8jxEUJmp8ifGukjHN1tUPDMNXO
         HsxxF3Pao184GHLNdRJ3DGHGqOTm2AzO89QJU/eJD897WqMR/BjqKpsDrfVQxteWjYF0
         smUyql0Ro1TJ5YDiFSZr3yRjaC767r4gmJJG8w+G6yhBaVizGIz5/okmiJ2Wi2/WdKVQ
         viyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599218; x=1795204018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dyq7CXm4eP3CnlrPx8cI2jgz3Z98ATLqm3BZ7cAURRk=;
        b=CKxLFmg2IE8nk09VxjGNycDsThPoT1ZYgOs9/OvvrqbMEJYAvoy6b39v+0sSK7lxIX
         OyREB9Uw6YUTvIDagFPTDUn1ZxgRCUW3VIyu971xKkXnzdYix1zxeYmFXjoma0po7qlq
         N0ryGLuolNZkP3+F9YStnbh6189dImm5mYxbbBgOAbMiU9b1AjoSoM8fcHCAq7pUnosq
         mqMls2q4aqL74+WOK4EDOqT7qpd/OuYXLy6OFI3O6dxvVcDKg7cUN/p8VM595HalqH2V
         /qcaYzCPKOTiGAYAJcT+ycUBnG5VJy04iVm9tZqCZ7B/BkZKYKKtDYlKXPqJTfLIKEvh
         RB8Q==
X-Forwarded-Encrypted: i=1; AL+hErEbcdSJ8ksfvryrBy0HpuKPVSIEZjPNzoGI8tsffYczkVhws6xwpq82DkP12N3/UEHRLt6upEj27fXnk2t2mw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+dFPYQ/10VS5AEngUobQ8Tq+le3Gox4A7aEdCmLc90hr1roLfi
	+d/Zy25b76bd2mlKTnLJYW+b/bFkibGWneNQz30ary+8s6vwGtS2zTzj
X-Gm-Gg: AYBFou1M+uzG5fvzMYqppK0iEavovIV5Dc2dcVYv9gCDrqr+svPV6NfiLkECLllHqTw
	ancuHNSZfCoWse48j9pKqb9fq8fYnLK7hN96OQ6efOMwcgXcezKrYP5FdT9SXm44a/jEgs0E5gW
	R3816U+rSB1nJrJYxIDMl8ywSZ58XDBWIhRZ9IgvJGEA4LbrqAZLwXW1Qqv2gUg+D/5cVKPHoSs
	z+CbLZnaBWaml4XHA6d+IZFgmnW0/0ikUV5D6BhLzXZ3gygaQf+U01ROghNUTgJNwqgsjuFO98R
	JSYLjJz7VSz0bwf5YHzWomgeTnczFgjrxIu3VxZDebNbQ0AhMDwUolsh1UUh1JxThE8oGRLRChJ
	R00sKb8dasAUzuUNkfzEzf8lDPwAGkkx+fdPbpSr5+KRZXBqO3ZiR4iAjpssvoV6wTXlehsSGyV
	ebhbiMKDfrbMa1T486RE2hZVZJ/731mTFPSSS8Q3WvtHIrOCLqBHNKv8QsifjZ4PPShtQ+X0EoE
	N0BLNax6NzEBii4TkwOG3ZJKOARiqsVHeryhXLgi9LpBibJF/ePLhQH3uelJjzKdmCrouWZrTzl
	3i03o3m9wglQazVQ8EeYnxqWk6u2OmWgnL3F+/IFKEIBYpcsa3+YgDj9/ZP7451Bht5Ce5jlOew
	adXQcMRWfzGDh3JKXAa5t
X-Received: by 2002:a05:6830:4421:b0:862:a0ce:f55d with SMTP id 46e09a7af769-862a0cefa5emr249700a34.21.1794599217866;
        Fri, 13 Nov 2026 11:46:57 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8629d280975sm811328a34.21.2026.11.13.11.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:46:57 -0800 (PST)
Message-ID: <9fd550c5-292b-4974-a667-9a6f33f2528a@gmail.com>
Date: Fri, 13 Nov 2026 13:46:56 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: mediatek: Don't power cycle domains on probe
 deferral
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 Matthias Brugger <mbrugger@suse.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261101-rbrue-suez-upstreaming-mtk-pmdomain-defer-v1-1-b4c41cf3935f@gmail.com>
 <CAPx+jO94U8b_PNJbbuzzFtF2HFeM7sYaT+oZoLJUfvThXkFYjA@mail.gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <CAPx+jO94U8b_PNJbbuzzFtF2HFeM7sYaT+oZoLJUfvThXkFYjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_114659_007613_550D6582 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 11:48 AM, Ulf Hansson wrote:
> This looks good to me. However, the patch no longer applies to my
> fixes branch, due to other related patches being queued.
>
> Please rebase and resubmit a new version.
>
> Kind regards
> Uffe

Hi Uffe,

I have a v2 already out at [1]. v2 should apply cleanly, but let me know 
if you'd like me to resend v2!

[1] 
https://lore.kernel.org/all/20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com/

Best Regards,
Ryan Brue

